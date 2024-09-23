@implementation CMISmartStyleMetalRendererV1

- (CMISmartStyleMetalRendererV1)initWithMetalContext:(id)a3
{
  id v5;
  void *v6;
  CMISmartStyleMetalRendererV1 *v7;
  CMISmartStyleMetalRendererV1 *v8;
  id *p_metalContext;
  FigMetalContext *metalContext;
  void *v11;
  FigMetalAllocator *v12;
  void *v13;
  FigMetalAllocator *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  FigMetalAllocator *v20;
  void *v21;
  uint64_t v22;
  FigMetalAllocator *sharedAccessAllocator;
  void *v24;
  void *v25;
  uint64_t v26;
  NSMutableSet *texturesToPurge;
  void *v28;
  void *v29;
  uint64_t v30;
  SmartStyleRendererPlist *internalTuningParams;
  CMISmartStyleMetalRendererV1 *v37;
  objc_super v39;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)CMISmartStyleMetalRendererV1;
  v7 = -[CMISmartStyleMetalRendererV1 init](&v39, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_21;
  p_metalContext = (id *)&v7->_metalContext;
  objc_storeStrong((id *)&v7->_metalContext, a3);
  metalContext = v8->_metalContext;
  if (!metalContext)
    goto LABEL_21;
  -[FigMetalContext allocator](metalContext, "allocator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = [FigMetalAllocator alloc];
    objc_msgSend(*p_metalContext, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FigMetalAllocator initWithDevice:allocatorType:](v12, "initWithDevice:allocatorType:", v13, 2);
    objc_msgSend(*p_metalContext, "setAllocator:", v14);

    objc_msgSend(*p_metalContext, "allocator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_21;
    v16 = (void *)objc_opt_new();
    if (!v16)
      goto LABEL_21;
    v17 = v16;
    objc_msgSend(v16, "setMemSize:", 150994944);
    objc_msgSend(v17, "setWireMemory:", 1);
    objc_msgSend(v17, "setLabel:", CFSTR("FigMetalAllocator_SmartStyleMetalRenderer_"));
    objc_msgSend(*p_metalContext, "allocator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "setupWithDescriptor:", v17);

    if (v19)
    {
      FigDebugAssert3();

      goto LABEL_22;
    }

  }
  v20 = [FigMetalAllocator alloc];
  -[FigMetalContext device](v8->_metalContext, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[FigMetalAllocator initWithDevice:allocatorType:](v20, "initWithDevice:allocatorType:", v21, 2);
  sharedAccessAllocator = v8->_sharedAccessAllocator;
  v8->_sharedAccessAllocator = (FigMetalAllocator *)v22;

  if (!v8->_sharedAccessAllocator || (v24 = (void *)objc_opt_new()) == 0)
  {
LABEL_21:
    FigDebugAssert3();
    goto LABEL_22;
  }
  v25 = v24;
  objc_msgSend(v24, "setMemSize:", 45200);
  objc_msgSend(v25, "setWireMemory:", 1);
  objc_msgSend(v25, "setLabel:", CFSTR("FigMetalAllocator_SmartStyleMetalRenderer_SharedAccess_"));
  if (-[FigMetalAllocator setupWithDescriptor:](v8->_sharedAccessAllocator, "setupWithDescriptor:", v25))
    goto LABEL_20;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = objc_claimAutoreleasedReturnValue();
  texturesToPurge = v8->_texturesToPurge;
  v8->_texturesToPurge = (NSMutableSet *)v26;

  v28 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("RendererTuning"), CFSTR("plist"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryWithContentsOfFile:", v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    cmissv1_RendererTuning();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = objc_opt_new();
  internalTuningParams = v8->_internalTuningParams;
  v8->_internalTuningParams = (SmartStyleRendererPlist *)v30;

  if (-[SmartStyleRendererPlist readPlist:](v8->_internalTuningParams, "readPlist:", v25))
  {
LABEL_20:
    FigDebugAssert3();

LABEL_22:
    v37 = 0;
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v8->_tuningParameterVariant, CFSTR("DefaultParameters"));
  v8->_inputSRLCurveParameter = -1.0;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&v8->_inputLinearBaseGain = _D0;
  v8->_useFaceBasedGlobalExposureBoostRatio = 1;
  v37 = v8;

LABEL_15:
  return v37;
}

- (CMISmartStyle)inputStyle
{
  return (CMISmartStyle *)self->_inputStyle;
}

- (void)setInputStyle:(id)a3
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "smartStyleVersion") == 1)
    objc_storeStrong((id *)&self->_inputStyle, a3);

}

- (void)_checkAndCreateInputStyle
{
  CMISmartStyleV1 *inputStyle;
  CMISmartStyleV1 *v4;
  CMISmartStyleV1 *v5;

  inputStyle = self->_inputStyle;
  if (inputStyle)
    v4 = inputStyle;
  else
    v4 = objc_alloc_init(CMISmartStyleV1);
  v5 = self->_inputStyle;
  self->_inputStyle = v4;

}

- (NSString)castType
{
  -[CMISmartStyleMetalRendererV1 _checkAndCreateInputStyle](self, "_checkAndCreateInputStyle");
  return -[CMISmartStyleV1 castType](self->_inputStyle, "castType");
}

- (void)setCastType:(id)a3
{
  id v4;

  v4 = a3;
  -[CMISmartStyleMetalRendererV1 _checkAndCreateInputStyle](self, "_checkAndCreateInputStyle");
  -[CMISmartStyleV1 setCastType:](self->_inputStyle, "setCastType:", v4);

}

- (float)castIntensity
{
  float result;

  -[CMISmartStyleMetalRendererV1 _checkAndCreateInputStyle](self, "_checkAndCreateInputStyle");
  -[CMISmartStyleV1 castIntensity](self->_inputStyle, "castIntensity");
  return result;
}

- (void)setCastIntensity:(float)a3
{
  double v5;

  -[CMISmartStyleMetalRendererV1 _checkAndCreateInputStyle](self, "_checkAndCreateInputStyle");
  *(float *)&v5 = a3;
  -[CMISmartStyleV1 setCastIntensity:](self->_inputStyle, "setCastIntensity:", v5);
}

- (float)toneBias
{
  float result;

  -[CMISmartStyleMetalRendererV1 _checkAndCreateInputStyle](self, "_checkAndCreateInputStyle");
  -[CMISmartStyleV1 toneBias](self->_inputStyle, "toneBias");
  return result;
}

- (void)setToneBias:(float)a3
{
  double v5;

  -[CMISmartStyleMetalRendererV1 _checkAndCreateInputStyle](self, "_checkAndCreateInputStyle");
  *(float *)&v5 = a3;
  -[CMISmartStyleV1 setToneBias:](self->_inputStyle, "setToneBias:", v5);
}

- (float)colorBias
{
  float result;

  -[CMISmartStyleMetalRendererV1 _checkAndCreateInputStyle](self, "_checkAndCreateInputStyle");
  -[CMISmartStyleV1 colorBias](self->_inputStyle, "colorBias");
  return result;
}

- (void)setColorBias:(float)a3
{
  double v5;

  -[CMISmartStyleMetalRendererV1 _checkAndCreateInputStyle](self, "_checkAndCreateInputStyle");
  *(float *)&v5 = a3;
  -[CMISmartStyleV1 setColorBias:](self->_inputStyle, "setColorBias:", v5);
}

- (NSDictionary)defaultUserBiasByCastType
{
  void *v2;
  void *v3;

  -[SmartStyleRendererPlist defaultTuning](self->_internalTuningParams, "defaultTuning");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultUserBiasByCastType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (float)inputLinearImageGainDownRatio
{
  return -1.0;
}

- (CMISmartStyleMetalRendererV1)initWithOptionalMetalCommandQueue:(id)a3
{
  id v4;
  FigMetalContext *v5;
  void *v6;
  FigMetalContext *v7;
  CMISmartStyleMetalRendererV1 *v8;

  v4 = a3;
  v5 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v5, "initWithbundle:andOptionalCommandQueue:", v6, v4);

  v8 = -[CMISmartStyleMetalRendererV1 initWithMetalContext:](self, "initWithMetalContext:", v7);
  return v8;
}

- (MTLCommandQueue)metalCommandQueue
{
  return -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
}

- (void)setMetalCommandQueue:(id)a3
{
  -[FigMetalContext setCommandQueue:](self->_metalContext, "setCommandQueue:", a3);
}

- (int)prewarm
{
  int v3;
  CMIGuidedFilter *v4;
  void *v5;
  void *v6;
  CMIGuidedFilter *v7;
  CMIGuidedFilter *cmiGuidedFilter;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *hueSatLumLUTPipelineState;
  int v11;

  v3 = -[CMISmartStyleMetalRendererV1 _compileMetalShadersForProcessingType:](self, "_compileMetalShadersForProcessingType:", 3);
  if (v3)
  {
    v11 = v3;
    FigDebugAssert3();
    return v11;
  }
  v4 = [CMIGuidedFilter alloc];
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CMIGuidedFilter initWithOptionalCommandQueue:allocator:](v4, "initWithOptionalCommandQueue:allocator:", v5, v6);
  cmiGuidedFilter = self->_cmiGuidedFilter;
  self->_cmiGuidedFilter = v7;

  if (!self->_cmiGuidedFilter)
  {
    FigDebugAssert3();
    return 1;
  }
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("hueSatLumLUTCalculation"), 0);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  hueSatLumLUTPipelineState = self->_hueSatLumLUTPipelineState;
  self->_hueSatLumLUTPipelineState = v9;

  if (self->_hueSatLumLUTPipelineState)
    return 0;
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)prepareToProcess:(unsigned int)a3
{
  int v4;
  int v5;

  self->_processingType = a3;
  v4 = -[CMISmartStyleMetalRendererV1 _compileMetalShadersForProcessingType:](self, "_compileMetalShadersForProcessingType:");
  if (v4)
  {
    v5 = v4;
    goto LABEL_7;
  }
  if (!self->_useLiveMetalAllocations)
  {
    v5 = -[CMISmartStyleMetalRendererV1 _allocateResources](self, "_allocateResources");
    if (!v5)
      return v5;
LABEL_7:
    FigDebugAssert3();
    return v5;
  }
  return 0;
}

- (int)_allocateResources
{
  int processingType;
  CMIGuidedFilter *v4;
  void *v5;
  void *v6;
  CMIGuidedFilter *v7;
  CMIGuidedFilter *cmiGuidedFilter;
  int v9;

  processingType = self->_processingType;
  if ((processingType & 2) != 0 && !self->_cmiGuidedFilter)
  {
    v4 = [CMIGuidedFilter alloc];
    -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CMIGuidedFilter initWithOptionalCommandQueue:allocator:](v4, "initWithOptionalCommandQueue:allocator:", v5, v6);
    cmiGuidedFilter = self->_cmiGuidedFilter;
    self->_cmiGuidedFilter = v7;

    if (!self->_cmiGuidedFilter)
    {
      FigDebugAssert3();
      return 1;
    }
    processingType = self->_processingType;
  }
  if (processingType < 8)
    return 0;
  v9 = 2;
  FigDebugAssert3();
  return v9;
}

- (int)process
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  __CFString *tuningParameterVariant;
  MTLTexture *inputLightMapTexture;
  MTLTexture *v14;
  int v15;
  int v16;
  int v17;
  void *inputSmallLightMapTexture;
  MTLTexture *inputSmallLinearLightMapTexture;
  MTLTexture *outputSmallLinearLightMapTexture;
  MTLTexture *v21;
  MTLTexture *smallLightMapTexture;
  MTLTexture *v23;
  MTLTexture *smallLinearLightMapTexture;
  int v25;
  int v26;
  int processingType;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  uint64_t v38;
  uint64_t v39;

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
      v39 = v2;
      LODWORD(v38) = 0;
      FigDebugAssert3();
      v17 = 4;
      goto LABEL_67;
    }
  }
  if (self->_useLiveMetalAllocations)
  {
    v7 = -[CMISmartStyleMetalRendererV1 _allocateResources](self, "_allocateResources");
    if (v7)
    {
      v17 = v7;
      v39 = v2;
      LODWORD(v38) = v7;
      goto LABEL_88;
    }
  }
  if (!self->_inputLinearImageTexture && (!self->_inputLinearImageLumaTexture || !self->_inputLinearImageChromaTexture))
  {
    v39 = v2;
    LODWORD(v38) = 0;
    goto LABEL_37;
  }
  if (self->_processingType != 4)
  {
    if (!self->_inputImageTexture)
    {
      v39 = v2;
      LODWORD(v38) = 0;
      goto LABEL_37;
    }
    if (!self->_outputImageTexture)
    {
      v39 = v2;
      LODWORD(v38) = 0;
      goto LABEL_37;
    }
    inputSmallLightMapTexture = self->_inputSmallLightMapTexture;
    inputSmallLinearLightMapTexture = self->_inputSmallLinearLightMapTexture;
    if (inputSmallLightMapTexture)
    {
      if (!inputSmallLinearLightMapTexture)
      {
LABEL_30:
        v39 = v2;
        LODWORD(v38) = 0;
LABEL_66:
        FigDebugAssert3();
        v17 = 0;
        goto LABEL_67;
      }
    }
    else if (inputSmallLinearLightMapTexture)
    {
      goto LABEL_30;
    }
    outputSmallLinearLightMapTexture = self->_outputSmallLinearLightMapTexture;
    if (self->_outputSmallLightMapTexture)
    {
      if (outputSmallLinearLightMapTexture)
      {
        if (inputSmallLightMapTexture)
        {
          v39 = v2;
          LODWORD(v38) = 0;
          goto LABEL_66;
        }
        inputSmallLightMapTexture = self->_inputStatisticsByStatsType;
        goto LABEL_64;
      }
    }
    else if (!outputSmallLinearLightMapTexture)
    {
      if (self->_inputStatisticsByStatsType)
      {
        if (inputSmallLightMapTexture)
          goto LABEL_10;
LABEL_65:
        v39 = v2;
        LODWORD(v38) = 0;
        goto LABEL_66;
      }
LABEL_64:
      if (!inputSmallLightMapTexture)
        goto LABEL_10;
      goto LABEL_65;
    }
    v39 = v2;
    LODWORD(v38) = 0;
    goto LABEL_66;
  }
LABEL_10:
  -[CMISmartStyleMetalRendererV1 _updateColorManagementForInputs](self, "_updateColorManagementForInputs");
  v8 = -[CMISmartStyleMetalRendererV1 _convertLinearYCbCrToRGB:inputChromaTexture:outputRGBTexture:](self, "_convertLinearYCbCrToRGB:inputChromaTexture:outputRGBTexture:", self->_inputLinearImageLumaTexture, self->_inputLinearImageChromaTexture, self->_inputLinearImageTexture);
  if (v8)
  {
    v17 = v8;
    v39 = v2;
    LODWORD(v38) = v8;
    goto LABEL_88;
  }
  if (self->_processingType == 4)
  {
LABEL_45:
    processingType = self->_processingType;
    if ((processingType & 2) != 0)
    {
      v28 = -[CMISmartStyleMetalRendererV1 _updateRenderPipelineConfigForInputs](self, "_updateRenderPipelineConfigForInputs");
      if (v28)
      {
        v17 = v28;
        v39 = v2;
        LODWORD(v38) = v28;
        goto LABEL_88;
      }
      v29 = -[CMISmartStyleMetalRendererV1 _calculateDynamicRenderParameters](self, "_calculateDynamicRenderParameters");
      if (v29)
      {
        v17 = v29;
        v39 = v2;
        LODWORD(v38) = v29;
        goto LABEL_88;
      }
      v30 = -[CMISmartStyleMetalRendererV1 _createGuideImage](self, "_createGuideImage");
      if (v30)
      {
        v17 = v30;
        v39 = v2;
        LODWORD(v38) = v30;
        goto LABEL_88;
      }
      v31 = -[CMISmartStyleMetalRendererV1 _processSegmentationMasks](self, "_processSegmentationMasks");
      if (v31)
      {
        v17 = v31;
        v39 = v2;
        LODWORD(v38) = v31;
        goto LABEL_88;
      }
      v32 = -[CMISmartStyleMetalRendererV1 _processLTMGainMap](self, "_processLTMGainMap");
      if (v32)
      {
        v17 = v32;
        v39 = v2;
        LODWORD(v38) = v32;
        goto LABEL_88;
      }
      v33 = -[CMISmartStyleMetalRendererV1 _upsampleLightMap](self, "_upsampleLightMap");
      if (v33)
      {
        v17 = v33;
        v39 = v2;
        LODWORD(v38) = v33;
        goto LABEL_88;
      }
      v34 = -[CMISmartStyleMetalRendererV1 _applyFinalRendering](self, "_applyFinalRendering");
      if (v34)
      {
        v17 = v34;
        v39 = v2;
        LODWORD(v38) = v34;
        goto LABEL_88;
      }
      processingType = self->_processingType;
    }
    if ((processingType & 4) != 0 && (v35 = -[CMISmartStyleMetalRendererV1 _encodeLinear](self, "_encodeLinear")) != 0)
    {
      v17 = v35;
      v39 = v2;
      LODWORD(v38) = v35;
    }
    else
    {
      v36 = -[CMISmartStyleMetalRendererV1 _releaseIntermediateResources](self, "_releaseIntermediateResources");
      v17 = v36;
      if (!v36)
        goto LABEL_67;
      v39 = v2;
      LODWORD(v38) = v36;
    }
    goto LABEL_88;
  }
  v9 = -[CMISmartStyleMetalRendererV1 _setupStatsAndRenderParamBuffer](self, "_setupStatsAndRenderParamBuffer");
  if (v9)
  {
    v17 = v9;
    v39 = v2;
    LODWORD(v38) = v9;
    goto LABEL_88;
  }
  v10 = -[CMISmartStyleMetalRendererV1 _populateStaticRenderParametersFromTuning:](self, "_populateStaticRenderParametersFromTuning:", v6);
  if (v10)
  {
    v17 = v10;
    v39 = v2;
    LODWORD(v38) = v10;
    goto LABEL_88;
  }
  v11 = self->_processingType;
  tuningParameterVariant = (__CFString *)self->_tuningParameterVariant;
  if ((v11 & 1) != 0)
  {
    if (self->_smallLightMapTexture
      || (LOWORD(v38) = 256,
          v21 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:disableCompression:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:disableCompression:label:retainUntilPurge:useFigMetalAllocator:", 25, 32, 32, 7, 1, CFSTR("SSR_SMALL_LIGHTMAP_TEXTURE"), v38), smallLightMapTexture = self->_smallLightMapTexture, self->_smallLightMapTexture = v21, smallLightMapTexture, self->_smallLightMapTexture))
    {
      if (self->_smallLinearLightMapTexture
        || (LOWORD(v38) = 256,
            v23 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:disableCompression:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:disableCompression:label:retainUntilPurge:useFigMetalAllocator:", 25, 32, 32, 7, 1, CFSTR("SSR_SMALL_LINEAR_LIGHTMAP_TEXTURE"), v38), smallLinearLightMapTexture = self->_smallLinearLightMapTexture, self->_smallLinearLightMapTexture = v23, smallLinearLightMapTexture, self->_smallLinearLightMapTexture))
      {
        v25 = -[CMISmartStyleMetalRendererV1 _runImageReductionAndUpdateBaseGain:](self, "_runImageReductionAndUpdateBaseGain:", tuningParameterVariant == CFSTR("DigitalFlash"));
        if (v25)
        {
          v17 = v25;
          v39 = v2;
          LODWORD(v38) = v25;
          goto LABEL_88;
        }
        v26 = -[CMISmartStyleMetalRendererV1 _calculateHistogramStatsWithImageTexture:linearImageTexture:personMaskTexture:skinMaskTexture:](self, "_calculateHistogramStatsWithImageTexture:linearImageTexture:personMaskTexture:skinMaskTexture:", self->_inputImageTexture, self->_inputLinearImageTexture, self->_inputPersonMaskTexture, self->_inputSkinMaskTexture);
        if (v26)
        {
          v17 = v26;
          v39 = v2;
          LODWORD(v38) = v26;
          goto LABEL_88;
        }
        goto LABEL_45;
      }
      v39 = v2;
      LODWORD(v38) = 0;
    }
    else
    {
      v39 = v2;
      LODWORD(v38) = 0;
    }
LABEL_37:
    FigDebugAssert3();
LABEL_38:
    v17 = FigSignalErrorAt();
    goto LABEL_67;
  }
  if (v11 == 4)
    goto LABEL_45;
  inputLightMapTexture = self->_inputLightMapTexture;
  if (inputLightMapTexture)
    LODWORD(inputLightMapTexture) = self->_inputLinearLightMapTexture != 0;
  v14 = self->_inputSmallLightMapTexture;
  if (v14)
    LODWORD(v14) = self->_inputSmallLinearLightMapTexture != 0;
  if (!self->_inputStatisticsByStatsType || ((inputLightMapTexture | v14) & 1) == 0)
  {
    v39 = v2;
    LODWORD(v38) = 0;
    FigDebugAssert3();
    goto LABEL_38;
  }
  v15 = -[CMISmartStyleMetalRendererV1 _populatePreComputedStats:inputStatisticsByStatsType:](self, "_populatePreComputedStats:inputStatisticsByStatsType:", -[MTLBuffer contents](self->_statsBuf, "contents"), self->_inputStatisticsByStatsType);
  if (v15)
  {
    v17 = v15;
    v39 = v2;
    LODWORD(v38) = v15;
    goto LABEL_88;
  }
  if (tuningParameterVariant != CFSTR("DigitalFlash"))
    goto LABEL_45;
  v16 = -[CMISmartStyleMetalRendererV1 _runImageReductionAndUpdateBaseGain:](self, "_runImageReductionAndUpdateBaseGain:", 1);
  if (!v16)
    goto LABEL_45;
  v17 = v16;
  v39 = v2;
  LODWORD(v38) = v16;
LABEL_88:
  FigDebugAssert3();
LABEL_67:
  -[CMISmartStyleMetalRendererV1 _resetTextureMappedRegions](self, "_resetTextureMappedRegions", v38, v39);
  if (self->_useLiveMetalAllocations)
  {
    FigMetalDecRef((id *)&self->_smallLightMapTexture);
    FigMetalDecRef((id *)&self->_smallLinearLightMapTexture);
    FigMetalDecRef((id *)&self->_guideTexture);
    FigMetalDecRef((id *)&self->_linearGuideTexture);
    FigMetalDecRef((id *)&self->_bgLTMGainMapTexture);
    FigMetalDecRef((id *)&self->_fgLTMGainMapTexture);
    FigMetalDecRef((id *)&self->_inputLightMapTexture);
    FigMetalDecRef((id *)&self->_inputLinearLightMapTexture);
    FigMetalDecRef((id *)&self->_fgbgMatteTexture);
    FigMetalDecRef((id *)&self->_inputLinearImageTexture);
  }

  return v17;
}

- (int)setup
{
  void *v3;
  uint64_t v4;
  int v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *hueSatLumLUTPipelineState;
  NSDictionary *v8;
  NSDictionary *hueSatLumLUTTexByCastTypeForVariant;
  id v10;
  dispatch_queue_t v11;
  MTLSharedEventListener *v12;
  MTLSharedEventListener *sharedEventListener;
  int v14;

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "memSize");

  if (!v4)
    goto LABEL_12;
  v5 = -[CMISmartStyleMetalRendererV1 _calculateCubicSplineToneCurve](self, "_calculateCubicSplineToneCurve");
  if (v5)
  {
    v14 = v5;
    FigDebugAssert3();
    return v14;
  }
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("hueSatLumLUTCalculation"), 0);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  hueSatLumLUTPipelineState = self->_hueSatLumLUTPipelineState;
  self->_hueSatLumLUTPipelineState = v6;

  if (self->_hueSatLumLUTPipelineState)
  {
    -[CMISmartStyleMetalRendererV1 _calculateHueSatLumLUTTexForAllCastTypesAndVariants](self, "_calculateHueSatLumLUTTexForAllCastTypesAndVariants");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    hueSatLumLUTTexByCastTypeForVariant = self->_hueSatLumLUTTexByCastTypeForVariant;
    self->_hueSatLumLUTTexByCastTypeForVariant = v8;

    if (!-[NSDictionary count](self->_hueSatLumLUTTexByCastTypeForVariant, "count"))
    {
      FigDebugAssert3();
      return 3;
    }
    v10 = objc_alloc(MEMORY[0x1E0CC6B88]);
    v11 = dispatch_queue_create("CMIMetalRendderer", 0);
    v12 = (MTLSharedEventListener *)objc_msgSend(v10, "initWithDispatchQueue:", v11);
    sharedEventListener = self->_sharedEventListener;
    self->_sharedEventListener = v12;

    if (self->_sharedEventListener)
      return 0;
LABEL_12:
    FigDebugAssert3();
    return 1;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
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
  FigMetalDecRef((id *)&self->_paramsBuf);
  FigMetalDecRef((id *)&self->_statsBuf);
  FigMetalDecRef((id *)&self->_guideTexture);
  FigMetalDecRef((id *)&self->_linearGuideTexture);
  FigMetalDecRef((id *)&self->_bgLTMGainMapTexture);
  FigMetalDecRef((id *)&self->_fgLTMGainMapTexture);
  FigMetalDecRef((id *)&self->_smallLightMapTexture);
  FigMetalDecRef((id *)&self->_smallLinearLightMapTexture);
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
  return 0;
}

- (void)dealloc
{
  MTLTexture *inputImageTexture;
  MTLTexture *inputImageThumbnailTexture;
  MTLTexture *inputLightMapTexture;
  NSDictionary *inputStatisticsByStatsType;
  MTLTexture *inputLinearImageTexture;
  MTLTexture *inputLinearImageLumaTexture;
  MTLTexture *inputLinearImageChromaTexture;
  MTLTexture *v10;
  MTLTexture *inputGlobalToneCurveTexture;
  MTLTexture *inputGainMapTexture;
  MTLTexture *inputPersonMaskTexture;
  MTLTexture *inputSkinMaskTexture;
  MTLTexture *inputSkyMaskTexture;
  MTLTexture *inputSmallLightMapTexture;
  MTLTexture *inputSmallLinearLightMapTexture;
  NSString *sceneType;
  MTLTexture *outputImageTexture;
  MTLTexture *outputGainMapTexture;
  MTLTexture *outputSmallLightMapTexture;
  MTLTexture *outputSmallLinearLightMapTexture;
  FigMetalContext *metalContext;
  CMIGuidedFilter *cmiGuidedFilter;
  SmartStyleRendererPlist *internalTuningParams;
  MTLComputePipelineState *globalHistogramPipelineState;
  MTLComputePipelineState *globalStatsPipelineState;
  MTLComputePipelineState *createGuidePipelineStateWithoutImageBlock;
  MTLComputePipelineState *createGuidePipelineStateUsingImageBlock;
  MTLComputePipelineState *v30;
  MTLComputePipelineState *v31;
  MTLComputePipelineState *v32;
  MTLComputePipelineState *v33;
  MTLComputePipelineState *YCbCrToRGBColorConversionPipelineState;
  MTLComputePipelineState *hueSatLumLUTPipelineState;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  FigMetalDecRef((id *)&self->_cubicSplineToneCurveTexture);
  -[CMISmartStyleMetalRendererV1 purgeResources](self, "purgeResources");
  inputImageTexture = self->_inputImageTexture;
  self->_inputImageTexture = 0;

  inputImageThumbnailTexture = self->_inputImageThumbnailTexture;
  self->_inputImageThumbnailTexture = 0;

  inputLightMapTexture = self->_inputLightMapTexture;
  self->_inputLightMapTexture = 0;

  inputStatisticsByStatsType = self->_inputStatisticsByStatsType;
  self->_inputStatisticsByStatsType = 0;

  inputLinearImageTexture = self->_inputLinearImageTexture;
  self->_inputLinearImageTexture = 0;

  inputLinearImageLumaTexture = self->_inputLinearImageLumaTexture;
  self->_inputLinearImageLumaTexture = 0;

  inputLinearImageChromaTexture = self->_inputLinearImageChromaTexture;
  self->_inputLinearImageChromaTexture = 0;

  v10 = self->_inputLightMapTexture;
  self->_inputLightMapTexture = 0;

  inputGlobalToneCurveTexture = self->_inputGlobalToneCurveTexture;
  self->_inputGlobalToneCurveTexture = 0;

  inputGainMapTexture = self->_inputGainMapTexture;
  self->_inputGainMapTexture = 0;

  inputPersonMaskTexture = self->_inputPersonMaskTexture;
  self->_inputPersonMaskTexture = 0;

  inputSkinMaskTexture = self->_inputSkinMaskTexture;
  self->_inputSkinMaskTexture = 0;

  inputSkyMaskTexture = self->_inputSkyMaskTexture;
  self->_inputSkyMaskTexture = 0;

  inputSmallLightMapTexture = self->_inputSmallLightMapTexture;
  self->_inputSmallLightMapTexture = 0;

  inputSmallLinearLightMapTexture = self->_inputSmallLinearLightMapTexture;
  self->_inputSmallLinearLightMapTexture = 0;

  sceneType = self->_sceneType;
  self->_sceneType = 0;

  outputImageTexture = self->_outputImageTexture;
  self->_outputImageTexture = 0;

  outputGainMapTexture = self->_outputGainMapTexture;
  self->_outputGainMapTexture = 0;

  outputSmallLightMapTexture = self->_outputSmallLightMapTexture;
  self->_outputSmallLightMapTexture = 0;

  outputSmallLinearLightMapTexture = self->_outputSmallLinearLightMapTexture;
  self->_outputSmallLinearLightMapTexture = 0;

  metalContext = self->_metalContext;
  self->_metalContext = 0;

  cmiGuidedFilter = self->_cmiGuidedFilter;
  self->_cmiGuidedFilter = 0;

  internalTuningParams = self->_internalTuningParams;
  self->_internalTuningParams = 0;

  globalHistogramPipelineState = self->_globalHistogramPipelineState;
  self->_globalHistogramPipelineState = 0;

  globalStatsPipelineState = self->_globalStatsPipelineState;
  self->_globalStatsPipelineState = 0;

  createGuidePipelineStateWithoutImageBlock = self->_createGuidePipelineStateWithoutImageBlock;
  self->_createGuidePipelineStateWithoutImageBlock = 0;

  createGuidePipelineStateUsingImageBlock = self->_createGuidePipelineStateUsingImageBlock;
  self->_createGuidePipelineStateUsingImageBlock = 0;

  v30 = self->_renderSmartStylePipelineStateUsingImageBlock[0];
  self->_renderSmartStylePipelineStateUsingImageBlock[0] = 0;

  v31 = self->_renderSmartStylePipelineStateUsingImageBlock[1];
  self->_renderSmartStylePipelineStateUsingImageBlock[1] = 0;

  v32 = self->_renderSmartStylePipelineStateWithoutImageBlock[0];
  self->_renderSmartStylePipelineStateWithoutImageBlock[0] = 0;

  v33 = self->_renderSmartStylePipelineStateWithoutImageBlock[1];
  self->_renderSmartStylePipelineStateWithoutImageBlock[1] = 0;

  YCbCrToRGBColorConversionPipelineState = self->_YCbCrToRGBColorConversionPipelineState;
  self->_YCbCrToRGBColorConversionPipelineState = 0;

  hueSatLumLUTPipelineState = self->_hueSatLumLUTPipelineState;
  self->_hueSatLumLUTPipelineState = 0;

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "usedSizeAll");

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "reset");

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "purgeResources");

  -[FigMetalAllocator reset](self->_sharedAccessAllocator, "reset");
  -[FigMetalAllocator purgeResources](self->_sharedAccessAllocator, "purgeResources");
  v39.receiver = self;
  v39.super_class = (Class)CMISmartStyleMetalRendererV1;
  -[CMISmartStyleMetalRendererV1 dealloc](&v39, sel_dealloc);
}

- (int)finishProcessing
{
  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  return 0;
}

- (int)resetState
{
  CGSize v2;

  v2 = (CGSize)*MEMORY[0x1E0C9D820];
  self->_logicalImageToInputImageScale = (CGSize)*MEMORY[0x1E0C9D820];
  self->_logicalImageToInputLinearImageScale = v2;
  self->_logicalImageToBgLTMGainMapScale = v2;
  self->_logicalImageToFgLTMGainMapScale = v2;
  self->_logicalImageToInputLightMapScale = v2;
  self->_logicalImageToInputLinearLightMapScale = v2;
  self->_logicalImageToInputPersonMaskScale = v2;
  self->_logicalImageToInputSkinMaskScale = v2;
  self->_logicalImageToInputSkyMaskScale = v2;
  return 0;
}

- (id)_newBufferWithLength:(unint64_t)a3 label:(id)a4 sharedAccess:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  FigMetalAllocator *v9;
  FigMetalAllocator *v10;
  id v11;
  void *v12;
  const __CFString *instanceLabel;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a5;
  v8 = a4;
  if (v5)
  {
    v9 = self->_sharedAccessAllocator;
  }
  else
  {
    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v9 = (FigMetalAllocator *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = -[FigMetalAllocator newBufferDescriptor](v9, "newBufferDescriptor");
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setLength:", a3);
    instanceLabel = (const __CFString *)self->_instanceLabel;
    if (!instanceLabel)
      instanceLabel = CFSTR("Unknown");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%p"), v8, instanceLabel, self);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setLabel:", 0);
    v15 = -[FigMetalAllocator newBufferWithDescriptor:](v10, "newBufferWithDescriptor:", v12);
    v16 = (void *)v15;
    if (v5 && !v15)
    {
      -[FigMetalContext device](self->_metalContext, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v17, "newBufferWithLength:options:", a3, 0);

    }
    v8 = (id)v14;
  }
  else
  {
    FigDebugAssert3();
    v16 = 0;
  }

  return v16;
}

- (id)_newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7 retainUntilPurge:(BOOL)a8 useFigMetalAllocator:(BOOL)a9
{
  uint64_t v10;

  BYTE1(v10) = a9;
  LOBYTE(v10) = a8;
  return -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:disableCompression:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:disableCompression:label:retainUntilPurge:useFigMetalAllocator:", a3, a4, a5, a6, 0, a7, v10);
}

- (id)_newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 disableCompression:(BOOL)a7 label:(id)a8 retainUntilPurge:(BOOL)a9 useFigMetalAllocator:(BOOL)a10
{
  _BOOL4 v10;
  const __CFString *instanceLabel;
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
  void *v27;
  FigMetalContext *metalContext;
  void *v29;
  void *v30;
  void *v31;

  v10 = a7;
  instanceLabel = (const __CFString *)self->_instanceLabel;
  if (!instanceLabel)
    instanceLabel = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%p"), a8, instanceLabel);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "newTextureDescriptor");

  if (v19)
  {
    objc_msgSend(v19, "setLabel:", 0);
    objc_msgSend(v19, "desc");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextureType:", 2);

    objc_msgSend(v19, "desc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPixelFormat:", a3);

    objc_msgSend(v19, "desc");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWidth:", a4);

    objc_msgSend(v19, "desc");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHeight:", a5);

    objc_msgSend(v19, "desc");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDepth:", 1);

    objc_msgSend(v19, "desc");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setUsage:", a6);

    if (v10)
    {
      objc_msgSend(v19, "desc");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCompressionMode:", 2);

      objc_msgSend(v19, "desc");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setCompressionFootprint:", 0);

    }
    metalContext = self->_metalContext;
    if (a10)
    {
      -[FigMetalContext allocator](metalContext, "allocator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "newTextureWithDescriptor:", v19);
    }
    else
    {
      -[FigMetalContext device](metalContext, "device");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "desc");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "newTextureWithDescriptor:", v31);

    }
    if (v30)
    {
      if (a9)
        -[NSMutableSet addObject:](self->_texturesToPurge, "addObject:", v30);
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
    v30 = 0;
  }

  return v30;
}

- (int)_encodeImageReduction:(id)a3 inputTexture:(id)a4 inputROI:(CGRect)a5 inputColorConversion:(id)a6 outputStatsBuffer:(id)a7 outputStatsBufferOffset:(unsigned int)a8
{
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  float64x2_t v27;
  float64x2_t v28;
  int16x4_t v29;
  void *v30;
  void *v31;
  __int16 v32;
  int16x4_t v33;
  void *v34;
  int16x4_t v35;
  int v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v43;
  uint64_t v45;
  id v46;
  id v47;
  float64_t x;
  float64_t y;
  float64_t width;
  float64_t height;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  _QWORD v58[3];
  _QWORD v59[3];
  int16x4_t v60;
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;

  v45 = *(_QWORD *)&a6.var0;
  width = a5.size.width;
  height = a5.size.height;
  x = a5.origin.x;
  y = a5.origin.y;
  v62 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v52 = a4;
  v46 = a7;
  v11 = 32;
  do
  {
    v12 = v11;
    v13 = v11 * v11;
    v14 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_imageReduction, "maxTotalThreadsPerThreadgroup");
    v11 = v12 >> 1;
  }
  while (v13 > v14);
  v15 = (objc_msgSend(v52, "width") + v12 - 1) & -(uint64_t)v12;
  v16 = (objc_msgSend(v52, "height") + v12 - 1) & -(uint64_t)v12;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 > v12 || v16 > v12)
  {
    v18 = v16;
    v19 = v15;
    while ((unint64_t)objc_msgSend(v17, "count") <= 1)
    {
      v20 = objc_msgSend(v17, "count");
      if (v12 <= v19)
        v19 /= v12;
      else
        v19 = 1;
      if (v12 <= v18)
        v18 /= v12;
      else
        v18 = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SmartStyleReduction_Band%lu"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v43) = 1;
      v22 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 115, v19, v18, 7, v21, 0, v43);
      if (!v22)
      {
        FigDebugAssert3();

        v36 = 1;
        goto LABEL_37;
      }
      v23 = v22;
      objc_msgSend(v17, "addObject:", v22);

      if (v19 <= v12 && v18 <= v12)
        break;
    }
  }
  objc_msgSend(v47, "computeCommandEncoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = v24;
    objc_msgSend(v24, "setComputePipelineState:", self->_imageReduction);
    objc_msgSend(v25, "setBuffer:offset:atIndex:", v46, a8, 2);
    objc_msgSend(v25, "setBytes:length:atIndex:", v45, 64, 0);
    objc_msgSend(v25, "setImageblockWidth:height:", v12, v12);
    v26 = 0;
    v27.f64[0] = x;
    v27.f64[1] = y;
    v28.f64[0] = width;
    v28.f64[1] = height;
    v29 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndmq_f64(v27))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndpq_f64(v28))));
    do
    {
      if (v26)
      {
        if (objc_msgSend(v17, "count") <= (unint64_t)!(v26 & 1))
        {
          v30 = 0;
        }
        else
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", !(v26 & 1));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v17, "count") <= (unint64_t)(v26 & 1))
        {
          v34 = 0;
        }
        else
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", v26 & 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v25, "setTexture:atIndex:", 0, 0);
        objc_msgSend(v25, "setTexture:atIndex:", v30, 3);
        objc_msgSend(v25, "setTexture:atIndex:", v34, 4);
        v35.i32[0] = 0;
        v35.i16[2] = v15;
        v35.i16[3] = v16;
        v60 = v35;
        objc_msgSend(v25, "setBytes:length:atIndex:", &v60, 8, 5);

      }
      else
      {
        objc_msgSend(v25, "setTexture:atIndex:", v52, 0);
        objc_msgSend(v25, "setTexture:atIndex:", 0, 3);
        objc_msgSend(v17, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTexture:atIndex:", v31, 4);

        v60 = 0;
        LOWORD(v31) = objc_msgSend(v52, "width");
        v32 = objc_msgSend(v52, "height");
        v33.i32[0] = 0;
        v33.i16[2] = (__int16)v31;
        v33.i16[3] = v32;
        v60 = v33;
        v63.origin.x = x;
        v63.origin.y = y;
        v63.size.width = width;
        v63.size.height = height;
        if (!CGRectIsEmpty(v63))
          v60 = v29;
        objc_msgSend(v25, "setBytes:length:atIndex:", &v60, 8, 5);
      }
      if (v12 <= v15)
        v15 /= v12;
      else
        v15 = 1;
      if (v12 <= v16)
        v16 /= v12;
      else
        v16 = 1;
      v59[0] = v15;
      v59[1] = v16;
      v59[2] = 1;
      v58[0] = v12;
      v58[1] = v12;
      v58[2] = 1;
      objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", v59, v58);
      ++v26;
    }
    while ((v16 | v15) > 1);
    objc_msgSend(v25, "endEncoding");

    v36 = 0;
  }
  else
  {
    FigDebugAssert3();
    v36 = FigSignalErrorAt();
  }
LABEL_37:
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v37 = v17;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v54 != v40)
          objc_enumerationMutation(v37);
        v57 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * i);
        FigMetalDecRef(&v57);

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v39);
  }

  return v36;
}

- (int)_runImageReductionAndUpdateBaseGain:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  MTLTexture *inputImageTexture;
  MTLBuffer *statsBuf;
  double x;
  double y;
  double width;
  double height;
  __int128 v12;
  __int128 v13;
  int v14;
  MTLTexture *inputLinearImageTexture;
  MTLBuffer *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  int v23;
  void *v24;
  int v25;
  int64x2_t v27;
  uint64_t v28;
  int64x2_t v29;
  uint64_t v30;
  $5B0A6BA4E1A7C3551A48778C4B6F7727 colorManagement;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v3 = a3;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    FigDebugAssert3();
    v25 = FigSignalErrorAt();
    goto LABEL_7;
  }
  inputImageTexture = self->_inputImageTexture;
  statsBuf = self->_statsBuf;
  x = self->_inputImageTextureMappedRegion.origin.x;
  y = self->_inputImageTextureMappedRegion.origin.y;
  width = self->_inputImageTextureMappedRegion.size.width;
  height = self->_inputImageTextureMappedRegion.size.height;
  v12 = *(_OWORD *)self->_anon_90;
  colorManagement = self->_colorManagement;
  v32 = v12;
  v13 = *(_OWORD *)&self->_anon_90[32];
  v33 = *(_OWORD *)&self->_anon_90[16];
  v34 = v13;
  v14 = -[CMISmartStyleMetalRendererV1 _encodeImageReduction:inputTexture:inputROI:inputColorConversion:outputStatsBuffer:outputStatsBufferOffset:](self, "_encodeImageReduction:inputTexture:inputROI:inputColorConversion:outputStatsBuffer:outputStatsBufferOffset:", v5, inputImageTexture, &colorManagement, statsBuf, 10624, x, y, width, height);
  if (v14)
  {
    v25 = v14;
LABEL_11:
    FigDebugAssert3();
    goto LABEL_7;
  }
  inputLinearImageTexture = self->_inputLinearImageTexture;
  v16 = self->_statsBuf;
  v17 = self->_inputLinearImageTextureMappedRegion.origin.x;
  v18 = self->_inputLinearImageTextureMappedRegion.origin.y;
  v19 = self->_inputLinearImageTextureMappedRegion.size.width;
  v20 = self->_inputLinearImageTextureMappedRegion.size.height;
  v21 = *(_OWORD *)&self->_anon_90[64];
  colorManagement = *($5B0A6BA4E1A7C3551A48778C4B6F7727 *)&self->_anon_90[48];
  v32 = v21;
  v22 = *(_OWORD *)&self->_anon_90[96];
  v33 = *(_OWORD *)&self->_anon_90[80];
  v34 = v22;
  v23 = -[CMISmartStyleMetalRendererV1 _encodeImageReduction:inputTexture:inputROI:inputColorConversion:outputStatsBuffer:outputStatsBufferOffset:](self, "_encodeImageReduction:inputTexture:inputROI:inputColorConversion:outputStatsBuffer:outputStatsBufferOffset:", v5, inputLinearImageTexture, &colorManagement, v16, 10612, v17, v18, v19, v20);
  if (v23)
  {
    v25 = v23;
    goto LABEL_11;
  }
  if (v3)
  {
    objc_msgSend(v5, "computeCommandEncoder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setComputePipelineState:", self->_updateBaseGainWithStats);
    objc_msgSend(v24, "setBuffer:offset:atIndex:", self->_paramsBuf, 0, 1);
    objc_msgSend(v24, "setBuffer:offset:atIndex:", self->_statsBuf, 0, 3);
    v29 = vdupq_n_s64(1uLL);
    v30 = 1;
    v27 = v29;
    v28 = 1;
    objc_msgSend(v24, "dispatchThreads:threadsPerThreadgroup:", &v29, &v27);
    objc_msgSend(v24, "endEncoding");

  }
  -[FigMetalContext commit](self->_metalContext, "commit");
  v25 = 0;
LABEL_7:

  return v25;
}

- (void)_resetTextureMappedRegions
{
  CGPoint v2;
  CGSize v3;

  v2 = (CGPoint)*MEMORY[0x1E0C9D628];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_renderRegionRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_renderRegionRect.size = v3;
  self->_inputImageTextureMappedRegion.origin = v2;
  self->_inputImageTextureMappedRegion.size = v3;
  self->_inputLinearImageTextureMappedRegion.origin = v2;
  self->_inputLinearImageTextureMappedRegion.size = v3;
  self->_inputBgLTMGainMapTextureMappedRegion.origin = v2;
  self->_inputBgLTMGainMapTextureMappedRegion.size = v3;
  self->_inputFgLTMGainMapTextureMappedRegion.origin = v2;
  self->_inputFgLTMGainMapTextureMappedRegion.size = v3;
  self->_inputLightMapTextureMappedRegion.origin = v2;
  self->_inputLightMapTextureMappedRegion.size = v3;
  self->_inputLinearLightMapTextureMappedRegion.origin = v2;
  self->_inputLinearLightMapTextureMappedRegion.size = v3;
  self->_inputPersonMaskTextureMappedRegion.origin = v2;
  self->_inputPersonMaskTextureMappedRegion.size = v3;
  self->_inputSkinMaskTextureMappedRegion.origin = v2;
  self->_inputSkinMaskTextureMappedRegion.size = v3;
  self->_inputSkyMaskTextureMappedRegion.origin = v2;
  self->_inputSkyMaskTextureMappedRegion.size = v3;
  self->_outputImageTextureMappedRegion.origin = v2;
  self->_outputImageTextureMappedRegion.size = v3;
}

- (int)_checkROISpecificationForStatsCalculation
{
  double v3;
  double v4;
  unint64_t v6;
  uint64_t v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  unint64_t v24;
  double height;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  unint64_t v38;
  MTLTexture *inputLinearImageTexture;
  CGFloat v40;
  unint64_t v41;
  CGFloat v42;
  unint64_t v43;
  CGFloat v44;
  unint64_t v45;
  CGFloat v46;
  unint64_t v47;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v4 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (self->_logicalImageSize.width == *MEMORY[0x1E0C9D820] && self->_logicalImageSize.height == v3)
  {
    v6 = -[MTLTexture width](self->_inputImageTexture, "width");
    if (v6 <= -[MTLTexture width](self->_outputImageTexture, "width"))
      v7 = 72;
    else
      v7 = 32;
    v8 = (double)(unint64_t)objc_msgSend(*(id *)((char *)&self->super.isa + v7), "width");
    v9 = -[MTLTexture height](self->_inputImageTexture, "height");
    if (v9 <= -[MTLTexture height](self->_outputImageTexture, "height"))
      v10 = 72;
    else
      v10 = 32;
    v11 = objc_msgSend(*(id *)((char *)&self->super.isa + v10), "height");
    self->_logicalImageSize.width = v8;
    self->_logicalImageSize.height = (double)v11;
  }
  if (CGRectIsEmpty(self->_inputImageTextureMappedRegion))
  {
    v12 = (double)(unint64_t)-[MTLTexture width](self->_inputImageTexture, "width");
    v13 = (double)(unint64_t)-[MTLTexture height](self->_inputImageTexture, "height");
    self->_inputImageTextureMappedRegion.origin.x = 0.0;
    self->_inputImageTextureMappedRegion.origin.y = 0.0;
    self->_inputImageTextureMappedRegion.size.width = v12;
    self->_inputImageTextureMappedRegion.size.height = v13;
  }
  if (self->_inputImageTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputImageTexture, "width")|| self->_inputImageTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputImageTexture, "height"))
  {
    goto LABEL_59;
  }
  if (CGRectIsEmpty(self->_inputLinearImageTextureMappedRegion))
  {
    v14 = (double)(unint64_t)-[MTLTexture width](self->_inputLinearImageTexture, "width");
    v15 = (double)(unint64_t)-[MTLTexture height](self->_inputLinearImageTexture, "height");
    self->_inputLinearImageTextureMappedRegion.origin.x = 0.0;
    self->_inputLinearImageTextureMappedRegion.origin.y = 0.0;
    self->_inputLinearImageTextureMappedRegion.size.width = v14;
    self->_inputLinearImageTextureMappedRegion.size.height = v15;
  }
  if (self->_inputLinearImageTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputLinearImageTexture, "width")|| self->_inputLinearImageTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputLinearImageTexture, "height"))
  {
    goto LABEL_59;
  }
  if (CGRectIsEmpty(self->_inputPersonMaskTextureMappedRegion))
  {
    v16 = (double)(unint64_t)-[MTLTexture width](self->_inputPersonMaskTexture, "width");
    v17 = (double)(unint64_t)-[MTLTexture height](self->_inputPersonMaskTexture, "height");
    self->_inputPersonMaskTextureMappedRegion.origin.x = 0.0;
    self->_inputPersonMaskTextureMappedRegion.origin.y = 0.0;
    self->_inputPersonMaskTextureMappedRegion.size.width = v16;
    self->_inputPersonMaskTextureMappedRegion.size.height = v17;
  }
  if (self->_inputPersonMaskTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputPersonMaskTexture, "width")|| self->_inputPersonMaskTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputPersonMaskTexture, "height"))
  {
    goto LABEL_59;
  }
  if (CGRectIsEmpty(self->_inputSkinMaskTextureMappedRegion))
  {
    v18 = (double)(unint64_t)-[MTLTexture width](self->_inputSkinMaskTexture, "width");
    v19 = (double)(unint64_t)-[MTLTexture height](self->_inputSkinMaskTexture, "height");
    self->_inputSkinMaskTextureMappedRegion.origin.x = 0.0;
    self->_inputSkinMaskTextureMappedRegion.origin.y = 0.0;
    self->_inputSkinMaskTextureMappedRegion.size.width = v18;
    self->_inputSkinMaskTextureMappedRegion.size.height = v19;
  }
  if (self->_inputSkinMaskTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputSkinMaskTexture, "width")|| self->_inputSkinMaskTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputSkinMaskTexture, "height"))
  {
    goto LABEL_59;
  }
  if (CGRectIsEmpty(self->_inputSkyMaskTextureMappedRegion))
  {
    v20 = (double)(unint64_t)-[MTLTexture width](self->_inputSkyMaskTexture, "width");
    v21 = (double)(unint64_t)-[MTLTexture height](self->_inputSkyMaskTexture, "height");
    self->_inputSkyMaskTextureMappedRegion.origin.x = 0.0;
    self->_inputSkyMaskTextureMappedRegion.origin.y = 0.0;
    self->_inputSkyMaskTextureMappedRegion.size.width = v20;
    self->_inputSkyMaskTextureMappedRegion.size.height = v21;
  }
  if (self->_inputSkyMaskTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputSkyMaskTexture, "width")|| self->_inputSkyMaskTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputSkyMaskTexture, "height"))
  {
    goto LABEL_59;
  }
  if (CGRectIsEmpty(self->_outputImageTextureMappedRegion))
  {
    v22 = (double)(unint64_t)-[MTLTexture width](self->_outputImageTexture, "width");
    v23 = (double)(unint64_t)-[MTLTexture height](self->_outputImageTexture, "height");
    self->_outputImageTextureMappedRegion.origin.x = 0.0;
    self->_outputImageTextureMappedRegion.origin.y = 0.0;
    self->_outputImageTextureMappedRegion.size.width = v22;
    self->_outputImageTextureMappedRegion.size.height = v23;
  }
  if (self->_outputImageTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_outputImageTexture, "width"))goto LABEL_59;
  v24 = -[MTLTexture height](self->_outputImageTexture, "height");
  height = self->_outputImageTextureMappedRegion.size.height;
  if (height != (double)v24)
    goto LABEL_59;
  x = self->_outputImageTextureMappedRegion.origin.x;
  y = self->_outputImageTextureMappedRegion.origin.y;
  width = self->_outputImageTextureMappedRegion.size.width;
  v49 = CGRectIntersection(self->_inputImageTextureMappedRegion, *(CGRect *)(&height - 3));
  v52.size.width = self->_logicalImageSize.width;
  v52.size.height = self->_logicalImageSize.height;
  v52.origin.x = 0.0;
  v52.origin.y = 0.0;
  v50 = CGRectIntersection(v49, v52);
  v29 = v50.origin.x;
  v30 = v50.origin.y;
  v31 = v50.size.width;
  v32 = v50.size.height;
  if (CGRectIsEmpty(v50))
    goto LABEL_59;
  if (CGRectIsEmpty(self->_renderRegionRect))
  {
    self->_renderRegionRect.origin.x = v29;
    self->_renderRegionRect.origin.y = v30;
    v33 = v29;
    self->_renderRegionRect.size.width = v31;
    v34 = v30;
    v35 = v31;
    v36 = v32;
    self->_renderRegionRect.size.height = v32;
  }
  else
  {
    v33 = self->_renderRegionRect.origin.x;
    v34 = self->_renderRegionRect.origin.y;
    v35 = self->_renderRegionRect.size.width;
    v36 = self->_renderRegionRect.size.height;
  }
  v51.origin.x = v29;
  v51.origin.y = v30;
  v51.size.width = v31;
  v51.size.height = v32;
  if (CGRectContainsRect(v51, *(CGRect *)&v33))
  {
    if (self->_logicalImageToInputImageScale.width == v4 && self->_logicalImageToInputImageScale.height == v3)
    {
      v37 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_inputImageTexture, "width"));
      v38 = -[MTLTexture height](self->_inputImageTexture, "height");
      self->_logicalImageToInputImageScale.width = v37;
      self->_logicalImageToInputImageScale.height = (float)(1.0 / (float)v38);
    }
    inputLinearImageTexture = self->_inputLinearImageTexture;
    if (inputLinearImageTexture
      && self->_logicalImageToInputLinearImageScale.width == v4
      && self->_logicalImageToInputLinearImageScale.height == v3)
    {
      v40 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](inputLinearImageTexture, "width"));
      v41 = -[MTLTexture height](self->_inputLinearImageTexture, "height");
      self->_logicalImageToInputLinearImageScale.width = v40;
      self->_logicalImageToInputLinearImageScale.height = (float)(1.0 / (float)v41);
    }
    if (self->_logicalImageToInputPersonMaskScale.width == v4 && self->_logicalImageToInputPersonMaskScale.height == v3)
    {
      v42 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_inputPersonMaskTexture, "width"));
      v43 = -[MTLTexture height](self->_inputPersonMaskTexture, "height");
      self->_logicalImageToInputPersonMaskScale.width = v42;
      self->_logicalImageToInputPersonMaskScale.height = (float)(1.0 / (float)v43);
    }
    if (self->_logicalImageToInputSkinMaskScale.width == v4 && self->_logicalImageToInputSkinMaskScale.height == v3)
    {
      v44 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_inputSkinMaskTexture, "width"));
      v45 = -[MTLTexture height](self->_inputSkinMaskTexture, "height");
      self->_logicalImageToInputSkinMaskScale.width = v44;
      self->_logicalImageToInputSkinMaskScale.height = (float)(1.0 / (float)v45);
    }
    if (self->_logicalImageToInputSkyMaskScale.width == v4 && self->_logicalImageToInputSkyMaskScale.height == v3)
    {
      v46 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_inputSkyMaskTexture, "width"));
      v47 = -[MTLTexture height](self->_inputSkyMaskTexture, "height");
      self->_logicalImageToInputSkyMaskScale.width = v46;
      self->_logicalImageToInputSkyMaskScale.height = (float)(1.0 / (float)v47);
    }
    return 0;
  }
  else
  {
LABEL_59:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (void)_encodeRenderRegionForStats:(id *)a3
{
  int32x2_t v5;
  float32x2_t v6;
  unint64_t v7;
  float32x2_t v8;
  float32x2_t v9;
  __int128 v10;
  MTLTexture *inputLinearImageTexture;
  float32x2_t v12;
  unint64_t v13;
  float32x2_t v14;
  float32x2_t v15;
  __int128 v16;
  float32x2_t v17;
  unint64_t v18;
  float32x2_t v19;
  float32x2_t v20;
  __int128 v21;
  float32x2_t v22;
  unint64_t v23;
  float32x2_t v24;
  float32x2_t v25;
  __int128 v26;
  float32x2_t v27;
  unint64_t v28;
  float32x2_t v29;
  float32x2_t v30;
  __int128 v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;

  v5 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_logicalImageSize));
  *((_WORD *)a3 + 1) = v5.i16[2];
  *(_WORD *)a3 = v5.i16[0];
  v6 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputImageTextureMappedRegion.origin));
  v32 = (float)(unint64_t)-[MTLTexture width](self->_inputImageTexture, "width");
  v7 = -[MTLTexture height](self->_inputImageTexture, "height");
  v8.f32[0] = v32;
  v8.f32[1] = (float)v7;
  v9 = vdiv_f32(v6, v8);
  *(float32x2_t *)&v10 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputImageScale);
  *((float32x2_t *)&v10 + 1) = v9;
  *((_OWORD *)a3 + 1) = v10;
  inputLinearImageTexture = self->_inputLinearImageTexture;
  if (inputLinearImageTexture)
  {
    v12 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputLinearImageTextureMappedRegion.origin));
    v33 = (float)(unint64_t)-[MTLTexture width](inputLinearImageTexture, "width");
    v13 = -[MTLTexture height](self->_inputLinearImageTexture, "height");
    v14.f32[0] = v33;
    v14.f32[1] = (float)v13;
    v15 = vdiv_f32(v12, v14);
    *(float32x2_t *)&v16 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputLinearImageScale);
    *((float32x2_t *)&v16 + 1) = v15;
    *((_OWORD *)a3 + 2) = v16;
  }
  v17 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputPersonMaskTextureMappedRegion.origin));
  v34 = (float)(unint64_t)-[MTLTexture width](self->_inputPersonMaskTexture, "width");
  v18 = -[MTLTexture height](self->_inputPersonMaskTexture, "height");
  v19.f32[0] = v34;
  v19.f32[1] = (float)v18;
  v20 = vdiv_f32(v17, v19);
  *(float32x2_t *)&v21 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputPersonMaskScale);
  *((float32x2_t *)&v21 + 1) = v20;
  *((_OWORD *)a3 + 7) = v21;
  v22 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputSkinMaskTextureMappedRegion.origin));
  v35 = (float)(unint64_t)-[MTLTexture width](self->_inputSkinMaskTexture, "width");
  v23 = -[MTLTexture height](self->_inputSkinMaskTexture, "height");
  v24.f32[0] = v35;
  v24.f32[1] = (float)v23;
  v25 = vdiv_f32(v22, v24);
  *(float32x2_t *)&v26 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputSkinMaskScale);
  *((float32x2_t *)&v26 + 1) = v25;
  *((_OWORD *)a3 + 8) = v26;
  v27 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputSkyMaskTextureMappedRegion.origin));
  v36 = (float)(unint64_t)-[MTLTexture width](self->_inputSkyMaskTexture, "width");
  v28 = -[MTLTexture height](self->_inputSkyMaskTexture, "height");
  v29.f32[0] = v36;
  v29.f32[1] = (float)v28;
  v30 = vdiv_f32(v27, v29);
  *(float32x2_t *)&v31 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputSkyMaskScale);
  *((float32x2_t *)&v31 + 1) = v30;
  *((_OWORD *)a3 + 9) = v31;
}

- (int)_calculateHistogramStatsWithImageTexture:(id)a3 linearImageTexture:(id)a4 personMaskTexture:(id)a5 skinMaskTexture:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MTLComputePipelineState *v19;
  unint64_t v20;
  double width;
  float64x2_t v22;
  unint64_t v23;
  double height;
  unint64_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  MTLComputePipelineState *v29;
  MTLComputePipelineState *v30;
  NSMutableDictionary *outputImageStatistics;
  void *v32;
  void *v33;
  MTLSharedEventListener *sharedEventListener;
  void *v35;
  int v36;
  id v38;
  _QWORD v39[6];
  __int128 v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  MTLBuffer *v44;
  int64x2_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  NSMutableDictionary *v49;
  int64x2_t v50;
  uint64_t v51;
  int64x2_t v52;
  uint64_t v53;
  unsigned int v54;
  float32x2_t v55;
  _OWORD v56[11];
  id v57;
  _OWORD v58[2];
  int v59;
  _OWORD v60[2];
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v57 = 0;
  v60[0] = xmmword_1D33055B8;
  v60[1] = unk_1D33055C8;
  v61 = 9;
  v58[0] = xmmword_1D33055B8;
  v58[1] = unk_1D33055C8;
  v59 = 9;
  if ((self->_processingType & 1) != 0)
  {
    v13 = -[CMISmartStyleMetalRendererV1 _checkROISpecificationForStatsCalculation](self, "_checkROISpecificationForStatsCalculation");
    if (v13)
    {
      v36 = v13;
      FigDebugAssert3();
    }
    else
    {
      v14 = -[CMISmartStyleMetalRendererV1 _newBufferWithLength:label:sharedAccess:](self, "_newBufferWithLength:label:sharedAccess:", 10575872, CFSTR("SSR_INTERMEDIATE_STATS"), 0);
      v57 = v14;
      memset(v56, 0, sizeof(v56));
      -[CMISmartStyleMetalRendererV1 _encodeRenderRegionForStats:](self, "_encodeRenderRegionForStats:", v56);
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "computeCommandEncoder");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17)
        {
          FigDebugAssert3();
          v36 = FigSignalErrorAt();
          v30 = 0;
          v18 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v17, "setTexture:atIndex:", v38, 0);
        objc_msgSend(v18, "setTexture:atIndex:", self->_smallLightMapTexture, 17);
        objc_msgSend(v18, "setTexture:atIndex:", v10, 1);
        objc_msgSend(v18, "setTexture:atIndex:", self->_smallLinearLightMapTexture, 18);
        objc_msgSend(v18, "setTexture:atIndex:", v11, 10);
        objc_msgSend(v18, "setTexture:atIndex:", v12, 11);
        objc_msgSend(v18, "setTexture:atIndex:", self->_inputGlobalToneCurveTexture, 2);
        objc_msgSend(v18, "setBytes:length:atIndex:", &self->_colorManagement, 256, 0);
        objc_msgSend(v18, "setBuffer:offset:atIndex:", self->_paramsBuf, 0, 1);
        objc_msgSend(v18, "setBuffer:offset:atIndex:", self->_statsBuf, 0, 3);
        objc_msgSend(v18, "setBuffer:offset:atIndex:", v14, 0, 4);
        v19 = self->_localHistogramStatsAll;
        v20 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v19, "maxTotalThreadsPerThreadgroup");
        width = self->_renderRegionRect.size.width;
        if (((unint64_t)width + 31) >> 5 >= -[MTLComputePipelineState threadExecutionWidth](v19, "threadExecutionWidth"))
        {
          v23 = -[MTLComputePipelineState threadExecutionWidth](v19, "threadExecutionWidth");
          v22.f64[0] = self->_renderRegionRect.size.width;
        }
        else
        {
          v22.f64[0] = self->_renderRegionRect.size.width;
          v23 = ((unint64_t)v22.f64[0] + 31) >> 5;
        }
        height = self->_renderRegionRect.size.height;
        if (((unint64_t)height + 31) >> 5 >= v20 / v23)
          v25 = v20 / v23;
        else
          v25 = ((unint64_t)height + 31) >> 5;
        v22.f64[1] = self->_renderRegionRect.size.height;
        v26 = vmul_f32(vcvt_f32_f64(v22), (float32x2_t)0x3D0000003D000000);
        v27.f32[0] = (float)v23;
        v27.f32[1] = (float)v25;
        v55 = vdiv_f32(v26, v27);
        v28 = vdiv_f32(v26, v55);
        v54 = vmul_lane_f32(v28, v28, 1).f32[0] << 10;
        objc_msgSend(v18, "setBytes:length:atIndex:", v56, 176, 5);
        objc_msgSend(v18, "setBytes:length:atIndex:", &v55, 8, 8);
        objc_msgSend(v18, "setComputePipelineState:", v19);
        v45 = vdupq_n_s64(0x20uLL);
        v46 = 1;
        *(_QWORD *)&v40 = v23;
        *((_QWORD *)&v40 + 1) = v25;
        v41 = 1;
        objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v40);
        v29 = self->_globalHistogramPipelineState;

        objc_msgSend(v18, "setComputePipelineState:", v29);
        objc_msgSend(v18, "setBuffer:offset:atIndex:", self->_statsBuf, 0, 3);
        objc_msgSend(v18, "setBuffer:offset:atIndex:", v14, 0, 4);
        objc_msgSend(v18, "setBytes:length:atIndex:", v60, 36, 7);
        v45 = (int64x2_t)xmmword_1D3305530;
        v46 = 1;
        v40 = xmmword_1D3305330;
        v41 = 1;
        objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v40);
        objc_msgSend(v18, "setComputePipelineState:", self->_sumPersonAndSkinCounts);
        v52 = vdupq_n_s64(1uLL);
        v53 = 1;
        v50 = vdupq_n_s64(0x20uLL);
        v51 = 1;
        objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", &v52, &v50);
        v30 = self->_globalStatsPipelineState;

        objc_msgSend(v18, "setComputePipelineState:", v30);
        objc_msgSend(v18, "setBuffer:offset:atIndex:", self->_statsBuf, 0, 3);
        objc_msgSend(v18, "setBuffer:offset:atIndex:", self->_paramsBuf, 0, 1);
        objc_msgSend(v18, "setBytes:length:atIndex:", v58, 36, 7);
        objc_msgSend(v18, "setBytes:length:atIndex:", &v54, 4, 10);
        v45 = (int64x2_t)xmmword_1D3305530;
        v46 = 1;
        v40 = xmmword_1D3305330;
        v41 = 1;
        objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v40);
        objc_msgSend(v18, "endEncoding");
        outputImageStatistics = self->_outputImageStatistics;
        if (outputImageStatistics)
        {
          v45.i64[0] = 0;
          v45.i64[1] = (uint64_t)&v45;
          v46 = 0x3032000000;
          v47 = __Block_byref_object_copy_;
          v48 = __Block_byref_object_dispose_;
          v49 = outputImageStatistics;
          *(_QWORD *)&v40 = 0;
          *((_QWORD *)&v40 + 1) = &v40;
          v41 = 0x3032000000;
          v42 = __Block_byref_object_copy_;
          v43 = __Block_byref_object_dispose_;
          v44 = self->_statsBuf;
          FigMetalIncRef(*(void **)(*((_QWORD *)&v40 + 1) + 40));
          -[FigMetalContext device](self->_metalContext, "device");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v32, "newSharedEvent");

          objc_msgSend(v33, "setSignaledValue:", 0);
          sharedEventListener = self->_sharedEventListener;
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __126__CMISmartStyleMetalRendererV1__calculateHistogramStatsWithImageTexture_linearImageTexture_personMaskTexture_skinMaskTexture___block_invoke;
          v39[3] = &unk_1E94EB3C8;
          v39[4] = &v40;
          v39[5] = &v45;
          objc_msgSend(v33, "notifyListener:atValue:block:", sharedEventListener, 1, v39);
          -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "encodeSignalEvent:value:", v33, 1);

          _Block_object_dispose(&v40, 8);
          _Block_object_dispose(&v45, 8);

        }
        -[FigMetalContext commit](self->_metalContext, "commit");
        goto LABEL_14;
      }
      FigDebugAssert3();
      v36 = FigSignalErrorAt();
    }
    v30 = 0;
    v18 = 0;
    v16 = 0;
    goto LABEL_15;
  }
  FigDebugAssert3();
  v30 = 0;
  v18 = 0;
  v16 = 0;
LABEL_14:
  v36 = 0;
LABEL_15:
  FigMetalDecRef(&v57);

  return v36;
}

void __126__CMISmartStyleMetalRendererV1__calculateHistogramStatsWithImageTexture_linearImageTexture_personMaskTexture_skinMaskTexture___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  SSRDictionaryFromStats(objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)), "contents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FigMetalDecRef((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDictionary:", v3);
  objc_sync_exit(v4);

}

- (int)_calculateDynamicRenderParameters
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  MTLComputePipelineState *v7;
  int v8;
  int64x2_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "computeCommandEncoder"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = self->_renderingParamsFromStatsPipelineState;
    objc_msgSend(v6, "setComputePipelineState:", v7);
    objc_msgSend(v6, "setBuffer:offset:atIndex:", self->_paramsBuf, 0, 1);
    objc_msgSend(v6, "setBuffer:offset:atIndex:", self->_statsBuf, 0, 3);
    v12 = xmmword_1D3305540;
    v13 = 1;
    v10 = vdupq_n_s64(1uLL);
    v11 = 1;
    objc_msgSend(v6, "dispatchThreadgroups:threadsPerThreadgroup:", &v12, &v10);
    objc_msgSend(v6, "endEncoding");
    -[FigMetalContext commit](self->_metalContext, "commit");

    v8 = 0;
  }
  else
  {
    FigDebugAssert3();
    v8 = FigSignalErrorAt();
  }

  return v8;
}

- (int)_createGuideImage
{
  unint64_t v3;
  unint64_t v4;
  id *p_guideTexture;
  MTLTexture *guideTexture;
  MTLTexture *v7;
  MTLTexture *v8;
  MTLTexture *v9;
  int v10;
  id *p_linearGuideTexture;
  MTLTexture *linearGuideTexture;
  void *v13;
  MTLTexture *v14;
  MTLTexture *v15;
  int v16;
  uint64_t v18;

  if ((self->_processingType & 1) == 0
    && (!self->_inputSmallLightMapTexture || !self->_inputSmallLinearLightMapTexture))
  {
    goto LABEL_23;
  }
  v3 = (unint64_t)(-[MTLTexture width](self->_inputImageTexture, "width") + 1) >> 1;
  v4 = (unint64_t)(-[MTLTexture height](self->_inputImageTexture, "height") + 1) >> 1;
  p_guideTexture = (id *)&self->_guideTexture;
  guideTexture = self->_guideTexture;
  if (guideTexture && -[MTLTexture width](guideTexture, "width") == v3 && objc_msgSend(*p_guideTexture, "height") == v4)
  {
    v7 = (MTLTexture *)*p_guideTexture;
  }
  else
  {
    FigMetalDecRef((id *)&self->_guideTexture);
    LOBYTE(v18) = 1;
    v8 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 25, v3, v4, 7, CFSTR("SSR_GUIDE_TEXTURE"), 0, v18);
    v9 = self->_guideTexture;
    self->_guideTexture = v8;

    v7 = self->_guideTexture;
    if (!v7)
      goto LABEL_23;
  }
  v10 = -[CMISmartStyleMetalRendererV1 _createGuideImageForInputTexture:outputGuideTexture:isInputLinear:isOutputLumaGuide:](self, "_createGuideImageForInputTexture:outputGuideTexture:isInputLinear:isOutputLumaGuide:", self->_inputImageTexture, v7, 0, 1);
  if (v10)
  {
    v16 = v10;
LABEL_22:
    FigDebugAssert3();
    return v16;
  }
  if (!self->_inputLinearImageTexture)
    return 0;
  p_linearGuideTexture = (id *)&self->_linearGuideTexture;
  linearGuideTexture = self->_linearGuideTexture;
  if (linearGuideTexture
    && -[MTLTexture width](linearGuideTexture, "width") == v3
    && objc_msgSend(*p_linearGuideTexture, "height") == v4)
  {
    v13 = *p_linearGuideTexture;
    goto LABEL_16;
  }
  FigMetalDecRef((id *)&self->_linearGuideTexture);
  LOBYTE(v18) = 1;
  v14 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 25, v3, v4, 7, CFSTR("SSR_GUIDE_LINEAR_TEXTURE"), 0, v18);
  v15 = self->_linearGuideTexture;
  self->_linearGuideTexture = v14;

  v13 = self->_linearGuideTexture;
  if (v13)
  {
LABEL_16:
    v16 = -[CMISmartStyleMetalRendererV1 _createGuideImageForInputTexture:outputGuideTexture:isInputLinear:isOutputLumaGuide:](self, "_createGuideImageForInputTexture:outputGuideTexture:isInputLinear:isOutputLumaGuide:", self->_inputLinearImageTexture, v13, 1, 1);
    if (v16)
      goto LABEL_22;
    return v16;
  }
LABEL_23:
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_createGuideImageForInputTexture:(id)a3 outputGuideTexture:(id)a4 isInputLinear:(BOOL)a5 isOutputLumaGuide:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  MTLComputePipelineState *v20;
  _QWORD *v21;
  int64x2_t *v22;
  int v23;
  int64x2_t v25;
  uint64_t v26;
  _QWORD v27[3];
  int64x2_t v28;
  uint64_t v29;
  _QWORD v30[3];
  BOOL v31;
  BOOL v32;

  v10 = a3;
  v11 = a4;
  v32 = a5;
  v31 = a6;
  -[FigMetalContext device](self->_metalContext, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsFamily:", 1004);

  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "computeCommandEncoder"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = (void *)v16;
    v18 = 1152;
    if (v13)
      v18 = 1160;
    v19 = *(id *)((char *)&self->super.isa + v18);
    objc_msgSend(v17, "setComputePipelineState:", v19);
    objc_msgSend(v17, "setTexture:atIndex:", v10, 0);
    objc_msgSend(v17, "setTexture:atIndex:", v11, 16);
    objc_msgSend(v17, "setTexture:atIndex:", self->_inputGlobalToneCurveTexture, 2);
    objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_paramsBuf, 0, 1);
    objc_msgSend(v17, "setBytes:length:atIndex:", &self->_colorManagement, 256, 0);
    objc_msgSend(v17, "setBytes:length:atIndex:", &v32, 1, 6);
    objc_msgSend(v17, "setBytes:length:atIndex:", &v31, 1, 11);
    if (v13)
    {
      v20 = self->_createGuidePipelineStateUsingImageBlock;

      objc_msgSend(v17, "setComputePipelineState:", v20);
      objc_msgSend(v17, "setImageblockWidth:height:", 32, 32);
      v30[0] = objc_msgSend(v11, "width");
      v30[1] = objc_msgSend(v11, "height");
      v30[2] = 1;
      v28 = vdupq_n_s64(0x20uLL);
      v29 = 1;
      v21 = v30;
      v22 = &v28;
    }
    else
    {
      v20 = self->_createGuidePipelineStateWithoutImageBlock;

      objc_msgSend(v17, "setComputePipelineState:", v20);
      v27[0] = objc_msgSend(v11, "width");
      v27[1] = objc_msgSend(v11, "height");
      v27[2] = 1;
      v25 = vdupq_n_s64(0x20uLL);
      v26 = 1;
      v21 = v27;
      v22 = &v25;
    }
    objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", v21, v22);
    objc_msgSend(v17, "endEncoding");
    -[FigMetalContext commit](self->_metalContext, "commit");

    v23 = 0;
  }
  else
  {
    FigDebugAssert3();
    v23 = FigSignalErrorAt();
  }

  return v23;
}

- (int)_processLTMGainMap
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  MTLTexture *inputImageThumbnailTexture;
  void *v11;
  int v12;
  MTLComputePipelineState *v13;
  _QWORD *v14;
  int64x2_t *v15;
  MTLTexture *v16;
  MTLTexture *bgLTMGainMapTexture;
  MTLTexture *v18;
  MTLTexture *fgLTMGainMapTexture;
  double v20;
  int v21;
  double v22;
  int v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64x2_t v29;
  uint64_t v30;
  _QWORD v31[3];
  int64x2_t v32;
  uint64_t v33;
  _QWORD v34[3];
  id v35;
  id v36;

  v36 = 0;
  v35 = 0;
  if (self->_shouldCreateLTMGainMap)
  {
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      && (LOBYTE(v25) = 1,
          v4 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 115, -[MTLTexture width](self->_inputLinearImageTexture, "width"), -[MTLTexture height](self->_inputLinearImageTexture, "height"), 7, CFSTR("SSR_SMALL_BG_LTM_GAINMAP"), 0, v25), (v36 = v4) != 0)&& (v5 = v4, LOBYTE(v26) = 1, v6 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 115, -[MTLTexture width](self->_inputLinearImageTexture, "width"), -[MTLTexture height](self->_inputLinearImageTexture, "height"), 7,
                 CFSTR("SSR_SMALL_FG_LTM_GAINMAP"),
                 0,
                 v26),
          (v35 = v6) != 0))
    {
      v7 = v6;
      objc_msgSend(v3, "computeCommandEncoder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        inputImageThumbnailTexture = self->_inputImageThumbnailTexture;
        if (!inputImageThumbnailTexture)
          inputImageThumbnailTexture = self->_inputImageTexture;
        objc_msgSend(v8, "setTexture:atIndex:", inputImageThumbnailTexture, 0);
        objc_msgSend(v9, "setTexture:atIndex:", self->_inputLinearImageTexture, 1);
        objc_msgSend(v9, "setTexture:atIndex:", self->_inputGlobalToneCurveTexture, 2);
        objc_msgSend(v9, "setTexture:atIndex:", self->_fgbgMatteTexture, 10);
        objc_msgSend(v9, "setTexture:atIndex:", v5, 8);
        objc_msgSend(v9, "setTexture:atIndex:", v7, 9);
        objc_msgSend(v9, "setBytes:length:atIndex:", &self->_colorManagement, 256, 0);
        objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_paramsBuf, 0, 1);
        -[FigMetalContext device](self->_metalContext, "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "supportsFamily:", 1004);

        if (v12)
        {
          v13 = self->_createLTMGainMapPipelineStateUsingImageBlock;
          objc_msgSend(v9, "setComputePipelineState:", v13);
          objc_msgSend(v9, "setImageblockWidth:height:", 32, 32);
          v34[0] = objc_msgSend(v5, "width");
          v34[1] = objc_msgSend(v5, "height");
          v34[2] = 1;
          v32 = vdupq_n_s64(0x20uLL);
          v33 = 1;
          v14 = v34;
          v15 = &v32;
        }
        else
        {
          v13 = self->_createLTMGainMapPipelineStateWithoutImageBlock;
          objc_msgSend(v9, "setComputePipelineState:", v13);
          v31[0] = objc_msgSend(v5, "width");
          v31[1] = objc_msgSend(v5, "height");
          v31[2] = 1;
          v29 = vdupq_n_s64(0x20uLL);
          v30 = 1;
          v14 = v31;
          v15 = &v29;
        }
        objc_msgSend(v9, "dispatchThreads:threadsPerThreadgroup:", v14, v15);
        objc_msgSend(v9, "endEncoding");
        LOBYTE(v27) = 1;
        v16 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 115, -[MTLTexture width](self->_inputImageTexture, "width"), -[MTLTexture height](self->_inputImageTexture, "height"), 7, CFSTR("SSR_BG_LTM_GAINMAP"), 0, v27);
        bgLTMGainMapTexture = self->_bgLTMGainMapTexture;
        self->_bgLTMGainMapTexture = v16;

        if (self->_bgLTMGainMapTexture
          && (LOBYTE(v28) = 1,
              v18 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 115, -[MTLTexture width](self->_inputImageTexture, "width"), -[MTLTexture height](self->_inputImageTexture, "height"), 7, CFSTR("SSR_FG_LTM_GAINMAP"), 0, v28), fgLTMGainMapTexture = self->_fgLTMGainMapTexture, self->_fgLTMGainMapTexture = v18, fgLTMGainMapTexture, self->_fgLTMGainMapTexture))
        {
          LODWORD(v20) = 981668463;
          v21 = -[CMIGuidedFilter encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:](self->_cmiGuidedFilter, "encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:", v3, v5, self->_inputImageTexture, self->_bgLTMGainMapTexture, 1, v20);
          if (v21)
          {
            v23 = v21;
          }
          else
          {
            LODWORD(v22) = 981668463;
            v23 = -[CMIGuidedFilter encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:](self->_cmiGuidedFilter, "encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:", v3, v7, self->_inputImageTexture, self->_fgLTMGainMapTexture, 1, v22);
            if (!v23)
            {
              -[FigMetalContext commit](self->_metalContext, "commit");
              goto LABEL_16;
            }
          }
          FigDebugAssert3();
        }
        else
        {
          FigDebugAssert3();
          v23 = FigSignalErrorAt();
        }
      }
      else
      {
        FigDebugAssert3();
        v23 = FigSignalErrorAt();
        v13 = 0;
      }
    }
    else
    {
      FigDebugAssert3();
      v23 = FigSignalErrorAt();
      v13 = 0;
      v9 = 0;
    }
  }
  else
  {
    v13 = 0;
    v9 = 0;
    v3 = 0;
    v23 = 0;
  }
LABEL_16:
  FigMetalDecRef(&v36);
  FigMetalDecRef(&v35);
  if (v23)
  {
    FigMetalDecRef((id *)&self->_bgLTMGainMapTexture);
    FigMetalDecRef((id *)&self->_fgLTMGainMapTexture);
  }

  return v23;
}

- (int)_upsampleLightMap
{
  uint64_t v3;
  double v4;
  void *v5;
  MTLTexture *inputLightMapTexture;
  MTLTexture *v7;
  MTLTexture *v8;
  MTLTexture *v9;
  MTLTexture *inputLinearLightMapTexture;
  int v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int v16;
  double v17;
  CGFloat v18;
  double v19;
  unint64_t v20;
  int v22;
  uint64_t v23;

  if (((self->_processingType & 1) != 0 || self->_inputSmallLightMapTexture && self->_inputSmallLinearLightMapTexture)
    && (-[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v3;
    inputLightMapTexture = self->_inputLightMapTexture;
    if (inputLightMapTexture
      || (LOBYTE(v23) = 1,
          v7 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 25, -[MTLTexture width](self->_guideTexture, "width"), -[MTLTexture height](self->_guideTexture, "height"), 7, CFSTR("SSR_LIGHTMAP_TEXTURE"), 1, v23), v8 = self->_inputLightMapTexture, self->_inputLightMapTexture = v7, v8, (inputLightMapTexture = self->_inputLightMapTexture) != 0))
    {
      if (self->_inputLinearLightMapTexture)
        goto LABEL_10;
      LOBYTE(v23) = 1;
      v9 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 25, -[MTLTexture width](self->_linearGuideTexture, "width"), -[MTLTexture height](self->_linearGuideTexture, "height"), 7, CFSTR("SSR_LINEAR_LIGHTMAP_TEXTURE"), 1, v23);
      inputLinearLightMapTexture = self->_inputLinearLightMapTexture;
      self->_inputLinearLightMapTexture = v9;

      if (self->_inputLinearLightMapTexture)
      {
        inputLightMapTexture = self->_inputLightMapTexture;
LABEL_10:
        LODWORD(v4) = 1028443341;
        v11 = -[CMIGuidedFilter encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:](self->_cmiGuidedFilter, "encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:", v5, self->_smallLightMapTexture, self->_guideTexture, inputLightMapTexture, 1, v4);
        if (v11)
        {
          v16 = v11;
        }
        else
        {
          v12 = (double)(unint64_t)-[MTLTexture width](self->_inputLightMapTexture, "width")
              / self->_logicalImageSize.width;
          v13 = v12 / (double)(unint64_t)-[MTLTexture width](self->_inputLightMapTexture, "width");
          v14 = (double)(unint64_t)-[MTLTexture height](self->_inputLightMapTexture, "height")
              / self->_logicalImageSize.height;
          v15 = v14 / (double)(unint64_t)-[MTLTexture height](self->_inputLightMapTexture, "height");
          self->_logicalImageToInputLightMapScale.width = v13;
          self->_logicalImageToInputLightMapScale.height = v15;
          LODWORD(v15) = 1028443341;
          v16 = -[CMIGuidedFilter encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:](self->_cmiGuidedFilter, "encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:", v5, self->_smallLinearLightMapTexture, self->_linearGuideTexture, self->_inputLinearLightMapTexture, 1, v15);
          if (!v16)
          {
            v17 = (double)(unint64_t)-[MTLTexture width](self->_inputLinearLightMapTexture, "width")
                / self->_logicalImageSize.width;
            v18 = v17 / (double)(unint64_t)-[MTLTexture width](self->_inputLinearLightMapTexture, "width");
            v19 = (double)(unint64_t)-[MTLTexture height](self->_inputLinearLightMapTexture, "height")
                / self->_logicalImageSize.height;
            v20 = -[MTLTexture height](self->_inputLinearLightMapTexture, "height");
            self->_logicalImageToInputLinearLightMapScale.width = v18;
            self->_logicalImageToInputLinearLightMapScale.height = v19 / (double)v20;
            -[FigMetalContext commit](self->_metalContext, "commit");
LABEL_13:

            return v16;
          }
        }
        FigDebugAssert3();
        goto LABEL_13;
      }
    }
    FigDebugAssert3();
    v22 = FigSignalErrorAt();

    return v22;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)_processSegmentationMasks
{
  void *v3;
  double v4;
  MTLTexture *inputPersonMaskTexture;
  MTLTexture **p_fgbgMatteTexture;
  MTLTexture *v7;
  MTLTexture *fgbgMatteTexture;
  int v9;
  int v10;
  uint64_t v12;

  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_13;
  inputPersonMaskTexture = self->_inputPersonMaskTexture;
  if (!inputPersonMaskTexture)
  {
    FigMetalDecRef((id *)&self->_fgbgMatteTexture);
    goto LABEL_11;
  }
  p_fgbgMatteTexture = &self->_fgbgMatteTexture;
  if (!self->_shouldUpsampleInputPersonMask)
  {
    objc_storeStrong((id *)p_fgbgMatteTexture, self->_inputPersonMaskTexture);
    goto LABEL_11;
  }
  if (!*p_fgbgMatteTexture)
  {
    LOBYTE(v12) = 1;
    v7 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 25, -[MTLTexture width](self->_guideTexture, "width"), -[MTLTexture height](self->_guideTexture, "height"), 7, CFSTR("SSR_FGBG_MATTE_TEXTURE"), 1, v12);
    fgbgMatteTexture = self->_fgbgMatteTexture;
    self->_fgbgMatteTexture = v7;

    if (self->_fgbgMatteTexture)
    {
      inputPersonMaskTexture = self->_inputPersonMaskTexture;
      goto LABEL_7;
    }
LABEL_13:
    FigDebugAssert3();
    v10 = FigSignalErrorAt();
    goto LABEL_12;
  }
LABEL_7:
  LODWORD(v4) = 1028443341;
  v9 = -[CMIGuidedFilter encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:](self->_cmiGuidedFilter, "encodeToCommandBuffer:inputTexture:guideTexture:outputTexture:kernelRadius:epsilon:", v3, inputPersonMaskTexture, self->_guideTexture, v4);
  if (!v9)
  {
LABEL_11:
    objc_storeStrong((id *)&self->_skinMatteTexture, self->_inputSkinMaskTexture);
    objc_storeStrong((id *)&self->_skyMatteTexture, self->_inputSkyMaskTexture);
    -[FigMetalContext commit](self->_metalContext, "commit");
    v10 = 0;
    goto LABEL_12;
  }
  v10 = v9;
  FigDebugAssert3();
LABEL_12:

  return v10;
}

- (int)_compileMetalShadersForProcessingType:(int)a3
{
  char v3;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *imageReduction;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *updateBaseGainWithStats;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *localHistogramStatsAll;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *globalHistogramPipelineState;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *sumPersonAndSkinCounts;
  MTLComputePipelineState *v19;
  MTLComputePipelineState *globalStatsPipelineState;
  void *v21;
  void *v22;
  MTLComputePipelineState *v23;
  MTLComputePipelineState *createGuidePipelineStateUsingImageBlock;
  void *v25;
  MTLComputePipelineState *v26;
  MTLComputePipelineState *createGuidePipelineStateWithoutImageBlock;
  MTLComputePipelineState *v28;
  MTLComputePipelineState *YCbCrToRGBColorConversionPipelineState;
  MTLComputePipelineState *v30;
  MTLComputePipelineState *createLTMGainMapPipelineStateUsingImageBlock;
  MTLComputePipelineState *v32;
  MTLComputePipelineState *createLTMGainMapPipelineStateWithoutImageBlock;
  MTLComputePipelineState *v34;
  MTLComputePipelineState *v35;
  MTLComputePipelineState *v36;
  MTLComputePipelineState *v37;
  MTLComputePipelineState *v38;
  MTLComputePipelineState *v39;
  MTLComputePipelineState *v40;
  MTLComputePipelineState *v41;
  MTLComputePipelineState *v42;
  MTLComputePipelineState *renderingParamsFromStatsPipelineState;
  MTLComputePipelineState *v44;
  MTLComputePipelineState *encodeLinearPipelineState;
  int v46;
  __int16 v48;

  v3 = a3;
  v48 = 0;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("imageReduction"), 0);
  v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  imageReduction = self->_imageReduction;
  self->_imageReduction = v5;

  if (!self->_imageReduction)
    goto LABEL_58;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("updateBaseGainWithStats"), 0);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  updateBaseGainWithStats = self->_updateBaseGainWithStats;
  self->_updateBaseGainWithStats = v7;

  if (!self->_updateBaseGainWithStats)
    goto LABEL_58;
  if ((v3 & 1) != 0)
  {
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("imageReduction"), 0);
    v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v10 = self->_imageReduction;
    self->_imageReduction = v9;

    if (!self->_imageReduction)
      goto LABEL_58;
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("updateBaseGainWithStats"), 0);
    v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v12 = self->_updateBaseGainWithStats;
    self->_updateBaseGainWithStats = v11;

    if (!self->_updateBaseGainWithStats)
      goto LABEL_58;
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("calculateLocalHistogramStats_all"), 0);
    v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    localHistogramStatsAll = self->_localHistogramStatsAll;
    self->_localHistogramStatsAll = v13;

    if (!self->_localHistogramStatsAll)
      goto LABEL_58;
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("calculateGlobalHistogram"), 0);
    v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    globalHistogramPipelineState = self->_globalHistogramPipelineState;
    self->_globalHistogramPipelineState = v15;

    if (!self->_globalHistogramPipelineState)
      goto LABEL_58;
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("sumPersonAndSkinCounts"), 0);
    v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    sumPersonAndSkinCounts = self->_sumPersonAndSkinCounts;
    self->_sumPersonAndSkinCounts = v17;

    if (!self->_sumPersonAndSkinCounts)
      goto LABEL_58;
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("calculateGlobalStats"), 0);
    v19 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    globalStatsPipelineState = self->_globalStatsPipelineState;
    self->_globalStatsPipelineState = v19;

    if (!self->_globalStatsPipelineState)
      goto LABEL_58;
  }
  if ((v3 & 2) == 0)
  {
    v21 = 0;
    if ((v3 & 4) == 0)
      goto LABEL_33;
LABEL_32:
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("encodeLinear"), 0);
    v44 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    encodeLinearPipelineState = self->_encodeLinearPipelineState;
    self->_encodeLinearPipelineState = v44;

    if (self->_encodeLinearPipelineState)
      goto LABEL_33;
    goto LABEL_60;
  }
  v22 = (void *)objc_opt_new();
  v21 = v22;
  if (!v22)
    goto LABEL_60;
  LOBYTE(v48) = 1;
  objc_msgSend(v22, "setConstantValue:type:atIndex:", &v48, 53, 0);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("createGuide"), v21);
  v23 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  createGuidePipelineStateUsingImageBlock = self->_createGuidePipelineStateUsingImageBlock;
  self->_createGuidePipelineStateUsingImageBlock = v23;

  if (!self->_createGuidePipelineStateUsingImageBlock)
    goto LABEL_60;
  v25 = (void *)objc_opt_new();

  if (!v25)
    goto LABEL_58;
  LOBYTE(v48) = 0;
  objc_msgSend(v25, "setConstantValue:type:atIndex:", &v48, 53, 0);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("createGuide"), v25);
  v26 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  createGuidePipelineStateWithoutImageBlock = self->_createGuidePipelineStateWithoutImageBlock;
  self->_createGuidePipelineStateWithoutImageBlock = v26;

  if (!self->_createGuidePipelineStateWithoutImageBlock)
    goto LABEL_59;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("YCbCrToRGBColorConversion"), 0);
  v28 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  YCbCrToRGBColorConversionPipelineState = self->_YCbCrToRGBColorConversionPipelineState;
  self->_YCbCrToRGBColorConversionPipelineState = v28;

  if (!self->_YCbCrToRGBColorConversionPipelineState)
    goto LABEL_59;
  v21 = (void *)objc_opt_new();

  if (!v21)
    goto LABEL_60;
  LOBYTE(v48) = 1;
  objc_msgSend(v21, "setConstantValue:type:atIndex:", &v48, 53, 0);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("createLTMGainMap"), v21);
  v30 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  createLTMGainMapPipelineStateUsingImageBlock = self->_createLTMGainMapPipelineStateUsingImageBlock;
  self->_createLTMGainMapPipelineStateUsingImageBlock = v30;

  if (!self->_createLTMGainMapPipelineStateUsingImageBlock)
    goto LABEL_60;
  v25 = (void *)objc_opt_new();

  if (!v25)
    goto LABEL_58;
  LOBYTE(v48) = 0;
  objc_msgSend(v25, "setConstantValue:type:atIndex:", &v48, 53, 0);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("createLTMGainMap"), v25);
  v32 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  createLTMGainMapPipelineStateWithoutImageBlock = self->_createLTMGainMapPipelineStateWithoutImageBlock;
  self->_createLTMGainMapPipelineStateWithoutImageBlock = v32;

  if (!self->_createLTMGainMapPipelineStateWithoutImageBlock)
    goto LABEL_59;
  v21 = (void *)objc_opt_new();

  if (!v21)
    goto LABEL_60;
  v48 = 1;
  objc_msgSend(v21, "setConstantValue:type:atIndex:", &v48, 53, 0);
  objc_msgSend(v21, "setConstantValue:type:atIndex:", (char *)&v48 + 1, 53, 1);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("renderFinalAdjustments"), v21);
  v34 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v35 = self->_renderSmartStylePipelineStateUsingImageBlock[0];
  self->_renderSmartStylePipelineStateUsingImageBlock[0] = v34;

  if (!self->_renderSmartStylePipelineStateUsingImageBlock[0])
    goto LABEL_60;
  v25 = (void *)objc_opt_new();

  if (!v25)
    goto LABEL_58;
  LOBYTE(v48) = 0;
  objc_msgSend(v25, "setConstantValue:type:atIndex:", &v48, 53, 0);
  objc_msgSend(v25, "setConstantValue:type:atIndex:", (char *)&v48 + 1, 53, 1);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("renderFinalAdjustments"), v25);
  v36 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v37 = self->_renderSmartStylePipelineStateWithoutImageBlock[0];
  self->_renderSmartStylePipelineStateWithoutImageBlock[0] = v36;

  if (!self->_renderSmartStylePipelineStateWithoutImageBlock[0])
  {
LABEL_59:
    FigDebugAssert3();
    FigSignalErrorAt();
    v46 = 1;
    v21 = v25;
    goto LABEL_34;
  }
  v21 = (void *)objc_opt_new();

  if (!v21)
    goto LABEL_60;
  v48 = 257;
  objc_msgSend(v21, "setConstantValue:type:atIndex:", &v48, 53, 0);
  objc_msgSend(v21, "setConstantValue:type:atIndex:", (char *)&v48 + 1, 53, 1);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("renderFinalAdjustments"), v21);
  v38 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v39 = self->_renderSmartStylePipelineStateUsingImageBlock[1];
  self->_renderSmartStylePipelineStateUsingImageBlock[1] = v38;

  if (!self->_renderSmartStylePipelineStateUsingImageBlock[1])
  {
LABEL_60:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_61;
  }
  v25 = (void *)objc_opt_new();

  if (!v25)
  {
LABEL_58:
    FigDebugAssert3();
    FigSignalErrorAt();
    v21 = 0;
LABEL_61:
    v46 = 1;
    goto LABEL_34;
  }
  LOBYTE(v48) = 0;
  objc_msgSend(v25, "setConstantValue:type:atIndex:", &v48, 53, 0);
  objc_msgSend(v25, "setConstantValue:type:atIndex:", (char *)&v48 + 1, 53, 1);
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("renderFinalAdjustments"), v25);
  v40 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v41 = self->_renderSmartStylePipelineStateWithoutImageBlock[1];
  self->_renderSmartStylePipelineStateWithoutImageBlock[1] = v40;

  if (!self->_renderSmartStylePipelineStateWithoutImageBlock[1])
    goto LABEL_59;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("RenderingParamsFromStats"), 0);
  v42 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  renderingParamsFromStatsPipelineState = self->_renderingParamsFromStatsPipelineState;
  self->_renderingParamsFromStatsPipelineState = v42;

  if (!self->_renderingParamsFromStatsPipelineState)
    goto LABEL_59;
  v21 = v25;
  if ((v3 & 4) != 0)
    goto LABEL_32;
LABEL_33:
  v46 = 0;
LABEL_34:

  return v46;
}

- (void)_updateColorManagementForInputs
{
  _BYTE v3[60];

  -[CMISmartStyleMetalRendererV1 _configureColorConversion:forTexture:isOutput:](self, "_configureColorConversion:forTexture:isOutput:", &self->_colorManagement, self->_inputImageTexture, 0);
  if (self->_inputLinearImageLumaTexture && self->_inputLinearImageChromaTexture || self->_inputLinearImageTexture)
    -[CMISmartStyleMetalRendererV1 _configureColorConversion:forTexture:isOutput:](self, "_configureColorConversion:forTexture:isOutput:", &self->_anon_90[48]);
  *(_OWORD *)&v3[12] = *MEMORY[0x1E0C83FE8];
  *(_OWORD *)&v3[28] = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  *(_OWORD *)&v3[44] = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
  *(_DWORD *)&self->_anon_90[112] = 3;
  *(_OWORD *)&self->_anon_90[160] = *(_OWORD *)&v3[44];
  *(_OWORD *)&self->_anon_90[116] = *(_OWORD *)v3;
  *(_OWORD *)&self->_anon_90[132] = *(_OWORD *)&v3[16];
  *(_OWORD *)&self->_anon_90[148] = *(_OWORD *)&v3[32];
  -[CMISmartStyleMetalRendererV1 _configureColorConversion:forTexture:isOutput:](self, "_configureColorConversion:forTexture:isOutput:", &self->_anon_90[176], self->_outputImageTexture, 1);
}

- (void)_updateHazeTuningAdjustments:(id *)a3
{
  float var2;
  long double v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float32x2_t v11;
  float32x2_t v12;
  float v13;
  float v14;

  if (a3)
  {
    var2 = a3->var2;
    a3->var12.var0 = 0;
    if (var2 > 0.0)
    {
      v14 = var2;
      v5 = log2(a3->var16 / 12.5);
      v6 = 1.0 / (exp(v5 * -2.0 + 0.699999988) + 1.0);
      v13 = v6;
      a3->var12.var1 = v14 * -0.5;
      a3->var12.var0 = 1;
      v7 = (float)(v6 * -0.1) + 1.0;
      v8 = (float)(v6 * 0.2) + 0.03;
      v9 = (float)(v6 * -0.11) + 0.04;
      v10 = powf(v14, 0.75);
      v11 = vdiv_f32((float32x2_t)0x461720004620F000, vmla_n_f32((float32x2_t)0x4250000042480000, (float32x2_t)0x43060000431C0000, v13));
      v12 = (float32x2_t)vdup_n_s32(0x47C35000u);
      a3->var12.var6 = (float)((float)(v7 + -1.0) * v10) + 1.0;
      *(float32x2_t *)&a3->var12.var2 = vdiv_f32(vmul_f32(v11, v12), vmla_n_f32(v11, vsub_f32(v12, v11), v10));
      *(float32x2_t *)&a3->var12.var4 = vmla_n_f32(0, vmul_n_f32(vmla_n_f32((float32x2_t)0x3F0000003F000000, (float32x2_t)0xBF8CCCCDBF400000, v13), v14), v10);
      a3->var12.var7 = (float)(v8 * v10) + 0.0;
      a3->var12.var8 = (float)(v9 * v10) + 0.0;
    }
  }
  else
  {
    FigDebugAssert3();
  }
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
    if (objc_msgSend(v19, "colorSpace") == 4 && a3->var0 == 4)
      a3->var0 = 3;
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

- (int)_setupStatsAndRenderParamBuffer
{
  MTLBuffer *v3;
  MTLBuffer *statsBuf;
  MTLBuffer *v5;
  MTLBuffer *paramsBuf;
  void *v7;
  void *v8;

  v3 = -[CMISmartStyleMetalRendererV1 _newBufferWithLength:label:sharedAccess:](self, "_newBufferWithLength:label:sharedAccess:", 10636, CFSTR("SSR_BUF_STATS"), 1);
  statsBuf = self->_statsBuf;
  self->_statsBuf = v3;

  if (self->_statsBuf)
  {
    v5 = -[CMISmartStyleMetalRendererV1 _newBufferWithLength:label:sharedAccess:](self, "_newBufferWithLength:label:sharedAccess:", 664, CFSTR("SSR_BUF_PARAMS"), 1);
    paramsBuf = self->_paramsBuf;
    self->_paramsBuf = v5;

    if (self->_paramsBuf)
    {
      if ((self->_processingType & 1) == 0)
      {
        bzero((void *)-[MTLBuffer contents](self->_statsBuf, "contents"), 0x298CuLL);
LABEL_7:
        bzero((void *)-[MTLBuffer contents](self->_paramsBuf, "contents"), 0x298uLL);
        return 0;
      }
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "blitCommandEncoder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "fillBuffer:range:value:", self->_statsBuf, 0, -[MTLBuffer length](self->_statsBuf, "length"), 0);
        objc_msgSend(v8, "endEncoding");
        -[FigMetalContext commit](self->_metalContext, "commit");

        goto LABEL_7;
      }
    }
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_populateStaticRenderParametersFromTuning:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  int v12;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  float *v24;
  float *v25;
  float *v26;
  float v27;
  int v28;
  float faceBasedGlobalExposureBoostRatio;
  int v30;

  v4 = a3;
  -[CMISmartStyleV1 castType](self->_inputStyle, "castType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMISmartStyleV1 castIntensity](self->_inputStyle, "castIntensity");
  v7 = v6;
  -[CMISmartStyleV1 toneBias](self->_inputStyle, "toneBias");
  v9 = v8;
  -[CMISmartStyleV1 colorBias](self->_inputStyle, "colorBias");
  v11 = v10;
  v12 = isSystemStyleCastType(v5);
  v13 = self->_tuningParameterVariant;
  if ((isValidTuningType(v13) & 1) != 0)
  {
    v14 = -[MTLBuffer contents](self->_paramsBuf, "contents");
    if (!v14)
    {
      FigDebugAssert3();
      v30 = FigSignalErrorAt();
      goto LABEL_21;
    }
    v15 = v14;
    objc_msgSend(v4, "castAdjustmentsTuning");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_24;
    objc_msgSend(v17, "getValue:size:", v15 + 36, 132);
    objc_msgSend(v4, "toneAdjustmentsTuning");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19
      || (objc_msgSend(v19, "getValue:size:", v15 + 168, 264),
          objc_msgSend(v4, "colorAdjustmentsTuning"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "objectForKeyedSubscript:", v5),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v20,
          !v21))
    {
LABEL_24:
      FigDebugAssert3();
      v30 = -12780;
      goto LABEL_21;
    }
    objc_msgSend(v21, "getValue:size:", v15 + 432, 16);
    v22 = SSRSceneTypeEnumFromSemanticStyleSceneType(self->_semanticStyleSceneType);
    v23 = v22;
    if (v22 == 21)
    {
      v24 = (float *)(v15 + 416);
      v25 = (float *)(v15 + 420);
      v26 = (float *)(v15 + 424);
    }
    else
    {
      if (v22 != 3)
      {
LABEL_11:
        *(_DWORD *)v15 = SSRCastTypeEnumFromString(v5);
        *(float *)(v15 + 4) = v7;
        *(float *)(v15 + 8) = v9;
        *(float *)(v15 + 12) = v11;
        *(_DWORD *)(v15 + 648) = SSRTuningTypeEnumFromString(v13);
        if (v7 >= 0.5)
          v27 = (float)(v7 * 1.5) + -0.5;
        else
          v27 = v7 * 0.5;
        if (!v12)
          v27 = v7;
        *(float *)(v15 + 16) = v7;
        *(float *)(v15 + 20) = v27;
        *(float *)(v15 + 24) = self->_inputLinearBaseGain;
        *(float *)(v15 + 28) = self->_baselineExposure;
        -[CMISmartStyleMetalRendererV1 _sceneBrightnessValue](self, "_sceneBrightnessValue");
        *(_DWORD *)(v15 + 644) = v28;
        *(_DWORD *)(v15 + 32) = v23;
        if (self->_useFaceBasedGlobalExposureBoostRatio)
          faceBasedGlobalExposureBoostRatio = self->_faceBasedGlobalExposureBoostRatio;
        else
          faceBasedGlobalExposureBoostRatio = 1.0;
        *(float *)(v15 + 660) = faceBasedGlobalExposureBoostRatio;
        -[CMISmartStyleMetalRendererV1 _updateHazeTuningAdjustments:](self, "_updateHazeTuningAdjustments:", v15);
        *(_QWORD *)(v15 + 652) = 0x3E8000003D4CCCCDLL;

        goto LABEL_20;
      }
      v24 = (float *)(v15 + 404);
      v25 = (float *)(v15 + 408);
      v26 = (float *)(v15 + 412);
    }
    v11 = v11 * *v25;
    v9 = v9 * *v24;
    v7 = v7 * *v26;
    goto LABEL_11;
  }
  FigDebugAssert3();
LABEL_20:
  v30 = 0;
LABEL_21:

  return v30;
}

- (int)_populatePreComputedStats:(id *)a3 inputStatisticsByStatsType:(id)a4
{
  if (!a4)
    return FigSignalErrorAt();
  SSRPopulateStatsWithDictionary((uint64_t)a3, a4);
  *(_QWORD *)&a3->var2 = 0;
  return 0;
}

- (int)_updateRenderPipelineConfigForInputs
{
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  MTLTexture *inputLinearImageTexture;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;

  *(_WORD *)&self->_shouldUpsampleInputPersonMask = 0;
  if (self->_inputPersonMaskTexture)
  {
    v3 = -[MTLTexture width](self->_inputImageTexture, "width") + 1;
    v4 = -[MTLTexture height](self->_inputImageTexture, "height");
    v5 = -[MTLTexture width](self->_inputPersonMaskTexture, "width") < v3 >> 1
      || -[MTLTexture height](self->_inputPersonMaskTexture, "height") < (unint64_t)(v4 + 1) >> 1;
    self->_shouldUpsampleInputPersonMask = v5;
  }
  inputLinearImageTexture = self->_inputLinearImageTexture;
  if (inputLinearImageTexture)
  {
    v7 = -[MTLTexture width](inputLinearImageTexture, "width");
    if (v7 >= -[MTLTexture width](self->_inputImageTexture, "width"))
    {
      v9 = -[MTLTexture height](self->_inputLinearImageTexture, "height");
      v8 = v9 < -[MTLTexture height](self->_inputImageTexture, "height");
    }
    else
    {
      v8 = 1;
    }
    self->_shouldCreateLTMGainMap = v8;
  }
  return 0;
}

- (int)_checkROISpecification
{
  double v3;
  double v4;
  unint64_t v6;
  uint64_t v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  unint64_t v32;
  double height;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  unint64_t v46;
  MTLTexture *inputLinearImageTexture;
  CGFloat v48;
  unint64_t v49;
  MTLTexture *bgLTMGainMapTexture;
  CGFloat v51;
  unint64_t v52;
  MTLTexture *fgLTMGainMapTexture;
  CGFloat v54;
  unint64_t v55;
  CGFloat v56;
  unint64_t v57;
  CGFloat v58;
  unint64_t v59;
  CGFloat v60;
  unint64_t v61;
  CGFloat v62;
  unint64_t v63;
  CGFloat v64;
  unint64_t v65;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v4 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (self->_logicalImageSize.width == *MEMORY[0x1E0C9D820] && self->_logicalImageSize.height == v3)
  {
    v6 = -[MTLTexture width](self->_inputImageTexture, "width");
    if (v6 <= -[MTLTexture width](self->_outputImageTexture, "width"))
      v7 = 72;
    else
      v7 = 32;
    v8 = (double)(unint64_t)objc_msgSend(*(id *)((char *)&self->super.isa + v7), "width");
    v9 = -[MTLTexture height](self->_inputImageTexture, "height");
    if (v9 <= -[MTLTexture height](self->_outputImageTexture, "height"))
      v10 = 72;
    else
      v10 = 32;
    v11 = objc_msgSend(*(id *)((char *)&self->super.isa + v10), "height");
    self->_logicalImageSize.width = v8;
    self->_logicalImageSize.height = (double)v11;
  }
  if (CGRectIsEmpty(self->_inputImageTextureMappedRegion))
  {
    v12 = (double)(unint64_t)-[MTLTexture width](self->_inputImageTexture, "width");
    v13 = (double)(unint64_t)-[MTLTexture height](self->_inputImageTexture, "height");
    self->_inputImageTextureMappedRegion.origin.x = 0.0;
    self->_inputImageTextureMappedRegion.origin.y = 0.0;
    self->_inputImageTextureMappedRegion.size.width = v12;
    self->_inputImageTextureMappedRegion.size.height = v13;
  }
  if (self->_inputImageTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputImageTexture, "width")|| self->_inputImageTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputImageTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_inputLinearImageTextureMappedRegion))
  {
    v14 = (double)(unint64_t)-[MTLTexture width](self->_inputLinearImageTexture, "width");
    v15 = (double)(unint64_t)-[MTLTexture height](self->_inputLinearImageTexture, "height");
    self->_inputLinearImageTextureMappedRegion.origin.x = 0.0;
    self->_inputLinearImageTextureMappedRegion.origin.y = 0.0;
    self->_inputLinearImageTextureMappedRegion.size.width = v14;
    self->_inputLinearImageTextureMappedRegion.size.height = v15;
  }
  if (self->_inputLinearImageTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputLinearImageTexture, "width")|| self->_inputLinearImageTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputLinearImageTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_inputBgLTMGainMapTextureMappedRegion))
  {
    v16 = (double)(unint64_t)-[MTLTexture width](self->_bgLTMGainMapTexture, "width");
    v17 = (double)(unint64_t)-[MTLTexture height](self->_bgLTMGainMapTexture, "height");
    self->_inputBgLTMGainMapTextureMappedRegion.origin.x = 0.0;
    self->_inputBgLTMGainMapTextureMappedRegion.origin.y = 0.0;
    self->_inputBgLTMGainMapTextureMappedRegion.size.width = v16;
    self->_inputBgLTMGainMapTextureMappedRegion.size.height = v17;
  }
  if (self->_inputBgLTMGainMapTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_bgLTMGainMapTexture, "width")|| self->_inputBgLTMGainMapTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_bgLTMGainMapTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_inputFgLTMGainMapTextureMappedRegion))
  {
    v18 = (double)(unint64_t)-[MTLTexture width](self->_fgLTMGainMapTexture, "width");
    v19 = (double)(unint64_t)-[MTLTexture height](self->_fgLTMGainMapTexture, "height");
    self->_inputFgLTMGainMapTextureMappedRegion.origin.x = 0.0;
    self->_inputFgLTMGainMapTextureMappedRegion.origin.y = 0.0;
    self->_inputFgLTMGainMapTextureMappedRegion.size.width = v18;
    self->_inputFgLTMGainMapTextureMappedRegion.size.height = v19;
  }
  if (self->_inputFgLTMGainMapTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_fgLTMGainMapTexture, "width")|| self->_inputFgLTMGainMapTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_fgLTMGainMapTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_inputLightMapTextureMappedRegion))
  {
    v20 = (double)(unint64_t)-[MTLTexture width](self->_inputLightMapTexture, "width");
    v21 = (double)(unint64_t)-[MTLTexture height](self->_inputLightMapTexture, "height");
    self->_inputLightMapTextureMappedRegion.origin.x = 0.0;
    self->_inputLightMapTextureMappedRegion.origin.y = 0.0;
    self->_inputLightMapTextureMappedRegion.size.width = v20;
    self->_inputLightMapTextureMappedRegion.size.height = v21;
  }
  if (self->_inputLightMapTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputLightMapTexture, "width")|| self->_inputLightMapTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputLightMapTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_inputLinearLightMapTextureMappedRegion))
  {
    v22 = (double)(unint64_t)-[MTLTexture width](self->_inputLinearLightMapTexture, "width");
    v23 = (double)(unint64_t)-[MTLTexture height](self->_inputLinearLightMapTexture, "height");
    self->_inputLinearLightMapTextureMappedRegion.origin.x = 0.0;
    self->_inputLinearLightMapTextureMappedRegion.origin.y = 0.0;
    self->_inputLinearLightMapTextureMappedRegion.size.width = v22;
    self->_inputLinearLightMapTextureMappedRegion.size.height = v23;
  }
  if (self->_inputLinearLightMapTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_inputLinearLightMapTexture, "width")|| self->_inputLinearLightMapTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_inputLinearLightMapTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_inputPersonMaskTextureMappedRegion))
  {
    v24 = (double)(unint64_t)-[MTLTexture width](self->_fgbgMatteTexture, "width");
    v25 = (double)(unint64_t)-[MTLTexture height](self->_fgbgMatteTexture, "height");
    self->_inputPersonMaskTextureMappedRegion.origin.x = 0.0;
    self->_inputPersonMaskTextureMappedRegion.origin.y = 0.0;
    self->_inputPersonMaskTextureMappedRegion.size.width = v24;
    self->_inputPersonMaskTextureMappedRegion.size.height = v25;
  }
  if (self->_inputPersonMaskTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_fgbgMatteTexture, "width")|| self->_inputPersonMaskTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_fgbgMatteTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_inputSkinMaskTextureMappedRegion))
  {
    v26 = (double)(unint64_t)-[MTLTexture width](self->_skinMatteTexture, "width");
    v27 = (double)(unint64_t)-[MTLTexture height](self->_skinMatteTexture, "height");
    self->_inputSkinMaskTextureMappedRegion.origin.x = 0.0;
    self->_inputSkinMaskTextureMappedRegion.origin.y = 0.0;
    self->_inputSkinMaskTextureMappedRegion.size.width = v26;
    self->_inputSkinMaskTextureMappedRegion.size.height = v27;
  }
  if (self->_inputSkinMaskTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_skinMatteTexture, "width")|| self->_inputSkinMaskTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_skinMatteTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_inputSkyMaskTextureMappedRegion))
  {
    v28 = (double)(unint64_t)-[MTLTexture width](self->_skyMatteTexture, "width");
    v29 = (double)(unint64_t)-[MTLTexture height](self->_skyMatteTexture, "height");
    self->_inputSkyMaskTextureMappedRegion.origin.x = 0.0;
    self->_inputSkyMaskTextureMappedRegion.origin.y = 0.0;
    self->_inputSkyMaskTextureMappedRegion.size.width = v28;
    self->_inputSkyMaskTextureMappedRegion.size.height = v29;
  }
  if (self->_inputSkyMaskTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_skyMatteTexture, "width")|| self->_inputSkyMaskTextureMappedRegion.size.height != (double)(unint64_t)-[MTLTexture height](self->_skyMatteTexture, "height"))
  {
    goto LABEL_89;
  }
  if (CGRectIsEmpty(self->_outputImageTextureMappedRegion))
  {
    v30 = (double)(unint64_t)-[MTLTexture width](self->_outputImageTexture, "width");
    v31 = (double)(unint64_t)-[MTLTexture height](self->_outputImageTexture, "height");
    self->_outputImageTextureMappedRegion.origin.x = 0.0;
    self->_outputImageTextureMappedRegion.origin.y = 0.0;
    self->_outputImageTextureMappedRegion.size.width = v30;
    self->_outputImageTextureMappedRegion.size.height = v31;
  }
  if (self->_outputImageTextureMappedRegion.size.width != (double)(unint64_t)-[MTLTexture width](self->_outputImageTexture, "width"))goto LABEL_89;
  v32 = -[MTLTexture height](self->_outputImageTexture, "height");
  height = self->_outputImageTextureMappedRegion.size.height;
  if (height != (double)v32)
    goto LABEL_89;
  x = self->_outputImageTextureMappedRegion.origin.x;
  y = self->_outputImageTextureMappedRegion.origin.y;
  width = self->_outputImageTextureMappedRegion.size.width;
  v67 = CGRectIntersection(self->_inputImageTextureMappedRegion, *(CGRect *)(&height - 3));
  v70.size.width = self->_logicalImageSize.width;
  v70.size.height = self->_logicalImageSize.height;
  v70.origin.x = 0.0;
  v70.origin.y = 0.0;
  v68 = CGRectIntersection(v67, v70);
  v37 = v68.origin.x;
  v38 = v68.origin.y;
  v39 = v68.size.width;
  v40 = v68.size.height;
  if (CGRectIsEmpty(v68))
    goto LABEL_89;
  if (CGRectIsEmpty(self->_renderRegionRect))
  {
    self->_renderRegionRect.origin.x = v37;
    self->_renderRegionRect.origin.y = v38;
    v41 = v37;
    self->_renderRegionRect.size.width = v39;
    v42 = v38;
    v43 = v39;
    v44 = v40;
    self->_renderRegionRect.size.height = v40;
  }
  else
  {
    v41 = self->_renderRegionRect.origin.x;
    v42 = self->_renderRegionRect.origin.y;
    v43 = self->_renderRegionRect.size.width;
    v44 = self->_renderRegionRect.size.height;
  }
  v69.origin.x = v37;
  v69.origin.y = v38;
  v69.size.width = v39;
  v69.size.height = v40;
  if (CGRectContainsRect(v69, *(CGRect *)&v41))
  {
    if (self->_logicalImageToInputImageScale.width == v4 && self->_logicalImageToInputImageScale.height == v3)
    {
      v45 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_inputImageTexture, "width"));
      v46 = -[MTLTexture height](self->_inputImageTexture, "height");
      self->_logicalImageToInputImageScale.width = v45;
      self->_logicalImageToInputImageScale.height = (float)(1.0 / (float)v46);
    }
    inputLinearImageTexture = self->_inputLinearImageTexture;
    if (inputLinearImageTexture
      && self->_logicalImageToInputLinearImageScale.width == v4
      && self->_logicalImageToInputLinearImageScale.height == v3)
    {
      v48 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](inputLinearImageTexture, "width"));
      v49 = -[MTLTexture height](self->_inputLinearImageTexture, "height");
      self->_logicalImageToInputLinearImageScale.width = v48;
      self->_logicalImageToInputLinearImageScale.height = (float)(1.0 / (float)v49);
    }
    bgLTMGainMapTexture = self->_bgLTMGainMapTexture;
    if (bgLTMGainMapTexture
      && self->_logicalImageToBgLTMGainMapScale.width == v4
      && self->_logicalImageToBgLTMGainMapScale.height == v3)
    {
      v51 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](bgLTMGainMapTexture, "width"));
      v52 = -[MTLTexture height](self->_bgLTMGainMapTexture, "height");
      self->_logicalImageToBgLTMGainMapScale.width = v51;
      self->_logicalImageToBgLTMGainMapScale.height = (float)(1.0 / (float)v52);
    }
    fgLTMGainMapTexture = self->_fgLTMGainMapTexture;
    if (fgLTMGainMapTexture
      && self->_logicalImageToFgLTMGainMapScale.width == v4
      && self->_logicalImageToFgLTMGainMapScale.height == v3)
    {
      v54 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](fgLTMGainMapTexture, "width"));
      v55 = -[MTLTexture height](self->_fgLTMGainMapTexture, "height");
      self->_logicalImageToFgLTMGainMapScale.width = v54;
      self->_logicalImageToFgLTMGainMapScale.height = (float)(1.0 / (float)v55);
    }
    if (self->_logicalImageToInputLightMapScale.width == v4 && self->_logicalImageToInputLightMapScale.height == v3)
    {
      v56 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_inputLightMapTexture, "width"));
      v57 = -[MTLTexture height](self->_inputLightMapTexture, "height");
      self->_logicalImageToInputLightMapScale.width = v56;
      self->_logicalImageToInputLightMapScale.height = (float)(1.0 / (float)v57);
    }
    if (self->_logicalImageToInputLinearLightMapScale.width == v4
      && self->_logicalImageToInputLinearLightMapScale.height == v3)
    {
      v58 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_inputLinearLightMapTexture, "width"));
      v59 = -[MTLTexture height](self->_inputLinearLightMapTexture, "height");
      self->_logicalImageToInputLinearLightMapScale.width = v58;
      self->_logicalImageToInputLinearLightMapScale.height = (float)(1.0 / (float)v59);
    }
    if (self->_logicalImageToInputPersonMaskScale.width == v4 && self->_logicalImageToInputPersonMaskScale.height == v3)
    {
      v60 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_fgbgMatteTexture, "width"));
      v61 = -[MTLTexture height](self->_fgbgMatteTexture, "height");
      self->_logicalImageToInputPersonMaskScale.width = v60;
      self->_logicalImageToInputPersonMaskScale.height = (float)(1.0 / (float)v61);
    }
    if (self->_logicalImageToInputSkinMaskScale.width == v4 && self->_logicalImageToInputSkinMaskScale.height == v3)
    {
      v62 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_skinMatteTexture, "width"));
      v63 = -[MTLTexture height](self->_skinMatteTexture, "height");
      self->_logicalImageToInputSkinMaskScale.width = v62;
      self->_logicalImageToInputSkinMaskScale.height = (float)(1.0 / (float)v63);
    }
    if (self->_logicalImageToInputSkyMaskScale.width == v4 && self->_logicalImageToInputSkyMaskScale.height == v3)
    {
      v64 = (float)(1.0 / (float)(unint64_t)-[MTLTexture width](self->_skyMatteTexture, "width"));
      v65 = -[MTLTexture height](self->_skyMatteTexture, "height");
      self->_logicalImageToInputSkyMaskScale.width = v64;
      self->_logicalImageToInputSkyMaskScale.height = (float)(1.0 / (float)v65);
    }
    return 0;
  }
  else
  {
LABEL_89:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)_convertLinearYCbCrToRGB:(id)a3 inputChromaTexture:(id)a4 outputRGBTexture:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTLTexture *inputLinearImageLumaTexture;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  MTLComputePipelineState *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  unint64_t v20;
  int v21;
  uint64_t v23;
  _QWORD v24[3];
  _QWORD v25[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  inputLinearImageLumaTexture = self->_inputLinearImageLumaTexture;
  if (!inputLinearImageLumaTexture || !self->_inputLinearImageChromaTexture)
    goto LABEL_9;
  if (!v10)
  {
    LOBYTE(v23) = 1;
    v10 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 115, -[MTLTexture width](inputLinearImageLumaTexture, "width"), -[MTLTexture height](self->_inputLinearImageLumaTexture, "height"), 7, CFSTR("SSR_LINEAR_IMAGE_RGB_TEXTURE"), 0, v23);
    if (!v10)
    {
LABEL_13:
      FigDebugAssert3();
      v21 = FigSignalErrorAt();
      goto LABEL_10;
    }
    objc_storeStrong((id *)&self->_inputLinearImageTexture, v10);
  }
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_13;
  v13 = v12;
  objc_msgSend(v12, "computeCommandEncoder");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    FigDebugAssert3();
    v21 = FigSignalErrorAt();

    goto LABEL_10;
  }
  v15 = (void *)v14;
  v16 = self->_YCbCrToRGBColorConversionPipelineState;
  objc_msgSend(v15, "setComputePipelineState:", v16);
  objc_msgSend(v15, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v9, 1);
  objc_msgSend(v15, "setTexture:atIndex:", v10, 2);
  v17 = -[MTLComputePipelineState threadExecutionWidth](v16, "threadExecutionWidth");
  v18 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v16, "maxTotalThreadsPerThreadgroup");
  v19 = v9;
  v20 = v18 / -[MTLComputePipelineState threadExecutionWidth](v16, "threadExecutionWidth");
  v25[0] = objc_msgSend(v8, "width");
  v25[1] = objc_msgSend(v8, "height");
  v25[2] = 1;
  v24[0] = v17;
  v24[1] = v20;
  v9 = v19;
  v24[2] = 1;
  objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v25, v24);
  objc_msgSend(v15, "endEncoding");
  -[FigMetalContext commit](self->_metalContext, "commit");

LABEL_9:
  v21 = 0;
LABEL_10:

  return v21;
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
  v5 = (double *)&qword_1D33055F0;
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
  v8 = &qword_1D3305608;
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
  v18 = (double *)&qword_1D3305600;
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
  v26 = (double *)&qword_1D3305668;
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
    v38 = (double *)&qword_1D3305670;
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
    v41 = (double *)((char *)&unk_1D33055E0 + 16 * (int)v39);
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
  v49 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](self, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 55, 256, 1, 7, CFSTR("SmartStyleMetalRender_CubicSPlineCurveTexture"), 1, v54);
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
  CMISmartStyleMetalRendererV1 *v58;
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
            v19 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](v58, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 125, 360, 4, 7, v18, (objc_msgSend(v5, "count") & 1) == 0, v38);

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
            v21 = -[CMISmartStyleMetalRendererV1 _newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:](v58, "_newTexture2DWithFormat:width:height:usage:label:retainUntilPurge:useFigMetalAllocator:", 125, 360, 4, 7, v20, objc_msgSend(v5, "count") & 1, v39);

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

- (void)_encodeRenderRegion:(id *)a3
{
  int32x2_t v5;
  float32x2_t v6;
  unint64_t v7;
  float32x2_t v8;
  float32x2_t v9;
  __int128 v10;
  MTLTexture *inputLinearImageTexture;
  float32x2_t v12;
  unint64_t v13;
  float32x2_t v14;
  float32x2_t v15;
  __int128 v16;
  MTLTexture *bgLTMGainMapTexture;
  float32x2_t v18;
  unint64_t v19;
  float32x2_t v20;
  float32x2_t v21;
  __int128 v22;
  MTLTexture *fgLTMGainMapTexture;
  float32x2_t v24;
  unint64_t v25;
  float32x2_t v26;
  float32x2_t v27;
  __int128 v28;
  float32x2_t v29;
  unint64_t v30;
  float32x2_t v31;
  float32x2_t v32;
  __int128 v33;
  float32x2_t v34;
  unint64_t v35;
  float32x2_t v36;
  float32x2_t v37;
  __int128 v38;
  float32x2_t v39;
  unint64_t v40;
  float32x2_t v41;
  float32x2_t v42;
  __int128 v43;
  float32x2_t v44;
  unint64_t v45;
  float32x2_t v46;
  float32x2_t v47;
  __int128 v48;
  float32x2_t v49;
  unint64_t v50;
  float32x2_t v51;
  float32x2_t v52;
  __int128 v53;
  int32x2_t v54;
  int32x2_t v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;

  v5 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_logicalImageSize));
  *((_WORD *)a3 + 1) = v5.i16[2];
  *(_WORD *)a3 = v5.i16[0];
  v6 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputImageTextureMappedRegion.origin));
  v56 = (float)(unint64_t)-[MTLTexture width](self->_inputImageTexture, "width");
  v7 = -[MTLTexture height](self->_inputImageTexture, "height");
  v8.f32[0] = v56;
  v8.f32[1] = (float)v7;
  v9 = vdiv_f32(v6, v8);
  *(float32x2_t *)&v10 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputImageScale);
  *((float32x2_t *)&v10 + 1) = v9;
  *((_OWORD *)a3 + 1) = v10;
  inputLinearImageTexture = self->_inputLinearImageTexture;
  if (inputLinearImageTexture)
  {
    v12 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputLinearImageTextureMappedRegion.origin));
    v57 = (float)(unint64_t)-[MTLTexture width](inputLinearImageTexture, "width");
    v13 = -[MTLTexture height](self->_inputLinearImageTexture, "height");
    v14.f32[0] = v57;
    v14.f32[1] = (float)v13;
    v15 = vdiv_f32(v12, v14);
    *(float32x2_t *)&v16 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputLinearImageScale);
    *((float32x2_t *)&v16 + 1) = v15;
    *((_OWORD *)a3 + 2) = v16;
  }
  bgLTMGainMapTexture = self->_bgLTMGainMapTexture;
  if (bgLTMGainMapTexture)
  {
    v18 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputBgLTMGainMapTextureMappedRegion.origin));
    v58 = (float)(unint64_t)-[MTLTexture width](bgLTMGainMapTexture, "width");
    v19 = -[MTLTexture height](self->_bgLTMGainMapTexture, "height");
    v20.f32[0] = v58;
    v20.f32[1] = (float)v19;
    v21 = vdiv_f32(v18, v20);
    *(float32x2_t *)&v22 = vcvt_f32_f64((float64x2_t)self->_logicalImageToBgLTMGainMapScale);
    *((float32x2_t *)&v22 + 1) = v21;
    *((_OWORD *)a3 + 3) = v22;
  }
  fgLTMGainMapTexture = self->_fgLTMGainMapTexture;
  if (fgLTMGainMapTexture)
  {
    v24 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputFgLTMGainMapTextureMappedRegion.origin));
    v59 = (float)(unint64_t)-[MTLTexture width](fgLTMGainMapTexture, "width");
    v25 = -[MTLTexture height](self->_fgLTMGainMapTexture, "height");
    v26.f32[0] = v59;
    v26.f32[1] = (float)v25;
    v27 = vdiv_f32(v24, v26);
    *(float32x2_t *)&v28 = vcvt_f32_f64((float64x2_t)self->_logicalImageToFgLTMGainMapScale);
    *((float32x2_t *)&v28 + 1) = v27;
    *((_OWORD *)a3 + 4) = v28;
  }
  v29 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputLightMapTextureMappedRegion.origin));
  v60 = (float)(unint64_t)-[MTLTexture width](self->_inputLightMapTexture, "width");
  v30 = -[MTLTexture height](self->_inputLightMapTexture, "height");
  v31.f32[0] = v60;
  v31.f32[1] = (float)v30;
  v32 = vdiv_f32(v29, v31);
  *(float32x2_t *)&v33 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputLightMapScale);
  *((float32x2_t *)&v33 + 1) = v32;
  *((_OWORD *)a3 + 5) = v33;
  v34 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputLinearLightMapTextureMappedRegion.origin));
  v61 = (float)(unint64_t)-[MTLTexture width](self->_inputLinearLightMapTexture, "width");
  v35 = -[MTLTexture height](self->_inputLinearLightMapTexture, "height");
  v36.f32[0] = v61;
  v36.f32[1] = (float)v35;
  v37 = vdiv_f32(v34, v36);
  *(float32x2_t *)&v38 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputLinearLightMapScale);
  *((float32x2_t *)&v38 + 1) = v37;
  *((_OWORD *)a3 + 6) = v38;
  v39 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputPersonMaskTextureMappedRegion.origin));
  v62 = (float)(unint64_t)-[MTLTexture width](self->_fgbgMatteTexture, "width");
  v40 = -[MTLTexture height](self->_fgbgMatteTexture, "height");
  v41.f32[0] = v62;
  v41.f32[1] = (float)v40;
  v42 = vdiv_f32(v39, v41);
  *(float32x2_t *)&v43 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputPersonMaskScale);
  *((float32x2_t *)&v43 + 1) = v42;
  *((_OWORD *)a3 + 7) = v43;
  v44 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputSkinMaskTextureMappedRegion.origin));
  v63 = (float)(unint64_t)-[MTLTexture width](self->_skinMatteTexture, "width");
  v45 = -[MTLTexture height](self->_skinMatteTexture, "height");
  v46.f32[0] = v63;
  v46.f32[1] = (float)v45;
  v47 = vdiv_f32(v44, v46);
  *(float32x2_t *)&v48 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputSkinMaskScale);
  *((float32x2_t *)&v48 + 1) = v47;
  *((_OWORD *)a3 + 8) = v48;
  v49 = vcvt_f32_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_inputSkyMaskTextureMappedRegion.origin));
  v64 = (float)(unint64_t)-[MTLTexture width](self->_skyMatteTexture, "width");
  v50 = -[MTLTexture height](self->_skyMatteTexture, "height");
  v51.f32[0] = v64;
  v51.f32[1] = (float)v50;
  v52 = vdiv_f32(v49, v51);
  *(float32x2_t *)&v53 = vcvt_f32_f64((float64x2_t)self->_logicalImageToInputSkyMaskScale);
  *((float32x2_t *)&v53 + 1) = v52;
  *((_OWORD *)a3 + 9) = v53;
  v54 = vmovn_s64(vcvtq_s64_f64(vsubq_f64((float64x2_t)self->_renderRegionRect.origin, (float64x2_t)self->_outputImageTextureMappedRegion.origin)));
  *((_WORD *)a3 + 81) = v54.i16[2];
  *((_WORD *)a3 + 80) = v54.i16[0];
  v55 = vadd_s32(vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_renderRegionRect.size)), v54);
  *((_WORD *)a3 + 4) = v55.i16[0];
  *((_WORD *)a3 + 5) = v55.i16[2];
}

- (int)_applyFinalRendering
{
  int v3;
  int v4;

  if (self->_inputImageTexture && self->_inputGlobalToneCurveTexture && self->_outputImageTexture)
  {
    v3 = -[CMISmartStyleMetalRendererV1 _checkROISpecification](self, "_checkROISpecification");
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      v4 = -[CMISmartStyleMetalRendererV1 _finalRenderRegion:](self, "_finalRenderRegion:", self->_renderRegionRect.origin.x, self->_renderRegionRect.origin.y, self->_renderRegionRect.size.width, self->_renderRegionRect.size.height);
      if (!v4)
        return v4;
    }
    FigDebugAssert3();
    return v4;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_finalRenderRegion:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MTLBuffer *inputSRLCoefficientsBuf;
  _BOOL8 v19;
  MTLTexture **p_fgLTMGainMapTexture;
  uint64_t v21;
  id *v22;
  id v23;
  _QWORD *v24;
  int64x2_t *v25;
  int v26;
  int64x2_t v28;
  uint64_t v29;
  _QWORD v30[3];
  int64x2_t v31;
  uint64_t v32;
  _QWORD v33[3];
  _OWORD v34[11];
  float inputSRLCurveParameter;

  height = a3.size.height;
  width = a3.size.width;
  -[FigMetalContext device](self->_metalContext, "device", a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsFamily:", 1004);

  -[CMISmartStyleV1 castType](self->_inputStyle, "castType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_hueSatLumLUTTexByCastTypeForVariant, "objectForKeyedSubscript:", self->_tuningParameterVariant);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_hueSatLumLUTTexByCastTypeForVariant, "objectForKeyedSubscript:", CFSTR("DefaultParameters"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "computeCommandEncoder"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v15;
    objc_msgSend(v15, "setTexture:atIndex:", self->_inputImageTexture, 0);
    objc_msgSend(v16, "setTexture:atIndex:", self->_inputGlobalToneCurveTexture, 2);
    objc_msgSend(v16, "setTexture:atIndex:", self->_cubicSplineToneCurveTexture, 21);
    objc_msgSend(v16, "setTexture:atIndex:", self->_inputGainMapTexture, 7);
    objc_msgSend(v16, "setTexture:atIndex:", self->_inputLightMapTexture, 5);
    objc_msgSend(v16, "setTexture:atIndex:", self->_inputLinearLightMapTexture, 6);
    objc_msgSend(v16, "setTexture:atIndex:", self->_fgbgMatteTexture, 10);
    objc_msgSend(v16, "setTexture:atIndex:", self->_skinMatteTexture, 11);
    objc_msgSend(v16, "setTexture:atIndex:", self->_skyMatteTexture, 12);
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTexture:atIndex:", v17, 22);

    objc_msgSend(v16, "setTexture:atIndex:", self->_outputImageTexture, 13);
    objc_msgSend(v16, "setTexture:atIndex:", self->_outputGainMapTexture, 14);
    inputSRLCoefficientsBuf = self->_inputSRLCoefficientsBuf;
    if (inputSRLCoefficientsBuf)
    {
      objc_msgSend(v16, "setBuffer:offset:atIndex:", inputSRLCoefficientsBuf, 0, 9);
      v19 = 1;
    }
    else
    {
      v19 = self->_inputSRLCurveParameter != -1.0;
      inputSRLCurveParameter = self->_inputSRLCurveParameter;
      objc_msgSend(v16, "setBytes:length:atIndex:", &inputSRLCurveParameter, 4, 9);
    }
    if (self->_bgLTMGainMapTexture && self->_fgLTMGainMapTexture)
    {
      p_fgLTMGainMapTexture = &self->_fgLTMGainMapTexture;
      objc_msgSend(v16, "setTexture:atIndex:");
      v21 = 9;
    }
    else
    {
      p_fgLTMGainMapTexture = &self->_inputLinearImageTexture;
      v21 = 1;
    }
    objc_msgSend(v16, "setTexture:atIndex:", *p_fgLTMGainMapTexture, v21);
    objc_msgSend(v16, "setBytes:length:atIndex:", &self->_colorManagement, 256, 0);
    objc_msgSend(v16, "setBuffer:offset:atIndex:", self->_paramsBuf, 0, 1);
    objc_msgSend(v16, "setBuffer:offset:atIndex:", self->_statsBuf, 0, 3);
    memset(v34, 0, sizeof(v34));
    -[CMISmartStyleMetalRendererV1 _encodeRenderRegion:](self, "_encodeRenderRegion:", v34);
    objc_msgSend(v16, "setBytes:length:atIndex:", v34, 176, 5);
    v22 = (id *)(&self->super.isa + v19);
    if (v7)
    {
      v23 = v22[148];
      objc_msgSend(v16, "setComputePipelineState:", v23);
      objc_msgSend(v16, "setImageblockWidth:height:", 32, 32);
      v33[0] = (unint64_t)width;
      v33[1] = (unint64_t)height;
      v33[2] = 1;
      v31 = vdupq_n_s64(0x20uLL);
      v32 = 1;
      v24 = v33;
      v25 = &v31;
    }
    else
    {
      v23 = v22[150];
      objc_msgSend(v16, "setComputePipelineState:", v23);
      v30[0] = (unint64_t)width;
      v30[1] = (unint64_t)height;
      v30[2] = 1;
      v28 = vdupq_n_s64(0x20uLL);
      v29 = 1;
      v24 = v30;
      v25 = &v28;
    }
    objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", v24, v25);
    objc_msgSend(v16, "endEncoding");
    -[FigMetalContext commit](self->_metalContext, "commit");

    v26 = 0;
  }
  else
  {
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
  }

  return v26;
}

- (int)_encodeLinear
{
  void *v3;
  id v4;
  void *v5;
  __int128 v6;
  MTLTexture *inputLinearImageTexture;
  double x;
  double width;
  double height;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  MTLSharedEventListener *sharedEventListener;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  int64x2_t v28;
  uint64_t v29;
  _QWORD v30[3];
  _BYTE v31[64];
  id v32;
  _BYTE v33[60];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  if (self->_outputCodedLinearTexture
    && self->_outputCodedLinearMetadata
    && (-[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = -[CMISmartStyleMetalRendererV1 _newBufferWithLength:label:sharedAccess:](self, "_newBufferWithLength:label:sharedAccess:", 12, CFSTR("SSR_ENCODE_LINEAR_STATS"), 0);
    v32 = v4;
    if (v4)
    {
      v5 = v4;
      *(_DWORD *)&v33[8] = 0;
      *(_QWORD *)v33 = 0;
      v6 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
      *(_OWORD *)&v33[12] = *MEMORY[0x1E0C83FE8];
      *(_OWORD *)&v33[44] = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
      *(_OWORD *)&v33[28] = v6;
      inputLinearImageTexture = self->_inputLinearImageTexture;
      x = self->_inputLinearImageTextureMappedRegion.origin.x;
      *(CGFloat *)&v6 = self->_inputLinearImageTextureMappedRegion.origin.y;
      width = self->_inputLinearImageTextureMappedRegion.size.width;
      height = self->_inputLinearImageTextureMappedRegion.size.height;
      *(_DWORD *)v31 = 1;
      *(_OWORD *)&v31[4] = *(_OWORD *)v33;
      *(_OWORD *)&v31[20] = *(_OWORD *)&v33[16];
      *(_OWORD *)&v31[36] = *(_OWORD *)&v33[32];
      *(_OWORD *)&v31[48] = *(_OWORD *)&v33[44];
      v11 = -[CMISmartStyleMetalRendererV1 _encodeImageReduction:inputTexture:inputROI:inputColorConversion:outputStatsBuffer:outputStatsBufferOffset:](self, "_encodeImageReduction:inputTexture:inputROI:inputColorConversion:outputStatsBuffer:outputStatsBufferOffset:", v3, inputLinearImageTexture, v31, v4, 0, x, *(double *)&v6, width, height);
      if (v11)
      {
        FigDebugAssert3();

      }
      else
      {
        objc_msgSend(v3, "computeCommandEncoder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setComputePipelineState:", self->_encodeLinearPipelineState);
        objc_msgSend(v12, "setTexture:atIndex:", self->_inputLinearImageTexture, 1);
        objc_msgSend(v12, "setTexture:atIndex:", self->_outputCodedLinearTexture, 15);
        objc_msgSend(v12, "setBytes:length:atIndex:", &self->_inputLinearEncodingGain, 4, 12);
        objc_msgSend(v12, "setImageblockWidth:height:", 32, 32);
        v13 = -[MTLTexture width](self->_outputCodedLinearTexture, "width");
        v14 = -[MTLTexture height](self->_outputCodedLinearTexture, "height");
        v30[0] = v13;
        v30[1] = v14;
        v30[2] = 1;
        v28 = vdupq_n_s64(0x20uLL);
        v29 = 1;
        objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v30, &v28);
        objc_msgSend(v12, "endEncoding");
        *(float *)&v15 = self->_inputLinearEncodingGain;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputCodedLinearMetadata, "setObject:forKeyedSubscript:", v16, CFSTR("Gain"));

        *(_QWORD *)v31 = 0;
        *(_QWORD *)&v31[8] = v31;
        *(_QWORD *)&v31[16] = 0x3032000000;
        *(_QWORD *)&v31[24] = __Block_byref_object_copy_;
        *(_QWORD *)&v31[32] = __Block_byref_object_dispose_;
        *(_QWORD *)&v31[40] = self->_outputCodedLinearMetadata;
        v22 = 0;
        v23 = &v22;
        v24 = 0x3032000000;
        v25 = __Block_byref_object_copy_;
        v26 = __Block_byref_object_dispose_;
        v27 = v5;
        FigMetalIncRef((void *)v23[5]);
        -[FigMetalContext device](self->_metalContext, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "newSharedEvent");

        objc_msgSend(v18, "setSignaledValue:", 2);
        sharedEventListener = self->_sharedEventListener;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __45__CMISmartStyleMetalRendererV1__encodeLinear__block_invoke;
        v21[3] = &unk_1E94EB3C8;
        v21[4] = v31;
        v21[5] = &v22;
        objc_msgSend(v18, "notifyListener:atValue:block:", sharedEventListener, 3, v21);
        objc_msgSend(v3, "encodeSignalEvent:value:", v18, 3);

        _Block_object_dispose(&v22, 8);
        _Block_object_dispose(v31, 8);

        -[FigMetalContext commit](self->_metalContext, "commit");
        v11 = 0;
      }
    }
    else
    {
      FigDebugAssert3();
      v11 = FigSignalErrorAt();

    }
  }
  else
  {
    FigDebugAssert3();
    v11 = FigSignalErrorAt();
  }
  FigMetalDecRef(&v32);

  return v11;
}

void __45__CMISmartStyleMetalRendererV1__encodeLinear__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _DWORD *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_sync_enter(v3);
  v4 = (_DWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)), "contents");
  LODWORD(v5) = *v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v6, CFSTR("OriginalRangeMin"));

  LODWORD(v7) = v4[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v8, CFSTR("OriginalRangeMax"));

  objc_sync_exit(v3);
  FigMetalDecRef((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (int)_releaseIntermediateResources
{
  void *v3;
  void *v4;
  MTLBuffer *paramsBuf;
  MTLBuffer *statsBuf;
  int v7;
  _QWORD v9[6];
  _QWORD v10[5];
  MTLBuffer *v11;
  _QWORD v12[5];
  MTLBuffer *v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy_;
  v12[4] = __Block_byref_object_dispose_;
  v13 = self->_paramsBuf;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy_;
  v10[4] = __Block_byref_object_dispose_;
  v11 = self->_statsBuf;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__CMISmartStyleMetalRendererV1__releaseIntermediateResources__block_invoke;
    v9[3] = &unk_1E94EB3F0;
    v9[4] = v12;
    v9[5] = v10;
    objc_msgSend(v3, "addCompletedHandler:", v9);
    -[FigMetalContext commit](self->_metalContext, "commit");
    paramsBuf = self->_paramsBuf;
    self->_paramsBuf = 0;

    statsBuf = self->_statsBuf;
    self->_statsBuf = 0;

    FigMetalDecRef((id *)&self->_bgLTMGainMapTexture);
    FigMetalDecRef((id *)&self->_fgLTMGainMapTexture);
    v7 = 0;
  }
  else
  {
    FigDebugAssert3();
    v7 = FigSignalErrorAt();
  }
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
  return v7;
}

void __61__CMISmartStyleMetalRendererV1__releaseIntermediateResources__block_invoke(uint64_t a1)
{
  FigMetalDecRef((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  FigMetalDecRef((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (MTLTexture)inputLinearImageRGBTexture
{
  return self->_inputLinearImageTexture;
}

- (void)setInputLinearImageRGBTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputLinearImageTexture, a3);
}

- (void)setInputSmallLightMapTexture:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
  {
    FigMetalDecRef((id *)&self->_smallLightMapTexture);
    objc_storeStrong((id *)&self->_smallLightMapTexture, a3);
    objc_storeStrong((id *)&self->_inputSmallLightMapTexture, a3);
  }
  else
  {
    FigDebugAssert3();
  }

}

- (void)setInputSmallLinearLightMapTexture:(id)a3
{
  id v5;

  v5 = a3;
  if (!v5 || self->_outputSmallLinearLightMapTexture)
  {
    FigDebugAssert3();
  }
  else
  {
    FigMetalDecRef((id *)&self->_smallLinearLightMapTexture);
    objc_storeStrong((id *)&self->_smallLinearLightMapTexture, a3);
    objc_storeStrong((id *)&self->_inputSmallLinearLightMapTexture, a3);
  }

}

- (void)setOutputSmallLightMapTexture:(id)a3
{
  MTLTexture *v5;
  MTLTexture *outputSmallLightMapTexture;

  v5 = (MTLTexture *)a3;
  if (v5 && self->_inputSmallLightMapTexture)
    FigDebugAssert3();
  FigMetalDecRef((id *)&self->_smallLightMapTexture);
  objc_storeStrong((id *)&self->_smallLightMapTexture, a3);
  outputSmallLightMapTexture = self->_outputSmallLightMapTexture;
  self->_outputSmallLightMapTexture = v5;

}

- (void)setOutputSmallLinearLightMapTexture:(id)a3
{
  MTLTexture *v5;
  MTLTexture *outputSmallLinearLightMapTexture;

  v5 = (MTLTexture *)a3;
  if (v5 && self->_inputSmallLinearLightMapTexture)
    FigDebugAssert3();
  FigMetalDecRef((id *)&self->_smallLinearLightMapTexture);
  objc_storeStrong((id *)&self->_smallLinearLightMapTexture, a3);
  outputSmallLinearLightMapTexture = self->_outputSmallLinearLightMapTexture;
  self->_outputSmallLinearLightMapTexture = v5;

}

- (float)_sceneBrightnessValue
{
  NSNumber *brightnessValue;
  float v3;

  brightnessValue = self->_brightnessValue;
  if (!brightnessValue)
    return 1000.0;
  -[NSNumber floatValue](brightnessValue, "floatValue");
  return exp2(v3) * 12.5;
}

- (NSString)instanceLabel
{
  return self->_instanceLabel;
}

- (void)setInstanceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instanceLabel, a3);
}

- (MTLTexture)inputImageTexture
{
  return self->_inputImageTexture;
}

- (void)setInputImageTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputImageTexture, a3);
}

- (MTLTexture)inputImageThumbnailTexture
{
  return self->_inputImageThumbnailTexture;
}

- (void)setInputImageThumbnailTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputImageThumbnailTexture, a3);
}

- (MTLTexture)inputLightMapTexture
{
  return self->_inputLightMapTexture;
}

- (void)setInputLightMapTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputLightMapTexture, a3);
}

- (NSDictionary)inputStatisticsByStatsType
{
  return self->_inputStatisticsByStatsType;
}

- (void)setInputStatisticsByStatsType:(id)a3
{
  objc_storeStrong((id *)&self->_inputStatisticsByStatsType, a3);
}

- (MTLTexture)inputLinearImageTexture
{
  return self->_inputLinearImageTexture;
}

- (void)setInputLinearImageTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputLinearImageTexture, a3);
}

- (MTLTexture)inputLinearImageLumaTexture
{
  return self->_inputLinearImageLumaTexture;
}

- (void)setInputLinearImageLumaTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputLinearImageLumaTexture, a3);
}

- (MTLTexture)inputLinearImageChromaTexture
{
  return self->_inputLinearImageChromaTexture;
}

- (void)setInputLinearImageChromaTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputLinearImageChromaTexture, a3);
}

- (MTLTexture)inputLinearLightMapTexture
{
  return self->_inputLinearLightMapTexture;
}

- (void)setInputLinearLightMapTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputLinearLightMapTexture, a3);
}

- (MTLTexture)inputGlobalToneCurveTexture
{
  return self->_inputGlobalToneCurveTexture;
}

- (void)setInputGlobalToneCurveTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputGlobalToneCurveTexture, a3);
}

- (float)inputLinearBaseGain
{
  return self->_inputLinearBaseGain;
}

- (void)setInputLinearBaseGain:(float)a3
{
  self->_inputLinearBaseGain = a3;
}

- (float)baselineExposure
{
  return self->_baselineExposure;
}

- (void)setBaselineExposure:(float)a3
{
  self->_baselineExposure = a3;
}

- (float)inputLinearEncodingGain
{
  return self->_inputLinearEncodingGain;
}

- (void)setInputLinearEncodingGain:(float)a3
{
  self->_inputLinearEncodingGain = a3;
}

- (NSNumber)brightnessValue
{
  return self->_brightnessValue;
}

- (void)setBrightnessValue:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessValue, a3);
}

- (float)faceBasedGlobalExposureBoostRatio
{
  return self->_faceBasedGlobalExposureBoostRatio;
}

- (void)setFaceBasedGlobalExposureBoostRatio:(float)a3
{
  self->_faceBasedGlobalExposureBoostRatio = a3;
}

- (MTLTexture)inputGainMapTexture
{
  return self->_inputGainMapTexture;
}

- (void)setInputGainMapTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputGainMapTexture, a3);
}

- (MTLTexture)inputPersonMaskTexture
{
  return self->_inputPersonMaskTexture;
}

- (void)setInputPersonMaskTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputPersonMaskTexture, a3);
}

- (MTLTexture)inputSkinMaskTexture
{
  return self->_inputSkinMaskTexture;
}

- (void)setInputSkinMaskTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputSkinMaskTexture, a3);
}

- (MTLTexture)inputSkyMaskTexture
{
  return self->_inputSkyMaskTexture;
}

- (void)setInputSkyMaskTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputSkyMaskTexture, a3);
}

- (NSString)tuningParameterVariant
{
  return self->_tuningParameterVariant;
}

- (void)setTuningParameterVariant:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameterVariant, a3);
}

- (NSString)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(id)a3
{
  objc_storeStrong((id *)&self->_sceneType, a3);
}

- (int)semanticStyleSceneType
{
  return self->_semanticStyleSceneType;
}

- (void)setSemanticStyleSceneType:(int)a3
{
  self->_semanticStyleSceneType = a3;
}

- (MTLTexture)outputImageTexture
{
  return self->_outputImageTexture;
}

- (void)setOutputImageTexture:(id)a3
{
  objc_storeStrong((id *)&self->_outputImageTexture, a3);
}

- (MTLTexture)outputGainMapTexture
{
  return self->_outputGainMapTexture;
}

- (void)setOutputGainMapTexture:(id)a3
{
  objc_storeStrong((id *)&self->_outputGainMapTexture, a3);
}

- (MTLTexture)inputSmallLightMapTexture
{
  return self->_inputSmallLightMapTexture;
}

- (MTLTexture)inputSmallLinearLightMapTexture
{
  return self->_inputSmallLinearLightMapTexture;
}

- (MTLTexture)outputSmallLightMapTexture
{
  return self->_outputSmallLightMapTexture;
}

- (MTLTexture)outputSmallLinearLightMapTexture
{
  return self->_outputSmallLinearLightMapTexture;
}

- (NSMutableDictionary)outputImageStatistics
{
  return self->_outputImageStatistics;
}

- (void)setOutputImageStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_outputImageStatistics, a3);
}

- (MTLTexture)outputCodedLinearTexture
{
  return self->_outputCodedLinearTexture;
}

- (void)setOutputCodedLinearTexture:(id)a3
{
  objc_storeStrong((id *)&self->_outputCodedLinearTexture, a3);
}

- (NSMutableDictionary)outputCodedLinearMetadata
{
  return self->_outputCodedLinearMetadata;
}

- (void)setOutputCodedLinearMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_outputCodedLinearMetadata, a3);
}

- (CGSize)logicalImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageSize.width;
  height = self->_logicalImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageSize:(CGSize)a3
{
  self->_logicalImageSize = a3;
}

- (CGRect)renderRegionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_renderRegionRect.origin.x;
  y = self->_renderRegionRect.origin.y;
  width = self->_renderRegionRect.size.width;
  height = self->_renderRegionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRenderRegionRect:(CGRect)a3
{
  self->_renderRegionRect = a3;
}

- (CGRect)inputImageTextureMappedRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputImageTextureMappedRegion.origin.x;
  y = self->_inputImageTextureMappedRegion.origin.y;
  width = self->_inputImageTextureMappedRegion.size.width;
  height = self->_inputImageTextureMappedRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputImageTextureMappedRegion:(CGRect)a3
{
  self->_inputImageTextureMappedRegion = a3;
}

- (CGRect)inputLinearImageTextureMappedRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputLinearImageTextureMappedRegion.origin.x;
  y = self->_inputLinearImageTextureMappedRegion.origin.y;
  width = self->_inputLinearImageTextureMappedRegion.size.width;
  height = self->_inputLinearImageTextureMappedRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputLinearImageTextureMappedRegion:(CGRect)a3
{
  self->_inputLinearImageTextureMappedRegion = a3;
}

- (CGRect)inputLightMapTextureMappedRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputLightMapTextureMappedRegion.origin.x;
  y = self->_inputLightMapTextureMappedRegion.origin.y;
  width = self->_inputLightMapTextureMappedRegion.size.width;
  height = self->_inputLightMapTextureMappedRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputLightMapTextureMappedRegion:(CGRect)a3
{
  self->_inputLightMapTextureMappedRegion = a3;
}

- (CGRect)inputLinearLightMapTextureMappedRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputLinearLightMapTextureMappedRegion.origin.x;
  y = self->_inputLinearLightMapTextureMappedRegion.origin.y;
  width = self->_inputLinearLightMapTextureMappedRegion.size.width;
  height = self->_inputLinearLightMapTextureMappedRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputLinearLightMapTextureMappedRegion:(CGRect)a3
{
  self->_inputLinearLightMapTextureMappedRegion = a3;
}

- (CGRect)inputPersonMaskTextureMappedRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputPersonMaskTextureMappedRegion.origin.x;
  y = self->_inputPersonMaskTextureMappedRegion.origin.y;
  width = self->_inputPersonMaskTextureMappedRegion.size.width;
  height = self->_inputPersonMaskTextureMappedRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputPersonMaskTextureMappedRegion:(CGRect)a3
{
  self->_inputPersonMaskTextureMappedRegion = a3;
}

- (CGRect)inputSkinMaskTextureMappedRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputSkinMaskTextureMappedRegion.origin.x;
  y = self->_inputSkinMaskTextureMappedRegion.origin.y;
  width = self->_inputSkinMaskTextureMappedRegion.size.width;
  height = self->_inputSkinMaskTextureMappedRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputSkinMaskTextureMappedRegion:(CGRect)a3
{
  self->_inputSkinMaskTextureMappedRegion = a3;
}

- (CGRect)inputSkyMaskTextureMappedRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputSkyMaskTextureMappedRegion.origin.x;
  y = self->_inputSkyMaskTextureMappedRegion.origin.y;
  width = self->_inputSkyMaskTextureMappedRegion.size.width;
  height = self->_inputSkyMaskTextureMappedRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputSkyMaskTextureMappedRegion:(CGRect)a3
{
  self->_inputSkyMaskTextureMappedRegion = a3;
}

- (CGRect)outputImageTextureMappedRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_outputImageTextureMappedRegion.origin.x;
  y = self->_outputImageTextureMappedRegion.origin.y;
  width = self->_outputImageTextureMappedRegion.size.width;
  height = self->_outputImageTextureMappedRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOutputImageTextureMappedRegion:(CGRect)a3
{
  self->_outputImageTextureMappedRegion = a3;
}

- (CGSize)logicalImageToInputImageScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToInputImageScale.width;
  height = self->_logicalImageToInputImageScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToInputImageScale:(CGSize)a3
{
  self->_logicalImageToInputImageScale = a3;
}

- (CGSize)logicalImageToInputLinearImageScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToInputLinearImageScale.width;
  height = self->_logicalImageToInputLinearImageScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToInputLinearImageScale:(CGSize)a3
{
  self->_logicalImageToInputLinearImageScale = a3;
}

- (CGSize)logicalImageToBgLTMGainMapScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToBgLTMGainMapScale.width;
  height = self->_logicalImageToBgLTMGainMapScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToBgLTMGainMapScale:(CGSize)a3
{
  self->_logicalImageToBgLTMGainMapScale = a3;
}

- (CGSize)logicalImageToFgLTMGainMapScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToFgLTMGainMapScale.width;
  height = self->_logicalImageToFgLTMGainMapScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToFgLTMGainMapScale:(CGSize)a3
{
  self->_logicalImageToFgLTMGainMapScale = a3;
}

- (CGSize)logicalImageToInputLightMapScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToInputLightMapScale.width;
  height = self->_logicalImageToInputLightMapScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToInputLightMapScale:(CGSize)a3
{
  self->_logicalImageToInputLightMapScale = a3;
}

- (CGSize)logicalImageToInputLinearLightMapScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToInputLinearLightMapScale.width;
  height = self->_logicalImageToInputLinearLightMapScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToInputLinearLightMapScale:(CGSize)a3
{
  self->_logicalImageToInputLinearLightMapScale = a3;
}

- (CGSize)logicalImageToInputPersonMaskScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToInputPersonMaskScale.width;
  height = self->_logicalImageToInputPersonMaskScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToInputPersonMaskScale:(CGSize)a3
{
  self->_logicalImageToInputPersonMaskScale = a3;
}

- (CGSize)logicalImageToInputSkinMaskScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToInputSkinMaskScale.width;
  height = self->_logicalImageToInputSkinMaskScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToInputSkinMaskScale:(CGSize)a3
{
  self->_logicalImageToInputSkinMaskScale = a3;
}

- (CGSize)logicalImageToInputSkyMaskScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalImageToInputSkyMaskScale.width;
  height = self->_logicalImageToInputSkyMaskScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalImageToInputSkyMaskScale:(CGSize)a3
{
  self->_logicalImageToInputSkyMaskScale = a3;
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

- (MTLBuffer)inputSRLCoefficientsBuf
{
  return self->_inputSRLCoefficientsBuf;
}

- (void)setInputSRLCoefficientsBuf:(id)a3
{
  objc_storeStrong((id *)&self->_inputSRLCoefficientsBuf, a3);
}

- (float)inputSRLCurveParameter
{
  return self->_inputSRLCurveParameter;
}

- (void)setInputSRLCurveParameter:(float)a3
{
  self->_inputSRLCurveParameter = a3;
}

- (BOOL)useLiveMetalAllocations
{
  return self->_useLiveMetalAllocations;
}

- (void)setUseLiveMetalAllocations:(BOOL)a3
{
  self->_useLiveMetalAllocations = a3;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_outputCodedLinearMetadata, 0);
  objc_storeStrong((id *)&self->_outputCodedLinearTexture, 0);
  objc_storeStrong((id *)&self->_outputImageStatistics, 0);
  objc_storeStrong((id *)&self->_brightnessValue, 0);
  objc_storeStrong((id *)&self->_instanceLabel, 0);
  objc_storeStrong((id *)&self->_inputSRLCoefficientsBuf, 0);
  objc_storeStrong((id *)&self->_hueSatLumLUTTexByCastTypeForVariant, 0);
  objc_storeStrong((id *)&self->_texturesToPurge, 0);
  objc_storeStrong((id *)&self->_sharedEventListener, 0);
  objc_storeStrong((id *)&self->_encodeLinearPipelineState, 0);
  objc_storeStrong((id *)&self->_renderingParamsFromStatsPipelineState, 0);
  objc_storeStrong((id *)&self->_hueSatLumLUTPipelineState, 0);
  objc_storeStrong((id *)&self->_YCbCrToRGBColorConversionPipelineState, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_renderSmartStylePipelineStateWithoutImageBlock[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_renderSmartStylePipelineStateUsingImageBlock[j + 1], 0);
  objc_storeStrong((id *)&self->_createLTMGainMapPipelineStateWithoutImageBlock, 0);
  objc_storeStrong((id *)&self->_createLTMGainMapPipelineStateUsingImageBlock, 0);
  objc_storeStrong((id *)&self->_createGuidePipelineStateUsingImageBlock, 0);
  objc_storeStrong((id *)&self->_createGuidePipelineStateWithoutImageBlock, 0);
  objc_storeStrong((id *)&self->_globalStatsPipelineState, 0);
  objc_storeStrong((id *)&self->_sumPersonAndSkinCounts, 0);
  objc_storeStrong((id *)&self->_globalHistogramPipelineState, 0);
  objc_storeStrong((id *)&self->_localHistogramStatsAll, 0);
  objc_storeStrong((id *)&self->_updateBaseGainWithStats, 0);
  objc_storeStrong((id *)&self->_imageReduction, 0);
  objc_storeStrong((id *)&self->_sceneType, 0);
  objc_storeStrong((id *)&self->_tuningParameterVariant, 0);
  objc_storeStrong((id *)&self->_inputStatisticsByStatsType, 0);
  objc_storeStrong((id *)&self->_cubicSplineToneCurveTexture, 0);
  objc_storeStrong((id *)&self->_inputGlobalToneCurveTexture, 0);
  objc_storeStrong((id *)&self->_internalTuningParams, 0);
  objc_storeStrong((id *)&self->_skyMatteTexture, 0);
  objc_storeStrong((id *)&self->_skinMatteTexture, 0);
  objc_storeStrong((id *)&self->_fgbgMatteTexture, 0);
  objc_storeStrong((id *)&self->_fgLTMGainMapTexture, 0);
  objc_storeStrong((id *)&self->_bgLTMGainMapTexture, 0);
  objc_storeStrong((id *)&self->_inputLinearLightMapTexture, 0);
  objc_storeStrong((id *)&self->_inputLightMapTexture, 0);
  objc_storeStrong((id *)&self->_outputSmallLinearLightMapTexture, 0);
  objc_storeStrong((id *)&self->_outputSmallLightMapTexture, 0);
  objc_storeStrong((id *)&self->_inputSmallLinearLightMapTexture, 0);
  objc_storeStrong((id *)&self->_inputSmallLightMapTexture, 0);
  objc_storeStrong((id *)&self->_smallLinearLightMapTexture, 0);
  objc_storeStrong((id *)&self->_smallLightMapTexture, 0);
  objc_storeStrong((id *)&self->_linearGuideTexture, 0);
  objc_storeStrong((id *)&self->_guideTexture, 0);
  objc_storeStrong((id *)&self->_statsBuf, 0);
  objc_storeStrong((id *)&self->_paramsBuf, 0);
  objc_storeStrong((id *)&self->_sharedAccessAllocator, 0);
  objc_storeStrong((id *)&self->_outputGainMapTexture, 0);
  objc_storeStrong((id *)&self->_inputGainMapTexture, 0);
  objc_storeStrong((id *)&self->_inputSkyMaskTexture, 0);
  objc_storeStrong((id *)&self->_inputSkinMaskTexture, 0);
  objc_storeStrong((id *)&self->_inputPersonMaskTexture, 0);
  objc_storeStrong((id *)&self->_outputImageTexture, 0);
  objc_storeStrong((id *)&self->_inputLinearImageChromaTexture, 0);
  objc_storeStrong((id *)&self->_inputLinearImageLumaTexture, 0);
  objc_storeStrong((id *)&self->_inputLinearImageTexture, 0);
  objc_storeStrong((id *)&self->_inputImageThumbnailTexture, 0);
  objc_storeStrong((id *)&self->_inputImageTexture, 0);
  objc_storeStrong((id *)&self->_inputStyle, 0);
  objc_storeStrong((id *)&self->_cmiGuidedFilter, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
