@implementation VCProcessor

- (VCProcessor)init
{
  VCProcessor *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCProcessor;
  result = -[VCProcessor init](&v8, sel_init);
  result->_outputROI.origin.x = 0.0;
  result->_outputROI.origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  result->_outputROI.size = _Q0;
  *(_DWORD *)&result->_orientationCorrectionEnabled = 16843009;
  __asm { FMOV            V0.2S, #1.0 }
  *(CGFloat *)&result->_videoZoomFactor = _Q0.width;
  *(_OWORD *)result->_outputCameraDefaultRotation = 0u;
  return result;
}

- (int)setup
{
  id v3;
  void *v4;
  FigMetalContext *v5;
  FigMetalContext *context;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  MTLCommandQueue *v13;
  MTLCommandQueue *metalCommandQueue;
  int result;
  VCCamera *v16;
  VCCamera *inputCamera;
  VCCamera *v18;
  VCCamera *outputCamera;
  VCCamera *v20;
  $470D365275581EF16070F5A11344F73E outputDimensions;
  int64x2_t v22;
  CinematicFramingSession *v28;
  CinematicFramingSession *framingSession;
  CinematicFramingSession *v30;
  VCCameraAnimator *v31;
  VCCameraAnimator *outputCameraAnimator;
  float64x2_t v33;

  if (self->_outputDimensions.width < 1)
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0D08B28]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (FigMetalContext *)objc_msgSend(v3, "initWithbundle:andOptionalCommandQueue:", v4, self->_metalCommandQueue);
  context = self->_context;
  self->_context = v5;

  if (!self->_context)
    return 0;
  v7 = objc_alloc(MEMORY[0x1E0D08B08]);
  -[FigMetalContext device](self->_context, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDevice:allocatorType:", v8, 2);
  -[FigMetalContext setAllocator:](self->_context, "setAllocator:", v9);

  -[FigMetalContext allocator](self->_context, "allocator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    return -1;
  v11 = objc_alloc_init(MEMORY[0x1E0D08B20]);
  objc_msgSend(v11, "setLabel:", CFSTR("VCP_FigMetalAllocator"));
  objc_msgSend(v11, "setWireMemory:", 1);
  objc_msgSend(v11, "setMemSize:", 10485760);
  objc_msgSend(v11, "setResourceOptions:", 512);
  -[FigMetalContext allocator](self->_context, "allocator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setupWithDescriptor:", v11);

  -[FigMetalContext commandQueue](self->_context, "commandQueue");
  v13 = (MTLCommandQueue *)objc_claimAutoreleasedReturnValue();
  metalCommandQueue = self->_metalCommandQueue;
  self->_metalCommandQueue = v13;

  result = -[VCProcessor _loadTuningParameters](self, "_loadTuningParameters");
  if (result)
    return result;
  v16 = objc_alloc_init(VCCamera);
  inputCamera = self->_inputCamera;
  self->_inputCamera = v16;

  if (!self->_inputCamera)
    return -1;
  v18 = objc_alloc_init(VCCamera);
  outputCamera = self->_outputCamera;
  self->_outputCamera = v18;

  v20 = self->_outputCamera;
  if (!v20)
    return -1;
  outputDimensions = self->_outputDimensions;
  v22.i64[0] = outputDimensions.width;
  v22.i64[1] = outputDimensions.height;
  v33 = vmulq_f64((float64x2_t)self->_outputROI.size, vcvtq_f64_s64(v22));
  -[VCCamera setSensorSize:](v20, "setSensorSize:", COERCE_DOUBLE(vcvt_f32_f64(v33)));
  __asm { FMOV            V0.2D, #0.5 }
  -[VCCamera setPrincipalPoint:](self->_outputCamera, "setPrincipalPoint:", COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v33, _Q0))));
  -[VCCamera fov](self->_inputCamera, "fov");
  -[VCCamera setFov:](self->_outputCamera, "setFov:");
  v28 = -[CinematicFramingSession initWithOutputDimensions:]([CinematicFramingSession alloc], "initWithOutputDimensions:", *(_QWORD *)&self->_outputDimensions);
  framingSession = self->_framingSession;
  self->_framingSession = v28;

  v30 = self->_framingSession;
  if (!v30)
    return -1;
  -[CinematicFramingSession setOutputFramingRectOfInterest:](v30, "setOutputFramingRectOfInterest:", self->_outputROI.origin.x, self->_outputROI.origin.y, self->_outputROI.size.width, self->_outputROI.size.height);
  -[CinematicFramingSession setCameraOrientationCorrectionEnabled:](self->_framingSession, "setCameraOrientationCorrectionEnabled:", self->_orientationCorrectionEnabled);
  v31 = objc_alloc_init(VCCameraAnimator);
  outputCameraAnimator = self->_outputCameraAnimator;
  self->_outputCameraAnimator = v31;

  result = 0;
  self->_autoFramingEnabled = 0;
  *(_WORD *)&self->_outputCameraResetCompleted = 257;
  self->_videoZoomFactor = self->_manualFramingDefaultVideoZoomFactor;
  return result;
}

- (int)prewarm
{
  VCShaders *v3;
  VCShaders *shaders;
  __CVMetalTextureCache **p_cvMetalTextureCacheRef;
  const __CFDictionary *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[VCShaders initWithContext:]([VCShaders alloc], "initWithContext:", self->_context);
  shaders = self->_shaders;
  self->_shaders = v3;

  if (self->_shaders)
  {
    p_cvMetalTextureCacheRef = &self->_cvMetalTextureCacheRef;
    if (!self->_cvMetalTextureCacheRef)
    {
      v9 = *MEMORY[0x1E0CA8F48];
      v10[0] = &unk_1E98AFA40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      -[FigMetalContext device](self->_context, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, v7, 0, p_cvMetalTextureCacheRef);

    }
  }
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  self->_processingType = a3;
  return 0;
}

- (int)process
{
  unsigned int processingType;

  if (self->_inputPixelBuffer && self->_inputCamera && self->_outputPixelBuffer && self->_outputCamera)
  {
    processingType = self->_processingType;
    if (processingType == 1)
      return -[VCProcessor _processStill](self, "_processStill");
    if (!processingType && self->_inputMetadata)
      return -[VCProcessor _processVideo](self, "_processVideo");
  }
  return -1;
}

- (int)purgeResources
{
  __CVMetalTextureCache *cvMetalTextureCacheRef;
  __CVMetalTextureCache *v4;
  void *v5;
  void *v6;

  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
  {
    CVMetalTextureCacheFlush(cvMetalTextureCacheRef, 0);
    v4 = self->_cvMetalTextureCacheRef;
    if (v4)
    {
      CFRelease(v4);
      self->_cvMetalTextureCacheRef = 0;
    }
  }
  -[FigMetalContext allocator](self->_context, "allocator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

  -[FigMetalContext allocator](self->_context, "allocator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "purgeResources");

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[VCProcessor purgeResources](self, "purgeResources");
  v3.receiver = self;
  v3.super_class = (Class)VCProcessor;
  -[VCProcessor dealloc](&v3, sel_dealloc);
}

- (int)finishProcessing
{
  -[FigMetalContext waitForSchedule](self->_context, "waitForSchedule");
  return 0;
}

- (int)resetState
{
  -[VCCameraAnimator reset](self->_outputCameraAnimator, "reset");
  return 0;
}

- (void)setMetalCommandQueue:(id)a3
{
  MTLCommandQueue *v5;
  MTLCommandQueue **p_metalCommandQueue;
  MTLCommandQueue *metalCommandQueue;
  MTLCommandQueue *v8;

  v5 = (MTLCommandQueue *)a3;
  metalCommandQueue = self->_metalCommandQueue;
  p_metalCommandQueue = &self->_metalCommandQueue;
  if (metalCommandQueue == v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_metalCommandQueue, a3);
    v5 = v8;
  }

}

- (MTLCommandQueue)metalCommandQueue
{
  return (MTLCommandQueue *)-[FigMetalContext commandQueue](self->_context, "commandQueue");
}

- (int)_loadTuningParameters
{
  VCTuningParameters *v3;
  VCTuningParameters *tuning;

  if (self->_tuningParameters)
    v3 = -[VCTuningParameters initWithDictionary:]([VCTuningParameters alloc], "initWithDictionary:", self->_tuningParameters);
  else
    v3 = objc_alloc_init(VCTuningParameters);
  tuning = self->_tuning;
  self->_tuning = v3;

  if (self->_tuning)
    return 0;
  else
    return -16680;
}

- (void)setOutputROI:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  int v10;
  int v11;
  $470D365275581EF16070F5A11344F73E outputDimensions;
  int64x2_t v13;
  float32x2_t v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = 1.0;
  v16.size.height = 1.0;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v8 = CGRectContainsRect(v16, v17);
  if (height > 0.0001 && width > 0.0001 && v8)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    if (!CGRectEqualToRect(self->_outputROI, v18))
    {
      self->_outputROI.origin.x = x;
      self->_outputROI.origin.y = y;
      self->_outputROI.size.width = width;
      self->_outputROI.size.height = height;
      if (!self->_processingType)
      {
        -[VCCamera fov](self->_outputCamera, "fov");
        v11 = v10;
        outputDimensions = self->_outputDimensions;
        v13.i64[0] = outputDimensions.width;
        v13.i64[1] = outputDimensions.height;
        -[VCCamera setSensorSize:](self->_outputCamera, "setSensorSize:", COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64((float64x2_t)self->_outputROI.size, vcvtq_f64_s64(v13)))));
        -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
        -[VCCamera setPrincipalPoint:](self->_outputCamera, "setPrincipalPoint:", COERCE_DOUBLE(vmul_f32(v14, (float32x2_t)0x3F0000003F000000)));
        LODWORD(v15) = v11;
        -[VCCamera setFov:](self->_outputCamera, "setFov:", v15);
        -[CinematicFramingSession setOutputFramingRectOfInterest:](self->_framingSession, "setOutputFramingRectOfInterest:", x, y, width, height);
        -[VCCameraAnimator reset](self->_outputCameraAnimator, "reset");
      }
    }
  }
}

- (void)setOrientationCorrectionEnabled:(BOOL)a3
{
  self->_orientationCorrectionEnabled = a3;
  -[CinematicFramingSession setCameraOrientationCorrectionEnabled:](self->_framingSession, "setCameraOrientationCorrectionEnabled:");
}

- (void)setVideoZoomFactor:(float)a3
{
  if (a3 > 0.0 && !self->_autoFramingEnabled)
  {
    *(_WORD *)&self->_outputCameraResetCompleted = 257;
    -[VCCameraAnimator configureWithPreset:](self->_outputCameraAnimator, "configureWithPreset:", 1);
    self->_videoZoomFactor = a3;
    if (a3 == 1.0)
      -[VCCamera setRotation:](self->_outputCamera, "setRotation:", *(double *)self->_outputCameraDefaultRotation);
  }
}

- (double)getPhysicalCameraToVirtualCameraTransform
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  uint64_t v6;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  simd_float4x4 v12;
  __int128 v13;
  simd_float4x4 v14;
  simd_float4x4 v15;

  objc_msgSend(*(id *)(a1 + 192), "extrinsicMatrix");
  v10 = v2;
  v11 = v3;
  v8 = v5;
  v9 = v4;
  objc_msgSend(*(id *)(a1 + 176), "extrinsicMatrix");
  v15 = __invert_f4(v14);
  v6 = 0;
  v12 = v15;
  do
  {
    *(__int128 *)((char *)&v13 + v6 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(*(_OWORD *)&v12.columns[v6])), v11, *(float32x2_t *)v12.columns[v6].f32, 1), v9, (float32x4_t)v12.columns[v6], 2), v8, (float32x4_t)v12.columns[v6], 3);
    ++v6;
  }
  while (v6 != 4);
  return *(double *)&v13;
}

- (int)_processStill
{
  float width;
  float height;
  float v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float v13;

  width = (float)self->_outputDimensions.width;
  -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
  height = (float)self->_outputDimensions.height;
  v6 = width / v5;
  -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
  *(float *)&v8 = height / *((float *)&v8 + 1);
  if (v6 < (float)(height / *((float *)&v8 + 1)))
    *(float *)&v8 = v6;
  -[VCCamera sensorSize](self->_outputCamera, "sensorSize", v8, v7);
  -[VCCamera setSensorSize:](self->_outputCamera, "setSensorSize:", COERCE_DOUBLE(vmul_n_f32(v9, v13)));
  -[VCCamera focalLength](self->_outputCamera, "focalLength");
  -[VCCamera setFocalLength:](self->_outputCamera, "setFocalLength:", COERCE_DOUBLE(vmul_n_f32(v10, v13)));
  -[VCCamera principalPoint](self->_outputCamera, "principalPoint");
  -[VCCamera setPrincipalPoint:](self->_outputCamera, "setPrincipalPoint:", COERCE_DOUBLE(vmul_n_f32(v11, v13)));
  return -[VCProcessor _render](self, "_render");
}

- (int)_processVideo
{
  int result;

  result = -[VCProcessor _updateCamera:withMetadata:](self, "_updateCamera:withMetadata:", self->_inputCamera, self->_inputMetadata);
  if (!result)
  {
    if (self->_autoFramingEnabled)
    {
      result = -[VCProcessor _updateAutoFraming](self, "_updateAutoFraming");
      if (result)
        return result;
    }
    else
    {
      result = -[VCProcessor _updateManualFraming](self, "_updateManualFraming");
      if (result)
        return result;
    }
    -[VCProcessor _updateOutputCameraFisheyeEffect](self, "_updateOutputCameraFisheyeEffect");
    if ((!self->_rollCorrectionEnabled
       || (result = -[VCProcessor _updateOutputCameraForRollCorrection](self, "_updateOutputCameraForRollCorrection")) == 0)
      && (!self->_confineOutputCamera
       || (result = -[VCProcessor _confineOutputCameraToInputCameraFrustum:](self, "_confineOutputCameraToInputCameraFrustum:", 1)) == 0))
    {
      result = -[VCProcessor _updateOutputCameraAnimation](self, "_updateOutputCameraAnimation");
      if (!result)
      {
        result = -[VCProcessor _render](self, "_render");
        if (!result
          && (self->_autoFramingEnabled
           || (result = -[VCProcessor _updateManualFramingStateMetadata](self, "_updateManualFramingStateMetadata")) == 0))
        {
          if (self->_attachMetadataToOutputPixelBuffer)
            return -[VCProcessor _setOutputPixelBufferAttachments](self, "_setOutputPixelBufferAttachments");
          else
            return 0;
        }
      }
    }
  }
  return result;
}

- (void)startRotatingFromPoint:(CGPoint)a3
{
  CGFloat y;
  float32x2_t v4;

  y = a3.y;
  v4 = vcvt_f32_f64((float64x2_t)a3);
  *(float32x2_t *)&self->_rotationCursorPrev[3] = v4;
  *(float32x2_t *)&self->_rotationCursorCurr[3] = v4;
  *(_WORD *)&self->_outputCameraResetCompleted = 257;
  -[VCCameraAnimator configureWithPreset:](self->_outputCameraAnimator, "configureWithPreset:", 1);
}

- (void)continueRotatingToPoint:(CGPoint)a3
{
  CGFloat y;

  if (!self->_confineOutputCamera || self->_videoZoomFactor != 1.0)
  {
    y = a3.y;
    *(float32x2_t *)&self->_rotationCursorCurr[3] = vcvt_f32_f64((float64x2_t)a3);
    *(_WORD *)&self->_outputCameraResetCompleted = 257;
    -[VCCameraAnimator configureWithPreset:](self->_outputCameraAnimator, "configureWithPreset:", 1);
  }
}

- (void)resetOutputCamera
{
  *(_WORD *)&self->_outputCameraResetCompleted = 256;
  -[VCCameraAnimator configureWithPreset:](self->_outputCameraAnimator, "configureWithPreset:", 2);
  -[VCCameraAnimator interrupt](self->_outputCameraAnimator, "interrupt");
}

- (void)adjustToFrameCurrentScene
{
  *(_WORD *)&self->_outputCameraResetCompleted = 1;
  -[VCCameraAnimator configureWithPreset:](self->_outputCameraAnimator, "configureWithPreset:", 2);
  -[VCCameraAnimator interrupt](self->_outputCameraAnimator, "interrupt");
}

- (void)setManualFramingDefaultVideoZoomFactor:(float)a3
{
  if (a3 > 0.0)
    self->_manualFramingDefaultVideoZoomFactor = a3;
}

- (void)setOutputCameraDefaultRotation:(VCProcessor *)self
{
  __int128 v2;
  double v3;
  id v4;

  v3 = *(double *)&v2;
  *(_OWORD *)self->_outputCameraDefaultRotation = v2;
  -[CinematicFramingSession options](self->_framingSession, "options");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultViewportRotation:", v3);

}

- (int)_updateManualFraming
{
  float v3;
  float v4;
  float v5;
  __int128 v6;
  float v7;
  float v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float v18;
  float32x2_t v19;
  uint64_t v21;
  int v22;
  double v23;

  -[VCProcessor _cacheManualFramingState](self, "_cacheManualFramingState");
  if (!self->_oneShotFramingCompleted)
  {
    -[VCTuningParameters oneShotFramingDuration](self->_tuning, "oneShotFramingDuration");
    v4 = v3;
    -[VCCameraAnimator duration](self->_outputCameraAnimator, "duration");
    if (v5 > v4)
      return 0;
    -[CinematicFramingSession processWithMetadata:](self->_framingSession, "processWithMetadata:", self->_inputMetadata);
    -[CinematicFramingSession idealViewport](self->_framingSession, "idealViewport");
    v23 = 0.0;
    v22 = 0;
    v21 = 0;
    -[VCProcessor _getEquivalentOutputCameraFocalLength:rotation:forViewport:](self, "_getEquivalentOutputCameraFocalLength:rotation:forViewport:", &v23, &v21);
    -[VCCamera setFocalLength:](self->_outputCamera, "setFocalLength:", v23);
    *(_QWORD *)&v6 = v21;
LABEL_7:
    -[VCCamera setRotation:](self->_outputCamera, "setRotation:", *(double *)&v6);
    return 0;
  }
  if (!self->_outputCameraResetCompleted)
  {
    -[VCProcessor _getBaseZoomFactor:](self, "_getBaseZoomFactor:", self->_inputCamera);
    v8 = v7;
    -[VCCamera focalLength](self->_inputCamera, "focalLength");
    v10 = v9;
    -[VCCamera sensorSize](self->_inputCamera, "sensorSize");
    v12 = vdiv_f32(v10, v11);
    v13 = fminf(v12.f32[0], v12.f32[1]);
    -[VCCamera focalLength](self->_outputCamera, "focalLength");
    v15 = v14;
    -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
    v17 = vdiv_f32(v15, v16);
    v15.f32[0] = fminf(v17.f32[0], v17.f32[1]);
    v18 = (float)(v13 / v8) * self->_manualFramingDefaultVideoZoomFactor;
    -[VCCamera focalLength](self->_outputCamera, "focalLength");
    -[VCCamera setFocalLength:](self->_outputCamera, "setFocalLength:", COERCE_DOUBLE(vmul_n_f32(v19, v18 / v15.f32[0])));
    v6 = *(_OWORD *)self->_outputCameraDefaultRotation;
    goto LABEL_7;
  }
  -[VCProcessor _updateOutputCameraFocalLengthWithVideoZoomFactor](self, "_updateOutputCameraFocalLengthWithVideoZoomFactor");
  -[VCProcessor _updateOutputCameraRotationWithCursor](self, "_updateOutputCameraRotationWithCursor");
  return 0;
}

- (void)_updateOutputCameraFocalLengthWithVideoZoomFactor
{
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float videoZoomFactor;
  float v13;
  VCCamera *outputCamera;
  float32x2_t v15;
  float v16;

  -[VCCamera focalLength](self->_outputCamera, "focalLength");
  v4 = v3;
  -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
  v6 = vdiv_f32(v4, v5);
  v7 = fminf(v6.f32[0], v6.f32[1]);
  -[VCCamera focalLength](self->_inputCamera, "focalLength");
  v9 = v8;
  -[VCCamera sensorSize](self->_inputCamera, "sensorSize");
  v11 = vdiv_f32(v9, v10);
  v9.f32[0] = fminf(v11.f32[0], v11.f32[1]);
  -[VCProcessor _getBaseZoomFactor:](self, "_getBaseZoomFactor:", self->_inputCamera);
  videoZoomFactor = self->_videoZoomFactor;
  outputCamera = self->_outputCamera;
  v16 = (float)(v9.f32[0] * (float)(videoZoomFactor / v13)) / v7;
  -[VCCamera focalLength](outputCamera, "focalLength");
  -[VCCamera setFocalLength:](outputCamera, "setFocalLength:", COERCE_DOUBLE(vmul_n_f32(v15, v16)));
}

- (void)_updateOutputCameraRotationWithCursor
{
  uint32x2_t v2;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float32x2_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float32x2_t v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float32x2_t v21;
  float v22;
  float v23;
  unint64_t v24;
  VCCamera *outputCamera;
  float32x4_t v26;
  float v27;
  float32x2_t v28;
  float32x4_t v29;

  v2 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_rotationCursorCurr[3], *(float32x2_t *)&self->_rotationCursorPrev[3]);
  if ((vpmin_u32(v2, v2).u32[0] & 0x80000000) == 0)
  {
    if (!self->_confineOutputCamera
      || (-[VCCamera zoomFOV](self->_outputCamera, "zoomFOV"),
          v5 = v4,
          -[VCCamera zoomFOV](self->_inputCamera, "zoomFOV"),
          (float)(v5 / v6) < 0.98))
    {
      -[VCCamera focalLength](self->_outputCamera, "focalLength");
      v27 = v7;
      -[VCCamera zoomFactor](self->_outputCamera, "zoomFactor");
      v9 = v8 * v27;
      -[VCCamera focalLength](self->_outputCamera, "focalLength");
      v28 = v10;
      -[VCCamera zoomFactor](self->_outputCamera, "zoomFactor");
      v12 = vmuls_lane_f32(v11, v28, 1);
      -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
      v14 = (float)(COERCE_FLOAT(*(_QWORD *)&self->_rotationCursorPrev[3]) + -0.5) * v13;
      -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
      v16 = vmuls_lane_f32(0.5 - *(float *)&self->_rotationCursorPrev[7], v15, 1);
      v17 = atan2f(v14, v9);
      v18 = atan2f(v16, v12);
      -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
      v20 = (float)(COERCE_FLOAT(*(_QWORD *)&self->_rotationCursorCurr[3]) + -0.5) * v19;
      -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
      v22 = vmuls_lane_f32(0.5 - *(float *)&self->_rotationCursorCurr[7], v21, 1);
      v23 = atan2f(v20, v9);
      *(float *)&v24 = v18 - atan2f(v22, v12);
      *((float *)&v24 + 1) = v17 - v23;
      v29 = (float32x4_t)v24;
      outputCamera = self->_outputCamera;
      -[VCCamera rotation](outputCamera, "rotation");
      -[VCCamera setRotation:](outputCamera, "setRotation:", *(double *)vaddq_f32(v26, v29).i64);
      *(_QWORD *)&self->_rotationCursorPrev[3] = *(_QWORD *)&self->_rotationCursorCurr[3];
    }
  }
}

- (void)_cacheManualFramingState
{
  uint64_t v3;

  -[VCCamera rotation](self->_outputCamera, "rotation");
  *(_QWORD *)&self->_anon_28[3] = v3;
  *(float *)&self->_anon_28[11] = self->_videoZoomFactor;
}

- (void)_restoreManualFramingState
{
  -[VCCamera setRotation:](self->_outputCamera, "setRotation:", *(double *)&self->_anon_28[3]);
  self->_videoZoomFactor = *(float *)&self->_anon_28[11];
  -[VCProcessor _updateOutputCameraFocalLengthWithVideoZoomFactor](self, "_updateOutputCameraFocalLengthWithVideoZoomFactor");
}

- (int)_updateManualFramingStateMetadata
{
  int v3;
  int v4;
  NSDictionary *v5;
  NSDictionary *v6;
  VCCamera *v7;
  VCCamera *v8;
  VCCamera *outputCamera;
  VCCamera *v10;
  _QWORD *v11;
  _QWORD *v12;
  float32x2_t v13;
  float32x2_t v14;
  uint32x2_t v15;
  float v16;
  float v17;
  CFDictionaryRef DictionaryRepresentation;
  double v19;
  void *v20;
  float32x2_t v21;
  float32x2_t v22;
  uint32x2_t v23;
  float v24;
  float v25;
  CFDictionaryRef v26;
  void *v27;
  NSDictionary *manualFramingStateMetadata;
  float v30;
  float v31;
  CGPoint v32;
  CGPoint v33;

  if (self->_oneShotFramingCompleted || -[VCCameraAnimator animating](self->_outputCameraAnimator, "animating"))
  {
    v3 = 0;
  }
  else
  {
    v3 = 1;
    self->_oneShotFramingCompleted = 1;
  }
  if (self->_outputCameraResetCompleted || -[VCCameraAnimator animating](self->_outputCameraAnimator, "animating"))
  {
    v4 = 0;
  }
  else
  {
    v4 = 1;
    self->_outputCameraResetCompleted = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08718]);
  if (v4)
    -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08728]);
  if (!self->_oneShotFramingCompleted || !self->_outputCameraResetCompleted)
  {
    v7 = self->_inputCamera;
    -[VCCameraAnimator animatedCamera](self->_outputCameraAnimator, "animatedCamera");
    v8 = (VCCamera *)objc_claimAutoreleasedReturnValue();
    outputCamera = v8;
    if (!v8)
      outputCamera = self->_outputCamera;
    v10 = outputCamera;

    -[VCProcessor _updateVideoZoomFactorFromInputCamera:toOutputCamera:](self, "_updateVideoZoomFactorFromInputCamera:toOutputCamera:", v7, v10);
  }
  v11 = (_QWORD *)MEMORY[0x1E0D08720];
  v12 = (_QWORD *)MEMORY[0x1E0D08710];
  if (((v3 | v4) & 1) == 0)
  {
    v13 = *(float32x2_t *)&self->_anon_28[3];
    -[VCCamera rotation](self->_outputCamera, "rotation");
    v15 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v13, v14));
    if ((vpmax_u32(v15, v15).u32[0] & 0x80000000) == 0)
      goto LABEL_26;
  }
  -[VCCamera rotation](self->_outputCamera, "rotation");
  v30 = v16;
  -[VCCamera rotation](self->_outputCamera, "rotation");
  v32.y = v17;
  v32.x = v30;
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v32);
  -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", DictionaryRepresentation, *v11);

  *(float *)&v19 = self->_videoZoomFactor;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v20, *v12);

  if (v3)
  {
    -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08718]);
    if (!v4)
      goto LABEL_27;
    goto LABEL_22;
  }
  if ((v4 & 1) == 0)
  {
    if (((v3 | v4) & 1) != 0)
      goto LABEL_27;
LABEL_26:
    if (*(float *)&self->_anon_28[11] == self->_videoZoomFactor)
      goto LABEL_31;
    goto LABEL_27;
  }
LABEL_22:
  -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08728]);
LABEL_27:
  v21 = *(float32x2_t *)&self->_anon_28[3];
  -[VCCamera rotation](self->_outputCamera, "rotation");
  v23 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v21, v22));
  if ((vpmax_u32(v23, v23).u32[0] & 0x80000000) != 0)
  {
    -[VCCamera rotation](self->_outputCamera, "rotation");
    v31 = v24;
    -[VCCamera rotation](self->_outputCamera, "rotation");
    v33.y = v25;
    v33.x = v31;
    v26 = CGPointCreateDictionaryRepresentation(v33);
    -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v26, *v11);

  }
  if (*(float *)&self->_anon_28[11] != self->_videoZoomFactor)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v27, *v12);

  }
LABEL_31:
  manualFramingStateMetadata = self->_manualFramingStateMetadata;
  self->_manualFramingStateMetadata = v6;

  return 0;
}

- (void)setAutoFramingEnabled:(BOOL)a3
{
  _BOOL4 autoFramingEnabled;

  autoFramingEnabled = self->_autoFramingEnabled;
  if (autoFramingEnabled != a3)
  {
    self->_framingModeJustChanged = 1;
    if (self->_autoRestoreManualFramingState)
    {
      if (autoFramingEnabled)
        -[VCProcessor _restoreManualFramingState](self, "_restoreManualFramingState");
      else
        -[VCProcessor _cacheManualFramingState](self, "_cacheManualFramingState");
    }
    *(_WORD *)&self->_outputCameraResetCompleted = 257;
    self->_autoFramingEnabled = a3;
  }
}

- (float)autoFramingFOVLimit
{
  float result;

  -[CinematicFramingSession fovLimit](self->_framingSession, "fovLimit");
  return result;
}

- (void)setAutoFramingFOVLimit:(float)a3
{
  -[CinematicFramingSession setFovLimit:](self->_framingSession, "setFovLimit:");
}

- (int)_updateAutoFraming
{
  int v3;
  float v4;
  double v6;
  int v7;
  double v8;

  v3 = -[VCProcessor _updateCamera:withMetadata:](self, "_updateCamera:withMetadata:", self->_inputCamera, self->_inputMetadata);
  if (!v3)
  {
    v8 = 0.0;
    v7 = 0;
    v6 = 0.0;
    -[CinematicFramingSession processWithMetadata:](self->_framingSession, "processWithMetadata:", self->_inputMetadata);
    -[VCProcessor _getEquivalentOutputCameraFocalLength:rotation:forViewport:](self, "_getEquivalentOutputCameraFocalLength:rotation:forViewport:", &v8, &v6);
    -[VCCamera setFocalLength:](self->_outputCamera, "setFocalLength:", v8);
    -[VCCamera setRotation:](self->_outputCamera, "setRotation:", v6);
    -[VCProcessor _getBaseZoomFactor:](self, "_getBaseZoomFactor:", self->_outputCamera);
    self->_videoZoomFactor = v4;
  }
  return v3;
}

- (int)_updateOutputCameraAnimation
{
  void *v3;
  VCCameraAnimator *outputCameraAnimator;
  CinematicFramingSessionInputMetadata *inputMetadata;
  VCCamera *v6;
  VCCamera *outputCamera;
  int v8;
  int v9;
  VCCamera *v10;
  VCCamera *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (self->_framingModeJustChanged)
  {
    -[VCCameraAnimator configureWithPreset:](self->_outputCameraAnimator, "configureWithPreset:", 2);
    self->_framingModeJustChanged = 0;
  }
  -[VCCameraAnimator animatedCamera](self->_outputCameraAnimator, "animatedCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  outputCameraAnimator = self->_outputCameraAnimator;
  inputMetadata = self->_inputMetadata;
  if (v3)
  {
    if (inputMetadata)
    {
      -[CinematicFramingSessionInputMetadata timestamp](inputMetadata, "timestamp");
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
    }
    -[VCCameraAnimator updateToTime:](outputCameraAnimator, "updateToTime:", &v13);
  }
  else
  {
    if (inputMetadata)
    {
      -[CinematicFramingSessionInputMetadata timestamp](inputMetadata, "timestamp");
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
    }
    -[VCCameraAnimator startAtTime:withCamera:](outputCameraAnimator, "startAtTime:withCamera:", &v16, self->_outputCamera);
  }
  if (self->_autoFramingEnabled && !-[VCCameraAnimator animating](self->_outputCameraAnimator, "animating"))
    -[VCCameraAnimator configureWithPreset:](self->_outputCameraAnimator, "configureWithPreset:", 1);
  -[VCCameraAnimator animatedCamera](self->_outputCameraAnimator, "animatedCamera", v13, v14, v15, v16, v17, v18);
  v6 = (VCCamera *)objc_claimAutoreleasedReturnValue();
  outputCamera = self->_outputCamera;
  self->_outputCamera = v6;

  -[VCProcessor _updateOutputCameraFisheyeEffect](self, "_updateOutputCameraFisheyeEffect");
  if (!self->_rollCorrectionEnabled
    || (v8 = -[VCProcessor _updateOutputCameraForRollCorrection](self, "_updateOutputCameraForRollCorrection")) == 0)
  {
    if (!self->_confineOutputCamera)
    {
      v9 = 0;
      goto LABEL_21;
    }
    v8 = -[VCProcessor _confineOutputCameraToInputCameraFrustum:](self, "_confineOutputCameraToInputCameraFrustum:", 0);
  }
  v9 = v8;
LABEL_21:
  -[VCCameraAnimator targetCamera](self->_outputCameraAnimator, "targetCamera");
  v10 = (VCCamera *)objc_claimAutoreleasedReturnValue();
  v11 = self->_outputCamera;
  self->_outputCamera = v10;

  return v9;
}

- (void)_updateOutputCameraFisheyeEffect
{
  double v2;
  _BOOL4 fisheyeEffectEnabled;
  VCCamera *outputCamera;

  fisheyeEffectEnabled = self->_fisheyeEffectEnabled;
  outputCamera = self->_outputCamera;
  if (fisheyeEffectEnabled)
  {
    -[VCCamera zoomFOV](outputCamera, "zoomFOV");
    *(float *)&v2 = fminf(fmaxf((float)(*(float *)&v2 + -1.309) / 0.5236, 0.0), 1.0);
    *(float *)&v2 = (float)((float)(*(float *)&v2 * *(float *)&v2) * (float)((float)(*(float *)&v2 * -2.0) + 3.0))
                  * 0.85;
    outputCamera = self->_outputCamera;
  }
  else
  {
    LODWORD(v2) = 0;
  }
  -[VCCamera setStereographicFisheyeStrength:](outputCamera, "setStereographicFisheyeStrength:", v2);
}

+ (CGPoint)warpCGPoint:(CGPoint)a3 fromCamera:(id)a4 toCamera:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  float32x2_t v12;
  float32_t v13;
  double v14;
  double v15;
  float64x2_t v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "model");
  v11 = objc_msgSend(v9, "model");
  v12.f32[0] = x;
  v13 = y;
  v12.f32[1] = v13;
  v16 = vcvtq_f64_f32(warpPoint(v10, v11, v12));

  v15 = v16.f64[1];
  v14 = v16.f64[0];
  result.y = v15;
  result.x = v14;
  return result;
}

+ (CGRect)warpCGRect:(CGRect)a3 fromCamera:(id)a4 toCamera:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  double MinX;
  double MaxX;
  double MinY;
  CGFloat MaxY;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[5];
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MinX = CGRectGetMinX(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MaxX = CGRectGetMaxX(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MinY = CGRectGetMinY(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  MaxY = CGRectGetMaxY(v34);
  v16 = 0;
  *(float *)&v17 = MinX;
  *(float *)&v18 = MaxX;
  *(float *)&v19 = MinY;
  *(float *)&MaxY = MaxY;
  HIDWORD(v18) = LODWORD(MaxY);
  v30[0] = __PAIR64__(v19, v17);
  v30[1] = __PAIR64__(v19, v18);
  HIDWORD(v17) = LODWORD(MaxY);
  v30[2] = v18;
  v30[3] = v17;
  do
  {
    v30[v16] = warpPoint(objc_msgSend(v10, "model"), objc_msgSend(v11, "model"), (float32x2_t)v30[v16]);
    ++v16;
  }
  while (v16 != 4);
  v20 = 0;
  v21 = -2.0;
  v22 = 2.0;
  v23 = -2.0;
  v24 = 2.0;
  do
  {
    v25 = v30[v20];
    v22 = fminf(v22, *(float *)&v25);
    v21 = fmaxf(v21, *(float *)&v25);
    v24 = fminf(v24, *((float *)&v25 + 1));
    v23 = fmaxf(v23, *((float *)&v25 + 1));
    ++v20;
  }
  while (v20 != 4);

  v26 = v22;
  v27 = v24;
  v28 = (float)(v21 - v22);
  v29 = (float)(v23 - v24);
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGPoint)warpCGPoint:(CGPoint)result
{
  double v4;
  double v5;

  if (self->_centerStagePassthrough && self->_autoFramingEnabled)
  {
    -[CinematicFramingSession warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:](self->_framingSession, "warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:", result.x, result.y, 0.0, 0.0);
  }
  else if (self->_inputCamera)
  {
    if (self->_outputCamera)
    {
      +[VCProcessor warpCGPoint:fromCamera:toCamera:](VCProcessor, "warpCGPoint:fromCamera:toCamera:", result.x, result.y);
      result.x = self->_outputROI.origin.x + self->_outputROI.size.width * v4;
      result.y = self->_outputROI.origin.y + self->_outputROI.size.height * v5;
    }
  }
  return result;
}

- (CGRect)warpCGRect:(CGRect)result
{
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;

  if (self->_centerStagePassthrough && self->_autoFramingEnabled)
  {
    -[CinematicFramingSession warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:](self->_framingSession, "warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:", result.origin.x, result.origin.y, result.size.width, result.size.height);
  }
  else if (self->_inputCamera)
  {
    if (self->_outputCamera)
    {
      +[VCProcessor warpCGRect:fromCamera:toCamera:](VCProcessor, "warpCGRect:fromCamera:toCamera:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      width = self->_outputROI.size.width;
      height = self->_outputROI.size.height;
      result.origin.x = self->_outputROI.origin.x + width * v6;
      result.origin.y = self->_outputROI.origin.y + height * v7;
      result.size.width = width * v8;
      result.size.height = v9 * height;
    }
  }
  return result;
}

- (float)_getBaseZoomFactor:(id)a3
{
  id v4;
  void *v5;
  float v6;
  NSDictionary *cameraInfoByPortType;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;

  v4 = a3;
  objc_msgSend(v4, "portType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1.0;
  if (v5)
  {
    cameraInfoByPortType = self->_cameraInfoByPortType;

    if (cameraInfoByPortType)
    {
      v8 = self->_cameraInfoByPortType;
      objc_msgSend(v4, "portType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D058B8]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "floatValue");
          v6 = v13;
        }

      }
    }
  }

  return v6;
}

- (void)_updateVideoZoomFactorFromInputCamera:(id)a3 toOutputCamera:(id)a4
{
  id v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float v17;
  float v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend(v6, "focalLength");
  v8 = v7;
  objc_msgSend(v6, "sensorSize");
  v10 = v9;
  objc_msgSend(v19, "focalLength");
  v12 = v11;
  objc_msgSend(v19, "sensorSize");
  v14 = v13;
  -[VCProcessor _getBaseZoomFactor:](self, "_getBaseZoomFactor:", v19);
  v15 = vdiv_f32(v8, v10);
  v16 = vdiv_f32(v12, v14);
  v18 = (float)(fminf(v15.f32[0], v15.f32[1]) * v17) / fminf(v16.f32[0], v16.f32[1]);
  if (v18 < 1.0)
    v18 = 1.0;
  self->_videoZoomFactor = v18;

}

- (void)_getEquivalentOutputCameraFocalLength:(VCProcessor *)self rotation:(SEL)a2 forViewport:
{
  float32x2_t *v2;
  _OWORD *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _OWORD *v12;
  float32x2_t *v13;
  void *v15;
  int v16;
  int v17;
  double v18;
  double v19;
  double v20;
  float MidY;
  float MidX;
  float Width;
  float Height;
  unsigned int v25;
  unsigned int v26;
  float v27;
  unsigned int v28;
  unsigned int v29;
  float v30;
  unsigned int v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v12 = v3;
  v13 = v2;
  if (!self->_orientationCorrectionEnabled)
  {
    -[VCCamera portType](self->_inputCamera, "portType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = isCinematicFramingFrontCamera(v15);

    v17 = computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(-[CinematicFramingSessionInputMetadata cameraOrientation](self->_inputMetadata, "cameraOrientation"), v16, -[CinematicFramingSessionInputMetadata frontCameraHas180DegreesRotation](self->_inputMetadata, "frontCameraHas180DegreesRotation"));
    v11 = rotateRectCCW(4 - v17, v11, v10, v9, v8);
    v10 = v18;
    v9 = v19;
    v8 = v20;
  }
  v32.origin.x = v11;
  v32.origin.y = v10;
  v32.size.width = v9;
  v32.size.height = v8;
  MidY = CGRectGetMidY(v32);
  *(float *)&v31 = -MidY;
  v33.origin.x = v11;
  v33.origin.y = v10;
  v33.size.width = v9;
  v33.size.height = v8;
  MidX = CGRectGetMidX(v33);
  v30 = MidX;
  v34.origin.x = v11;
  v34.origin.y = v10;
  v34.size.width = v9;
  v34.size.height = v8;
  Width = CGRectGetWidth(v34);
  v35.origin.x = v11;
  v35.origin.y = v10;
  v35.size.width = v9;
  v35.size.height = v8;
  Height = CGRectGetHeight(v35);
  -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
  v29 = v25;
  -[VCCamera sensorSize](self->_outputCamera, "sensorSize");
  v28 = v26;
  v27 = tanf(Width * 0.5);
  *v13 = vdiv_f32(vmul_f32((float32x2_t)__PAIR64__(v28, v29), (float32x2_t)0x3F0000003F000000), (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(tanf(Height * 0.5)), LODWORD(v27)));
  *v12 = __PAIR64__(LODWORD(v30), v31);
}

- (__n128)_getGravityVectorForCamera:(void *)a3 fromMetadata:(void *)a4
{
  id v5;
  id v6;
  char v7;
  float32x4_t v8;
  uint64_t v9;
  __int32 v10;
  __int32 v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  void *v15;
  int v16;
  float32x4_t *v17;
  float32x4_t *v18;
  float32x4_t *v19;
  float32x4_t v20;
  int32x4_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x4_t v24;
  __int32 v26;
  __int32 v27;
  float32x4_t v28;
  float32x4_t v29;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "hasGravity");
  v8 = 0uLL;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v6, "gravityX", 0.0);
    v28.i64[0] = v9;
    objc_msgSend(v6, "gravityY");
    v27 = v10;
    objc_msgSend(v6, "gravityZ");
    v26 = v11;
    if (objc_msgSend(v6, "hasDeviceToCameraSpaceTransform"))
    {
      objc_msgSend(v6, "deviceToCameraSpaceTransform");
    }
    else
    {
      objc_msgSend(v5, "portType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = isCinematicFramingFrontCamera(v15);

      v17 = (float32x4_t *)&_PromotedConst;
      v18 = (float32x4_t *)&unk_1D4E43B70;
      v19 = (float32x4_t *)&unk_1D4E43B80;
      if (!v16)
        v19 = (float32x4_t *)&unk_1D4E43BB0;
      v14 = *v19;
      if (!v16)
        v18 = (float32x4_t *)&unk_1D4E43BA0;
      v13 = *v18;
      if (!v16)
        v17 = (float32x4_t *)&_PromotedConst_332;
      v12 = *v17;
    }
    v20 = v28;
    v20.i32[1] = v27;
    v20.i32[2] = v26;
    v21 = (int32x4_t)vmulq_f32(v20, v20);
    v21.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v21, 2), vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v21.i8, 1))).u32[0];
    v22 = vrsqrte_f32((float32x2_t)v21.u32[0]);
    v23 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v22, v22)));
    v24 = vmulq_n_f32(v20, vmul_f32(v23, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v23, v23))).f32[0]);
    v8 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, v24.f32[0]), v13, *(float32x2_t *)v24.f32, 1), v14, v24, 2);
  }
  v29 = v8;

  return (__n128)v29;
}

- (int)_updateCamera:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  void *v16;
  int v17;
  double v18;
  float32x4_t v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "portType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPortType:", v8);

  objc_msgSend(v6, "setSensorID:", objc_msgSend(v7, "sensorID"));
  objc_msgSend(v7, "calibrationDataDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (v10 = objc_msgSend(v6, "updateWithCalibration:", v9)) == 0)
  {
    if (self->_orientationCorrectionEnabled)
    {
      if (objc_msgSend(v7, "hasGravity"))
      {
        -[VCProcessor _getGravityVectorForCamera:fromMetadata:](self, "_getGravityVectorForCamera:fromMetadata:", v6, v7);
        v12 = v11;
        v20 = v11;
        v11.i32[2] = 0;
        v13 = vmulq_f32(v11, v11);
        v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v13, 2), vadd_f32(*(float32x2_t *)v13.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.f32, 1))).u32[0];
        v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
        v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
        *(int32x2_t *)v13.f32 = vdup_lane_s32((int32x2_t)vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))), 0);
        v13.i64[0] = vmulq_f32(v12, v13).u64[0];
        atan2f(v13.f32[0], v13.f32[1]);
        atan2f(fabsf(v20.f32[2]), sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v20, v20))));
      }
      else
      {
        objc_msgSend(v6, "portType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = isCinematicFramingFrontCamera(v16);

        zRotationForOrientation(objc_msgSend(v7, "cameraOrientation"), v17);
      }
    }
    -[CinematicFramingSessionInputMetadata additionalInputCameraRotation](self->_inputMetadata, "additionalInputCameraRotation", *(_OWORD *)&v20);
    objc_msgSend(v6, "rotation");
    objc_msgSend(v6, "setRotation:", v18);
    v10 = 0;
  }

  return v10;
}

- (int)_updateOutputCameraForRollCorrection
{
  unsigned int v3;
  unsigned int v4;
  float32x4_t v5;
  void *v6;
  int v7;
  double v8;
  float v9;
  float v10;
  __float2 v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  int32x4_t v15;
  int8x16_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  int32x4_t v20;
  int8x16_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  uint64_t v26;
  float32x4_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v33;
  double v34;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  double v39;
  float32x4_t v40;
  unsigned int v41;
  double v42;
  simd_float3x3 v43;
  float32x4_t v44[3];
  simd_float3x3 v45;
  simd_float3x3 v46;

  -[VCCamera rotation](self->_outputCamera, "rotation");
  v41 = v3;
  -[VCCamera rotation](self->_outputCamera, "rotation");
  v42 = COERCE_DOUBLE(__PAIR64__(v4, v41));
  -[VCCamera setRotation:](self->_outputCamera, "setRotation:", v42);
  if (-[CinematicFramingSessionInputMetadata hasGravity](self->_inputMetadata, "hasGravity"))
  {
    -[VCProcessor _getGravityVectorForCamera:fromMetadata:](self, "_getGravityVectorForCamera:fromMetadata:", self->_inputCamera, self->_inputMetadata);
  }
  else
  {
    -[VCCamera portType](self->_inputCamera, "portType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = isCinematicFramingFrontCamera(v6);

    v8 = zRotationForOrientation(-[CinematicFramingSessionInputMetadata cameraOrientation](self->_inputMetadata, "cameraOrientation"), v7);
    -[CinematicFramingSessionInputMetadata additionalInputCameraRotation](self->_inputMetadata, "additionalInputCameraRotation");
    v10 = v9 * 3.14159265 / 180.0 + v8;
    v11 = __sincosf_stret(v10 * -0.5);
    v12 = vmulq_n_f32((float32x4_t)xmmword_1D4E43AA0, v11.__sinval);
    v13 = v12;
    v13.i32[3] = LODWORD(v11.__cosval);
    v14 = vmulq_f32(v13, (float32x4_t)xmmword_1D4E43B10);
    v15 = (int32x4_t)vnegq_f32(v14);
    v16 = (int8x16_t)vtrn2q_s32((int32x4_t)v14, vtrn1q_s32((int32x4_t)v14, v15));
    v17 = vmlaq_f32((float32x4_t)vextq_s8((int8x16_t)v14, (int8x16_t)v15, 8uLL), (float32x4_t)0, (float32x4_t)vextq_s8(v16, v16, 8uLL));
    v18 = (float32x4_t)vrev64q_s32((int32x4_t)v14);
    v18.i32[0] = v15.i32[1];
    v18.i32[3] = v15.i32[2];
    v19 = vmlaq_f32(v17, (float32x4_t)0, v18);
    v20 = (int32x4_t)vnegq_f32(v19);
    v21 = (int8x16_t)vtrn2q_s32((int32x4_t)v19, vtrn1q_s32((int32x4_t)v19, v20));
    v22 = (float32x4_t)vrev64q_s32((int32x4_t)v19);
    v22.i32[0] = v20.i32[1];
    v22.i32[3] = v20.i32[2];
    v5 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v19, v13, 3), v22, v12, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v19, (int8x16_t)v20, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v21, v21, 8uLL), v12.f32[0]));
  }
  v40 = v5;
  -[VCCamera rotationMatrix](self->_outputCamera, "rotationMatrix");
  v37 = v24;
  v38 = v23;
  v36 = v25;
  -[VCCamera rotationMatrix](self->_inputCamera, "rotationMatrix");
  v46 = __invert_f3(v45);
  v26 = 0;
  v43 = v46;
  do
  {
    v44[v26] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v38, COERCE_FLOAT(*(_OWORD *)&v43.columns[v26])), v37, *(float32x2_t *)v43.columns[v26].f32, 1), v36, (float32x4_t)v43.columns[v26], 2);
    ++v26;
  }
  while (v26 != 3);
  v27 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44[0], v40.f32[0]), v44[1], *(float32x2_t *)v40.f32, 1), v44[2], v40, 2);
  v28 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v27, v27)));
  v29 = vrsqrte_f32(v28);
  v30 = vmul_f32(v29, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v29, v29)));
  v31 = vmul_n_f32(*(float32x2_t *)v27.f32, vmul_f32(v30, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v30, v30))).f32[0]);
  *(float32x2_t *)v27.f32 = vmul_f32(*(float32x2_t *)v40.f32, *(float32x2_t *)v40.f32);
  v27.i32[0] = vadd_f32(*(float32x2_t *)v27.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.f32, 1)).u32[0];
  v32 = vrsqrte_f32((float32x2_t)v27.u32[0]);
  v33 = vmul_f32(v32, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v32, v32)));
  v34 = COERCE_DOUBLE(vmul_n_f32(*(float32x2_t *)v40.f32, vmul_f32(v33, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v33, v33))).f32[0]));
  if (self->_orientationCorrectionEnabled)
    v34 = 0.0078125;
  v39 = v34;
  atan2f(v31.f32[1], v31.f32[0]);
  atan2f(*((float *)&v39 + 1), *(float *)&v39);
  atan2f(fabsf(v40.f32[2]), sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v40, v40))));
  -[CinematicFramingSessionInputMetadata additionalOutputCameraRotation](self->_inputMetadata, "additionalOutputCameraRotation");
  -[VCCamera setRotation:](self->_outputCamera, "setRotation:", v42);
  return 0;
}

- (int)_confineOutputCameraToInputCameraFrustum:(BOOL)a3
{
  double v3;
  int v5;
  int v6;
  __int128 v7;
  double v8;
  double v9;
  char v10;
  double v11;
  VCCamera *outputCamera;
  double v13;
  float v14;
  float v15;
  int v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  int i;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v24;
  unsigned int v25;
  int8x16_t v26;
  int8x16_t v28;
  __int128 v29;
  int8x16_t v30;
  float32x4_t v31;
  int8x16_t v32;

  if (a3)
  {
    LODWORD(v3) = 1.0;
    -[VCCamera setZoomFactor:](self->_outputCamera, "setZoomFactor:", v3);
  }
  -[VCCamera zoomFactor](self->_outputCamera, "zoomFactor");
  v6 = v5;
  -[VCCamera rotation](self->_outputCamera, "rotation");
  v29 = v7;
  if ((isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0) & 1) == 0)
  {
    LODWORD(v8) = 10.0;
    -[VCCamera setZoomFactor:](self->_outputCamera, "setZoomFactor:", v8);
    -[VCCamera rotation](self->_inputCamera, "rotation");
    -[VCCamera setRotation:](self->_outputCamera, "setRotation:", v9);
    if (self->_rollCorrectionEnabled)
      -[VCProcessor _updateOutputCameraForRollCorrection](self, "_updateOutputCameraForRollCorrection");
    v10 = isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0);
    LODWORD(v11) = v6;
    -[VCCamera setZoomFactor:](self->_outputCamera, "setZoomFactor:", v11);
    outputCamera = self->_outputCamera;
    if ((v10 & 1) == 0)
    {
      -[VCCamera setRotation:](outputCamera, "setRotation:", *(double *)&v29);
      return -1;
    }
    if ((isViewFrustumContained(outputCamera, self->_inputCamera, 0.0) & 1) == 0)
    {
      -[VCCamera zoomFactor](self->_outputCamera, "zoomFactor");
      v14 = *(float *)&v13;
      v15 = 10.0;
      if (fabsf(*(float *)&v13 + -10.0) > 0.001)
      {
        v16 = 22;
        do
        {
          if (!--v16)
            break;
          *(float *)&v13 = (float)(v14 + v15) * 0.5;
          -[VCCamera setZoomFactor:](self->_outputCamera, "setZoomFactor:", v13);
          if (self->_fisheyeEffectEnabled)
            -[VCProcessor _updateOutputCameraFisheyeEffect](self, "_updateOutputCameraFisheyeEffect");
          if (isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0))
            v15 = (float)(v14 + v15) * 0.5;
          else
            v14 = (float)(v14 + v15) * 0.5;
        }
        while (vabds_f32(v14, v15) > 0.001);
      }
      *(float *)&v13 = v15;
      -[VCCamera setZoomFactor:](self->_outputCamera, "setZoomFactor:", v13);
    }
    -[VCCamera setRotation:](self->_outputCamera, "setRotation:", *(double *)&v29);
    if ((isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0) & 1) == 0)
    {
      -[VCCamera rotation](self->_outputCamera, "rotation");
      v31 = v17;
      -[VCCamera rotation](self->_inputCamera, "rotation");
      v18 = v31;
      v19.i32[2] = DWORD2(v29);
      for (i = 21; ; --i)
      {
        v21 = vsubq_f32(v18, v19);
        v22 = vmulq_f32(v21, v21);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]) <= 0.001|| i == 0)
        {
          break;
        }
        v30 = (int8x16_t)v19;
        v32 = (int8x16_t)v18;
        v24.i64[0] = 0x3F0000003F000000;
        v24.i64[1] = 0x3F0000003F000000;
        v28 = (int8x16_t)vmulq_f32(vaddq_f32(v18, v19), v24);
        -[VCCamera setRotation:](self->_outputCamera, "setRotation:");
        if (self->_rollCorrectionEnabled)
          -[VCProcessor _updateOutputCameraForRollCorrection](self, "_updateOutputCameraForRollCorrection");
        if (isViewFrustumContained(self->_outputCamera, self->_inputCamera, 0.0))
          v25 = -1;
        else
          v25 = 0;
        v26 = (int8x16_t)vdupq_n_s32(v25);
        v18 = (float32x4_t)vbslq_s8(v26, v32, v28);
        v19 = (float32x4_t)vbslq_s8(v26, v28, v30);
      }
      -[VCCamera setRotation:](self->_outputCamera, "setRotation:");
      if (self->_rollCorrectionEnabled)
        -[VCProcessor _updateOutputCameraForRollCorrection](self, "_updateOutputCameraForRollCorrection");
    }
  }
  return 0;
}

- (unint64_t)_metalTextureFormatFromPixelBufferFormat:(unsigned int)a3 forPlane:(unsigned int)a4
{
  int v4;
  int v5;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;

  if ((int)a3 > 875704421)
  {
    if ((int)a3 <= 1885745711)
    {
      if ((int)a3 <= 1278226535)
      {
        if (a3 != 875704422 && a3 != 875704438)
        {
          if (a3 == 1278226534)
            return 55;
          return 0;
        }
        goto LABEL_36;
      }
      if (a3 == 1278226536)
        return 25;
      if (a3 == 1751527984)
      {
        v7 = a4 == 0;
        v8 = 65;
        v9 = 25;
LABEL_37:
        if (v7)
          return v9;
        else
          return v8;
      }
      v5 = 1882468912;
      goto LABEL_42;
    }
    if ((int)a3 <= 2084070959)
    {
      if (a3 != 1885745712)
      {
        if (a3 != 2016686640 && a3 != 2019963440)
          return 0;
        v7 = a4 == 0;
        v8 = 60;
        v9 = 20;
        goto LABEL_37;
      }
    }
    else
    {
      if ((int)a3 <= 2088265263)
      {
        if (a3 != 2084070960)
        {
          v4 = 2084075056;
          goto LABEL_28;
        }
LABEL_36:
        v7 = a4 == 0;
        v8 = 30;
        v9 = 10;
        goto LABEL_37;
      }
      if (a3 != 2088265264)
      {
        v5 = 2088269360;
LABEL_42:
        if (a3 != v5)
          return 0;
        goto LABEL_43;
      }
    }
    goto LABEL_43;
  }
  if ((int)a3 <= 762865199)
  {
    if ((int)a3 <= 645428783)
    {
      if (a3 == 641230384 || a3 == 641234480)
        goto LABEL_36;
      v5 = 645424688;
      goto LABEL_42;
    }
    if (a3 == 645428784)
      goto LABEL_43;
    if (a3 == 758670896)
      goto LABEL_36;
    v4 = 758674992;
LABEL_28:
    if (a3 != v4)
      return 0;
    goto LABEL_36;
  }
  if ((int)a3 <= 792229423)
  {
    if (a3 == 762865200 || a3 == 762869296)
      goto LABEL_43;
    v4 = 792225328;
    goto LABEL_28;
  }
  if (a3 == 792229424)
    goto LABEL_36;
  if (a3 != 796419632)
  {
    v5 = 796423728;
    goto LABEL_42;
  }
LABEL_43:
  if (a4)
    return 589;
  else
    return 588;
}

- (id)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  id v4;
  VCProcessor *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t PixelFormatType;
  size_t v9;
  char v10;
  VCProcessor *v11;
  uint64_t v12;
  MTLPixelFormat v13;
  unsigned int WidthOfPlane;
  unsigned int HeightOfPlane;
  void *v16;
  const __CFDictionary *v17;
  void *v18;
  void *v19;
  BOOL v20;
  char v21;
  int v23;
  const __CFAllocator *allocator;
  uint64_t v25;
  void *v27;
  CVMetalTextureRef image;
  uint64_t v30;
  _QWORD v31[2];

  v4 = 0;
  v31[1] = *MEMORY[0x1E0C80C00];
  image = 0;
  if (a3)
  {
    v5 = self;
    v27 = 0;
    v6 = 0;
    if (self->_cvMetalTextureCacheRef)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      if (v7)
      {
        PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        v27 = (void *)v7;
        v9 = 0;
        v6 = 0;
        v23 = (PixelFormatType - 1278226534) & 0xFFFFFFFD;
        allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v25 = *MEMORY[0x1E0CA8F58];
        v10 = 1;
        while (1)
        {
          v11 = v5;
          v12 = PixelFormatType;
          v13 = -[VCProcessor _metalTextureFormatFromPixelBufferFormat:forPlane:](v5, "_metalTextureFormatFromPixelBufferFormat:forPlane:", PixelFormatType, v9);
          if (v13 == MTLPixelFormatInvalid)
            break;
          WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v9);
          HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v9);
          v30 = v25;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
          v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          v6 = v17;
          if (CVMetalTextureCacheCreateTextureFromImage(allocator, v11->_cvMetalTextureCacheRef, a3, v17, v13, WidthOfPlane, HeightOfPlane, v9, &image))
          {
            break;
          }
          CVMetalTextureGetTexture(image);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:atIndexedSubscript:", v18, v9);

          objc_msgSend(v27, "objectAtIndexedSubscript:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
            break;
          if (image)
            CFRelease(image);
          v21 = (v23 != 0) & v10;
          v9 = 1;
          v10 = 0;
          PixelFormatType = v12;
          v5 = v11;
          if ((v21 & 1) == 0)
          {
            v4 = v27;
            v27 = v4;
            goto LABEL_12;
          }
        }
        if (image)
          CFRelease(image);
        v4 = 0;
      }
      else
      {
        v4 = 0;
        v27 = 0;
        v6 = 0;
      }
    }
  }
  else
  {
    v27 = 0;
    v6 = 0;
  }
LABEL_12:

  return v4;
}

- (id)_bindCVPixleBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  uint64_t PixelFormatType;
  size_t PlaneCount;
  uint64_t v12;
  void *v13;

  -[VCProcessor _cachedTexturesFromPixelBuffer:usage:](self, "_cachedTexturesFromPixelBuffer:usage:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    PlaneCount = CVPixelBufferGetPlaneCount(a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", PlaneCount);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (PlaneCount)
    {
      v12 = 0;
      while (1)
      {
        -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_context, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, -[VCProcessor _metalTextureFormatFromPixelBufferFormat:forPlane:](self, "_metalTextureFormatFromPixelBufferFormat:forPlane:", PixelFormatType, v12), a4, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          break;
        objc_msgSend(v9, "addObject:", v13);

        if (PlaneCount == ++v12)
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      if (objc_msgSend(v9, "count") != PlaneCount)
      {

        v9 = 0;
      }
    }
  }

  return v9;
}

- (int)_fillRenderParams:(id *)a3
{
  VCCamera *v5;
  VCCamera *outputCamera;
  VCCamera *v7;
  CGSize v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  size_t Width;
  size_t Height;
  uint64x2_t v18;
  float64x2_t v19;
  float32x2_t v20;
  $470D365275581EF16070F5A11344F73E outputDimensions;
  int64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v26;
  float64x2_t v28;
  CGRect v30;

  -[VCCameraAnimator animatedCamera](self->_outputCameraAnimator, "animatedCamera");
  v5 = (VCCamera *)objc_claimAutoreleasedReturnValue();
  outputCamera = v5;
  if (!v5)
    outputCamera = self->_outputCamera;
  v7 = outputCamera;

  memcpy(a3, -[VCCamera model](self->_inputCamera, "model"), 0x160uLL);
  memcpy(&a3[2].var0.var7.var1, -[VCCamera model](v7, "model"), 0x160uLL);
  v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v30.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v30.size = v8;
  v9 = (const __CFDictionary *)CVBufferCopyAttachment(self->_inputPixelBuffer, (CFStringRef)*MEMORY[0x1E0D06F48], 0);
  v10 = v9;
  if (v9)
  {
    CGRectMakeWithDictionaryRepresentation(v9, &v30);
    CFRelease(v10);
  }
  *(_QWORD *)&a3[4].var0.var7.var5 = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&a3[4].var0.var7.var7 = _D0;
  if (!CGRectIsNull(v30))
  {
    Width = CVPixelBufferGetWidth(self->_inputPixelBuffer);
    Height = CVPixelBufferGetHeight(self->_inputPixelBuffer);
    v18.i64[0] = Width;
    v18.i64[1] = Height;
    v19 = vcvtq_f64_f32(vcvt_f32_f64(vcvtq_f64_u64(v18)));
    v20 = vcvt_f32_f64(vdivq_f64((float64x2_t)v30.origin, v19));
    *(float32x2_t *)&v19.f64[0] = vcvt_f32_f64(vdivq_f64((float64x2_t)v30.size, v19));
    *(float32x2_t *)&a3[4].var0.var7.var5 = v20;
    *(float64_t *)&a3[4].var0.var7.var7 = v19.f64[0];
  }
  outputDimensions = self->_outputDimensions;
  v22.i64[0] = outputDimensions.width;
  v22.i64[1] = outputDimensions.height;
  v23 = vcvtq_f64_s64(v22);
  v24 = vmulq_f64((float64x2_t)self->_outputROI.origin, v23);
  __asm { FMOV            V3.2D, #10.0 }
  v26 = vaddq_f64(vaddq_f64(v24, vmulq_f64((float64x2_t)self->_outputROI.size, v23)), _Q3);
  __asm { FMOV            V3.2D, #-10.0 }
  v28 = vmaxnmq_f64(vaddq_f64(v24, _Q3), (float64x2_t)0);
  *(float32x2_t *)&a3[4].var0.var9.var0 = vcvt_f32_f64(vdivq_f64(v28, v23));
  *(float32x2_t *)&a3[4].var0.var9.var2 = vcvt_f32_f64(vdivq_f64(vsubq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v23, v26), (int8x16_t)v26, (int8x16_t)v23), v28), v23));

  return 0;
}

- (int)_encodeRender:(id)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  int64x2_t v20;
  uint64_t v21;
  _QWORD v22[3];
  _BYTE v23[736];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[VCProcessor _fillRenderParams:](self, "_fillRenderParams:", v23);
  if (!v17)
  {
    -[VCShaders objectAtIndexedSubscript:](self->_shaders, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setComputePipelineState:", v18);

    objc_msgSend(v12, "setTexture:atIndex:", v13, 0);
    objc_msgSend(v12, "setTexture:atIndex:", v14, 1);
    objc_msgSend(v12, "setTexture:atIndex:", v15, 2);
    objc_msgSend(v12, "setTexture:atIndex:", v16, 3);
    objc_msgSend(v12, "setBytes:length:atIndex:", v23, 736, 0);
    objc_msgSend(v12, "setImageblockWidth:height:", 32, 32);
    v22[0] = objc_msgSend(v15, "width");
    v22[1] = objc_msgSend(v15, "height");
    v22[2] = 1;
    v20 = vdupq_n_s64(0x20uLL);
    v21 = 1;
    objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v22, &v20);
  }

  return v17;
}

- (int)_encodeDownsample:(id)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int64x2_t v19;
  uint64_t v20;
  _QWORD v21[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[VCShaders objectAtIndexedSubscript:](self->_shaders, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setComputePipelineState:", v17);

  objc_msgSend(v12, "setTexture:atIndex:", v13, 0);
  objc_msgSend(v12, "setTexture:atIndex:", v14, 1);
  objc_msgSend(v12, "setTexture:atIndex:", v15, 2);
  objc_msgSend(v12, "setTexture:atIndex:", v16, 3);
  objc_msgSend(v12, "setImageblockWidth:height:", 32, 32);
  v21[0] = objc_msgSend(v15, "width");
  v21[1] = objc_msgSend(v15, "height");
  v21[2] = 1;
  v19 = vdupq_n_s64(0x20uLL);
  v20 = 1;
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v21, &v19);

  return 0;
}

- (int)_createRenderTargetForOutputLumaTex:(id)a3 outputChromaTex:(id)a4 renderTargetLumaTex:(id *)a5 renderTargetChromaTex:(id *)a6
{
  id v10;
  id v11;
  size_t Width;
  size_t Height;
  __CVBuffer *inputPixelBuffer;
  size_t v15;
  unint64_t v16;
  size_t v17;
  size_t v18;
  __CVBuffer *outputPixelBuffer;
  size_t v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;

  v10 = a3;
  v11 = a4;
  Width = CVPixelBufferGetWidth(self->_inputPixelBuffer);
  Height = CVPixelBufferGetHeight(self->_inputPixelBuffer);
  inputPixelBuffer = self->_inputPixelBuffer;
  if (Width >= Height)
    v15 = CVPixelBufferGetHeight(inputPixelBuffer);
  else
    v15 = CVPixelBufferGetWidth(inputPixelBuffer);
  v16 = v15;
  v17 = CVPixelBufferGetWidth(self->_outputPixelBuffer);
  v18 = CVPixelBufferGetHeight(self->_outputPixelBuffer);
  outputPixelBuffer = self->_outputPixelBuffer;
  if (v17 >= v18)
    v20 = CVPixelBufferGetHeight(outputPixelBuffer);
  else
    v20 = CVPixelBufferGetWidth(outputPixelBuffer);
  v21 = llroundf(log2f((float)v16 / (float)v20));
  if (v21 <= 1)
    v21 = 1;
  if (v21 <= 5)
    v22 = v21 - 1;
  else
    v22 = 4;
  if (v22)
  {
    -[FigMetalContext allocator](self->_context, "allocator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "newTextureDescriptor");

    objc_msgSend(v24, "setLabel:", 0);
    v25 = objc_msgSend(v10, "pixelFormat");
    objc_msgSend(v24, "desc");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPixelFormat:", v25);

    v27 = objc_msgSend(v10, "width");
    objc_msgSend(v24, "desc");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWidth:", v27 << v22);

    v29 = objc_msgSend(v10, "height");
    objc_msgSend(v24, "desc");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHeight:", v29 << v22);

    objc_msgSend(v24, "desc");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setUsage:", 7);

    -[FigMetalContext allocator](self->_context, "allocator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "newTextureWithDescriptor:", v24);

    objc_msgSend(v24, "setLabel:", 0);
    v34 = objc_msgSend(v11, "pixelFormat");
    objc_msgSend(v24, "desc");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPixelFormat:", v34);

    v36 = objc_msgSend(v11, "width");
    objc_msgSend(v24, "desc");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWidth:", v36 << v22);

    v38 = objc_msgSend(v11, "height");
    objc_msgSend(v24, "desc");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHeight:", v38 << v22);

    objc_msgSend(v24, "desc");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setUsage:", 7);

    -[FigMetalContext allocator](self->_context, "allocator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "newTextureWithDescriptor:", v24);

    v43 = -1;
    if (v33 && v42)
    {
      *a5 = objc_retainAutorelease(v33);
      v43 = 0;
      *a6 = objc_retainAutorelease(v42);
    }

  }
  else
  {
    FigMetalIncRef();
    FigMetalIncRef();
    *a5 = objc_retainAutorelease(v10);
    v43 = 0;
    *a6 = objc_retainAutorelease(v11);
  }

  return v43;
}

- (int)_encodeRenderTargetResolve:(id)a3 renderTargetLumaTex:(id)a4 renderTargetChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id i;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  id v42;
  void *v44;
  id v45;
  id v46;
  id location;

  v12 = a3;
  v13 = a4;
  v45 = a5;
  v14 = a6;
  v15 = a7;
  v46 = 0;
  location = 0;
  v44 = v13;
  if (v13 == v14)
  {
    v40 = 0;
  }
  else
  {
    FigMetalIncRef();
    FigMetalIncRef();
    objc_storeStrong(&location, a4);
    objc_storeStrong(&v46, a5);
    v16 = 0;
    v17 = 0;
    for (i = v13; ; i = location)
    {
      v19 = objc_msgSend(i, "width", v44);
      if (objc_msgSend(v14, "width") >= v19 >> 1)
      {
        v41 = v14;

        v42 = v15;
        v16 = v41;
        v17 = v42;
      }
      else
      {
        -[FigMetalContext allocator](self->_context, "allocator");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "newTextureDescriptor");

        objc_msgSend(v21, "setLabel:", 0);
        v22 = objc_msgSend(location, "pixelFormat");
        objc_msgSend(v21, "desc");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setPixelFormat:", v22);

        v24 = objc_msgSend(location, "width");
        objc_msgSend(v21, "desc");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setWidth:", v24 >> 1);

        v26 = objc_msgSend(location, "height");
        objc_msgSend(v21, "desc");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setHeight:", v26 >> 1);

        objc_msgSend(v21, "desc");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setUsage:", 7);

        -[FigMetalContext allocator](self->_context, "allocator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "newTextureWithDescriptor:", v21);

        objc_msgSend(v21, "setLabel:", 0);
        v31 = objc_msgSend(v46, "pixelFormat");
        objc_msgSend(v21, "desc");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setPixelFormat:", v31);

        v33 = objc_msgSend(v46, "width");
        objc_msgSend(v21, "desc");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setWidth:", v33 >> 1);

        v35 = objc_msgSend(v46, "height");
        objc_msgSend(v21, "desc");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setHeight:", v35 >> 1);

        objc_msgSend(v21, "desc");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setUsage:", 7);

        -[FigMetalContext allocator](self->_context, "allocator");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v38, "newTextureWithDescriptor:", v21);

        v40 = -1;
        if (!v30)
          goto LABEL_13;
        v16 = v30;
        v17 = v39;
        if (!v39)
          goto LABEL_13;
      }
      v40 = -[VCProcessor _encodeDownsample:inputLumaTex:inputChromaTex:outputLumaTex:outputChromaTex:](self, "_encodeDownsample:inputLumaTex:inputChromaTex:outputLumaTex:outputChromaTex:", v12, location, v46, v16, v17);
      if (v40)
        break;
      FigMetalDecRef();
      FigMetalDecRef();
      if (v16 == v14)
      {
        v40 = 0;
        v30 = v14;
        goto LABEL_12;
      }
      objc_storeStrong(&location, v16);
      objc_storeStrong(&v46, v17);
    }
    v30 = v16;
LABEL_12:
    v39 = v17;
LABEL_13:

  }
  return v40;
}

- (int)_render
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v23 = 0;
  v24 = 0;
  if (!self->_centerStagePassthrough || !self->_autoFramingEnabled)
  {
    -[VCProcessor _bindCVPixleBuffer:usage:](self, "_bindCVPixleBuffer:usage:", self->_inputPixelBuffer, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "count") == 2)
    {
      -[VCProcessor _bindCVPixleBuffer:usage:](self, "_bindCVPixleBuffer:usage:", self->_outputPixelBuffer, 7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && objc_msgSend(v11, "count") == 2)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v13 = objc_claimAutoreleasedReturnValue();

        v21 = 0;
        v22 = 0;
        v20 = (void *)v13;
        v4 = -[VCProcessor _createRenderTargetForOutputLumaTex:outputChromaTex:renderTargetLumaTex:renderTargetChromaTex:](self, "_createRenderTargetForOutputLumaTex:outputChromaTex:renderTargetLumaTex:renderTargetChromaTex:", v6, v13, &v22, &v21);
        v14 = v22;
        v24 = v14;
        v15 = v21;
        v23 = v15;
        if (v4)
        {
          v7 = 0;
          v8 = 0;
          goto LABEL_15;
        }
        v16 = v15;
        -[FigMetalContext commandQueue](self->_context, "commandQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "commandBuffer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          v4 = FigSignalErrorAt();
          v8 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v7, "computeCommandEncoder");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v4 = -[VCProcessor _encodeRender:inputLumaTex:inputChromaTex:outputLumaTex:outputChromaTex:](self, "_encodeRender:inputLumaTex:inputChromaTex:outputLumaTex:outputChromaTex:", v18, v3, v5, v14, v16);
          if (!v4)
          {
            v4 = -[VCProcessor _encodeRenderTargetResolve:renderTargetLumaTex:renderTargetChromaTex:outputLumaTex:outputChromaTex:](self, "_encodeRenderTargetResolve:renderTargetLumaTex:renderTargetChromaTex:outputLumaTex:outputChromaTex:", v18, v14, v16, v6, v20);
            if (!v4)
            {
              objc_msgSend(v18, "endEncoding");
              objc_msgSend(v7, "commit");
              v4 = 0;
            }
          }
          v8 = v18;
          goto LABEL_15;
        }
LABEL_19:
        v8 = 0;
        v4 = -1;
LABEL_15:
        FigMetalDecRef();
        FigMetalDecRef();
        goto LABEL_16;
      }

    }
    v20 = 0;
    v6 = 0;
    v5 = 0;
    v3 = 0;
    v7 = 0;
    goto LABEL_19;
  }
  v3 = 0;
  v4 = -[CinematicFramingSession processPixelBuffer:outputPixelBuffer:](self->_framingSession, "processPixelBuffer:outputPixelBuffer:", self->_inputPixelBuffer, self->_outputPixelBuffer);
  v5 = 0;
  v6 = 0;
  v20 = 0;
  v7 = 0;
  v8 = 0;
LABEL_16:

  return v4;
}

- (int)_setOutputPixelBufferAttachments
{
  VCProcessor *v2;
  void *v3;
  void *v4;
  void *DeepCopy;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  int v19;
  VCProcessor *v21;
  void *v22;
  void *v23;
  const __CFString *key;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v2 = self;
  v42 = *MEMORY[0x1E0C80C00];
  key = (const __CFString *)*MEMORY[0x1E0D05DD8];
  v3 = (void *)CVBufferCopyAttachment(self->_outputPixelBuffer, (CFStringRef)*MEMORY[0x1E0D05DD8], 0);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_27;
  }
  -[CinematicFramingSessionInputMetadata detectedObjectsInfo](v2->_inputMetadata, "detectedObjectsInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v23 = v3;
    -[CinematicFramingSessionInputMetadata detectedObjectsInfo](v2->_inputMetadata, "detectedObjectsInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v22, 1uLL);
    if (DeepCopy)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __47__VCProcessor__setOutputPixelBufferAttachments__block_invoke;
      v39[3] = &unk_1E98A7710;
      v21 = v2;
      v39[4] = v2;
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D826A570](v39);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = DeepCopy;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v7)
      {
        v26 = *(_QWORD *)v36;
        v25 = *MEMORY[0x1E0D064D0];
        v8 = *MEMORY[0x1E0D06D58];
        v9 = *MEMORY[0x1E0D064A0];
        v30 = *MEMORY[0x1E0D06C08];
        v10 = *MEMORY[0x1E0D06D68];
        do
        {
          v11 = 0;
          v27 = v7;
          do
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend(obj, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v25);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = v11;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v32;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v32 != v16)
                    objc_enumerationMutation(v14);
                  v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
                  v6[2](v6, v18, v8);
                  if (objc_msgSend(v12, "isEqual:", v9))
                  {
                    v6[2](v6, v18, v30);
                    v6[2](v6, v18, v10);
                  }
                }
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              }
              while (v15);
            }

            v11 = v29 + 1;
          }
          while (v29 + 1 != v27);
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v7);
      }

      objc_msgSend(v23, "setObject:forKeyedSubscript:", obj, *MEMORY[0x1E0D069A0]);
      v3 = v23;
      v2 = v21;
      goto LABEL_22;
    }

LABEL_27:
    v19 = -1;
    goto LABEL_25;
  }
LABEL_22:
  if (!v2->_autoFramingEnabled)
    objc_msgSend(v3, "setValuesForKeysWithDictionary:", v2->_manualFramingStateMetadata);
  CVBufferSetAttachment(v2->_outputPixelBuffer, key, v3, kCVAttachmentMode_ShouldPropagate);
  v19 = 0;
LABEL_25:

  return v19;
}

void __47__VCProcessor__setOutputPixelBufferAttachments__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const __CFDictionary *v7;
  _BOOL4 v8;
  CFDictionaryRef DictionaryRepresentation;
  CGRect v10;
  CGRect v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = CGRectMakeWithDictionaryRepresentation(v7, &v10);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "warpCGRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    v10 = v11;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v11);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", DictionaryRepresentation, v6);

  }
}

- (id)cameraSwitchingDelegate
{
  return self->_cameraSwitchingDelegate;
}

- (void)setCameraSwitchingDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_cameraSwitchingDelegate, a3);
}

- (id)auxiliaryStreamCamera
{
  return self->_auxiliaryStreamCamera;
}

- (void)setAuxilaryStreamCamera:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryStreamCamera, a3);
}

- (int)checkCameraSwitchingWithAuxilaryStreamMetadata:(id)a3
{
  id v4;
  VCCamera *auxiliaryStreamCamera;
  VCCamera *v6;
  VCCamera *v7;
  int v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  int v14;
  int v15;
  double v16;
  void *v17;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  VCProcessorCameraSwitchingDelegate *cameraSwitchingDelegate;
  void *v29;

  v4 = a3;
  auxiliaryStreamCamera = self->_auxiliaryStreamCamera;
  if (auxiliaryStreamCamera)
    v6 = auxiliaryStreamCamera;
  else
    v6 = objc_alloc_init(VCCamera);
  v7 = self->_auxiliaryStreamCamera;
  self->_auxiliaryStreamCamera = v6;

  v8 = -[VCProcessor _updateCamera:withMetadata:](self, "_updateCamera:withMetadata:", self->_auxiliaryStreamCamera, v4);
  if (v8)
    goto LABEL_22;
  -[VCTuningParameters wideToSuperWideSwitchMargin](self->_tuning, "wideToSuperWideSwitchMargin");
  v10 = v9;
  -[VCTuningParameters superWideToWideSwitchMargin](self->_tuning, "superWideToWideSwitchMargin");
  if (v10 >= v11)
    v12 = 0.0;
  else
    v12 = v10;
  if (v10 >= v11)
    v13 = 0.0;
  else
    v13 = v11;
  -[VCCamera zoomFactor](self->_outputCamera, "zoomFactor");
  v15 = v14;
  LODWORD(v16) = 1.0;
  -[VCCamera setZoomFactor:](self->_outputCamera, "setZoomFactor:", v16);
  -[VCCamera portType](self->_inputCamera, "portType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D05A28];
  v19 = objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0D05A28]);
  v20 = (_QWORD *)MEMORY[0x1E0D05A18];
  if ((v19 & 1) == 0)
  {

    goto LABEL_15;
  }
  -[VCCamera portType](self->_auxiliaryStreamCamera, "portType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqual:", *v20);

  if (!v22)
  {
LABEL_15:
    v23 = 0;
    goto LABEL_16;
  }
  v23 = isViewFrustumContained(self->_outputCamera, self->_auxiliaryStreamCamera, v13);
LABEL_16:
  -[VCCamera portType](self->_inputCamera, "portType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqual:", *v20) & 1) != 0)
  {
    -[VCCamera portType](self->_auxiliaryStreamCamera, "portType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqual:", v18);

    if (v26)
      v23 = isViewFrustumContained(self->_outputCamera, self->_inputCamera, v12) ^ 1;
  }
  else
  {

  }
  LODWORD(v27) = v15;
  -[VCCamera setZoomFactor:](self->_outputCamera, "setZoomFactor:", v27);
  if (v23)
  {
    cameraSwitchingDelegate = self->_cameraSwitchingDelegate;
    -[VCCamera portType](self->_auxiliaryStreamCamera, "portType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCProcessorCameraSwitchingDelegate processor:wantsActiveStreamPortType:](cameraSwitchingDelegate, "processor:wantsActiveStreamPortType:", self, v29);

  }
LABEL_22:

  return v8;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (void)setOutputDimensions:(id)a3
{
  self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  self->_inputPixelBuffer = a3;
}

- (CinematicFramingSessionInputMetadata)inputMetadata
{
  return self->_inputMetadata;
}

- (void)setInputMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_inputMetadata, a3);
}

- (VCCamera)inputCamera
{
  return self->_inputCamera;
}

- (void)setInputCamera:(id)a3
{
  objc_storeStrong((id *)&self->_inputCamera, a3);
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  self->_outputPixelBuffer = a3;
}

- (VCCamera)outputCamera
{
  return self->_outputCamera;
}

- (void)setOutputCamera:(id)a3
{
  objc_storeStrong((id *)&self->_outputCamera, a3);
}

- (CGRect)outputROI
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_outputROI.origin.x;
  y = self->_outputROI.origin.y;
  width = self->_outputROI.size.width;
  height = self->_outputROI.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)orientationCorrectionEnabled
{
  return self->_orientationCorrectionEnabled;
}

- (BOOL)rollCorrectionEnabled
{
  return self->_rollCorrectionEnabled;
}

- (void)setRollCorrectionEnabled:(BOOL)a3
{
  self->_rollCorrectionEnabled = a3;
}

- (BOOL)confineOutputCamera
{
  return self->_confineOutputCamera;
}

- (void)setConfineOutputCamera:(BOOL)a3
{
  self->_confineOutputCamera = a3;
}

- (BOOL)fisheyeEffectEnabled
{
  return self->_fisheyeEffectEnabled;
}

- (void)setFisheyeEffectEnabled:(BOOL)a3
{
  self->_fisheyeEffectEnabled = a3;
}

- (float)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (BOOL)attachMetadataToOutputPixelBuffer
{
  return self->_attachMetadataToOutputPixelBuffer;
}

- (void)setAttachMetadataToOutputPixelBuffer:(BOOL)a3
{
  self->_attachMetadataToOutputPixelBuffer = a3;
}

- (BOOL)outputCameraResetCompleted
{
  return self->_outputCameraResetCompleted;
}

- (BOOL)oneShotFramingCompleted
{
  return self->_oneShotFramingCompleted;
}

- (float)manualFramingDefaultVideoZoomFactor
{
  return self->_manualFramingDefaultVideoZoomFactor;
}

- (__n128)outputCameraDefaultRotation
{
  return a1[14];
}

- (NSDictionary)manualFramingStateMetadata
{
  return self->_manualFramingStateMetadata;
}

- (BOOL)autoFramingEnabled
{
  return self->_autoFramingEnabled;
}

- (BOOL)autoRestoreManualFramingState
{
  return self->_autoRestoreManualFramingState;
}

- (void)setAutoRestoreManualFramingState:(BOOL)a3
{
  self->_autoRestoreManualFramingState = a3;
}

- (CinematicFramingSession)framingSession
{
  return self->_framingSession;
}

- (BOOL)centerStagePassthrough
{
  return self->_centerStagePassthrough;
}

- (void)setCenterStagePassthrough:(BOOL)a3
{
  self->_centerStagePassthrough = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framingSession, 0);
  objc_storeStrong((id *)&self->_manualFramingStateMetadata, 0);
  objc_storeStrong((id *)&self->_outputCamera, 0);
  objc_storeStrong((id *)&self->_inputCamera, 0);
  objc_storeStrong((id *)&self->_inputMetadata, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_cameraSwitchingDelegate, 0);
  objc_storeStrong((id *)&self->_auxiliaryStreamCamera, 0);
  objc_storeStrong((id *)&self->_outputCameraAnimator, 0);
  objc_storeStrong((id *)&self->_tuning, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
