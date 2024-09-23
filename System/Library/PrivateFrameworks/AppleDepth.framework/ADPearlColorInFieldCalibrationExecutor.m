@implementation ADPearlColorInFieldCalibrationExecutor

- (ADPearlColorInFieldCalibrationExecutor)init
{
  return (ADPearlColorInFieldCalibrationExecutor *)-[ADPearlColorInFieldCalibrationExecutor initForEngineType:](self, "initForEngineType:", 0);
}

- (id)initForEngineType:(unint64_t)a3 andExecutorParameters:(id)a4
{
  id v6;
  ADPearlColorInFieldCalibrationExecutor *v7;
  ADPearlColorInFieldCalibrationExecutor *v8;
  ADPearlColorInFieldCalibrationExecutor *v9;
  ADPearlColorInFieldCalibrationPipeline *v10;
  void *v11;
  uint64_t v12;
  ADPearlColorInFieldCalibrationPipeline *pipeline;
  ADEspressoRunner *backendEspressoRunner;
  ADEspressoRunner *frontendEspressoRunner;
  ADCameraCalibration *mcamPCameraCalibration;
  ADPearlColorInFieldCalibrationExecutorParameters *v17;
  void *v18;
  uint64_t v19;
  ADPearlColorInFieldCalibrationExecutorParameters *executorParameters;
  ADEspressoBufferHandle *featuresOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendFeaturesInputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendErrorXOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendErrorYOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendErrorZOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotationXOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotationYOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotationZOutputEspressoBufferHandle;
  void *v29;
  void *v30;
  void *v31;
  unint64_t frontendFeaturesInputElementSize;
  void *v33;
  void *v34;
  void *v35;
  unint64_t backendFeaturesOutputElementSize;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  ADPearlColorInFieldCalibrationExecutor *v40;
  NSObject *v41;
  const char *v42;
  uint8_t buf[8];
  objc_super v45;
  int v46;
  __int128 v47;
  __int128 v48;

  v6 = a4;
  v46 = 335679636;
  v47 = 0u;
  v48 = 0u;
  kdebug_trace();
  v45.receiver = self;
  v45.super_class = (Class)ADPearlColorInFieldCalibrationExecutor;
  v7 = -[ADExecutor init](&v45, sel_init);
  v8 = v7;
  v9 = v7;
  if (!v7)
    goto LABEL_9;
  v7->_isPrepared = 0;
  v10 = [ADPearlColorInFieldCalibrationPipeline alloc];
  objc_msgSend(v6, "pipelineParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ADPearlColorInFieldCalibrationPipeline initWithParameters:espressoEngine:](v10, "initWithParameters:espressoEngine:", v11, a3);
  pipeline = v9->_pipeline;
  v9->_pipeline = (ADPearlColorInFieldCalibrationPipeline *)v12;

  if (!v9->_pipeline)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v41 = MEMORY[0x24BDACB70];
    v42 = "Pearl Color In Field Calibration pipeline failed to init ";
LABEL_18:
    _os_log_error_impl(&dword_20B62B000, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
    goto LABEL_19;
  }
  v9->super._engineType = a3;
  backendEspressoRunner = v9->_backendEspressoRunner;
  v9->_backendEspressoRunner = 0;

  frontendEspressoRunner = v9->_frontendEspressoRunner;
  v9->_frontendEspressoRunner = 0;

  mcamPCameraCalibration = v9->_mcamPCameraCalibration;
  v9->_mcamPCameraCalibration = 0;

  v17 = [ADPearlColorInFieldCalibrationExecutorParameters alloc];
  -[ADPearlColorInFieldCalibrationPipeline pipelineParameters](v9->_pipeline, "pipelineParameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ADPearlColorInFieldCalibrationExecutorParameters initWithPipelineParameters:](v17, "initWithPipelineParameters:", v18);
  executorParameters = v9->_executorParameters;
  v9->_executorParameters = (ADPearlColorInFieldCalibrationExecutorParameters *)v19;

  if (!v9->_executorParameters)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v41 = MEMORY[0x24BDACB70];
    v42 = "Pearl Color In Field Calibration executor parameters failed to init ";
    goto LABEL_18;
  }
  -[ADPearlColorInFieldCalibrationExecutor setVmcamToWmcamExtrinsics:](v9, "setVmcamToWmcamExtrinsics:");
  -[ADPearlColorInFieldCalibrationExecutor setWmcamToMcamExtrinsics:](v9, "setWmcamToMcamExtrinsics:", *(double *)&_PromotedConst_5315, 0.0078125, 0.0, 0.0);
  v9->_itmPreProcessedColor = 0;
  v9->_itmPreProcessedPearl = 0;
  v9->_itmPreProcessedPearlMask = 0;
  featuresOutputEspressoBufferHandle = v9->_featuresOutputEspressoBufferHandle;
  v9->_featuresOutputEspressoBufferHandle = 0;

  frontendFeaturesInputEspressoBufferHandle = v9->_frontendFeaturesInputEspressoBufferHandle;
  v9->_frontendFeaturesInputEspressoBufferHandle = 0;

  frontendErrorXOutputEspressoBufferHandle = v9->_frontendErrorXOutputEspressoBufferHandle;
  v9->_frontendErrorXOutputEspressoBufferHandle = 0;

  frontendErrorYOutputEspressoBufferHandle = v9->_frontendErrorYOutputEspressoBufferHandle;
  v9->_frontendErrorYOutputEspressoBufferHandle = 0;

  frontendErrorZOutputEspressoBufferHandle = v9->_frontendErrorZOutputEspressoBufferHandle;
  v9->_frontendErrorZOutputEspressoBufferHandle = 0;

  frontendRotationXOutputEspressoBufferHandle = v9->_frontendRotationXOutputEspressoBufferHandle;
  v9->_frontendRotationXOutputEspressoBufferHandle = 0;

  frontendRotationYOutputEspressoBufferHandle = v9->_frontendRotationYOutputEspressoBufferHandle;
  v9->_frontendRotationYOutputEspressoBufferHandle = 0;

  frontendRotationZOutputEspressoBufferHandle = v9->_frontendRotationZOutputEspressoBufferHandle;
  v9->_frontendRotationZOutputEspressoBufferHandle = 0;

  -[ADPearlColorInFieldCalibrationPipeline frontendInferenceDescriptor](v9->_pipeline, "frontendInferenceDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "featuresInput");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageDescriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_frontendFeaturesInputElementSize = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v31, "pixelFormat"), 0);

  frontendFeaturesInputElementSize = v9->_frontendFeaturesInputElementSize;
  if (frontendFeaturesInputElementSize != 2 && frontendFeaturesInputElementSize != 4)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v41 = MEMORY[0x24BDACB70];
    v42 = "Unexpected pixel format for frontend input";
    goto LABEL_18;
  }
  -[ADPearlColorInFieldCalibrationPipeline backendInferenceDescriptor](v9->_pipeline, "backendInferenceDescriptor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "featuresOutput");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "imageDescriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_backendFeaturesOutputElementSize = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v35, "pixelFormat"), 0);

  backendFeaturesOutputElementSize = v9->_backendFeaturesOutputElementSize;
  if (backendFeaturesOutputElementSize != 2 && backendFeaturesOutputElementSize != 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v41 = MEMORY[0x24BDACB70];
      v42 = "Unexpected pixel format for backend output";
      goto LABEL_18;
    }
LABEL_19:
    v40 = 0;
    goto LABEL_20;
  }
  v9->_backendResultAggregated = 0;
  v9->_backendResultAggregationCounter = 0;
  v9->_backendSingleResultSize = 0;
  v9->_lastColorTimestamp = 0.0;
  v38 = *MEMORY[0x24BDAEE00];
  v37 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
  v39 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
  *(_OWORD *)&v8->_anon_140[32] = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
  *(_OWORD *)&v8->_anon_140[48] = v39;
  *(_OWORD *)v8->_anon_140 = v38;
  *(_OWORD *)&v8->_anon_140[16] = v37;
LABEL_9:
  v40 = v9;
LABEL_20:
  kdebug_trace();

  return v40;
}

- (id)initForEngineType:(unint64_t)a3
{
  ADPearlColorInFieldCalibrationExecutorParameters *v5;
  id v6;

  kdebug_trace();
  v5 = objc_alloc_init(ADPearlColorInFieldCalibrationExecutorParameters);
  v6 = -[ADPearlColorInFieldCalibrationExecutor initForEngineType:andExecutorParameters:](self, "initForEngineType:andExecutorParameters:", a3, v5);

  kdebug_trace();
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_backendResultAggregated)
    MEMORY[0x20BD36480]();
  -[ADPearlColorInFieldCalibrationExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  v3.receiver = self;
  v3.super_class = (Class)ADPearlColorInFieldCalibrationExecutor;
  -[ADExecutor dealloc](&v3, sel_dealloc);
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedPearl);
  self->_itmPreProcessedPearl = 0;
  CVPixelBufferRelease(self->_itmPreProcessedPearlMask);
  self->_itmPreProcessedPearlMask = 0;
}

- (int64_t)allocateIntermediateBuffers
{
  void *v3;
  ADEspressoRunner *backendEspressoRunner;
  void *v5;
  ADEspressoRunner *v6;
  void *v7;
  void *v8;
  ADEspressoRunner *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ADEspressoRunner *v13;
  void *v14;
  ADEspressoBufferHandle *v15;
  ADEspressoBufferHandle *featuresOutputEspressoBufferHandle;
  ADEspressoRunner *frontendEspressoRunner;
  void *v18;
  ADEspressoBufferHandle *v19;
  ADEspressoBufferHandle *frontendFeaturesInputEspressoBufferHandle;
  ADEspressoRunner *v21;
  void *v22;
  ADEspressoBufferHandle *v23;
  ADEspressoBufferHandle *frontendRotationXOutputEspressoBufferHandle;
  ADEspressoRunner *v25;
  void *v26;
  ADEspressoBufferHandle *v27;
  ADEspressoBufferHandle *frontendRotationYOutputEspressoBufferHandle;
  void *v29;
  ADEspressoRunner *v30;
  void *v31;
  ADEspressoBufferHandle *v32;
  ADEspressoBufferHandle *frontendRotationZOutputEspressoBufferHandle;
  ADEspressoRunner *v34;
  void *v35;
  ADEspressoBufferHandle *v36;
  ADEspressoBufferHandle *frontendErrorXOutputEspressoBufferHandle;
  ADEspressoRunner *v38;
  void *v39;
  ADEspressoBufferHandle *v40;
  ADEspressoBufferHandle *frontendErrorYOutputEspressoBufferHandle;
  void *v42;
  ADEspressoRunner *v43;
  void *v44;
  ADEspressoBufferHandle *v45;
  ADEspressoBufferHandle *frontendErrorZOutputEspressoBufferHandle;
  uint64_t v47;
  void *v48;
  void *v50;
  int64_t v51;
  void *v52;
  void *v53;

  -[ADPearlColorInFieldCalibrationExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  -[ADPearlColorInFieldCalibrationPipeline backendInferenceDescriptor](self->_pipeline, "backendInferenceDescriptor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADPearlColorInFieldCalibrationPipeline frontendInferenceDescriptor](self->_pipeline, "frontendInferenceDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backendEspressoRunner = self->_backendEspressoRunner;
  objc_msgSend(v53, "colorInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](backendEspressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  v6 = self->_backendEspressoRunner;
  objc_msgSend(v53, "pearlInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedPearl = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v6, "createAndRegisterPixelBufferForDescriptor:", v7);

  objc_msgSend(v53, "pearlMaskInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_backendEspressoRunner;
    objc_msgSend(v53, "pearlMaskInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmPreProcessedPearlMask = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v9, "createAndRegisterPixelBufferForDescriptor:", v10);

  }
  +[ADUtils getStandardNameForBufferOfType:moduleName:](ADUtils, "getStandardNameForBufferOfType:moduleName:", CFSTR("itmPreProcessedColor"), CFSTR("RGBP"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADUtils updatePixelBufferIOSurfaceLabel:pixelBuffer:](ADUtils, "updatePixelBufferIOSurfaceLabel:pixelBuffer:", v11, self->_itmPreProcessedColor);
  +[ADUtils getStandardNameForBufferOfType:moduleName:](ADUtils, "getStandardNameForBufferOfType:moduleName:", CFSTR("itmPreProcessedPearl"), CFSTR("RGBP"));
  v12 = objc_claimAutoreleasedReturnValue();

  v52 = (void *)v12;
  +[ADUtils updatePixelBufferIOSurfaceLabel:pixelBuffer:](ADUtils, "updatePixelBufferIOSurfaceLabel:pixelBuffer:", v12, self->_itmPreProcessedPearl);
  v13 = self->_backendEspressoRunner;
  objc_msgSend(v53, "featuresOutput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v13, "registerDescriptor:", v14);
  v15 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  featuresOutputEspressoBufferHandle = self->_featuresOutputEspressoBufferHandle;
  self->_featuresOutputEspressoBufferHandle = v15;

  frontendEspressoRunner = self->_frontendEspressoRunner;
  objc_msgSend(v3, "featuresInput");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](frontendEspressoRunner, "registerDescriptor:", v18);
  v19 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendFeaturesInputEspressoBufferHandle = self->_frontendFeaturesInputEspressoBufferHandle;
  self->_frontendFeaturesInputEspressoBufferHandle = v19;

  v21 = self->_frontendEspressoRunner;
  objc_msgSend(v3, "rotationXOutput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v21, "registerDescriptor:", v22);
  v23 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendRotationXOutputEspressoBufferHandle = self->_frontendRotationXOutputEspressoBufferHandle;
  self->_frontendRotationXOutputEspressoBufferHandle = v23;

  v25 = self->_frontendEspressoRunner;
  objc_msgSend(v3, "rotationYOutput");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v25, "registerDescriptor:", v26);
  v27 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendRotationYOutputEspressoBufferHandle = self->_frontendRotationYOutputEspressoBufferHandle;
  self->_frontendRotationYOutputEspressoBufferHandle = v27;

  objc_msgSend(v3, "rotationZOutput");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = self->_frontendEspressoRunner;
    objc_msgSend(v3, "rotationZOutput");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADEspressoRunner registerDescriptor:](v30, "registerDescriptor:", v31);
    v32 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
    frontendRotationZOutputEspressoBufferHandle = self->_frontendRotationZOutputEspressoBufferHandle;
    self->_frontendRotationZOutputEspressoBufferHandle = v32;

  }
  v34 = self->_frontendEspressoRunner;
  objc_msgSend(v3, "errorXOutput");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v34, "registerDescriptor:", v35);
  v36 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendErrorXOutputEspressoBufferHandle = self->_frontendErrorXOutputEspressoBufferHandle;
  self->_frontendErrorXOutputEspressoBufferHandle = v36;

  v38 = self->_frontendEspressoRunner;
  objc_msgSend(v3, "errorYOutput");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v38, "registerDescriptor:", v39);
  v40 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendErrorYOutputEspressoBufferHandle = self->_frontendErrorYOutputEspressoBufferHandle;
  self->_frontendErrorYOutputEspressoBufferHandle = v40;

  objc_msgSend(v3, "errorZOutput");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = self->_frontendEspressoRunner;
    objc_msgSend(v3, "errorZOutput");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADEspressoRunner registerDescriptor:](v43, "registerDescriptor:", v44);
    v45 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
    frontendErrorZOutputEspressoBufferHandle = self->_frontendErrorZOutputEspressoBufferHandle;
    self->_frontendErrorZOutputEspressoBufferHandle = v45;

  }
  if (self->_itmPreProcessedColor
    && self->_itmPreProcessedPearl
    && self->_featuresOutputEspressoBufferHandle
    && self->_frontendFeaturesInputEspressoBufferHandle
    && self->_frontendRotationXOutputEspressoBufferHandle
    && self->_frontendRotationYOutputEspressoBufferHandle
    && self->_frontendErrorXOutputEspressoBufferHandle
    && self->_frontendErrorYOutputEspressoBufferHandle
    && (!-[ADPearlColorInFieldCalibrationPipeline isPearlMaskExpected](self->_pipeline, "isPearlMaskExpected")
     || self->_itmPreProcessedPearlMask)
    && (!-[ADPearlColorInFieldCalibrationPipeline isZused](self->_pipeline, "isZused")
     || self->_frontendRotationZOutputEspressoBufferHandle && self->_frontendErrorZOutputEspressoBufferHandle))
  {
    v47 = -[ADEspressoBufferHandle dimensionsProduct](self->_featuresOutputEspressoBufferHandle, "dimensionsProduct");
    -[ADPearlColorInFieldCalibrationExecutorParameters pipelineParameters](self->_executorParameters, "pipelineParameters");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "featuresVectorAggregationSize");

    self->_backendSingleResultSize = self->_backendFeaturesOutputElementSize * v47;
    v50 = v53;
    v51 = 0;
    self->_backendResultAggregated = (void *)operator new[]();
  }
  else
  {
    -[ADPearlColorInFieldCalibrationExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
    v51 = -22971;
    v50 = v53;
  }

  return v51;
}

- (int64_t)prepare
{
  ADPearlColorInFieldCalibrationExecutor *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t engineType;
  void *v8;
  uint64_t v9;
  ADEspressoRunner *backendEspressoRunner;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  ADEspressoRunner *frontendEspressoRunner;
  int64_t v19;
  uint8_t v21[8];
  int v22;
  __int128 v23;
  __int128 v24;

  v2 = self;
  objc_sync_enter(v2);
  v22 = 335680140;
  v23 = 0u;
  v24 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "pearl color infield calibration executor: preparing executor", v21, 2u);
  }
  -[ADPearlColorInFieldCalibrationPipeline backendInferenceDescriptor](v2->_pipeline, "backendInferenceDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE05FB0]);
  objc_msgSend(v3, "networkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  engineType = v2->super._engineType;
  objc_msgSend(v3, "configurationNameForLayout:", v2->super._layout);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "initWithPath:forEngine:configurationName:", v6, engineType, v8);
  backendEspressoRunner = v2->_backendEspressoRunner;
  v2->_backendEspressoRunner = (ADEspressoRunner *)v9;

  if (v2->_backendEspressoRunner)
  {
    -[ADPearlColorInFieldCalibrationPipeline frontendInferenceDescriptor](v2->_pipeline, "frontendInferenceDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BE05FB0]);
    objc_msgSend(v11, "networkURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v2->super._engineType;
    objc_msgSend(v11, "configurationNameForLayout:", v2->super._layout);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "initWithPath:forEngine:configurationName:", v14, v15, v16);
    frontendEspressoRunner = v2->_frontendEspressoRunner;
    v2->_frontendEspressoRunner = (ADEspressoRunner *)v17;

    if (v2->_frontendEspressoRunner)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "preparing pearl color in field calibration executor", v21, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v21 = 0;
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "preparing pearl color in field calibration executor", v21, 2u);
      }
      v19 = -[ADPearlColorInFieldCalibrationExecutor allocateIntermediateBuffers](v2, "allocateIntermediateBuffers");
      if (v19)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v21 = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to allocate buffers", v21, 2u);
        }
      }
      else
      {
        v2->_isPrepared = 1;
      }
    }
    else
    {
      v19 = -22960;
    }

  }
  else
  {
    v19 = -22960;
  }

  kdebug_trace();
  objc_sync_exit(v2);

  return v19;
}

- (double)rectifyColorCameraExtrinsics:(float32x4_t)a3
{
  double result;

  *(_QWORD *)&result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1[52].f32)), a3, a1[52], 1), a4, *(float32x4_t *)a1[52].f32, 2).u64[0];
  return result;
}

- (void)setPearlCameraCalibration:(id)a3
{
  void *v4;
  ADCameraCalibration *pearlCameraCalibration;
  ADCameraCalibration *v6;
  ADCameraCalibration *v7;
  id v8;

  v8 = a3;
  -[ADExecutorParameters logger](self->_executorParameters, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCalibration:name:timestamp:", v8, "inputPearlCalibration", self->_lastColorTimestamp);

  pearlCameraCalibration = self->_pearlCameraCalibration;
  if (!pearlCameraCalibration || (-[ADCameraCalibration isEqual:](pearlCameraCalibration, "isEqual:", v8) & 1) == 0)
  {
    v6 = (ADCameraCalibration *)objc_msgSend(v8, "copy");
    v7 = self->_pearlCameraCalibration;
    self->_pearlCameraCalibration = v6;

    -[ADPearlColorInFieldCalibrationPipeline updatePearlCamera:](self->_pipeline, "updatePearlCamera:", self->_pearlCameraCalibration);
  }

}

- (void)setColorCameraCalibration:(id)a3
{
  void *v4;
  ADCameraCalibration *colorCameraCalibration;
  ADCameraCalibration *v6;
  ADCameraCalibration *v7;
  ADPearlColorInFieldCalibrationPipeline *pipeline;
  ADCameraCalibration *v9;
  ADCameraCalibration *v10;
  ADCameraCalibration *mcamPCameraCalibration;
  void *v12;
  id v13;

  v13 = a3;
  -[ADExecutorParameters logger](self->_executorParameters, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCalibration:name:timestamp:", v13, "inputColorCalibration", self->_lastColorTimestamp);

  colorCameraCalibration = self->_colorCameraCalibration;
  if (!colorCameraCalibration || (-[ADCameraCalibration isEqual:](colorCameraCalibration, "isEqual:", v13) & 1) == 0)
  {
    v6 = (ADCameraCalibration *)objc_msgSend(v13, "copy");
    v7 = self->_colorCameraCalibration;
    self->_colorCameraCalibration = v6;

    pipeline = self->_pipeline;
    v9 = self->_colorCameraCalibration;
    -[ADCameraCalibration cameraToPlatformTransform](v9, "cameraToPlatformTransform");
    -[ADPearlColorInFieldCalibrationExecutor rectifyColorCameraExtrinsics:](self, "rectifyColorCameraExtrinsics:");
    -[ADPearlColorInFieldCalibrationPipeline createReferenceCameraForColor:withExtrinsics:](pipeline, "createReferenceCameraForColor:withExtrinsics:", v9);
    v10 = (ADCameraCalibration *)objc_claimAutoreleasedReturnValue();
    mcamPCameraCalibration = self->_mcamPCameraCalibration;
    self->_mcamPCameraCalibration = v10;

    -[ADExecutorParameters logger](self->_executorParameters, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logCalibration:name:timestamp:", self->_mcamPCameraCalibration, "referenceColorCameraCalibration", self->_lastColorTimestamp);

  }
}

- (uint64_t)setWmcamToMcamExtrinsics:(float32x4_t)a3
{
  uint32x4_t v5;

  v5 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(result + 496), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(result + 480), a2)), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(result + 512), a4), (int8x16_t)vceqq_f32(*(float32x4_t *)(result + 528), a5)));
  v5.i32[3] = v5.i32[2];
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    *(float32x4_t *)(result + 480) = a2;
    *(float32x4_t *)(result + 496) = a3;
    *(float32x4_t *)(result + 512) = a4;
    *(float32x4_t *)(result + 528) = a5;
    return objc_msgSend(*(id *)(result + 384), "updateWmcamToMcamExtrinsics:");
  }
  return result;
}

- (BOOL)normalizedDX:(__CVBuffer *)a3 toDepth:(__CVBuffer *)a4 withMultiplier:(double)a5 andOffset:(double)a6
{
  size_t Width;
  size_t Height;
  size_t v12;
  size_t v13;
  int BytesPerRow;
  int v15;
  unsigned __int16 *BaseAddress;
  _WORD *v17;
  uint64_t i;
  BOOL v19;
  size_t v21;
  __int16 v22;
  unsigned int v23;

  Width = CVPixelBufferGetWidth(a3);
  if (Width != CVPixelBufferGetWidth(a4))
    return 0;
  Height = CVPixelBufferGetHeight(a3);
  if (Height != CVPixelBufferGetHeight(a4)
    || CVPixelBufferGetPixelFormatType(a3) != 825306677
    || CVPixelBufferGetPixelFormatType(a4) != 825437747)
  {
    return 0;
  }
  v12 = CVPixelBufferGetWidth(a3);
  v13 = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  v15 = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a3);
  v17 = CVPixelBufferGetBaseAddress(a4);
  if (v13 && v12)
  {
    for (i = 0; i != v13; ++i)
    {
      v21 = v12;
      do
      {
        v23 = *BaseAddress;
        if (v23 == 0x1FFF)
          v22 = 0;
        else
          v22 = vcvtd_n_s64_f64(1.0 / (a6 + (double)v23 * a5) * 1000.0, 3uLL);
        *v17++ = v22;
        ++BaseAddress;
        --v21;
      }
      while (v21);
      BaseAddress += (unsigned __int16)((unint64_t)(v15 - 2 * v12) >> 1);
      v17 += (unsigned __int16)((unint64_t)(BytesPerRow - 2 * v12) >> 1);
    }
  }
  v19 = 1;
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return v19;
}

- (uint64_t)preprocessInputColorFrame:(double)a3 pearlNormalizedDX:(double)a4 pearlPoses:(double)a5 disparityNormalizationMultiplier:(double)a6 disparityNormalizationOffset:(double)a7 pceCameraCalibration:(uint64_t)a8 pearlCameraCalibrationTransform:(uint64_t)a9 colorCameraCalibration:(__CVBuffer *)a10 timestamp:(void *)a11
{
  id v29;
  id v30;
  size_t Width;
  size_t Height;
  const __CFDictionary *BufferAttributes;
  CVReturn v34;
  __CVBuffer *v35;
  BOOL v36;
  uint64_t v37;
  CVPixelBufferRef pixelBufferOut;

  v29 = a11;
  v30 = a12;
  Width = CVPixelBufferGetWidth(a10);
  Height = CVPixelBufferGetHeight(a10);
  pixelBufferOut = 0;
  BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  v34 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x31332E33u, BufferAttributes, &pixelBufferOut);
  v35 = pixelBufferOut;
  if (v34)
    v36 = 1;
  else
    v36 = pixelBufferOut == 0;
  if (v36)
  {
    v37 = -22950;
  }
  else
  {
    objc_msgSend(a1, "normalizedDX:toDepth:withMultiplier:andOffset:", a10, pixelBufferOut, a6, a7);
    v37 = objc_msgSend(a1, "preprocessInputColorFrame:pearlDepth:pearlPoses:pceCameraCalibration:pearlCameraCalibrationTransform:colorCameraCalibration:timestamp:", a9, v35, v29, v30, a2, a3, a4, a5, a17, a19, a21, a23, a25);
    CVPixelBufferRelease(v35);
  }

  return v37;
}

- (uint64_t)preprocessInputColorFrame:(__n128)a3 pearlDepth:(__n128)a4 pearlPoses:(__n128)a5 pceCameraCalibration:(double)a6 pearlCameraCalibrationTransform:(double)a7 colorCameraCalibration:(double)a8 timestamp:(double)a9
{
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v45;
  uint8_t buf[16];
  int v51;
  __int128 v52;
  __int128 v53;

  v20 = a13;
  v51 = 335684824;
  v52 = 0u;
  v53 = 0u;
  v45 = a14;
  kdebug_trace();
  *(_BYTE *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 288) = a17;
  objc_msgSend(*(id *)(a1 + 392), "logger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logMatrix4x4:name:timestamp:", "inputIrToDepthTransform", a6, a7, a8, a9, *(double *)(a1 + 288));

  objc_msgSend((id)a1, "setColorCameraCalibration:", v45);
  objc_msgSend((id)a1, "setPearlCameraCalibration:", v20);
  v22 = objc_msgSend((id)a1, "numberOfExecutionSteps");
  v23 = objc_msgSend(*(id *)(a1 + 392), "stepsToSkip");
  v24 = objc_msgSend(*(id *)(a1 + 392), "powerMeasureMode");
  objc_msgSend(*(id *)(a1 + 392), "timeProfiler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v22 - v23;
  if (v24 && (v27 = v26 < 1, --v26, v27))
  {
    v30 = 0;
  }
  else
  {
    kdebug_trace();
    objc_msgSend(v25, "startWithUTFString:", "preprocess pearl");
    objc_msgSend((id)a1, "frameExecutionStart");
    objc_msgSend(*(id *)(a1 + 392), "timeProfiler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "start:", CFSTR("preprocessColor"));

    objc_msgSend(*(id *)(a1 + 392), "logger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logPixelBuffer:name:timestamp:", a11, "inputColor", *(double *)(a1 + 288));

    v30 = objc_msgSend(*(id *)(a1 + 384), "preProcessColor:processedColor:referenceCameraCalibration:colorCameraCalibration:", a11, *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 400));
    if (v30)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "preProcessColor failed", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 392), "logger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logPixelBuffer:name:timestamp:", *(_QWORD *)(a1 + 160), "processedColor", *(double *)(a1 + 288));

      objc_msgSend(*(id *)(a1 + 392), "timeProfiler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stop:", CFSTR("preprocessColor"));

      objc_msgSend(v25, "stopWithUTFString:", "preprocess pearl");
      kdebug_trace();
      if (v26 < 1)
        v33 = v24;
      else
        v33 = 0;
      if ((v33 & 1) != 0)
      {
        v30 = 0;
      }
      else
      {
        kdebug_trace();
        objc_msgSend(v25, "startWithUTFString:", "preprocess color");
        objc_msgSend(*(id *)(a1 + 392), "timeProfiler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "start:", CFSTR("ProjectPearlPoints"));

        objc_msgSend(*(id *)(a1 + 392), "logger");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logPixelBuffer:name:timestamp:", a12, "inputPearl", *(double *)(a1 + 288));

        objc_msgSend(*(id *)(a1 + 384), "setPearlToColorCurrentTransform:", a6, a7, a8, a9);
        v30 = objc_msgSend(*(id *)(a1 + 384), "preProcessPearl:pose:prevPose:referenceCameraCalibration:pearlCameraCalibration:reprojectedPointsBuffer:reprojectedPointsMaskBuffer:", a12, *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 408), *(_QWORD *)(a1 + 168), *(_QWORD *)(a1 + 176), a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], *(double *)(a1 + 320), *(double *)(a1 + 336), *(double *)(a1 + 352), *(double *)(a1 + 368));
        *(__n128 *)(a1 + 320) = a2;
        *(__n128 *)(a1 + 336) = a3;
        *(__n128 *)(a1 + 352) = a4;
        *(__n128 *)(a1 + 368) = a5;
        objc_msgSend(*(id *)(a1 + 392), "timeProfiler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stop:", CFSTR("ProjectPearlPoints"));

        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "preProcessPearl failed", buf, 2u);
          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 392), "logger");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "logPixelBuffer:name:timestamp:", *(_QWORD *)(a1 + 168), "pearlProcessed", *(double *)(a1 + 288));

          objc_msgSend(*(id *)(a1 + 392), "logger");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "logPixelBuffer:name:timestamp:", *(_QWORD *)(a1 + 176), "pearlMaskProcessed", *(double *)(a1 + 288));

          v30 = 0;
          *(_BYTE *)(a1 + 152) = 1;
        }
      }
    }
  }

  kdebug_trace();
  return v30;
}

- (int64_t)executePreprocessedInputsWithInterSessionData:(id)a3 outResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  _BOOL4 v12;
  void *v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  ADPearlColorInFieldCalibrationPipeline *pipeline;
  void *backendResultAggregated;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t frontendFeaturesInputElementSize;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  int v83;
  float v84;
  unint64_t v85;
  BOOL v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint8_t buf[4];
  _BYTE v91[18];
  __int16 v92;
  double v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_preProcessInputColorFrameDone)
  {
    -[ADExecutorParameters logger](self->_executorParameters, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistenceData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logDictionary:name:timestamp:", v9, "inputIntersessionData", self->_lastColorTimestamp);

    self->_preProcessInputColorFrameDone = 0;
    objc_msgSend(v7, "setExecuted:", 0);
    if (self->_isPrepared)
    {
      if (self->_backendEspressoRunner && self->_frontendEspressoRunner)
      {
        if (v7)
        {
          v10 = -[ADPearlColorInFieldCalibrationExecutor numberOfExecutionSteps](self, "numberOfExecutionSteps");
          v11 = -[ADExecutorParameters stepsToSkip](self->_executorParameters, "stepsToSkip");
          v12 = -[ADExecutorParameters powerMeasureMode](self->_executorParameters, "powerMeasureMode");
          -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v10 - v11;
          if (v12 && v88-- < 1)
          {
            v16 = 0;
LABEL_33:

            goto LABEL_34;
          }
          kdebug_trace();
          objc_msgSend(v89, "startWithUTFString:", "first network execution");
          -[ADExecutor frameExecutionStart](self, "frameExecutionStart");
          -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "start:", CFSTR("BackendProcess"));

          v15 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
          v16 = -[ADEspressoRunner execute](self->_backendEspressoRunner, "execute");
          v17 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
          if (v16)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed executing backend", buf, 2u);
            }
            goto LABEL_33;
          }
          v18 = v17;
          -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v12;
          objc_msgSend(v19, "stop:", CFSTR("BackendProcess"));

          objc_msgSend(v6, "inFieldCalibrationTelemetryData");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "reportBackendRunTime:", v18 - v15);
          -[ADExecutorParameters logger](self->_executorParameters, "logger");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "logRawBuffer:size:name:timestamp:", -[ADEspressoBufferHandle data](self->_featuresOutputEspressoBufferHandle, "data"), self->_backendSingleResultSize, "featureVectorItr", self->_lastColorTimestamp);

          memcpy((char *)self->_backendResultAggregated+ self->_backendSingleResultSize * self->_backendResultAggregationCounter, (const void *)-[ADEspressoBufferHandle data](self->_featuresOutputEspressoBufferHandle, "data"), self->_backendSingleResultSize);
          v21 = self->_backendResultAggregationCounter + 1;
          self->_backendResultAggregationCounter = v21;
          -[ADPearlColorInFieldCalibrationExecutorParameters pipelineParameters](self->_executorParameters, "pipelineParameters");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v20) = objc_msgSend(v22, "featuresVectorAggregationSize");

          if (v21 != (_DWORD)v20)
          {

            v7 = 0;
            v30 = "first network execution";
LABEL_30:
            objc_msgSend(v89, "stopWithUTFString:", v30);
            kdebug_trace();
            -[ADExecutor frameExecutionEnd](self, "frameExecutionEnd");
            goto LABEL_31;
          }
          -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "start:", CFSTR("FrontendProcess"));

          v85 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
          self->_backendResultAggregationCounter = 0;
          objc_msgSend(v89, "stopWithUTFString:", "first network execution");
          kdebug_trace();
          if (v12)
          {
            if (v88 < 1)
              goto LABEL_31;
            --v88;
          }
          kdebug_trace();
          objc_msgSend(v89, "startWithUTFString:", "preprocess features");
          pipeline = self->_pipeline;
          backendResultAggregated = self->_backendResultAggregated;
          v26 = -[ADEspressoBufferHandle data](self->_frontendFeaturesInputEspressoBufferHandle, "data");
          -[ADEspressoBufferHandle dimensions](self->_featuresOutputEspressoBufferHandle, "dimensions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[ADPearlColorInFieldCalibrationPipeline processIntermediateResultsWithBackendFeaturesOutputVector:frontendEspressoFeaturesInput:dimensions:](pipeline, "processIntermediateResultsWithBackendFeaturesOutputVector:frontendEspressoFeaturesInput:dimensions:", backendResultAggregated, v26, v27);

          if (v16)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v28 = MEMORY[0x24BDACB70];
              v29 = "failed processing intermediate results (backend features vector output to frontend features input)";
LABEL_41:
              _os_log_error_impl(&dword_20B62B000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
              goto LABEL_32;
            }
            goto LABEL_32;
          }
          objc_msgSend(v89, "stopWithUTFString:", "preprocess features");
          kdebug_trace();
          if (v12)
          {
            if (v88 < 1)
              goto LABEL_31;
            --v88;
          }
          kdebug_trace();
          objc_msgSend(v89, "startWithUTFString:", "second network execution");
          v16 = -[ADEspressoRunner execute](self->_frontendEspressoRunner, "execute");
          if (v16)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v28 = MEMORY[0x24BDACB70];
              v29 = "failed executing frontend";
              goto LABEL_41;
            }
LABEL_32:

            goto LABEL_33;
          }
          v32 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
          -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stop:", CFSTR("FrontendProcess"));

          objc_msgSend(v87, "reportFrontendRunTime:", v32 - v85);
          v34 = -[ADEspressoBufferHandle dimensionsProduct](self->_frontendFeaturesInputEspressoBufferHandle, "dimensionsProduct");
          frontendFeaturesInputElementSize = self->_frontendFeaturesInputElementSize;
          -[ADExecutorParameters logger](self->_executorParameters, "logger");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "logRawBuffer:size:name:timestamp:", -[ADEspressoBufferHandle data](self->_frontendFeaturesInputEspressoBufferHandle, "data"), frontendFeaturesInputElementSize * v34, "featureVectorAvg", self->_lastColorTimestamp);

          objc_msgSend(v89, "stopWithUTFString:", "second network execution");
          kdebug_trace();
          v37 = v86;
          if (v88 >= 1)
            v37 = 0;
          if (!v37)
          {
            kdebug_trace();
            objc_msgSend(v89, "startWithUTFString:", "postprocess rotation");
            -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "start:", CFSTR("PostProcess"));

            v16 = -[ADPearlColorInFieldCalibrationPipeline postProcessFrontendOutputX:frontendOutputY:frontendOutputZ:frontendOutputErrorX:frontendOutputErrorY:frontendOutputErrorZ:interSessionData:pearlColorInFieldCalibrationResult:](self->_pipeline, "postProcessFrontendOutputX:frontendOutputY:frontendOutputZ:frontendOutputErrorX:frontendOutputErrorY:frontendOutputErrorZ:interSessionData:pearlColorInFieldCalibrationResult:", -[ADEspressoBufferHandle data](self->_frontendRotationXOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendRotationYOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendRotationZOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendErrorXOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendErrorYOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendErrorZOutputEspressoBufferHandle, "data"), v6, v7);
            if (v16)
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_32;
              *(_WORD *)buf = 0;
              v28 = MEMORY[0x24BDACB70];
              v29 = "failed post processing pipeline results";
              goto LABEL_41;
            }
            -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stop:", CFSTR("PostProcess"));

            -[ADExecutorParameters logger](self->_executorParameters, "logger");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "dictionaryRepresentation");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "logDictionary:name:timestamp:", v41, "internalUseResults", self->_lastColorTimestamp);

            -[ADExecutorParameters logger](self->_executorParameters, "logger");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "pearlToColorExtrinsics");
            objc_msgSend(v42, "logMatrix4x3:name:timestamp:", "depthToColorExtrinsics");

            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "preRelative2FactoryX");
              v44 = v43;
              objc_msgSend(v7, "preRelative2FactoryY");
              v46 = v45;
              objc_msgSend(v7, "preRelative2FactoryZ");
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v44;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v46;
              v92 = 2048;
              v93 = v47;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results relative to factory [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "postRelative2FactoryX");
              v49 = v48;
              objc_msgSend(v7, "postRelative2FactoryY");
              v51 = v50;
              objc_msgSend(v7, "postRelative2FactoryZ");
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v49;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v51;
              v92 = 2048;
              v93 = v52;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results relative to factory post ISF [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "deltaRotationX");
              v54 = v53;
              objc_msgSend(v7, "deltaRotationY");
              v56 = v55;
              objc_msgSend(v7, "deltaRotationZ");
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v54;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v56;
              v92 = 2048;
              v93 = v57;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results relative to previouse [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "postRelative2PrevX");
              v59 = v58;
              objc_msgSend(v7, "postRelative2PrevY");
              v61 = v60;
              objc_msgSend(v7, "postRelative2PrevZ");
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v59;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v61;
              v92 = 2048;
              v93 = v62;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results relative to previouse post ISF [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "absoluteRotationX");
              v64 = v63;
              objc_msgSend(v7, "absoluteRotationY");
              v66 = v65;
              objc_msgSend(v7, "absoluteRotationZ");
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v64;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v66;
              v92 = 2048;
              v93 = v67;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results absolute [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "absoluteRotationPostISFX");
              v69 = v68;
              objc_msgSend(v7, "absoluteRotationPostISFY");
              v71 = v70;
              objc_msgSend(v7, "absoluteRotationPostISFZ");
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v69;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v71;
              v92 = 2048;
              v93 = v72;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run results absolute post ISF [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "factoryRotationX");
              v74 = v73;
              objc_msgSend(v7, "factoryRotationY");
              v76 = v75;
              objc_msgSend(v7, "factoryRotationZ");
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v74;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v76;
              v92 = 2048;
              v93 = v77;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run factory [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "stdX");
              v79 = v78;
              objc_msgSend(v7, "stdY");
              v81 = v80;
              objc_msgSend(v7, "stdZ");
              *(_DWORD *)buf = 134218496;
              *(double *)v91 = v79;
              *(_WORD *)&v91[8] = 2048;
              *(double *)&v91[10] = v81;
              v92 = 2048;
              v93 = v82;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run std [%f, %f, %f]", buf, 0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v83 = objc_msgSend(v7, "executed");
              objc_msgSend(v7, "confidence");
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v91 = v83;
              *(_WORD *)&v91[4] = 2048;
              *(double *)&v91[6] = v84;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration run executed: %d with std: %f]", buf, 0x12u);
            }
            objc_msgSend(v87, "increaseRunTimesByOne");
            objc_msgSend(v87, "updateLastExecutionTime:", +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec"));
            if (-[ADPearlColorInFieldCalibrationExecutorParameters reportTelemetry](self->_executorParameters, "reportTelemetry"))
            {
              -[ADPearlColorInFieldCalibrationPipeline reportTelemetry:withInterSessionData:](self->_pipeline, "reportTelemetry:withInterSessionData:", v7, v6);
              objc_msgSend(v87, "reset");
            }
            v30 = "postprocess rotation";
            goto LABEL_30;
          }
LABEL_31:
          v16 = 0;
          goto LABEL_32;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide a pointer to ADPearlColorInFieldCalibrationResult", buf, 2u);
        }
        v7 = 0;
        v16 = -22953;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed preparing executor", buf, 2u);
        }
        v16 = -22960;
      }
    }
    else
    {
      v16 = -22970;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "running executeForPreprocesed before preProcessInputColorFrame called", buf, 2u);
    }
    v16 = -22961;
  }
LABEL_34:

  return v16;
}

- (int64_t)clearFeaturesAggregator
{
  self->_backendResultAggregationCounter = 0;
  return 0;
}

- (int64_t)numberOfExecutionSteps
{
  return 6;
}

- (ADPearlColorInFieldCalibrationPipeline)pipeline
{
  return self->_pipeline;
}

- (ADPearlColorInFieldCalibrationExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (ADCameraCalibration)colorCameraCalibration
{
  return self->_colorCameraCalibration;
}

- (ADCameraCalibration)pearlCameraCalibration
{
  return self->_pearlCameraCalibration;
}

- (__n128)vmcamToWmcamExtrinsics
{
  return a1[26];
}

- (__n128)setVmcamToWmcamExtrinsics:(__n128)a3
{
  result[26] = a2;
  result[27] = a3;
  result[28] = a4;
  result[29] = a5;
  return result;
}

- (__n128)wmcamToMcamExtrinsics
{
  return a1[30];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlCameraCalibration, 0);
  objc_storeStrong((id *)&self->_colorCameraCalibration, 0);
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_preprocessedPearlMetadata, 0);
  objc_storeStrong((id *)&self->_preprocessedColorMetadata, 0);
  objc_storeStrong((id *)&self->_frontendErrorZOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendErrorYOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendErrorXOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotationZOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotationYOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotationXOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendFeaturesInputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_featuresOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_mcamPCameraCalibration, 0);
  objc_storeStrong((id *)&self->_frontendEspressoRunner, 0);
  objc_storeStrong((id *)&self->_backendEspressoRunner, 0);
}

@end
