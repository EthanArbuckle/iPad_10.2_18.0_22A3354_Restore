@implementation OpticalFlow

- (void)setNetworkClasses
{
  self->_featureExtractorClass = (Class)objc_opt_class();
  self->_flowEstimatorClass = (Class)objc_opt_class();
  self->_adaptationFeatureExtractorClass = (Class)objc_opt_class();
  self->_adaptationDecoderClass = (Class)objc_opt_class();
}

- (OpticalFlow)init
{
  return -[OpticalFlow initWithMode:](self, "initWithMode:", -1);
}

- (OpticalFlow)initWithMode:(int64_t)a3
{
  OpticalFlow *v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *flowEstimateSemaphore;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *completionSemaphore;
  uint64_t v9;
  MTLCommandQueue *commandQueue;
  dispatch_group_t v11;
  OS_dispatch_group *dispatchGroup;
  dispatch_queue_t v13;
  OS_dispatch_queue *concurrentQueue;
  OpticalFlow *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)OpticalFlow;
  v4 = -[OpticalFlow init](&v17, sel_init);
  -[OpticalFlow setNetworkClasses](v4, "setNetworkClasses");
  v4->_revision = 1;
  -[objc_class setNumLevels:](v4->_flowEstimatorClass, "setNumLevels:", -[objc_class numLevels](v4->_featureExtractorClass, "numLevels"));
  v4->_twoStageFlow = 0;
  v4->_usage = a3;
  if (-[OpticalFlow createModules](v4, "createModules"))
  {
    v5 = dispatch_semaphore_create(0);
    flowEstimateSemaphore = v4->_flowEstimateSemaphore;
    v4->_flowEstimateSemaphore = (OS_dispatch_semaphore *)v5;

    v7 = dispatch_semaphore_create(0);
    completionSemaphore = v4->_completionSemaphore;
    v4->_completionSemaphore = (OS_dispatch_semaphore *)v7;

    v9 = -[MTLDeviceSPI newCommandQueue](v4->_device, "newCommandQueue");
    commandQueue = v4->_commandQueue;
    v4->_commandQueue = (MTLCommandQueue *)v9;

    v11 = dispatch_group_create();
    dispatchGroup = v4->_dispatchGroup;
    v4->_dispatchGroup = (OS_dispatch_group *)v11;

    v13 = dispatch_queue_create("Main Concurrent Task Queue", MEMORY[0x1E0C80D50]);
    concurrentQueue = v4->_concurrentQueue;
    v4->_concurrentQueue = (OS_dispatch_queue *)v13;

    v4->_upscaleFinalFlow = 0;
    v4->_waitForCompletion = 1;
    if (v4->_usage != -1)
      -[OpticalFlow updateFlowSize](v4, "updateFlowSize");
    v15 = v4;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)updateFlowSize
{
  unint64_t *p_flowWidth;
  unint64_t *p_flowHeight;
  uint64_t v5;
  unint64_t flowWidth;
  unint64_t flowHeight;

  p_flowWidth = &self->_flowWidth;
  p_flowHeight = &self->_flowHeight;
  FRCGetInputFrameSizeForUsage(self->_usage, (uint64_t *)&self->_flowWidth, (uint64_t *)&self->_flowHeight);
  if (self->_upscaleFinalFlow)
  {
    if (!self->_4xUpscale)
      return;
    *p_flowWidth *= 2;
    v5 = 2 * *p_flowHeight;
  }
  else
  {
    flowWidth = self->_flowWidth;
    self->_flowWidth = flowWidth >> 1;
    flowHeight = self->_flowHeight;
    self->_flowHeight = flowHeight >> 1;
    if (!self->_skipLastLevel)
      return;
    *p_flowWidth = flowWidth >> 2;
    v5 = flowHeight >> 2;
  }
  *p_flowHeight = v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)OpticalFlow;
  -[OpticalFlow dealloc](&v2, sel_dealloc);
}

- (BOOL)createModules
{
  MTLDeviceSPI *v3;
  MTLDeviceSPI *device;
  Correlation *v5;
  Correlation *correlation;
  Backwarp *v7;
  Backwarp *backwarp;

  self->_numLevels = -[objc_class numLevels](self->_featureExtractorClass, "numLevels");
  v3 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  v5 = -[Correlation initWithDevice:interleaved:]([Correlation alloc], "initWithDevice:interleaved:", self->_device, 0);
  correlation = self->_correlation;
  self->_correlation = v5;

  if (!self->_correlation)
    return 0;
  v7 = -[Backwarp initWithDevice:interleaved:]([Backwarp alloc], "initWithDevice:interleaved:", self->_device, 0);
  backwarp = self->_backwarp;
  self->_backwarp = v7;

  return self->_backwarp != 0;
}

- (void)setTwoStageFlow:(BOOL)a3
{
  self->_twoStageFlow = a3;
}

- (void)allocateIntermediateStorage:(id *)a3
{
  -[OpticalFlow allocateIntermediateStageStorage:baseStage:](self, "allocateIntermediateStageStorage:baseStage:", a3, 0);
  if (self->_twoStageFlow)
    -[OpticalFlow allocateIntermediateStageStorage:baseStage:](self, "allocateIntermediateStageStorage:baseStage:", &a3->var1, 1);
}

- (void)allocateIntermediateStageStorage:(id *)a3 baseStage:(BOOL)a4
{
  _BOOL4 v4;
  $3B9A088002AB5E0D19740BD5D46791AF *v5;
  unint64_t v7;
  unint64_t numLevels;
  unint64_t v9;
  __CVBuffer **v10;
  _BOOL4 useAdaptationLayer;
  _BOOL4 v12;
  uint64_t v13;
  id v14;
  size_t v15;
  size_t v16;
  size_t v17;
  size_t v18;
  uint64_t v19;
  void *v20;
  $3B9A088002AB5E0D19740BD5D46791AF *v21;
  size_t v22;
  size_t v23;
  uint64_t v24;

  v4 = a4;
  v5 = a3;
  a3->var5 = self->_numLevels;
  if (a4)
    v7 = 2;
  else
    v7 = 0;
  if (a4)
  {
    *(_OWORD *)a3->var1 = 0u;
    *(_OWORD *)a3->var2 = 0u;
    *(_OWORD *)a3->var3 = 0u;
    *(_OWORD *)a3->var0 = 0u;
  }
  else if (self->_useAdaptationLayer)
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    -[FlowAdaptationFeatureExtractor getOutputTensorSize:level:](self->_adaptationFeatureExtractor, "getOutputTensorSize:level:", &v22, 0);
    v5->var4 = createPixelBuffer(v22, 8 * v23, 0x4C303068u, 0);
  }
  LODWORD(numLevels) = self->_numLevels;
  if (v7 < numLevels)
  {
    v9 = v7;
    v21 = v5;
    v10 = &v5->var0[v7];
    do
    {
      useAdaptationLayer = self->_useAdaptationLayer;
      v12 = v9 == 0;
      v13 = 40;
      if (v12 && useAdaptationLayer)
        v13 = 152;
      if (v4)
        v13 = 96;
      v14 = *(id *)((char *)&self->super.isa + v13);
      v22 = 0;
      v23 = 0;
      v24 = 0;
      objc_msgSend(v14, "getOutputTensorSize:level:", &v22, v9);
      if (v12 && useAdaptationLayer)
        v15 = v22;
      else
        v15 = 128;
      if (v12 && useAdaptationLayer)
        v16 = v23;
      else
        v16 = 8;
      if (v9 >= 2)
        v17 = v22;
      else
        v17 = v15;
      if (v9 >= 2)
        v18 = v23;
      else
        v18 = v16;
      v10[12] = createPixelBuffer(v17, v18, 0x32433068u, 0);
      v10[18] = createPixelBuffer(v22, v24 * v23, 0x4C303068u, 0);
      if (self->_resourcePreAllocated)
        -[OpticalFlow allocateCorreleationBuffer:forLevel:extractor:](self, "allocateCorreleationBuffer:forLevel:extractor:", v10, v9, v14);

      ++v9;
      numLevels = self->_numLevels;
      ++v10;
    }
    while (v9 < numLevels);
    v5 = v21;
  }
  if (v7 < numLevels)
  {
    if (v4)
      v19 = 96;
    else
      v19 = 40;
    do
    {
      v20 = *(Class *)((char *)&self->super.isa + v19);
      v22 = 0;
      v23 = 0;
      v24 = 0;
      objc_msgSend(v20, "getOutputTensorSize:level:", &v22, v7, v21);
      v5->var1[v7++] = createPixelBuffer(v22, v23, 0x32433068u, 0);
    }
    while (v7 < self->_numLevels);
  }
}

- (void)releaseIntermediateStorage:(id *)a3
{
  -[OpticalFlow releaseIntermediateStageStorage:](self, "releaseIntermediateStageStorage:");
  if (self->_twoStageFlow)
    -[OpticalFlow releaseIntermediateStageStorage:](self, "releaseIntermediateStageStorage:", &a3->var1);
}

- (void)releaseIntermediateStageStorage:(id *)a3
{
  unint64_t v5;
  CVPixelBufferRef *v6;

  CVPixelBufferRelease(a3->var4);
  if (self->_numLevels)
  {
    v5 = 0;
    do
    {
      v6 = &a3->var0[v5];
      CVPixelBufferRelease(*v6);
      CVPixelBufferRelease(v6[6]);
      CVPixelBufferRelease(v6[12]);
      CVPixelBufferRelease(v6[18]);
      ++v5;
    }
    while (v5 < self->_numLevels);
  }
}

- (void)allocateCorreleationBuffer:(__CVBuffer *)a3 forLevel:(unsigned int)a4 extractor:(id)a5
{
  uint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  objc_msgSend(a5, "getOutputTensorSize:level:", &v9);
  if (a4 <= 1 && (a4 || !self->_useAdaptationLayer))
    v8 = v11 + 83;
  else
    v8 = 81;
  *a3 = createPixelBuffer(v9, v10 * v8, 0x4C303068u, 0);
}

- (void)allocateFeatureBuffers:(id *)a3
{
  uint64_t v5;
  size_t v6;

  if (self->_useAdaptationLayer)
  {
    -[FlowAdaptationFeatureExtractor getOutputTensorSize:level:](self->_adaptationFeatureExtractor, "getOutputTensorSize:level:", &a3->var0.var4, 0);
    a3->var0.var3 = createPixelBuffer(a3->var0.var4.var0, a3->var0.var4.var2 * a3->var0.var4.var1, 0x4C303068u, 0);
  }
  v5 = 0;
  v6 = 0;
  if (self->_downsampling)
  {
    FRCGetInputFrameSizeForUsage(self->_usage, (uint64_t *)&v6, &v5);
    a3->var2 = createPixelBuffer(v6, 3 * v5, 0x4C303068u, 0);
  }
  if (!self->_adaptationLayerOnly)
  {
    -[OpticalFlow allocateImageFeature:extractor:](self, "allocateImageFeature:extractor:", a3, self->_featureExtractor);
    if (self->_twoStageFlow)
    {
      -[OpticalFlow allocateImageFeature:extractor:](self, "allocateImageFeature:extractor:", &a3->var1, self->_baseFeatureExtractor);
      FRCGetInputFrameSizeForUsage(self->_baseStageUsage, (uint64_t *)&v6, &v5);
      a3->var3 = createPixelBuffer(v6, 3 * v5, 0x4C303068u, 0);
    }
  }
}

- (void)allocateImageFeature:(id *)a3 extractor:(id)a4
{
  unint64_t v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *var2;
  __CVBuffer **var1;

  a3->var0 = self->_numLevels;
  if (self->_numLevels)
  {
    v6 = 0;
    var2 = a3->var2;
    var1 = a3->var1;
    do
    {
      objc_msgSend(a4, "getOutputTensorSize:level:", var2, v6);
      var1[v6++] = createPixelBuffer(var2->var0, var2->var2 * var2->var1, 0x4C303068u, 0);
      ++var2;
    }
    while (v6 < self->_numLevels);
  }
}

- (void)releaseFeatureBuffers:(id *)a3
{
  CVPixelBufferRelease(a3->var0.var3);
  a3->var0.var3 = 0;
  if (self->_downsampling)
  {
    CVPixelBufferRelease(a3->var2);
    a3->var2 = 0;
  }
  if (!self->_adaptationLayerOnly)
  {
    -[OpticalFlow releaseImageFeature:](self, "releaseImageFeature:", a3);
    if (self->_twoStageFlow)
    {
      -[OpticalFlow releaseImageFeature:](self, "releaseImageFeature:", &a3->var1);
      CVPixelBufferRelease(a3->var3);
      a3->var3 = 0;
    }
  }
}

- (void)releaseImageFeature:(id *)a3
{
  unint64_t v4;
  __CVBuffer **var1;

  if (self->_numLevels)
  {
    v4 = 0;
    var1 = a3->var1;
    do
    {
      CVPixelBufferRelease(var1[v4]);
      var1[v4++] = 0;
    }
    while (v4 < self->_numLevels);
  }
}

- (void)subsampleInput:(__CVBuffer *)a3 to:(__CVBuffer *)a4 forUsage:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1D825AFCC](self, a2, a3, a4, a5);
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[Backwarp encodeSubsampleInputToCommandBufferr:source:destination:](self->_backwarp, "encodeSubsampleInputToCommandBufferr:source:destination:", v11, v9, v10);
  objc_msgSend(v11, "commit");
  objc_msgSend(v11, "waitUntilScheduled");

  objc_autoreleasePoolPop(v8);
}

- (void)extractFeaturesFromFirst:(__CVBuffer *)a3 second:(__CVBuffer *)a4
{
  _BYTE v6[480];

  if (a3)
  {
    -[OpticalFlow extractFeaturesFromImage:outputFeatures:](self, "extractFeaturesFromImage:outputFeatures:", a3, self->_features);
  }
  else
  {
    memcpy(v6, self->_features, sizeof(v6));
    memcpy(self->_features, &self->_features[1], 0x1E0uLL);
    memcpy(&self->_features[1], v6, sizeof(self->_features[1]));
  }
  -[OpticalFlow extractFeaturesFromImage:outputFeatures:](self, "extractFeaturesFromImage:outputFeatures:", a4, &self->_features[1]);
}

- (void)extractFeaturesFromImage:(__CVBuffer *)a3 outputFeatures:(id *)a4
{
  __CVBuffer *var2;

  var2 = a3;
  if (self->_downsampling)
  {
    var2 = a4->var2;
    -[OpticalFlow subsampleInput:to:forUsage:](self, "subsampleInput:to:forUsage:", a3, var2, self->_usage);
  }
  if (self->_useAdaptationLayer)
    -[FlowAdaptationFeatureExtractor extractFeaturesFromImage:toFeatures:callback:](self->_adaptationFeatureExtractor, "extractFeaturesFromImage:toFeatures:callback:", var2, a4, 0);
  if (!self->_adaptationLayerOnly)
  {
    -[FeatureExtractor extractFeaturesFromImage:toFeatures:callback:](self->_featureExtractor, "extractFeaturesFromImage:toFeatures:callback:", var2, a4, 0);
    if (self->_twoStageFlow)
    {
      -[OpticalFlow subsampleInput:to:forUsage:](self, "subsampleInput:to:forUsage:", a3, a4->var3, self->_baseStageUsage);
      -[FeatureExtractor extractFeaturesFromImage:toFeatures:callback:](self->_baseFeatureExtractor, "extractFeaturesFromImage:toFeatures:callback:", a4->var3, &a4->var1, 0);
    }
    if (!self->_resourcePreAllocated && self->_twoStageFlow)
      -[OpticalFlow releaseUnusedFeatures:](self, "releaseUnusedFeatures:", a4);
  }
}

- (void)estimateFlowLevel:(unsigned int)a3 withEstimator:(id *)a4 firstFeatures:(id *)a5 secondFeatures:(id *)a6 correlation:(__CVBuffer *)a7 upscaledFlow:(__CVBuffer *)a8 warpedImage:(__CVBuffer *)a9 prevFlow:(__CVBuffer *)a10 outputFlow:(__CVBuffer *)a11 waitForComplete:(BOOL)a12
{
  unint64_t var2;
  int v17;
  uint64_t v18;
  __CVBuffer **p_var3;
  __CVBuffer **v20;
  MTLCommandQueue *commandQueue;
  unint64_t v22;
  void *v23;
  __CVBuffer *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __CVBuffer *v30;
  void *v31;
  __CVBuffer *v32;
  __CVBuffer *v33;
  id v34;
  __CVBuffer **v35;
  _BOOL4 v36;
  __CVBuffer *v38;
  void *v39;
  __CVBuffer *v40;
  void *v41;
  _QWORD v42[5];
  BOOL v43;

  var2 = a6->var2[a3].var2;
  v36 = a3 == 0 && self->_useAdaptationLayer;
  v17 = a3 > 1 || v36;
  if (v36)
    v18 = 4 * var2;
  else
    v18 = a6->var2[a3].var2;
  if (a3 == 0 && self->_useAdaptationLayer)
    p_var3 = &a5->var3;
  else
    p_var3 = &a5->var1[a3];
  if (a3 == 0 && self->_useAdaptationLayer)
    v20 = &a6->var3;
  else
    v20 = &a6->var1[a3];
  commandQueue = self->_commandQueue;
  if (v17)
    v22 = 81;
  else
    v22 = (var2 + 83);
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = p_var3;
  v24 = *v20;
  createTexturesFromCVPixelBufferWithCommandBuffer(*p_var3, self->_device, v23, 1, v18);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(v24, self->_device, v23, 1, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = a8;
  createTexturesFromCVPixelBufferWithCommandBuffer(a8, self->_device, v23, 2, 2uLL);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = a7;
  createTexturesFromCVPixelBufferWithCommandBuffer(a7, self->_device, v23, 1, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v25;
  if (self->_numLevels - 1 == a3)
  {
    v28 = v25;

    v26 = 0;
    v29 = 0;
    v30 = a9;
  }
  else
  {
    createTexturesFromCVPixelBufferWithCommandBuffer(a10, self->_device, v23, 2, 2uLL);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = a9;
    createTexturesFromCVPixelBufferWithCommandBuffer(a9, self->_device, v23, 1, v18);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if ((v17 & 1) != 0)
      v31 = v26;
    else
      v31 = v27;
    -[Backwarp encodeToCommandBuffer:source:flow:destination:upscaledFlow:](self->_backwarp, "encodeToCommandBuffer:source:flow:destination:upscaledFlow:", v23, v39, v29, v28, v31);
  }
  -[Correlation encodeToCommandBuffer:first:second:destination:](self->_correlation, "encodeToCommandBuffer:first:second:destination:", v23, v41, v28, v27);
  if (isBufferCopyNecessaryForCVtoTextureConversion(objc_msgSend(v28, "width"), objc_msgSend(v28, "height"), objc_msgSend(v28, "arrayLength")))
  {
    copyTextureToBufferWithBlit(v28, v30, self->_device, v23);
  }
  if (isBufferCopyNecessaryForCVtoTextureConversion(objc_msgSend(v27, "width"), objc_msgSend(v27, "height"), objc_msgSend(v27, "arrayLength")))
  {
    copyTextureToBufferWithBlit(v27, v40, self->_device, v23);
  }
  if (v26
    && isBufferCopyNecessaryForCVtoTextureConversion(objc_msgSend(v26, "width"), objc_msgSend(v26, "height"), objc_msgSend(v26, "arrayLength")))
  {
    copyTextureToBufferWithBlit(v26, v38, self->_device, v23);
  }
  kdebug_trace();
  objc_msgSend(v23, "commit");
  objc_msgSend(v23, "waitUntilScheduled");
  kdebug_trace();

  if (v36)
    v32 = a10;
  else
    v32 = v38;
  v33 = *v35;
  v34 = a4[a3];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __149__OpticalFlow_estimateFlowLevel_withEstimator_firstFeatures_secondFeatures_correlation_upscaledFlow_warpedImage_prevFlow_outputFlow_waitForComplete___block_invoke;
  v42[3] = &unk_1E9786B78;
  v43 = a12;
  v42[4] = self;
  objc_msgSend(v34, "estimateFlow:correlation:flow:output:callback:", v33, v40, v32, a11, v42);
  if (a12)
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_flowEstimateSemaphore, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __149__OpticalFlow_estimateFlowLevel_withEstimator_firstFeatures_secondFeatures_correlation_upscaledFlow_warpedImage_prevFlow_outputFlow_waitForComplete___block_invoke(intptr_t result)
{
  if (*(_BYTE *)(result + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(result + 32) + 192));
  return result;
}

- (void)estimateFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 outputFlow:(__CVBuffer *)a6
{
  _BOOL8 skipLastLevel;
  uint64_t v12;
  size_t Height;
  OSType PixelFormatType;
  uint64_t v15;
  __CVBuffer *v16;
  __CVBuffer *v17;
  void *v18;
  void *v19;
  Backwarp *backwarp;
  _QWORD v21[5];
  _QWORD v22[5];

  skipLastLevel = self->_skipLastLevel;
  if (self->_upscaleFinalFlow)
  {
    LODWORD(v12) = 1;
    goto LABEL_8;
  }
  if (!self->_skipLastLevel)
  {
    v12 = 0;
    goto LABEL_7;
  }
  Height = CVPixelBufferGetHeight(a5->var0.var1[self->_skipLastLevel]);
  v12 = 1;
  if (Height == CVPixelBufferGetHeight(a6))
  {
LABEL_7:
    PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
    LODWORD(v12) = PixelFormatType != CVPixelBufferGetPixelFormatType(a5->var0.var1[v12]);
  }
LABEL_8:
  v15 = (self->_numLevels - 1);
  if (self->_twoStageFlow)
  {
    -[OpticalFlow estimateStageFlowFromFirstFeatures:secondFeature:storage:baseStage:startLevel:lastLevel:startFlow:outputFlow:](self, "estimateStageFlowFromFirstFeatures:secondFeature:storage:baseStage:startLevel:lastLevel:startFlow:outputFlow:", &a3->var1, &a4->var1, &a5->var1, 1, v15, 2, 0, 0);
    v16 = a5->var1.var1[2];
    v15 = 3;
  }
  else
  {
    v16 = 0;
  }
  if ((_DWORD)v12)
    v17 = 0;
  else
    v17 = a6;
  -[OpticalFlow estimateStageFlowFromFirstFeatures:secondFeature:storage:baseStage:startLevel:lastLevel:startFlow:outputFlow:](self, "estimateStageFlowFromFirstFeatures:secondFeature:storage:baseStage:startLevel:lastLevel:startFlow:outputFlow:", a3, a4, a5, 0, v15, skipLastLevel, v16, v17);
  if ((_DWORD)v12)
  {
    createTexturesFromCVPixelBuffer(a5->var0.var1[skipLastLevel], self->_device, 1, 2uLL);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    backwarp = self->_backwarp;
    if (self->_upscaleFinalFlow)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78__OpticalFlow_estimateFlowFromFirstFeatures_secondFeature_storage_outputFlow___block_invoke;
      v22[3] = &unk_1E9786BA0;
      v22[4] = self;
      -[Backwarp upscaleFlow:destination:callback:](backwarp, "upscaleFlow:destination:callback:", v18, v19, v22);
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __78__OpticalFlow_estimateFlowFromFirstFeatures_secondFeature_storage_outputFlow___block_invoke_2;
      v21[3] = &unk_1E9786BA0;
      v21[4] = self;
      -[Backwarp copyTextureWithPaddingSource:destination:callback:](backwarp, "copyTextureWithPaddingSource:destination:callback:", v18, v19, v21);
    }
    if (self->_waitForCompletion)
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);

  }
}

intptr_t __78__OpticalFlow_estimateFlowFromFirstFeatures_secondFeature_storage_outputFlow___block_invoke(intptr_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 2049))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 200));
  return result;
}

intptr_t __78__OpticalFlow_estimateFlowFromFirstFeatures_secondFeature_storage_outputFlow___block_invoke_2(intptr_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 2049))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 200));
  return result;
}

- (void)estimateStageFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 baseStage:(BOOL)a6 startLevel:(int)a7 lastLevel:(int)a8 startFlow:(__CVBuffer *)a9 outputFlow:(__CVBuffer *)a10
{
  __CVBuffer *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  CVPixelBufferRef *v20;
  BOOL v21;
  char v22;
  BOOL v23;
  char v25;
  __CVBuffer *v26;
  __CVBuffer **p_var4;
  __CVBuffer *v28;
  uint64_t v29;
  id v32;
  char *v33;

  v13 = a10;
  if (a6)
    v14 = 104;
  else
    v14 = 48;
  v15 = 40;
  if (a6)
    v15 = 96;
  v32 = *(id *)((char *)&self->super.isa + v15);
  if (a7 >= a8)
  {
    v16 = 0;
    v17 = a7;
    v33 = (char *)self + v14;
    v18 = a8 - (uint64_t)a7;
    v19 = a7;
    v20 = &a5->var0[a7];
    do
    {
      if (v17 + v16)
        v21 = 1;
      else
        v21 = !self->_useAdaptationLayer;
      v22 = !v21;
      if (a10)
        v23 = !self->_waitForCompletion;
      else
        v23 = 1;
      v25 = !v23 && v18 == v16;
      if (!self->_resourcePreAllocated)
        -[OpticalFlow allocateCorreleationBuffer:forLevel:extractor:](self, "allocateCorreleationBuffer:forLevel:extractor:", v20, (v19 + v16), v32);
      v26 = a9;
      if (v16)
        v26 = v20[7];
      p_var4 = &a5->var4;
      if ((v22 & 1) == 0)
      {
        if (a10)
        {
          v28 = a10;
          if (v18 == v16)
            goto LABEL_32;
        }
        p_var4 = v20 + 6;
      }
      v28 = *p_var4;
LABEL_32:
      LOBYTE(v29) = v25;
      -[OpticalFlow estimateFlowLevel:withEstimator:firstFeatures:secondFeatures:correlation:upscaledFlow:warpedImage:prevFlow:outputFlow:waitForComplete:](self, "estimateFlowLevel:withEstimator:firstFeatures:secondFeatures:correlation:upscaledFlow:warpedImage:prevFlow:outputFlow:waitForComplete:", (v19 + v16), v33, a3, a4, *v20, v20[12], v20[18], v26, v28, v29);
      if (!self->_resourcePreAllocated)
      {
        CVPixelBufferRelease(*v20);
        *v20 = 0;
      }
      --v16;
      --v20;
    }
    while (v17 + v16 + 1 > a8);
  }
  if (!a8 && self->_useAdaptationLayer)
  {
    if (!a10)
      v13 = a5->var1[0];
    -[OpticalFlow reshuffleFlow:previsouFlow:destination:](self, "reshuffleFlow:previsouFlow:destination:", a5->var4, a5->var1[1], v13);
  }

}

- (void)adaptFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 inputFlow:(__CVBuffer *)a6 outputFlow:(__CVBuffer *)a7
{
  size_t Height;
  unint64_t var2;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  FlowEstimate *v21;
  __CVBuffer *var3;
  __CVBuffer *v23;
  __CVBuffer *var4;
  void *v25;
  void *v26;
  Backwarp *backwarp;
  __CVBuffer *pixelBuffera;
  int v30;
  __CVBuffer *v31;
  $96617CAC2DA4B5E4E21E368815F3035F *v32;
  void *v33;
  _QWORD v34[5];

  if (self->_upscaleFinalFlow
    || self->_skipLastLevel && (Height = CVPixelBufferGetHeight(a5->var1[0]), Height != CVPixelBufferGetHeight(a7)))
  {
    v31 = a5->var1[0];
    v30 = 1;
  }
  else
  {
    v30 = 0;
    v31 = a7;
  }
  var2 = a3->var4.var2;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer", a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(a3->var3, self->_device, v14, 1, var2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(a4->var3, self->_device, v14, 1, var2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(a5->var2[0], self->_device, v14, 1, 2uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(a5->var3[0], self->_device, v14, 1, var2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(a5->var0[0], self->_device, v14, 1, 0x51uLL);
  v32 = a3;
  v19 = objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(a6, self->_device, v14, 1, 2uLL);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[Backwarp encodeToCommandBuffer:source:flow:destination:upscaledFlow:](self->_backwarp, "encodeToCommandBuffer:source:flow:destination:upscaledFlow:", v14, v16, v20, v18, v17);
  v33 = (void *)v19;
  -[Correlation encodeToCommandBuffer:first:second:destination:](self->_correlation, "encodeToCommandBuffer:first:second:destination:", v14, v15, v18, v19);
  objc_msgSend(v14, "commit");
  objc_msgSend(v14, "waitUntilScheduled");

  v21 = self->_flowEstimator[0];
  var3 = v32->var3;
  v23 = a5->var0[0];
  var4 = a5->var4;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __85__OpticalFlow_adaptFlowFromFirstFeatures_secondFeature_storage_inputFlow_outputFlow___block_invoke;
  v34[3] = &unk_1E9786BA0;
  v34[4] = self;
  -[FlowEstimate estimateFlow:correlation:flow:output:callback:](v21, "estimateFlow:correlation:flow:output:callback:", var3, v23, a6, var4, v34);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_flowEstimateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->_resourcePreAllocated)
  {
    CVPixelBufferRelease(a5->var0[0]);
    a5->var0[0] = 0;
  }
  -[OpticalFlow reshuffleFlow:previsouFlow:destination:](self, "reshuffleFlow:previsouFlow:destination:", a5->var4, a6, v31);
  if (v30)
  {
    createTexturesFromCVPixelBuffer(v31, self->_device, 1, 2uLL);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    createTexturesFromCVPixelBuffer(pixelBuffera, self->_device, 1, 2uLL);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    backwarp = self->_backwarp;
    if (self->_upscaleFinalFlow)
      -[Backwarp upscaleFlow:destination:](backwarp, "upscaleFlow:destination:", v25, v26);
    else
      -[Backwarp copyTextureWithPaddingSource:destination:](backwarp, "copyTextureWithPaddingSource:destination:", v25, v26);

  }
}

intptr_t __85__OpticalFlow_adaptFlowFromFirstFeatures_secondFeature_storage_inputFlow_outputFlow___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 192));
}

- (void)reshuffleFlow:(__CVBuffer *)a3 previsouFlow:(__CVBuffer *)a4 destination:(__CVBuffer *)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(a3, self->_device, v12, 1, 8uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBufferWithCommandBuffer(a4, self->_device, v12, 1, 2uLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[Backwarp encodeReShuffleFlowToCommandBuffer:shuffledFlow:previousFlow:destination:](self->_backwarp, "encodeReShuffleFlowToCommandBuffer:shuffledFlow:previousFlow:destination:", v12, v9, v10, v11);
  objc_msgSend(v12, "commit");
  objc_msgSend(v12, "waitUntilScheduled");

}

- (void)predictFowardFlow:(__CVBuffer *)a3 fromBackwardFlow:(__CVBuffer *)a4
{
  void *v6;
  id v7;

  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[Backwarp reverseFlowWithSource:destination:](self->_backwarp, "reverseFlowWithSource:destination:", v6, v7);

}

- (void)estimateTwoWayFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 outputForwardFlow:(__CVBuffer *)a6 outputBackwardFlow:(__CVBuffer *)a7
{
  NSObject *dispatchGroup;
  NSObject *concurrentQueue;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[9];
  _QWORD block[9];

  dispatchGroup = self->_dispatchGroup;
  concurrentQueue = self->_concurrentQueue;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__OpticalFlow_estimateTwoWayFlowFromFirstFeatures_secondFeature_storage_outputForwardFlow_outputBackwardFlow___block_invoke;
  block[3] = &unk_1E9786C58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_group_async(dispatchGroup, concurrentQueue, block);
  v15 = self->_dispatchGroup;
  v16 = self->_concurrentQueue;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __110__OpticalFlow_estimateTwoWayFlowFromFirstFeatures_secondFeature_storage_outputForwardFlow_outputBackwardFlow___block_invoke_2;
  v17[3] = &unk_1E9786C58;
  v17[4] = self;
  v17[5] = a4;
  v17[6] = a3;
  v17[7] = a5;
  v17[8] = a7;
  dispatch_group_async(v15, v16, v17);
  dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __110__OpticalFlow_estimateTwoWayFlowFromFirstFeatures_secondFeature_storage_outputForwardFlow_outputBackwardFlow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __110__OpticalFlow_estimateTwoWayFlowFromFirstFeatures_secondFeature_storage_outputForwardFlow_outputBackwardFlow___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) + 416, *(_QWORD *)(a1 + 64));
}

+ (BOOL)use4xDownScale:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1D) & (0x1E040000u >> a3);
}

- (BOOL)switchUsageTo:(int64_t)a3
{
  uint64_t QuarterSizeUsage;
  FlowAdaptationFeatureExtractor *v6;
  FlowAdaptationFeatureExtractor *adaptationFeatureExtractor;
  FlowEstimate *v8;
  FeatureExtractor *v9;
  FeatureExtractor *featureExtractor;
  FlowAdaptationFeatureExtractor *v11;
  FlowAdaptationFeatureExtractor *v12;
  int numLevels;
  unint64_t v14;
  unint64_t v15;
  FlowEstimate **flowEstimator;
  FlowEstimate *v17;
  FlowEstimate *v18;
  FlowEstimate *v19;
  id v20;
  int64_t usage;
  uint64_t v22;
  uint64_t v23;
  FlowEstimate *v25;

  if (self->_adaptationLayerOnly)
  {
    self->_numLevels = -[objc_class numLevels](self->_adaptationFeatureExtractorClass, "numLevels");
    self->_twoStageFlow = 0;
  }
  *(_WORD *)&self->_upscaleFinalFlow = 0;
  if (self->_downsampling != 1)
    goto LABEL_10;
  if (!self->_disableOutputFlowScaling)
    self->_upscaleFinalFlow = 1;
  QuarterSizeUsage = getQuarterSizeUsage(a3);
  if (+[OpticalFlow use4xDownScale:](OpticalFlow, "use4xDownScale:", a3))
  {
    QuarterSizeUsage = getQuarterSizeUsage(QuarterSizeUsage);
    self->_4xUpscale = 1;
  }
  if (QuarterSizeUsage == a3)
  {
    NSLog(CFSTR("No support for 1/4 optical flow input for this usage (usage = %d). Bailing to the full size mode.\n"), a3);
    self->_upscaleFinalFlow = 0;
LABEL_10:
    QuarterSizeUsage = a3;
  }
  if (QuarterSizeUsage == self->_usage)
  {
    -[OpticalFlow updateFlowSize](self, "updateFlowSize");
    if (self->_useAdaptationLayer)
    {
      v6 = (FlowAdaptationFeatureExtractor *)objc_msgSend(objc_alloc(self->_adaptationFeatureExtractorClass), "initWithMode:revision:", self->_usage, self->_revision);
      adaptationFeatureExtractor = self->_adaptationFeatureExtractor;
      self->_adaptationFeatureExtractor = v6;

      v8 = (FlowEstimate *)objc_msgSend(objc_alloc(self->_adaptationDecoderClass), "initWithMode:revision:", self->_usage, self->_revision);
    }
    else
    {
      v8 = (FlowEstimate *)objc_msgSend(objc_alloc(self->_flowEstimatorClass), "initWithMode:level:", self->_usage, 0);
    }
    v25 = self->_flowEstimator[0];
    self->_flowEstimator[0] = v8;

    if (self->_twoStageFlow && !self->_baseStageCreated)
      -[OpticalFlow createBaseLayer](self, "createBaseLayer");
    return 1;
  }
  self->_usage = QuarterSizeUsage;
  -[OpticalFlow updateFlowSize](self, "updateFlowSize");
  v9 = (FeatureExtractor *)objc_msgSend(objc_alloc(self->_featureExtractorClass), "initWithMode:revision:", self->_usage, self->_revision);
  featureExtractor = self->_featureExtractor;
  self->_featureExtractor = v9;

  if (!self->_featureExtractor)
    return 0;
  if (self->_useAdaptationLayer)
  {
    v11 = (FlowAdaptationFeatureExtractor *)objc_msgSend(objc_alloc(self->_adaptationFeatureExtractorClass), "initWithMode:revision:", self->_usage, self->_revision);
    v12 = self->_adaptationFeatureExtractor;
    self->_adaptationFeatureExtractor = v11;

    if (!self->_adaptationFeatureExtractor)
      return 0;
  }
  numLevels = self->_numLevels;
  if (numLevels)
  {
    v14 = 0;
    v15 = (numLevels - self->_twoStageFlow);
    flowEstimator = self->_flowEstimator;
    do
    {
      if (v14 >= v15)
      {
        v19 = flowEstimator[v14];
        flowEstimator[v14] = 0;

      }
      else
      {
        if (v14 || !self->_useAdaptationLayer)
        {
          v20 = objc_alloc(self->_flowEstimatorClass);
          usage = self->_usage;
          if (v14)
          {
            v22 = objc_msgSend(v20, "initWithMode:level:revision:", usage, v14, self->_revision);
            v18 = flowEstimator[v14];
            flowEstimator[v14] = (FlowEstimate *)v22;
          }
          else
          {
            v23 = objc_msgSend(v20, "initWithMode:level:", usage, 0);
            v18 = *flowEstimator;
            *flowEstimator = (FlowEstimate *)v23;
          }
        }
        else
        {
          v17 = (FlowEstimate *)objc_msgSend(objc_alloc(self->_adaptationDecoderClass), "initWithMode:revision:", self->_usage, self->_revision);
          v18 = self->_flowEstimator[0];
          self->_flowEstimator[0] = v17;
        }

        if (!flowEstimator[v14])
          return 0;
      }
      ++v14;
    }
    while (v14 < self->_numLevels);
    if (!self->_twoStageFlow)
      return 1;
    goto LABEL_37;
  }
  if (self->_twoStageFlow)
  {
LABEL_37:
    -[OpticalFlow createBaseLayer](self, "createBaseLayer");
    if (!self->_baseStageCreated)
      self->_twoStageFlow = 0;
  }
  return 1;
}

- (BOOL)createBaseLayer
{
  int64_t usage;
  int64_t QuarterSizeUsage;
  FeatureExtractor *v5;
  FeatureExtractor *baseFeatureExtractor;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  self->_baseStageCreated = 0;
  v13 = 0;
  v14 = 0;
  FRCGetInputFrameSizeForUsage(self->_usage, &v14, &v13);
  usage = self->_usage;
  if ((unint64_t)(v14 - 1920) > 0x280)
    QuarterSizeUsage = get4xDownSizeUsage(usage);
  else
    QuarterSizeUsage = getQuarterSizeUsage(usage);
  self->_baseStageUsage = QuarterSizeUsage;
  v5 = (FeatureExtractor *)objc_msgSend(objc_alloc(self->_featureExtractorClass), "initWithMode:revision:", self->_baseStageUsage, self->_revision);
  baseFeatureExtractor = self->_baseFeatureExtractor;
  self->_baseFeatureExtractor = v5;

  if (!self->_featureExtractor)
    return 0;
  v7 = 1;
  -[FeatureExtractor setBaseStage:](self->_baseFeatureExtractor, "setBaseStage:", 1);
  if (self->_numLevels >= 3u)
  {
    v8 = 15;
    do
    {
      v9 = objc_msgSend(objc_alloc(self->_flowEstimatorClass), "initWithMode:level:revision:", self->_baseStageUsage, (v8 - 13), self->_revision);
      v10 = (void *)*((_QWORD *)&self->super.isa + v8);
      *((_QWORD *)&self->super.isa + v8) = v9;

      if (!*((_QWORD *)&self->super.isa + v8))
        return 0;
      v11 = v8 - 12;
      ++v8;
    }
    while (v11 < self->_numLevels);
  }
  self->_baseStageCreated = 1;
  return v7;
}

- (void)releaseUnusedFeatures:(id *)a3
{
  unint64_t v5;

  CVPixelBufferRelease(a3->var1.var1[0]);
  a3->var1.var1[0] = 0;
  CVPixelBufferRelease(a3->var1.var1[1]);
  a3->var1.var1[1] = 0;
  if (self->_numLevels >= 5u)
  {
    v5 = 5;
    do
    {
      CVPixelBufferRelease(*((CVPixelBufferRef *)&a3->var0.var0 + v5));
      *((_QWORD *)&a3->var0.var0 + v5) = 0;
    }
    while (v5++ < self->_numLevels);
  }
}

- (void)upscaleInputFlow:(__CVBuffer *)a3 outFlow:(__CVBuffer *)a4
{
  void *v6;
  void *v7;
  Backwarp *backwarp;
  _QWORD v9[5];

  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  backwarp = self->_backwarp;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__OpticalFlow_upscaleInputFlow_outFlow___block_invoke;
  v9[3] = &unk_1E9786BA0;
  v9[4] = self;
  -[Backwarp upscaleFlow:destination:callback:](backwarp, "upscaleFlow:destination:callback:", v6, v7, v9);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __40__OpticalFlow_upscaleInputFlow_outFlow___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 200));
}

- (void)allocateResources
{
  self->_resourcePreAllocated = 1;
  -[OpticalFlow allocateFeatureBuffers:](self, "allocateFeatureBuffers:", self->_features);
  -[OpticalFlow allocateFeatureBuffers:](self, "allocateFeatureBuffers:", &self->_features[1]);
  -[OpticalFlow allocateIntermediateStorage:](self, "allocateIntermediateStorage:", self->_opticalFlowStroages);
  if (self->_concurrentDualFlowProcessing)
    -[OpticalFlow allocateIntermediateStorage:](self, "allocateIntermediateStorage:", &self->_opticalFlowStroages[1]);
}

- (void)releaseResources
{
  if (self->_resourcePreAllocated)
  {
    -[OpticalFlow releaseFeatureBuffers:](self, "releaseFeatureBuffers:", self->_features);
    -[OpticalFlow releaseFeatureBuffers:](self, "releaseFeatureBuffers:", &self->_features[1]);
    -[OpticalFlow releaseIntermediateStorage:](self, "releaseIntermediateStorage:", self->_opticalFlowStroages);
    -[OpticalFlow releaseIntermediateStorage:](self, "releaseIntermediateStorage:", &self->_opticalFlowStroages[1]);
    self->_resourcePreAllocated = 0;
  }
}

- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flow:(__CVBuffer *)a5
{
  if (self->_resourcePreAllocated)
  {
    -[OpticalFlow extractFeaturesFromFirst:second:](self, "extractFeaturesFromFirst:second:", a3, a4);
    -[OpticalFlow estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:](self, "estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:", self->_features, &self->_features[1], self->_opticalFlowStroages, a5);
  }
  else
  {
    -[OpticalFlow allocateResources](self, "allocateResources");
    -[OpticalFlow extractFeaturesFromFirst:second:](self, "extractFeaturesFromFirst:second:", a3, a4);
    -[OpticalFlow estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:](self, "estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:", self->_features, &self->_features[1], self->_opticalFlowStroages, a5);
    -[OpticalFlow releaseResources](self, "releaseResources");
  }
}

- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  -[OpticalFlow opticalFlowFirstFrame:secondFrame:flowForward:flowBackward:reUseFlow:](self, "opticalFlowFirstFrame:secondFrame:flowForward:flowBackward:reUseFlow:", a3, a4, a5, a6, 0);
}

- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 reUseFlow:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 resourcePreAllocated;
  $E8F74A567733E79899A13AD5E8CC49BD *features;
  $E8F74A567733E79899A13AD5E8CC49BD *v15;
  $2FA98B89443BAA0594893E448BCAF62E *opticalFlowStroages;
  OpticalFlow *v17;

  v7 = a7;
  resourcePreAllocated = self->_resourcePreAllocated;
  if (!self->_resourcePreAllocated)
    -[OpticalFlow allocateResources](self, "allocateResources");
  -[OpticalFlow extractFeaturesFromFirst:second:](self, "extractFeaturesFromFirst:second:", a3, a4);
  if (v7)
  {
    -[OpticalFlow predictFowardFlow:fromBackwardFlow:](self, "predictFowardFlow:fromBackwardFlow:", a5, a6);
    features = self->_features;
    v15 = &self->_features[1];
    opticalFlowStroages = self->_opticalFlowStroages;
    v17 = self;
  }
  else
  {
    if (self->_concurrentDualFlowProcessing)
    {
      -[OpticalFlow estimateTwoWayFlowFromFirstFeatures:secondFeature:storage:outputForwardFlow:outputBackwardFlow:](self, "estimateTwoWayFlowFromFirstFeatures:secondFeature:storage:outputForwardFlow:outputBackwardFlow:", self->_features, &self->_features[1], self->_opticalFlowStroages, a5, a6);
      if (resourcePreAllocated)
        return;
      goto LABEL_7;
    }
    -[OpticalFlow estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:](self, "estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:", self->_features, &self->_features[1], self->_opticalFlowStroages, a5);
    v17 = self;
    v15 = &self->_features[1];
    features = self->_features;
    opticalFlowStroages = self->_opticalFlowStroages;
  }
  -[OpticalFlow estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:](v17, "estimateFlowFromFirstFeatures:secondFeature:storage:outputFlow:", v15, features, opticalFlowStroages, a6);
  if (!resourcePreAllocated)
LABEL_7:
    -[OpticalFlow releaseResources](self, "releaseResources");
}

- (void)flowAdaptationFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 inputFlowForward:(__CVBuffer *)a5 inputFlowBackward:(__CVBuffer *)a6 outputFlowForward:(__CVBuffer *)a7 outputFlowBackward:(__CVBuffer *)a8
{
  _BOOL4 resourcePreAllocated;
  NSObject *dispatchGroup;
  NSObject *concurrentQueue;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[7];
  _QWORD block[7];
  _BYTE __dst[480];

  resourcePreAllocated = self->_resourcePreAllocated;
  if (self->_resourcePreAllocated)
  {
    if (a3)
    {
LABEL_3:
      -[OpticalFlow extractFeaturesFromImage:outputFeatures:](self, "extractFeaturesFromImage:outputFeatures:", a3, self->_features);
      goto LABEL_6;
    }
  }
  else
  {
    -[OpticalFlow allocateResources](self, "allocateResources");
    if (a3)
      goto LABEL_3;
  }
  memcpy(__dst, self->_features, sizeof(__dst));
  memcpy(self->_features, &self->_features[1], 0x1E0uLL);
  memcpy(&self->_features[1], __dst, sizeof(self->_features[1]));
LABEL_6:
  -[OpticalFlow extractFeaturesFromImage:outputFeatures:](self, "extractFeaturesFromImage:outputFeatures:", a4, &self->_features[1]);
  dispatchGroup = self->_dispatchGroup;
  concurrentQueue = self->_concurrentQueue;
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124__OpticalFlow_flowAdaptationFirstFrame_secondFrame_inputFlowForward_inputFlowBackward_outputFlowForward_outputFlowBackward___block_invoke;
  block[3] = &unk_1E9786C80;
  block[4] = self;
  block[5] = a5;
  block[6] = a7;
  dispatch_group_async(dispatchGroup, concurrentQueue, block);
  v19 = self->_dispatchGroup;
  v20 = self->_concurrentQueue;
  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __124__OpticalFlow_flowAdaptationFirstFrame_secondFrame_inputFlowForward_inputFlowBackward_outputFlowForward_outputFlowBackward___block_invoke_2;
  v21[3] = &unk_1E9786C80;
  v21[4] = self;
  v21[5] = a6;
  v21[6] = a8;
  dispatch_group_async(v19, v20, v21);
  dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (!resourcePreAllocated)
    -[OpticalFlow releaseResources](self, "releaseResources");
}

uint64_t __124__OpticalFlow_flowAdaptationFirstFrame_secondFrame_inputFlowForward_inputFlowBackward_outputFlowForward_outputFlowBackward___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "adaptFlowFromFirstFeatures:secondFeature:storage:inputFlow:outputFlow:", *(_QWORD *)(a1 + 32) + 248, *(_QWORD *)(a1 + 32) + 728, *(_QWORD *)(a1 + 32) + 1208, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __124__OpticalFlow_flowAdaptationFirstFrame_secondFrame_inputFlowForward_inputFlowBackward_outputFlowForward_outputFlowBackward___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "adaptFlowFromFirstFeatures:secondFeature:storage:inputFlow:outputFlow:", *(_QWORD *)(a1 + 32) + 728, *(_QWORD *)(a1 + 32) + 248, *(_QWORD *)(a1 + 32) + 1624, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- ($5977BF93EC93D818C841C7E270588E2B)imageFeatures
{
  return ($5977BF93EC93D818C841C7E270588E2B *)self->_features;
}

- ($2B7190B9495AC8840DAD8324B3694CED)storages
{
  return ($2B7190B9495AC8840DAD8324B3694CED *)self->_opticalFlowStroages;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)flowSizeForLevel:(SEL)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[FeatureExtractor getOutputTensorSize:level:](self->_featureExtractor, "getOutputTensorSize:level:", retstr, *(_QWORD *)&a4);
  retstr->var2 = 2;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)featureSizeForLevel:(SEL)a3
{
  uint64_t v6;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  v6 = 40;
  if (!a4)
    v6 = 152;
  return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend(*(id *)((char *)&self->super.isa + v6), "getOutputTensorSize:level:", retstr);
}

- (unint64_t)flowWidth
{
  return self->_flowWidth;
}

- (unint64_t)flowHeight
{
  return self->_flowHeight;
}

- (int)numLevels
{
  return self->_numLevels;
}

- (unint64_t)downsampling
{
  return self->_downsampling;
}

- (void)setDownsampling:(unint64_t)a3
{
  self->_downsampling = a3;
}

- (BOOL)skipLastLevel
{
  return self->_skipLastLevel;
}

- (void)setSkipLastLevel:(BOOL)a3
{
  self->_skipLastLevel = a3;
}

- (BOOL)twoStageFlow
{
  return self->_twoStageFlow;
}

- (BOOL)concurrentDualFlowProcessing
{
  return self->_concurrentDualFlowProcessing;
}

- (void)setConcurrentDualFlowProcessing:(BOOL)a3
{
  self->_concurrentDualFlowProcessing = a3;
}

- (BOOL)useAdaptationLayer
{
  return self->_useAdaptationLayer;
}

- (void)setUseAdaptationLayer:(BOOL)a3
{
  self->_useAdaptationLayer = a3;
}

- (BOOL)disableOutputFlowScaling
{
  return self->_disableOutputFlowScaling;
}

- (void)setDisableOutputFlowScaling:(BOOL)a3
{
  self->_disableOutputFlowScaling = a3;
}

- (BOOL)adaptationLayerOnly
{
  return self->_adaptationLayerOnly;
}

- (void)setAdaptationLayerOnly:(BOOL)a3
{
  self->_adaptationLayerOnly = a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (BOOL)waitForCompletion
{
  return self->_waitForCompletion;
}

- (void)setWaitForCompletion:(BOOL)a3
{
  self->_waitForCompletion = a3;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_flowEstimateSemaphore, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_correlation, 0);
  objc_storeStrong((id *)&self->_adaptationFeatureExtractor, 0);
  for (i = 0; i != -6; --i)
    objc_storeStrong((id *)&self->_baseFlowEstimator[i + 5], 0);
  objc_storeStrong((id *)&self->_baseFeatureExtractor, 0);
  for (j = 88; j != 40; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
}

@end
