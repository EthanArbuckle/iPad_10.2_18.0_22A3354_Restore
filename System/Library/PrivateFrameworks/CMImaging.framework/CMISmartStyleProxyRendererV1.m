@implementation CMISmartStyleProxyRendererV1

- (BOOL)supportsExternalMemoryResource
{
  return 1;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CVMetalTextureCache *textureCache;
  objc_super v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CMISmartStyleProxyRendererV1 _releaseInputPixelBuffersAndBoundTextures](self, "_releaseInputPixelBuffersAndBoundTextures");
  -[CMISmartStyleProxyRendererV1 purgeResources](self, "purgeResources");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_internallyAllocatedTextures;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v11 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        FigMetalDecRef(&v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_internallyAllocatedTextures, "removeAllObjects");
  FigMetalDecRef((id *)&self->_paramsBuf);
  FigMetalDecRef((id *)&self->_statsBuf);
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "usedSizeAll");

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CMISmartStyleProxyRendererV1;
  -[CMISmartStyleProxyRendererV1 dealloc](&v10, sel_dealloc);
}

- (CMISmartStyleProxyRendererV1)initWithOptionalMetalCommandQueue:(id)a3
{
  id v4;
  CMISmartStyleProxyRendererV1 *v5;
  FigMetalContext *v6;
  void *v7;
  uint64_t v8;
  FigMetalContext *metalContext;
  FigMetalContext *v10;
  const __CFAllocator *v11;
  const __CFDictionary *v12;
  void *v13;
  uint64_t v14;
  NSMutableSet *internallyAllocatedTextures;
  uint64_t v16;
  NSMutableSet *texturesToPurge;
  CMISmartStyleProxyRendererV1 *v18;
  objc_super v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CMISmartStyleProxyRendererV1;
  v5 = -[CMISmartStyleProxyRendererV1 init](&v20, sel_init);
  if (!v5)
    goto LABEL_6;
  v6 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v6, "initWithbundle:andOptionalCommandQueue:", v7, v4);
  metalContext = v5->_metalContext;
  v5->_metalContext = (FigMetalContext *)v8;

  v10 = v5->_metalContext;
  if (!v10)
    goto LABEL_6;
  -[FigMetalContext setAllowCommandBufferCommitsOnlyByForceCommit:](v10, "setAllowCommandBufferCommitsOnlyByForceCommit:", 1);
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v21 = *MEMORY[0x1E0CA8F48];
  v22[0] = &unk_1E9513F00;
  v12 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  -[FigMetalContext device](v5->_metalContext, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = CVMetalTextureCacheCreate(v11, v12, v13, 0, &v5->_textureCache);

  if (!(_DWORD)v11)
  {
    objc_storeStrong((id *)&v5->_tuningParameterVariant, CFSTR("DefaultParameters"));
    v5->_maxInputStylesCount = 16;
    v5->_foregroundRatio = 0.0;
    *(_OWORD *)&v5->_colorCubePixelFormat = xmmword_1D3307460;
    *(_QWORD *)&v5->_currentSceneTypeForCubes = 0x447A000000000002;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    internallyAllocatedTextures = v5->_internallyAllocatedTextures;
    v5->_internallyAllocatedTextures = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    texturesToPurge = v5->_texturesToPurge;
    v5->_texturesToPurge = (NSMutableSet *)v16;

    v18 = v5;
  }
  else
  {
LABEL_6:
    FigDebugAssert3();
    v18 = 0;
  }

  return v18;
}

- (MTLCommandQueue)metalCommandQueue
{
  return -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
}

- (void)setMetalCommandQueue:(id)a3
{
  -[FigMetalContext setCommandQueue:](self->_metalContext, "setCommandQueue:", a3);
}

- (unint64_t)_requiredAllocatorCapacity
{
  unint64_t maxInputStylesCount;
  unint64_t colorCubePixelFormat;
  unint64_t colorCubeDimension;
  void *v5;
  unint64_t v6;

  maxInputStylesCount = self->_maxInputStylesCount;
  colorCubePixelFormat = self->_colorCubePixelFormat;
  colorCubeDimension = self->_colorCubeDimension;
  -[FigMetalContext device](self->_metalContext, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CMISmartStyleColorCubePoolV1 requiredAllocatorSizeForCapacity:pixelFormat:dimension:device:](CMISmartStyleColorCubePoolV1, "requiredAllocatorSizeForCapacity:pixelFormat:dimension:device:", maxInputStylesCount, colorCubePixelFormat, colorCubeDimension, v5)+ 614400;

  return v6;
}

- (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(v4, "setMemSize:", -[CMISmartStyleProxyRendererV1 _requiredAllocatorCapacity](self, "_requiredAllocatorCapacity"));
    objc_msgSend(v4, "setAllocatorType:", 2);
    v5 = v4;
  }
  else
  {
    FigDebugAssert3();
  }

  return v4;
}

- (int)setup
{
  void *v3;
  void *v4;
  FigMetalAllocator *v5;
  void *v6;
  FigMetalAllocator *v7;
  void *v8;
  void *v9;
  void *v10;
  CMIExternalMemoryResource *externalMemoryResource;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  SmartStyleRendererPlist *v24;
  SmartStyleRendererPlist *internalTuningParams;
  int v26;
  int v27;
  int v28;
  MTLComputePipelineState *v29;
  MTLComputePipelineState *hueSatLumLUTPipelineState;
  NSDictionary *v31;
  NSDictionary *hueSatLumLUTTexByCastTypeForVariant;
  CMISmartStyleColorCubePoolV1 *colorCubePool;
  CMISmartStyleColorCubePoolV1 *v34;
  void *v35;
  void *v36;
  CMISmartStyleColorCubePoolV1 *v37;
  CMISmartStyleColorCubePoolV1 *v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *colorCubeCache;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [FigMetalAllocator alloc];
    -[FigMetalContext device](self->_metalContext, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FigMetalAllocator initWithDevice:allocatorType:](v5, "initWithDevice:allocatorType:", v6, 2);
    -[FigMetalContext setAllocator:](self->_metalContext, "setAllocator:", v7);

    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 || (v9 = (void *)objc_opt_new()) == 0)
    {
      FigDebugAssert3();
      v18 = 1;
      goto LABEL_23;
    }
    v10 = v9;
    objc_msgSend(v9, "setMemSize:", -[CMISmartStyleProxyRendererV1 _requiredAllocatorCapacity](self, "_requiredAllocatorCapacity"));
    objc_msgSend(v10, "setWireMemory:", 1);
    objc_msgSend(v10, "setLabel:", CFSTR("FigMetalAllocator_SmartStyleProxyRenderer"));
    externalMemoryResource = self->_externalMemoryResource;
    if (externalMemoryResource)
    {
      -[CMIExternalMemoryResource allocatorBackend](externalMemoryResource, "allocatorBackend");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "memSize");
      v14 = objc_msgSend(v10, "memSize");

      if (v13 < v14)
      {
LABEL_33:
        FigDebugAssert3();
        v18 = FigSignalErrorAt();
        goto LABEL_22;
      }
      -[CMIExternalMemoryResource allocatorBackend](self->_externalMemoryResource, "allocatorBackend");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMemSize:", objc_msgSend(v15, "memSize"));

      -[FigMetalContext allocator](self->_metalContext, "allocator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMIExternalMemoryResource allocatorBackend](self->_externalMemoryResource, "allocatorBackend");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "setupWithDescriptor:allocatorBackend:", v10, v17);

    }
    else
    {
      -[FigMetalContext allocator](self->_metalContext, "allocator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "setupWithDescriptor:", v10);
    }

    if (v18)
    {
LABEL_31:
      FigDebugAssert3();
      goto LABEL_22;
    }

  }
  v19 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("RendererTuning"), CFSTR("plist"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithContentsOfFile:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    cmissv1_RendererTuning();
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v23;

  v24 = (SmartStyleRendererPlist *)objc_opt_new();
  internalTuningParams = self->_internalTuningParams;
  self->_internalTuningParams = v24;

  v26 = -[SmartStyleRendererPlist readPlist:](self->_internalTuningParams, "readPlist:", v10);
  if (v26)
  {
    v18 = v26;
    goto LABEL_31;
  }
  v27 = -[CMISmartStyleProxyRendererV1 _allocateParamsAndStatsBuffers](self, "_allocateParamsAndStatsBuffers");
  if (v27)
  {
    v18 = v27;
    goto LABEL_31;
  }
  v28 = -[CMISmartStyleProxyRendererV1 _calculateCubicSplineToneCurve](self, "_calculateCubicSplineToneCurve");
  if (v28)
  {
    v18 = v28;
    goto LABEL_31;
  }
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("hueSatLumLUTCalculation"), 0);
  v29 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  hueSatLumLUTPipelineState = self->_hueSatLumLUTPipelineState;
  self->_hueSatLumLUTPipelineState = v29;

  if (!self->_hueSatLumLUTPipelineState)
    goto LABEL_33;
  -[CMISmartStyleProxyRendererV1 _calculateHueSatLumLUTTexForAllCastTypesAndVariants](self, "_calculateHueSatLumLUTTexForAllCastTypesAndVariants");
  v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  hueSatLumLUTTexByCastTypeForVariant = self->_hueSatLumLUTTexByCastTypeForVariant;
  self->_hueSatLumLUTTexByCastTypeForVariant = v31;

  if (!-[NSDictionary count](self->_hueSatLumLUTTexByCastTypeForVariant, "count"))
    goto LABEL_32;
  colorCubePool = self->_colorCubePool;
  if (!colorCubePool)
  {
    v34 = [CMISmartStyleColorCubePoolV1 alloc];
    -[FigMetalContext device](self->_metalContext, "device");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[CMISmartStyleColorCubePoolV1 initWithDevice:andAllocator:](v34, "initWithDevice:andAllocator:", v35, v36);
    v38 = self->_colorCubePool;
    self->_colorCubePool = v37;

    colorCubePool = self->_colorCubePool;
    if (!colorCubePool)
    {
LABEL_32:
      FigDebugAssert3();

      v18 = 3;
      goto LABEL_23;
    }
  }
  v18 = -[CMISmartStyleColorCubePoolV1 configureForCapacity:pixelFormat:dimension:](colorCubePool, "configureForCapacity:pixelFormat:dimension:", self->_maxInputStylesCount, self->_colorCubePixelFormat, self->_colorCubeDimension);
  if (v18)
    goto LABEL_31;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_inputStyles, "count"));
  v39 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  colorCubeCache = self->_colorCubeCache;
  self->_colorCubeCache = v39;

LABEL_22:
LABEL_23:

  return v18;
}

- (int)prewarm
{
  int v2;

  v2 = -[CMISmartStyleProxyRendererV1 _compileMetalShadersForProcessingType:](self, "_compileMetalShadersForProcessingType:", 3);
  if (v2)
    FigDebugAssert3();
  return v2;
}

- (int)prepareToProcess:(unsigned int)a3
{
  int v3;

  if (a3 >= 4)
  {
    FigDebugAssert3();
    return -1;
  }
  else
  {
    self->_processingType = a3;
    v3 = -[CMISmartStyleProxyRendererV1 _compileMetalShadersForProcessingType:](self, "_compileMetalShadersForProcessingType:");
    if (v3)
      FigDebugAssert3();
  }
  return v3;
}

- (int)process
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int processingType;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SmartStyleRendererPlist tuningVariants](self->_internalTuningParams, "tuningVariants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", self->_tuningParameterVariant);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;

  }
  else
  {
    -[SmartStyleRendererPlist defaultTuning](self->_internalTuningParams, "defaultTuning");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v20 = v2;
      LODWORD(v19) = 0;
      FigDebugAssert3();
      v17 = 4;
      goto LABEL_27;
    }
  }
  if (!-[NSArray count](self->_inputStyles, "count"))
  {
    v20 = v2;
    LODWORD(v19) = 0;
    goto LABEL_35;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_inputStyles;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "smartStyleVersion") != 1)
        {
          v20 = v2;
          LODWORD(v19) = 0;
          FigDebugAssert3();

          v17 = 0;
          goto LABEL_27;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = -[CMISmartStyleProxyRendererV1 _bindInputPixelBuffersAsTextures](self, "_bindInputPixelBuffersAsTextures");
  if (v12)
  {
    v17 = v12;
    v20 = v2;
    LODWORD(v19) = v12;
    FigDebugAssert3();
    goto LABEL_25;
  }
  if (!self->_inputImageTexture)
  {
    v20 = v2;
    LODWORD(v19) = 0;
LABEL_33:
    FigDebugAssert3();
    v17 = FigSignalErrorAt();
    goto LABEL_25;
  }
  if (!self->_outputImageTexture)
  {
    v20 = v2;
    LODWORD(v19) = 0;
    goto LABEL_33;
  }
  -[CMISmartStyleProxyRendererV1 _updateColorManagementForInputs](self, "_updateColorManagementForInputs");
  processingType = self->_processingType;
  if (processingType == 2)
  {
    v17 = -[CMISmartStyleProxyRendererV1 _renderWithColorPriors](self, "_renderWithColorPriors");
    goto LABEL_24;
  }
  if (processingType == 1)
  {
    if (-[NSArray count](self->_inputStyles, "count") <= self->_maxInputStylesCount)
    {
      v14 = -[CMISmartStyleProxyRendererV1 _updateColorCubeCache](self, "_updateColorCubeCache");
      if (v14)
      {
        v20 = v2;
        LODWORD(v19) = v14;
        FigDebugAssert3();

        v17 = -12786;
        goto LABEL_27;
      }
      v15 = -[CMISmartStyleProxyRendererV1 _updateColorCubesFromTuning:](self, "_updateColorCubesFromTuning:", v6);
      if (v15)
      {
        v20 = v2;
        LODWORD(v19) = v15;
      }
      else
      {
        v16 = -[CMISmartStyleProxyRendererV1 _renderWithColorCubes](self, "_renderWithColorCubes");
        if (!v16)
          goto LABEL_22;
        v20 = v2;
        LODWORD(v19) = v16;
      }
      FigDebugAssert3();

      v17 = -1;
      goto LABEL_27;
    }
    v20 = v2;
    LODWORD(v19) = 0;
LABEL_35:
    FigDebugAssert3();

    v17 = -12780;
    goto LABEL_27;
  }
LABEL_22:
  v17 = 0;
LABEL_24:
  -[FigMetalContext forceCommit](self->_metalContext, "forceCommit");
LABEL_25:

LABEL_27:
  -[CMISmartStyleProxyRendererV1 _releaseInputPixelBuffersAndBoundTextures](self, "_releaseInputPixelBuffersAndBoundTextures", v19, v20, (_QWORD)v21);
  return v17;
}

- (int)purgeResources
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  -[NSMutableDictionary removeAllObjects](self->_colorCubeCache, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_texturesToPurge;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v9 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        FigMetalDecRef(&v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_texturesToPurge, "removeAllObjects");
  CVMetalTextureCacheFlush(self->_textureCache, 0);
  return 0;
}

- (int)finishProcessing
{
  -[FigMetalContext waitForSchedule](self->_metalContext, "waitForSchedule");
  return 0;
}

- (int)resetState
{
  NSDictionary *currentStatsForCubes;

  -[NSMutableDictionary removeAllObjects](self->_colorCubeCache, "removeAllObjects");
  currentStatsForCubes = self->_currentStatsForCubes;
  self->_currentStatsForCubes = 0;

  return 0;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputPixelBuffer;

  inputPixelBuffer = self->_inputPixelBuffer;
  self->_inputPixelBuffer = a3;
  if (a3)
    CFRetain(a3);
  if (inputPixelBuffer)
    CFRelease(inputPixelBuffer);
}

- (void)setInputMaskPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputMaskPixelBuffer;

  inputMaskPixelBuffer = self->_inputMaskPixelBuffer;
  self->_inputMaskPixelBuffer = a3;
  if (a3)
    CFRetain(a3);
  if (inputMaskPixelBuffer)
    CFRelease(inputMaskPixelBuffer);
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *outputPixelBuffer;

  outputPixelBuffer = self->_outputPixelBuffer;
  self->_outputPixelBuffer = a3;
  if (a3)
    CFRetain(a3);
  if (outputPixelBuffer)
    CFRelease(outputPixelBuffer);
}

- (id)_newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a5;
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newBufferDescriptor");

  if (v10)
  {
    objc_msgSend(v10, "setLength:", a3);
    objc_msgSend(v10, "setOptions:", a4);
    v11 = v8;
    objc_msgSend(v10, "setLabel:", 0);
    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "newBufferWithDescriptor:", v10);

  }
  else
  {
    FigDebugAssert3();
    v13 = 0;
  }

  return v13;
}

- (id)_newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7 retainUntilPurge:(BOOL)a8 useFigMetalAllocator:(BOOL)a9
{
  uint64_t v10;

  BYTE1(v10) = a9;
  LOBYTE(v10) = a8;
  return -[CMISmartStyleProxyRendererV1 _newTexture2DWithFormat:width:height:usage:disableCompression:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:disableCompression:label:retainUntilPurge:useFigMetalAllocator:", a3, a4, a5, a6, 0, a7, v10);
}

- (id)_newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 disableCompression:(BOOL)a7 label:(id)a8 retainUntilPurge:(BOOL)a9 useFigMetalAllocator:(BOOL)a10
{
  _BOOL4 v10;
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
  void *v26;
  FigMetalContext *metalContext;
  void *v28;
  void *v29;
  void *v30;

  v10 = a7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%p"), a8, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "newTextureDescriptor");

  if (v18)
  {
    objc_msgSend(v18, "setLabel:", 0);
    objc_msgSend(v18, "desc");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextureType:", 2);

    objc_msgSend(v18, "desc");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPixelFormat:", a3);

    objc_msgSend(v18, "desc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWidth:", a4);

    objc_msgSend(v18, "desc");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHeight:", a5);

    objc_msgSend(v18, "desc");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDepth:", 1);

    objc_msgSend(v18, "desc");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUsage:", a6);

    if (v10)
    {
      objc_msgSend(v18, "desc");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCompressionMode:", 2);

      objc_msgSend(v18, "desc");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCompressionFootprint:", 0);

    }
    metalContext = self->_metalContext;
    if (a10)
    {
      -[FigMetalContext allocator](metalContext, "allocator");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "newTextureWithDescriptor:", v18);
    }
    else
    {
      -[FigMetalContext device](metalContext, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "desc");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "newTextureWithDescriptor:", v30);

    }
    if (v29)
    {
      if (a9)
        -[NSMutableSet addObject:](self->_texturesToPurge, "addObject:", v29);
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v29 = 0;
  }

  return v29;
}

- (int)_bindInputPixelBuffersAsTextures
{
  uint64_t v3;
  MTLTexture **p_inputImageTexture;
  __CVBuffer *inputMaskPixelBuffer;
  MTLTexture **p_outputImageTexture;
  uint64_t v7;
  int v8;
  int v9;
  _BYTE v11[8];
  __CVBuffer *inputPixelBuffer;
  MTLTexture **v13;
  _QWORD v14[10];

  v3 = 0;
  v14[9] = *MEMORY[0x1E0C80C00];
  p_inputImageTexture = &self->_inputImageTexture;
  inputMaskPixelBuffer = self->_inputMaskPixelBuffer;
  inputPixelBuffer = self->_inputPixelBuffer;
  v13 = &self->_inputImageTexture;
  v14[0] = 65543;
  v14[2] = inputMaskPixelBuffer;
  v14[3] = &self->_inputMaskTexture;
  v14[4] = 1;
  p_outputImageTexture = &self->_outputImageTexture;
  v14[6] = self->_outputPixelBuffer;
  v14[7] = &self->_outputImageTexture;
  v14[8] = 6;
  do
  {
    v7 = *(_QWORD *)&v11[v3 * 8 + 8];
    if (v7)
    {
      v8 = -[CMISmartStyleProxyRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", v7, v14[v3], 0, 0, v14[v3 - 1]);
      if (v8)
      {
        v9 = v8;
        FigDebugAssert3();
        return v9;
      }
    }
    v3 += 4;
  }
  while (v3 != 12);
  if (!*p_outputImageTexture && -[NSArray count](self->_inputStyles, "count") == 1)
    objc_storeStrong((id *)p_outputImageTexture, *p_inputImageTexture);
  return 0;
}

- (void)_releaseInputPixelBuffersAndBoundTextures
{
  __CVBuffer *inputPixelBuffer;
  __CVBuffer *inputMaskPixelBuffer;
  __CVBuffer *outputPixelBuffer;
  MTLTexture *inputImageTexture;
  MTLTexture *inputMaskTexture;
  MTLTexture *outputImageTexture;

  inputPixelBuffer = self->_inputPixelBuffer;
  if (inputPixelBuffer)
  {
    CFRelease(inputPixelBuffer);
    self->_inputPixelBuffer = 0;
  }
  inputMaskPixelBuffer = self->_inputMaskPixelBuffer;
  if (inputMaskPixelBuffer)
  {
    CFRelease(inputMaskPixelBuffer);
    self->_inputMaskPixelBuffer = 0;
  }
  outputPixelBuffer = self->_outputPixelBuffer;
  if (outputPixelBuffer)
  {
    CFRelease(outputPixelBuffer);
    self->_outputPixelBuffer = 0;
  }
  inputImageTexture = self->_inputImageTexture;
  self->_inputImageTexture = 0;

  inputMaskTexture = self->_inputMaskTexture;
  self->_inputMaskTexture = 0;

  outputImageTexture = self->_outputImageTexture;
  self->_outputImageTexture = 0;

}

- (int)_updateColorCubeCache
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSArray count](self->_inputStyles, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = self->_inputStyles;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        colorCubeCacheHashForStyle(*(void **)(*((_QWORD *)&v35 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_colorCubeCache, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSMutableDictionary allKeys](self->_colorCubeCache, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        if ((objc_msgSend(v3, "containsObject:", v17) & 1) == 0)
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v14);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_colorCubeCache, "removeObjectsForKeys:", v11);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_inputStyles;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    while (2)
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        colorCubeCacheHashForStyle(*(void **)(*((_QWORD *)&v27 + 1) + 8 * k));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_colorCubeCache, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          v25 = -[CMISmartStyleColorCubePoolV1 newColorCube](self->_colorCubePool, "newColorCube");
          if (!v25)
          {
            FigDebugAssert3();

            goto LABEL_29;
          }
          v24 = v25;
          objc_msgSend(v25, "setNeedsUpdate:", 1);
          -[NSMutableDictionary setObject:forKey:](self->_colorCubeCache, "setObject:forKey:", v24, v23);
        }

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_29:

  return 0;
}

- (int)_updateColorCubesFromTuning:(id)a3
{
  id v4;
  NSDictionary *inputMetadata;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  float v11;
  void *v12;
  void *v13;
  long double v14;
  NSDictionary *inputImageStatistics;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  inputMetadata = self->_inputMetadata;
  if (inputMetadata)
  {
    if (!self->_inputImageStatistics)
    {
      -[NSDictionary objectForKeyedSubscript:](inputMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0D060C0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "count"))
        objc_storeStrong((id *)&self->_inputImageStatistics, v7);

      inputMetadata = self->_inputMetadata;
    }
    -[NSDictionary objectForKeyedSubscript:](inputMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0D06098]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "intValue");
    else
      v10 = -1;
    -[NSDictionary objectForKeyedSubscript:](self->_inputMetadata, "objectForKeyedSubscript:", *MEMORY[0x1E0D06920]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      v11 = exp2(v14) * 12.5;
    }
    else
    {
      v11 = -1.0;
    }

  }
  else
  {
    v10 = -1;
    v11 = -1.0;
  }
  inputImageStatistics = self->_inputImageStatistics;
  if (inputImageStatistics
    && inputImageStatistics != self->_currentStatsForCubes
    && -[NSDictionary count](inputImageStatistics, "count"))
  {
    objc_storeStrong((id *)&self->_currentStatsForCubes, self->_inputImageStatistics);
    v16 = 1;
    if (v10 < 0)
      goto LABEL_22;
  }
  else
  {
    v16 = 0;
    if (v10 < 0)
      goto LABEL_22;
  }
  if (v10 != self->_currentSceneTypeForCubes)
  {
    self->_currentSceneTypeForCubes = v10;
    v17 = 1;
    goto LABEL_24;
  }
LABEL_22:
  v17 = 0;
LABEL_24:
  if (v11 < 0.0 || vabds_f32(v11, self->_currentBrightnessValueForCubes) <= 200.0)
  {
    if ((v16 | v17) != 1)
      goto LABEL_36;
  }
  else
  {
    self->_currentBrightnessValueForCubes = v11;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[NSMutableDictionary allValues](self->_colorCubeCache, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "setNeedsUpdate:", 1);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v20);
  }

LABEL_36:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSMutableDictionary allValues](self->_colorCubeCache, "allValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v34;
LABEL_38:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v26)
        objc_enumerationMutation(v23);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v27), "needsUpdate") & 1) != 0)
        break;
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v25)
          goto LABEL_38;
        goto LABEL_44;
      }
    }

    if (v16 && (v29 = -[CMISmartStyleProxyRendererV1 _updateStatsBuffer](self, "_updateStatsBuffer")) != 0)
    {
      v28 = v29;
    }
    else
    {
      v30 = -[CMISmartStyleProxyRendererV1 _populateStaticRenderParametersFromTuning:](self, "_populateStaticRenderParametersFromTuning:", v4);
      if (v30)
      {
        v28 = v30;
      }
      else
      {
        v31 = -[CMISmartStyleProxyRendererV1 _calculateDynamicRenderParameters](self, "_calculateDynamicRenderParameters");
        if (v31)
        {
          v28 = v31;
        }
        else
        {
          v28 = -[CMISmartStyleProxyRendererV1 _generateColorCubes](self, "_generateColorCubes");
          if (!v28)
            goto LABEL_50;
        }
      }
    }
    FigDebugAssert3();
  }
  else
  {
LABEL_44:

    v28 = 0;
  }
LABEL_50:

  return v28;
}

- (int)_updateStatsBuffer
{
  uint64_t v2;
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = -[CMISmartStyleProxyRendererV1 _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 360, 0, CFSTR("SSR_BUF_NEW_GLOBAL_STATS"));
  v12 = v4;
  if (v4)
  {
    v5 = objc_retainAutorelease(v4);
    SSRPopulateStatsWithDictionary(objc_msgSend(v5, "contents"), self->_currentStatsForCubes);
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blitCommandEncoder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v5, 0, self->_statsBuf, 10240, objc_msgSend(v5, "length"));
      v8 = 0;
    }
    else
    {
      v11 = v2;
      LODWORD(v10) = 0;
      FigDebugAssert3();
      v8 = FigSignalErrorAt();
    }
  }
  else
  {
    v11 = v2;
    LODWORD(v10) = 0;
    FigDebugAssert3();
    v8 = FigSignalErrorAt();
    v7 = 0;
  }
  objc_msgSend(v7, "endEncoding", v10, v11);
  FigMetalDecRef(&v12);

  return v8;
}

- (int)_populateStaticRenderParametersFromTuning:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MTLBuffer contents](self->_paramsBuf, "contents");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_inputStyles;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[CMISmartStyleProxyRendererV1 _populateStaticRenderParameters:forInputStyle:fromTuning:](self, "_populateStaticRenderParameters:forInputStyle:fromTuning:", v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v4, (_QWORD)v14);
        v5 += 664;
      }
      v12 = v11;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int)_populateStaticRenderParameters:(id *)a3 forInputStyle:(id)a4 fromTuning:(id)a5
{
  id v8;
  id v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  int v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  float *p_var62;
  float *p_var63;
  float *p_var64;
  float v30;
  int v36;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "castType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "castIntensity");
  v12 = v11;
  objc_msgSend(v9, "toneBias");
  v14 = v13;
  objc_msgSend(v9, "colorBias");
  v16 = v15;

  v17 = isSystemStyleCastType(v10);
  v18 = self->_tuningParameterVariant;
  if ((isValidTuningType(v18) & 1) != 0)
  {
    objc_msgSend(v8, "castAdjustmentsTuning");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_19;
    objc_msgSend(v20, "getValue:size:", &a3->var9, 132);
    objc_msgSend(v8, "toneAdjustmentsTuning");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22
      || (objc_msgSend(v22, "getValue:size:", &a3->var10, 264),
          objc_msgSend(v8, "colorAdjustmentsTuning"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "objectForKeyedSubscript:", v10),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v22,
          v23,
          !v24))
    {
LABEL_19:
      FigDebugAssert3();
      v36 = -12780;
      goto LABEL_17;
    }
    objc_msgSend(v24, "getValue:size:", &a3->var11, 16);
    v25 = SSRSceneTypeEnumFromSemanticStyleSceneType(self->_currentSceneTypeForCubes);
    v26 = v25;
    if (v25 == 21)
    {
      p_var62 = &a3->var10.var62;
      p_var63 = &a3->var10.var63;
      p_var64 = &a3->var10.var64;
    }
    else
    {
      if (v25 != 3)
      {
LABEL_10:
        a3->var0 = SSRCastTypeEnumFromString(v10);
        a3->var1 = v12;
        a3->var2 = v14;
        a3->var3 = v16;
        a3->var17 = SSRTuningTypeEnumFromString(v18);
        if (v12 >= 0.5)
          v30 = (float)(v12 * 1.5) + -0.5;
        else
          v30 = v12 * 0.5;
        if (!v17)
          v30 = v12;
        a3->var4 = v12;
        a3->var5 = v30;
        __asm { FMOV            V0.2S, #1.0 }
        *(_QWORD *)&a3->var6 = _D0;
        a3->var8 = v26;
        a3->var16 = self->_currentBrightnessValueForCubes;
        -[CMISmartStyleProxyRendererV1 _updateHazeTuningAdjustments:](self, "_updateHazeTuningAdjustments:", a3);

        goto LABEL_16;
      }
      p_var62 = &a3->var10.var59;
      p_var63 = &a3->var10.var60;
      p_var64 = &a3->var10.var61;
    }
    v16 = v16 * *p_var63;
    v14 = v14 * *p_var62;
    v12 = v12 * *p_var64;
    goto LABEL_10;
  }
  FigDebugAssert3();
LABEL_16:
  v36 = 0;
LABEL_17:

  return v36;
}

- (int)_calculateDynamicRenderParameters
{
  NSUInteger v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MTLComputePipelineState *v8;
  int v9;
  NSUInteger v11;
  int64x2_t v12;
  __int128 v13;
  uint64_t v14;

  v3 = -[NSArray count](self->_inputStyles, "count");
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "computeCommandEncoder"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = self->_renderingParamsFromStatsPipelineState;
    objc_msgSend(v7, "setComputePipelineState:", v8);
    objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_paramsBuf, 0, 1);
    objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_statsBuf, 0, 3);
    v14 = 1;
    v11 = v3;
    v12 = vdupq_n_s64(1uLL);
    v13 = xmmword_1D3305540;
    objc_msgSend(v7, "dispatchThreadgroups:threadsPerThreadgroup:", &v13, &v11);
    objc_msgSend(v7, "endEncoding");
    -[FigMetalContext commit](self->_metalContext, "commit");

    v9 = 0;
  }
  else
  {
    FigDebugAssert3();
    v9 = FigSignalErrorAt();
  }

  return v9;
}

- (int)_generateColorCubes
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  MTLComputePipelineState *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t colorCubeDimension;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  MTLComputePipelineState *v26;
  int v27;
  void *v29;
  void *v30;
  MTLComputePipelineState *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  BOOL v34;

  -[NSDictionary objectForKeyedSubscript:](self->_hueSatLumLUTTexByCastTypeForVariant, "objectForKeyedSubscript:", self->_tuningParameterVariant);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_hueSatLumLUTTexByCastTypeForVariant, "objectForKeyedSubscript:", CFSTR("DefaultParameters"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v5;

  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "computeCommandEncoder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v29 = v7;
      v34 = self->_currentStatsForCubes == 0;
      objc_msgSend(v8, "setBytes:length:atIndex:", &v34, 1, 10);
      if (-[NSArray count](self->_inputStyles, "count"))
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        while (1)
        {
          -[NSArray objectAtIndexedSubscript:](self->_inputStyles, "objectAtIndexedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          colorCubeCacheHashForStyle(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_colorCubeCache, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
            break;
          v16 = v15;
          if (objc_msgSend(v15, "needsUpdate"))
          {
            v31 = v12;
            objc_msgSend(v13, "castType");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setTexture:atIndex:", self->_cubicSplineToneCurveTexture, 21);
            objc_msgSend(v30, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setTexture:atIndex:", v18, 22);

            objc_msgSend(v16, "backgroundCube");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setTexture:atIndex:", v19, 19);

            objc_msgSend(v16, "foregroundCube");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setTexture:atIndex:", v20, 20);

            objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_paramsBuf, 664 * v10, 1);
            objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_statsBuf, 0, 3);
            colorCubeDimension = self->_colorCubeDimension;
            v22 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_generateColorCubesPipelineState, "maxTotalThreadsPerThreadgroup");
            v23 = colorCubeDimension;
            do
            {
              v24 = v23;
              v25 = v23 * v23 * v23;
              v23 >>= 1;
            }
            while (v25 > v22);
            v26 = self->_generateColorCubesPipelineState;

            objc_msgSend(v9, "setComputePipelineState:", v26);
            v33[0] = colorCubeDimension;
            v33[1] = colorCubeDimension;
            v33[2] = colorCubeDimension;
            v32[0] = v24;
            v32[1] = v24;
            v32[2] = v24;
            objc_msgSend(v9, "dispatchThreads:threadsPerThreadgroup:", v33, v32);
            objc_msgSend(v16, "setNeedsUpdate:", 0);

            v12 = v26;
          }

          v10 = ++v11;
          if (-[NSArray count](self->_inputStyles, "count") <= v11)
            goto LABEL_16;
        }
        FigDebugAssert3();

      }
      else
      {
        v12 = 0;
LABEL_16:
        objc_msgSend(v9, "endEncoding");
        -[FigMetalContext commit](self->_metalContext, "commit");
      }
      v27 = 0;
      v7 = v29;
    }
    else
    {
      FigDebugAssert3();
      v27 = FigSignalErrorAt();
      v12 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v27 = FigSignalErrorAt();
    v12 = 0;
    v9 = 0;
  }

  return v27;
}

- (int)_renderWithColorCubes
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int32x2_t v10;
  uint64_t v11;
  MTLComputePipelineState *v12;
  unint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  MTLComputePipelineState *v22;
  _QWORD *v23;
  int64x2_t *v24;
  int v26;
  void *v28;
  int64x2_t v29;
  int32x2_t v30;
  int v31;
  uint64_t v32;
  int64x2_t v33;
  uint64_t v34;
  _QWORD v35[3];
  int64x2_t v36;
  uint64_t v37;
  _QWORD v38[3];
  int32x2_t v39;
  __int128 v40;
  __int128 v41;

  -[FigMetalContext device](self->_metalContext, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v3, "supportsFamily:", 1004);

  v4 = -[NSArray count](self->_inputStyles, "count");
  v32 = -[MTLTexture width](self->_outputImageTexture, "width");
  v5 = -[MTLTexture height](self->_outputImageTexture, "height");
  v40 = xmmword_1D3307470;
  v41 = xmmword_1D3307470;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "computeCommandEncoder"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
    v28 = v7;
    objc_msgSend(v8, "setTexture:atIndex:", self->_inputImageTexture, 0);
    objc_msgSend(v9, "setTexture:atIndex:", self->_inputMaskTexture, 10);
    objc_msgSend(v9, "setTexture:atIndex:", self->_outputImageTexture, 13);
    objc_msgSend(v9, "setBytes:length:atIndex:", &self->_colorManagement, 256, 0);
    objc_msgSend(v9, "setBytes:length:atIndex:", &self->_foregroundRatio, 4, 13);
    objc_msgSend(v9, "setBytes:length:atIndex:", &v41, 16, 14);
    objc_msgSend(v9, "setBytes:length:atIndex:", &v40, 16, 15);
    if (v4)
    {
      v11 = 0;
      v12 = 0;
      v13 = v5 / v4;
      v10.i16[0] = v32;
      v10.i16[1] = v5 / v4;
      v30 = v10;
      v29 = vdupq_n_s64(0x20uLL);
      v14 = 1;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_inputStyles, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        colorCubeCacheHashForStyle(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_colorCubeCache, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          break;
        v18 = v17;
        objc_msgSend(v17, "backgroundCube");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTexture:atIndex:", v19, 19);

        objc_msgSend(v18, "foregroundCube");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTexture:atIndex:", v20, 20);

        LOWORD(v21) = 0;
        HIWORD(v21) = v11 * v13;
        v39 = vzip1_s32((int32x2_t)v21, v30);
        objc_msgSend(v9, "setBytes:length:atIndex:", &v39, 8, 16);
        if (v31)
        {
          v22 = self->_renderWithColorCubesPipelineState[1];

          objc_msgSend(v9, "setComputePipelineState:", v22);
          objc_msgSend(v9, "setImageblockWidth:height:", 32, 32);
          v38[0] = v32;
          v38[1] = v13;
          v38[2] = 1;
          v36 = v29;
          v37 = 1;
          v23 = v38;
          v24 = &v36;
        }
        else
        {
          v22 = self->_renderWithColorCubesPipelineState[0];

          objc_msgSend(v9, "setComputePipelineState:", v22);
          v35[0] = v32;
          v35[1] = v13;
          v35[2] = 1;
          v33 = vdupq_n_s64(0x20uLL);
          v34 = 1;
          v23 = v35;
          v24 = &v33;
        }
        objc_msgSend(v9, "dispatchThreads:threadsPerThreadgroup:", v23, v24);
        v12 = v22;

        v11 = v14;
        if (v4 <= v14++)
          goto LABEL_12;
      }

    }
    else
    {
      v12 = 0;
LABEL_12:
      objc_msgSend(v9, "endEncoding");
      -[FigMetalContext commit](self->_metalContext, "commit");
    }

    v26 = 0;
    v7 = v28;
  }
  else
  {
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
  }

  return v26;
}

- (int)_renderWithColorPriors
{
  void *v3;
  NSUInteger v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int32x2_t v10;
  uint64_t v11;
  MTLComputePipelineState *v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int32x4_t v30;
  int32x4_t v31;
  __int128 v32;
  __int128 v33;
  _QWORD *v34;
  int64x2_t *v35;
  int v37;
  void *v39;
  int64x2_t v40;
  unint64_t v41;
  int32x2_t v42;
  int v43;
  uint64_t v44;
  int32x4_t v45;
  int32x4_t v46;
  __int128 v47;
  MTLComputePipelineState *v48;
  int64x2_t v49;
  uint64_t v50;
  _QWORD v51[3];
  int64x2_t v52;
  uint64_t v53;
  _QWORD v54[3];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  int32x2_t v59;
  __int128 v60;

  -[FigMetalContext device](self->_metalContext, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v3, "supportsFamily:", 1004);

  v4 = -[NSArray count](self->_inputStyles, "count");
  v44 = -[MTLTexture width](self->_outputImageTexture, "width");
  v5 = -[MTLTexture height](self->_outputImageTexture, "height");
  v60 = xmmword_1D3307470;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "computeCommandEncoder"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
    v39 = v7;
    objc_msgSend(v8, "setTexture:atIndex:", self->_inputImageTexture, 0);
    objc_msgSend(v9, "setTexture:atIndex:", self->_outputImageTexture, 13);
    objc_msgSend(v9, "setBytes:length:atIndex:", &v60, 16, 0);
    if (v4)
    {
      v11 = 0;
      v12 = 0;
      v13 = v5 / v4;
      v10.i16[0] = v44;
      v10.i16[1] = v5 / v4;
      v42 = v10;
      v40 = vdupq_n_s64(0x20uLL);
      v14 = 1;
      v41 = v4;
      do
      {
        v48 = v12;
        LOWORD(v15) = 0;
        HIWORD(v15) = v11 * v13;
        v59 = vzip1_s32((int32x2_t)v15, v42);
        objc_msgSend(v9, "setBytes:length:atIndex:", &v59, 8, 1);
        -[NSArray objectAtIndexedSubscript:](self->_inputStyles, "objectAtIndexedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "castType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_inputStyles, "objectAtIndexedSubscript:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "toneBias");
        v20 = v19;
        -[NSArray objectAtIndexedSubscript:](self->_inputStyles, "objectAtIndexedSubscript:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "colorBias");
        v23 = v22;
        -[NSArray objectAtIndexedSubscript:](self->_inputStyles, "objectAtIndexedSubscript:", v11);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "castIntensity");
        LODWORD(v26) = v25;
        LODWORD(v27) = 1.0;
        LODWORD(v28) = v20;
        LODWORD(v29) = v23;
        +[CMISmartStyleCCMPriorGenerator calculatePriorCCMforCast:tone:color:intensity:priorStrength:](CMISmartStyleCCMPriorGenerator, "calculatePriorCCMforCast:tone:color:intensity:priorStrength:", v17, v28, v29, v26, v27);
        v45 = v30;
        v46 = v31;
        v47 = v32;

        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        DWORD2(v56) = DWORD1(v47);
        DWORD2(v55) = v47;
        *(_QWORD *)&v55 = vzip1q_s32(v45, v46).u64[0];
        *(_QWORD *)&v56 = vtrn2q_s32(v45, v46).u64[0];
        DWORD2(v58) = HIDWORD(v47);
        DWORD2(v57) = DWORD2(v47);
        *(_QWORD *)&v57 = vzip1q_s32(vdupq_laneq_s32(v45, 2), vdupq_laneq_s32(v46, 2)).u64[0];
        *(_QWORD *)&v58 = vuzp2q_s32(vuzp2q_s32(v45, v46), v45).u64[0];
        v33 = v55;
        v55 = v56;
        v56 = v57;
        v57 = v58;
        v58 = v33;
        objc_msgSend(v9, "setBytes:length:atIndex:", &v55, 64, 2);
        if (v43)
        {
          v12 = self->_renderWithColorPriorsPipelineState[1];

          objc_msgSend(v9, "setComputePipelineState:", v12);
          objc_msgSend(v9, "setImageblockWidth:height:", 32, 32);
          v54[0] = v44;
          v54[1] = v13;
          v54[2] = 1;
          v52 = v40;
          v53 = 1;
          v34 = v54;
          v35 = &v52;
        }
        else
        {
          v12 = self->_renderWithColorPriorsPipelineState[0];

          objc_msgSend(v9, "setComputePipelineState:", v12);
          v51[0] = v44;
          v51[1] = v13;
          v51[2] = 1;
          v49 = vdupq_n_s64(0x20uLL);
          v50 = 1;
          v34 = v51;
          v35 = &v49;
        }
        objc_msgSend(v9, "dispatchThreads:threadsPerThreadgroup:", v34, v35);
        v11 = v14;
      }
      while (v41 > v14++);
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v9, "endEncoding");
    -[FigMetalContext commit](self->_metalContext, "commit");

    v37 = 0;
    v7 = v39;
  }
  else
  {
    FigDebugAssert3();
    v37 = FigSignalErrorAt();
  }

  return v37;
}

- (int)_allocateParamsAndStatsBuffers
{
  MTLBuffer *v3;
  MTLBuffer *paramsBuf;
  MTLBuffer *v5;
  MTLBuffer *statsBuf;

  FigMetalDecRef((id *)&self->_paramsBuf);
  v3 = -[CMISmartStyleProxyRendererV1 _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 664 * self->_maxInputStylesCount, 0, CFSTR("SSR_BUF_DYNAMIC_PARAMS"));
  paramsBuf = self->_paramsBuf;
  self->_paramsBuf = v3;

  if (self->_paramsBuf)
  {
    FigMetalDecRef((id *)&self->_statsBuf);
    v5 = -[CMISmartStyleProxyRendererV1 _newBufferWithLength:options:label:](self, "_newBufferWithLength:options:label:", 10636, 0, CFSTR("SSR_BUF_STATS"));
    statsBuf = self->_statsBuf;
    self->_statsBuf = v5;

    if (self->_statsBuf)
      return 0;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_bindPixelBufferToTexture:(__CVBuffer *)a3 usage:(unint64_t)a4 overrideMTLPixelFormatWithFormat:(unint64_t)a5 planeIndex:(int)a6 texturePtr:(id *)a7
{
  MTLPixelFormat MTLPixelFormatForCVPixelBuffer;
  const __CFAllocator *v13;
  __CVMetalTextureCache *textureCache;
  void *v15;
  const __CFDictionary *v16;
  size_t Width;
  size_t Height;
  CVReturn v19;
  void *v20;
  id v21;
  int v22;
  __int16 v24;
  CVMetalTextureRef image;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  image = 0;
  v24 = 257;
  if (a5)
  {
    MTLPixelFormatForCVPixelBuffer = a5;
    v24 = 0;
  }
  else
  {
    MTLPixelFormatForCVPixelBuffer = getMTLPixelFormatForCVPixelBuffer(a3, (char *)&v24 + 1, &v24);
    if (MTLPixelFormatForCVPixelBuffer == MTLPixelFormatInvalid)
      goto LABEL_10;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  textureCache = self->_textureCache;
  v26 = *MEMORY[0x1E0CA8F58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v16 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v19 = CVMetalTextureCacheCreateTextureFromImage(v13, textureCache, a3, v16, MTLPixelFormatForCVPixelBuffer, Width, Height, a6, &image);

  if (!v19)
  {
    CVMetalTextureGetTexture(image);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *a7;
    *a7 = v20;

    if (*a7)
    {
      SSRAttachColorManagementMetadata(*a7, a3, HIBYTE(v24), v24);
      v22 = 0;
      goto LABEL_7;
    }
  }
LABEL_10:
  FigDebugAssert3();
  v22 = FigSignalErrorAt();
LABEL_7:
  if (image)
    CFRelease(image);
  return v22;
}

- (int)_compileMetalShadersForProcessingType:(int)a3
{
  char v3;
  void *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *renderingParamsFromStatsPipelineState;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *generateColorCubesPipelineState;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *v17;
  int v18;
  char v20;

  v3 = a3;
  v20 = 0;
  v5 = (void *)objc_opt_new();
  if ((v3 & 1) != 0)
  {
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("RenderingParamsFromStats"), 0);
    v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    renderingParamsFromStatsPipelineState = self->_renderingParamsFromStatsPipelineState;
    self->_renderingParamsFromStatsPipelineState = v6;

    if (!self->_renderingParamsFromStatsPipelineState)
      goto LABEL_11;
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("generateColorCubes"), 0);
    v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    generateColorCubesPipelineState = self->_generateColorCubesPipelineState;
    self->_generateColorCubesPipelineState = v8;

    if (!self->_generateColorCubesPipelineState)
      goto LABEL_11;
    v20 = 0;
    objc_msgSend(v5, "setConstantValue:type:atIndex:", &v20, 53, 0);
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("renderWithColorCubes"), v5);
    v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v11 = self->_renderWithColorCubesPipelineState[0];
    self->_renderWithColorCubesPipelineState[0] = v10;

    if (!self->_renderWithColorCubesPipelineState[0])
      goto LABEL_11;
    v20 = 1;
    objc_msgSend(v5, "setConstantValue:type:atIndex:", &v20, 53, 0);
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("renderWithColorCubes"), v5);
    v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v13 = self->_renderWithColorCubesPipelineState[1];
    self->_renderWithColorCubesPipelineState[1] = v12;

    if (!self->_renderWithColorCubesPipelineState[1])
      goto LABEL_11;
  }
  if ((v3 & 2) == 0)
    goto LABEL_9;
  v20 = 0;
  objc_msgSend(v5, "setConstantValue:type:atIndex:", &v20, 53, 0);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("renderWithColorPriors"), v5);
  v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v15 = self->_renderWithColorPriorsPipelineState[0];
  self->_renderWithColorPriorsPipelineState[0] = v14;

  if (!self->_renderWithColorPriorsPipelineState[0])
    goto LABEL_11;
  v20 = 1;
  objc_msgSend(v5, "setConstantValue:type:atIndex:", &v20, 53, 0);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("renderWithColorPriors"), v5);
  v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v17 = self->_renderWithColorPriorsPipelineState[1];
  self->_renderWithColorPriorsPipelineState[1] = v16;

  if (self->_renderWithColorPriorsPipelineState[1])
  {
LABEL_9:
    v18 = 0;
  }
  else
  {
LABEL_11:
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 1;
  }

  return v18;
}

- (void)_updateColorManagementForInputs
{
  _BYTE v3[60];

  -[CMISmartStyleProxyRendererV1 _configureColorConversion:forTexture:isOutput:](self, "_configureColorConversion:forTexture:isOutput:", &self->_colorManagement, self->_inputImageTexture, 0);
  *(_OWORD *)&v3[12] = *MEMORY[0x1E0C83FE8];
  *(_OWORD *)&v3[28] = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  *(_OWORD *)&v3[44] = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
  *(_DWORD *)&self->_anon_80[112] = 3;
  *(_OWORD *)&self->_anon_80[160] = *(_OWORD *)&v3[44];
  *(_OWORD *)&self->_anon_80[116] = *(_OWORD *)v3;
  *(_OWORD *)&self->_anon_80[132] = *(_OWORD *)&v3[16];
  *(_OWORD *)&self->_anon_80[148] = *(_OWORD *)&v3[32];
  -[CMISmartStyleProxyRendererV1 _configureColorConversion:forTexture:isOutput:](self, "_configureColorConversion:forTexture:isOutput:", &self->_anon_80[176], self->_outputImageTexture, 1);
}

- (void)_configureColorConversion:(id *)a3 forTexture:(id)a4 isOutput:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  __int128 v10;
  int v11;
  int v12;
  double v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  id v19;

  v5 = a5;
  SSRGetColorManagementMetadata(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v19 = v7;
    if ((objc_msgSend(v7, "cscTransferFunctionEnabled") & 1) != 0)
      LODWORD(v8) = 1;
    else
      v8 = (unint64_t)objc_msgSend(v19, "colorSpace") >> 32;
    a3->var0 = v8;
    v11 = objc_msgSend(v19, "colorSpace");
    v12 = v11;
    if (v5)
      v12 = 1;
    else
      v11 = 1;
    v13 = CMIGetColorConversionMatrix(v11, v12);
    a3[6].var0 = v14;
    a3[10].var0 = v15;
    *(double *)&a3[4].var0 = v13;
    *(_QWORD *)&a3[8].var0 = v16;
    a3[14].var0 = v17;
    *(_QWORD *)&a3[12].var0 = v18;
    v7 = v19;
  }
  else
  {
    a3->var0 = 0;
    v9 = MEMORY[0x1E0C83FE8];
    v10 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    *(_OWORD *)&a3[4].var0 = *MEMORY[0x1E0C83FE8];
    *(_OWORD *)&a3[8].var0 = v10;
    *(_OWORD *)&a3[12].var0 = *(_OWORD *)(v9 + 32);
  }

}

- (void)_updateHazeTuningAdjustments:(id *)a3
{
  float var2;
  float v4;

  if (a3)
  {
    var2 = a3->var2;
    a3->var12.var0 = 0;
    if (var2 > 0.0)
    {
      a3->var12.var1 = var2 * -0.5;
      v4 = var2 * 0.5;
      a3->var12.var4 = v4;
      a3->var12.var5 = v4;
      *(_QWORD *)&a3->var12.var2 = 0x4130000041400000;
      *(_QWORD *)&a3->var12.var6 = 0x3DCCCCCD3F19999ALL;
      a3->var12.var8 = 0.0;
      a3->var12.var0 = 1;
    }
  }
  else
  {
    FigDebugAssert3();
  }
}

- (int)_calculateCubicSplineToneCurve
{
  uint64_t v3;
  double v4;
  double *v5;
  double v6;
  float v7;
  uint64_t *v8;
  float v9;
  double v10;
  uint64_t v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  uint64_t v17;
  double *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  double v25;
  double *v26;
  uint64_t i;
  float v28;
  double v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float *v34;
  uint64_t v35;
  float v36;
  double v37;
  double *v38;
  unint64_t v39;
  double *v41;
  double v42;
  float v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  MTLTexture *v49;
  MTLTexture *cubicSplineToneCurveTexture;
  MTLTexture *v51;
  int v52;
  uint64_t v54;
  _QWORD v55[3];
  __int128 v56;
  uint64_t v57;
  int v58;
  __int128 v59;
  __int128 v60;
  int v61;
  int v62;
  __int128 v63;
  __int128 v64;
  int v65;
  _OWORD v66[2];
  uint64_t v67;
  _OWORD v68[2];
  uint64_t v69;
  _OWORD v70[2];
  uint64_t v71;
  _OWORD v72[2];
  uint64_t v73;
  _OWORD v74[2];
  uint64_t v75;
  uint64_t v76;

  v3 = 0;
  v76 = *MEMORY[0x1E0C80C00];
  v75 = 0;
  memset(v74, 0, sizeof(v74));
  v73 = 0;
  memset(v72, 0, sizeof(v72));
  v71 = 0;
  memset(v70, 0, sizeof(v70));
  v69 = 0;
  memset(v68, 0, sizeof(v68));
  memset(v66, 0, sizeof(v66));
  v64 = 0u;
  v63 = 0u;
  v60 = 0u;
  v59 = 0u;
  v4 = 0.0;
  v67 = 0;
  v5 = (double *)&qword_1D33074A0;
  v65 = 0;
  do
  {
    v6 = *v5;
    v5 += 2;
    v7 = v6 - v4;
    *(float *)((char *)v68 + v3) = v7;
    v3 += 4;
    v4 = v6;
  }
  while (v3 != 36);
  v8 = &qword_1D33074B8;
  v9 = *(float *)v68;
  v10 = 0.042;
  v11 = 4;
  v12 = *(float *)v68;
  do
  {
    v13 = *(float *)((char *)v68 + v11);
    v14 = *(double *)v8;
    v15 = (float)(3.0 / v13) * (*(double *)v8 - v10) - (v10 - *((double *)v8 - 4)) * (float)(3.0 / v12);
    *(float *)((char *)v66 + v11) = v15;
    v11 += 4;
    v8 += 2;
    v12 = v13;
    v10 = v14;
  }
  while (v11 != 36);
  v62 = 0;
  v58 = 0;
  v16 = 0.0;
  v17 = 4;
  v18 = (double *)&qword_1D33074B0;
  v19 = 0.0;
  do
  {
    v20 = *v18 - *(v18 - 4) + *v18 - *(v18 - 4);
    v21 = v20 - (float)(v9 * v19);
    v22 = *(float *)((char *)v66 + v17) - (float)(v9 * v16);
    v23 = *(float *)((char *)v68 + v17);
    v19 = v23 / v21;
    *(float *)((char *)&v62 + v17) = v23 / v21;
    v16 = v22 / v21;
    *(float *)((char *)&v58 + v17) = v22 / v21;
    v17 += 4;
    v18 += 2;
    v9 = v23;
  }
  while (v17 != 36);
  v61 = 0;
  v24 = 0.0;
  v25 = 1.0;
  v26 = (double *)&qword_1D3307518;
  for (i = 32; i != -4; i -= 4)
  {
    v28 = *(float *)((char *)&v58 + i) - (float)(*(float *)((char *)&v62 + i) * v24);
    *(float *)((char *)v72 + i) = v28;
    v29 = *v26;
    v26 -= 2;
    v30 = v25 - v29;
    v31 = v24 + v28 * 2.0;
    v32 = *(float *)((char *)v68 + i);
    v33 = (float)(v30 / v32) + (float)(v32 * v31) / -3.0;
    *(float *)((char *)v74 + i) = v33;
    *(float *)((char *)v70 + i) = (float)(v24 - v28) / (float)(v32 * 3.0);
    v25 = v29;
    v24 = v28;
  }
  HIDWORD(v73) = 0;
  v34 = (float *)malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
  if (!v34)
    goto LABEL_19;
  v35 = 0;
  v36 = 0.0;
  do
  {
    v37 = v36;
    v38 = (double *)&qword_1D3307520;
    v39 = 9;
    while (*v38 > v37)
    {
      v38 -= 2;
      if (v39-- <= 1)
      {
        LODWORD(v39) = 0;
        break;
      }
    }
    v41 = (double *)((char *)&unk_1D3307490 + 16 * (int)v39);
    v42 = v41[1];
    v43 = v37 - *v41;
    v44 = 4 * (int)v39;
    v45 = *(float *)((char *)v74 + v44);
    v46 = *(float *)((char *)v72 + v44);
    v47 = *(float *)((char *)v70 + v44);
    v48 = v42 + (float)(v45 * v43) + v46 * (v43 * v43) + v47 * pow(v43, 3.0);
    v34[v35++] = v48;
    v36 = v36 + 0.0039062;
  }
  while (v36 < 1.0);
  LOBYTE(v54) = 0;
  v49 = -[CMISmartStyleProxyRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 55, 256, 1, 7, CFSTR("SmartStyleMetalRender_CubicSPlineCurveTexture"), 1, v54);
  cubicSplineToneCurveTexture = self->_cubicSplineToneCurveTexture;
  self->_cubicSplineToneCurveTexture = v49;

  v51 = self->_cubicSplineToneCurveTexture;
  if (v51)
  {
    memset(v55, 0, sizeof(v55));
    v56 = xmmword_1D3305330;
    v57 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](v51, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v55, 0, v34, 1024);
    v52 = 0;
  }
  else
  {
LABEL_19:
    FigDebugAssert3();
    v52 = FigSignalErrorAt();
  }
  free(v34);
  return v52;
}

- (id)_calculateHueSatLumLUTTexForAllCastTypesAndVariants
{
  unint64_t v3;
  void *v4;
  id v5;
  MTLComputePipelineState *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  MTLComputePipelineState *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id obj;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  MTLComputePipelineState *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  CMISmartStyleProxyRendererV1 *v58;
  _QWORD v59[3];
  __int128 v60;
  uint64_t v61;
  _OWORD v62[4];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _QWORD v80[18];

  v80[15] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v80[0] = CFSTR("Standard");
  v80[1] = CFSTR("NoFilter");
  v80[2] = CFSTR("WarmAuthentic");
  v80[3] = CFSTR("StarkBW");
  v80[4] = CFSTR("Colorful");
  v80[5] = CFSTR("DreamyHues");
  v80[6] = CFSTR("UrbanCool");
  v80[7] = CFSTR("Earthy");
  v80[8] = CFSTR("CloudCover");
  v80[9] = CFSTR("TanWarm");
  v80[10] = CFSTR("BlushWarm");
  v80[11] = CFSTR("GoldWarm");
  v80[12] = CFSTR("Neutral");
  v80[13] = CFSTR("Cool");
  v80[14] = CFSTR("LongGray");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[SmartStyleRendererPlist tuningVariants](self->_internalTuningParams, "tuningVariants");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v40)
  {
    v58 = self;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v41 = *(_QWORD *)v74;
    v42 = v4;
    while (1)
    {
      v56 = v10;
      v11 = 0;
      do
      {
        if (*(_QWORD *)v74 != v41)
          objc_enumerationMutation(obj);
        v44 = v11;
        v12 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v11);
        -[SmartStyleRendererPlist tuningVariants](v58->_internalTuningParams, "tuningVariants");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v12;
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v3 + 3592), "dictionary");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v47 = v4;
        v51 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        if (!v51)
          goto LABEL_25;
        v48 = *(_QWORD *)v70;
        while (2)
        {
          v14 = 0;
          v15 = v6;
          v16 = v8;
          do
          {
            v53 = v15;
            if (*(_QWORD *)v70 != v48)
              objc_enumerationMutation(v47);
            v52 = v14;
            v17 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v14);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SmartStyleMetalRenderer_hueSatLumLUTATexture_%@"), v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v38) = 0;
            v19 = -[CMISmartStyleProxyRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](v58, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 125, 360, 4, 7, v18, (objc_msgSend(v5, "count") & 1) == 0, v38);

            v57 = (void *)v19;
            if (!v19)
            {
              FigDebugAssert3();
              FigSignalErrorAt();
              goto LABEL_31;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SmartStyleMetalRender_hueSatLumLUTBTexure_%@"), v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v39) = 0;
            v21 = -[CMISmartStyleProxyRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](v58, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 125, 360, 4, 7, v20, objc_msgSend(v5, "count") & 1, v39);

            if (!v21)
            {
              FigDebugAssert3();
              FigSignalErrorAt();
              v9 = 0;
LABEL_31:
              v23 = v5;
              v55 = v16;
LABEL_33:
              v4 = v42;
              v6 = v53;
              goto LABEL_37;
            }
            objc_msgSend(v50, "selectiveColorTuning");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v17);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
            {
              FigDebugAssert3();
              v55 = v16;
              v9 = v21;
              goto LABEL_33;
            }
            v24 = v57;
            v9 = v21;
            v68 = v9;
            -[FigMetalContext commandBuffer](v58->_metalContext, "commandBuffer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v55 = v25;
            if (!v25)
            {
              FigDebugAssert3();
              v6 = v53;
              goto LABEL_36;
            }
            v6 = v58->_hueSatLumLUTPipelineState;

            objc_msgSend(v25, "computeCommandEncoder");
            v26 = objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              FigDebugAssert3();
              v7 = 0;
LABEL_36:
              FigSignalErrorAt();

              v4 = v42;
LABEL_37:

              v5 = v23;
              v8 = v55;
              v10 = v57;
              goto LABEL_38;
            }
            v54 = v9;
            v7 = (void *)v26;
            v67 = 1;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v66 = 0u;
            v5 = v23;
            v27 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
            v56 = v24;
            v28 = v24;
            if (v27)
            {
              v29 = v27;
              v30 = *(_QWORD *)v64;
              v28 = v56;
              do
              {
                v31 = 0;
                v32 = v28;
                do
                {
                  if (*(_QWORD *)v64 != v30)
                    objc_enumerationMutation(v5);
                  v33 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v31);
                  memset(v62, 0, 60);
                  objc_msgSend(v33, "getValue:", v62);
                  objc_msgSend(v7, "setComputePipelineState:", v6);
                  objc_msgSend(v7, "setTexture:atIndex:", v32, 0);
                  objc_msgSend(v7, "setTexture:atIndex:", v68, 1);
                  objc_msgSend(v7, "setBytes:length:atIndex:", v62, 60, 0);
                  objc_msgSend(v7, "setBytes:length:atIndex:", &v67, 1, 1);
                  v34 = -[MTLComputePipelineState threadExecutionWidth](v6, "threadExecutionWidth");
                  v35 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v6, "maxTotalThreadsPerThreadgroup");
                  v60 = xmmword_1D3305550;
                  v61 = 1;
                  v59[0] = v34;
                  v59[1] = v35 / v34;
                  v59[2] = 1;
                  objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", &v60, v59);
                  v28 = v68;
                  v68 = v32;

                  v67 = 0;
                  ++v31;
                  v32 = v28;
                }
                while (v29 != v31);
                v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
              }
              while (v29);
            }

            objc_msgSend(v7, "endEncoding");
            -[FigMetalContext commit](v58->_metalContext, "commit");
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v28, v17);
            FigMetalDecRef(&v68);

            v14 = v52 + 1;
            v15 = v6;
            v9 = v54;
            v8 = v55;
            v16 = v55;
          }
          while (v52 + 1 != v51);
          v51 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
          if (v51)
            continue;
          break;
        }
LABEL_25:

        objc_msgSend(v46, "setObject:forKeyedSubscript:", v49, v43);
        v11 = v44 + 1;
        v4 = v42;
        v3 = 0x1E0C99000;
      }
      while (v44 + 1 != v40);
      v10 = v56;
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      if (!v40)
        goto LABEL_38;
    }
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
LABEL_38:

  v36 = v46;
  return v36;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);
}

- (NSString)tuningParameterVariant
{
  return self->_tuningParameterVariant;
}

- (void)setTuningParameterVariant:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameterVariant, a3);
}

- (unint64_t)maxInputStylesCount
{
  return self->_maxInputStylesCount;
}

- (void)setMaxInputStylesCount:(unint64_t)a3
{
  self->_maxInputStylesCount = a3;
}

- (float)foregroundRatio
{
  return self->_foregroundRatio;
}

- (void)setForegroundRatio:(float)a3
{
  self->_foregroundRatio = a3;
}

- (NSArray)inputStyles
{
  return self->_inputStyles;
}

- (void)setInputStyles:(id)a3
{
  objc_storeStrong((id *)&self->_inputStyles, a3);
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (NSDictionary)inputMetadata
{
  return self->_inputMetadata;
}

- (void)setInputMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_inputMetadata, a3);
}

- (__CVBuffer)inputMaskPixelBuffer
{
  return self->_inputMaskPixelBuffer;
}

- (NSDictionary)inputImageStatistics
{
  return self->_inputImageStatistics;
}

- (void)setInputImageStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_inputImageStatistics, a3);
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
  objc_storeStrong((id *)&self->_externalMemoryResource, a3);
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_inputImageStatistics, 0);
  objc_storeStrong((id *)&self->_inputStyles, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_hueSatLumLUTTexByCastTypeForVariant, 0);
  objc_storeStrong((id *)&self->_texturesToPurge, 0);
  objc_storeStrong((id *)&self->_currentStatsForCubes, 0);
  objc_storeStrong((id *)&self->_colorCubeCache, 0);
  objc_storeStrong((id *)&self->_colorCubePool, 0);
  objc_storeStrong((id *)&self->_internallyAllocatedTextures, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_renderWithColorPriorsPipelineState[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_renderWithColorCubesPipelineState[j + 1], 0);
  objc_storeStrong((id *)&self->_generateColorCubesPipelineState, 0);
  objc_storeStrong((id *)&self->_renderingParamsFromStatsPipelineState, 0);
  objc_storeStrong((id *)&self->_hueSatLumLUTPipelineState, 0);
  objc_storeStrong((id *)&self->_cubicSplineToneCurveTexture, 0);
  objc_storeStrong((id *)&self->_statsBuf, 0);
  objc_storeStrong((id *)&self->_paramsBuf, 0);
  objc_storeStrong((id *)&self->_inputMetadata, 0);
  objc_storeStrong((id *)&self->_outputImageTexture, 0);
  objc_storeStrong((id *)&self->_inputMaskTexture, 0);
  objc_storeStrong((id *)&self->_inputImageTexture, 0);
  objc_storeStrong((id *)&self->_tuningParameterVariant, 0);
  objc_storeStrong((id *)&self->_internalTuningParams, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
