@implementation CinematicFramingRenderer

- (CinematicFramingRenderer)initWithOutputDimensions:(id)a3
{
  CinematicFramingRenderer *v4;
  CinematicFramingRenderer *v5;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  CinematicFramingRenderer *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CinematicFramingRenderer;
  v4 = -[CinematicFramingRenderer init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    *(_OWORD *)v4->_gravity = xmmword_1D4E43A80;
    v4->_additionalCameraRotation = 0.0;
    -[CinematicFramingRenderer initializeMetal](v4, "initializeMetal");
    -[CinematicFramingRenderer setCameraOrientation:](v5, "setCameraOrientation:", 0);
    v5->_outputROI.origin.x = 0.0;
    v5->_outputROI.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v5->_outputROI.size = _Q0;
    *(_QWORD *)&v5->_stereographicFisheyeF = 0x3F59999A3FA28F5CLL;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = v5->_kalmanFilterManager[0];
    v5->_kalmanFilterManager[0] = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = v5->_kalmanFilterManager[1];
    v5->_kalmanFilterManager[1] = v13;

    v5->_frontCameraHas180DegreesRotation = 1;
    v15 = v5;
  }

  return v5;
}

- (void)dealloc
{
  __CVMetalTextureCache *cvMetalTextureCacheRef;
  objc_super v4;

  -[CinematicFramingRenderer finish](self, "finish");
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
    CFRelease(cvMetalTextureCacheRef);
  v4.receiver = self;
  v4.super_class = (Class)CinematicFramingRenderer;
  -[CinematicFramingRenderer dealloc](&v4, sel_dealloc);
}

- (BOOL)isFrontCamera
{
  return self->_isFrontCamera;
}

- (void)setIsFrontCamera:(BOOL)a3
{
  self->_isFrontCamera = a3;
  self->_numCCWRotationsFromInputToFramingSpace = computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(self->_cameraOrientation, a3, self->_frontCameraHas180DegreesRotation);
}

- (int)cameraOrientation
{
  return self->_cameraOrientation;
}

- (void)setCameraOrientation:(int)a3
{
  self->_cameraOrientation = a3;
  self->_numCCWRotationsFromInputToFramingSpace = computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(a3, self->_isFrontCamera, self->_frontCameraHas180DegreesRotation);
}

- (CGRect)computeNewCoordinatesInOrientation:(int)a3 forViewportInCurrentOrientation:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a3)
  {
    v8 = computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(a3, self->_isFrontCamera, self->_frontCameraHas180DegreesRotation)- self->_numCCWRotationsFromInputToFramingSpace+ 4;
    v9 = v8 & 3;
    v11 = -v8;
    v10 = v11 < 0;
    v12 = v11 & 3;
    if (v10)
      v13 = v9;
    else
      v13 = -v12;
    x = rotateRectCCW(v13, x, y, width, height);
    y = v14;
    width = v15;
    height = v16;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (int)registerCalibrationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  int32x4_t v15;
  int32x4_t v16;
  __int128 v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  BOOL v31;
  unsigned __int8 v32;
  int v33;
  int v34;
  _OWORD *v35;
  __int128 v36;
  _OWORD *v37;
  __int128 v38;

  if (!a3)
    return -12780;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrixReferenceDimensions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Width"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  *(_DWORD *)self->_anon_90 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrixReferenceDimensions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Height"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  *(_DWORD *)&self->_anon_90[4] = v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrix"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (_OWORD *)objc_msgSend(v11, "bytes");
  v14 = v12[1];
  v13 = v12[2];
  *(_OWORD *)&self->_anon_90[16] = *v12;
  *(_OWORD *)&self->_anon_90[32] = v14;
  *(_OWORD *)&self->_anon_90[48] = v13;
  v15 = *(int32x4_t *)&self->_anon_90[16];
  v16 = *(int32x4_t *)&self->_anon_90[32];
  v17 = *(_OWORD *)&self->_anon_90[48];
  *(_DWORD *)&self->_anon_90[24] = v17;
  *(_DWORD *)&self->_anon_90[40] = DWORD1(v17);
  *(_QWORD *)&self->_anon_90[16] = vzip1q_s32(v15, v16).u64[0];
  *(_QWORD *)&self->_anon_90[32] = vtrn2q_s32(v15, v16).u64[0];
  *(_DWORD *)&self->_anon_90[56] = DWORD2(v17);
  *(_QWORD *)&self->_anon_90[48] = vzip1q_s32(vdupq_laneq_s32(v15, 2), vdupq_laneq_s32(v16, 2)).u64[0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PixelSize"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  *(float *)&self->_anon_90[80] = v20 * v20;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DistortionCalibrationValidMaxRadiusInPixels"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LensDistortionCenter"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("X"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LensDistortionCenter"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Y"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LensDistortionCoefficients"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InverseLensDistortionCoefficients"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    v28 = v23 == 0;
  else
    v28 = 1;
  v31 = v28 || v25 == 0 || v26 == 0 || v27 == 0;
  v32 = !v31;
  self->_anon_90[64] = v32;
  if (v31)
  {
    *(_DWORD *)&self->_anon_90[84] = 0;
    *(_QWORD *)&self->_anon_90[72] = 0;
    v38 = 0uLL;
    *(_OWORD *)&self->_anon_90[120] = 0u;
    *(_OWORD *)&self->_anon_90[136] = 0u;
    *(_OWORD *)&self->_anon_90[88] = 0u;
  }
  else
  {
    *(_DWORD *)&self->_anon_90[84] = objc_msgSend(v21, "intValue");
    objc_msgSend(v23, "floatValue");
    *(_DWORD *)&self->_anon_90[72] = v33;
    objc_msgSend(v25, "floatValue");
    *(_DWORD *)&self->_anon_90[76] = v34;
    v35 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v26), "bytes");
    v36 = v35[1];
    *(_OWORD *)&self->_anon_90[120] = *v35;
    *(_OWORD *)&self->_anon_90[136] = v36;
    v37 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v27), "bytes");
    v38 = v37[1];
    *(_OWORD *)&self->_anon_90[88] = *v37;
  }
  *(_OWORD *)&self->_anon_90[104] = v38;

  return 0;
}

- (void)registerGravityX:(float)a3 y:(float)a4 z:(float)a5
{
  int32x4_t v7;
  float32x2_t v8;
  float32x2_t v9;

  v7 = (int32x4_t)vmulq_f32(*(float32x4_t *)&a3, *(float32x4_t *)&a3);
  v7.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1))).u32[0];
  v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
  v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
  *(float32x4_t *)self->_gravity = vmulq_n_f32(*(float32x4_t *)&a3, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]);
}

- (void)registerAdditionalCameraRotation:(float)a3
{
  self->_additionalCameraRotation = a3;
}

- (void)registerSensorID:(int)a3
{
  self->_sensorID = a3;
}

- (int)processBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 outputPixelBuffer:(__CVBuffer *)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  OSType PixelFormatType;
  OSType v16;
  int v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  MTLComputePipelineState **pipelineComputeStates;
  MTLComputePipelineState *v23;
  MTLComputePipelineState *v24;
  void *v25;
  int width;
  double height;
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
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v50[3];
  _QWORD v51[3];
  _OWORD v52[10];
  _DWORD v53[2];
  id v54;
  id v55;
  _BYTE v56[8];
  id v57;
  id v58;

  v57 = 0;
  v58 = 0;
  v54 = 0;
  v55 = 0;
  v8 = rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if ((PixelFormatIs420(PixelFormatType) & 1) == 0
    || (v16 = CVPixelBufferGetPixelFormatType(a5), (PixelFormatIs420(v16) & 1) == 0)
    || CVPixelBufferGetWidth(a5) != self->_outputDimensions.width
    || CVPixelBufferGetHeight(a5) != self->_outputDimensions.height)
  {
    fig_log_get_emitter();
LABEL_35:
    FigDebugAssert3();
    v25 = 0;
    v18 = 0;
    v17 = -12780;
    goto LABEL_27;
  }
  v17 = cachedTexturesFromPixelBuffer(a3, (uint64_t)v56, self->_cvMetalTextureCacheRef);
  if (v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_33:
    v25 = 0;
    v18 = 0;
    goto LABEL_27;
  }
  v17 = cachedTexturesFromPixelBuffer(a5, (uint64_t)v53, self->_cvMetalTextureCacheRef);
  if (v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_33;
  }
  if (v53[0] != 2)
  {
    fig_log_get_emitter();
    goto LABEL_35;
  }
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v53[0])
    {
      v19 = 0;
      v20 = 1;
      while (1)
      {
        v21 = objc_msgSend(*(id *)&v53[2 * v20], "pixelFormat");
        pipelineComputeStates = self->_pipelineComputeStates;
        if (v21 != 10)
        {
          if (v21 != 30)
            goto LABEL_25;
          pipelineComputeStates = &self->_pipelineComputeStates[1];
        }
        v23 = *pipelineComputeStates;
        if (!v23)
        {
LABEL_25:
          fig_log_get_emitter();
          FigDebugAssert3();
          v24 = 0;
          v17 = -12782;
          goto LABEL_26;
        }
        v24 = v23;
        objc_msgSend(v18, "computeCommandEncoder");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          break;
        objc_msgSend(v25, "setComputePipelineState:", v24);
        objc_msgSend(v25, "setTexture:atIndex:", *(_QWORD *)&v56[8 * v20], 0);
        objc_msgSend(v25, "setTexture:atIndex:", *(_QWORD *)&v53[2 * v20], 1);
        -[CinematicFramingRenderer outputROI](self, "outputROI");
        width = self->_outputDimensions.width;
        height = (double)self->_outputDimensions.height;
        v29 = v28 * (double)width;
        v31 = v30 * height;
        v34 = v33 * height;
        v35 = fmax(v29 + -10.0, 0.0);
        v36 = fmax(v31 + -10.0, 0.0);
        v37 = v29 + v32 * (double)width + 10.0;
        if (v37 >= (double)width)
          v37 = (double)width;
        v38 = v31 + v34 + 10.0;
        if (v38 >= height)
          v38 = (double)self->_outputDimensions.height;
        v39 = *(_OWORD *)&self->_anon_90[112];
        v52[6] = *(_OWORD *)&self->_anon_90[96];
        v52[7] = v39;
        v40 = *(_OWORD *)&self->_anon_90[144];
        v52[8] = *(_OWORD *)&self->_anon_90[128];
        v52[9] = v40;
        v41 = *(_OWORD *)&self->_anon_90[48];
        v52[2] = *(_OWORD *)&self->_anon_90[32];
        v52[3] = v41;
        v42 = *(_OWORD *)&self->_anon_90[80];
        v52[4] = *(_OWORD *)&self->_anon_90[64];
        v52[5] = v42;
        v43 = *(_OWORD *)&self->_anon_90[16];
        v52[0] = *(_OWORD *)self->_anon_90;
        v52[1] = v43;
        -[CinematicFramingRenderer _setShaderParametersForDisplayRect:outputROI:calibrationParameters:commandEncoder:](self, "_setShaderParametersForDisplayRect:outputROI:calibrationParameters:commandEncoder:", v52, v25, v8, v10, v12, v14, v35 / (double)width, v36 / height, (v37 - v35) / (double)width, (v38 - v36) / height);
        v44 = -[MTLComputePipelineState threadExecutionWidth](v24, "threadExecutionWidth");
        v45 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v24, "maxTotalThreadsPerThreadgroup");
        v46 = objc_msgSend(*(id *)&v53[2 * v20], "width");
        v47 = objc_msgSend(*(id *)&v53[2 * v20], "height");
        v51[0] = v46;
        v51[1] = v47;
        v51[2] = 1;
        v50[0] = v44;
        v50[1] = v45 / v44;
        v50[2] = 1;
        objc_msgSend(v25, "dispatchThreads:threadsPerThreadgroup:", v51, v50);
        objc_msgSend(v25, "endEncoding");

        v19 = v25;
        if (v20++ >= v53[0])
          goto LABEL_24;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      v19 = 0;
      v17 = -12786;
LABEL_26:

      v25 = v19;
    }
    else
    {
      v25 = 0;
LABEL_24:
      objc_msgSend(v18, "commit");
      objc_msgSend(v18, "waitUntilCompleted");
      v17 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = 0;
    v18 = 0;
    v17 = -12786;
  }
LABEL_27:

  return v17;
}

- (void)finish
{
  __CVMetalTextureCache *cvMetalTextureCacheRef;
  id v4;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commit");
  objc_msgSend(v4, "waitUntilCompleted");
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
    CVMetalTextureCacheFlush(cvMetalTextureCacheRef, 0);

}

- (void)_filterDetectionsInInputImageCoordinates:(id)a3 trackType:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary **kalmanFilterManager;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  KalmanFilter *v16;
  NSMutableDictionary *v17;
  id v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  NSMutableDictionary **v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  CinematicFramingRenderer *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v30 = self;
  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    kalmanFilterManager = v30->_kalmanFilterManager;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v12, "oid", v30));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

        v14 = kalmanFilterManager[a4];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v12, "oid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15);
        v16 = (KalmanFilter *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v16 = objc_alloc_init(KalmanFilter);
          v17 = kalmanFilterManager[a4];
          v18 = v6;
          v19 = v8;
          v20 = a4;
          v21 = v9;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v12, "oid"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v22);

          v9 = v21;
          a4 = v20;
          v8 = v19;
          v6 = v18;
        }
        -[KalmanFilter addObservation:](v16, "addObservation:", v12);
        -[KalmanFilter estimatedBounds](v16, "estimatedBounds");
        objc_msgSend(v12, "setBounds:");

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v8);
  }

  v34 = 0u;
  v35 = 0u;
  v23 = v30->_kalmanFilterManager;
  v32 = 0u;
  v33 = 0u;
  -[NSMutableDictionary allKeys](v30->_kalmanFilterManager[a4], "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        if ((objc_msgSend(v6, "containsObject:", v29, v30) & 1) == 0)
          -[NSMutableDictionary removeObjectForKey:](v23[a4], "removeObjectForKey:", v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v26);
  }

}

- (CGPoint)projectPointInFramingSpace:(CGPoint)a3 toDisplayRectInFramingSpace:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = rotatePointCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, a3.x, a3.y);
  v11 = v10;
  v12 = rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, x, y, width, height);
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", v9, v11, v12, v13, v14, v15);
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGRect)projectRectInFramingSpace:(CGRect)a3 toDisplayRectInFramingSpace:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
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
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, x, y, width, height);
  -[CinematicFramingRenderer _projectRectInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectRectInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", v9, v11, v13, v15, v16, v17, v18, v19);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)warpMetadataInInputImageCoordinatesToFramingSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bodyDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CinematicFramingRenderer _filterDetectionsInInputImageCoordinates:trackType:](self, "_filterDetectionsInInputImageCoordinates:trackType:", v5, 0);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "bodyDetections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "bounds");
        -[CinematicFramingRenderer warpRectInInputImageCoordinatesToFramingSpace:](self, "warpRectInInputImageCoordinatesToFramingSpace:");
        objc_msgSend(v11, "setBounds:");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "faceDetections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CinematicFramingRenderer _filterDetectionsInInputImageCoordinates:trackType:](self, "_filterDetectionsInInputImageCoordinates:trackType:", v12, 1);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "faceDetections", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        objc_msgSend(v18, "bounds");
        -[CinematicFramingRenderer warpRectInInputImageCoordinatesToFramingSpace:](self, "warpRectInInputImageCoordinatesToFramingSpace:");
        objc_msgSend(v18, "setBounds:");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

}

- (CGRect)warpRectInInputImageCoordinatesToFramingSpace:(CGRect)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _OWORD v17[10];
  CGRect result;

  v4 = *(_OWORD *)&self->_anon_90[112];
  v17[6] = *(_OWORD *)&self->_anon_90[96];
  v17[7] = v4;
  v5 = *(_OWORD *)&self->_anon_90[144];
  v17[8] = *(_OWORD *)&self->_anon_90[128];
  v17[9] = v5;
  v6 = *(_OWORD *)&self->_anon_90[48];
  v17[2] = *(_OWORD *)&self->_anon_90[32];
  v17[3] = v6;
  v7 = *(_OWORD *)&self->_anon_90[80];
  v17[4] = *(_OWORD *)&self->_anon_90[64];
  v17[5] = v7;
  v8 = *(_OWORD *)&self->_anon_90[16];
  v17[0] = *(_OWORD *)self->_anon_90;
  v17[1] = v8;
  -[CinematicFramingRenderer _warpRectInInputImageCoordinatesToFramingSpaceInLandscapeLeft:calibrationParameters:](self, "_warpRectInInputImageCoordinatesToFramingSpaceInLandscapeLeft:calibrationParameters:", v17, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v13 = rotateRectCCW(self->_numCCWRotationsFromInputToFramingSpace, v9, v10, v11, v12);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (float)_fisheyeStrengthForDisplayRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BOOL v8;
  float result;
  float v10;
  float v11;
  float v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[CinematicFramingRenderer visualizeViewport](self, "visualizeViewport");
  result = 0.0;
  if (!v8)
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    v10 = CGRectGetHeight(v13);
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v11 = CGRectGetWidth(v14);
    v12 = fminf(fmaxf((float)(fmaxf(v10, v11) + -0.95993) / 0.87266, 0.0), 1.0);
    return self->_stereographicFisheyeMaxStrength * (float)((float)(v12 * v12) * (float)((float)(v12 * -2.0) + 3.0));
  }
  return result;
}

- (float32x2_t)_outputPlaneSizeForDisplayRect:(CGFloat)a3
{
  float v8;
  float v9;
  float v10;
  float v12;
  CGRect v13;

  v8 = CGRectGetWidth(*(CGRect *)&a1) * 0.5;
  v12 = tanf(v8);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  v9 = CGRectGetHeight(v13) * 0.5;
  v10 = tanf(v9);
  return vadd_f32((float32x2_t)__PAIR64__(LODWORD(v10), LODWORD(v12)), (float32x2_t)__PAIR64__(LODWORD(v10), LODWORD(v12)));
}

- (double)_rotationMatrixForDisplayRect:(double)a3
{
  float MidY;
  __float2 v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  double v16;
  float MidX;
  __float2 v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  uint64_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  uint64_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  uint32x4_t v35;
  double v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float v42;
  __float2 v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  int32x4_t v47;
  int8x16_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  int32x4_t v52;
  int8x16_t v53;
  float32x4_t v54;
  double v55;
  float v56;
  float v57;
  float v58;
  __float2 v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  uint64_t v64;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;

  MidY = CGRectGetMidY(*(CGRect *)&a2);
  v11 = __sincosf_stret(MidY * -0.5);
  v12 = vmulq_n_f32((float32x4_t)xmmword_1D4E43A80, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  *(__n64 *)v13.f32 = simd_matrix3x3(v12);
  v77 = v14;
  v79 = v13;
  v75 = v15;
  *(double *)v13.i64 = a2;
  *(double *)v14.i64 = a3;
  *(double *)v15.i64 = a4;
  v16 = a5;
  MidX = CGRectGetMidX(*(CGRect *)v13.f32);
  v18 = __sincosf_stret(MidX * 0.5);
  v19 = vmulq_n_f32((float32x4_t)xmmword_1D4E43A90, v18.__sinval);
  v19.i32[3] = LODWORD(v18.__cosval);
  *(__n64 *)v20.f32 = simd_matrix3x3(v19);
  v70 = v21;
  v72 = v20;
  v68 = v22;
  if (objc_msgSend(a1, "cameraOrientation") == 1
    || objc_msgSend(a1, "cameraOrientation") == 2)
  {
    v23 = 0;
    v25 = v70;
    v24 = v72;
    v24.i32[3] = 0;
    v25.i32[3] = 0;
    v26 = v68;
    v26.i32[3] = 0;
    v81 = v24;
    v82 = v25;
    v83 = v26;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v84 + v23 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v23 * 4))), v77, *(float32x2_t *)&v81.f32[v23], 1), v75, *(float32x4_t *)((char *)&v81 + v23 * 4), 2);
      v23 += 4;
    }
    while (v23 != 12);
  }
  else
  {
    v27 = 0;
    v29 = v77;
    v28 = v79;
    v28.i32[3] = 0;
    v29.i32[3] = 0;
    v30 = v75;
    v30.i32[3] = 0;
    v81 = v28;
    v82 = v29;
    v83 = v30;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v84 + v27 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v27 * 4))), v70, *(float32x2_t *)&v81.f32[v27], 1), v68, *(float32x4_t *)((char *)&v81 + v27 * 4), 2);
      v27 += 4;
    }
    while (v27 != 12);
  }
  v31 = v84;
  v71 = v85;
  v73 = v84;
  v31.i32[3] = 0;
  v80 = v31;
  v32 = v85;
  v32.i32[3] = 0;
  v78 = v32;
  v69 = v86;
  v33 = v86;
  v33.i32[3] = 0;
  v76 = v33;
  objc_msgSend(a1, "gravity");
  v35 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v34), (int8x16_t)vcgezq_f32(v34)));
  v35.i32[3] = v35.i32[2];
  v36 = 0.0;
  if ((vmaxvq_u32(v35) & 0x80000000) == 0
    && objc_msgSend(a1, "cameraOrientation")
    && (objc_msgSend(a1, "visualizeViewport") & 1) == 0)
  {
    v37.i32[0] = 0;
    v38.i8[0] = a1[52];
    v39 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v38, v37), 0);
    v66 = (float32x4_t)vbslq_s8(v39, (int8x16_t)xmmword_1D4E43AA0, (int8x16_t)xmmword_1D4E43F30);
    v67 = (float32x4_t)vbslq_s8(v39, (int8x16_t)xmmword_1D4E43F40, (int8x16_t)xmmword_1D4E43A90);
    objc_msgSend(a1, "gravity");
    v41 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v67, v40.f32[0]), (float32x4_t)xmmword_1D4E43F50, *(float32x2_t *)v40.f32, 1), v66, v40, 2);
    v74 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, v41.f32[0]), v71, *(float32x2_t *)v41.f32, 1), v69, v41, 2);
    v42 = (double)(int)objc_msgSend(a1, "numCCWRotationsFromInputToFramingSpace") * 1.57079633;
    v43 = __sincosf_stret(v42 * 0.5);
    v44 = vmulq_n_f32((float32x4_t)xmmword_1D4E43AA0, v43.__sinval);
    v45 = v44;
    v45.i32[3] = LODWORD(v43.__cosval);
    v46 = vmulq_f32(v45, (float32x4_t)xmmword_1D4E43B10);
    v47 = (int32x4_t)vnegq_f32(v46);
    v48 = (int8x16_t)vtrn2q_s32((int32x4_t)v46, vtrn1q_s32((int32x4_t)v46, v47));
    v49 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v46, (int8x16_t)v47, 8uLL), *(float32x2_t *)v74.f32, 1), (float32x4_t)vextq_s8(v48, v48, 8uLL), v74.f32[0]);
    v50 = (float32x4_t)vrev64q_s32((int32x4_t)v46);
    v50.i32[0] = v47.i32[1];
    v50.i32[3] = v47.i32[2];
    v51 = vmlaq_laneq_f32(v49, v50, v74, 2);
    v52 = (int32x4_t)vnegq_f32(v51);
    v53 = (int8x16_t)vtrn2q_s32((int32x4_t)v51, vtrn1q_s32((int32x4_t)v51, v52));
    v54 = (float32x4_t)vrev64q_s32((int32x4_t)v51);
    v54.i32[0] = v52.i32[1];
    v54.i32[3] = v52.i32[2];
    *(float32x2_t *)v44.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vmlaq_laneq_f32(vmulq_laneq_f32(v51, v45, 3), v54, v44, 2), (float32x2_t)*(_OWORD *)&vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v51, (int8x16_t)v52, 8uLL), *(float32x2_t *)v44.f32, 1), (float32x4_t)vextq_s8(v53, v53, 8uLL), v44.f32[0]));
    *(float32x2_t *)v52.i8 = vmul_f32(*(float32x2_t *)v44.f32, *(float32x2_t *)v44.f32);
    v52.i32[0] = vadd_f32(*(float32x2_t *)v52.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v52.i8, 1)).u32[0];
    *(float32x2_t *)v45.f32 = vrsqrte_f32((float32x2_t)v52.u32[0]);
    *(float32x2_t *)v45.f32 = vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32)));
    *(float32x2_t *)v44.f32 = vmul_n_f32(*(float32x2_t *)v44.f32, vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32))).f32[0]);
    *(float32x2_t *)v45.f32 = vrsqrte_f32((float32x2_t)1065353216);
    *(float32x2_t *)v45.f32 = vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32)));
    *(float32x2_t *)v52.i8 = vmul_n_f32((float32x2_t)0x3F80000000000000, vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32))).f32[0]);
    v55 = asinf(vmlas_n_f32(vmuls_lane_f32(-v44.f32[0], *(float32x2_t *)v52.i8, 1), v44.f32[1], *(float *)v52.i32));
    if (v55 <= -0.523598776)
      v55 = -0.52359879;
    v56 = fmin(v55, 0.523598776);
    v36 = v56;
  }
  objc_msgSend(a1, "additionalCameraRotation");
  v58 = v36 + v57 * 3.14159265 / 180.0;
  v59 = __sincosf_stret(v58 * 0.5);
  v60 = vmulq_n_f32((float32x4_t)xmmword_1D4E43AA0, v59.__sinval);
  v60.i32[3] = LODWORD(v59.__cosval);
  *(__n64 *)v61.f32 = simd_matrix3x3(v60);
  v64 = 0;
  v81 = v80;
  v82 = v78;
  v83 = v76;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v84 + v64 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v64 * 4))), v62, *(float32x2_t *)&v81.f32[v64], 1), v63, *(float32x4_t *)((char *)&v81 + v64 * 4), 2);
    v64 += 4;
  }
  while (v64 != 12);
  return *(double *)v84.i64;
}

- (CGPoint)_projectPointInFramingSpaceLandscapeLeft:(CGPoint)a3 toDisplayRectInFramingSpaceLandscapeLeft:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  float v11;
  float32x2_t v12;
  float64x2_t v13;
  float64x2_t v19;
  double v20;
  float v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  int32x4_t v25;
  simd_float3x3 v26;
  simd_float3x3 v27;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  -[CinematicFramingRenderer _rotationMatrixForDisplayRect:](self, "_rotationMatrixForDisplayRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v27 = __invert_f3(v26);
  v22 = (float32x4_t)v27.columns[0];
  v23 = (float32x4_t)v27.columns[2];
  v24 = (float32x4_t)v27.columns[1];
  v27.columns[0].f32[0] = v9;
  v21 = tanf(v27.columns[0].f32[0]);
  v11 = v8;
  v25 = (int32x4_t)vaddq_f32(v23, vmlaq_n_f32(vmulq_n_f32(v22, v21), v24, tanf(v11)));
  -[CinematicFramingRenderer _outputPlaneSizeForDisplayRect:](self, "_outputPlaneSizeForDisplayRect:", x, y, width, height);
  v13 = vcvtq_f64_f32(v12);
  __asm { FMOV            V2.2D, #0.5 }
  v19 = vdivq_f64(vaddq_f64(vmulq_f64(v13, _Q2), vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v25.i8, (float32x2_t)vdup_laneq_s32(v25, 2)))), v13);
  v20 = v19.f64[1];
  result.x = v19.f64[0];
  result.y = v20;
  return result;
}

- (CGRect)_projectRectInFramingSpaceLandscapeLeft:(CGRect)a3 toDisplayRectInFramingSpaceLandscapeLeft:(CGRect)a4
{
  double width;
  double v5;
  double x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MidX;
  double v13;
  double v14;
  double v15;
  double MinX;
  double v17;
  double v18;
  double MaxX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double y;
  double height;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  y = a4.origin.y;
  height = a4.size.height;
  width = a4.size.width;
  v5 = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v29.origin.x = v10;
  v29.origin.y = v9;
  v29.size.width = v8;
  v29.size.height = v7;
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", MidX, CGRectGetMinY(v29), x, v5, width, height);
  v26 = v13;
  v30.origin.x = v10;
  v30.origin.y = v9;
  v30.size.width = v8;
  v30.size.height = v7;
  v14 = CGRectGetMidX(v30);
  v31.origin.x = v10;
  v31.origin.y = v9;
  v31.size.width = v8;
  v31.size.height = v7;
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", v14, CGRectGetMaxY(v31), x, y, width, height);
  v25 = v15;
  v32.origin.x = v10;
  v32.origin.y = v9;
  v32.size.width = v8;
  v32.size.height = v7;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = v10;
  v33.origin.y = v9;
  v33.size.width = v8;
  v33.size.height = v7;
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", MinX, CGRectGetMidY(v33), x, y, width, height);
  v18 = v17;
  v34.origin.x = v10;
  v34.origin.y = v9;
  v34.size.width = v8;
  v34.size.height = v7;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v10;
  v35.origin.y = v9;
  v35.size.width = v8;
  v35.size.height = v7;
  -[CinematicFramingRenderer _projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:](self, "_projectPointInFramingSpaceLandscapeLeft:toDisplayRectInFramingSpaceLandscapeLeft:", MaxX, CGRectGetMidY(v35), x, y, width, height);
  v21 = v20 - v18;
  v22 = v26;
  v23 = v25 - v26;
  v24 = v18;
  result.size.height = v23;
  result.size.width = v21;
  result.origin.y = v22;
  result.origin.x = v24;
  return result;
}

- (CGRect)_warpRectInInputImageCoordinatesToFramingSpaceInLandscapeLeft:(CGRect)a3 calibrationParameters:(id *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MinY;
  float64x2_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGFloat MaxY;
  float64x2_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double v23;
  CGFloat MidY;
  float64x2_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGFloat v31;
  float64x2_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat MaxX;
  CGFloat v44;
  CGFloat MinX;
  double v46;
  CGFloat MidX;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  MinY = CGRectGetMinY(v59);
  v10.f64[0] = MidX;
  v10.f64[1] = MinY;
  v11 = *(_OWORD *)&a4[1].var4.var6;
  v55 = *(_OWORD *)&a4[1].var4.var2;
  v56 = v11;
  v12 = *(_OWORD *)&a4[1].var5.var6;
  v57 = *(_OWORD *)&a4[1].var5.var2;
  v58 = v12;
  v13 = *(_OWORD *)&a4->var5.var1;
  v51 = *(_OWORD *)&a4->var4.var5;
  v52 = v13;
  v14 = *(_OWORD *)&a4[1].var2;
  v53 = *(_OWORD *)&a4->var5.var5;
  v54 = v14;
  v15 = *(_OWORD *)&a4->var4.var1;
  v49 = *(_OWORD *)&a4->var1;
  v50 = v15;
  v48 = warpPointInputImageToFramingSpaceInLandscapeLeft((uint64_t)&v49, vcvt_f32_f64(v10));
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  v44 = CGRectGetMidX(v60);
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  MaxY = CGRectGetMaxY(v61);
  v17.f64[0] = v44;
  v17.f64[1] = MaxY;
  v18 = *(_OWORD *)&a4[1].var4.var6;
  v55 = *(_OWORD *)&a4[1].var4.var2;
  v56 = v18;
  v19 = *(_OWORD *)&a4[1].var5.var6;
  v57 = *(_OWORD *)&a4[1].var5.var2;
  v58 = v19;
  v20 = *(_OWORD *)&a4->var5.var1;
  v51 = *(_OWORD *)&a4->var4.var5;
  v52 = v20;
  v21 = *(_OWORD *)&a4[1].var2;
  v53 = *(_OWORD *)&a4->var5.var5;
  v54 = v21;
  v22 = *(_OWORD *)&a4->var4.var1;
  v49 = *(_OWORD *)&a4->var1;
  v50 = v22;
  v23 = warpPointInputImageToFramingSpaceInLandscapeLeft((uint64_t)&v49, vcvt_f32_f64(v17));
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  MinX = CGRectGetMinX(v62);
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  MidY = CGRectGetMidY(v63);
  v25.f64[0] = MinX;
  v25.f64[1] = MidY;
  v26 = *(_OWORD *)&a4[1].var4.var6;
  v55 = *(_OWORD *)&a4[1].var4.var2;
  v56 = v26;
  v27 = *(_OWORD *)&a4[1].var5.var6;
  v57 = *(_OWORD *)&a4[1].var5.var2;
  v58 = v27;
  v28 = *(_OWORD *)&a4->var5.var1;
  v51 = *(_OWORD *)&a4->var4.var5;
  v52 = v28;
  v29 = *(_OWORD *)&a4[1].var2;
  v53 = *(_OWORD *)&a4->var5.var5;
  v54 = v29;
  v30 = *(_OWORD *)&a4->var4.var1;
  v49 = *(_OWORD *)&a4->var1;
  v50 = v30;
  v46 = warpPointInputImageToFramingSpaceInLandscapeLeft((uint64_t)&v49, vcvt_f32_f64(v25));
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  MaxX = CGRectGetMaxX(v64);
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  v31 = CGRectGetMidY(v65);
  v32.f64[0] = MaxX;
  v32.f64[1] = v31;
  v33 = *(_OWORD *)&a4[1].var4.var6;
  v55 = *(_OWORD *)&a4[1].var4.var2;
  v56 = v33;
  v34 = *(_OWORD *)&a4[1].var5.var6;
  v57 = *(_OWORD *)&a4[1].var5.var2;
  v58 = v34;
  v35 = *(_OWORD *)&a4->var5.var1;
  v51 = *(_OWORD *)&a4->var4.var5;
  v52 = v35;
  v36 = *(_OWORD *)&a4[1].var2;
  v53 = *(_OWORD *)&a4->var5.var5;
  v54 = v36;
  v37 = *(_OWORD *)&a4->var4.var1;
  v49 = *(_OWORD *)&a4->var1;
  v50 = v37;
  v38 = warpPointInputImageToFramingSpaceInLandscapeLeft((uint64_t)&v49, vcvt_f32_f64(v32));
  v39 = *((float *)&v48 + 1);
  v40 = vsub_f32(*(float32x2_t *)&v38, *(float32x2_t *)&v46).f32[0];
  v41 = COERCE_FLOAT(vsub_f32(*(float32x2_t *)&v23, *(float32x2_t *)&v48).i32[1]);
  v42 = *(float *)&v46;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v42;
  return result;
}

- (int)_outputPlaneCcwRotations
{
  if (self->_cameraOrientationCorrectionEnabled)
    return -[CinematicFramingRenderer numCCWRotationsFromInputToFramingSpace](self, "numCCWRotationsFromInputToFramingSpace");
  else
    return 0;
}

- (CGRect)framingSpaceBounds
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[CinematicFramingRenderer _framingSpaceBoundsLandscapeLeft](self, "_framingSpaceBoundsLandscapeLeft");
  v7 = rotateRectCCW(self->_numCCWRotationsFromInputToFramingSpace, v3, v4, v5, v6);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (float)maxAllowedViewportWidth
{
  CGFloat Width;
  float v4;
  CGFloat v5;
  CGFloat v6;
  uint64_t v7;
  float result;
  CGFloat Height;
  CGRect v13;
  CGRect v14;

  -[CinematicFramingRenderer framingSpaceBounds](self, "framingSpaceBounds");
  Width = CGRectGetWidth(v13);
  *(float *)&Width = Width;
  -[CinematicFramingRenderer getHeightForWidth:](self, "getHeightForWidth:", Width);
  v5 = v4;
  -[CinematicFramingRenderer framingSpaceBounds](self, "framingSpaceBounds");
  v6 = CGRectGetHeight(v14) + 0.000001;
  -[CinematicFramingRenderer framingSpaceBounds](self, "framingSpaceBounds");
  if (v6 > v5)
    return CGRectGetWidth(*(CGRect *)&v7);
  Height = CGRectGetHeight(*(CGRect *)&v7);
  *(float *)&Height = Height;
  -[CinematicFramingRenderer getWidthForHeight:](self, "getWidthForHeight:", Height);
  return result;
}

- (float)getHeightDerivativeForWidth:(float)a3 widthDerivative:(float)a4
{
  int v7;
  double v8;
  double v9;
  double v10;
  float result;

  -[CinematicFramingRenderer outputAspectRatioInDeviceOrientation](self, "outputAspectRatioInDeviceOrientation");
  LODWORD(v8) = v7;
  *(float *)&v9 = a3;
  *(float *)&v10 = a4;
  -[CinematicFramingRenderer _getHeightDerivativeForWidth:widthDerivative:outputAspectRatioInDeviceOrientation:](self, "_getHeightDerivativeForWidth:widthDerivative:outputAspectRatioInDeviceOrientation:", v9, v10, v8);
  return result;
}

- (float)getHeightForWidth:(float)a3
{
  int v5;
  double v6;
  double v7;
  float result;

  -[CinematicFramingRenderer outputAspectRatioInDeviceOrientation](self, "outputAspectRatioInDeviceOrientation");
  LODWORD(v6) = v5;
  *(float *)&v7 = a3;
  -[CinematicFramingRenderer _getHeightForWidth:outputAspectRatioInDeviceOrientation:](self, "_getHeightForWidth:outputAspectRatioInDeviceOrientation:", v7, v6);
  return result;
}

- (float)getWidthForHeight:(float)a3
{
  int v5;
  double v6;
  double v7;
  float result;

  -[CinematicFramingRenderer outputAspectRatioInDeviceOrientation](self, "outputAspectRatioInDeviceOrientation");
  LODWORD(v6) = v5;
  *(float *)&v7 = a3;
  -[CinematicFramingRenderer _getWidthForHeight:outputAspectRatioInDeviceOrientation:](self, "_getWidthForHeight:outputAspectRatioInDeviceOrientation:", v7, v6);
  return result;
}

- (CGRect)adjustDisplayRectToFitInFramingSpace:(CGRect)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[CinematicFramingRenderer _adjustDisplayRectToFitInFramingSpaceLandscapeLeft:](self, "_adjustDisplayRectToFitInFramingSpaceLandscapeLeft:", rotateRectCCW(4 - self->_numCCWRotationsFromInputToFramingSpace, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v8 = rotateRectCCW(self->_numCCWRotationsFromInputToFramingSpace, v4, v5, v6, v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (float)outputAspectRatioInDeviceOrientation
{
  $470D365275581EF16070F5A11344F73E outputDimensions;
  int64x2_t v3;
  float32x2_t v4;
  float result;

  outputDimensions = self->_outputDimensions;
  v3.i64[0] = outputDimensions.width;
  v3.i64[1] = outputDimensions.height;
  v4 = vcvt_f32_f64(vmulq_f64((float64x2_t)self->_outputROI.size, vcvtq_f64_s64(v3)));
  LODWORD(result) = vdiv_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).u32[0];
  if (!self->_cameraOrientationCorrectionEnabled && (self->_numCCWRotationsFromInputToFramingSpace & 1) != 0)
    return 1.0 / result;
  return result;
}

- (CGRect)_framingSpaceBoundsLandscapeLeft
{
  float v3;
  float v4;
  float v5;
  float v6;
  float fovLimit;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[CinematicFramingRenderer calibrationParams](self, "calibrationParams");
  v3 = atan2f(0.0, 0.0 + 0.0);
  v4 = v3 + v3;
  v5 = atan2f(0.0, 0.0 + 0.0);
  v6 = v5 + v5;
  fovLimit = self->_fovLimit;
  if (v4 >= fovLimit)
    v8 = self->_fovLimit;
  else
    v8 = v4;
  if (v6 >= fovLimit)
    v9 = self->_fovLimit;
  else
    v9 = v6;
  if (fovLimit <= 0.0)
  {
    v8 = v4;
    v9 = v6;
  }
  v10 = (float)(v8 * -0.5);
  v11 = (float)(v9 * -0.5);
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (float)_getHeightDerivativeForWidth:(float)a3 widthDerivative:(float)a4 outputAspectRatioInDeviceOrientation:(float)a5
{
  float v5;
  float v6;
  __float2 v7;

  v5 = a4 * a5;
  v6 = a5 * a5;
  v7 = __sincosf_stret(a3 * 0.5);
  return v5 / (float)((float)(v7.__sinval * v7.__sinval) + (float)((float)(v7.__cosval * v6) * v7.__cosval));
}

- (float)_getHeightForWidth:(float)a3 outputAspectRatioInDeviceOrientation:(float)a4
{
  float v5;
  float v6;

  v5 = tanf(a3 * 0.5);
  v6 = atanf(v5 / a4);
  return v6 + v6;
}

- (float)_getWidthForHeight:(float)a3 outputAspectRatioInDeviceOrientation:(float)a4
{
  float v5;
  float v6;

  v5 = tanf(a3 * 0.5);
  v6 = atanf(v5 * a4);
  return v6 + v6;
}

- (CGRect)_adjustDisplayRectToFitInFramingSpaceLandscapeLeft:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CinematicFramingRenderer _scaleDisplayRectSizeToFit:](self, "_scaleDisplayRectSizeToFit:", a3.size.width, a3.size.height);
  v9 = v8;
  v11 = v10;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v12 = (CGRectGetWidth(v18) - v9) * 0.5;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v13 = (CGRectGetHeight(v19) - v11) * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v21 = CGRectInset(v20, v12, v13);
  -[CinematicFramingRenderer _moveDisplayRectToFitInFramingSpaceLandscapeLeft:](self, "_moveDisplayRectToFitInFramingSpaceLandscapeLeft:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGSize)_scaleDisplayRectSizeToFit:(CGSize)a3
{
  double height;
  double width;
  int v6;
  double v7;
  int v8;
  int v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -1;
  v7 = -1.0;
  do
  {
    v8 = v6;
    v9 = -3;
    v10 = -1.0;
    do
    {
      -[CinematicFramingRenderer calibrationParams](self, "calibrationParams");
      if (v18)
      {
        *(float *)&v11 = width * v7 * 0.5;
        v12 = height * v10 * 0.5;
        *((float *)&v11 + 1) = v12;
        v17 = v11;
        if (!-[CinematicFramingRenderer _pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:](self, "_pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:"))
        {
          -[CinematicFramingRenderer _searchValidSizeForStartSize:invalidPoint:](self, "_searchValidSizeForStartSize:invalidPoint:", width, height, v17);
          width = v13;
          height = v14;
        }
      }
      v10 = v10 + 2.0;
      v9 += 2;
    }
    while (v9 < 0);
    v7 = v7 + 2.0;
    v6 = v8 + 2;
  }
  while (v8 < 0);
  v15 = width;
  v16 = height;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)_searchValidSizeForStartSize:(CGSize)a3 invalidPoint:
{
  float32x2_t v3;
  float32x2_t v4;
  CGFloat height;
  float32x2_t v7;
  float v8;
  int v9;
  float v10;
  float v11;
  float32x2_t v12;
  double v13;
  double v14;
  CGSize v15;
  __int128 v16;
  CGSize result;

  v4 = v3;
  v15 = a3;
  v16 = *(__int128 *)&a3.height;
  height = a3.height;
  v7 = vcvt_f32_f64((float64x2_t)a3);
  v8 = 1.0;
  v9 = 10;
  v10 = 0.5;
  do
  {
    v11 = (float)((float)(v8 + v10) * 0.5) + 0.05;
    v12 = vmul_n_f32(v7, v11);
    if (-[CinematicFramingRenderer _pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:](self, "_pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:", COERCE_DOUBLE(vmul_n_f32(v4, v11)), (float)-v12.f32[0] * 0.5, (float)-v12.f32[1] * 0.5, v12.f32[0], v12.f32[1], v15, v16))
    {
      v10 = (float)(v8 + v10) * 0.5;
    }
    else
    {
      v8 = (float)(v8 + v10) * 0.5;
    }
    --v9;
  }
  while (v9);
  v13 = v15.width * v10;
  v14 = *(double *)&v16 * v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGRect)_moveDisplayRectToFitInFramingSpaceLandscapeLeft:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v24;
  float v26;
  float v27;
  double MinX;
  float v29;
  double MinY;
  unsigned int v31;
  CGFloat v32;
  float64x2_t v33;
  float64x2_t v34;
  float32x2_t v35;
  float32x2_t v36;
  CGFloat v37;
  float64x2_t v38;
  float32x2_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float v44;
  float v45;
  float v46;
  double v47;
  CGFloat v48;
  float64x2_t v49;
  CGPoint origin;
  float v51;
  double v52;
  float v53;
  double v54;
  CGFloat v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CinematicFramingRenderer framingSpaceBounds](self, "framingSpaceBounds");
  v8 = CGRectGetWidth(v56);
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v9 = 0.5;
  v10 = (v8 - CGRectGetWidth(v57)) * 0.5;
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  v11 = fmin(v10, CGRectGetWidth(v58) * 0.05);
  -[CinematicFramingRenderer framingSpaceBounds](self, "framingSpaceBounds");
  v12 = CGRectGetHeight(v59);
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  v13 = (v12 - CGRectGetHeight(v60)) * 0.5;
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v14 = fmin(v13, CGRectGetHeight(v61) * 0.05);
  v44 = v14;
  v45 = v11;
  v15 = (float)-v14;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v63 = CGRectInset(v62, (float)-v11, v15);
  v16 = v63.origin.x;
  v17 = v63.origin.y;
  v18 = v63.size.width;
  v19 = v63.size.height;
  v20 = 1.0;
  __asm { FMOV            V0.2D, #0.5 }
  origin = v63.origin;
  v24 = -1.0;
  do
  {
    v52 = (float)(v24 + v20) * v9;
    v47 = v24;
    v46 = v24;
    _ZF = v24 == v20 || v24 == -1.0;
    v26 = 0.2;
    if (_ZF)
      v26 = 2.0;
    v51 = v26;
    v27 = -1.0;
    do
    {
      v64.origin.x = v16;
      v64.origin.y = v17;
      v64.size.width = v18;
      v64.size.height = v19;
      MinX = CGRectGetMinX(v64);
      v65.origin.x = v16;
      v65.origin.y = v17;
      v65.size.width = v18;
      v65.size.height = v19;
      v29 = MinX + v52 * CGRectGetWidth(v65);
      v53 = v29;
      v66.origin.x = v16;
      v66.origin.y = v17;
      v66.size.width = v18;
      v66.size.height = v19;
      MinY = CGRectGetMinY(v66);
      v67.origin.x = v16;
      v67.origin.y = v17;
      v67.size.width = v18;
      v67.size.height = v19;
      *(float *)&v31 = MinY + (float)(v27 + v20) * 0.5 * CGRectGetHeight(v67);
      v54 = COERCE_DOUBLE(__PAIR64__(v31, LODWORD(v53)));
      if (!-[CinematicFramingRenderer _pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:](self, "_pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:"))
      {
        v68.origin.x = v16;
        v68.origin.y = v17;
        v68.size.width = v18;
        v68.size.height = v19;
        v48 = CGRectGetWidth(v68);
        v69.origin.x = v16;
        v69.origin.y = v17;
        v69.size.width = v18;
        v69.size.height = v19;
        v32 = CGRectGetHeight(v69);
        v33.f64[0] = v48;
        v33.f64[1] = v32;
        v34.f64[0] = v47;
        v34.f64[1] = v27;
        v49 = v34;
        -[CinematicFramingRenderer _searchEarliestValidPointOnIntervalWithStart:andEnd:displayRect:](self, "_searchEarliestValidPointOnIntervalWithStart:andEnd:displayRect:", v54, COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vmulq_f64(v33, v34), (float64x2_t)origin))), v16, v17, v18, v19);
        v36 = v35;
        v70.origin.x = v16;
        v70.origin.y = v17;
        v70.size.width = v18;
        v70.size.height = v19;
        v55 = CGRectGetWidth(v70);
        v71.origin.x = v16;
        v71.origin.y = v17;
        v71.size.width = v18;
        v71.size.height = v19;
        v37 = CGRectGetHeight(v71);
        v38.f64[0] = v55;
        v38.f64[1] = v37;
        v39 = vsub_f32(v36, vcvt_f32_f64(vmulq_f64(vmulq_f64(v38, v49), (float64x2_t)origin)));
        HIDWORD(v55) = v39.i32[1];
        v40 = v39.f32[0];
        v41 = v16;
        v38.f64[0] = v17;
        v42 = v18;
        v43 = v19;
        v16 = v40 - CGRectGetWidth(*(CGRect *)((char *)&v38 - 8)) * 0.5;
        v72.origin.x = v16;
        v72.origin.y = v17;
        v72.size.width = v18;
        v72.size.height = v19;
        v17 = *((float *)&v55 + 1) - CGRectGetHeight(v72) * 0.5;
      }
      v9 = 0.5;
      v20 = 1.0;
      v27 = v51 + v27;
    }
    while (v27 <= 1.0);
    v24 = v46 + 0.1;
  }
  while ((float)(v46 + 0.1) <= 1.0);
  v73.origin.x = v16;
  v73.origin.y = v17;
  v73.size.width = v18;
  v73.size.height = v19;
  return CGRectInset(v73, v45, v44);
}

- (float32x2_t)_searchEarliestValidPointOnIntervalWithStart:(float32x2_t)a3 andEnd:(CGFloat)a4 displayRect:(CGFloat)a5
{
  int v13;
  CGFloat v14;
  CGFloat v15;
  double Width;
  int v17;
  unsigned int v18;
  int8x8_t v19;
  double v21;
  double v22;
  __n128 v23;
  int8x8_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v21 = a2.n128_f32[1];
  v22 = a2.n128_f32[0];
  v13 = 10;
  do
  {
    v23 = a2;
    v24 = (int8x8_t)vmul_f32(vadd_f32((float32x2_t)a2.n128_u64[0], a3), (float32x2_t)0x3F0000003F000000);
    v25.origin.x = a4;
    v25.origin.y = a5;
    v25.size.width = a6;
    v25.size.height = a7;
    v14 = CGRectGetMinX(v25) + *(float *)v24.i32 - v22;
    v26.origin.x = a4;
    v26.origin.y = a5;
    v26.size.width = a6;
    v26.size.height = a7;
    v15 = CGRectGetMinY(v26) + *(float *)&v24.i32[1] - v21;
    v27.origin.x = a4;
    v27.origin.y = a5;
    v27.size.width = a6;
    v27.size.height = a7;
    Width = CGRectGetWidth(v27);
    v28.origin.x = a4;
    v28.origin.y = a5;
    v28.size.width = a6;
    v28.size.height = a7;
    v17 = objc_msgSend(a1, "_pointInFramingSpaceLandscapeLeftIsValid:withDisplayRect:", *(double *)&v24, v14, v15, Width, CGRectGetHeight(v28));
    a2.n128_u64[1] = v23.n128_u64[1];
    if (v17)
      v18 = -1;
    else
      v18 = 0;
    v19 = (int8x8_t)vdup_n_s32(v18);
    a2.n128_u64[0] = (unint64_t)vbsl_s8(v19, (int8x8_t)v23.n128_u64[0], v24);
    a3 = (float32x2_t)vbsl_s8(v19, v24, (int8x8_t)a3);
    --v13;
  }
  while (v13);
  return a3;
}

- (BOOL)_pointInFramingSpaceLandscapeLeftIsValid:(CGRect)a3 withDisplayRect:
{
  CGFloat v3;
  double v4;
  double height;
  double width;
  double y;
  double v9;
  float v10;
  float v11;
  float v12;
  float v18;
  float32x4_t v19;
  float v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  int32x4_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  BOOL v36;
  float v38;
  uint64_t v39;
  float32x4_t v40;
  float v41;
  float v42;
  float32x4_t v43;
  float32x4_t v44;
  __int128 v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGRect v55;
  CGRect v56;

  v4 = v3;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v41 = *((float *)&a3.origin.x + 1);
  v9 = *(float *)&a3.origin.x;
  v55.origin.x = a3.origin.y;
  v55.origin.y = a3.size.width;
  v55.size.width = a3.size.height;
  v55.size.height = v3;
  v10 = v9 - CGRectGetMidX(v55);
  v42 = tanf(v10);
  v56.origin.x = y;
  v56.origin.y = width;
  v56.size.width = height;
  v56.size.height = v4;
  v11 = v41 - CGRectGetMidY(v56);
  v12 = tanf(v11);
  __asm { FMOV            V1.4S, #1.0 }
  v38 = v12;
  v39 = _Q1.i64[1];
  _Q1.i64[0] = __PAIR64__(LODWORD(v12), LODWORD(v42));
  v40 = _Q1;
  -[CinematicFramingRenderer _fisheyeStrengthForDisplayRect:](self, "_fisheyeStrengthForDisplayRect:", y, width, height, v4);
  v18 = self->_stereographicFisheyeF
      * 4.0
      / -((float)((float)(v38 * v38) + (float)(v42 * v42))
        - self->_stereographicFisheyeF * 4.0 * self->_stereographicFisheyeF);
  v19.i64[1] = v39;
  v19.f32[0] = v42 * v18;
  v19.f32[1] = v38 * v18;
  v43 = vmlaq_n_f32(vmulq_n_f32(v40, 1.0 - v20), v19, v20);
  -[CinematicFramingRenderer _rotationMatrixForDisplayRect:](self, "_rotationMatrixForDisplayRect:", y, width, height, v4);
  v23 = vzip1q_s32(v21, v22);
  v25 = vzip1q_s32(v24, (int32x4_t)0);
  v26 = vzip1q_s32(v23, v25);
  v27 = vzip2q_s32(v23, v25);
  v28 = vzip1q_s32(vzip2q_s32(v21, v22), vdupq_laneq_s32(v24, 2));
  v29 = (float32x4_t)vzip1q_s32(vzip1q_s32(v26, v28), v27);
  v30 = (float32x4_t)vtrn2q_s32(v26, v27);
  v30.i32[2] = v28.i32[1];
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v44 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, v43.f32[0]), v30, *(float32x2_t *)v43.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v26, v28), vdupq_lane_s32(*(int32x2_t *)v22.i8, 1)), v43, 2);
  v45 = 0u;
  v46 = 0u;
  -[CinematicFramingRenderer calibrationParams](self, "calibrationParams");
  v31 = (float32x4_t)vtrn2q_s32(v46, v47);
  v31.i32[2] = v48.i32[1];
  v32 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(v46, v48), v47), v44.f32[0]), v31, *(float32x2_t *)v44.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v46, v48), vdupq_laneq_s32(v47, 2)), v44, 2);
  v33 = distortPoint((float32x2_t *)&v45, vdiv_f32(*(float32x2_t *)v32.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2)));
  if (SDWORD1(v50) >= 1)
  {
    v34 = vsub_f32(v33, *(float32x2_t *)((char *)&v49 + 8));
    if (sqrtf(vaddv_f32(vmul_f32(v34, v34))) > (float)SDWORD1(v50))
      return 0;
  }
  v35 = vdiv_f32(v33, *(float32x2_t *)&v45);
  v36 = v35.f32[0] >= 0.0;
  if (v35.f32[1] < 0.0)
    v36 = 0;
  if (v35.f32[0] >= 1.0)
    v36 = 0;
  return v35.f32[1] < 1.0 && v36;
}

- (void)initializeMetal
{
  MTLDevice *v3;
  MTLDevice *metalDevice;
  MTLCommandQueue *v5;
  MTLCommandQueue *commandQueue;
  void *v7;
  MTLDevice *v8;
  MTLLibrary *v9;
  id v10;
  MTLLibrary *library;
  const __CFDictionary *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
  v3 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
  metalDevice = self->_metalDevice;
  self->_metalDevice = v3;

  v5 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_metalDevice, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_metalDevice;
  v13 = 0;
  v9 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](v8, "newDefaultLibraryWithBundle:error:", v7, &v13);
  v10 = v13;
  library = self->_library;
  self->_library = v9;

  if (-[CinematicFramingRenderer _compileShaders](self, "_compileShaders"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    v14 = *MEMORY[0x1E0CA8F48];
    v15[0] = &unk_1E98AFB00;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, self->_metalDevice, 0, &self->_cvMetalTextureCacheRef);

  }
}

- (int)_compileShaders
{
  int v2;

  v2 = -[CinematicFramingRenderer _createComputePipelinesForShaders:](self, "_createComputePipelinesForShaders:", &unk_1E98AFD50);
  if (v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v2;
}

- (int)_createComputePipelinesForShaders:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTLComputePipelineState **pipelineComputeStates;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  MTLComputePipelineState *v16;
  int v17;
  id obj;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    pipelineComputeStates = self->_pipelineComputeStates;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("index"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntValue");

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pixelFormat"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntValue");

        MTLPixelFormatGetInfoForDevice();
        if ((v20 & 0x10) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kernelName"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CinematicFramingRenderer _compileComputeShader:pixelFormat:](self, "_compileComputeShader:pixelFormat:", v14, v13);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = pipelineComputeStates[v11];
          pipelineComputeStates[v11] = (MTLComputePipelineState *)v15;

          if (!pipelineComputeStates[v11])
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v17 = -12786;
            goto LABEL_11;
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v5)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)_compileComputeShader:(id)a3 pixelFormat:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
LABEL_9:
    v10 = 0;
    goto LABEL_6;
  }
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (!v6
    || (objc_msgSend(v6, "setLabel:", v5),
        v8 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", v5),
        objc_msgSend(v7, "setComputeFunction:", v8),
        v8,
        objc_msgSend(v7, "computeFunction"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_9;
  }
  v10 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](self->_metalDevice, "newComputePipelineStateWithDescriptor:options:reflection:error:", v7, 0, 0, 0);
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_6:

  return v10;
}

- (void)_setShaderParametersForDisplayRect:(CGRect)a3 outputROI:(CGRect)a4 calibrationParameters:(id *)a5 commandEncoder:(id)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  id v12;
  unsigned int v13;
  unsigned int v14;
  int32x4_t v15;
  int32x4_t v16;
  __int128 v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  int v21;
  float64x2_t v22;
  float64x2_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGFloat x;
  CGFloat y;
  int32x4_t v31;
  int32x4_t v32;
  __int128 v33;
  CGFloat width;
  CGFloat height;
  _OWORD v36[13];
  float32x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x2_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  width = a4.size.width;
  height = a4.size.height;
  x = a4.origin.x;
  y = a4.origin.y;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v12 = a6;
  -[CinematicFramingRenderer _fisheyeStrengthForDisplayRect:](self, "_fisheyeStrengthForDisplayRect:", v10, v9, v8, v7);
  v14 = v13;
  -[CinematicFramingRenderer _rotationMatrixForDisplayRect:](self, "_rotationMatrixForDisplayRect:", v10, v9, v8, v7);
  v31 = v16;
  v32 = v15;
  v33 = v17;
  -[CinematicFramingRenderer _outputPlaneSizeForDisplayRect:](self, "_outputPlaneSizeForDisplayRect:", v10, v9, v8, v7);
  v19 = v18;
  v20 = vmul_f32(v18, (float32x2_t)0xBF000000BF000000);
  v21 = -[CinematicFramingRenderer _outputPlaneCcwRotations](self, "_outputPlaneCcwRotations");
  v22.f64[0] = x;
  v22.f64[1] = y;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  v23.f64[0] = width;
  v23.f64[1] = height;
  memset(v36, 0, sizeof(v36));
  v37 = vcvt_f32_f64(v22);
  v38 = vcvt_f32_f64(v23);
  v39 = v20;
  v40 = v19;
  v42 = v33;
  v44 = DWORD1(v33);
  v41 = vzip1q_s32(v32, v31).u64[0];
  v46 = DWORD2(v33);
  v43 = vtrn2q_s32(v32, v31).u64[0];
  v45 = vzip1q_s32(vdupq_laneq_s32(v32, 2), vdupq_laneq_s32(v31, 2)).u64[0];
  v24 = *(_OWORD *)&a5[1].var4.var6;
  v53 = *(_OWORD *)&a5[1].var4.var2;
  v54 = v24;
  v25 = *(_OWORD *)&a5[1].var5.var6;
  v55 = *(_OWORD *)&a5[1].var5.var2;
  v56 = v25;
  v26 = *(_OWORD *)&a5->var5.var1;
  v49 = *(_OWORD *)&a5->var4.var5;
  v50 = v26;
  v27 = *(_OWORD *)&a5[1].var2;
  v51 = *(_OWORD *)&a5->var5.var5;
  v52 = v27;
  v28 = *(_OWORD *)&a5->var4.var1;
  v47 = *(_OWORD *)&a5->var1;
  v48 = v28;
  *(float *)&v57 = self->_stereographicFisheyeF;
  *(_QWORD *)((char *)&v57 + 4) = __PAIR64__(v21, v14);
  objc_msgSend(v12, "setBytes:length:atIndex:", v36, 464, 0);

}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (int)numCCWRotationsFromInputToFramingSpace
{
  return self->_numCCWRotationsFromInputToFramingSpace;
}

- (__n128)gravity
{
  return a1[4];
}

- ($DB21A1D7CD9E59D36D824D8119A7BF2D)calibrationParams
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[3].var4.var4;
  *(_OWORD *)&retstr[1].var4.var2 = *(_OWORD *)&self[3].var4.var0;
  *(_OWORD *)&retstr[1].var4.var6 = v3;
  v4 = *(_OWORD *)&self[3].var5.var4;
  *(_OWORD *)&retstr[1].var5.var2 = *(_OWORD *)&self[3].var5.var0;
  *(_OWORD *)&retstr[1].var5.var6 = v4;
  v5 = *(_OWORD *)&self[2].var4.var7;
  *(_OWORD *)&retstr->var4.var5 = *(_OWORD *)&self[2].var4.var3;
  *(_OWORD *)&retstr->var5.var1 = v5;
  v6 = *(_OWORD *)&self[2].var5.var7;
  *(_OWORD *)&retstr->var5.var5 = *(_OWORD *)&self[2].var5.var3;
  *(_OWORD *)&retstr[1].var2 = v6;
  v7 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self[1].var5.var6;
  *(_OWORD *)&retstr->var4.var1 = v7;
  return self;
}

- (float)additionalCameraRotation
{
  return self->_additionalCameraRotation;
}

- (int)sensorID
{
  return self->_sensorID;
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
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

- (void)setOutputROI:(CGRect)a3
{
  self->_outputROI = a3;
}

- (BOOL)cameraOrientationCorrectionEnabled
{
  return self->_cameraOrientationCorrectionEnabled;
}

- (void)setCameraOrientationCorrectionEnabled:(BOOL)a3
{
  self->_cameraOrientationCorrectionEnabled = a3;
}

- (float)fovLimit
{
  return self->_fovLimit;
}

- (void)setFovLimit:(float)a3
{
  self->_fovLimit = a3;
}

- (BOOL)visualizeViewport
{
  return self->_visualizeViewport;
}

- (void)setVisualizeViewport:(BOOL)a3
{
  self->_visualizeViewport = a3;
}

- (BOOL)frontCameraHas180DegreesRotation
{
  return self->_frontCameraHas180DegreesRotation;
}

- (void)setFrontCameraHas180DegreesRotation:(BOOL)a3
{
  self->_frontCameraHas180DegreesRotation = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  NSMutableDictionary **v4;
  uint64_t i;

  v3 = 0;
  v4 = &self->_kalmanFilterManager[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  objc_storeStrong((id *)&self->_options, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_pipelineComputeStates[i + 1], 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end
