@implementation VNDetectRectanglesRequest

- (int64_t)dependencyProcessingOrdinality
{
  id v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNDetectRectanglesRequest;
  v3 = -[VNRequest dependencyProcessingOrdinality](&v8, sel_dependencyProcessingOrdinality);
  v4 = -[VNDetectRectanglesRequest maximumObservations](self, "maximumObservations");
  v5 = 20;
  if (v4 < 0x14)
    v5 = v4;
  v6 = -100 * v5;
  if (!v4)
    v6 = -2000;
  return (int64_t)v3 + v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNRectangleDetectorType");
  return CFSTR("VNRectangleDetectorType");
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  BOOL v21;
  NSUInteger v23;
  unint64_t v24;
  objc_super v25;

  v4 = a3;
  v5 = -[VNDetectRectanglesRequest requiredVersion](self, "requiredVersion");
  if (v5 != objc_msgSend(v4, "requiredVersion"))
    goto LABEL_7;
  -[VNDetectRectanglesRequest minimumAspectRatio](self, "minimumAspectRatio");
  v7 = v6;
  objc_msgSend(v4, "minimumAspectRatio");
  if (v7 < v8)
    goto LABEL_7;
  -[VNDetectRectanglesRequest maximumAspectRatio](self, "maximumAspectRatio");
  v10 = v9;
  objc_msgSend(v4, "maximumAspectRatio");
  if (v10 > v11)
    goto LABEL_7;
  -[VNDetectRectanglesRequest quadratureTolerance](self, "quadratureTolerance");
  v13 = v12;
  objc_msgSend(v4, "quadratureTolerance");
  if (v13 < v14)
    goto LABEL_7;
  -[VNDetectRectanglesRequest minimumSize](self, "minimumSize");
  v16 = v15;
  objc_msgSend(v4, "minimumSize");
  if (v16 < v17)
    goto LABEL_7;
  -[VNDetectRectanglesRequest minimumConfidence](self, "minimumConfidence");
  v19 = v18;
  objc_msgSend(v4, "minimumConfidence");
  if (v19 < v20)
    goto LABEL_7;
  v23 = -[VNDetectRectanglesRequest maximumObservations](self, "maximumObservations");
  v24 = objc_msgSend(v4, "maximumObservations");
  if (v23 && v24)
  {
    if (v23 <= v24)
    {
LABEL_15:
      v25.receiver = self;
      v25.super_class = (Class)VNDetectRectanglesRequest;
      v21 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v25, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
      goto LABEL_8;
    }
  }
  else if (v23 || !v24)
  {
    goto LABEL_15;
  }
LABEL_7:
  v21 = 0;
LABEL_8:

  return v21;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSUInteger v26;
  int v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v9, 0, 0, a5))
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v36, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v36;
    if (v11)
    {
      v37[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNDetectRectanglesRequest requiredVersion](self, "requiredVersion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("VNRectangleDetectorProcessOption_Version"));

      v15 = (void *)MEMORY[0x1E0CB37E8];
      -[VNDetectRectanglesRequest minimumConfidence](self, "minimumConfidence");
      objc_msgSend(v15, "numberWithFloat:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("VNRectangleDetectorProcessOption_MinimumConfidence"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRequest detectionLevel](self, "detectionLevel") != 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("VNRectangleDetectorProcessOption_HighAccuracy"));

      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[VNDetectRectanglesRequest minimumAspectRatio](self, "minimumAspectRatio");
      objc_msgSend(v18, "numberWithFloat:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("VNRectangleDetectorProcessOption_MinimumAspectRatio"));

      v20 = (void *)MEMORY[0x1E0CB37E8];
      -[VNDetectRectanglesRequest maximumAspectRatio](self, "maximumAspectRatio");
      objc_msgSend(v20, "numberWithFloat:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("VNRectangleDetectorProcessOption_MaximumAspectRatio"));

      v22 = (void *)MEMORY[0x1E0CB37E8];
      -[VNDetectRectanglesRequest quadratureTolerance](self, "quadratureTolerance");
      objc_msgSend(v22, "numberWithFloat:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("VNRectangleDetectorProcessOption_QuadratureTolerance"));

      v24 = (void *)MEMORY[0x1E0CB37E8];
      -[VNDetectRectanglesRequest minimumSize](self, "minimumSize");
      objc_msgSend(v24, "numberWithFloat:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("VNRectangleDetectorProcessOption_MinimumSize"));

      v26 = -[VNDetectRectanglesRequest maximumObservations](self, "maximumObservations");
      if (v26 - 0x7FFFFFFF <= 0xFFFFFFFF80000001)
      {
        v27 = objc_msgSend(v9, "width", v26);
        v28 = objc_msgSend(v9, "height");
        if (v27 <= v28)
          v29 = v28;
        else
          v29 = v27;
        if (v27 >= v28)
          v30 = v28;
        else
          v30 = v27;
        v26 = (int)(16 * vcvtps_s32_f32((float)((float)v29 * 256.0) / (float)v30));
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, CFSTR("VNRectangleDetectorProcessOption_MaximumNumber"));

      v32 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v32, v12, self, a5, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33 != 0;
      if (v33)
        -[VNRequest setResults:](self, "setResults:", v33);

    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (void)setProcessedResults:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v5 = -[VNDetectRectanglesRequest maximumObservations](self, "maximumObservations");
  if (v5 && objc_msgSend(v4, "count") > v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)VNDetectRectanglesRequest;
  -[VNRequest setProcessedResults:](&v8, sel_setProcessedResults_, v4);

}

- (VNAspectRatio)minimumAspectRatio
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumAspectRatio");
  v4 = v3;

  return v4;
}

- (void)setMinimumAspectRatio:(VNAspectRatio)minimumAspectRatio
{
  double v5;
  id v6;

  if (minimumAspectRatio >= 0.0 && minimumAspectRatio <= 1.0)
  {
    -[VNRequest configuration](self, "configuration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(VNAspectRatio *)&v5 = minimumAspectRatio;
    objc_msgSend(v6, "setMinimumAspectRatio:", v5);

  }
}

- (VNAspectRatio)maximumAspectRatio
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumAspectRatio");
  v4 = v3;

  return v4;
}

- (void)setMaximumAspectRatio:(VNAspectRatio)maximumAspectRatio
{
  double v5;
  id v6;

  if (maximumAspectRatio >= 0.0 && maximumAspectRatio <= 1.0)
  {
    -[VNRequest configuration](self, "configuration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(VNAspectRatio *)&v5 = maximumAspectRatio;
    objc_msgSend(v6, "setMaximumAspectRatio:", v5);

  }
}

- (VNDegrees)quadratureTolerance
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quadratureTolerance");
  v4 = v3;

  return v4;
}

- (void)setQuadratureTolerance:(VNDegrees)quadratureTolerance
{
  double v5;
  id v6;

  if (quadratureTolerance >= 0.0 && quadratureTolerance <= 45.0)
  {
    -[VNRequest configuration](self, "configuration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(VNDegrees *)&v5 = quadratureTolerance;
    objc_msgSend(v6, "setQuadratureTolerance:", v5);

  }
}

- (float)minimumSize
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumSize");
  v4 = v3;

  return v4;
}

- (void)setMinimumSize:(float)minimumSize
{
  double v5;
  id v6;

  if (minimumSize >= 0.0 && minimumSize <= 1.0)
  {
    -[VNRequest configuration](self, "configuration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v5 = minimumSize;
    objc_msgSend(v6, "setMinimumSize:", v5);

  }
}

- (VNConfidence)minimumConfidence
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumConfidence");
  v4 = v3;

  return v4;
}

- (void)setMinimumConfidence:(VNConfidence)minimumConfidence
{
  double v5;
  id v6;

  if (minimumConfidence >= 0.0 && minimumConfidence <= 1.0)
  {
    -[VNRequest configuration](self, "configuration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(VNConfidence *)&v5 = minimumConfidence;
    objc_msgSend(v6, "setMinimumConfidence:", v5);

  }
}

- (unint64_t)requiredVersion
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiredVersion");

  return v3;
}

- (void)setRequiredVersion:(unint64_t)a3
{
  id v4;

  if (a3 - 1 <= 1)
  {
    -[VNRequest configuration](self, "configuration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRequiredVersion:", a3);

  }
}

- (NSUInteger)maximumObservations
{
  void *v2;
  NSUInteger v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumObservations");

  return v3;
}

- (void)setMaximumObservations:(NSUInteger)maximumObservations
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumObservations:", maximumObservations);

}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectRectanglesRequest *v4;
  objc_super v5;

  v4 = (VNDetectRectanglesRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNDetectRectanglesRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNDetectRectanglesRequest setRequiredVersion:](self, "setRequiredVersion:", -[VNDetectRectanglesRequest requiredVersion](v4, "requiredVersion"));
      -[VNDetectRectanglesRequest minimumAspectRatio](v4, "minimumAspectRatio");
      -[VNDetectRectanglesRequest setMinimumAspectRatio:](self, "setMinimumAspectRatio:");
      -[VNDetectRectanglesRequest maximumAspectRatio](v4, "maximumAspectRatio");
      -[VNDetectRectanglesRequest setMaximumAspectRatio:](self, "setMaximumAspectRatio:");
      -[VNDetectRectanglesRequest quadratureTolerance](v4, "quadratureTolerance");
      -[VNDetectRectanglesRequest setQuadratureTolerance:](self, "setQuadratureTolerance:");
      -[VNDetectRectanglesRequest minimumSize](v4, "minimumSize");
      -[VNDetectRectanglesRequest setMinimumSize:](self, "setMinimumSize:");
      -[VNDetectRectanglesRequest minimumConfidence](v4, "minimumConfidence");
      -[VNDetectRectanglesRequest setMinimumConfidence:](self, "setMinimumConfidence:");
      -[VNDetectRectanglesRequest setMaximumObservations:](self, "setMaximumObservations:", -[VNDetectRectanglesRequest maximumObservations](v4, "maximumObservations"));
    }
  }

}

- (id)supportedImageSizeSet
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[VNRequest newDefaultDetectorOptionsForSession:](self, "newDefaultDetectorOptionsForSession:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNDetectRectanglesRequest requiredVersion](self, "requiredVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("VNRectangleDetectorProcessOption_Version"));

  +[VNRectangleDetector supportedImageSizeSetForOptions:error:](VNRectangleDetector, "supportedImageSizeSetForOptions:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v5;

  return v7;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
