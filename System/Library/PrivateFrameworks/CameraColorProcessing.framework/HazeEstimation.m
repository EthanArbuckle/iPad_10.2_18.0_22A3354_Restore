@implementation HazeEstimation

- (int)createShaders
{
  MTLComputePipelineState *v3;
  MTLComputePipelineState *computePipelineHazeThumbnailGeneration;

  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("Haze::hazeThumbnailGeneration"), 0);
  v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  computePipelineHazeThumbnailGeneration = self->_computePipelineHazeThumbnailGeneration;
  self->_computePipelineHazeThumbnailGeneration = v3;

  if (self->_computePipelineHazeThumbnailGeneration)
    return 0;
  else
    return FigSignalErrorAt();
}

- (int)configure
{
  *(_QWORD *)self->_anon_28 = 0xC000000120;
  self->_hazeConfigured = 1;
  return 0;
}

- (int)allocInternalData
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MTLTexture *v14;
  MTLTexture *thumbnailTexture;
  MTLBuffer *v16;
  MTLBuffer *hazeInternalBuffer;
  int v18;

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newTextureDescriptor");

  if (!v4)
    goto LABEL_7;
  FigMetalDecRef();
  FigMetalDecRef();
  if (!self->_hazeConfigured)
    goto LABEL_7;
  objc_msgSend(v4, "desc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextureType:", 2);

  v6 = *(_QWORD *)self->_anon_28;
  objc_msgSend(v4, "desc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWidth:", v6);

  v8 = *(unsigned int *)&self->_anon_28[4];
  objc_msgSend(v4, "desc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeight:", v8);

  objc_msgSend(v4, "desc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDepth:", 1);

  objc_msgSend(v4, "desc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsage:", 7);

  objc_msgSend(v4, "desc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPixelFormat:", 115);

  objc_msgSend(v4, "setLabel:", CFSTR("haze_estimation_thumbnail_tex"));
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (MTLTexture *)objc_msgSend(v13, "newTextureWithDescriptor:", v4);
  thumbnailTexture = self->_thumbnailTexture;
  self->_thumbnailTexture = v14;

  if (!self->_thumbnailTexture)
    goto LABEL_7;
  v16 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 884784, 0);
  hazeInternalBuffer = self->_hazeInternalBuffer;
  self->_hazeInternalBuffer = v16;

  if (self->_hazeInternalBuffer)
    v18 = 0;
  else
LABEL_7:
    v18 = FigSignalErrorAt();

  return v18;
}

- (HazeEstimation)initWithMetalContext:(id)a3
{
  id v5;
  MTLDevice *v6;
  MTLDevice *device;
  HazeEstimation *v8;
  HazeProperties *v9;
  HazeProperties *hazeProperties;
  MTLCommandQueue *v11;
  MTLCommandQueue *commandQueue;
  HazeEstimation *v13;
  NSObject *v15;
  objc_super v16;
  os_log_type_t type;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v15 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_metalContext, a3);
  objc_msgSend(v5, "device");
  v6 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  self->_device = v6;

  v16.receiver = self;
  v16.super_class = (Class)HazeEstimation;
  v8 = -[HazeEstimation init](&v16, sel_init);
  self = v8;
  if (!v8 || -[HazeEstimation createShaders](v8, "createShaders"))
    goto LABEL_10;
  v9 = (HazeProperties *)objc_opt_new();
  hazeProperties = self->_hazeProperties;
  self->_hazeProperties = v9;

  if (!self->_hazeProperties)
  {
    FigSignalErrorAt();
    goto LABEL_10;
  }
  self->_hazeConfigured = 0;
  if (-[HazeEstimation configure](self, "configure"))
  {
LABEL_10:
    v13 = 0;
    goto LABEL_7;
  }
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v11 = (MTLCommandQueue *)objc_claimAutoreleasedReturnValue();
  commandQueue = self->_commandQueue;
  self->_commandQueue = v11;

  self = self;
  v13 = self;
LABEL_7:

  return v13;
}

- (void)releaseTextures
{
  MTLTexture *inputRGBTexture;

  inputRGBTexture = self->_inputRGBTexture;
  self->_inputRGBTexture = 0;

}

- (int)run
{
  int v3;
  int v4;

  v3 = -[HazeEstimation allocInternalData](self, "allocInternalData");
  if (!v3)
  {
    v3 = -[HazeEstimation prepareThumbnail](self, "prepareThumbnail");
    if (!v3)
      v3 = -[HazeEstimation estimateHaze:](self, "estimateHaze:", -[MTLBuffer contents](self->_hazeInternalBuffer, "contents") + 48);
  }
  v4 = v3;
  FigMetalDecRef();
  FigMetalDecRef();
  return v4;
}

- (int)prepareThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  int v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int64x2_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "computeCommandEncoder"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "setComputePipelineState:", self->_computePipelineHazeThumbnailGeneration);
    objc_msgSend(v6, "setTexture:atIndex:", self->_inputRGBTexture, 0);
    objc_msgSend(v6, "setTexture:atIndex:", self->_thumbnailTexture, 1);
    objc_msgSend(v6, "setBuffer:offset:atIndex:", self->_hazeInternalBuffer, 48, 0);
    objc_msgSend(v6, "setBytes:length:atIndex:", &self->_hazeROI, 16, 1);
    v7 = *(_QWORD *)self->_anon_28;
    *(_QWORD *)&v8 = v7;
    *((_QWORD *)&v8 + 1) = HIDWORD(v7);
    v16 = v8;
    v17 = 1;
    v14 = vdupq_n_s64(0x20uLL);
    v15 = 1;
    objc_msgSend(v6, "dispatchThreads:threadsPerThreadgroup:", &v16, &v14);
    objc_msgSend(v6, "endEncoding");

    v9 = 0;
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v9 = -1;
  }
  objc_msgSend(v4, "commit", v12, v13);
  objc_msgSend(v4, "waitUntilCompleted");

  return v9;
}

- (int)estimateHaze:(HazeEstimation *)self
{
  float32x4_t *v2;
  float32x4_t *v3;
  float v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  float32x4_t v10;
  float32x4_t *v11;
  float32x4_t v12;
  uint64_t v13;
  float32x4_t v14;
  uint64_t v16;
  float *v17;
  float32x4_t v18;
  float v19;
  __int128 v20;
  int v21;
  __int128 v22;
  NSObject *v24;
  float32x4_t v25;
  float32x4_t v26;

  v3 = v2;
  -[HazeProperties maxHazePercentile](self->_hazeProperties, "maxHazePercentile");
  v6 = (int)(float)((float)(v5 * 55296.0) * 0.25);
  v7 = malloc_type_malloc(16 * v6, 0x1000040451B5BE8uLL);
  v8 = v7;
  if (!v7)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v24 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v21 = -1;
    goto LABEL_22;
  }
  memcpy(v7, v3, 16 * v6);
  qsort(v8, v6, 0x10uLL, (int (__cdecl *)(const void *, const void *))compareFloat4Luma);
  if (v6 < 1)
  {
    v10 = 0uLL;
    goto LABEL_8;
  }
  v9 = v6;
  v10 = 0uLL;
  v11 = v3;
  do
  {
    v12 = *v11++;
    v10 = vaddq_f32(v10, v12);
    --v9;
  }
  while (v9);
  if (v6 <= 55295)
  {
LABEL_8:
    v13 = v6;
    do
    {
      v14 = v3[v13];
      if (v14.f32[3] <= *((float *)v8 + 4 * v6 - 1) && v6 >= 1)
      {
        v16 = v6;
        v17 = (float *)v8;
        while (v14.f32[3] >= v17[3])
        {
          v17 += 4;
          if (!--v16)
            goto LABEL_18;
        }
        v25 = v3[v13];
        v26 = v10;
        memmove(v17 + 4, v17, 16 * ((int)v16 - 1));
        v14 = v25;
        v10 = v26;
        *(float32x4_t *)v17 = v3[v13];
      }
LABEL_18:
      v10 = vaddq_f32(v10, v14);
      ++v13;
    }
    while ((_DWORD)v13 != 55296);
  }
  v18 = vdivq_f32(v10, (float32x4_t)vdupq_n_s32(0x47580000u));
  v19 = vminvq_f32(v18) / 10.0;
  v18.f32[0] = v19;
  -[HazeEstimation calculateHazeValues:pixels:thresh:properties:](self, "calculateHazeValues:pixels:thresh:properties:", v6, v8, self->_hazeProperties, *(double *)v18.i64);
  *(_OWORD *)self->_hazeValue = v20;
  if (self->_hazePropertiesForLTM)
  {
    *(float *)&v20 = v19;
    -[HazeEstimation calculateHazeValues:pixels:thresh:properties:](self, "calculateHazeValues:pixels:thresh:properties:", v6, v8, *(double *)&v20);
    v21 = 0;
    *(_OWORD *)self->_hazeValueForLTM = v22;
  }
  else
  {
    v21 = 0;
  }
LABEL_22:
  free(v8);
  return v21;
}

- (__n128)calculateHazeValues:(uint64_t)a3 pixels:(int)a4 thresh:(float32x4_t *)a5 properties:(void *)a6
{
  id v9;
  simd_float4 v10;
  uint64_t v11;
  float32x4_t v12;
  uint64_t v13;
  simd_float4 *v14;
  simd_float4 v15;
  int32x2_t v16;
  float v17;
  int32x2_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x2_t v23;
  float v24;
  float v25;
  float v26;
  int32x2_t v27;
  float32x4_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  int32x2_t v45;
  float v46;
  float v47;
  int32x2_t v48;
  float v49;
  int32x2_t v50;
  float v51;
  float v52;
  float v53;
  int32x2_t v54;
  float v56;
  float32x4_t v57;
  float32x4_t v58;
  simd_float4 xa;
  simd_float4 xb;
  simd_float4 x;
  int32x2_t xc;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;

  v9 = a6;
  v11 = a4;
  v12 = 0uLL;
  if (a4 >= 1)
  {
    v13 = a4;
    v14 = (simd_float4 *)a5;
    do
    {
      v15 = *v14++;
      v63 = v12;
      objc_msgSend(v9, "sr_pow");
      v10 = _simd_pow_f4(v15, (simd_float4)vdupq_lane_s32(v16, 0));
      v12 = vaddq_f32(v63, (float32x4_t)v10);
      --v13;
    }
    while (v13);
  }
  v10.f32[0] = (float)a4;
  v64 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 0);
  xa = (simd_float4)vdivq_f32(v12, v64);
  objc_msgSend(v9, "sr_pow");
  *(float *)v18.i32 = 1.0 / v17;
  v19 = (float32x4_t)_simd_pow_f4(xa, (simd_float4)vdupq_lane_s32(v18, 0));
  v20 = 0uLL;
  if (a4 >= 1)
  {
    do
    {
      v21 = *a5++;
      v22 = vsubq_f32(v21, v19);
      v20 = vmlaq_f32(v20, v22, v22);
      --v11;
    }
    while (v11);
  }
  xb = (simd_float4)vsqrtq_f32(vdivq_f32(v20, v64));
  v65 = v19;
  objc_msgSend(v9, "sr_var");
  v66 = vmlsq_lane_f32(v65, (float32x4_t)xb, v23, 0);
  objc_msgSend(v9, "min_display_black");
  v25 = v24;
  objc_msgSend(v9, "evmExpRatio");
  *(float *)v27.i32 = v25 * v26;
  v28 = vsubq_f32(v66, (float32x4_t)vdupq_lane_s32(v27, 0));
  v67 = (float32x4_t)vdupq_n_s32(0x358637BDu);
  x = (simd_float4)vmaxnmq_f32(v28, v67);
  objc_msgSend(v9, "evtBkt");
  v30 = v29 * vmuls_lane_f32(256.0, (float32x4_t)x, 3);
  objc_msgSend(v9, "reluC1");
  v32 = v31;
  objc_msgSend(v9, "reluC2");
  v34 = v33;
  objc_msgSend(v9, "reluC3");
  v36 = (float)(v35 * a1) * 1024.0;
  objc_msgSend(v9, "reluC4");
  *(float *)&v38 = *(float *)&v38 * 1024.0;
  if (v30 < v36)
  {
    v39 = (float)(v32 * a1) * 1024.0;
    if (v30 <= v39)
      *(float *)&v38 = v34 * 1024.0;
    else
      *(float *)&v38 = (float)(v34 * 1024.0)
                     + (float)((float)((float)(*(float *)&v38 - (float)(v34 * 1024.0)) / (float)(v36 - v39))
                             * (float)(v30 - v39));
  }
  *(float *)&v38 = *(float *)&v38 * 0.00097656;
  objc_msgSend(v9, "reluC1", v38, v37);
  v41 = v40 * a1;
  objc_msgSend(v9, "reluC5");
  v43 = v41 * v42;
  objc_msgSend(v9, "reluC2");
  *(float *)v45.i32 = v43 * (float)(v44 - v56);
  v57 = vmlaq_n_f32((float32x4_t)vdupq_lane_s32(v45, 0), (float32x4_t)x, v56);
  v46 = vminvq_f32(v57);
  objc_msgSend(v9, "sr_sat");
  *(double *)&v48 = fmax((float)((float)(vmaxvq_f32(v57) / v46) - v47), 1.0);
  *(float *)v48.i32 = *(double *)v48.i32;
  xc = v48;
  objc_msgSend(v9, "sr_min");
  *(float *)v50.i32 = v46 * v49;
  v58 = vsubq_f32(v57, (float32x4_t)vdupq_lane_s32(v50, 0));
  objc_msgSend(v9, "min_display_black");
  v52 = v51;
  objc_msgSend(v9, "evmExpRatio");
  *(float *)v54.i32 = v52 * v53;
  v68 = vdivq_f32(vmaxnmq_f32(vsubq_f32(v58, (float32x4_t)vdupq_lane_s32(v54, 0)), v67), (float32x4_t)vdupq_lane_s32(xc, 0));

  return (__n128)v68;
}

- (MTLTexture)inputRGBTexture
{
  return self->_inputRGBTexture;
}

- (void)setInputRGBTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputRGBTexture, a3);
}

- (__n128)hazeValue
{
  return a1[6];
}

- (void)setHazeValue:(HazeEstimation *)self
{
  __int128 v2;

  *(_OWORD *)self->_hazeValue = v2;
}

- (SourceROI)hazeROI
{
  uint64_t v2;
  uint64_t v3;
  SourceROI result;

  v2 = *(_QWORD *)&self->_hazeROI.EndX;
  v3 = *(_QWORD *)&self->_hazeROI.StartX;
  result.EndX = v2;
  result.EndY = HIDWORD(v2);
  result.StartX = v3;
  result.StartY = HIDWORD(v3);
  return result;
}

- (void)setHazeROI:(SourceROI)a3
{
  self->_hazeROI = a3;
}

- (__n128)hazeValueForLTM
{
  return a1[9];
}

- (void)setHazeValueForLTM:(HazeEstimation *)self
{
  __int128 v2;

  *(_OWORD *)self->_hazeValueForLTM = v2;
}

- (HazeProperties)hazeProperties
{
  return self->_hazeProperties;
}

- (void)setHazeProperties:(id)a3
{
  objc_storeStrong((id *)&self->_hazeProperties, a3);
}

- (HazeProperties)hazePropertiesForLTM
{
  return self->_hazePropertiesForLTM;
}

- (void)setHazePropertiesForLTM:(id)a3
{
  objc_storeStrong((id *)&self->_hazePropertiesForLTM, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hazePropertiesForLTM, 0);
  objc_storeStrong((id *)&self->_inputRGBTexture, 0);
  objc_storeStrong((id *)&self->_hazeProperties, 0);
  objc_storeStrong((id *)&self->_hazeInternalBuffer, 0);
  objc_storeStrong((id *)&self->_thumbnailTexture, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_computePipelineHazeThumbnailGeneration, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
