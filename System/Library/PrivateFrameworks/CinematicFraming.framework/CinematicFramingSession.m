@implementation CinematicFramingSession

- (CinematicFramingSession)init
{
  CinematicFramingSession *v2;
  void *v3;
  void *v4;
  void *v5;
  CinematicFramingSessionOptions *v6;
  CinematicFramingSessionOptions *options;
  CinematicFramingSession *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CinematicFramingSession;
  v2 = -[CinematicFramingSession init](&v10, sel_init);
  if (!v2)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CinematicFraming"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v4 = v3;
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("cinematicFramingParameters"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CinematicFramingSessionOptions initWithPlistPath:]([CinematicFramingSessionOptions alloc], "initWithPlistPath:", v5);
  options = v2->_options;
  v2->_options = v6;

  if (!v2->_options)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_7;
  }
  v8 = v2;

LABEL_8:
  return v8;
}

- (CinematicFramingSession)initWithOutputDimensions:(id)a3 mode:(int)a4 portType:(id)a5 deviceModelName:(id)a6
{
  id v8;
  CinematicFramingSession *v9;
  uint64_t v10;

  v8 = a5;
  v9 = -[CinematicFramingSession initWithOutputDimensions:](self, "initWithOutputDimensions:", a3);
  v10 = isCinematicFramingFrontCamera(v8);

  -[CinematicFramingRenderer setIsFrontCamera:](v9->_renderer, "setIsFrontCamera:", v10);
  return v9;
}

- (CinematicFramingSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceModelName:(id)a5
{
  id v7;
  CinematicFramingSession *v8;
  uint64_t v9;

  v7 = a4;
  v8 = -[CinematicFramingSession initWithOutputDimensions:](self, "initWithOutputDimensions:", a3);
  v9 = isCinematicFramingFrontCamera(v7);

  -[CinematicFramingRenderer setIsFrontCamera:](v8->_renderer, "setIsFrontCamera:", v9);
  return v8;
}

- (CinematicFramingSession)initWithOutputDimensions:(id)a3
{
  int var0;
  CinematicFramingSession *v4;
  CinematicFramingSession *v5;
  int var1;
  CinematicFramingSession *v7;
  CinematicFramingRenderer *v8;
  CinematicFramingRenderer *renderer;
  CinematicFramingDirector *v10;
  CinematicFramingDirector *director;

  var0 = a3.var0;
  v4 = self;
  v5 = 0;
  if (a3.var0)
  {
    var1 = a3.var1;
    if (a3.var1)
    {
      v7 = -[CinematicFramingSession init](self, "init");
      v4 = v7;
      if (v7)
      {
        v7->_outputDimensions.width = var0;
        v7->_outputDimensions.height = var1;
        v8 = -[CinematicFramingRenderer initWithOutputDimensions:]([CinematicFramingRenderer alloc], "initWithOutputDimensions:", *(_QWORD *)&v7->_outputDimensions);
        renderer = v4->_renderer;
        v4->_renderer = v8;

        if (v4->_renderer)
        {
          v10 = -[CinematicFramingDirector initWithFramingSpaceManager:]([CinematicFramingDirector alloc], "initWithFramingSpaceManager:", v4->_renderer);
          director = v4->_director;
          v4->_director = v10;

          if (v4->_director)
          {
            -[CinematicFramingSession setFramingStyle:](v4, "setFramingStyle:", 0);
            v4->_calibrationDataRegistered = 0;
            v4 = v4;
            v5 = v4;
            goto LABEL_9;
          }
        }
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      v5 = 0;
    }
  }
LABEL_9:

  return v5;
}

- (NSArray)roiHeatMapCounts
{
  id v3;
  uint64_t v4;
  unsigned int *roiHeatMap;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = 0;
  roiHeatMap = self->_roiHeatMap;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", roiHeatMap[v4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    ++v4;
  }
  while (v4 != 64);
  return (NSArray *)v3;
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setFramingStyle:(int)a3
{
  void *v4;
  void *v5;

  if (a3 <= 4)
  {
    self->_framingStyle = a3;
    -[CinematicFramingSessionOptions optionsForFramingStyle:](self->_options, "optionsForFramingStyle:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CinematicFramingRenderer setOptions:](self->_renderer, "setOptions:", v4);

    -[CinematicFramingSessionOptions optionsForFramingStyle:](self->_options, "optionsForFramingStyle:", self->_framingStyle);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CinematicFramingDirector setOptions:](self->_director, "setOptions:", v5);

    -[CinematicFramingDirector setFramingStyle:](self->_director, "setFramingStyle:", self->_framingStyle);
  }
}

- (CGRect)currentViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CinematicFramingDirector currentViewport](self->_director, "currentViewport");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)targetViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CinematicFramingDirector targetViewport](self->_director, "targetViewport");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)idealViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CinematicFramingDirector idealViewport](self->_director, "idealViewport");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int)cameraOrientation
{
  return -[CinematicFramingRenderer cameraOrientation](self->_renderer, "cameraOrientation");
}

- (void)setCameraOrientation:(int)a3
{
  uint64_t v3;
  CinematicFramingRenderer *renderer;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = *(_QWORD *)&a3;
  if (-[CinematicFramingRenderer cameraOrientation](self->_renderer, "cameraOrientation") != a3)
  {
    renderer = self->_renderer;
    -[CinematicFramingDirector currentViewport](self->_director, "currentViewport");
    -[CinematicFramingRenderer computeNewCoordinatesInOrientation:forViewportInCurrentOrientation:](renderer, "computeNewCoordinatesInOrientation:forViewportInCurrentOrientation:", v3);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CinematicFramingRenderer setCameraOrientation:](self->_renderer, "setCameraOrientation:", v3);
    -[CinematicFramingDirector resetCameraViewport:](self->_director, "resetCameraViewport:", v7, v9, v11, v13);
  }
}

- (BOOL)cameraOrientationCorrectionEnabled
{
  return -[CinematicFramingRenderer cameraOrientationCorrectionEnabled](self->_renderer, "cameraOrientationCorrectionEnabled");
}

- (void)setCameraOrientationCorrectionEnabled:(BOOL)a3
{
  -[CinematicFramingRenderer setCameraOrientationCorrectionEnabled:](self->_renderer, "setCameraOrientationCorrectionEnabled:", a3);
}

- (CGRect)processWithMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CinematicFramingRenderer *renderer;
  void *v8;
  int v9;
  CinematicFramingRenderer *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  CinematicFramingRenderer *v19;
  uint64_t v20;
  uint64_t v21;
  CinematicFramingRenderer *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "portType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((isCinematicFramingAllowedCamera(v5) & 1) == 0)
    {
      v32 = *MEMORY[0x1E0C9D628];
      v34 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v36 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v38 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      goto LABEL_12;
    }
    -[CinematicFramingRenderer setIsFrontCamera:](self->_renderer, "setIsFrontCamera:", isCinematicFramingFrontCamera(v6));
  }
  -[CinematicFramingRenderer setFrontCameraHas180DegreesRotation:](self->_renderer, "setFrontCameraHas180DegreesRotation:", objc_msgSend(v4, "frontCameraHas180DegreesRotation"));
  renderer = self->_renderer;
  objc_msgSend(v4, "calibrationDataDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CinematicFramingRenderer registerCalibrationData:](renderer, "registerCalibrationData:", v8);

  if (!self->_calibrationDataRegistered && !v9)
  {
    self->_calibrationDataRegistered = 1;
    -[CinematicFramingDirector reset](self->_director, "reset");
  }
  v10 = self->_renderer;
  objc_msgSend(v4, "gravityX");
  v12 = v11;
  objc_msgSend(v4, "gravityY");
  v14 = v13;
  objc_msgSend(v4, "gravityZ");
  LODWORD(v16) = v15;
  LODWORD(v17) = v12;
  LODWORD(v18) = v14;
  -[CinematicFramingRenderer registerGravityX:y:z:](v10, "registerGravityX:y:z:", v17, v18, v16);
  v19 = self->_renderer;
  objc_msgSend(v4, "additionalCameraRotation");
  -[CinematicFramingRenderer registerAdditionalCameraRotation:](v19, "registerAdditionalCameraRotation:");
  -[CinematicFramingRenderer warpMetadataInInputImageCoordinatesToFramingSpace:](self->_renderer, "warpMetadataInInputImageCoordinatesToFramingSpace:", v4);
  v20 = objc_msgSend(v4, "cameraOrientation");
  if ((_DWORD)v20 != -1)
  {
    v21 = v20;
    if ((_DWORD)v20 != -[CinematicFramingRenderer cameraOrientation](self->_renderer, "cameraOrientation"))
    {
      v22 = self->_renderer;
      -[CinematicFramingDirector currentViewport](self->_director, "currentViewport");
      -[CinematicFramingRenderer computeNewCoordinatesInOrientation:forViewportInCurrentOrientation:](v22, "computeNewCoordinatesInOrientation:forViewportInCurrentOrientation:", v21);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      -[CinematicFramingRenderer setCameraOrientation:](self->_renderer, "setCameraOrientation:", v21);
      -[CinematicFramingDirector resetCameraViewport:](self->_director, "resetCameraViewport:", v24, v26, v28, v30);
    }
  }
  -[CinematicFramingDirector updateWithMetadata:](self->_director, "updateWithMetadata:", v4);
  -[CinematicFramingDirector currentViewport](self->_director, "currentViewport");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
LABEL_12:

  v39 = v32;
  v40 = v34;
  v41 = v36;
  v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (int)processPixelBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;

  -[CinematicFramingSession currentViewport](self, "currentViewport");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[CinematicFramingRenderer processBuffer:cropRect:outputPixelBuffer:](self->_renderer, "processBuffer:cropRect:outputPixelBuffer:", a3, a4);
  if (v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    -[CinematicFramingSession _updateROIHeatMapCountersWithCropRect:](self, "_updateROIHeatMapCountersWithCropRect:", v8, v10, v12, v14);
  }
  return v15;
}

- (CGRect)warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CinematicFramingRenderer *renderer;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  -[CinematicFramingRenderer warpRectInInputImageCoordinatesToFramingSpace:](self->_renderer, "warpRectInInputImageCoordinatesToFramingSpace:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  renderer = self->_renderer;
  -[CinematicFramingSession currentViewport](self, "currentViewport");
  -[CinematicFramingRenderer projectRectInFramingSpace:toDisplayRectInFramingSpace:](renderer, "projectRectInFramingSpace:toDisplayRectInFramingSpace:", v5, v7, v9, v11, v13, v14, v15, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  if (-[CinematicFramingRenderer cameraOrientationCorrectionEnabled](self->_renderer, "cameraOrientationCorrectionEnabled"))
  {
    v18 = rotateRectInImageCCW(4- -[CinematicFramingRenderer numCCWRotationsFromInputToFramingSpace](self->_renderer, "numCCWRotationsFromInputToFramingSpace"), v18, v20, v22, v24);
    v20 = v25;
    v22 = v26;
    v24 = v27;
  }
  -[CinematicFramingRenderer outputROI](self->_renderer, "outputROI");
  v30 = v28 + v18 * v29;
  v33 = v31 + v20 * v32;
  v34 = v22 * v29;
  v35 = v24 * v32;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v30;
  return result;
}

- (void)reset
{
  self->_calibrationDataRegistered = 0;
  -[CinematicFramingDirector reset](self->_director, "reset");
}

- (float)zoomLevel
{
  float result;

  -[CinematicFramingDirector zoomLevel](self->_director, "zoomLevel");
  return result;
}

- (void)setZoomLevel:(float)a3
{
  -[CinematicFramingDirector setZoomLevel:](self->_director, "setZoomLevel:");
}

- (float)fovLimit
{
  float result;

  -[CinematicFramingRenderer fovLimit](self->_renderer, "fovLimit");
  return result;
}

- (void)setFovLimit:(float)a3
{
  -[CinematicFramingRenderer setFovLimit:](self->_renderer, "setFovLimit:");
}

- (CGRect)outputFramingRectOfInterest
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CinematicFramingRenderer outputROI](self->_renderer, "outputROI");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setOutputFramingRectOfInterest:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0;
  v10.size.height = 1.0;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectContainsRect(v10, v12);
  if (height > 0.0001 && width > 0.0001 && v8)
  {
    -[CinematicFramingRenderer outputROI](self->_renderer, "outputROI");
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    if (!CGRectEqualToRect(v11, v13))
    {
      -[CinematicFramingRenderer setOutputROI:](self->_renderer, "setOutputROI:", x, y, width, height);
      -[CinematicFramingDirector reset](self->_director, "reset");
    }
  }
}

- (void)_updateROIHeatMapCountersWithCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  signed int v20;
  signed int v21;
  signed int v22;
  signed int v23;
  int v24;
  int v25;
  int v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CinematicFramingRenderer framingSpaceBounds](self->_renderer, "framingSpaceBounds");
  v9 = x - v8;
  -[CinematicFramingRenderer framingSpaceBounds](self->_renderer, "framingSpaceBounds");
  v11 = v9 / v10;
  -[CinematicFramingRenderer framingSpaceBounds](self->_renderer, "framingSpaceBounds");
  v13 = y - v12;
  -[CinematicFramingRenderer framingSpaceBounds](self->_renderer, "framingSpaceBounds");
  v15 = v13 / v14;
  -[CinematicFramingRenderer framingSpaceBounds](self->_renderer, "framingSpaceBounds");
  v17 = width / v16;
  -[CinematicFramingRenderer framingSpaceBounds](self->_renderer, "framingSpaceBounds");
  v19 = height / v18;
  v28.origin.x = v11;
  v28.origin.y = v15;
  v28.size.width = v17;
  v28.size.height = v19;
  if (floor(CGRectGetMinX(v28) * 8.0) >= 0.0)
  {
    v29.origin.x = v11;
    v29.origin.y = v15;
    v29.size.width = v17;
    v29.size.height = v19;
    v20 = vcvtmd_s64_f64(CGRectGetMinX(v29) * 8.0);
  }
  else
  {
    v20 = 0;
  }
  v30.origin.x = v11;
  v30.origin.y = v15;
  v30.size.width = v17;
  v30.size.height = v19;
  if (floor(CGRectGetMinY(v30) * 8.0) >= 0.0)
  {
    v31.origin.x = v11;
    v31.origin.y = v15;
    v31.size.width = v17;
    v31.size.height = v19;
    v21 = vcvtmd_s64_f64(CGRectGetMinY(v31) * 8.0);
  }
  else
  {
    v21 = 0;
  }
  v32.origin.x = v11;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v19;
  if (ceil(CGRectGetMaxX(v32) * 7.0) >= 7.0)
  {
    v22 = 7;
  }
  else
  {
    v33.origin.x = v11;
    v33.origin.y = v15;
    v33.size.width = v17;
    v33.size.height = v19;
    v22 = vcvtpd_s64_f64(CGRectGetMaxX(v33) * 7.0);
  }
  v34.origin.x = v11;
  v34.origin.y = v15;
  v34.size.width = v17;
  v34.size.height = v19;
  if (ceil(CGRectGetMaxY(v34) * 7.0) >= 7.0)
  {
    v23 = 7;
  }
  else
  {
    v35.origin.x = v11;
    v35.origin.y = v15;
    v35.size.width = v17;
    v35.size.height = v19;
    v23 = vcvtpd_s64_f64(CGRectGetMaxY(v35) * 7.0);
  }
  if (v20 <= v22)
  {
    v24 = v21 + 8 * v20;
    do
    {
      v25 = v24;
      v26 = v23 - v21 + 1;
      if (v21 <= v23)
      {
        do
        {
          ++self->_roiHeatMap[v25++];
          --v26;
        }
        while (v26);
      }
      v24 += 8;
    }
    while (v20++ != v22);
  }
}

- (int)framingStyle
{
  return self->_framingStyle;
}

- (CGRect)displayViewport
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_displayViewport.origin.x;
  y = self->_displayViewport.origin.y;
  width = self->_displayViewport.size.width;
  height = self->_displayViewport.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_director, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dataOutputDelegateQueue, 0);
}

@end
