@implementation Normalization

- (Normalization)init
{
  return -[Normalization initWithMode:](self, "initWithMode:", 0);
}

- (Normalization)initWithMode:(int64_t)a3
{
  Normalization *v4;
  Normalization *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)Normalization;
  v4 = -[FRCMetalBase init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_selfNormalization = 1;
    if (a3 == 1)
      v4->_disableSIMDSum = 1;
    -[Normalization setupMetal](v4, "setupMetal");
  }
  return v5;
}

- (void)setupMetal
{
  int AppBooleanValue;
  void *v4;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *statisticsPlanarKernel;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *statisticsPackedKernel;
  const __CFString *v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *statisticsYUV420Kernel;
  MTLComputePipelineState *v20;
  MTLComputePipelineState *normalizePlanarToPlanarKernel;
  MTLComputePipelineState *v22;
  MTLComputePipelineState *normalizePackedToPlanarKernel;
  MTLComputePipelineState *v24;
  MTLComputePipelineState *normalizeYUV420ToPlanarKernel;
  MTLComputePipelineState *v26;
  MTLComputePipelineState *denormalizeToPlanarKernel;
  MTLComputePipelineState *v28;
  MTLComputePipelineState *denormalizeKernel;
  MTLRenderPipelineState *v30;
  MTLRenderPipelineState *denormalizeYCbCr8RenderKernel;
  MTLRenderPipelineState *v32;
  MTLRenderPipelineState *denormalizeYCbCr10RenderKernel;
  MTLRenderPipelineState *v34;
  MTLRenderPipelineState *denormalizeYCbCr10UnpackedRenderKernel;
  MTLBuffer *v36;
  MTLBuffer *vertsBuffer;
  MTLBuffer *v38;
  MTLBuffer *firstParamBuffer;
  MTLBuffer *v40;
  MTLBuffer *secondParamBuffer;
  MTLSharedEvent *v42;
  MTLSharedEvent *sharedEvent;
  OS_dispatch_queue *v44;
  OS_dispatch_queue *synchronizationQueue;
  MTLSharedEventListener *v46;
  MTLSharedEventListener *sharedEventListener;
  Boolean keyExistsAndHasValidFormat[2];

  *(_WORD *)keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PaintFrames"), CFSTR("com.apple.FRC"), keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
    keyExistsAndHasValidFormat[1] = AppBooleanValue != 0;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setConstantValue:type:withName:", &keyExistsAndHasValidFormat[1], 53, CFSTR("paintFrame"));
  if (!self->_disableSIMDSum
    && -[MTLDevice supportsFamily:](self->super._device, "supportsFamily:", 1007))
  {
    self->_useSIMDSum = 1;
    self->_useFloatAtomic = 1;
  }
  if (self->_useSIMDSum)
  {
    if (self->_useFloatAtomic)
    {
      -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcStatisticsPlanarSIMDAtomicAdd"));
      v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      statisticsPlanarKernel = self->_statisticsPlanarKernel;
      self->_statisticsPlanarKernel = v5;

      -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcStatisticsPackedSIMDAtomicAdd"));
      v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      statisticsPackedKernel = self->_statisticsPackedKernel;
      self->_statisticsPackedKernel = v7;

      v9 = CFSTR("calcStatisticsYUV420SIMDAtomicAdd");
    }
    else
    {
      -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcStatisticsPlanarSIMD"));
      v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      v15 = self->_statisticsPlanarKernel;
      self->_statisticsPlanarKernel = v14;

      -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcStatisticsPackedSIMD"));
      v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      v17 = self->_statisticsPackedKernel;
      self->_statisticsPackedKernel = v16;

      v9 = CFSTR("calcStatisticsYUV420SIMD");
    }
  }
  else
  {
    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcStatisticsPlanar"));
    v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v11 = self->_statisticsPlanarKernel;
    self->_statisticsPlanarKernel = v10;

    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcStatisticsPacked"));
    v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v13 = self->_statisticsPackedKernel;
    self->_statisticsPackedKernel = v12;

    v9 = CFSTR("calcStatisticsYUV420");
  }
  -[FRCMetalBase createKernel:](self, "createKernel:", v9);
  v18 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  statisticsYUV420Kernel = self->_statisticsYUV420Kernel;
  self->_statisticsYUV420Kernel = v18;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("normalizeTextureNonInterleaved"));
  v20 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  normalizePlanarToPlanarKernel = self->_normalizePlanarToPlanarKernel;
  self->_normalizePlanarToPlanarKernel = v20;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("normalizeToTextureArray"));
  v22 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  normalizePackedToPlanarKernel = self->_normalizePackedToPlanarKernel;
  self->_normalizePackedToPlanarKernel = v22;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("normalizeYUV420ToTextureArray"));
  v24 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  normalizeYUV420ToPlanarKernel = self->_normalizeYUV420ToPlanarKernel;
  self->_normalizeYUV420ToPlanarKernel = v24;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("denormalizeToPlanarTexture"));
  v26 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  denormalizeToPlanarKernel = self->_denormalizeToPlanarKernel;
  self->_denormalizeToPlanarKernel = v26;

  -[FRCMetalBase createKernel:constantValues:](self, "createKernel:constantValues:", CFSTR("denormalize"), v4);
  v28 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  denormalizeKernel = self->_denormalizeKernel;
  self->_denormalizeKernel = v28;

  -[FRCMetalBase createRenderKernel:renderTargetFormat:](self, "createRenderKernel:renderTargetFormat:", CFSTR("denormalizeToYCbCrFragment"), 500);
  v30 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  denormalizeYCbCr8RenderKernel = self->_denormalizeYCbCr8RenderKernel;
  self->_denormalizeYCbCr8RenderKernel = v30;

  if (-[MTLDevice supportsFamily:](self->super._device, "supportsFamily:", 1007))
  {
    -[FRCMetalBase createRenderKernel:renderTargetFormat:](self, "createRenderKernel:renderTargetFormat:", CFSTR("denormalizeToYCbCrFragment"), 508);
    v32 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    denormalizeYCbCr10RenderKernel = self->_denormalizeYCbCr10RenderKernel;
    self->_denormalizeYCbCr10RenderKernel = v32;

    -[FRCMetalBase createRenderKernel:renderTargetFormat:](self, "createRenderKernel:renderTargetFormat:", CFSTR("denormalizeToYCbCrFragment"), 505);
    v34 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    denormalizeYCbCr10UnpackedRenderKernel = self->_denormalizeYCbCr10UnpackedRenderKernel;
    self->_denormalizeYCbCr10UnpackedRenderKernel = v34;

  }
  v36 = -[FRCMetalBase newVertexBuffer](self, "newVertexBuffer");
  vertsBuffer = self->_vertsBuffer;
  self->_vertsBuffer = v36;

  v38 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 8, 0);
  firstParamBuffer = self->_firstParamBuffer;
  self->_firstParamBuffer = v38;

  v40 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 8, 0);
  secondParamBuffer = self->_secondParamBuffer;
  self->_secondParamBuffer = v40;

  v42 = (MTLSharedEvent *)-[MTLDevice newSharedEvent](self->super._device, "newSharedEvent");
  sharedEvent = self->_sharedEvent;
  self->_sharedEvent = v42;

  v44 = (OS_dispatch_queue *)dispatch_queue_create("com.FRC.Normalization", 0);
  synchronizationQueue = self->_synchronizationQueue;
  self->_synchronizationQueue = v44;

  v46 = (MTLSharedEventListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6B88]), "initWithDispatchQueue:", self->_synchronizationQueue);
  sharedEventListener = self->_sharedEventListener;
  self->_sharedEventListener = v46;

  self->_signalValue = 1;
}

- ($18698D32E93F98CA3BC0140E41567ABB)calcDeNormParamsFromNormaParams:(id *)a3 timeScale:(float)a4
{
  int var4;
  float var0;
  unint64_t v6;
  $18698D32E93F98CA3BC0140E41567ABB result;

  var4 = a3->var4;
  if (self->_selfNormalization)
    var0 = (float)(a3->var2[1] * a4) + (float)((float)(1.0 - a4) * a3->var2[0]);
  else
    var0 = a3->var0;
  v6 = LODWORD(var0) | ((unint64_t)COERCE_UNSIGNED_INT(1.0 / a3->var1) << 32);
  result.var0 = *(float *)&v6;
  result.var1 = *((float *)&v6 + 1);
  result.var2 = var4;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)calcAnchorParamsFromNormParams:(id *)a3 anchor:(int)a4
{
  int v4;
  char *v7;
  float var1;
  float var0;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = a4;
  if (a4 >= 2)
  {
    NSLog(CFSTR("anchor frame can only be 0 or 1 %d !!!"), a2, a4);
    v4 = v4 > 0;
  }
  if (self->_selfNormalization)
  {
    v7 = (char *)(&a3->var0 + v4);
    a3 = ($4A63ACB5D0C6D58F6F3C6C6671DE9604 *)(v7 + 8);
    var1 = 1.0 / *((float *)v7 + 4);
  }
  else
  {
    var1 = a3->var1;
  }
  var0 = a3->var0;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)calcFrameStatistics:(__CVBuffer *)a3
{
  void *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  $94F468A8D4C62B317260615823C2B210 result;

  createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 1uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[Normalization calcTextureStatistics:](self, "calcTextureStatistics:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerGroupForStats
{
  unint64_t v3;

  v3 = 32;
  if (!BYTE2(self[8].var0))
    v3 = 8;
  retstr->var0 = v3;
  retstr->var1 = v3;
  retstr->var2 = 1;
  return self;
}

- (id)statsBufferForTexture:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "width");
  v6 = objc_msgSend(v4, "height");

  -[Normalization threadsPerGroupForStats](self, "threadsPerGroupForStats");
  if (self->_useFloatAtomic)
    v7 = 8;
  else
    v7 = 8 * (v5 - 1) / 0uLL * ((v6 - 1) / 0uLL);
  return (id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", v7, 0);
}

- ($94F468A8D4C62B317260615823C2B210)calcTextureStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = a3;
  -[Normalization statsBufferForTexture:](self, "statsBufferForTexture:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[Normalization encodeStatisticsToCommandBuffer:texture:stats:](self, "encodeStatisticsToCommandBuffer:texture:stats:", v6, v4, v5);

  kdebug_trace();
  objc_msgSend(v6, "commit");
  objc_msgSend(v6, "waitUntilCompleted");
  kdebug_trace();
  -[Normalization calcTextureStatisticsFromStatsBuffer:](self, "calcTextureStatisticsFromStatsBuffer:", v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)calcTextureStatisticsFromStatsBuffer:(id)a3
{
  id v4;
  _BOOL4 useFloatAtomic;
  id v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  unint64_t v10;
  uint64_t v11;
  float32x2_t v12;
  float v13;
  float v14;
  float v15;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = a3;
  useFloatAtomic = self->_useFloatAtomic;
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "contents");
  v8 = v7;
  if (useFloatAtomic)
  {
    v9 = *(float *)(v7 + 4);
    v15 = *(float *)v7;
  }
  else
  {
    v10 = objc_msgSend(v6, "length");
    if (v10 >= 8)
    {
      v11 = 0;
      v12 = 0;
      do
        v12 = vadd_f32(v12, *(float32x2_t *)(v8 + 8 * v11++));
      while (v10 >> 3 > v11);
      v15 = v12.f32[0];
      v9 = v12.f32[1] + 0.000000001;
    }
    else
    {
      v15 = 0.0;
      v9 = 0.000000001;
    }
  }

  v13 = v15;
  v14 = v9;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)encodeStatisticsToCommandBuffer:(id)a3 texture:(id)a4 stats:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  int *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];
  __int128 v20;
  uint64_t v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_msgSend(v8, "width");
  v12 = objc_msgSend(v8, "height");
  v20 = 0uLL;
  v21 = 0;
  -[Normalization threadsPerGroupForStats](self, "threadsPerGroupForStats");
  v13 = v20;
  objc_msgSend(v10, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (isTextureYUV420(v8))
  {
    v15 = &OBJC_IVAR___Normalization__statisticsYUV420Kernel;
  }
  else
  {
    v16 = objc_msgSend(v8, "pixelFormat");
    v15 = &OBJC_IVAR___Normalization__statisticsPackedKernel;
    if (v16 == 25)
      v15 = &OBJC_IVAR___Normalization__statisticsPlanarKernel;
  }
  objc_msgSend(v14, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v15));
  objc_msgSend(v14, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v14, "setBuffer:offset:atIndex:", v9, 0, 0);

  v19[0] = (v11 + (uint64_t)v13 - 1) / (unint64_t)v13;
  v19[1] = (unint64_t)(v12 + *((_QWORD *)&v13 + 1) - 1) / *((_QWORD *)&v13 + 1);
  v19[2] = 1;
  v17 = v20;
  v18 = v21;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v19, &v17);
  objc_msgSend(v14, "endEncoding");

}

- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 normParamBuffer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int *v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t v20;
  _QWORD v21[3];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = objc_msgSend(v11, "width");
  v15 = objc_msgSend(v11, "height");
  objc_msgSend(v13, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (isTextureYUV420(v10))
  {
    v17 = &OBJC_IVAR___Normalization__normalizeYUV420ToPlanarKernel;
  }
  else
  {
    v18 = objc_msgSend(v10, "arrayLength");
    v17 = &OBJC_IVAR___Normalization__normalizePlanarToPlanarKernel;
    if (v18 == 1)
      v17 = &OBJC_IVAR___Normalization__normalizePackedToPlanarKernel;
  }
  objc_msgSend(v16, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v17));
  objc_msgSend(v16, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v16, "setBuffer:offset:atIndex:", v12, 0, 0);

  v21[0] = (unint64_t)(v14 + 15) >> 4;
  v21[1] = (unint64_t)(v15 + 15) >> 4;
  v21[2] = 1;
  v19 = vdupq_n_s64(0x10uLL);
  v20 = 1;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v21, &v19);
  objc_msgSend(v16, "endEncoding");

}

- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6
{
  float var1;
  float var0;
  MTLDevice *device;
  id v12;
  id v13;
  id v14;
  float *v15;
  id v16;

  var1 = a6.var1;
  var0 = a6.var0;
  device = self->super._device;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v16 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](device, "newBufferWithLength:options:", 8, 0));
  v15 = (float *)objc_msgSend(v16, "contents");
  *v15 = var0;
  v15[1] = var1;
  -[Normalization encodeNormalizationToCommandBuffer:source:destination:configBuffer:](self, "encodeNormalizationToCommandBuffer:source:destination:configBuffer:", v14, v13, v12, v16);

}

- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 configBuffer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int *v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t v20;
  _QWORD v21[3];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = objc_msgSend(v11, "width");
  v15 = objc_msgSend(v11, "height");
  objc_msgSend(v13, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (isTextureYUV420(v10))
  {
    v17 = &OBJC_IVAR___Normalization__normalizeYUV420ToPlanarKernel;
  }
  else
  {
    v18 = objc_msgSend(v10, "arrayLength");
    v17 = &OBJC_IVAR___Normalization__normalizePlanarToPlanarKernel;
    if (v18 == 1)
      v17 = &OBJC_IVAR___Normalization__normalizePackedToPlanarKernel;
  }
  objc_msgSend(v16, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v17));
  objc_msgSend(v16, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v16, "setBuffer:offset:atIndex:", v12, 0, 0);

  v21[0] = (unint64_t)(v14 + 15) >> 4;
  v21[1] = (unint64_t)(v15 + 15) >> 4;
  v21[2] = 1;
  v19 = vdupq_n_s64(0x10uLL);
  v20 = 1;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v21, &v19);
  objc_msgSend(v16, "endEncoding");

}

- (void)normalizeFramesFirstInput:(__CVBuffer *)a3 secondInput:(__CVBuffer *)a4 firstOutput:(__CVBuffer *)a5 secondOutput:(__CVBuffer *)a6 callback:(id)a7
{
  id v12;
  size_t Width;
  size_t Height;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  MTLSharedEventListener *sharedEventListener;
  unint64_t signalValue;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  MTLSharedEvent *sharedEvent;
  void *v27;
  void *v28;
  id obj;
  void *v30;
  _QWORD v31[5];
  id v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  Normalization *v36;
  id v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD v41[7];
  int v42;

  v12 = a7;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x4010000000;
  v41[3] = &unk_1D4294449;
  memset(&v41[4], 0, 24);
  v42 = 0;
  if (a3 || !a5)
  {
    Width = CVPixelBufferGetWidth(a4);
    v27 = v12;
    Height = CVPixelBufferGetHeight(a4);
    if (isYUV420(a4))
    {
      if (a3)
      {
        createYUV420TextureFromCVPixelBuffer(a3, self->super._device);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      createYUV420TextureFromCVPixelBuffer(a4, self->super._device);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 3 * Width * Height;
    }
    else if (isPackedRGBA(a4))
    {
      if (a3)
      {
        createRGBATextureFromCVPixelBuffer(a3, self->super._device);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      createRGBATextureFromCVPixelBuffer(a4, self->super._device);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 3 * Width * Height;
    }
    else
    {
      if (a3)
      {
        createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 3uLL);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 3uLL);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = Height * Width;
    }
    if (a5)
    {
      createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 3uLL);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    createTexturesFromCVPixelBuffer(a6, self->super._device, 1, 3uLL);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[Normalization statsBufferForTexture:](self, "statsBufferForTexture:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[Normalization statsBufferForTexture:](self, "statsBufferForTexture:", v30);
    obj = (id)objc_claimAutoreleasedReturnValue();
    sharedEvent = self->_sharedEvent;
    sharedEventListener = self->_sharedEventListener;
    signalValue = self->_signalValue;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __89__Normalization_normalizeFramesFirstInput_secondInput_firstOutput_secondOutput_callback___block_invoke;
    v34[3] = &unk_1E97868D0;
    v22 = v15;
    v35 = v22;
    v36 = self;
    v23 = v19;
    v37 = v23;
    v24 = obj;
    v38 = v24;
    v39 = v41;
    v40 = v16;
    v25 = signalValue;
    v12 = v27;
    -[MTLSharedEvent notifyListener:atValue:block:](sharedEvent, "notifyListener:atValue:block:", sharedEventListener, v25, v34);
    if (v22)
      -[Normalization encodeStatisticsToCommandBuffer:texture:stats:](self, "encodeStatisticsToCommandBuffer:texture:stats:", v18, v22, v23);
    -[Normalization encodeStatisticsToCommandBuffer:texture:stats:](self, "encodeStatisticsToCommandBuffer:texture:stats:", v18, v30, v24, sharedEvent);
    objc_msgSend(v18, "encodeSignalEvent:value:", self->_sharedEvent, self->_signalValue);
    objc_msgSend(v18, "encodeWaitForEvent:value:", self->_sharedEvent, self->_signalValue + 1);
    if (v22)
      -[Normalization encodeNormalizationToCommandBuffer:source:destination:normParamBuffer:](self, "encodeNormalizationToCommandBuffer:source:destination:normParamBuffer:", v18, v22, v28, self->_firstParamBuffer);
    -[Normalization encodeNormalizationToCommandBuffer:source:destination:normParamBuffer:](self, "encodeNormalizationToCommandBuffer:source:destination:normParamBuffer:", v18, v30, v17, self->_secondParamBuffer);
    objc_storeStrong((id *)&self->_prevStatsBuffer, obj);
    kdebug_trace();
    if (v27)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __89__Normalization_normalizeFramesFirstInput_secondInput_firstOutput_secondOutput_callback___block_invoke_2;
      v31[3] = &unk_1E97868F8;
      v32 = v27;
      v33 = v41;
      v31[4] = self;
      objc_msgSend(v18, "addCompletedHandler:", v31);

    }
    objc_msgSend(v18, "commit");
    if (v27)
      objc_msgSend(v18, "waitUntilScheduled");
    else
      objc_msgSend(v18, "waitUntilCompleted");
    kdebug_trace();

  }
  else
  {
    NSLog(CFSTR("Normalization: Error! when firstInput is nil, firstOutput must be nil as well"));
  }
  _Block_object_dispose(v41, 8);

}

void __89__Normalization_normalizeFramesFirstInput_secondInput_firstOutput_secondOutput_callback___block_invoke(_QWORD *a1, void *a2)
{
  float *v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float *v8;
  float v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _BYTE v15[28];

  v14 = a2;
  v3 = (float *)a1[5];
  if (a1[4])
  {
    objc_msgSend(v3, "calcTextureStatisticsFromStatsBuffer:", a1[6]);
    v5 = v4;
    v7 = v6;
    v3 = (float *)a1[5];
  }
  else
  {
    v5 = v3[32];
    v7 = v3[33];
  }
  objc_msgSend(v3, "calcTextureStatisticsFromStatsBuffer:", a1[7]);
  v8 = (float *)(a1[5] + 128);
  *v8 = v9;
  v8[1] = v10;
  calcNormalizationParams(a1[9], (uint64_t)v15, v5, v7, v9, v10);
  v11 = *(_QWORD *)(a1[8] + 8);
  *(_OWORD *)(v11 + 32) = *(_OWORD *)v15;
  *(_OWORD *)(v11 + 44) = *(_OWORD *)&v15[12];
  v12 = objc_msgSend(*(id *)(a1[5] + 176), "contents");
  *(_DWORD *)v12 = *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  *(float *)(v12 + 4) = 1.0 / *(float *)(*(_QWORD *)(a1[8] + 8) + 48);
  v13 = objc_msgSend(*(id *)(a1[5] + 184), "contents");
  *(_DWORD *)v13 = *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 44);
  *(float *)(v13 + 4) = 1.0 / *(float *)(*(_QWORD *)(a1[8] + 8) + 52);
  objc_msgSend(v14, "setSignaledValue:", *(_QWORD *)(a1[5] + 168) + 1);

}

uint64_t __89__Normalization_normalizeFramesFirstInput_secondInput_firstOutput_secondOutput_callback___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, _OWORD *, uint64_t, uint64_t);
  uint64_t result;
  _OWORD v9[2];

  v5 = a1[5];
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v5 + 16);
  v9[0] = *(_OWORD *)(v6 + 32);
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)(v6 + 44);
  result = v7(v5, v9, a3, a4);
  *(_QWORD *)(a1[4] + 168) += 2;
  return result;
}

- (void)normalizeWithParmas:(id *)a3 firstInput:(__CVBuffer *)a4 secondInput:(__CVBuffer *)a5 firstOutput:(__CVBuffer *)a6 secondOutput:(__CVBuffer *)a7
{
  int v13;
  MTLDevice *device;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BYTE v32[28];

  v13 = isPackedRGBA(a4);
  device = self->super._device;
  if (v13)
  {
    createRGBATextureFromCVPixelBuffer(a4, device);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    createRGBATextureFromCVPixelBuffer(a5, self->super._device);
  }
  else
  {
    createTexturesFromCVPixelBuffer(a4, device, 1, 3uLL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 3uLL);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a6, self->super._device, 1, 3uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a7, self->super._device, 1, 3uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)v32 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v32[12] = *(_OWORD *)&a3->var2[1];
  -[Normalization calcAnchorParamsFromNormParams:anchor:](self, "calcAnchorParamsFromNormParams:anchor:", v32, 0);
  v20 = v19;
  v22 = v21;
  *(_OWORD *)v32 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v32[12] = *(_OWORD *)&a3->var2[1];
  -[Normalization calcAnchorParamsFromNormParams:anchor:](self, "calcAnchorParamsFromNormParams:anchor:", v32, 1);
  v24 = v23;
  v26 = v25;
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = v20;
  LODWORD(v29) = v22;
  -[Normalization encodeNormalizationToCommandBuffer:source:destination:params:](self, "encodeNormalizationToCommandBuffer:source:destination:params:", v27, v15, v17, v28, v29);
  LODWORD(v30) = v24;
  LODWORD(v31) = v26;
  -[Normalization encodeNormalizationToCommandBuffer:source:destination:params:](self, "encodeNormalizationToCommandBuffer:source:destination:params:", v27, v16, v18, v30, v31);
  kdebug_trace();
  objc_msgSend(v27, "commit");
  objc_msgSend(v27, "waitUntilCompleted");
  kdebug_trace();

}

- (void)encodeDenormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6
{
  int var2;
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  int *v19;
  int64x2_t v20;
  uint64_t v21;
  _QWORD v22[3];

  var2 = a6.var2;
  v7 = *(_QWORD *)&a6.var0;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v11, "width");
  v15 = objc_msgSend(v11, "height");
  v16 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 12, 0));
  v17 = objc_msgSend(v16, "contents");
  *(_QWORD *)v17 = v7;
  *(_DWORD *)(v17 + 8) = var2;
  objc_msgSend(v13, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "pixelFormat") == 70)
  {
    v19 = &OBJC_IVAR___Normalization__denormalizeKernel;
  }
  else
  {
    v19 = &OBJC_IVAR___Normalization__denormalizeKernel;
    if (objc_msgSend(v11, "pixelFormat") != 90 && objc_msgSend(v11, "pixelFormat") != 115)
      v19 = &OBJC_IVAR___Normalization__denormalizeToPlanarKernel;
  }
  objc_msgSend(v18, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v19));
  objc_msgSend(v18, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v18, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", v16, 0, 0);
  v22[0] = (unint64_t)(v14 + 15) >> 4;
  v22[1] = (unint64_t)(v15 + 15) >> 4;
  v22[2] = 1;
  v20 = vdupq_n_s64(0x10uLL);
  v21 = 1;
  objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v22, &v20);
  objc_msgSend(v18, "endEncoding");

}

- (void)encodeDenormalizationRenderToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6
{
  int var2;
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int *v27;
  uint64_t v28;
  _QWORD v29[4];
  __int128 v30;

  var2 = a6.var2;
  v7 = *(_QWORD *)&a6.var0;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (double)(unint64_t)objc_msgSend(v11, "width");
  v15 = (double)(unint64_t)objc_msgSend(v11, "height");
  v16 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 12, 0));
  v17 = objc_msgSend(v16, "contents");
  *(_QWORD *)v17 = v7;
  *(_DWORD *)(v17 + 8) = var2;
  v18 = -[FRCMetalBase newTextureCoordinateBufferWithWidth:height:](self, "newTextureCoordinateBufferWithWidth:height:", v14, v15);
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "colorAttachments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTexture:", v11);

  objc_msgSend(v19, "colorAttachments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLoadAction:", 0);

  objc_msgSend(v19, "colorAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setStoreAction:", 1);

  objc_msgSend(v13, "renderCommandEncoderWithDescriptor:", v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = 0;
  *(double *)&v29[1] = v15;
  *(double *)&v29[2] = v14;
  *(double *)&v29[3] = -v15;
  v30 = xmmword_1D428E680;
  objc_msgSend(v26, "setViewport:", v29);
  if (objc_msgSend(v11, "pixelFormat") == 500)
  {
    v27 = &OBJC_IVAR___Normalization__denormalizeYCbCr8RenderKernel;
  }
  else
  {
    v28 = objc_msgSend(v11, "pixelFormat");
    v27 = &OBJC_IVAR___Normalization__denormalizeYCbCr10RenderKernel;
    if (v28 == 505)
      v27 = &OBJC_IVAR___Normalization__denormalizeYCbCr10UnpackedRenderKernel;
  }
  objc_msgSend(v26, "setRenderPipelineState:", *(Class *)((char *)&self->super.super.isa + *v27));
  objc_msgSend(v26, "setFragmentTexture:atIndex:", v12, 0);

  objc_msgSend(v26, "setFragmentBuffer:offset:atIndex:", v16, 0, 0);
  objc_msgSend(v26, "setVertexBuffer:offset:atIndex:", self->_vertsBuffer, 0, 0);
  objc_msgSend(v26, "setVertexBuffer:offset:atIndex:", v18, 0, 1);
  objc_msgSend(v26, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v26, "endEncoding");

}

- (void)denormalizeFrame:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 params:(id *)a5 timeScale:(float)a6 callback:(id)a7
{
  id v12;
  uint64_t v13;
  int v14;
  MTLDevice *device;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  _OWORD v27[2];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v12 = a7;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 3uLL);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  if (isYUV420(a4))
  {
    createRenderTargetTextureFromCVPixelBuffer(a4, self->super._device);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = isPackedRGBA(a4);
    device = self->super._device;
    if (v14)
      createRGBATextureFromCVPixelBuffer(a4, device);
    else
      createTexturesFromCVPixelBuffer(a4, device, 1, 3uLL);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v29[5];
  v29[5] = v13;

  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *(_OWORD *)&a5->var0;
  *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)&a5->var2[1];
  v18 = -[Normalization calcDeNormParamsFromNormaParams:timeScale:](self, "calcDeNormParamsFromNormaParams:timeScale:", v27, COERCE_DOUBLE(__PAIR64__(v27[1], LODWORD(a6))));
  v20 = v19;
  if (objc_msgSend((id)v29[5], "pixelFormat") == 500
    || objc_msgSend((id)v29[5], "pixelFormat") == 508
    || objc_msgSend((id)v29[5], "pixelFormat") == 505)
  {
    -[Normalization encodeDenormalizationRenderToCommandBuffer:source:destination:params:](self, "encodeDenormalizationRenderToCommandBuffer:source:destination:params:", v17, v35[5], v29[5], v18, v20);
  }
  else
  {
    -[Normalization encodeDenormalizationToCommandBuffer:source:destination:params:](self, "encodeDenormalizationToCommandBuffer:source:destination:params:", v17, v35[5], v29[5], v18, v20);
  }
  kdebug_trace();
  if (v12)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __72__Normalization_denormalizeFrame_destination_params_timeScale_callback___block_invoke;
    v23[3] = &unk_1E9786920;
    v25 = &v34;
    v26 = &v28;
    v24 = v12;
    objc_msgSend(v17, "addCompletedHandler:", v23);

  }
  objc_msgSend(v17, "commit");
  objc_msgSend(v17, "waitUntilScheduled");
  if (!v12)
  {
    objc_msgSend(v17, "waitUntilCompleted");
    kdebug_trace();
    v21 = (void *)v35[5];
    v35[5] = 0;

    v22 = (void *)v29[5];
    v29[5] = 0;

  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

uint64_t __72__Normalization_denormalizeFrame_destination_params_timeScale_callback___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  kdebug_trace();
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

- (BOOL)selfNormalization
{
  return self->_selfNormalization;
}

- (void)setSelfNormalization:(BOOL)a3
{
  self->_selfNormalization = a3;
}

- (BOOL)useSIMDSum
{
  return self->_useSIMDSum;
}

- (void)setUseSIMDSum:(BOOL)a3
{
  self->_useSIMDSum = a3;
}

- (BOOL)useFloatAtomic
{
  return self->_useFloatAtomic;
}

- (void)setUseFloatAtomic:(BOOL)a3
{
  self->_useFloatAtomic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondParamBuffer, 0);
  objc_storeStrong((id *)&self->_firstParamBuffer, 0);
  objc_storeStrong((id *)&self->_sharedEventListener, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_sharedEvent, 0);
  objc_storeStrong((id *)&self->_prevStatsBuffer, 0);
  objc_storeStrong((id *)&self->_vertsBuffer, 0);
  objc_storeStrong((id *)&self->_denormalizeYCbCr10UnpackedRenderKernel, 0);
  objc_storeStrong((id *)&self->_denormalizeYCbCr10RenderKernel, 0);
  objc_storeStrong((id *)&self->_denormalizeYCbCr8RenderKernel, 0);
  objc_storeStrong((id *)&self->_denormalizeKernel, 0);
  objc_storeStrong((id *)&self->_denormalizeToPlanarKernel, 0);
  objc_storeStrong((id *)&self->_normalizeYUV420ToPlanarKernel, 0);
  objc_storeStrong((id *)&self->_normalizePackedToPlanarKernel, 0);
  objc_storeStrong((id *)&self->_normalizePlanarToPlanarKernel, 0);
  objc_storeStrong((id *)&self->_statisticsYUV420Kernel, 0);
  objc_storeStrong((id *)&self->_statisticsPackedKernel, 0);
  objc_storeStrong((id *)&self->_statisticsPlanarKernel, 0);
}

@end
