@implementation LTMProcessor

- (LTMProcessor)initWithCommandQueue:(id)a3
{
  id v4;
  _DWORD *v5;
  LTMProcessor *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  FigMetalContext *metalContext;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void **p_computeLTM;
  uint64_t v16;
  LTMIBPParams *ltmParams;
  uint64_t v18;
  LTMExtractMetadata *metadataExtractor;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  LTMDriverRef *driverLTM;
  HazeEstimation *v24;
  HazeEstimation *hazeEstimator;
  void *v26;
  void *v27;
  LTMProcessor *v28;
  NSObject *v30;
  NSObject *v31;
  objc_super v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FigKTraceInit();
  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v32.receiver = self;
  v32.super_class = (Class)LTMProcessor;
  v6 = -[LTMProcessor init](&v32, sel_init);
  if (!v6
    || (FigNote_AllowInternalDefaultLogs(),
        fig_note_initialize_category_with_default_work(),
        fig_note_initialize_category_with_default_work(),
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v30 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v8 = 0;
    goto LABEL_20;
  }
  v8 = (void *)v7;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE11A10]), "initWithbundle:andOptionalCommandQueue:", v7, v4);
  metalContext = v6->_metalContext;
  v6->_metalContext = (FigMetalContext *)v9;

  if (!v6->_metalContext)
    goto LABEL_19;
  v11 = objc_alloc(MEMORY[0x24BE11A00]);
  -[FigMetalContext device](v6->_metalContext, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithDevice:allocatorType:", v12, 2);
  -[FigMetalContext setAllocator:](v6->_metalContext, "setAllocator:", v13);

  -[FigMetalContext allocator](v6->_metalContext, "allocator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_19;
  p_computeLTM = (void **)&v6->_computeLTM;
  -[LTMProcessor _readDefaultsMetalAllocator](v6, "_readDefaultsMetalAllocator");
  v16 = objc_opt_new();
  ltmParams = v6->_ltmParams;
  v6->_ltmParams = (LTMIBPParams *)v16;

  if (!v6->_ltmParams)
    goto LABEL_19;
  v18 = objc_opt_new();
  metadataExtractor = v6->_metadataExtractor;
  v6->_metadataExtractor = (LTMExtractMetadata *)v18;

  if (!v6->_metadataExtractor)
    goto LABEL_19;
  bzero(&v6->_driverInputMetadata.exposureTime, 0x6B0uLL);
  *(_OWORD *)&v6->_procHITHStat.globalHistWindow = 0u;
  *(_OWORD *)&v6->_procHITHStat.thumbnailOffset = 0u;
  *(_OWORD *)&v6->_procHITHStat.localHistOffset = 0u;
  *(_OWORD *)&v6->_procHITHStat.globalHistOffset = 0u;
  *(_OWORD *)&v6->_procHITHStat.localHistogramOriginalTilePixelCount = 0u;
  *(_OWORD *)&v6->_procHITHStat.localHistBlockSizeX = 0u;
  *(_OWORD *)&v6->_procHITHStat.thumbnailDownsampleX = 0u;
  *(_OWORD *)&v6->_procHITHStat.thumbnailWindow = 0u;
  v6->_procHITHStat.thumbnailStat = v6->thumbnailStat;
  *(_QWORD *)&v6->_procHITHStat.thumbnailOffset = 0x228800000000;
  v6->_procHITHStat.localHistStat = v6->localHistStat;
  *(_QWORD *)&v6->_procHITHStat.localHistOffset = 0x198000000000;
  v6->_procHITHStat.globalHistStat = v6->globalHistStat;
  *(_QWORD *)&v6->_procHITHStat.globalHistOffset = 0x100000000000;
  if (-[LTMProcessor createShaders:](v6, "createShaders:", v6->_metalContext))
    goto LABEL_20;
  v20 = objc_opt_new();
  v21 = *p_computeLTM;
  *p_computeLTM = (void *)v20;

  if (!*p_computeLTM
    || (v22 = objc_opt_new(),
        driverLTM = v6->_driverLTM,
        v6->_driverLTM = (LTMDriverRef *)v22,
        driverLTM,
        !v6->_driverLTM))
  {
LABEL_19:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v31 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_20;
  }
  v24 = -[HazeEstimation initWithMetalContext:]([HazeEstimation alloc], "initWithMetalContext:", v6->_metalContext);
  hazeEstimator = v6->_hazeEstimator;
  v6->_hazeEstimator = v24;

  if (v6->_hazeEstimator)
  {
    v26 = (void *)objc_opt_new();
    -[HazeEstimation setHazePropertiesForLTM:](v6->_hazeEstimator, "setHazePropertiesForLTM:", v26);

    -[HazeEstimation hazePropertiesForLTM](v6->_hazeEstimator, "hazePropertiesForLTM");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = v6;
      goto LABEL_15;
    }
  }
  FigSignalErrorAt();
LABEL_20:
  if (*v5 == 1)
    kdebug_trace();
  v28 = 0;
LABEL_15:

  return v28;
}

- (int)createShaders:(id)a3
{
  MTLComputePipelineState **p_ltmDownsampleYCbCrToRGB;
  uint64_t v5;
  MTLComputePipelineState *v6;
  uint64_t v7;
  MTLComputePipelineState *v8;
  uint64_t v9;
  MTLComputePipelineState *v10;
  uint64_t v11;
  MTLComputePipelineState *v12;
  uint64_t v13;
  MTLComputePipelineState *v14;
  NSObject *v16;

  p_ltmDownsampleYCbCrToRGB = &self->_ltmDownsampleYCbCrToRGB;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("SoftLTM::ltmDownsampleYCbCrToRGB"), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *p_ltmDownsampleYCbCrToRGB;
  *p_ltmDownsampleYCbCrToRGB = (MTLComputePipelineState *)v5;

  if (*p_ltmDownsampleYCbCrToRGB)
  {
    -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("SoftLTM::ltmDownsampleRGBAFloatToRGB"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = p_ltmDownsampleYCbCrToRGB[1];
    p_ltmDownsampleYCbCrToRGB[1] = (MTLComputePipelineState *)v7;

    if (p_ltmDownsampleYCbCrToRGB[1])
    {
      -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("SoftLTM::ltmCompressHighlight"), 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = p_ltmDownsampleYCbCrToRGB[2];
      p_ltmDownsampleYCbCrToRGB[2] = (MTLComputePipelineState *)v9;

      if (p_ltmDownsampleYCbCrToRGB[2])
      {
        -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("SoftLTM::ltmDehaze"), 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = p_ltmDownsampleYCbCrToRGB[3];
        p_ltmDownsampleYCbCrToRGB[3] = (MTLComputePipelineState *)v11;

        if (p_ltmDownsampleYCbCrToRGB[3])
        {
          -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("SoftLTM::ltmApplyGlobalCCM"), 0);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = p_ltmDownsampleYCbCrToRGB[4];
          p_ltmDownsampleYCbCrToRGB[4] = (MTLComputePipelineState *)v13;

          if (p_ltmDownsampleYCbCrToRGB[4])
            return 0;
        }
      }
    }
  }
  fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  v16 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return -1;
}

- (void)_readDefaultsLTMparam
{
  BOOL *p_enablePreLTMHazeCorrection;

  p_enablePreLTMHazeCorrection = &self->_enablePreLTMHazeCorrection;
  -[LTMIBPParams setCalcGlobalHistOnROI:](self->_ltmParams, "setCalcGlobalHistOnROI:", -[LTMIBPParams calcGlobalHistOnROI](self->_ltmParams, "calcGlobalHistOnROI"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setEnableAntiAliasing:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "enableAntiAliasing"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setComputeHDRCurves:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "computeHDRCurves"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setComputeCurvesWoFaceBoost:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "computeCurvesWoFaceBoost"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setIsHighlightCompressionEnabled:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "isHighlightCompressionEnabled"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setIsAdaptiveHighlightCompressionEnabled:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "isAdaptiveHighlightCompressionEnabled"));
  *p_enablePreLTMHazeCorrection = 1;
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setDoGlobalCCM:", objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "doGlobalCCM"));
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "ispDGainThreshold");
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setIspDGainThreshold:");
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "adaptiveHCSlope");
  objc_msgSend(*((id *)p_enablePreLTMHazeCorrection + 3), "setAdaptiveHCSlope:");
}

- (sCLRProcHITHStat)getHITHStat
{
  return &self->_procHITHStat;
}

- (int)purgeResources
{
  HazeEstimation **p_hazeEstimator;
  void *v4;
  void *v5;

  p_hazeEstimator = &self->_hazeEstimator;
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  if (!p_hazeEstimator[5])
  {
    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "purgeResources");

  }
  self->_allocatorSetupComplete = 0;
  -[HazeEstimation releaseTextures](*p_hazeEstimator, "releaseTextures");
  -[HazeEstimation releaseTextures](p_hazeEstimator[4], "releaseTextures");
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  NSObject *v4;
  NSObject *v5;
  CMIExternalMemoryResource *externalMemoryResource;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  unint64_t allocatorForceSize;
  void *v12;
  int v13;
  NSObject *v15;

  if (self->_allocatorSetupComplete)
    return 0;
  v4 = objc_opt_new();
  if (v4)
  {
    v5 = v4;
    -[NSObject setWireMemory:](v4, "setWireMemory:", 1);
    -[NSObject setResourceOptions:](v5, "setResourceOptions:", 512);
    -[NSObject setLabel:](v5, "setLabel:", CFSTR("FigMetalAllocator_SoftLTM"));
    externalMemoryResource = self->_externalMemoryResource;
    if (externalMemoryResource)
    {
      -[CMIExternalMemoryResource allocatorBackend](externalMemoryResource, "allocatorBackend");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        -[NSObject setMemSize:](v5, "setMemSize:", -[NSObject memSize](v7, "memSize"));
        -[FigMetalContext allocator](self->_metalContext, "allocator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "setupWithDescriptor:allocatorBackend:", v5, v8);

        if (!v10)
        {

LABEL_11:
          self->_allocatorSetupComplete = 1;

          return 0;
        }
      }
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v15 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    else
    {
      if (self->_allocatorForceSize)
        allocatorForceSize = self->_allocatorForceSize;
      else
        allocatorForceSize = 56180736;
      -[NSObject setMemSize:](v5, "setMemSize:", allocatorForceSize);
      -[NSObject setWireMemory:](v5, "setWireMemory:", self->_allocatorWireMemory);
      -[FigMetalContext allocator](self->_metalContext, "allocator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "setupWithDescriptor:", v5);

      if (!v13)
        goto LABEL_11;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v8 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }

  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  return -1;
}

- (id)createLTMComputer
{
  LTMGeometryData **p_geometryData;
  LTMStats *v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char IsValid;
  void *v12;
  LTMGeometryData *v13;
  LTMGeometryData *v14;
  unsigned int *p_exposureTime;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  sCLRProcHITHStat *p_procHITHStat;
  LTMCurvesCompute *v21;
  LTMGeometryData *v22;
  uint64_t v23;
  char v24;
  LTMCurvesCompute *v25;
  NSObject *v26;
  uint64_t v28;
  void *v29;

  p_geometryData = &self->_geometryData;
  v29 = 0;
  v4 = -[LTMStats initWithMetalContext:]([LTMStats alloc], "initWithMetalContext:", self->_metalContext);
  if (!v4)
    goto LABEL_23;
  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  -[LTMGeometryData inRGBImageUInt16Tex](p_geometryData[8], "inRGBImageUInt16Tex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LTMGeometryData inRGBImageUInt16Tex](p_geometryData[8], "inRGBImageUInt16Tex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FigMetalIncRef();
  }
  else
  {
    -[LTMProcessor generateLinearRGBATexture](self, "generateLinearRGBATexture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LTMGeometryData setInRGBImageUInt16Tex:](p_geometryData[8], "setInRGBImageUInt16Tex:", v7);
  }

  -[LTMGeometryData inRGBImageUInt16Tex](p_geometryData[8], "inRGBImageUInt16Tex");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        -[LTMGeometryData inRGBImageUInt16Tex](p_geometryData[8], "inRGBImageUInt16Tex"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        IsValid = FigMetalIsValid(),
        v10,
        v9,
        (IsValid & 1) == 0))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v26 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_23;
  }
  -[LTMGeometryData inRGBImageUInt16Tex](p_geometryData[8], "inRGBImageUInt16Tex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v12;
  v13 = -[LTMGeometryData initWithInputTextureWidth:height:]([LTMGeometryData alloc], "initWithInputTextureWidth:height:", objc_msgSend(v12, "width"), objc_msgSend(v12, "height"));
  v14 = *p_geometryData;
  *p_geometryData = v13;

  if (!*p_geometryData)
    goto LABEL_23;
  p_exposureTime = &self->_driverInputMetadata.exposureTime;
  if (!-[LTMGeometryData extractFrom:toDriverInput:ltmGeometry:](p_geometryData[3], "extractFrom:toDriverInput:ltmGeometry:", p_geometryData[8], &self->_driverInputMetadata.exposureTime))goto LABEL_23;
  if (!LOBYTE(self->_driverInputMetadata.highlightCompressionGain))
    goto LABEL_14;
  -[LTMProcessor _compressHighlight:](self, "_compressHighlight:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_23:
    v25 = 0;
    goto LABEL_24;
  }
  v17 = (void *)v16;
  FigMetalDecRef();
  v18 = v29;
  v29 = v17;

LABEL_14:
  if (*v5 == 1)
    kdebug_trace();
  v19 = -[LTMProcessor _isOptimized:](self, "_isOptimized:", -[LTMGeometryData optimizationLevel](p_geometryData[8], "optimizationLevel"));
  p_procHITHStat = &self->_procHITHStat;
  if (-[LTMStats startCalculateHITHStatistics:ltmGeometry:inputDriverMetadata:optimized:enableAntiAliasing:calcGlobalHistOnROI:outputProcHITHStat:](v4, "startCalculateHITHStatistics:ltmGeometry:inputDriverMetadata:optimized:enableAntiAliasing:calcGlobalHistOnROI:outputProcHITHStat:", v29, *p_geometryData, p_exposureTime, v19, -[LTMGeometryData enableAntiAliasing](p_geometryData[8], "enableAntiAliasing"), -[LTMGeometryData calcGlobalHistOnROI](p_geometryData[8], "calcGlobalHistOnROI"), p_procHITHStat))
  {
    goto LABEL_23;
  }
  if (*v5 == 1)
    kdebug_trace();
  v21 = [LTMCurvesCompute alloc];
  v22 = *p_geometryData;
  v23 = -[LTMGeometryData digitalFlash](p_geometryData[8], "digitalFlash");
  v24 = -[LTMGeometryData computeHDRCurves](p_geometryData[8], "computeHDRCurves");
  BYTE1(v28) = -[LTMGeometryData computeCurvesWoFaceBoost](p_geometryData[8], "computeCurvesWoFaceBoost");
  LOBYTE(v28) = v24;
  v25 = -[LTMCurvesCompute initWith:HITH:geometryData:statsObj:optimized:digitalFlash:computeHDRCurves:computeCurvesWoFaceBoost:](v21, "initWith:HITH:geometryData:statsObj:optimized:digitalFlash:computeHDRCurves:computeCurvesWoFaceBoost:", p_exposureTime, p_procHITHStat, v22, v4, v19, v23, v28);
  if (v25 && *v5 == 1)
    kdebug_trace();
LABEL_24:
  if (v29)
  {
    -[LTMGeometryData setInRGBImageUInt16Tex:](p_geometryData[8], "setInRGBImageUInt16Tex:", 0);
    FigMetalDecRef();
  }

  return v25;
}

- (int)process
{
  LTMGeometryData **p_geometryData;
  LTMStats *v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  LTMGeometryData *v15;
  LTMGeometryData *v16;
  int32x2_t v17;
  float32x2_t v18;
  int32x2_t v19;
  int32x2_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  void *v26;
  void *v27;
  int v28;
  __int128 v29;
  id v30;
  int v31;
  void *v32;
  double v33;
  int v34;
  int v35;
  void *v36;
  double v37;
  int v38;
  void *v39;
  double v40;
  int v41;
  int v42;
  void *v43;
  double v44;
  int v45;
  LTMGeometryData *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  int v64;
  float32x4_t v65;
  __int32 v66;
  float32x4_t v67;
  __int32 v68;
  void *v69;
  double v70;
  unsigned int v71;
  unsigned int v72;
  float v73;
  float v74;
  int32x2_t v75;
  float32x4_t v76;
  id v77;
  id v78;
  _BOOL8 v79;
  int v80;
  _DWORD *v81;
  int v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  NSObject *v89;
  unsigned int v90;
  __int128 v91;
  unsigned int v92;
  double v93;
  __int32 v94;
  __int128 v95;
  __int128 v96;
  float32x4_t v97;
  float32x4_t v98;
  __int128 v99;
  os_log_type_t type;
  int v101;
  id v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  p_geometryData = &self->_geometryData;
  v102 = 0;
  v4 = -[LTMStats initWithMetalContext:]([LTMStats alloc], "initWithMetalContext:", self->_metalContext);
  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (!v4)
  {
LABEL_74:
    v85 = 0;
    v21 = 0;
LABEL_70:
    v87 = 0;
    goto LABEL_71;
  }
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  -[LTMGeometryData inRGBImageUInt16Tex](p_geometryData[8], "inRGBImageUInt16Tex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LTMGeometryData inRGBImageUInt16Tex](p_geometryData[8], "inRGBImageUInt16Tex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v7;
    FigMetalIncRef();
    if (!v7)
      goto LABEL_75;
  }
  else
  {
    -[LTMProcessor generateLinearRGBATexture](self, "generateLinearRGBATexture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v7;
    if (!v7)
    {
LABEL_75:
      v101 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v89 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v85 = 0;
      v21 = 0;
      v87 = -1;
      goto LABEL_71;
    }
  }
  if ((FigMetalIsValid() & 1) == 0)
    goto LABEL_75;
  -[LTMGeometryData tuningParameters](p_geometryData[8], "tuningParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LTMGeometryData tuningParameters](p_geometryData[8], "tuningParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LTMProcessor setLTMComputeTuningParams:from:](self, "setLTMComputeTuningParams:from:", &self->_driverInputMetadata.exposureTime, v9);

    -[LTMGeometryData tuningParameters](p_geometryData[8], "tuningParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LTMProcessor setDehazeTuningParamsFrom:](self, "setDehazeTuningParamsFrom:", v10);

    -[LTMGeometryData tuningParameters](p_geometryData[8], "tuningParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LTMProcessor setLTMTuningParamsFrom:](self, "setLTMTuningParamsFrom:", v11);

    -[LTMGeometryData tuningParameters](p_geometryData[8], "tuningParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Features"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      *((_BYTE *)p_geometryData + 41) = objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", CFSTR("EnableHazeEstimation"), *((unsigned __int8 *)p_geometryData + 41), 0);
      -[LTMGeometryData setIsAdaptiveHighlightCompressionEnabled:](p_geometryData[8], "setIsAdaptiveHighlightCompressionEnabled:", objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", CFSTR("EnableAdaptiveHighlightCompression"), -[LTMGeometryData isAdaptiveHighlightCompressionEnabled](p_geometryData[8], "isAdaptiveHighlightCompressionEnabled"), 0));
      -[LTMGeometryData setIsHighlightCompressionEnabled:](p_geometryData[8], "setIsHighlightCompressionEnabled:", objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", CFSTR("EnableHighlightCompression"), -[LTMGeometryData isHighlightCompressionEnabled](p_geometryData[8], "isHighlightCompressionEnabled"), 0));
    }

  }
  -[LTMProcessor _readDefaultsLTMparam](self, "_readDefaultsLTMparam");
  -[LTMProcessor _readDefaultsDehaze](self, "_readDefaultsDehaze");
  if (*((_BYTE *)p_geometryData + 41))
    v14 = -[LTMGeometryData doHazeEstimation](p_geometryData[8], "doHazeEstimation");
  else
    v14 = 0;
  -[LTMGeometryData setDoHazeEstimation:](p_geometryData[8], "setDoHazeEstimation:", v14);
  v15 = -[LTMGeometryData initWithInputTextureWidth:height:]([LTMGeometryData alloc], "initWithInputTextureWidth:height:", objc_msgSend(v7, "width"), objc_msgSend(v7, "height"));
  v16 = *p_geometryData;
  *p_geometryData = v15;

  if (!*p_geometryData
    || !-[LTMGeometryData extractFrom:toDriverInput:ltmGeometry:](p_geometryData[3], "extractFrom:toDriverInput:ltmGeometry:", p_geometryData[8], &self->_driverInputMetadata.exposureTime))
  {
    goto LABEL_74;
  }
  if (-[LTMGeometryData doGlobalCCM](p_geometryData[8], "doGlobalCCM"))
  {
    v17.i32[0] = (__int16)self->_driverInputMetadata.ccm.coeff[2].v16;
    v17.i32[1] = (__int16)self->_driverInputMetadata.ccm.coeff[3].v16;
    v18 = (float32x2_t)vdup_n_s32(0x39800000u);
    v19.i32[0] = (__int16)self->_driverInputMetadata.ccm.coeff[5].v16;
    v19.i32[1] = (__int16)self->_driverInputMetadata.ccm.coeff[6].v16;
    v20.i32[0] = (__int16)self->_driverInputMetadata.ccm.coeff[8].v16;
    v20.i32[1] = *(__int16 *)&self->_driverInputMetadata.isLEDMainFlashforAWB;
    -[LTMProcessor _applyGlobalCCM:globalCCM:](self, "_applyGlobalCCM:globalCCM:", v7, COERCE_DOUBLE(vmul_f32(vcvt_f32_s32(v17), v18)), COERCE_DOUBLE(vmul_f32(vcvt_f32_s32(v19), v18)), COERCE_DOUBLE(vmul_f32(vcvt_f32_s32(v20), v18)));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_77;
    FigMetalDecRef();
    v22 = v102;
    v102 = v21;

  }
  -[LTMGeometryData hazeEstimation](p_geometryData[8], "hazeEstimation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = 0;
    v25 = 0uLL;
    do
    {
      v95 = v25;
      -[LTMGeometryData hazeEstimation](p_geometryData[8], "hazeEstimation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v99 = v95;
      *(_DWORD *)((unint64_t)&v99 & 0xFFFFFFFFFFFFFFF3 | (4 * (v24 & 3))) = v28;
      v29 = v99;
      v91 = v99;
      HIDWORD(v29) = HIDWORD(v95);
      v96 = v29;

      ++v24;
      v25 = v96;
    }
    while (v24 != 3);
    self->_anon_570[3] = 1;
    *(_OWORD *)&self->_anon_570[4] = v91;
    if (*((_BYTE *)p_geometryData + 40))
    {
      -[LTMProcessor _dehaze:hazeValues:](self, "_dehaze:hazeValues:", v102);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        FigMetalDecRef();
        v30 = v102;
        v102 = v21;

        goto LABEL_48;
      }
LABEL_77:
      v85 = 0;
      goto LABEL_70;
    }
  }
  else if (-[LTMGeometryData doHazeEstimation](p_geometryData[8], "doHazeEstimation"))
  {
    if (*v5 == 1)
      kdebug_trace();
    v31 = *(_DWORD *)&self->_driverInputMetadata.expBias;
    -[LTMGeometryData hazeProperties](p_geometryData[4], "hazeProperties");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = v31;
    objc_msgSend(v32, "setIspRes:", v33);

    -[LTMGeometryData evmExpRatio](p_geometryData[8], "evmExpRatio");
    v35 = v34;
    -[LTMGeometryData hazeProperties](p_geometryData[4], "hazeProperties");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = v35;
    objc_msgSend(v36, "setEvmExpRatio:", v37);

    v38 = *(_DWORD *)&self->_driverInputMetadata.expBias;
    -[LTMGeometryData hazePropertiesForLTM](p_geometryData[4], "hazePropertiesForLTM");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = v38;
    objc_msgSend(v39, "setIspRes:", v40);

    -[LTMGeometryData evmExpRatio](p_geometryData[8], "evmExpRatio");
    v42 = v41;
    -[LTMGeometryData hazePropertiesForLTM](p_geometryData[4], "hazePropertiesForLTM");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = v42;
    objc_msgSend(v43, "setEvmExpRatio:", v44);

    -[LTMGeometryData setInputRGBTexture:](p_geometryData[4], "setInputRGBTexture:", v102);
    -[LTMGeometryData setHazeValue:](p_geometryData[4], "setHazeValue:", 0.0);
    v45 = -[LTMGeometryData calcGlobalHistOnROI](p_geometryData[8], "calcGlobalHistOnROI");
    v46 = *p_geometryData;
    if (v45)
    {
      -[LTMGeometryData cropRect](v46, "cropRect");
      v48 = v47;
      -[LTMGeometryData cropRect](*p_geometryData, "cropRect");
      v50 = v49;
      -[LTMGeometryData cropRect](*p_geometryData, "cropRect");
      v52 = v51;
      -[LTMGeometryData cropRect](*p_geometryData, "cropRect");
      v54 = v52 + v53;
      -[LTMGeometryData cropRect](*p_geometryData, "cropRect");
      v56 = v55;
      -[LTMGeometryData cropRect](*p_geometryData, "cropRect");
    }
    else
    {
      -[LTMGeometryData sourceRect](v46, "sourceRect");
      v48 = v58;
      -[LTMGeometryData sourceRect](*p_geometryData, "sourceRect");
      v50 = v59;
      -[LTMGeometryData sourceRect](*p_geometryData, "sourceRect");
      v61 = v60;
      -[LTMGeometryData sourceRect](*p_geometryData, "sourceRect");
      v54 = v61 + v62;
      -[LTMGeometryData sourceRect](*p_geometryData, "sourceRect");
      v56 = v63;
      -[LTMGeometryData sourceRect](*p_geometryData, "sourceRect");
    }
    -[LTMGeometryData setHazeROI:](p_geometryData[4], "setHazeROI:", v48 | ((unint64_t)v50 << 32), v54 | ((unint64_t)(v56 + v57) << 32));
    v64 = -[LTMGeometryData run](p_geometryData[4], "run");
    if (v64)
    {
      v87 = v64;
      v85 = 0;
      v21 = 0;
      goto LABEL_71;
    }
    -[LTMGeometryData hazeValue](p_geometryData[4], "hazeValue");
    v97 = v65;
    -[LTMGeometryData hazeValue](p_geometryData[4], "hazeValue");
    v94 = v66;
    -[LTMGeometryData hazeValue](p_geometryData[4], "hazeValue");
    v67 = v97;
    v67.i32[1] = v94;
    v67.i32[2] = v68;
    v98 = v67;
    -[LTMGeometryData hazePropertiesForLTM](p_geometryData[4], "hazePropertiesForLTM");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = *(double *)v98.i64;
    if (v69)
    {
      -[LTMGeometryData hazeValueForLTM](p_geometryData[4], "hazeValueForLTM");
      v92 = v71;
      -[LTMGeometryData hazeValueForLTM](p_geometryData[4], "hazeValueForLTM");
      v90 = v72;
      -[LTMGeometryData hazeValueForLTM](p_geometryData[4], "hazeValueForLTM");
      v70 = COERCE_DOUBLE(__PAIR64__(v90, v92));
    }
    self->_anon_570[3] = 1;
    if (self->_anon_570[0])
    {
      *(float32x4_t *)&self->_anon_570[4] = v98;
    }
    else
    {
      v93 = v70;
      -[LTMGeometryData evmExpRatio](p_geometryData[8], "evmExpRatio");
      if (v73 == 0.0 || (-[LTMGeometryData evmExpRatio](p_geometryData[8], "evmExpRatio"), v74 <= 0.00000011921))
      {
        v76 = v98;
      }
      else
      {
        -[LTMGeometryData evmExpRatio](p_geometryData[8], "evmExpRatio");
        v76 = vdivq_f32(v98, (float32x4_t)vdupq_lane_s32(v75, 0));
      }
      *(float32x4_t *)&self->_anon_570[4] = v76;
      v70 = v93;
    }
    if (*((_BYTE *)p_geometryData + 40))
    {
      -[LTMProcessor _dehaze:hazeValues:](self, "_dehaze:hazeValues:", v102, v70);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_77;
      FigMetalDecRef();
      v77 = v102;
      v102 = v21;

    }
    if (*v5 == 1)
      kdebug_trace();
  }
LABEL_48:
  if (!LOBYTE(self->_driverInputMetadata.highlightCompressionGain))
    goto LABEL_51;
  -[LTMProcessor _compressHighlight:](self, "_compressHighlight:", v102);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_77;
  FigMetalDecRef();
  v78 = v102;
  v102 = v21;

LABEL_51:
  if (*v5 == 1)
    kdebug_trace();
  v79 = -[LTMProcessor _isOptimized:](self, "_isOptimized:", -[LTMGeometryData optimizationLevel](p_geometryData[8], "optimizationLevel"));
  v80 = -[LTMStats calculateHITHStatistics:ltmGeometry:optimized:enableAntiAliasing:calcGlobalHistOnROI:toDriverInputMetadata:andProcHITHStat:](v4, "calculateHITHStatistics:ltmGeometry:optimized:enableAntiAliasing:calcGlobalHistOnROI:toDriverInputMetadata:andProcHITHStat:", v102, *p_geometryData, v79, -[LTMGeometryData enableAntiAliasing](p_geometryData[8], "enableAntiAliasing"), -[LTMGeometryData calcGlobalHistOnROI](p_geometryData[8], "calcGlobalHistOnROI"), &self->_driverInputMetadata.exposureTime, &self->_procHITHStat);
  if (v80)
    goto LABEL_76;
  v81 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
  {
    kdebug_trace();
    if (*v81 == 1)
      kdebug_trace();
  }
  v80 = -[LTMGeometryData computeLtmComputeInput:withMetadata:to:computeInputMetadata:](p_geometryData[2], "computeLtmComputeInput:withMetadata:to:computeInputMetadata:", &self->_procHITHStat, &self->_driverInputMetadata.exposureTime, &self->_computeInputs, &self->_computeInputsMetadata);
  if (v80)
  {
LABEL_76:
    v87 = v80;
    v85 = 0;
    v21 = 0;
LABEL_81:
    v5 = (_DWORD *)MEMORY[0x24BDC0B48];
    goto LABEL_71;
  }
  v82 = -[LTMGeometryData computeLTM:withMetadata:to:](p_geometryData[1], "computeLTM:withMetadata:to:", &self->_computeInputs, &self->_computeInputsMetadata, &self->_computeOutput);
  if (v82)
  {
    v87 = v82;
    v85 = 0;
    v21 = 0;
    goto LABEL_81;
  }
  +[LTMMetadataWriter createLTMMetadataFromLTMOutput:statistics:driverInputMetadata:geometryData:](LTMMetadataWriter, "createLTMMetadataFromLTMOutput:statistics:driverInputMetadata:geometryData:", &self->_computeOutput, &self->_procHITHStat, &self->_driverInputMetadata.exposureTime, *p_geometryData);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v85 = 0;
    v87 = 0;
    goto LABEL_81;
  }
  if (-[LTMGeometryData computeHDRCurves](p_geometryData[8], "computeHDRCurves"))
  {
    self->_computeInputsMetadata.gammaCurve = 1;
    v83 = -[LTMGeometryData computeLTM:withMetadata:to:](p_geometryData[1], "computeLTM:withMetadata:to:", &self->_computeInputs, &self->_computeInputsMetadata, &self->_computeOutput);
    if (v83)
    {
LABEL_78:
      v87 = v83;
      v85 = 0;
      goto LABEL_81;
    }
    +[LTMMetadataWriter addLTMMetadataTo:curvesType:fromLTMOutput:statistics:driverInputMetadata:geometryData:](LTMMetadataWriter, "addLTMMetadataTo:curvesType:fromLTMOutput:statistics:driverInputMetadata:geometryData:", v21, 1, &self->_computeOutput, &self->_procHITHStat, &self->_driverInputMetadata.exposureTime, *p_geometryData);
  }
  if (-[LTMGeometryData computeCurvesWoFaceBoost](p_geometryData[8], "computeCurvesWoFaceBoost"))
  {
    LOBYTE(self->_driverInputMetadata.gammaCurve) = 1;
    *(_DWORD *)&self->_driverInputMetadata.panoExpRatio = 1065353216;
    *(_DWORD *)&self->_driverInputMetadata.useHighlightCompression = 0;
    v83 = -[LTMGeometryData computeLtmComputeInput:withMetadata:to:computeInputMetadata:](p_geometryData[2], "computeLtmComputeInput:withMetadata:to:computeInputMetadata:", &self->_procHITHStat, &self->_driverInputMetadata.exposureTime, &self->_computeInputs, &self->_computeInputsMetadata);
    if (!v83)
    {
      v83 = -[LTMGeometryData computeLTM:withMetadata:to:](p_geometryData[1], "computeLTM:withMetadata:to:", &self->_computeInputs, &self->_computeInputsMetadata, &self->_computeOutput);
      if (!v83)
      {
        +[LTMMetadataWriter addLTMMetadataTo:curvesType:fromLTMOutput:statistics:driverInputMetadata:geometryData:](LTMMetadataWriter, "addLTMMetadataTo:curvesType:fromLTMOutput:statistics:driverInputMetadata:geometryData:", v21, 2, &self->_computeOutput, &self->_procHITHStat, &self->_driverInputMetadata.exposureTime, *p_geometryData);
        goto LABEL_67;
      }
    }
    goto LABEL_78;
  }
LABEL_67:
  -[LTMGeometryData inMetaData](p_geometryData[8], "inMetaData");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v84, "mutableCopy");

  objc_msgSend(v85, "addEntriesFromDictionary:", v21);
  -[LTMGeometryData setOutMetaData:](p_geometryData[8], "setOutMetaData:", v85);
  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  -[LTMGeometryData outMetaData](p_geometryData[8], "outMetaData");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
    goto LABEL_70;
  v87 = -1;
LABEL_71:
  if (*v5 == 1)
    kdebug_trace();
  FigMetalDecRef();
  -[LTMGeometryData releaseTextures](p_geometryData[4], "releaseTextures");
  -[LTMGeometryData releaseTextures](p_geometryData[8], "releaseTextures");

  return v87;
}

- (int)finishProcessing
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (void)_readDefaultsMetalAllocator
{
  self->_allocatorForceSize = 0;
  self->_allocatorWireMemory = 1;
}

- (void)_readDefaultsDehaze
{
  HazeEstimation **p_hazeEstimator;
  void *v3;
  int v4;
  int v5;
  void *v6;
  double v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  double v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  double v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  double v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  double v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  double v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  double v42;
  void *v43;
  int v44;
  int v45;
  void *v46;
  double v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  void *v57;
  double v58;
  void *v59;
  int v60;
  int v61;
  void *v62;
  double v63;
  void *v64;
  int v65;
  int v66;
  void *v67;
  double v68;
  void *v69;
  int v70;
  int v71;
  void *v72;
  double v73;
  void *v74;
  int v75;
  int v76;
  void *v77;
  double v78;
  void *v79;
  int v80;
  int v81;
  void *v82;
  double v83;
  void *v84;
  int v85;
  int v86;
  void *v87;
  double v88;
  void *v89;
  int v90;
  int v91;
  void *v92;
  double v93;
  void *v94;
  int v95;
  int v96;
  void *v97;
  double v98;
  int v99;
  int v100;
  void *v101;
  double v102;
  id v103;

  p_hazeEstimator = &self->_hazeEstimator;
  -[HazeEstimation hazeProperties](self->_hazeEstimator, "hazeProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reluC1");
  v5 = v4;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v5;
  objc_msgSend(v6, "setReluC1:", v7);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reluC2");
  v10 = v9;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = v10;
  objc_msgSend(v11, "setReluC2:", v12);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reluC3");
  v15 = v14;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = v15;
  objc_msgSend(v16, "setReluC3:", v17);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reluC4");
  v20 = v19;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = v20;
  objc_msgSend(v21, "setReluC4:", v22);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reluC5");
  v25 = v24;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = v25;
  objc_msgSend(v26, "setReluC5:", v27);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sr_min");
  v30 = v29;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = v30;
  objc_msgSend(v31, "setSr_min:", v32);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sr_var");
  v35 = v34;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = v35;
  objc_msgSend(v36, "setSr_var:", v37);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sr_pow");
  v40 = v39;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = v40;
  objc_msgSend(v41, "setSr_pow:", v42);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sr_sat");
  v45 = v44;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v47) = v45;
  objc_msgSend(v46, "setSr_sat:", v47);

  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "min_display_black");
  v50 = v49;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v52) = v50;
  objc_msgSend(v51, "setMin_display_black:", v52);

  -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "reluC1");
    v56 = v55;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v58) = v56;
    objc_msgSend(v57, "setReluC1:", v58);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "reluC2");
    v61 = v60;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v63) = v61;
    objc_msgSend(v62, "setReluC2:", v63);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "reluC3");
    v66 = v65;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v68) = v66;
    objc_msgSend(v67, "setReluC3:", v68);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "reluC4");
    v71 = v70;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v73) = v71;
    objc_msgSend(v72, "setReluC4:", v73);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "reluC5");
    v76 = v75;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v78) = v76;
    objc_msgSend(v77, "setReluC5:", v78);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "sr_min");
    v81 = v80;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v83) = v81;
    objc_msgSend(v82, "setSr_min:", v83);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "sr_var");
    v86 = v85;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v88) = v86;
    objc_msgSend(v87, "setSr_var:", v88);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "sr_pow");
    v91 = v90;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v93) = v91;
    objc_msgSend(v92, "setSr_pow:", v93);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "sr_sat");
    v96 = v95;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v98) = v96;
    objc_msgSend(v97, "setSr_sat:", v98);

    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v103 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "min_display_black");
    v100 = v99;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v102) = v100;
    objc_msgSend(v101, "setMin_display_black:", v102);

  }
}

- (id)generateLinearRGBATexture
{
  LTMIBPParams **p_ltmParams;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  p_ltmParams = &self->_ltmParams;
  -[LTMIBPParams inLumaTex](self->_ltmParams, "inLumaTex");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[LTMIBPParams inChromaTex](*p_ltmParams, "inChromaTex"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    -[LTMIBPParams inRGBAFloatTex](*p_ltmParams, "inRGBAFloatTex");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[LTMIBPParams inLumaTex](*p_ltmParams, "inLumaTex");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else
      {
        -[LTMIBPParams inChromaTex](*p_ltmParams, "inChromaTex");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          -[LTMIBPParams inRGBAFloatTex](*p_ltmParams, "inRGBAFloatTex");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[LTMProcessor createLTMInTextureFromRGBAFloatTex:](self, "createLTMInTextureFromRGBAFloatTex:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
    }
LABEL_12:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v14 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
    return v10;
  }
  -[LTMIBPParams inRGBAFloatTex](*p_ltmParams, "inRGBAFloatTex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_12;
  -[LTMIBPParams inLumaTex](*p_ltmParams, "inLumaTex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTMIBPParams inChromaTex](*p_ltmParams, "inChromaTex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTMProcessor createLTMInTextureFromLuma:chroma:](self, "createLTMInTextureFromLuma:chroma:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v10;
}

- (id)createIntermediateRGBAMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;

  -[FigMetalContext allocator](self->_metalContext, "allocator", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newTextureDescriptor");

  if (!v9)
    goto LABEL_4;
  objc_msgSend(v9, "desc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextureType:", 2);

  objc_msgSend(v9, "desc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWidth:", a4);

  objc_msgSend(v9, "desc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHeight:", a5);

  objc_msgSend(v9, "desc");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUsage:", 3);

  objc_msgSend(v9, "desc");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPixelFormat:", 113);

  objc_msgSend(v9, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newTextureWithDescriptor:", v9);

  if (!v16)
  {
LABEL_4:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v18 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v16 = 0;
  }

  return v16;
}

- (id)createLTMInTextureFromLuma:(id)a3 chroma:(id)a4
{
  id v6;
  id v7;
  void *v8;
  float v9;
  float v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MTLComputePipelineState **p_ltmDownsampleYCbCrToRGB;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  os_log_type_t v31;
  os_log_type_t type[4];
  float v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v33 = 0.0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_21;
  }
  v9 = (double)(objc_msgSend(v7, "width") / 0x420uLL) * 0.5;
  if (v9 >= 1.0)
    v10 = v9;
  else
    v10 = 1.0;
  v33 = v10;
  -[LTMProcessor createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", CFSTR("ltmLinearRGB"), (unint64_t)(float)((float)(unint64_t)objc_msgSend(v8, "width") / v10), (unint64_t)(float)((float)(unint64_t)objc_msgSend(v8, "height") / v10));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commandBuffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "computeCommandEncoder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        p_ltmDownsampleYCbCrToRGB = &self->_ltmDownsampleYCbCrToRGB;
        objc_msgSend(v14, "setComputePipelineState:", self->_ltmDownsampleYCbCrToRGB);
        objc_msgSend(v15, "setTexture:atIndex:", v6, 0);
        objc_msgSend(v15, "setTexture:atIndex:", v8, 1);
        objc_msgSend(v15, "setTexture:atIndex:", v11, 2);
        objc_msgSend(v15, "setBytes:length:atIndex:", &v33, 4, 0);
        v17 = -[MTLComputePipelineState threadExecutionWidth](self->_ltmDownsampleYCbCrToRGB, "threadExecutionWidth");
        v18 = -[NSObject width](v11, "width");
        if (v17 >= -[NSObject height](v11, "height") * v18)
        {
          v20 = -[NSObject width](v11, "width");
          v19 = -[NSObject height](v11, "height") * v20;
        }
        else
        {
          v19 = -[MTLComputePipelineState threadExecutionWidth](*p_ltmDownsampleYCbCrToRGB, "threadExecutionWidth");
        }
        v21 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](*p_ltmDownsampleYCbCrToRGB, "maxTotalThreadsPerThreadgroup")/ v19;
        v22 = -[NSObject width](v11, "width");
        if (v21 >= -[NSObject height](v11, "height") * v22 / v19)
        {
          v24 = -[NSObject width](v11, "width");
          v23 = -[NSObject height](v11, "height") * v24;
        }
        else
        {
          v23 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](*p_ltmDownsampleYCbCrToRGB, "maxTotalThreadsPerThreadgroup");
        }
        v25 = v23 / v19;
        v30[0] = -[NSObject width](v11, "width");
        v30[1] = -[NSObject height](v11, "height");
        v30[2] = 1;
        v29[0] = v19;
        v29[1] = v25;
        v29[2] = 1;
        objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v30, v29);
        objc_msgSend(v15, "endEncoding");
        objc_msgSend(v13, "commit");

        goto LABEL_16;
      }
      *(_DWORD *)type = 0;
      v31 = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v28 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_22:
      v11 = 0;
      goto LABEL_16;
    }
    *(_DWORD *)type = 0;
    v31 = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v27 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_21:
    goto LABEL_22;
  }
LABEL_16:

  return v11;
}

- (id)createLTMInTextureFromRGBAFloatTex:(id)a3
{
  id v4;
  void *v5;
  float v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTLComputePipelineState **p_ltmDownsampleRGBAFloatToRGB;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  os_log_type_t type;
  int v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v29 = 1065353216;
  if (!v4)
  {
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_19;
  }
  v6 = 1.0;
  if ((unint64_t)objc_msgSend(v4, "width") >= 0x841)
  {
    v29 = 0x40000000;
    v6 = 2.0;
    if ((unint64_t)objc_msgSend(v5, "width") >> 1 >= 0x841)
    {
      v29 = 1082130432;
      v6 = 4.0;
    }
  }
  -[LTMProcessor createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", CFSTR("ltmLinearRGB"), (unint64_t)(float)((float)(unint64_t)objc_msgSend(v5, "width") / v6), (unint64_t)(float)((float)(unint64_t)objc_msgSend(v5, "height") / v6));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commandBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "computeCommandEncoder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v10;
        p_ltmDownsampleRGBAFloatToRGB = &self->_ltmDownsampleRGBAFloatToRGB;
        objc_msgSend(v10, "setComputePipelineState:", self->_ltmDownsampleRGBAFloatToRGB);
        objc_msgSend(v11, "setTexture:atIndex:", v5, 0);
        objc_msgSend(v11, "setTexture:atIndex:", v7, 1);
        objc_msgSend(v11, "setBytes:length:atIndex:", &v29, 4, 0);
        v13 = -[MTLComputePipelineState threadExecutionWidth](self->_ltmDownsampleRGBAFloatToRGB, "threadExecutionWidth");
        v14 = -[NSObject width](v7, "width");
        if (v13 >= -[NSObject height](v7, "height") * v14)
        {
          v16 = -[NSObject width](v7, "width");
          v15 = -[NSObject height](v7, "height") * v16;
        }
        else
        {
          v15 = -[MTLComputePipelineState threadExecutionWidth](*p_ltmDownsampleRGBAFloatToRGB, "threadExecutionWidth");
        }
        v17 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](*p_ltmDownsampleRGBAFloatToRGB, "maxTotalThreadsPerThreadgroup")/ v15;
        v18 = -[NSObject width](v7, "width");
        if (v17 >= -[NSObject height](v7, "height") * v18 / v15)
        {
          v20 = -[NSObject width](v7, "width");
          v19 = -[NSObject height](v7, "height") * v20;
        }
        else
        {
          v19 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](*p_ltmDownsampleRGBAFloatToRGB, "maxTotalThreadsPerThreadgroup");
        }
        v21 = v19 / v15;
        v26[0] = -[NSObject width](v7, "width");
        v26[1] = -[NSObject height](v7, "height");
        v26[2] = 1;
        v25[0] = v15;
        v25[1] = v21;
        v25[2] = 1;
        objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v26, v25);
        objc_msgSend(v11, "endEncoding");
        objc_msgSend(v9, "commit");

        goto LABEL_15;
      }
      v28 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v24 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_20:
      v7 = 0;
      goto LABEL_15;
    }
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v23 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_19:
    goto LABEL_20;
  }
LABEL_15:

  return v7;
}

- (id)_compressHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MTLComputePipelineState **p_ltmCompressHighlight;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  id v32;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];
  _QWORD v41[3];
  os_log_type_t type;
  int v43;
  _QWORD v44[3];
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LTMProcessor _prepareHighlightCompressionCurve](self, "_prepareHighlightCompressionCurve");
  -[LTMProcessor createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", CFSTR("ltmCompressedTexture"), objc_msgSend(v4, "width"), objc_msgSend(v4, "height"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v20 = 0;
    v18 = 0;
    v16 = 0;
    v7 = 0;
    v31 = 1;
    goto LABEL_13;
  }
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newTextureDescriptor");

  if (!v7)
  {
    v43 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v34 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v20 = 0;
    v18 = 0;
    v16 = 0;
    v7 = 0;
LABEL_22:
    v31 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "desc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextureType:", 0);

  objc_msgSend(v7, "desc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWidth:", 257);

  objc_msgSend(v7, "desc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHeight:", 1);

  objc_msgSend(v7, "desc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDepth:", 1);

  objc_msgSend(v7, "desc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPixelFormat:", 20);

  objc_msgSend(v7, "desc");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUsage:", 1);

  objc_msgSend(v7, "setLabel:", 0);
  -[FigMetalContext device](self->_metalContext, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "desc");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "newTextureWithDescriptor:", v15);

  if (!v16)
  {
    v43 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v35 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v20 = 0;
    v18 = 0;
    v16 = 0;
    goto LABEL_22;
  }
  memset(v44, 0, sizeof(v44));
  v45 = xmmword_230931910;
  v46 = 1;
  objc_msgSend(v16, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v44, 0, 0, highlightCompressionDataScaled, 0, 0);
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v43 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v36 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v20 = 0;
    v18 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v18, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v43 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v37 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v20 = 0;
    goto LABEL_22;
  }
  v20 = v19;
  p_ltmCompressHighlight = &self->_ltmCompressHighlight;
  objc_msgSend(v19, "setComputePipelineState:", self->_ltmCompressHighlight);
  objc_msgSend(v20, "setTexture:atIndex:", v4, 0);
  objc_msgSend(v20, "setTexture:atIndex:", v5, 1);
  objc_msgSend(v20, "setTexture:atIndex:", v16, 2);
  v22 = -[MTLComputePipelineState threadExecutionWidth](self->_ltmCompressHighlight, "threadExecutionWidth");
  v23 = objc_msgSend(v5, "width");
  if (v22 >= objc_msgSend(v5, "height") * v23)
  {
    v25 = objc_msgSend(v5, "width");
    v24 = objc_msgSend(v5, "height") * v25;
  }
  else
  {
    v24 = -[MTLComputePipelineState threadExecutionWidth](*p_ltmCompressHighlight, "threadExecutionWidth");
  }
  v26 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](*p_ltmCompressHighlight, "maxTotalThreadsPerThreadgroup")/ v24;
  v27 = objc_msgSend(v5, "width");
  if (v26 >= objc_msgSend(v5, "height") * v27 / v24)
  {
    v29 = objc_msgSend(v5, "width");
    v28 = objc_msgSend(v5, "height") * v29;
  }
  else
  {
    v28 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](*p_ltmCompressHighlight, "maxTotalThreadsPerThreadgroup");
  }
  v30 = v28 / v24;
  v41[0] = objc_msgSend(v5, "width");
  v41[1] = objc_msgSend(v5, "height");
  v31 = 1;
  v41[2] = 1;
  v40[0] = v24;
  v40[1] = v30;
  v40[2] = 1;
  objc_msgSend(v20, "dispatchThreads:threadsPerThreadgroup:", v41, v40);
LABEL_13:
  objc_msgSend(v20, "endEncoding", v38, v39);
  objc_msgSend(v18, "commit");
  if (v31)
    v32 = v5;
  else
    v32 = 0;

  return v32;
}

- (id)_dehaze:(id)a3 hazeValues:
{
  float32x4_t v3;
  id v5;
  int16x4_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTLComputePipelineState **p_ltmDehaze;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  id v23;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  float32x4_t v29;
  _QWORD v30[3];
  _QWORD v31[3];
  os_log_type_t type;
  int v33;
  _DWORD v34[2];
  uint64_t v35;

  v29 = v3;
  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (int16x4_t)vcvt_s32_f32(vmul_f32(*(float32x2_t *)v29.f32, (float32x2_t)vdup_n_s32(0x477FFF00u)));
  v34[1] = (unsigned __int16)(int)vmuls_lane_f32(65535.0, v29, 2);
  v34[0] = vuzp1_s16(v6, v6).u32[0];
  -[LTMProcessor createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", CFSTR("ltmDehazedRGBATexture"), objc_msgSend(v5, "width"), objc_msgSend(v5, "height"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "commandBuffer"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    v33 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v25 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v11 = 0;
    v9 = 0;
LABEL_18:
    v22 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v9, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v33 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v26 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v11 = 0;
    goto LABEL_18;
  }
  v11 = v10;
  p_ltmDehaze = &self->_ltmDehaze;
  objc_msgSend(v10, "setComputePipelineState:", self->_ltmDehaze);
  objc_msgSend(v11, "setTexture:atIndex:", v5, 0);
  objc_msgSend(v11, "setTexture:atIndex:", v7, 1);
  objc_msgSend(v11, "setBytes:length:atIndex:", v34, 8, 0);
  v13 = -[MTLComputePipelineState threadExecutionWidth](self->_ltmDehaze, "threadExecutionWidth");
  v14 = objc_msgSend(v7, "width");
  if (v13 >= objc_msgSend(v7, "height") * v14)
  {
    v16 = objc_msgSend(v7, "width");
    v15 = objc_msgSend(v7, "height") * v16;
  }
  else
  {
    v15 = -[MTLComputePipelineState threadExecutionWidth](*p_ltmDehaze, "threadExecutionWidth");
  }
  v17 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](*p_ltmDehaze, "maxTotalThreadsPerThreadgroup") / v15;
  v18 = objc_msgSend(v7, "width");
  if (v17 >= objc_msgSend(v7, "height") * v18 / v15)
  {
    v20 = objc_msgSend(v7, "width");
    v19 = objc_msgSend(v7, "height") * v20;
  }
  else
  {
    v19 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](*p_ltmDehaze, "maxTotalThreadsPerThreadgroup");
  }
  v21 = v19 / v15;
  v31[0] = objc_msgSend(v7, "width");
  v31[1] = objc_msgSend(v7, "height");
  v22 = 1;
  v31[2] = 1;
  v30[0] = v15;
  v30[1] = v21;
  v30[2] = 1;
  objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", v31, v30);
LABEL_11:
  objc_msgSend(v11, "endEncoding", v27, v28);
  objc_msgSend(v9, "commit");
  if (v22)
    v23 = v7;
  else
    v23 = 0;

  return v23;
}

- (id)_applyGlobalCCM:(__n128)a3 globalCCM:(__n128)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  id v24;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  _QWORD v31[3];
  os_log_type_t type;
  int v33;
  _OWORD v34[3];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v34[0] = a2;
  v34[1] = a3;
  v34[2] = a4;
  v7 = a6;
  objc_msgSend(a1, "createIntermediateRGBAMetalTexture:width:height:", CFSTR("ltmCCMRGBATexture"), objc_msgSend(v7, "width"), objc_msgSend(v7, "height"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_msgSend(a1[1], "commandQueue"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "commandBuffer"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    v33 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v26 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v12 = 0;
    v10 = 0;
LABEL_18:
    v23 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v10, "computeCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v33 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v27 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v12 = 0;
    goto LABEL_18;
  }
  v12 = v11;
  v13 = a1 + 9684;
  objc_msgSend(v11, "setComputePipelineState:", a1[9684]);
  objc_msgSend(v12, "setTexture:atIndex:", v7, 0);
  objc_msgSend(v12, "setTexture:atIndex:", v8, 1);
  objc_msgSend(v12, "setBytes:length:atIndex:", v34, 48, 0);
  v14 = objc_msgSend(a1[9684], "threadExecutionWidth");
  v15 = objc_msgSend(v8, "width");
  if (v14 >= objc_msgSend(v8, "height") * v15)
  {
    v17 = objc_msgSend(v8, "width");
    v16 = objc_msgSend(v8, "height") * v17;
  }
  else
  {
    v16 = objc_msgSend(*v13, "threadExecutionWidth");
  }
  v18 = objc_msgSend(*v13, "maxTotalThreadsPerThreadgroup") / v16;
  v19 = objc_msgSend(v8, "width");
  if (v18 >= objc_msgSend(v8, "height") * v19 / v16)
  {
    v21 = objc_msgSend(v8, "width");
    v20 = objc_msgSend(v8, "height") * v21;
  }
  else
  {
    v20 = objc_msgSend(*v13, "maxTotalThreadsPerThreadgroup");
  }
  v22 = v20 / v16;
  v31[0] = objc_msgSend(v8, "width");
  v31[1] = objc_msgSend(v8, "height");
  v23 = 1;
  v31[2] = 1;
  v30[0] = v16;
  v30[1] = v22;
  v30[2] = 1;
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v31, v30);
LABEL_11:
  objc_msgSend(v12, "endEncoding", v28, v29);
  objc_msgSend(v10, "commit");
  if (v23)
    v24 = v8;
  else
    v24 = 0;

  return v24;
}

- (BOOL)_isOptimized:(int)a3
{
  return a3 != 0;
}

- (void)_prepareHighlightCompressionCurve
{
  float v2;
  uint64_t v3;
  float v4;

  if (BYTE1(self->_driverInputMetadata.highlightCompressionGain))
  {
    v3 = 0;
    v4 = (float)(*(float *)&self->_driverInputMetadata.isSIFRFrame + -1.0) / 3.0;
    do
    {
      LOWORD(v2) = highlightCompressionData_4x[v3];
      v2 = fmaxf(fminf((float)((float)((float)(int)v3 * 0.0039062) * 65534.0)+ (float)((float)((float)LODWORD(v2) - (float)((float)((float)(int)v3 * 0.0039062) * 65534.0)) * v4), 65534.0), 0.0);
      highlightCompressionDataScaled[v3++] = llroundf(v2);
    }
    while (v3 != 257);
  }
  else
  {
    *(_DWORD *)&self->_driverInputMetadata.isSIFRFrame = 0x40000000;
    memcpy(highlightCompressionDataScaled, &highlightCompressionData, 0x202uLL);
  }
}

- (int)setLTMTuningParamsFrom:(id)a3
{
  void *v4;
  char v6;

  v6 = 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Exposure"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[LTMIBPParams adaptiveHCSlope](self->_ltmParams, "adaptiveHCSlope");
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("adaptiveHCSlope"), &v6);
    -[LTMIBPParams setAdaptiveHCSlope:](self->_ltmParams, "setAdaptiveHCSlope:");
    -[LTMIBPParams ispDGainThreshold](self->_ltmParams, "ispDGainThreshold");
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("ispDGainThreshold"), &v6);
    -[LTMIBPParams setIspDGainThreshold:](self->_ltmParams, "setIspDGainThreshold:");
  }

  return 0;
}

- (int)setDehazeTuningParamsFrom:(id)a3
{
  void *v4;
  HazeEstimation **p_hazeEstimator;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  double v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  double v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  double v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  double v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  double v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  double v45;
  void *v46;
  int v47;
  int v48;
  void *v49;
  double v50;
  void *v51;
  int v52;
  int v53;
  void *v54;
  double v55;
  NSObject *v56;
  void *v57;
  int v58;
  int v59;
  void *v60;
  double v61;
  void *v62;
  int v63;
  int v64;
  void *v65;
  double v66;
  void *v67;
  int v68;
  int v69;
  void *v70;
  double v71;
  void *v72;
  int v73;
  int v74;
  void *v75;
  double v76;
  void *v77;
  int v78;
  int v79;
  void *v80;
  double v81;
  void *v82;
  int v83;
  int v84;
  void *v85;
  double v86;
  void *v87;
  int v88;
  int v89;
  void *v90;
  double v91;
  void *v92;
  int v93;
  int v94;
  void *v95;
  double v96;
  void *v97;
  int v98;
  int v99;
  void *v100;
  double v101;
  void *v102;
  int v103;
  int v104;
  void *v105;
  double v106;
  char v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v108 = 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Dehaze"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v56 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
LABEL_27:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    LODWORD(v56) = -1;
    goto LABEL_24;
  }
  p_hazeEstimator = &self->_hazeEstimator;
  -[HazeEstimation hazeProperties](self->_hazeEstimator, "hazeProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reluC1");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC1"), &v108);
  v8 = v7;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = v8;
  objc_msgSend(v9, "setReluC1:", v10);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reluC2");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC2"), &v108);
  v13 = v12;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = v13;
  objc_msgSend(v14, "setReluC2:", v15);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reluC3");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC3"), &v108);
  v18 = v17;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = v18;
  objc_msgSend(v19, "setReluC3:", v20);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reluC4");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC4"), &v108);
  v23 = v22;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = v23;
  objc_msgSend(v24, "setReluC4:", v25);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "reluC5");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC5"), &v108);
  v28 = v27;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = v28;
  objc_msgSend(v29, "setReluC5:", v30);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sr_min");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sr_min"), &v108);
  v33 = v32;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = v33;
  objc_msgSend(v34, "setSr_min:", v35);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sr_var");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sr_var"), &v108);
  v38 = v37;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v40) = v38;
  objc_msgSend(v39, "setSr_var:", v40);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sr_pow");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sr_pow"), &v108);
  v43 = v42;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v45) = v43;
  objc_msgSend(v44, "setSr_pow:", v45);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "sr_sat");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sr_sat"), &v108);
  v48 = v47;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = v48;
  objc_msgSend(v49, "setSr_sat:", v50);

  if (!v108)
    goto LABEL_26;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "min_display_black");
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("min_display_black"), &v108);
  v53 = v52;
  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = v53;
  objc_msgSend(v54, "setMin_display_black:", v55);

  if (!v108)
  {
LABEL_26:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v56 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    goto LABEL_27;
  }
  -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
  v56 = objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "reluC1");
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC1_forLTM"), &v108);
    v59 = v58;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v61) = v59;
    objc_msgSend(v60, "setReluC1:", v61);

    if (!v108)
      goto LABEL_23;
    -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "reluC2");
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC2_forLTM"), &v108);
    v64 = v63;
    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v66) = v64;
    objc_msgSend(v65, "setReluC2:", v66);

    if (v108)
    {
      -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "reluC3");
      objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC3_forLTM"), &v108);
      v69 = v68;
      -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v71) = v69;
      objc_msgSend(v70, "setReluC3:", v71);

      if (v108)
      {
        -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "reluC4");
        objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC4_forLTM"), &v108);
        v74 = v73;
        -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v76) = v74;
        objc_msgSend(v75, "setReluC4:", v76);

        if (v108)
        {
          -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "reluC5");
          objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("reluC5_forLTM"), &v108);
          v79 = v78;
          -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v81) = v79;
          objc_msgSend(v80, "setReluC5:", v81);

          if (v108)
          {
            -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "sr_min");
            objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sr_min_forLTM"), &v108);
            v84 = v83;
            -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v86) = v84;
            objc_msgSend(v85, "setSr_min:", v86);

            if (v108)
            {
              -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "sr_var");
              objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sr_var_forLTM"), &v108);
              v89 = v88;
              -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v91) = v89;
              objc_msgSend(v90, "setSr_var:", v91);

              if (v108)
              {
                -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "sr_pow");
                objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sr_pow_forLTM"), &v108);
                v94 = v93;
                -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v96) = v94;
                objc_msgSend(v95, "setSr_pow:", v96);

                if (v108)
                {
                  -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v97, "sr_sat");
                  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sr_sat_forLTM"), &v108);
                  v99 = v98;
                  -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v101) = v99;
                  objc_msgSend(v100, "setSr_sat:", v101);

                  if (v108)
                  {
                    -[HazeEstimation hazeProperties](*p_hazeEstimator, "hazeProperties");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v102, "min_display_black");
                    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", CFSTR("min_display_black_forLTM"), &v108);
                    v104 = v103;
                    -[HazeEstimation hazePropertiesForLTM](*p_hazeEstimator, "hazePropertiesForLTM");
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v106) = v104;
                    objc_msgSend(v105, "setMin_display_black:", v106);

                    if (v108)
                    {
LABEL_23:
                      LODWORD(v56) = 0;
                      goto LABEL_24;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_26;
  }
LABEL_24:

  return (int)v56;
}

- (int)setLTMComputeTuningParams:(sRefDriverInputs *)a3 from:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v13;

  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SDR"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HLG"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DigitalFlash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v8 && v9)
  {
    v10 = -[LTMProcessor getLTMTuningFromTuningParams:from:](self, "getLTMTuningFromTuningParams:from:", &a3[1].hardIspDGain, v7);
    if (v10
      || (v10 = -[LTMProcessor getLTMTuningFromTuningParams:from:](self, "getLTMTuningFromTuningParams:from:", &a3[1].flashMixPercentage[22], v8)) != 0)
    {
      v11 = v10;
    }
    else
    {
      v11 = -[LTMProcessor getLTMTuningFromTuningParams:from:](self, "getLTMTuningFromTuningParams:from:", &a3[1].flashMixPercentage[76], v9);
      if (!v11)
        LOBYTE(a3[1].flashMixPercentage[130]) = 1;
    }
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v13 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v11 = -1;
  }

  return v11;
}

- (int)getLTMTuningFromTuningParams:(LTMTuning *)a3 from:(id)a4
{
  id v5;
  double v6;
  double v7;
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
  double v20;
  double v21;
  double v22;
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
  float v33;
  int v34;
  NSObject *v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v37 = 0;
  LODWORD(v6) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("histDampingExponentHighlight"), &v37, v6);
  a3->histDampingExponentHighlight = *(float *)&v7;
  if (!v37)
    goto LABEL_30;
  LODWORD(v7) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("histDampingExponentMax"), &v37, v7);
  a3->histDampingExponentMax = *(float *)&v8;
  if (!v37)
    goto LABEL_30;
  LODWORD(v8) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("hmaxHeadroom"), &v37, v8);
  a3->hmaxHeadroom = *(float *)&v9;
  if (!v37)
    goto LABEL_30;
  LODWORD(v9) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("maxPaddingRange"), &v37, v9);
  a3->maxPaddingRange = *(float *)&v10;
  if (!v37)
    goto LABEL_30;
  LODWORD(v10) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("dispRangeActiveRatio"), &v37, v10);
  a3->dispRangeActiveRatio = *(float *)&v11;
  if (!v37)
    goto LABEL_30;
  LODWORD(v11) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sceneBlackRatio"), &v37, v11);
  a3->sceneBlackRatio = *(float *)&v12;
  if (!v37)
    goto LABEL_30;
  LODWORD(v12) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sceneBlackRatioDark"), &v37, v12);
  a3->sceneBlackRatioDark = *(float *)&v13;
  if (!v37)
    goto LABEL_30;
  LODWORD(v13) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sceneBgOffset"), &v37, v13);
  a3->sceneBgOffset = *(float *)&v14;
  if (!v37)
    goto LABEL_30;
  LODWORD(v14) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("desatStrength"), &v37, v14);
  a3->desatStrength = *(float *)&v15;
  if (!v37)
    goto LABEL_30;
  LODWORD(v15) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("minFlareDark"), &v37, v15);
  a3->minFlareDark = *(float *)&v16;
  if (!v37)
    goto LABEL_30;
  LODWORD(v16) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("shadowSuppressBase"), &v37, v16);
  a3->shadowSuppressBase = *(float *)&v17;
  if (!v37)
    goto LABEL_30;
  LODWORD(v17) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("shadowSuppressMax"), &v37, v17);
  a3->shadowSuppressMax = *(float *)&v18;
  if (!v37)
    goto LABEL_30;
  LODWORD(v18) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("minSceneLux"), &v37, v18);
  a3->minSceneLux = *(float *)&v19;
  if (!v37)
    goto LABEL_30;
  LODWORD(v19) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("histSmoothingMax"), &v37, v19);
  a3->histSmoothingMax = *(float *)&v20;
  if (!v37)
    goto LABEL_30;
  LODWORD(v20) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("smoothingStrength"), &v37, v20);
  a3->smoothingStrength = *(float *)&v21;
  if (!v37)
    goto LABEL_30;
  LODWORD(v21) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("dispRangeDarkRatio"), &v37, v21);
  a3->dispRangeDarkRatio = *(float *)&v22;
  if (!v37)
    goto LABEL_30;
  LODWORD(v22) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sceneModelSmoothing"), &v37, v22);
  a3->sceneModelSmoothing = *(float *)&v23;
  if (!v37)
    goto LABEL_30;
  LODWORD(v23) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("nonFaceRatioFloor"), &v37, v23);
  a3->nonFaceRatioFloor = *(float *)&v24;
  if (!v37)
    goto LABEL_30;
  LODWORD(v24) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("fstart"), &v37, v24);
  a3->fstart = *(float *)&v25;
  if (!v37)
    goto LABEL_30;
  LODWORD(v25) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("shadowDesat"), &v37, v25);
  a3->shadowDesat = *(float *)&v26;
  if (!v37)
    goto LABEL_30;
  LODWORD(v26) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("darkSceneLux"), &v37, v26);
  a3->darkSceneLux = *(float *)&v27;
  if (!v37)
    goto LABEL_30;
  LODWORD(v27) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("ambientViewingLux"), &v37, v27);
  a3->ambientViewingLux = *(float *)&v28;
  if (!v37)
    goto LABEL_30;
  LODWORD(v28) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("ambientViewingChromaticityX"), &v37, v28);
  a3->ambientViewingChromaticityX = *(float *)&v29;
  if (!v37)
    goto LABEL_30;
  LODWORD(v29) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("ambientViewingChromaticityY"), &v37, v29);
  a3->ambientViewingChromaticityY = *(float *)&v30;
  if (!v37)
    goto LABEL_30;
  LODWORD(v30) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("sceneBlackMax"), &v37, v30);
  a3->sceneBlackMax = *(float *)&v31;
  if (!v37)
    goto LABEL_30;
  LODWORD(v31) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("dispLum"), &v37, v31);
  a3->dispLum = *(float *)&v32;
  if (v37
    && (LODWORD(v32) = 0,
        objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", CFSTR("dispBlack"), &v37, v32),
        a3->dispBlack = v33,
        v37))
  {
    v34 = 0;
  }
  else
  {
LABEL_30:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v36 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v34 = -1;
  }

  return v34;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metalCommandQueue, a3);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, a3);
}

- (LTMIBPParams)ltmParams
{
  return self->_ltmParams;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
  objc_storeStrong((id *)&self->_externalMemoryResource, a3);
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->tuningParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_ltmParams, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_hazeEstimator, 0);
  objc_storeStrong((id *)&self->_metadataExtractor, 0);
  objc_storeStrong((id *)&self->_driverLTM, 0);
  objc_storeStrong((id *)&self->_computeLTM, 0);
  objc_storeStrong((id *)&self->_geometryData, 0);
  objc_storeStrong((id *)&self->_ltmApplyGlobalCCM, 0);
  objc_storeStrong((id *)&self->_ltmDehaze, 0);
  objc_storeStrong((id *)&self->_ltmCompressHighlight, 0);
  objc_storeStrong((id *)&self->_ltmDownsampleRGBAFloatToRGB, 0);
  objc_storeStrong((id *)&self->_ltmDownsampleYCbCrToRGB, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
