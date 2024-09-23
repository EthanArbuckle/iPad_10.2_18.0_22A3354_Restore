@implementation AXMRectangleDetectorNode

- (void)nodeInitialize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMRectangleDetectorNode;
  -[AXMEvaluationNode nodeInitialize](&v3, sel_nodeInitialize);
  -[AXMRectangleDetectorNode setCameraPixelFocalLength:](self, "setCameraPixelFocalLength:", 0.0);
  -[AXMRectangleDetectorNode setCameraOpticalOrigin:](self, "setCameraOpticalOrigin:", 0.0, 0.0);
  -[AXMRectangleDetectorNode setMinimumAspectRatio:](self, "setMinimumAspectRatio:", 0.5);
  -[AXMRectangleDetectorNode setMaximumAspectRatio:](self, "setMaximumAspectRatio:", 0.5);
  -[AXMRectangleDetectorNode setQuadratureTolerance:](self, "setQuadratureTolerance:", 15.0);
  -[AXMRectangleDetectorNode setMinimumSize:](self, "setMinimumSize:", 0.2);
  -[AXMEvaluationNode setMinimumConfidence:](self, "setMinimumConfidence:", 0.5);
  -[AXMRectangleDetectorNode setMaximumNumberOfRects:](self, "setMaximumNumberOfRects:", 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMRectangleDetectorNode)initWithCoder:(id)a3
{
  id v4;
  AXMRectangleDetectorNode *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMRectangleDetectorNode;
  v5 = -[AXMEvaluationNode initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cameraPixelFocalLength"));
    -[AXMRectangleDetectorNode setCameraPixelFocalLength:](v5, "setCameraPixelFocalLength:");
    objc_msgSend(v4, "axmDecodePointForKey:", CFSTR("cameraOpticalOrigin"));
    -[AXMRectangleDetectorNode setCameraOpticalOrigin:](v5, "setCameraOpticalOrigin:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumAspectRatio"));
    -[AXMRectangleDetectorNode setMinimumAspectRatio:](v5, "setMinimumAspectRatio:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumAspectRatio"));
    -[AXMRectangleDetectorNode setMaximumAspectRatio:](v5, "setMaximumAspectRatio:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("quadratureTolerance"));
    -[AXMRectangleDetectorNode setQuadratureTolerance:](v5, "setQuadratureTolerance:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumSize"));
    -[AXMRectangleDetectorNode setMinimumSize:](v5, "setMinimumSize:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumConfidence"));
    -[AXMEvaluationNode setMinimumConfidence:](v5, "setMinimumConfidence:");
    -[AXMRectangleDetectorNode setMaximumNumberOfRects:](v5, "setMaximumNumberOfRects:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumNumber")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXMRectangleDetectorNode;
  v4 = a3;
  -[AXMEvaluationNode encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[AXMRectangleDetectorNode cameraPixelFocalLength](self, "cameraPixelFocalLength", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("cameraPixelFocalLength"));
  -[AXMRectangleDetectorNode cameraOpticalOrigin](self, "cameraOpticalOrigin");
  objc_msgSend(v4, "axmEncodePoint:forKey:", CFSTR("cameraOpticalOrigin"));
  -[AXMRectangleDetectorNode minimumAspectRatio](self, "minimumAspectRatio");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minimumAspectRatio"));
  -[AXMRectangleDetectorNode maximumAspectRatio](self, "maximumAspectRatio");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maximumAspectRatio"));
  -[AXMRectangleDetectorNode quadratureTolerance](self, "quadratureTolerance");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("quadratureTolerance"));
  -[AXMRectangleDetectorNode minimumSize](self, "minimumSize");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minimumSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMRectangleDetectorNode maximumNumberOfRects](self, "maximumNumberOfRects"), CFSTR("maximumNumber"));

}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return CFSTR("Rectangle Detector");
}

- (void)setCameraPixelFocalLength:(double)a3
{
  self->_cameraPixelFocalLength = fmin(fmax(a3, 0.0), 1.79769313e308);
}

- (void)setMinimumAspectRatio:(double)a3
{
  self->_minimumAspectRatio = fmin(fmax(a3, 0.0), 1.0);
}

- (void)setMaximumAspectRatio:(double)a3
{
  self->_maximumAspectRatio = fmin(fmax(a3, 0.0), 1.0);
}

- (void)setQuadratureTolerance:(double)a3
{
  self->_quadratureTolerance = fmin(fmax(a3, 0.0), 15.0);
}

- (void)setMinimumSize:(double)a3
{
  self->_minimumSize = fmin(fmax(a3, 0.2), 1.0);
}

- (void)setMaximumNumberOfRects:(int64_t)a3
{
  int64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_maximumNumberOfRects = v3;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVNDetectRectanglesRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMRectangleDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMRectangleDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v4);

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  __int128 v16;
  unsigned int v17;
  float v18;
  __int128 v19;
  double v20;
  unsigned int v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *context;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[3];
  objc_super v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[128];
  id v53;
  void *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)AXMRectangleDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v47, sel_evaluate_metrics_, v6, v7);
  context = (void *)MEMORY[0x1B5E128FC](v8);
  -[AXMRectangleDetectorNode cameraPixelFocalLength](self, "cameraPixelFocalLength");
  v10 = v9;
  -[AXMRectangleDetectorNode cameraOpticalOrigin](self, "cameraOpticalOrigin");
  v12 = v11;
  -[AXMRectangleDetectorNode cameraPixelFocalLength](self, "cameraPixelFocalLength");
  v14 = v13;
  -[AXMRectangleDetectorNode cameraOpticalOrigin](self, "cameraOpticalOrigin");
  *(float *)&v15 = v10;
  *(_QWORD *)&v16 = v15;
  *(float *)&v17 = v12;
  *((_QWORD *)&v16 + 1) = v17;
  v18 = v14;
  LODWORD(v19) = 0;
  *((float *)&v19 + 1) = v18;
  *(float *)&v21 = v20;
  *((_QWORD *)&v19 + 1) = v21;
  v46[0] = v16;
  v46[1] = v19;
  v46[2] = xmmword_1B0EFF860;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v46, 48);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init((Class)getVNDetectRectanglesRequestClass());
  -[AXMRectangleDetectorNode minimumAspectRatio](self, "minimumAspectRatio");
  *(float *)&v23 = v23;
  objc_msgSend(v22, "setMinimumAspectRatio:", v23);
  -[AXMRectangleDetectorNode maximumAspectRatio](self, "maximumAspectRatio");
  *(float *)&v24 = v24;
  objc_msgSend(v22, "setMaximumAspectRatio:", v24);
  -[AXMRectangleDetectorNode quadratureTolerance](self, "quadratureTolerance");
  *(float *)&v25 = v25;
  objc_msgSend(v22, "setQuadratureTolerance:", v25);
  -[AXMRectangleDetectorNode minimumSize](self, "minimumSize");
  *(float *)&v26 = v26;
  objc_msgSend(v22, "setMinimumSize:", v26);
  -[AXMEvaluationNode minimumConfidence](self, "minimumConfidence");
  *(float *)&v27 = v27;
  objc_msgSend(v22, "setMinimumConfidence:", v27);
  objc_msgSend(v22, "setMaximumObservations:", -[AXMRectangleDetectorNode maximumNumberOfRects](self, "maximumNumberOfRects"));
  v55[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v29 = (id *)getVNImageOptionCameraIntrinsicsSymbolLoc_ptr;
  v51 = getVNImageOptionCameraIntrinsicsSymbolLoc_ptr;
  if (!getVNImageOptionCameraIntrinsicsSymbolLoc_ptr)
  {
    v30 = (void *)VisionLibrary_4();
    v29 = (id *)dlsym(v30, "VNImageOptionCameraIntrinsics");
    v49[3] = (uint64_t)v29;
    getVNImageOptionCameraIntrinsicsSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v48, 8);
  if (!v29)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v53 = *v29;
  v54 = v41;
  v31 = (void *)MEMORY[0x1E0C99D80];
  v32 = v53;
  objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v28, v6, v33, v7, 0);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v22, "results");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v43 != v36)
          objc_enumerationMutation(v34);
        v38 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v6, "size");
        +[AXMVisionFeature featureWithVisionRequest:rectangleResult:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:rectangleResult:canvasSize:", v22, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFeature:", v39);

      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v35);
  }

  objc_autoreleasePoolPop(context);
}

- (double)cameraPixelFocalLength
{
  return self->_cameraPixelFocalLength;
}

- (CGPoint)cameraOpticalOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_cameraOpticalOrigin.x;
  y = self->_cameraOpticalOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCameraOpticalOrigin:(CGPoint)a3
{
  self->_cameraOpticalOrigin = a3;
}

- (double)minimumAspectRatio
{
  return self->_minimumAspectRatio;
}

- (double)maximumAspectRatio
{
  return self->_maximumAspectRatio;
}

- (double)quadratureTolerance
{
  return self->_quadratureTolerance;
}

- (double)minimumSize
{
  return self->_minimumSize;
}

- (int64_t)maximumNumberOfRects
{
  return self->_maximumNumberOfRects;
}

- (void)validateVisionKitSoftLinkSymbols
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNDetectRectanglesRequestSoft was nil", v1, 2u);
}

@end
