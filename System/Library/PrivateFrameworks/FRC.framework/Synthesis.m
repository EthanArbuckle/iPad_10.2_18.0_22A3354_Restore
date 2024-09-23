@implementation Synthesis

- (Synthesis)init
{
  return -[Synthesis initWithMode:](self, "initWithMode:", 4);
}

- (Synthesis)initWithMode:(int64_t)a3
{
  Synthesis *v4;
  Synthesis *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *completionSemaphore;
  Synthesis *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)Synthesis;
  v4 = -[Synthesis init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_usage = a3;
    if (!-[Synthesis createModules](v4, "createModules"))
    {
      NSLog(CFSTR("Failed to create sub-modules\n"));
      v8 = 0;
      goto LABEL_6;
    }
    v5->_resourcesPreAllocated = 0;
    v5->_tilingEnabled = 0;
    v6 = dispatch_semaphore_create(0);
    completionSemaphore = v5->_completionSemaphore;
    v5->_completionSemaphore = (OS_dispatch_semaphore *)v6;

    v5->_numWarpedBuffers = 1;
    v5->_framePipeline = 1;
    v5->_pyramidLevels = 3;
    v5->_flowLevel = 1;
    v5->_fullWarpStartLevel = 1;
    *(_WORD *)&v5->_filterErrorMap = 0;
    v5->_useFusedKernel = 1;
  }
  v8 = v5;
LABEL_6:

  return v8;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)synthesisTensorSizeForLevel:(SEL)a3
{
  _BOOL4 linearSplatting;
  int64_t usage;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  v11 = 0;
  v12 = 0;
  linearSplatting = self->_linearSplatting;
  usage = self->_usage;
  if (linearSplatting)
    FRCGetInputFrameSizeForUsage(usage, &v12, &v11);
  else
    FRCGetAlignedInputFrameSizeForUsage(usage, &v12, &v11);
  v10 = v11;
  for (i = v12; a4; --a4)
  {
    i = (unint64_t)(i + 1) >> 1;
    v10 = (unint64_t)(v10 + 1) >> 1;
  }
  retstr->var0 = i;
  retstr->var1 = v10;
  retstr->var2 = 3;
  return result;
}

- (void)allocateResources
{
  unint64_t synthesisMode;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!self->_resourcesPreAllocated)
  {
    -[Synthesis allocateForwardWarpInternalBuffers](self, "allocateForwardWarpInternalBuffers");
    -[Synthesis allocateFeatures](self, "allocateFeatures");
    -[Synthesis allocateWarpedFeatures](self, "allocateWarpedFeatures");
    -[Synthesis allocateFlowAndLossTextures](self, "allocateFlowAndLossTextures");
    -[Synthesis allocateSplattingTextures](self, "allocateSplattingTextures");
    v5 = 0;
    v6 = 0;
    FRCGetAlignedInputFrameSizeForUsage(self->_usage, &v6, &v5);
    self->_normalizedBufferPool = createPixelBufferPool(v6, 3 * v5, 1278226536, 0);
    synthesisMode = self->_synthesisMode;
    if (synthesisMode == 1 || !synthesisMode && self->_temporalFiltering)
    {
      v4 = -[EspressoModel usage](self->_gridNet, "usage");
      v7 = 0;
      v8 = 0;
      FRCGetAlignedInputFrameSizeForUsage(v4, &v8, &v7);
      self->_dcBufferPool = createPixelBufferPool(v8, 3 * v7, 1278226536, 0);
    }
    self->_resourcesPreAllocated = 1;
  }
}

- (void)releaseResources
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  __CVPixelBufferPool *normalizedBufferPool;
  __CVPixelBufferPool *dcBufferPool;

  if (self->_resourcesPreAllocated)
  {
    v3 = 0;
    do
    {
      -[Synthesis releaseFeaturesForLevel:](self, "releaseFeaturesForLevel:", v3);
      v3 = (v3 + 1);
    }
    while ((_DWORD)v3 != 5);
    if (self->_numWarpedBuffers)
    {
      v4 = 0;
      v5 = 1;
      do
      {
        -[Synthesis releaseWarpedFeaturesForIndex:](self, "releaseWarpedFeaturesForIndex:", v4);
        v4 = v5;
      }
      while (self->_numWarpedBuffers > v5++);
    }
    -[Synthesis releaseForwardWarpInternalTexturesAndBuffers](self, "releaseForwardWarpInternalTexturesAndBuffers");
    normalizedBufferPool = self->_normalizedBufferPool;
    if (normalizedBufferPool)
      CFRelease(normalizedBufferPool);
    dcBufferPool = self->_dcBufferPool;
    if (dcBufferPool)
      CFRelease(dcBufferPool);
    -[Synthesis releaseSplattingTextures](self, "releaseSplattingTextures");
    self->_resourcesPreAllocated = 0;
  }
}

- ($E5C4B62B72694C91D3AF528F66444F85)warpedForwardFeatures
{
  if (self->_resourcesPreAllocated)
    return ($E5C4B62B72694C91D3AF528F66444F85 *)self->_warpedForwardFeatures;
  else
    return 0;
}

- ($E5C4B62B72694C91D3AF528F66444F85)warpedBackwardFeatures
{
  if (self->_resourcesPreAllocated)
    return ($E5C4B62B72694C91D3AF528F66444F85 *)self->_warpedBackwardFeatures;
  else
    return 0;
}

- ($5F31EEEF43F9D35F5EF7F84C27E8E4C6)firstFeatures
{
  if (self->_resourcesPreAllocated)
    return ($5F31EEEF43F9D35F5EF7F84C27E8E4C6 *)&self->_firstFeatures;
  else
    return 0;
}

- (id)firstForwarpInput
{
  uint64_t v2;

  v2 = 344;
  if (!self->_useFlowConsistencyMap)
    v2 = 368;
  return *(id *)((char *)&self->super.isa + v2);
}

- (id)secondForwarpInput
{
  uint64_t v2;

  v2 = 352;
  if (!self->_useFlowConsistencyMap)
    v2 = 408;
  return *(id *)((char *)&self->super.isa + v2);
}

- ($4F8AEDB151FE6B7D930C67B8235148C5)secondFeatures
{
  if (self->_resourcesPreAllocated)
    return ($4F8AEDB151FE6B7D930C67B8235148C5 *)&self->_secondFeatures;
  else
    return 0;
}

- (void)dealloc
{
  SynthesisGridNet *gridNet;
  Tiling *tiling;
  FlowConsistencyMap *flowConsisteny;
  objc_super v6;

  gridNet = self->_gridNet;
  self->_gridNet = 0;

  tiling = self->_tiling;
  self->_tiling = 0;

  flowConsisteny = self->_flowConsisteny;
  self->_flowConsisteny = 0;

  v6.receiver = self;
  v6.super_class = (Class)Synthesis;
  -[Synthesis dealloc](&v6, sel_dealloc);
}

- (BOOL)createModules
{
  MTLDeviceSPI *v3;
  MTLDeviceSPI *device;
  MTLCommandQueue *v5;
  MTLCommandQueue *commandQueue;
  Backwarp *v7;
  Backwarp *backwarp;
  Pyramid *v9;
  Pyramid *pyramid;
  FlowConsistencyMap *v11;
  FlowConsistencyMap *flowConsisteny;

  v3 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  v5 = (MTLCommandQueue *)-[MTLDeviceSPI newCommandQueue](self->_device, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v5;

  v7 = -[Backwarp initWithDevice:interleaved:]([Backwarp alloc], "initWithDevice:interleaved:", self->_device, 0);
  backwarp = self->_backwarp;
  self->_backwarp = v7;

  if (!self->_backwarp)
  {
    NSLog(CFSTR("Failed to create Backwarp\n"));
    return 0;
  }
  v9 = -[Pyramid initWithDevice:commmandQueue:]([Pyramid alloc], "initWithDevice:commmandQueue:", self->_device, self->_commandQueue);
  pyramid = self->_pyramid;
  self->_pyramid = v9;

  if (!self->_pyramid)
  {
    NSLog(CFSTR("Failed to create Pyramid\n"));
    return 0;
  }
  if (self->_useFlowConsistencyMap)
  {
    v11 = -[FlowConsistencyMap initWithDevice:commmandQueue:]([FlowConsistencyMap alloc], "initWithDevice:commmandQueue:", self->_device, self->_commandQueue);
    flowConsisteny = self->_flowConsisteny;
    self->_flowConsisteny = v11;

  }
  return 1;
}

- (void)allocateForwardWarpInternalBuffers
{
  unint64_t v3;

  if (self->_pyramidLevels)
  {
    v3 = 0;
    do
      -[Synthesis allocateForwardWarpBuffersForLevel:](self, "allocateForwardWarpBuffersForLevel:", v3++);
    while (self->_pyramidLevels > v3);
  }
}

- (void)allocateFlowAndLossTextures
{
  unint64_t v3;
  MTLTexture **backwardLossTexture;
  unint64_t flowLevel;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  MTLTexture *v9;
  uint64_t v10;
  MTLTexture *v11;
  uint64_t v12;
  MTLTexture *v13;
  MTLTexture *v14;
  MTLTexture *filteredForwardLossTexture;
  MTLTexture *v16;
  MTLTexture *filteredBackwarLossTexture;

  if (self->_pyramidLevels)
  {
    v3 = 0;
    backwardLossTexture = self->_backwardLossTexture;
    do
    {
      if (self->_synthesisMode == 3 && !self->_fullSizeSplatting)
        flowLevel = self->_flowLevel;
      else
        flowLevel = v3;
      -[Synthesis synthesisTensorSizeForLevel:](self, "synthesisTensorSizeForLevel:", flowLevel);
      createTextures(self->_device, 0, 0, 1, 1uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(backwardLossTexture - 5);
      *(backwardLossTexture - 5) = (MTLTexture *)v6;

      createTextures(self->_device, 0, 0, 1, 1uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *backwardLossTexture;
      *backwardLossTexture = (MTLTexture *)v8;

      if (v3 != 1)
      {
        createTextures(self->_device, 0, 0, 1, 2uLL);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = backwardLossTexture[5];
        backwardLossTexture[5] = (MTLTexture *)v10;

        createTextures(self->_device, 0, 0, 1, 2uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = backwardLossTexture[10];
        backwardLossTexture[10] = (MTLTexture *)v12;

        if (!v3 && self->_filterErrorMap)
        {
          -[Forwarp filterErrorMapByGaussian](self->_forwarp, "filterErrorMapByGaussian");
          createTextures(self->_device, 0, 0, 1, 1uLL);
          v14 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          filteredForwardLossTexture = self->_filteredForwardLossTexture;
          self->_filteredForwardLossTexture = v14;

          createTextures(self->_device, 0, 0, 1, 1uLL);
          v16 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          filteredBackwarLossTexture = self->_filteredBackwarLossTexture;
          self->_filteredBackwarLossTexture = v16;

        }
      }
      ++v3;
      ++backwardLossTexture;
    }
    while (self->_pyramidLevels > v3);
  }
}

- (void)allocateForwardWarpBuffersForLevel:(int)a3
{
  uint64_t v5;
  int flowLevel;
  unint64_t v7;
  uint64_t v8;
  unint64_t synthesisMode;
  uint64_t v10;
  Class *v11;
  Class v12;
  uint64_t v13;
  Class *v14;
  Class v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (self->_synthesisMode != 3)
  {
    v5 = 3;
    goto LABEL_5;
  }
  if (self->_fullSizeSplatting)
  {
    v5 = 2;
LABEL_5:
    flowLevel = a3;
    goto LABEL_6;
  }
  flowLevel = self->_flowLevel;
  v5 = 2;
LABEL_6:
  v16 = 0;
  v17 = 0;
  v18 = 0;
  getSynthesisTensorSize(self->_usage, flowLevel, &v16);
  v7 = v16;
  v8 = v17;
  if (a3 <= 0
    && (synthesisMode = self->_synthesisMode, synthesisMode - 2 >= 2)
    && (synthesisMode || !self->_temporalFiltering)
    || self->_linearSplatting)
  {
    -[Forwarp createBestBufferWidth:height:](self->_forwarp, "createBestBufferWidth:height:", 32, 32);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = &self->super.isa + a3;
  }
  else
  {
    -[Forwarp createBestBufferWidth:height:](self->_forwarp, "createBestBufferWidth:height:", v16, v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = &self->super.isa + a3;
  }
  v12 = v11[31];
  v11[31] = (Class)v10;

  -[Forwarp createOutputBufferWidth:height:channels:](self->_forwarp, "createOutputBufferWidth:height:channels:", v7, v8, v5 + self->_useFlowConsistencyMap);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = &self->super.isa + a3;
  v15 = v14[36];
  v14[36] = (Class)v13;

}

- (void)allocateSplattingTextures
{
  MTLTexture *v3;
  MTLTexture *firstWarpedTexture;
  MTLTexture *v5;
  MTLTexture *secondWarpedTexture;
  MTLTexture *v7;
  MTLTexture *dilatedForwardMask;
  MTLTexture *v9;
  MTLTexture *dilatedBackwardMask;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MTLTexture *v15;
  MTLTexture *v16;
  MTLTexture *v17;
  MTLTexture *v18;
  MTLTexture *v19;
  MTLTexture *v20;
  MTLTexture *v21;
  MTLTexture *v22;
  uint64_t v23;
  uint64_t v24;
  MTLTexture *v25;
  MTLTexture *blendedDCTexture;
  MTLTexture *v27;
  MTLTexture *v28;
  MTLTexture *v29;
  MTLTexture *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = 0;
  v35 = 0;
  FRCGetAlignedInputFrameSizeForUsage(self->_usage, &v35, &v34);
  switch(self->_synthesisMode)
  {
    case 0uLL:
      if (self->_temporalFiltering)
      {
        createTextures(self->_device, v35, v34, 1, 4uLL);
        v3 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        firstWarpedTexture = self->_firstWarpedTexture;
        self->_firstWarpedTexture = v3;

        createTextures(self->_device, v35, v34, 1, 4uLL);
        v5 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        secondWarpedTexture = self->_secondWarpedTexture;
        self->_secondWarpedTexture = v5;

        goto LABEL_4;
      }
      return;
    case 1uLL:
      if (self->_temporalFiltering)
        goto LABEL_6;
      return;
    case 2uLL:
LABEL_4:
      createTextures(self->_device, v35, v34, 1, 1uLL);
      v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      dilatedForwardMask = self->_dilatedForwardMask;
      self->_dilatedForwardMask = v7;

      createTextures(self->_device, v35, v34, 1, 1uLL);
      v9 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      dilatedBackwardMask = self->_dilatedBackwardMask;
      self->_dilatedBackwardMask = v9;
      goto LABEL_18;
    case 3uLL:
LABEL_6:
      v31 = 0;
      v32 = 0;
      v33 = 0;
      getSynthesisTensorSize(self->_usage, self->_flowLevel, (unint64_t *)&v31);
      v11 = v31;
      v12 = v32;
      if (self->_fullSizeSplatting)
        v13 = v35;
      else
        v13 = v31;
      if (self->_fullSizeSplatting)
        v14 = v34;
      else
        v14 = v32;
      createTextures(self->_device, v13, v14, 1, 1uLL);
      v15 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v16 = self->_dilatedForwardMask;
      self->_dilatedForwardMask = v15;

      createTextures(self->_device, v13, v14, 1, 1uLL);
      v17 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v18 = self->_dilatedBackwardMask;
      self->_dilatedBackwardMask = v17;

      if (self->_synthesisMode != 3)
      {
        createTextures(self->_device, v11, v12, 1, 4uLL);
        v28 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v29 = self->_firstWarpedTexture;
        self->_firstWarpedTexture = v28;

        createTextures(self->_device, v11, v12, 1, 4uLL);
        v30 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        dilatedBackwardMask = self->_secondWarpedTexture;
        self->_secondWarpedTexture = v30;
        goto LABEL_18;
      }
      if (!self->_useFusedKernel)
      {
        createTextures(self->_device, v35, v34, 1, 3uLL);
        v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v20 = self->_firstWarpedTexture;
        self->_firstWarpedTexture = v19;

        createTextures(self->_device, v35, v34, 1, 3uLL);
        v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v22 = self->_secondWarpedTexture;
        self->_secondWarpedTexture = v21;

      }
      if (self->_twoLayerFlowSplatting)
      {
        v23 = -[MTLTexture width](self->_firstFeatures.features[3], "width");
        v24 = -[MTLTexture height](self->_firstFeatures.features[3], "height");
        createTextures(self->_device, v23, v24, 1, 3uLL);
        v25 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        blendedDCTexture = self->_blendedDCTexture;
        self->_blendedDCTexture = v25;

        createTextures(self->_device, v23, v24, 1, 3uLL);
        v27 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        dilatedBackwardMask = self->_filteredDCTexture;
        self->_filteredDCTexture = v27;
LABEL_18:

      }
      return;
    default:
      return;
  }
}

- (void)releaseSplattingTextures
{
  MTLTexture *firstWarpedTexture;
  MTLTexture *secondWarpedTexture;
  MTLTexture *dilatedForwardMask;
  MTLTexture *dilatedBackwardMask;
  MTLTexture *firstForwarpInputWithConsistencyMap;
  MTLTexture *secondForwarpInputWithConsistencyMap;
  MTLTexture *blendedDCTexture;
  MTLTexture *filteredDCTexture;

  firstWarpedTexture = self->_firstWarpedTexture;
  self->_firstWarpedTexture = 0;

  secondWarpedTexture = self->_secondWarpedTexture;
  self->_secondWarpedTexture = 0;

  dilatedForwardMask = self->_dilatedForwardMask;
  self->_dilatedForwardMask = 0;

  dilatedBackwardMask = self->_dilatedBackwardMask;
  self->_dilatedBackwardMask = 0;

  firstForwarpInputWithConsistencyMap = self->_firstForwarpInputWithConsistencyMap;
  self->_firstForwarpInputWithConsistencyMap = 0;

  secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  self->_secondForwarpInputWithConsistencyMap = 0;

  blendedDCTexture = self->_blendedDCTexture;
  self->_blendedDCTexture = 0;

  filteredDCTexture = self->_filteredDCTexture;
  self->_filteredDCTexture = 0;

}

- (void)releaseForwardWarpTexturesForLevel:(int)a3
{
  Class *v3;
  Class v4;
  Class v5;
  Class v6;
  Class v7;

  v3 = &self->super.isa + a3;
  v4 = v3[11];
  v3[11] = 0;

  v5 = v3[16];
  v3[16] = 0;

  v6 = v3[21];
  v3[21] = 0;

  v7 = v3[26];
  v3[26] = 0;

}

- (void)releaseForwardWarpLinearBuffersForLevel:(int)a3
{
  Class *v3;
  Class v4;
  Class v5;

  v3 = &self->super.isa + a3;
  v4 = v3[31];
  v3[31] = 0;

  v5 = v3[36];
  v3[36] = 0;

}

- (void)releaseForwardWarpInternalTextures
{
  unint64_t v3;
  MTLTexture *filteredForwardLossTexture;
  MTLTexture *filteredBackwarLossTexture;

  if (self->_pyramidLevels)
  {
    v3 = 0;
    do
      -[Synthesis releaseForwardWarpTexturesForLevel:](self, "releaseForwardWarpTexturesForLevel:", v3++);
    while (self->_pyramidLevels > v3);
  }
  filteredForwardLossTexture = self->_filteredForwardLossTexture;
  self->_filteredForwardLossTexture = 0;

  filteredBackwarLossTexture = self->_filteredBackwarLossTexture;
  self->_filteredBackwarLossTexture = 0;

}

- (void)releaseForwardWarpInternalTexturesAndBuffers
{
  unint64_t v3;

  if (self->_pyramidLevels)
  {
    v3 = 0;
    do
    {
      -[Synthesis releaseForwardWarpTexturesForLevel:](self, "releaseForwardWarpTexturesForLevel:", v3);
      -[Synthesis releaseForwardWarpLinearBuffersForLevel:](self, "releaseForwardWarpLinearBuffersForLevel:", v3++);
    }
    while (self->_pyramidLevels > v3);
  }
}

- (void)encodeSubsampleToCommandBuffer:(id)a3 flow:(id *)a4 loss:(id *)a5
{
  Backwarp *backwarp;
  id v9;
  id v10;
  id v11;

  backwarp = self->_backwarp;
  v9 = *a4;
  v10 = a4[1];
  v11 = a3;
  -[Backwarp encodeSubsampleFlowToCommandBuffer:source:destination:](backwarp, "encodeSubsampleFlowToCommandBuffer:source:destination:", v11, v9, v10);
  -[Backwarp encodeSubsampleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeSubsampleFlowToCommandBuffer:source:destination:", v11, a4[1], a4[2]);
  -[Backwarp encodeSubsampleErrorToCommandBuffer:source:destination:](self->_backwarp, "encodeSubsampleErrorToCommandBuffer:source:destination:", v11, *a5, a5[1]);
  -[Backwarp encodeSubsampleErrorToCommandBuffer:source:destination:](self->_backwarp, "encodeSubsampleErrorToCommandBuffer:source:destination:", v11, a5[1], a5[2]);

}

- (id)forwardLossTextureLevel:(int)a3
{
  return self->_forwardLossTexture[a3];
}

- (id)backwardLossTextureLevel:(int)a3
{
  return self->_backwardLossTexture[a3];
}

- (id)forwardFlowTextureLevel:(int)a3
{
  return self->_forwardFlowTexture[a3];
}

- (id)bestErrorBufferLevel:(int)a3
{
  return self->_bestErrorBuffer[a3];
}

- (id)warpOutputBufferLevel:(int)a3
{
  return self->_warpOutputBuffer[a3];
}

- (void)warpFeatureLevel:(int)a3 timeScale:(float)a4
{
  uint64_t v5;
  unint64_t v7;
  id *v8;
  id v9;
  _BOOL4 v10;
  int64_t fullWarpStartLevel;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  id v17;
  id v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *context;
  id v23;
  _QWORD v24[5];
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;

  v5 = *(_QWORD *)&a3;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  -[Synthesis getWarpedFeatureSizeForLevel:tensorSize:](self, "getWarpedFeatureSizeForLevel:tensorSize:", *(_QWORD *)&a3, &v40);
  v7 = v42;
  v8 = (id *)(&self->super.isa + (int)v5);
  v9 = v8[46];
  v23 = v8[51];
  v10 = isBufferCopyNecessaryForCVtoTextureConversion(v40, v41, v42);
  fullWarpStartLevel = self->_fullWarpStartLevel;
  context = (void *)MEMORY[0x1D825AFCC]();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[self->_bufferIndex].features[(int)v5], self->_device, 1, v7);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v8[21];
  v13 = v8[11];
  v14 = v35[5];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __40__Synthesis_warpFeatureLevel_timeScale___block_invoke;
  v32[3] = &unk_1E9786CA8;
  v33 = v10;
  v32[4] = &v34;
  *(float *)&v15 = a4;
  -[Synthesis forwardWarpForLevel:feature:flow:error:timeScale:warpedOutput:fullWarp:callback:](self, "forwardWarpForLevel:feature:flow:error:timeScale:warpedOutput:fullWarp:callback:", v5, v9, v12, v13, v14, fullWarpStartLevel <= (int)v5, v15, v32);
  v16 = (int)v5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  createTexturesFromCVPixelBuffer(self->_warpedBackwardFeatures[self->_bufferIndex].features[(int)v5], self->_device, 1, v7);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v8[26];
  v18 = v8[16];
  *(float *)&v19 = 1.0 - a4;
  v20 = v27[5];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __40__Synthesis_warpFeatureLevel_timeScale___block_invoke_2;
  v24[3] = &unk_1E9786CA8;
  v25 = v10;
  v24[4] = &v26;
  -[Synthesis forwardWarpForLevel:feature:flow:error:timeScale:warpedOutput:fullWarp:callback:](self, "forwardWarpForLevel:feature:flow:error:timeScale:warpedOutput:fullWarp:callback:", v5, v23, v17, v18, v20, fullWarpStartLevel <= (int)v5, v19, v24);
  if (v10)
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    copyTextureToBufferWithBlit((void *)v35[5], self->_warpedForwardFeatures[self->_bufferIndex].features[v16], self->_device, v21);
    copyTextureToBufferWithBlit((void *)v27[5], self->_warpedBackwardFeatures[self->_bufferIndex].features[v16], self->_device, v21);
    objc_msgSend(v21, "commit");
    objc_msgSend(v21, "waitUntilScheduled");

  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v34, 8);
  objc_autoreleasePoolPop(context);

}

void __40__Synthesis_warpFeatureLevel_timeScale___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (!*(_BYTE *)(a1 + 40))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v2 = *(void **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = 0;

  }
}

void __40__Synthesis_warpFeatureLevel_timeScale___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (!*(_BYTE *)(a1 + 40))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v2 = *(void **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = 0;

  }
}

- (void)warpFeaturesPerLayerWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 timeScale:(float)a5
{
  MTLTexture *v8;
  MTLTexture *v9;
  MTLTexture *v10;
  MTLTexture *v11;
  MTLTexture *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  unsigned int v17;
  MTLTexture *v18;

  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v9 = self->_forwardFlowTexture[1];
  self->_forwardFlowTexture[1] = v8;

  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v11 = self->_backwardFlowTexture[1];
  self->_backwardFlowTexture[1] = v10;

  v18 = self->_firstFeatures.features[self->_pyramidLevels];
  v12 = self->_secondFeatures.features[self->_pyramidLevels];
  v13 = (void *)MEMORY[0x1D825AFCC]();
  *(float *)&v14 = a5;
  -[Synthesis calcBackwarpLossFirst:second:timeScale:](self, "calcBackwarpLossFirst:second:timeScale:", v18, v12, v14);
  objc_autoreleasePoolPop(v13);
  v16 = self->_synthesisMode == 1;
  if (self->_synthesisMode == 1)
    v17 = 4;
  else
    v17 = 3;
  do
  {
    *(float *)&v15 = a5;
    -[Synthesis warpFeatureLevel:timeScale:](self, "warpFeatureLevel:timeScale:", v16, v15);
    v16 = (v16 + 1);
  }
  while (v16 < v17);

}

- (void)calcBackwarpLossFirst:(id)a3 second:(id)a4 timeScale:(float)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  Class *v13;
  unint64_t v14;
  uint64_t v15;
  Class *v16;
  unint64_t v17;
  id v18;

  v18 = a3;
  v8 = a4;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueue");
  *(float *)&v10 = a5;
  -[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:](self->_backwarp, "encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:", v9, v18, v8, self->_forwardFlowTexture[1], self->_forwardLossTexture[1], v10);
  *(float *)&v11 = 1.0 - a5;
  -[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:](self->_backwarp, "encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:", v9, v8, v18, self->_backwardFlowTexture[1], self->_backwardLossTexture[1], v11);
  if (self->_pyramidLevels >= 3)
  {
    v12 = 0;
    do
    {
      v13 = &self->super.isa + v12;
      -[Backwarp encodeSubsampleErrorToCommandBuffer:source:destination:](self->_backwarp, "encodeSubsampleErrorToCommandBuffer:source:destination:", v9, v13[12], v13[13]);
      -[Backwarp encodeSubsampleErrorToCommandBuffer:source:destination:](self->_backwarp, "encodeSubsampleErrorToCommandBuffer:source:destination:", v9, v13[17], v13[18]);
      v14 = v12 + 3;
      ++v12;
    }
    while (self->_pyramidLevels > v14);
  }
  if (self->_synthesisMode == 1)
  {
    -[Backwarp encodeUpscaleErrorToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleErrorToCommandBuffer:source:destination:", v9, self->_forwardLossTexture[1], self->_forwardLossTexture[0]);
    -[Backwarp encodeUpscaleErrorToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleErrorToCommandBuffer:source:destination:", v9, self->_backwardLossTexture[1], self->_backwardLossTexture[0]);
  }
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v9, self->_forwardFlowTexture[1], self->_forwardFlowTexture[0]);
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v9, self->_backwardFlowTexture[1], self->_backwardFlowTexture[0]);
  if (self->_pyramidLevels >= 3)
  {
    v15 = 0;
    do
    {
      v16 = &self->super.isa + v15;
      -[Backwarp encodeSubsampleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeSubsampleFlowToCommandBuffer:source:destination:", v9, v16[22], v16[23]);
      -[Backwarp encodeSubsampleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeSubsampleFlowToCommandBuffer:source:destination:", v9, v16[27], v16[28]);
      v17 = v15 + 3;
      ++v15;
    }
    while (self->_pyramidLevels > v17);
  }
  kdebug_trace();
  objc_msgSend(v9, "addCompletedHandler:", &__block_literal_global_0);
  objc_msgSend(v9, "commit");

}

uint64_t __52__Synthesis_calcBackwarpLossFirst_second_timeScale___block_invoke()
{
  return kdebug_trace();
}

- (void)forwardWarpForLevel:(int)a3 feature:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 warpedOutput:(id)a8 fullWarp:(BOOL)a9 callback:(id)a10
{
  _BOOL8 v10;
  id v18;
  MTLCommandQueue *commandQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  _QWORD v26[4];
  id v27;

  v10 = a9;
  v18 = a10;
  commandQueue = self->_commandQueue;
  v20 = a8;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = a7;
  -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:](self->_forwarp, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:", v24, v23, v22, v21, v10, self->_bestErrorBuffer[a3], v25, self->_warpOutputBuffer[a3], v20);

  kdebug_trace();
  if (v18)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __93__Synthesis_forwardWarpForLevel_feature_flow_error_timeScale_warpedOutput_fullWarp_callback___block_invoke;
    v26[3] = &unk_1E97868A8;
    v27 = v18;
    objc_msgSend(v24, "addCompletedHandler:", v26);

  }
  objc_msgSend(v24, "commit");
  if (self->_pyramidLevels - 1 == a3)
    objc_msgSend(v24, "waitUntilScheduled");
  kdebug_trace();

}

uint64_t __93__Synthesis_forwardWarpForLevel_feature_flow_error_timeScale_warpedOutput_fullWarp_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forwardWarpForLevel:(int)a3 first:(id)a4 second:(id)a5 timeScale:(float)a6 forwardOutput:(id)a7 backwardOutput:(id)a8
{
  uint64_t v12;
  MTLCommandQueue *commandQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  Class *v19;
  double v20;
  double v21;
  id v22;

  v12 = *(_QWORD *)&a3;
  commandQueue = self->_commandQueue;
  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v19 = &self->super.isa + (int)v12;
  *(float *)&v20 = a6;
  -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:](self->_forwarp, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:", v22, v18, v19[21], v19[11], (int)v12 > 0, v19[31], v20, v19[36], v16);

  *(float *)&v21 = a6;
  -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:](self->_forwarp, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:", v22, v17, v19[26], v19[16], (int)v12 > 0, v19[31], v21, v19[36], v15);

  objc_msgSend(v22, "commit");
  objc_msgSend(v22, "waitUntilCompleted");
  -[Synthesis releaseFeaturesForLevel:](self, "releaseFeaturesForLevel:", v12);

}

- (void)synthesizeFrameFromFeatureForward:(id *)a3 backward:(id *)a4 destination:(__CVBuffer *)a5 callback:(id)a6
{
  -[SynthesisGridNet synthesizeFrameFromFeatureForward:backward:destination:pyramidStartLevel:callback:](self->_gridNet, "synthesizeFrameFromFeatureForward:backward:destination:pyramidStartLevel:callback:", a3, a4, a5, self->_synthesisMode == 1, a6);
}

- (void)allocateFeatures
{
  unint64_t pyramidLevels;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;

  pyramidLevels = self->_pyramidLevels;
  v4 = pyramidLevels + 1;
  if (self->_synthesisMode == 3)
  {
    v5 = pyramidLevels + 2;
    if (self->_twoLayerFlowSplatting)
      v4 = v5;
  }
  if (v4)
  {
    for (i = 0; i != v4; ++i)
      -[Synthesis allocateFeaturesForUsage:Level:](self, "allocateFeaturesForUsage:Level:", self->_usage, i);
  }
}

- (int)twoLayerFlowSplattingFeatureLevelForLevel:(int)a3
{
  if (!a3)
    return 1;
  if (a3 == 1)
    return 0;
  if ((unint64_t)FRCGetNumberOfPixelsForUsage(self->_usage) >> 12 > 0x7E8)
    return 2;
  if (self->_twoLayerQuarterSizeDC)
    return 2;
  return 1;
}

- (void)allocateFeaturesForUsage:(int64_t)a3 Level:(int)a4
{
  __int16 v5;
  int flowLevel;
  uint64_t v8;
  Class *v9;
  Class v10;
  uint64_t v11;
  Class v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  if (self->_synthesisMode == 3)
  {
    if (self->_fullSizeSplatting)
    {
      flowLevel = 0;
    }
    else if (self->_twoLayerFlowSplatting)
    {
      flowLevel = -[Synthesis twoLayerFlowSplattingFeatureLevelForLevel:](self, "twoLayerFlowSplattingFeatureLevelForLevel:", *(_QWORD *)&a4);
    }
    else
    {
      flowLevel = self->_flowLevel;
    }
  }
  else if (self->_pyramidLevels <= a4)
  {
    flowLevel = 1;
  }
  else
  {
    flowLevel = a4;
  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  getSynthesisTensorSize(v5, flowLevel, &v14);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, v14, v15, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUsage:", 3);
  objc_msgSend(v13, "setTextureType:", 3);
  objc_msgSend(v13, "setArrayLength:", v16);
  v8 = -[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v13);
  v9 = &self->super.isa + a4;
  v10 = v9[46];
  v9[46] = (Class)v8;

  v11 = -[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v13);
  v12 = v9[51];
  v9[51] = (Class)v11;

}

- (void)releaseFeaturesForLevel:(int)a3
{
  Class *v3;
  Class v4;
  Class v5;

  v3 = &self->super.isa + a3;
  v4 = v3[46];
  v3[46] = 0;

  v5 = v3[51];
  v3[51] = 0;

}

- (void)getWarpedFeatureSizeForLevel:(int)a3 tensorSize:(id *)a4
{
  int v5;
  __int16 QuarterSizeUsage;
  __int128 v7;
  unint64_t v8;

  v5 = a3 - 1;
  if (a3 >= 1 && self->_synthesisMode == 1)
  {
    QuarterSizeUsage = getQuarterSizeUsage(self->_usage);
    getSynthesisTensorSize(QuarterSizeUsage, v5, &a4->var0);
  }
  else
  {
    -[Synthesis synthesisTensorSizeForLevel:](self, "synthesisTensorSizeForLevel:");
    *(_OWORD *)&a4->var0 = v7;
    a4->var2 = v8;
  }
}

- (void)allocateWarpedFeatures
{
  unint64_t numTiles;
  unint64_t v4;
  unint64_t pyramidLevels;
  unint64_t i;
  unint64_t flowLevel;
  uint64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;

  numTiles = self->_numTiles;
  if (!(_DWORD)numTiles)
  {
    numTiles = 3;
    if (!self->_framePipeline)
      numTiles = 1;
  }
  LODWORD(v4) = 0;
  self->_numWarpedBuffers = numTiles;
  pyramidLevels = self->_pyramidLevels;
  do
  {
    if (pyramidLevels)
    {
      for (i = 0; i < pyramidLevels; ++i)
      {
        if (self->_synthesisMode == 3)
        {
          if (self->_fullSizeSplatting)
            flowLevel = 0;
          else
            flowLevel = self->_flowLevel;
        }
        else
        {
          flowLevel = i;
        }
        v11 = 0;
        v12 = 0;
        v13 = 0;
        -[Synthesis getWarpedFeatureSizeForLevel:tensorSize:](self, "getWarpedFeatureSizeForLevel:tensorSize:", flowLevel, &v11);
        v8 = v13;
        if (self->_synthesisMode == 2)
          v8 = v13 + 1;
        v9 = v8 + self->_useFlowConsistencyMap;
        self->_warpedFeatureChannels = v9;
        v10 = (char *)self + 40 * v4 + 8 * i;
        *((_QWORD *)v10 + 56) = createPixelBuffer(v11, v12 * v9, 0x4C303068u, 0);
        *((_QWORD *)v10 + 71) = createPixelBuffer(v11, v12 * v9, 0x4C303068u, 0);
        pyramidLevels = self->_pyramidLevels;
      }
      numTiles = self->_numWarpedBuffers;
    }
    v4 = (v4 + 1);
  }
  while (numTiles > v4);
}

- (void)releaseWarpedFeaturesForIndex:(unint64_t)a3
{
  unint64_t v4;
  char *v5;
  char *v6;

  if (self->_pyramidLevels)
  {
    v4 = 0;
    v5 = (char *)self + 40 * a3;
    do
    {
      v6 = &v5[8 * v4];
      CVPixelBufferRelease(*((CVPixelBufferRef *)v6 + 56));
      CVPixelBufferRelease(*((CVPixelBufferRef *)v6 + 71));
      ++v4;
    }
    while (self->_pyramidLevels > v4);
  }
}

- (__CVBuffer)synthesizeFrameForTimeScale:(float)a3 frameIndex:(unint64_t)a4
{
  return -[Synthesis synthesizeFrameFromFirstImage:secondImage:flowForward:flowBackward:timeScale:frameIndex:](self, "synthesizeFrameFromFirstImage:secondImage:flowForward:flowBackward:timeScale:frameIndex:", self->_normalizedFirst, self->_normalizedSecond, self->_forwardFlow, self->_backwardFlow, a4);
}

- (__CVBuffer)synthesizeFrameFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 frameIndex:(unint64_t)a8
{
  double v16;
  unint64_t synthesisMode;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  if (self->_tilingEnabled)
    return -[Synthesis synthesizeTilesWithTimeScale:](self, "synthesizeTilesWithTimeScale:", a3, a4, a5, a6, a8, *(double *)&a7);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_normalizedBufferPool, &pixelBufferOut);
  self->_bufferIndex = a8 % self->_numWarpedBuffers;
  synthesisMode = self->_synthesisMode;
  if (synthesisMode == 3)
  {
    *(float *)&v16 = a7;
    -[Synthesis synthesizeImageWithFlowSplattingFromFirstImage:secondImage:flowForward:flowBackward:timeScale:destination:](self, "synthesizeImageWithFlowSplattingFromFirstImage:secondImage:flowForward:flowBackward:timeScale:destination:", a3, a4, a5, a6, pixelBufferOut, v16);
  }
  else
  {
    *(float *)&v16 = a7;
    if (synthesisMode == 2)
      -[Synthesis synthesizeImageWithForwarpOnlyFromFirstImage:secondImage:flowForward:flowBackward:timeScale:destination:](self, "synthesizeImageWithForwarpOnlyFromFirstImage:secondImage:flowForward:flowBackward:timeScale:destination:", a3, a4, a5, a6, pixelBufferOut, v16);
    else
      -[Synthesis synthesizeImageFromFirstImage:secondImage:flowForward:flowBackward:timeScale:destination:](self, "synthesizeImageFromFirstImage:secondImage:flowForward:flowBackward:timeScale:destination:", a3, a4, a5, a6, pixelBufferOut, v16);
  }
  return pixelBufferOut;
}

- (void)createFeaturesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  size_t Width;

  self->_forwardFlow = CVPixelBufferRetain(a5);
  self->_backwardFlow = CVPixelBufferRetain(a6);
  self->_normalizedFirst = CVPixelBufferRetain(a3);
  self->_normalizedSecond = CVPixelBufferRetain(a4);
  if (self->_synthesisMode == 3)
  {
    if (!self->_fullSizeSplatting)
      -[Synthesis createSubsampledInputsFromFirstFrame:secondImage:](self, "createSubsampledInputsFromFirstFrame:secondImage:", a3, a4);
    Width = CVPixelBufferGetWidth(a5);
    if (Width != -[MTLTexture width](self->_forwardLossTexture[0], "width"))
      -[Synthesis upscaleFlowsForward:backward:](self, "upscaleFlowsForward:backward:", a5, a6);
  }
  if (self->_useFlowConsistencyMap)
    -[Synthesis createConsistencyMapFormFirstImage:secondImage:flowForward:flowBackward:](self, "createConsistencyMapFormFirstImage:secondImage:flowForward:flowBackward:", a3, a4, a5, a6);
  if (self->_pyramidLevels != 1)
  {
    if (self->_tilingEnabled)
    {
      -[Synthesis createTilesFromFirstImage:secondImage:flowForward:flowBackward:](self, "createTilesFromFirstImage:secondImage:flowForward:flowBackward:", a3, a4, a5, a6);
      CVPixelBufferRelease(a3);
      CVPixelBufferRelease(a4);
    }
    else
    {
      -[Synthesis createFeaturePyramid:second:](self, "createFeaturePyramid:second:", a3, a4);
    }
  }
}

- (void)releaseFeatures
{
  if (self->_tilingEnabled)
    -[Synthesis releaseTiles](self, "releaseTiles");
  CVPixelBufferRelease(self->_forwardFlow);
  CVPixelBufferRelease(self->_backwardFlow);
  if (self->_pyramidLevels == 1)
  {
    CVPixelBufferRelease(self->_normalizedFirst);
    CVPixelBufferRelease(self->_normalizedSecond);
  }
  *(_OWORD *)&self->_forwardFlow = 0u;
  *(_OWORD *)&self->_normalizedFirst = 0u;
}

- (void)createFeaturePyramid:(__CVBuffer *)a3 second:(__CVBuffer *)a4
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[7];

  kdebug_trace();
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueue");
  -[Pyramid encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:](self->_pyramid, "encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:", v9, v7, &self->_firstFeatures, self->_pyramidLevels);
  -[Pyramid encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:](self->_pyramid, "encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:", v9, v8, &self->_secondFeatures, self->_pyramidLevels);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__Synthesis_createFeaturePyramid_second___block_invoke;
  v10[3] = &unk_1E9786CF0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  objc_msgSend(v9, "addCompletedHandler:", v10);
  objc_msgSend(v9, "commit");
  objc_msgSend(v9, "waitUntilScheduled");

}

uint64_t __41__Synthesis_createFeaturePyramid_second___block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 962))
  {
    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  }
  return kdebug_trace();
}

- (void)synthesizeImageFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8
{
  double v13;
  __CVBuffer *v14;
  double v15;
  unint64_t synthesisMode;
  CVPixelBufferRef v17;
  double v18;
  double v19;
  CVPixelBufferRef v20;
  __CVBuffer *v21;
  Pyramid *pyramid;
  __CVBuffer *v23;
  _QWORD v24[6];
  CVPixelBufferRef v25;
  CVPixelBufferRef pixelBufferOut;

  if (self->_tilingEnabled)
    -[Synthesis createFeaturePyramid:second:](self, "createFeaturePyramid:second:", a3, a4);
  *(float *)&v13 = a7;
  -[Synthesis warpFeaturesPerLayerWithFlowForward:flowBackward:timeScale:](self, "warpFeaturesPerLayerWithFlowForward:flowBackward:timeScale:", a5, a6, v13);
  v25 = 0;
  pixelBufferOut = a8;
  v14 = a8;
  if (self->_synthesisMode <= 1)
  {
    CVPixelBufferPoolCreatePixelBuffer(0, self->_dcBufferPool, &pixelBufferOut);
    v14 = pixelBufferOut;
  }
  -[Synthesis synthesizeFrameFromFeatureForward:backward:destination:callback:](self, "synthesizeFrameFromFeatureForward:backward:destination:callback:", &self->_warpedForwardFeatures[self->_bufferIndex], &self->_warpedBackwardFeatures[self->_bufferIndex], v14, &__block_literal_global_30);
  synthesisMode = self->_synthesisMode;
  if (synthesisMode)
  {
    if (synthesisMode == 1)
    {
      v17 = pixelBufferOut;
      *(float *)&v15 = a7;
      -[Synthesis warpFeatureLevel:timeScale:](self, "warpFeatureLevel:timeScale:", 0, v15);
      if (self->_temporalFiltering)
      {
        CVPixelBufferPoolCreatePixelBuffer(0, self->_dcBufferPool, &v25);
        v17 = v25;
        *(float *)&v19 = a7;
        -[Synthesis filterGridNetOutput:timeScale:destination:](self, "filterGridNetOutput:timeScale:destination:", pixelBufferOut, v25, v19);
        v20 = v25;
        LODWORD(v18) = 0.5;
        if (self->_temporalFiltering)
          *(float *)&v18 = a7;
      }
      else
      {
        v20 = 0;
        LODWORD(v18) = 0.5;
      }
      v21 = self->_warpedForwardFeatures[self->_bufferIndex].features[0];
      pyramid = self->_pyramid;
      v23 = self->_warpedBackwardFeatures[self->_bufferIndex].features[0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __102__Synthesis_synthesizeImageFromFirstImage_secondImage_flowForward_flowBackward_timeScale_destination___block_invoke_2;
      v24[3] = &__block_descriptor_48_e5_v8__0l;
      v24[4] = pixelBufferOut;
      v24[5] = v20;
      -[Pyramid blendWarpedResidueForward:backward:withGridNetOutput:timeScale:destination:callback:](pyramid, "blendWarpedResidueForward:backward:withGridNetOutput:timeScale:destination:callback:", v21, v23, v17, a8, v24, v18);
    }
  }
  else if (self->_temporalFiltering)
  {
    *(float *)&v15 = a7;
    -[Synthesis filterGridNetOutput:timeScale:destination:](self, "filterGridNetOutput:timeScale:destination:", pixelBufferOut, a8, v15);
    CVPixelBufferRelease(pixelBufferOut);
  }
}

void __102__Synthesis_synthesizeImageFromFirstImage_secondImage_flowForward_flowBackward_timeScale_destination___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
}

- (BOOL)switchUsageTo:(int64_t)a3
{
  int64_t QuarterSizeUsage;
  unint64_t synthesisMode;
  unint64_t v6;
  char v7;
  Forwarp *v8;
  Forwarp *forwarp;
  Forwarp *v10;
  BOOL v11;
  FlowConsistencyMap *v12;
  FlowConsistencyMap *flowConsisteny;
  SynthesisGridNet *v14;
  SynthesisGridNet *gridNet;

  QuarterSizeUsage = a3;
  self->_originalUsage = a3;
  if (self->_tilingEnabled)
    QuarterSizeUsage = -[Synthesis usageForTiling:](self, "usageForTiling:", a3);
  self->_usage = QuarterSizeUsage;
  self->_fullWarpStartLevel = 1;
  self->_filterErrorMap = 0;
  synthesisMode = self->_synthesisMode;
  if (synthesisMode == 1)
  {
    self->_pyramidLevels = 4;
    QuarterSizeUsage = getQuarterSizeUsage(QuarterSizeUsage);
    if (!self->_temporalFiltering)
    {
      v7 = 1;
      self->_fullWarpStartLevel = 1;
      goto LABEL_17;
    }
    self->_fullWarpStartLevel = 4;
LABEL_15:
    v7 = 1;
    goto LABEL_17;
  }
  if (synthesisMode == 2)
  {
LABEL_8:
    v6 = 1;
    goto LABEL_9;
  }
  if (synthesisMode != 3)
  {
    self->_pyramidLevels = 3;
    goto LABEL_15;
  }
  if (!self->_twoLayerFlowSplatting)
    goto LABEL_8;
  v6 = 2;
LABEL_9:
  self->_pyramidLevels = v6;
  if (self->_linearSplatting)
    self->_filterErrorMap = 1;
  v7 = 0;
  self->_framePipeline = 0;
  QuarterSizeUsage = 1;
LABEL_17:
  v8 = -[Forwarp initWithDevice:commmandQueue:mode:]([Forwarp alloc], "initWithDevice:commmandQueue:mode:", self->_device, self->_commandQueue, self->_synthesisMode);
  forwarp = self->_forwarp;
  self->_forwarp = v8;

  v10 = self->_forwarp;
  if (v10)
  {
    -[Forwarp setLinearSplatting:](v10, "setLinearSplatting:", self->_linearSplatting);
    if (self->_framePipeline)
      v11 = 0;
    else
      v11 = v7;
    self->_frameSyncRequired = v11;
    if (self->_useFlowConsistencyMap && !self->_flowConsisteny)
    {
      v12 = -[FlowConsistencyMap initWithDevice:commmandQueue:]([FlowConsistencyMap alloc], "initWithDevice:commmandQueue:", self->_device, self->_commandQueue);
      flowConsisteny = self->_flowConsisteny;
      self->_flowConsisteny = v12;

    }
    if (self->_synthesisMode > 1)
      return 1;
    v14 = -[SynthesisGridNet initWithMode:]([SynthesisGridNet alloc], "initWithMode:", QuarterSizeUsage);
    gridNet = self->_gridNet;
    self->_gridNet = v14;

    if (self->_gridNet)
      return 1;
    NSLog(CFSTR("Failed to create Synthesis GridNet\n"));
  }
  else
  {
    NSLog(CFSTR("Failed to create Forward Warp\n"));
  }
  return 0;
}

- (void)setTilingEnabled:(BOOL)a3
{
  Tiling *v4;
  Tiling *tiling;

  self->_tilingEnabled = a3;
  if (a3)
  {
    v4 = -[Tiling initWithDevice:commmandQueue:]([Tiling alloc], "initWithDevice:commmandQueue:", self->_device, self->_commandQueue);
    tiling = self->_tiling;
    self->_tiling = v4;
  }
  else
  {
    tiling = self->_tiling;
    self->_tiling = 0;
  }

}

- (int64_t)usageForTiling:(int64_t)a3
{
  int64_t result;

  if ((unint64_t)a3 > 2)
    return -1;
  result = a3 + 100;
  self->_numTiles = dword_1D428EAD0[a3];
  return result;
}

- (void)createTilesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  Tiling *tiling;
  size_t Width;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v12;
  char *v13;
  uint64_t numTiles;
  uint64x2_t *v15;
  unint64_t *p_var2;
  unint64_t v17;
  unint64_t v18;
  __CVBuffer **outputTiles;
  uint64_t v20;
  size_t v21;
  size_t v22;
  void *v23;
  uint64_t v24;
  __CVBuffer *v25;
  void *v26;
  uint64_t v27;

  v25 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v26 = (void *)MEMORY[0x1D825AFCC](self, a2);
  tiling = self->_tiling;
  Width = CVPixelBufferGetWidth(a3);
  v12 = -[Tiling createTileInfoArrayForFrameWithWidth:height:numTiles:](tiling, "createTileInfoArrayForFrameWithWidth:height:numTiles:", Width, CVPixelBufferGetHeight(a3) / 3, self->_numTiles);
  v24 = (uint64_t)&v24;
  self->_imageTileInfo = v12;
  v13 = (char *)&v24 - ((24 * self->_numTiles + 15) & 0x3FFFFFFFF0);
  numTiles = self->_numTiles;
  if ((_DWORD)numTiles)
  {
    v15 = (uint64x2_t *)(v13 + 16);
    p_var2 = &self->_imageTileInfo->var2;
    do
    {
      v15[-1] = vshrq_n_u64(*((uint64x2_t *)p_var2 - 1), 1uLL);
      v17 = *p_var2;
      p_var2 += 3;
      v15->i64[0] = v17 >> 1;
      v15 = (uint64x2_t *)((char *)v15 + 24);
      --numTiles;
    }
    while (numTiles);
    v18 = 0;
    outputTiles = self->_outputTiles;
    v20 = 8;
    do
    {
      *(outputTiles - 12) = createPixelBuffer(*(_QWORD *)((char *)self->_imageTileInfo + v20 - 8), 3 * *(unint64_t *)((char *)&self->_imageTileInfo->var0 + v20), 0x4C303068u, 0);
      *(outputTiles - 9) = createPixelBuffer(*(_QWORD *)((char *)self->_imageTileInfo + v20 - 8), 3 * *(unint64_t *)((char *)&self->_imageTileInfo->var0 + v20), 0x4C303068u, 0);
      v21 = *(_QWORD *)&v13[v20 - 8];
      v22 = 2 * *(_QWORD *)&v13[v20];
      *(outputTiles - 6) = createPixelBuffer(v21, v22, 0x4C303068u, 0);
      *(outputTiles - 3) = createPixelBuffer(v21, v22, 0x4C303068u, 0);
      -[Synthesis allocateOutputTile:tileInfo:](self, "allocateOutputTile:tileInfo:", outputTiles, (char *)self->_imageTileInfo + v20 - 8, v24);
      ++v18;
      v20 += 24;
      ++outputTiles;
    }
    while (v18 < self->_numTiles);
  }
  kdebug_trace();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "enqueue");
  -[Tiling encodeTileBufferToCommandBuffer:from:to:channels:tileInfo:numTiles:](self->_tiling, "encodeTileBufferToCommandBuffer:from:to:channels:tileInfo:numTiles:", v23, a3, self->_firstImageTiles, 3, self->_imageTileInfo, self->_numTiles);
  -[Tiling encodeTileBufferToCommandBuffer:from:to:channels:tileInfo:numTiles:](self->_tiling, "encodeTileBufferToCommandBuffer:from:to:channels:tileInfo:numTiles:", v23, a4, self->_secondImageTiles, 3, self->_imageTileInfo, self->_numTiles);
  -[Tiling encodeTileBufferToCommandBuffer:from:to:channels:tileInfo:numTiles:](self->_tiling, "encodeTileBufferToCommandBuffer:from:to:channels:tileInfo:numTiles:", v23, a5, self->_forwardFlowTiles, 2, v13, self->_numTiles);
  -[Tiling encodeTileBufferToCommandBuffer:from:to:channels:tileInfo:numTiles:](self->_tiling, "encodeTileBufferToCommandBuffer:from:to:channels:tileInfo:numTiles:", v23, v25, self->_backwardFlowTiles, 2, v13, self->_numTiles);
  objc_msgSend(v23, "addCompletedHandler:", &__block_literal_global_38);
  objc_msgSend(v23, "commit");

  objc_autoreleasePoolPop(v26);
}

uint64_t __76__Synthesis_createTilesFromFirstImage_secondImage_flowForward_flowBackward___block_invoke()
{
  return kdebug_trace();
}

- (void)releaseTiles
{
  unint64_t v3;
  __CVBuffer **firstImageTiles;

  if (self->_numTiles)
  {
    v3 = 0;
    firstImageTiles = self->_firstImageTiles;
    do
    {
      CVPixelBufferRelease(*firstImageTiles);
      CVPixelBufferRelease(firstImageTiles[3]);
      CVPixelBufferRelease(firstImageTiles[6]);
      CVPixelBufferRelease(firstImageTiles[9]);
      CVPixelBufferRelease(firstImageTiles[12]);
      ++v3;
      ++firstImageTiles;
    }
    while (v3 < self->_numTiles);
  }
  free(self->_imageTileInfo);
  self->_imageTileInfo = 0;
}

- (void)allocateOutputTile:(__CVBuffer *)a3 tileInfo:(id *)a4
{
  *a3 = createPixelBuffer(a4->var0, 3 * a4->var1, 0x4C303068u, 0);
}

- (__CVBuffer)synthesizeTilesWithTimeScale:(float)a3
{
  unint64_t v5;
  __CVBuffer **firstImageTiles;
  double v7;
  __CVBuffer *PixelBuffer;
  uint64_t v10;
  size_t v11;

  if (self->_numTiles)
  {
    v5 = 0;
    firstImageTiles = self->_firstImageTiles;
    do
    {
      self->_bufferIndex = v5;
      *(float *)&v7 = a3;
      -[Synthesis synthesizeImageFromFirstImage:secondImage:flowForward:flowBackward:timeScale:destination:](self, "synthesizeImageFromFirstImage:secondImage:flowForward:flowBackward:timeScale:destination:", *firstImageTiles, firstImageTiles[3], firstImageTiles[6], firstImageTiles[9], firstImageTiles[12], v7);
      ++v5;
      ++firstImageTiles;
    }
    while (v5 < self->_numTiles);
  }
  v10 = 0;
  v11 = 0;
  FRCGetAlignedInputFrameSizeForUsage(self->_originalUsage, (uint64_t *)&v11, &v10);
  PixelBuffer = createPixelBuffer(v11, 3 * v10, 0x4C303068u, 0);
  -[Tiling assembleTiles:to:tileInfo:numTiles:](self->_tiling, "assembleTiles:to:tileInfo:numTiles:", self->_outputTiles, PixelBuffer, self->_imageTileInfo, self->_numTiles);
  return PixelBuffer;
}

- (void)encodeForwarpToCommandBuffer:(id)a3 level:(int)a4 firstTexture:(id)a5 secondTexture:(id)a6 firstWarpedTexture:(id)a7 secondWarpedTexture:(id)a8 timeScale:(float)a9 useFlowMagnitude:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  _BOOL4 linearSplatting;
  Forwarp *forwarp;
  double v24;
  double v25;
  double v26;
  float v27;
  uint64_t v28;
  Class *v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  Class *v35;
  float v36;
  double v37;
  MTLTexture *v38;
  MTLTexture *v39;
  double v40;
  MTLTexture *v41;
  id v42;
  id v43;
  MTLTexture *v44;
  Class *v45;
  double v46;
  id v47;
  void *v48;
  id v49;

  v49 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  linearSplatting = self->_linearSplatting;
  forwarp = self->_forwarp;
  v48 = v20;
  if (a10)
  {
    LODWORD(v21) = 1051931443;
    -[Forwarp setErrorTolerance:](forwarp, "setErrorTolerance:", v21);
    -[Forwarp setLimitBilinearInterpolation:](self->_forwarp, "setLimitBilinearInterpolation:", 0);
    if (self->_linearSplatting)
      v27 = 0.03;
    else
      v27 = 3.4028e38;
    v28 = a4;
    v29 = &self->super.isa + a4;
    if (linearSplatting)
      *(float *)&v24 = 1.0;
    else
      *(float *)&v24 = a9;
    if (linearSplatting)
      v30 = 1.0;
    else
      v30 = 1.0 - a9;
    LODWORD(v25) = 1050253722;
    *(float *)&v26 = v27;
    -[Backwarp encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:first:second:flow:timeScale:gamma:protectionThreshold:destination:](self->_backwarp, "encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:first:second:flow:timeScale:gamma:protectionThreshold:destination:", v49, v17, v18, v29[21], v29[11], v24, v25, v26);
    *(float *)&v31 = v30;
    LODWORD(v32) = 1050253722;
    *(float *)&v33 = v27;
    -[Backwarp encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:first:second:flow:timeScale:gamma:protectionThreshold:destination:](self->_backwarp, "encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:first:second:flow:timeScale:gamma:protectionThreshold:destination:", v49, v18, v17, v29[26], v29[16], v31, v32, v33);
  }
  else
  {
    LODWORD(v21) = 1028443341;
    -[Forwarp setErrorTolerance:](forwarp, "setErrorTolerance:", v21);
    -[Forwarp setLimitBilinearInterpolation:](self->_forwarp, "setLimitBilinearInterpolation:", 0);
    v28 = a4;
    v35 = &self->super.isa + a4;
    if (linearSplatting)
      *(float *)&v34 = 1.0;
    else
      *(float *)&v34 = a9;
    if (linearSplatting)
      v36 = 1.0;
    else
      v36 = 1.0 - a9;
    -[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:](self->_backwarp, "encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:", v49, v17, v18, v35[21], v35[11], v34);
    *(float *)&v37 = v36;
    -[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:](self->_backwarp, "encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:", v49, v18, v17, v35[26], v35[16], v37);
  }
  v38 = self->_forwardLossTexture[v28];
  v39 = self->_backwardLossTexture[v28];
  if (self->_filterErrorMap)
  {
    v41 = self->_filteredForwardLossTexture;

    v47 = v18;
    v42 = v17;
    v43 = v19;
    v44 = self->_filteredBackwarLossTexture;

    -[Forwarp encodeErrorMapFilteringToCommandBuffer:source:destination:](self->_forwarp, "encodeErrorMapFilteringToCommandBuffer:source:destination:", v49, self->_forwardLossTexture[v28], v41);
    -[Forwarp encodeErrorMapFilteringToCommandBuffer:source:destination:](self->_forwarp, "encodeErrorMapFilteringToCommandBuffer:source:destination:", v49, self->_backwardLossTexture[v28], v44);
    v38 = v41;
    v39 = v44;
    v19 = v43;
    v17 = v42;
    v18 = v47;
  }
  v45 = &self->super.isa + v28;
  *(float *)&v40 = a9;
  -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:](self->_forwarp, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:", v49, v17, v45[21], v38, 1, v45[31], v40, v45[36], v19);
  *(float *)&v46 = 1.0 - a9;
  -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:](self->_forwarp, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:", v49, v18, v45[26], v39, 1, v45[31], v46, v45[36], v48);

}

- (void)synthesizeImageWithForwarpOnlyFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8
{
  void *secondForwarpInputWithConsistencyMap;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MTLTexture *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;

  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  secondForwarpInputWithConsistencyMap = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a8, self->_device, 1, 3uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enqueue");
  v29 = (void *)v15;
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v18, v15, self->_forwardFlowTexture[0]);
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v18, v16, self->_backwardFlowTexture[0]);
  createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[self->_bufferIndex].features[0], self->_device, 1, self->_warpedFeatureChannels);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(self->_warpedBackwardFeatures[self->_bufferIndex].features[0], self->_device, 1, self->_warpedFeatureChannels);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = secondForwarpInputWithConsistencyMap;
  if (self->_useFlowConsistencyMap)
  {
    v21 = self->_firstForwarpInputWithConsistencyMap;
    secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  }
  else
  {
    v21 = (MTLTexture *)v31;
  }
  v22 = secondForwarpInputWithConsistencyMap;
  -[Forwarp setCreateOcclusionMask:](self->_forwarp, "setCreateOcclusionMask:", 1);
  LOBYTE(v28) = !self->_useFlowConsistencyMap;
  *(float *)&v23 = a7;
  -[Synthesis encodeForwarpToCommandBuffer:level:firstTexture:secondTexture:firstWarpedTexture:secondWarpedTexture:timeScale:useFlowMagnitude:](self, "encodeForwarpToCommandBuffer:level:firstTexture:secondTexture:firstWarpedTexture:secondWarpedTexture:timeScale:useFlowMagnitude:", v18, 0, v21, v22, v19, v20, v23, v28);
  LODWORD(v24) = 0;
  -[Forwarp encodeErrorMapDilationToCommandBuffer:forwardSource:backwardSource:forwardDestination:backwardDestination:minimumAdjacentHoleCount:maximumHoleValue:](self->_forwarp, "encodeErrorMapDilationToCommandBuffer:forwardSource:backwardSource:forwardDestination:backwardDestination:minimumAdjacentHoleCount:maximumHoleValue:", v18, v19, v20, self->_dilatedForwardMask, self->_dilatedBackwardMask, 3, v24);
  if (self->_useFlowConsistencyMap)
  {
    v26 = (void *)objc_msgSend(v19, "newTextureViewWithPixelFormat:textureType:levels:slices:", 25, 2, 0, 1, 3, 1);
    v27 = (void *)objc_msgSend(v20, "newTextureViewWithPixelFormat:textureType:levels:slices:", 25, 2, 0, 1, 3, 1);
  }
  else
  {
    v27 = 0;
    v26 = 0;
  }
  *(float *)&v25 = a7;
  -[Forwarp encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:first:second:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:](self->_forwarp, "encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:first:second:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:", v18, v19, v20, self->_dilatedForwardMask, self->_dilatedBackwardMask, v26, v25, v27, v17);
  objc_msgSend(v18, "commit");
  objc_msgSend(v18, "waitUntilScheduled");

}

- (void)createSubsampledInputsFromFirstFrame:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4
{
  void *v6;
  MTLTexture *v7;
  MTLCommandQueue *commandQueue;
  MTLTexture *v9;
  MTLTexture *v10;
  void *v11;
  id v12;

  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_firstFeatures.features[0];
  commandQueue = self->_commandQueue;
  v9 = self->_secondFeatures.features[0];
  v10 = v7;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enqueue");
  -[Backwarp encodeSubsampleInputToCommandBufferr:source:destination:](self->_backwarp, "encodeSubsampleInputToCommandBufferr:source:destination:", v11, v12, v10);
  -[Backwarp encodeSubsampleInputToCommandBufferr:source:destination:](self->_backwarp, "encodeSubsampleInputToCommandBufferr:source:destination:", v11, v6, v9);

  objc_msgSend(v11, "commit");
}

- (void)upscaleFlowsForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4
{
  void *v6;
  void *v7;
  id v8;

  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueue");
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v7, v8, self->_forwardFlowTexture[0]);
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v7, v6, self->_backwardFlowTexture[0]);
  objc_msgSend(v7, "commit");

}

- (void)synthesizeImageWithFlowSplattingFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8
{
  double v15;
  uint64_t v16;
  size_t Width;
  MTLTexture *v18;
  MTLTexture *v19;
  MTLTexture *v20;
  MTLTexture *v21;
  MTLTexture *v22;
  MTLTexture *v23;
  MTLTexture *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  MTLTexture *v29;
  MTLTexture *v30;
  double v31;
  double v32;
  double v33;
  MTLTexture *secondForwarpInputWithConsistencyMap;
  MTLTexture *v35;
  MTLTexture *v36;
  void *v37;
  MTLTexture *v38;
  MTLTexture *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  Forwarp *forwarp;
  MTLTexture *dilatedForwardMask;
  MTLTexture *dilatedBackwardMask;
  void *v51;
  Synthesis *v52;
  double v53;
  Forwarp *v54;
  MTLTexture *firstWarpedTexture;
  MTLTexture *secondWarpedTexture;
  MTLTexture *v57;
  MTLTexture *v58;
  double v59;
  uint64_t v60;
  MTLTexture *v61;
  MTLTexture *v62;
  MTLTexture *v63;
  MTLTexture *v64;
  MTLTexture *v65;
  MTLTexture *v66;

  LODWORD(v15) = 1028443341;
  -[Forwarp setErrorTolerance:](self->_forwarp, "setErrorTolerance:", v15);
  -[Forwarp setLimitBilinearInterpolation:](self->_forwarp, "setLimitBilinearInterpolation:", 1);
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v66 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  Width = CVPixelBufferGetWidth(a5);
  if (Width == -[MTLTexture width](self->_forwardFlowTexture[0], "width"))
  {
    createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
    v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
    v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = self->_forwardFlowTexture[0];
    v19 = self->_backwardFlowTexture[0];
  }
  v20 = v19;
  createTexturesFromCVPixelBuffer(a8, self->_device, 1, 3uLL);
  v60 = objc_claimAutoreleasedReturnValue();
  v21 = v66;
  if (!self->_fullSizeSplatting)
    v21 = self->_firstFeatures.features[0];
  v22 = v21;
  v23 = (MTLTexture *)v16;
  if (!self->_fullSizeSplatting)
    v23 = self->_secondFeatures.features[0];
  v24 = v23;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "enqueue");
  if (self->_fullSizeSplatting)
  {
    -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v25, v18, self->_forwardFlowTexture[0]);
    -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v25, v20, self->_backwardFlowTexture[0]);
    v29 = self->_forwardFlowTexture[0];

    v30 = self->_backwardFlowTexture[0];
    v20 = v30;
    v18 = v29;
  }
  LODWORD(v26) = 1.0;
  LODWORD(v27) = 1008981770;
  LODWORD(v28) = 2139095039;
  -[Backwarp encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:first:second:flow:timeScale:gamma:protectionThreshold:destination:](self->_backwarp, "encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:first:second:flow:timeScale:gamma:protectionThreshold:destination:", v25, v22, v24, v18, self->_forwardLossTexture[0], v26, v27, v28);
  LODWORD(v31) = 1.0;
  LODWORD(v32) = 1008981770;
  LODWORD(v33) = 2139095039;
  -[Backwarp encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:first:second:flow:timeScale:gamma:protectionThreshold:destination:](self->_backwarp, "encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:first:second:flow:timeScale:gamma:protectionThreshold:destination:", v25, v24, v22, v20, self->_backwardLossTexture[0], v31, v32, v33);
  v61 = v24;
  if (self->_useFlowConsistencyMap)
  {
    v64 = self->_firstForwarpInputWithConsistencyMap;
    secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  }
  else
  {
    v64 = v18;
    secondForwarpInputWithConsistencyMap = v20;
  }
  v65 = secondForwarpInputWithConsistencyMap;
  v35 = self->_forwardLossTexture[0];
  v36 = self->_backwardLossTexture[0];
  v62 = v22;
  v37 = (void *)v16;
  if (self->_filterErrorMap)
  {
    v38 = self->_filteredForwardLossTexture;

    v39 = self->_filteredBackwarLossTexture;
    -[Forwarp encodeErrorMapFilteringToCommandBuffer:source:destination:](self->_forwarp, "encodeErrorMapFilteringToCommandBuffer:source:destination:", v25, self->_forwardLossTexture[0], v38);
    -[Forwarp encodeErrorMapFilteringToCommandBuffer:source:destination:](self->_forwarp, "encodeErrorMapFilteringToCommandBuffer:source:destination:", v25, self->_backwardLossTexture[0], v39);
    v36 = v39;
    v35 = v38;
  }
  createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[self->_bufferIndex].features[0], self->_device, 1, self->_warpedFeatureChannels);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(self->_warpedBackwardFeatures[self->_bufferIndex].features[0], self->_device, 1, self->_warpedFeatureChannels);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[Forwarp setCreateOcclusionMask:](self->_forwarp, "setCreateOcclusionMask:", 1);
  *(float *)&v42 = a7;
  -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:](self->_forwarp, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:", v25, v64, v18, v35, 1, self->_bestErrorBuffer[0], v42, self->_warpOutputBuffer[0], v40);
  *(float *)&v43 = 1.0 - a7;
  -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:](self->_forwarp, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:", v25, v65, v20, v36, 1, self->_bestErrorBuffer[0], v43, self->_warpOutputBuffer[0], v41);
  LODWORD(v44) = 0;
  -[Forwarp encodeErrorMapDilationToCommandBuffer:forwardSource:backwardSource:forwardDestination:backwardDestination:minimumAdjacentHoleCount:maximumHoleValue:](self->_forwarp, "encodeErrorMapDilationToCommandBuffer:forwardSource:backwardSource:forwardDestination:backwardDestination:minimumAdjacentHoleCount:maximumHoleValue:", v25, v40, v41, self->_dilatedForwardMask, self->_dilatedBackwardMask, 3, v44);
  v63 = v18;
  if (self->_useFlowConsistencyMap)
  {
    v46 = (void *)objc_msgSend(v40, "newTextureViewWithPixelFormat:textureType:levels:slices:", 25, 2, 0, 1, 2, 1);
    v47 = (void *)objc_msgSend(v41, "newTextureViewWithPixelFormat:textureType:levels:slices:", 25, 2, 0, 1, 2, 1);
  }
  else
  {
    v46 = 0;
    v47 = 0;
  }
  if (self->_pyramidLevels == 1)
  {
    if (self->_useFusedKernel)
    {
      forwarp = self->_forwarp;
      dilatedForwardMask = self->_dilatedForwardMask;
      dilatedBackwardMask = self->_dilatedBackwardMask;
      v51 = (void *)v60;
      *(float *)&v45 = a7;
      -[Forwarp encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:first:second:forwardFlow:backwardFlow:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:](forwarp, "encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:first:second:forwardFlow:backwardFlow:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:", v25, v66, v37, v40, v41, dilatedForwardMask, v45, dilatedBackwardMask, 0, 0, v60);
    }
    else
    {
      *(float *)&v45 = a7;
      -[Backwarp encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:](self->_backwarp, "encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:", v25, v66, v40, self->_firstWarpedTexture, v45);
      *(float *)&v53 = 1.0 - a7;
      -[Backwarp encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:](self->_backwarp, "encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:", v25, v37, v41, self->_secondWarpedTexture, v53);
      v54 = self->_forwarp;
      firstWarpedTexture = self->_firstWarpedTexture;
      secondWarpedTexture = self->_secondWarpedTexture;
      v57 = self->_dilatedForwardMask;
      v58 = self->_dilatedBackwardMask;
      v51 = (void *)v60;
      *(float *)&v59 = a7;
      -[Forwarp encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:first:second:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:](v54, "encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:first:second:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:", v25, firstWarpedTexture, secondWarpedTexture, v57, v58, v46, v59, v47, v60);
    }
  }
  else
  {
    v52 = self;
    *(float *)&v45 = a7;
    v51 = (void *)v60;
    -[Synthesis encodeWarpPyramidToCommandBuffer:forwardFlow:backwardFlow:forwarpConsistency:backwardConsistency:timeScale:destination:](v52, "encodeWarpPyramidToCommandBuffer:forwardFlow:backwardFlow:forwarpConsistency:backwardConsistency:timeScale:destination:", v25, v40, v41, v46, v47, v60, v45);
  }
  objc_msgSend(v25, "commit");
  objc_msgSend(v25, "waitUntilScheduled");

}

- (void)encodeForwarpInputsForBlendToCommandBuffer:(id)a3 timeScale:(float)a4
{
  MTLTexture *v6;
  MTLTexture *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (self->_synthesisMode == 1)
  {
    v6 = self->_firstFeatures.features[4];
    v7 = self->_secondFeatures.features[4];
    v8 = 1;
  }
  else
  {
    createTexturesFromCVPixelBuffer(self->_normalizedFirst, self->_device, 1, 3uLL);
    v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    createTexturesFromCVPixelBuffer(self->_normalizedSecond, self->_device, 1, 3uLL);
    v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  -[Forwarp setCreateOcclusionMask:](self->_forwarp, "setCreateOcclusionMask:", 1);
  LOBYTE(v11) = 0;
  *(float *)&v9 = a4;
  -[Synthesis encodeForwarpToCommandBuffer:level:firstTexture:secondTexture:firstWarpedTexture:secondWarpedTexture:timeScale:useFlowMagnitude:](self, "encodeForwarpToCommandBuffer:level:firstTexture:secondTexture:firstWarpedTexture:secondWarpedTexture:timeScale:useFlowMagnitude:", v12, v8, v6, v7, self->_firstWarpedTexture, self->_secondWarpedTexture, v9, v11);
  LODWORD(v10) = 0;
  -[Forwarp encodeErrorMapDilationToCommandBuffer:forwardSource:backwardSource:forwardDestination:backwardDestination:minimumAdjacentHoleCount:maximumHoleValue:](self->_forwarp, "encodeErrorMapDilationToCommandBuffer:forwardSource:backwardSource:forwardDestination:backwardDestination:minimumAdjacentHoleCount:maximumHoleValue:", v12, self->_firstWarpedTexture, self->_secondWarpedTexture, self->_dilatedForwardMask, self->_dilatedBackwardMask, 3, v10);
  -[Forwarp setCreateOcclusionMask:](self->_forwarp, "setCreateOcclusionMask:", 0);

}

- (void)filterGridNetOutput:(__CVBuffer *)a3 timeScale:(float)a4 destination:(__CVBuffer *)a5
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a5, self->_device, 1, 3uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueue");
  *(float *)&v10 = a4;
  -[Synthesis encodeForwarpInputsForBlendToCommandBuffer:timeScale:](self, "encodeForwarpInputsForBlendToCommandBuffer:timeScale:", v9, v10);
  LODWORD(v11) = 1045220557;
  *(float *)&v12 = a4;
  -[Forwarp encodeBlendTexturesToCommandBuffer:firstWarpedTexture:secondWarpedTexture:forwardErrorMap:backwardErrorMap:synthesizedTexture:timeScale:synthesizedImageWeight:destination:](self->_forwarp, "encodeBlendTexturesToCommandBuffer:firstWarpedTexture:secondWarpedTexture:forwardErrorMap:backwardErrorMap:synthesizedTexture:timeScale:synthesizedImageWeight:destination:", v9, self->_firstWarpedTexture, self->_secondWarpedTexture, self->_dilatedForwardMask, self->_dilatedBackwardMask, v13, v12, v11, v8);
  objc_msgSend(v9, "commit");
  objc_msgSend(v9, "waitUntilScheduled");

}

- (void)createConsistencyMapFormFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  MTLTexture *v23;
  MTLTexture *firstForwarpInputWithConsistencyMap;
  MTLTexture *secondForwarpInputWithConsistencyMap;
  MTLTexture *v26;
  MTLTexture *v27;
  void *v28;
  _QWORD v29[5];

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v12;
  if (self->_synthesisMode == 3)
    v16 = v14;
  else
    v16 = (void *)v12;
  v17 = v16;
  if (self->_synthesisMode == 3)
    v18 = v15;
  else
    v18 = v13;
  v19 = v18;
  v20 = objc_msgSend(v17, "width");
  v21 = objc_msgSend(v17, "height");
  v22 = objc_msgSend(v17, "arrayLength") + 1;
  if (!self->_firstForwarpInputWithConsistencyMap)
  {
    createTextures(self->_device, v20, v21, 1, v22);
    v23 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    firstForwarpInputWithConsistencyMap = self->_firstForwarpInputWithConsistencyMap;
    self->_firstForwarpInputWithConsistencyMap = v23;

  }
  secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  if (!secondForwarpInputWithConsistencyMap)
  {
    createTextures(self->_device, v20, v21, 1, v22);
    v26 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v27 = self->_secondForwarpInputWithConsistencyMap;
    self->_secondForwarpInputWithConsistencyMap = v26;

    secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  }
  -[Synthesis encodeConsistencyMapCreationWithFlowToCommandBuffer:firstSource:secondSource:forwardFlow:backwardFlow:firstForwarpInput:secondForwarpInput:](self, "encodeConsistencyMapCreationWithFlowToCommandBuffer:firstSource:secondSource:forwardFlow:backwardFlow:firstForwarpInput:secondForwarpInput:", v11, v17, v19, v14, v15, self->_firstForwarpInputWithConsistencyMap, secondForwarpInputWithConsistencyMap);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __85__Synthesis_createConsistencyMapFormFirstImage_secondImage_flowForward_flowBackward___block_invoke;
  v29[3] = &unk_1E9786D98;
  v29[4] = self;
  objc_msgSend(v11, "addCompletedHandler:", v29);
  objc_msgSend(v11, "commit");
  objc_msgSend(v11, "waitUntilScheduled");

}

void __85__Synthesis_createConsistencyMapFormFirstImage_secondImage_flowForward_flowBackward___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 968))
  {
    objc_msgSend(*(id *)(v1 + 952), "maxConsistency");
    NSLog(CFSTR("Synthesis: Max flow consistency %f\n"), v2);
  }
}

- (void)encodeConsistencyMapCreationWithFlowToCommandBuffer:(id)a3 firstSource:(id)a4 secondSource:(id)a5 forwardFlow:(id)a6 backwardFlow:(id)a7 firstForwarpInput:(id)a8 secondForwarpInput:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;

  v30 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v28 = a5;
  v20 = objc_msgSend(v18, "arrayLength") - 1;
  v21 = objc_msgSend(v15, "width");
  v22 = objc_msgSend(v16, "width");
  v29 = (void *)objc_msgSend(v18, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v18, "pixelFormat"), 2, 0, 1, v20, 1);
  v23 = (void *)objc_msgSend(v19, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v18, "pixelFormat"), 2, 0, 1, v20, 1);
  if (v21 == v22)
  {
    v24 = v29;
    v25 = v23;
    -[FlowConsistencyMap encodeToCommandBuffer:forwardFlow:backwardFlow:forwardConsistencyMap:backwardConsistencyMap:](self->_flowConsisteny, "encodeToCommandBuffer:forwardFlow:backwardFlow:forwardConsistencyMap:backwardConsistencyMap:", v30, v16, v17, v24, v25);
  }
  else
  {
    createTextures(self->_device, objc_msgSend(v16, "width"), objc_msgSend(v16, "height"), 1, 1uLL);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    createTextures(self->_device, objc_msgSend(v16, "width"), objc_msgSend(v16, "height"), 1, 1uLL);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[FlowConsistencyMap encodeToCommandBuffer:forwardFlow:backwardFlow:forwardConsistencyMap:backwardConsistencyMap:](self->_flowConsisteny, "encodeToCommandBuffer:forwardFlow:backwardFlow:forwardConsistencyMap:backwardConsistencyMap:", v30, v16, v17, v24, v25);
    -[FlowConsistencyMap encodeMapUpscalingToCommandBuffer:source:detination:](self->_flowConsisteny, "encodeMapUpscalingToCommandBuffer:source:detination:", v30, v24, v29);
    -[FlowConsistencyMap encodeMapUpscalingToCommandBuffer:source:detination:](self->_flowConsisteny, "encodeMapUpscalingToCommandBuffer:source:detination:", v30, v25, v23);
  }
  v26 = objc_msgSend(v15, "arrayLength");
  objc_msgSend(v30, "blitCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", v15, 0, 0, v18, 0, 0, v26, 1);
  objc_msgSend(v27, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", v28, 0, 0, v19, 0, 0, v26, 1);

  objc_msgSend(v27, "endEncoding");
}

- (void)encodeWarpPyramidToCommandBuffer:(id)a3 forwardFlow:(id)a4 backwardFlow:(id)a5 forwarpConsistency:(id)a6 backwardConsistency:(id)a7 timeScale:(float)a8 destination:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MTLTexture *v21;
  MTLTexture *v22;
  MTLTexture *v23;
  double v24;
  double v25;
  double v26;
  MTLTexture *v27;
  double v28;
  double v29;
  double v30;
  id v31;

  v31 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = self->_firstFeatures.features[3];
  v22 = self->_secondFeatures.features[3];
  v23 = self->_firstFeatures.features[2];
  *(float *)&v24 = a8;
  if (self->_useFusedKernel)
  {
    -[Forwarp encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:first:second:forwardFlow:backwardFlow:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:](self->_forwarp, "encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:first:second:forwardFlow:backwardFlow:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:", v31, v23, self->_secondFeatures.features[2], v16, v17, self->_dilatedForwardMask, v24, self->_dilatedBackwardMask, v18, v19, self->_blendedDCTexture);
  }
  else
  {
    -[Backwarp encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:](self->_backwarp, "encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:", v31, v23, v16, v21, v24);
    *(float *)&v25 = 1.0 - a8;
    -[Backwarp encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:](self->_backwarp, "encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:", v31, self->_secondFeatures.features[2], v17, v22, v25);
    *(float *)&v26 = a8;
    -[Forwarp encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:first:second:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:](self->_forwarp, "encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:first:second:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:", v31, v21, v22, self->_dilatedForwardMask, self->_dilatedBackwardMask, v18, v26, v19, self->_blendedDCTexture);
  }
  -[Pyramid encode3x3GaussianFilterToCommandBuffer:source:destination:](self->_pyramid, "encode3x3GaussianFilterToCommandBuffer:source:destination:", v31, self->_blendedDCTexture, self->_filteredDCTexture);
  v27 = self->_firstFeatures.features[1];
  *(float *)&v28 = a8;
  if (self->_useFusedKernel)
  {
    -[Forwarp encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:first:second:forwardFlow:backwardFlow:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:](self->_forwarp, "encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:first:second:forwardFlow:backwardFlow:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:", v31, v27, self->_secondFeatures.features[1], v16, v17, self->_dilatedForwardMask, v28, self->_dilatedBackwardMask, v18, v19, v20);
  }
  else
  {
    -[Backwarp encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:](self->_backwarp, "encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:", v31, v27, v16, self->_firstWarpedTexture, v28);
    *(float *)&v29 = 1.0 - a8;
    -[Backwarp encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:](self->_backwarp, "encodeFlowSplattingWarpToCommandBuffer:source:flow:timeScale:destination:", v31, self->_secondFeatures.features[1], v17, self->_secondWarpedTexture, v29);
    *(float *)&v30 = a8;
    -[Forwarp encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:first:second:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:](self->_forwarp, "encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:first:second:forwardErrorMap:backwardErrorMap:forwarpConsistency:backwardConsistency:timeScale:destination:", v31, self->_firstWarpedTexture, self->_secondWarpedTexture, self->_dilatedForwardMask, self->_dilatedBackwardMask, v18, v30, v19, v20);
  }
  -[Pyramid encodeLayerBlendToCommandBuffer:baseLayer:toDestination:](self->_pyramid, "encodeLayerBlendToCommandBuffer:baseLayer:toDestination:", v31, self->_filteredDCTexture, v20);

}

- (void)upscaleForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 upscaledForwardFlow:(__CVBuffer *)a5 upscaledBackwardFlow:(__CVBuffer *)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v15, v11, v13);
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v15, v12, v14);
  objc_msgSend(v15, "commit");
  objc_msgSend(v15, "waitUntilScheduled");

}

- (BOOL)tilingEnabled
{
  return self->_tilingEnabled;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (BOOL)framePipeline
{
  return self->_framePipeline;
}

- (void)setFramePipeline:(BOOL)a3
{
  self->_framePipeline = a3;
}

- (unint64_t)synthesisMode
{
  return self->_synthesisMode;
}

- (void)setSynthesisMode:(unint64_t)a3
{
  self->_synthesisMode = a3;
}

- (int)flowLevel
{
  return self->_flowLevel;
}

- (void)setFlowLevel:(int)a3
{
  self->_flowLevel = a3;
}

- (BOOL)temporalFiltering
{
  return self->_temporalFiltering;
}

- (void)setTemporalFiltering:(BOOL)a3
{
  self->_temporalFiltering = a3;
}

- (BOOL)linearSplatting
{
  return self->_linearSplatting;
}

- (void)setLinearSplatting:(BOOL)a3
{
  self->_linearSplatting = a3;
}

- (BOOL)useFusedKernel
{
  return self->_useFusedKernel;
}

- (void)setUseFusedKernel:(BOOL)a3
{
  self->_useFusedKernel = a3;
}

- (BOOL)frameSyncRequired
{
  return self->_frameSyncRequired;
}

- (BOOL)useFlowConsistencyMap
{
  return self->_useFlowConsistencyMap;
}

- (void)setUseFlowConsistencyMap:(BOOL)a3
{
  self->_useFlowConsistencyMap = a3;
}

- (BOOL)twoLayerFlowSplatting
{
  return self->_twoLayerFlowSplatting;
}

- (void)setTwoLayerFlowSplatting:(BOOL)a3
{
  self->_twoLayerFlowSplatting = a3;
}

- (BOOL)twoLayerQuarterSizeDC
{
  return self->_twoLayerQuarterSizeDC;
}

- (void)setTwoLayerQuarterSizeDC:(BOOL)a3
{
  self->_twoLayerQuarterSizeDC = a3;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;
  uint64_t jj;
  uint64_t kk;

  objc_storeStrong((id *)&self->_flowConsisteny, 0);
  objc_storeStrong((id *)&self->_filteredDCTexture, 0);
  objc_storeStrong((id *)&self->_blendedDCTexture, 0);
  objc_storeStrong((id *)&self->_secondWarpedTexture, 0);
  objc_storeStrong((id *)&self->_firstWarpedTexture, 0);
  objc_storeStrong((id *)&self->_dilatedBackwardMask, 0);
  objc_storeStrong((id *)&self->_dilatedForwardMask, 0);
  objc_storeStrong((id *)&self->_tiling, 0);
  for (i = 0; i != 5; ++i)

  for (j = 0; j != 5; ++j)
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_secondForwarpInputWithConsistencyMap, 0);
  objc_storeStrong((id *)&self->_firstForwarpInputWithConsistencyMap, 0);
  objc_storeStrong((id *)&self->_filteredBackwarLossTexture, 0);
  objc_storeStrong((id *)&self->_filteredForwardLossTexture, 0);
  for (k = 0; k != -5; --k)
    objc_storeStrong((id *)&self->_warpOutputBuffer[k + 4], 0);
  for (m = 0; m != -5; --m)
    objc_storeStrong((id *)&self->_bestErrorBuffer[m + 4], 0);
  for (n = 0; n != -5; --n)
    objc_storeStrong((id *)&self->_backwardFlowTexture[n + 4], 0);
  for (ii = 0; ii != -5; --ii)
    objc_storeStrong((id *)&self->_forwardFlowTexture[ii + 4], 0);
  for (jj = 0; jj != -5; --jj)
    objc_storeStrong((id *)&self->_backwardLossTexture[jj + 4], 0);
  for (kk = 0; kk != -5; --kk)
    objc_storeStrong((id *)&self->_forwardLossTexture[kk + 4], 0);
  objc_storeStrong((id *)&self->_pyramid, 0);
  objc_storeStrong((id *)&self->_gridNet, 0);
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_forwarp, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
