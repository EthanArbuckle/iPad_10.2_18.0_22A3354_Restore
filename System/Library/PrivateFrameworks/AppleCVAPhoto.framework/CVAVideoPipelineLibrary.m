@implementation CVAVideoPipelineLibrary

+ (id)videoPipelinePropertiesForDevice:(unint64_t)a3
{
  return -[CVAVideoPipelineProperties_Impl initForVideoPipelineDevice:]([CVAVideoPipelineProperties_Impl alloc], "initForVideoPipelineDevice:", a3);
}

+ (id)portraitVideoPipelineWithProperties:(id)a3 error:(id *)a4
{
  objc_msgSend(a1, "portraitVideoPipelineWithProperties:commandQueue:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)portraitVideoPipelineWithProperties:(id)a3 commandQueue:(id)a4 notificationQueue:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  CVAPortraitVideoPipeline_Impl *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a6)
    *a6 = 0;
  v12 = -[CVAPortraitVideoPipeline_Impl initWithProperties:commandQueue:notificationQueue:error:]([CVAPortraitVideoPipeline_Impl alloc], "initWithProperties:commandQueue:notificationQueue:error:", v9, v10, v11, a6);

  return v12;
}

+ (id)portraitVideoPipelineWithProperties:(id)a3 commandQueue:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "portraitVideoPipelineWithProperties:commandQueue:notificationQueue:error:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mattingVideoPipelineWithProperties:(id)a3 error:(id *)a4
{
  id v5;
  CVAPortraitVideoPipeline_Impl *v6;

  v5 = a3;
  if (a4)
    *a4 = 0;
  v6 = -[CVAPortraitVideoPipeline_Impl initWithProperties:error:]([CVAPortraitVideoPipeline_Impl alloc], "initWithProperties:error:", v5, a4);

  return v6;
}

+ (id)disparityPostprocessingVideoPipelineWithProperties:(id)a3 error:(id *)a4
{
  id v5;
  CVAPortraitVideoPipeline_Impl *v6;

  v5 = a3;
  if (a4)
    *a4 = 0;
  v6 = -[CVAPortraitVideoPipeline_Impl initWithProperties:error:]([CVAPortraitVideoPipeline_Impl alloc], "initWithProperties:error:", v5, a4);

  return v6;
}

+ (int)prewarm
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v2 = 0;
  v12 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    v3 = (void *)MEMORY[0x1B5E4E0C8](a1, a2);
    +[CVAVideoPipelineLibrary videoPipelinePropertiesForDevice:](CVAVideoPipelineLibrary, "videoPipelinePropertiesForDevice:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    +[CVAVideoPipelineLibrary portraitVideoPipelineWithProperties:commandQueue:error:](CVAVideoPipelineLibrary, "portraitVideoPipelineWithProperties:commandQueue:error:", v4, 0, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (!v5)
      break;

    objc_autoreleasePoolPop(v3);
    if (++v2 == 50)
      return 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_error_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v7 = objc_msgSend(v6, "code");

  objc_autoreleasePoolPop(v3);
  return v7;
}

+ (id)colorCubePortraitRequestForPortraitVideoPipeline:(id)a3 withWithSourceColorPixelBuffer:(__CVBuffer *)a4 destinationColorPixelBuffer:(__CVBuffer *)a5 cubeData:(id)a6
{
  id v7;
  void *v8;
  size_t v9;
  void *v10;
  size_t v11;
  void *v12;
  OSType v13;
  void *v14;
  size_t v15;
  void *v16;
  size_t v17;
  void *v18;
  OSType v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  CVADisparityPostprocessingRequest *v25;
  double v26;
  CVADisparityPostprocessingRequest *v27;
  CVAMattingRequest *v28;
  CVAMattingRequest *v29;
  CVAPortraitRequest_StageLight *v30;
  double v31;
  double v32;
  CVAPortraitRequest_StageLight *v33;
  OSType pixelFormatType;
  size_t v36;
  size_t v37;
  id v40;
  CVPixelBufferRef texture;
  CVPixelBufferRef v42;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v40 = a6;
  objc_msgSend(v7, "videoPipelineProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "inputDisparityPixelBufferWidth");

  objc_msgSend(v7, "videoPipelineProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "inputDisparityPixelBufferHeight");

  objc_msgSend(v7, "videoPipelineProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "inputDisparityPixelBufferPixelFormat");

  objc_msgSend(v7, "videoPipelineProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "outputDisparityPixelBufferWidth");

  objc_msgSend(v7, "videoPipelineProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "outputDisparityPixelBufferHeight");

  objc_msgSend(v7, "videoPipelineProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "outputDisparityPixelBufferPixelFormat");

  objc_msgSend(v7, "videoPipelineProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v20, "alphaMattePixelBufferWidth");

  objc_msgSend(v7, "videoPipelineProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v21, "alphaMattePixelBufferHeight");

  objc_msgSend(v7, "videoPipelineProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  pixelFormatType = objc_msgSend(v22, "alphaMattePixelBufferPixelFormat");

  v42 = 0;
  pixelBufferOut = 0;
  texture = 0;
  v48 = *MEMORY[0x1E0CA8FF0];
  v23 = v48;
  v24 = MEMORY[0x1E0C9AA70];
  v49[0] = MEMORY[0x1E0C9AA70];
  CVPixelBufferCreate(0, v9, v11, v13, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1), &pixelBufferOut);
  v46 = v23;
  v47 = v24;
  CVPixelBufferCreate(0, v15, v17, v19, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1), &v42);
  v44 = v23;
  v45 = v24;
  CVPixelBufferCreate(0, v37, v36, pixelFormatType, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1), &texture);
  v25 = [CVADisparityPostprocessingRequest alloc];
  LODWORD(v26) = 0;
  v27 = -[CVADisparityPostprocessingRequest initWithSourceColorPixelBuffer:fixedPointDisparityPixelBuffer:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:disparityNormalizationMultiplier:disparityNormalizationOffset:](v25, "initWithSourceColorPixelBuffer:fixedPointDisparityPixelBuffer:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:disparityNormalizationMultiplier:disparityNormalizationOffset:", a4, pixelBufferOut, v42, 0, 0, 0, v26, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0,
          0,
          0,
          0,
          0);
  v28 = [CVAMattingRequest alloc];
  v29 = -[CVAMattingRequest initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:](v28, "initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:", v27, 0, 0, texture, 0, 0.0, 0.0, 0.0, 0.0);
  v30 = [CVAPortraitRequest_StageLight alloc];
  LODWORD(v31) = 0;
  LODWORD(v32) = 0;
  v33 = -[CVAPortraitRequest_StageLight initWithMattingRequest:destinationColorPixelBuffer:proxyCubeData:cubeData:vignetteIntensity:stageLightIntensity:](v30, "initWithMattingRequest:destinationColorPixelBuffer:proxyCubeData:cubeData:vignetteIntensity:stageLightIntensity:", v29, a5, v40, v40, v31, v32);
  CVPixelBufferRelease(texture);
  CVPixelBufferRelease(v42);
  CVPixelBufferRelease(pixelBufferOut);

  return v33;
}

+ (id)stageLightPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6
{
  id v9;
  id v10;
  id v11;
  CVAPortraitRequest_StageLight *v12;
  double v13;
  double v14;
  CVAPortraitRequest_StageLight *v15;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = [CVAPortraitRequest_StageLight alloc];
  LODWORD(v13) = 2143289344;
  LODWORD(v14) = 2143289344;
  v15 = -[CVAPortraitRequest_StageLight initWithMattingRequest:destinationColorPixelBuffer:proxyCubeData:cubeData:vignetteIntensity:stageLightIntensity:](v12, "initWithMattingRequest:destinationColorPixelBuffer:proxyCubeData:cubeData:vignetteIntensity:stageLightIntensity:", v9, a4, v10, v11, v13, v14);

  return v15;
}

+ (id)stageLightPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6 vignetteIntensity:(float)a7 stageLightIntensity:(float)a8
{
  id v15;
  id v16;
  id v17;
  CVAPortraitRequest_StageLight *v19;
  double v20;
  double v21;
  CVAPortraitRequest_StageLight *v22;
  void *v24;
  void *v25;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (a7 < 0.0 || a7 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CVAVideoPipelineLibrary.mm"), 197, CFSTR("vignetteIntensity not in [0,1]: %f"), a7);

    if (a8 < 0.0)
      goto LABEL_9;
  }
  else if (a8 < 0.0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CVAVideoPipelineLibrary.mm"), 200, CFSTR("stageLightIntensity not in [0,1]: %f"), a8);

    goto LABEL_7;
  }
  if (a8 > 1.0)
    goto LABEL_9;
LABEL_7:
  v19 = [CVAPortraitRequest_StageLight alloc];
  *(float *)&v20 = a7;
  *(float *)&v21 = a8;
  v22 = -[CVAPortraitRequest_StageLight initWithMattingRequest:destinationColorPixelBuffer:proxyCubeData:cubeData:vignetteIntensity:stageLightIntensity:](v19, "initWithMattingRequest:destinationColorPixelBuffer:proxyCubeData:cubeData:vignetteIntensity:stageLightIntensity:", v15, a4, v16, v17, v20, v21);

  return v22;
}

+ (id)syntheticDepthOfFieldPortraitRequestWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 backgroundColorCube:(id)a5 foregroundColorCube:(id)a6 colorCubeIntensity:(float)a7 simulatedFocalRatio:(float)a8 sourceColorGain:(float)a9 sourceColorLux:(float)a10
{
  id v17;
  id v18;
  id v19;
  CVAPortraitRequest *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CVAPortraitRequest *v25;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = [CVAPortraitRequest alloc];
  *(float *)&v21 = a7;
  *(float *)&v22 = a8;
  *(float *)&v23 = a9;
  *(float *)&v24 = a10;
  v25 = -[CVAPortraitRequest initWithMattingRequest:destinationColorPixelBuffer:backgroundColorCube:foregroundColorCube:colorCubeIntensity:simulatedFocalRatio:sourceColorGain:sourceColorLux:](v20, "initWithMattingRequest:destinationColorPixelBuffer:backgroundColorCube:foregroundColorCube:colorCubeIntensity:simulatedFocalRatio:sourceColorGain:sourceColorLux:", v17, a4, v18, v19, v21, v22, v23, v24);

  return v25;
}

+ (id)sourceImageRequest:(__CVBuffer *)a3 error:(id *)a4
{
  void *v5;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSourceColorPixelBuffer:", a3);
  return v5;
}

+ (id)opaqueBackgroundRequestWithMattingRequest:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setMattingRequest:", v4);

  return v5;
}

+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 error:(id *)a8
{
  objc_msgSend(a1, "syntheticDepthOfFieldBackgroundRequestWithMattingRequest:simulatedFocalRatio:sourceColorGain:sourceColorLux:metadata:primaryCaptureRect:error:", a3, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 renderingRect:(CGRect)a8 error:(id *)a9
{
  objc_msgSend(a1, "syntheticDepthOfFieldBackgroundRequestWithMattingRequest:simulatedFocalRatio:sourceColorGain:sourceColorLux:metadata:primaryCaptureRect:error:", a3, a7, a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)syntheticDepthOfFieldBackgroundRequestWithMattingRequest:(id)a3 simulatedFocalRatio:(float)a4 sourceColorGain:(float)a5 sourceColorLux:(float)a6 metadata:(id)a7 primaryCaptureRect:(CGRect)a8 error:(id *)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v17 = a3;
  v18 = a7;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setMattingRequest:", v17);
  *(float *)&v20 = a4;
  objc_msgSend(v19, "setSimulatedFocalRatio:", v20);
  *(float *)&v21 = a5;
  objc_msgSend(v19, "setSourceColorGain:", v21);
  *(float *)&v22 = a6;
  objc_msgSend(v19, "setSourceColorLux:", v22);
  objc_msgSend(v19, "setSbufMetadata:", v18);
  objc_msgSend(v19, "setPrimaryCaptureRect:", x, y, width, height);

  return v19;
}

+ (id)studioLightRequestWithFace:(id)a3 relightStyleStrength:(float)a4 error:(id *)a5
{
  id v6;
  void *v7;
  double v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setFaceKitProcessOutput:", v6);
  *(float *)&v8 = a4;
  objc_msgSend(v7, "setPortraitStyleStrength:", v8);

  return v7;
}

+ (id)contourLightRequestWithFace:(id)a3 relightStyleStrength:(float)a4 error:(id *)a5
{
  id v6;
  void *v7;
  double v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setFaceKitProcessOutput:", v6);
  *(float *)&v8 = a4;
  objc_msgSend(v7, "setPortraitStyleStrength:", v8);

  return v7;
}

+ (id)studioLightRequestWithFace:(id)a3 error:(id *)a4
{
  double v4;

  LODWORD(v4) = 2143289344;
  +[CVAVideoPipelineLibrary studioLightRequestWithFace:relightStyleStrength:error:](CVAVideoPipelineLibrary, "studioLightRequestWithFace:relightStyleStrength:error:", a3, a4, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)contourLightRequestWithFace:(id)a3 error:(id *)a4
{
  double v4;

  LODWORD(v4) = 2143289344;
  +[CVAVideoPipelineLibrary contourLightRequestWithFace:relightStyleStrength:error:](CVAVideoPipelineLibrary, "contourLightRequestWithFace:relightStyleStrength:error:", a3, a4, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorCubeRequestWithBackgroundCube:(id)a3 foregroundCube:(id)a4 error:(id *)a5
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: both backgroundColorCube and foregroundColorCube are nil!"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary colorCubeRequestWithBackgroundCube:foregroundCube:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 349, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40((v7 | v8) == 0, a5, 0, 4294944393, v11);

  if (v7 | v8)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setBackgroundColorCube:", v7);
    objc_msgSend(v12, "setForegroundColorCube:", v8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)colorCubeRequest:(id)a3 isMono:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: colorCube should not be nil!"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary colorCubeRequest:isMono:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 364, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v7 == 0, a5, 0, 4294944393, v10);

  if (v7)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setSingleColorCube:", v7);
    objc_msgSend(v11, "setIsMono:", v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)portraitRequestWithBackground:(id)a3 light:(id)a4 post:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  int isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a6)
    *a6 = 0;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Background request shouldn't be nil."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 385, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v9 == 0, a6, 0, 4294944393, v14);

  if (!v9)
    goto LABEL_17;
  v15 = atomic_load((unsigned __int8 *)&qword_1EF12D3C0);
  if ((v15 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D3C0))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "BOOLForKey:", CFSTR("CVAPhotoEnforceNewAPI")) ^ 1;

    byte_1EF12D4A0 = v36;
    __cxa_guard_release(&qword_1EF12D3C0);
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). Only colorCube post-processing is supported."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 459, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B5658D40(1, a6, 0, 4294944393, v18);
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (!v11 && ((isKindOfClass ^ 1) & 1) == 0)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: STAGE LIGHT CUSTOM MONO requires colorCubeRequestWithBackgroundCube (mono color cube)."));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 514, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B5658D40(1, a6, 0, 4294944393, v18);
          goto LABEL_16;
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). For legacy Stage Light use legacy interface."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 492, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5658D40(1, a6, 0, 4294944393, v18);
        goto LABEL_16;
      }
    }
    v27 = byte_1EF12D4A0;
    if (!v11 || !byte_1EF12D4A0)
    {
LABEL_39:
      if (!v27)
      {
        objc_opt_class();
        if (!((v10 == 0) | objc_opt_isKindOfClass() & 1))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if (!v11
                || (objc_msgSend(v11, "singleColorCube"),
                    v31 = (void *)objc_claimAutoreleasedReturnValue(),
                    v31,
                    !v31))
              {
                v32 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). Need post as colorCubeRequest: (Single cube)."));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 582, v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1B5658D40(1, a6, 0, 4294944393, v18);
                goto LABEL_16;
              }
            }
            else if (!v11)
            {
              v33 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). For the given background/light, post-processing should be nil."));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 591, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              sub_1B5658D40(1, a6, 0, 4294944393, v18);
              goto LABEL_16;
            }
          }
        }
      }
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setBackground:", v9);
      objc_msgSend(v22, "setPost:", v11);
      objc_msgSend(v22, "setLight:", v10);
      goto LABEL_18;
    }
    objc_msgSend(v11, "singleColorCube");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      if (!v10
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: When background is not nil, Single color cube is good only for Studio or Contour."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 529, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5658D40(1, a6, 0, 4294944393, v18);
        goto LABEL_16;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v10)
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). For the given background/light, post-processing should be nil."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 541, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5658D40(1, a6, 0, 4294944393, v18);
        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v10
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v34 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). For the given background/light, post-processing should be nil."));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 553, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B5658D40(1, a6, 0, 4294944393, v18);
          goto LABEL_16;
        }
      }
    }
LABEL_38:
    v27 = byte_1EF12D4A0;
    goto LABEL_39;
  }
  if (!v10)
  {
    if (v11)
    {
      objc_msgSend(v11, "singleColorCube");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). Use post as colorCubeRequest: (Single cube)."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 479, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5658D40(1, a6, 0, 4294944393, v18);
        goto LABEL_16;
      }
    }
    goto LABEL_38;
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: Requests' combination is not supported (see Table in CVAVideoPipeline.h). Light should be nil."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 469, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(1, a6, 0, 4294944393, v18);
LABEL_16:

LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

+ (id)colorCubePortraitGenericRequestForPortraitVideoPipeline:(id)a3 sourceColorPixelBuffer:(__CVBuffer *)a4 cubeData:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  unsigned __int8 v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  char v19;

  v9 = a3;
  v10 = a5;
  if (a6)
    *a6 = 0;
  v11 = atomic_load((unsigned __int8 *)&qword_1EF12D690);
  if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D690))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("CVAPhotoEnforceNewAPI")) ^ 1;

    byte_1EF12D688 = v19;
    __cxa_guard_release(&qword_1EF12D690);
  }
  v12 = byte_1EF12D688;
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("API: colorCubePortraitGenericRequestForPortraitVideoPipeline is deprecated."));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAVideoPipelineLibrary colorCubePortraitGenericRequestForPortraitVideoPipeline:sourceColorPixelBuffer:cubeData:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineLibrary.mm", 624, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v12 == 0, a6, 0, 4294944393, v15);

  if (v12)
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setPortraitVideoPipeline:", v9);
    objc_msgSend(v16, "setSourceColorPixelBuffer:", a4);
    CVPixelBufferRetain(a4);
    objc_msgSend(v16, "setCubeData:", v10);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
