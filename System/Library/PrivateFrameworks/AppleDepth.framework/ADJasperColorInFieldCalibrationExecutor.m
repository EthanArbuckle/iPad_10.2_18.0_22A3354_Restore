@implementation ADJasperColorInFieldCalibrationExecutor

- (ADJasperColorInFieldCalibrationExecutor)init
{
  return (ADJasperColorInFieldCalibrationExecutor *)-[ADJasperColorInFieldCalibrationExecutor initForEngineType:](self, "initForEngineType:", 0);
}

- (id)initForEngineType:(unint64_t)a3 andExecutorParameters:(id)a4
{
  id v6;
  ADJasperColorInFieldCalibrationExecutor *v7;
  ADJasperColorInFieldCalibrationExecutor *v8;
  ADJasperColorInFieldCalibrationExecutor *v9;
  ADJasperColorInFieldCalibrationPipeline *v10;
  void *v11;
  uint64_t v12;
  ADJasperColorInFieldCalibrationPipeline *pipeline;
  float v14;
  ADEspressoRunner *backendEspressoRunner;
  ADEspressoRunner *frontendEspressoRunner;
  ADCameraCalibration *mcamJCameraCalibration;
  ADJasperColorInFieldCalibrationExecutorParameters *v18;
  void *v19;
  uint64_t v20;
  ADJasperColorInFieldCalibrationExecutorParameters *executorParameters;
  ADJasperPointCloud *aggregatedPointCloud;
  ADEspressoBufferHandle *featuresOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendFeaturesInputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotErrorXOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotErrorYOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotErrorZOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotXOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotYOutputEspressoBufferHandle;
  ADEspressoBufferHandle *frontendRotZOutputEspressoBufferHandle;
  void *v31;
  void *v32;
  void *v33;
  unint64_t frontendFeaturesInputElementSize;
  void *v35;
  void *v36;
  void *v37;
  unint64_t backendFeaturesOutputElementSize;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  ADJasperColorInFieldCalibrationExecutor *v42;
  NSObject *v43;
  const char *v44;
  uint8_t buf[8];
  objc_super v47;
  int v48;
  __int128 v49;
  __int128 v50;

  v6 = a4;
  v48 = 335682504;
  v49 = 0u;
  v50 = 0u;
  kdebug_trace();
  v47.receiver = self;
  v47.super_class = (Class)ADJasperColorInFieldCalibrationExecutor;
  v7 = -[ADExecutor init](&v47, sel_init);
  v8 = v7;
  v9 = v7;
  if (!v7)
    goto LABEL_9;
  v7->_isPrepared = 0;
  v7->_preProcessInputColorFrameDone = 0;
  v10 = [ADJasperColorInFieldCalibrationPipeline alloc];
  objc_msgSend(v6, "pipelineParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ADJasperColorInFieldCalibrationPipeline initWithParameters:espressoEngine:](v10, "initWithParameters:espressoEngine:", v11, a3);
  pipeline = v9->_pipeline;
  v9->_pipeline = (ADJasperColorInFieldCalibrationPipeline *)v12;

  +[ADDeviceConfiguration floatForKey:](ADDeviceConfiguration, "floatForKey:", kADDeviceConfigurationKeyJasperColorInFieldForceAngularVelocityLogic);
  v9->_forceAngularVelocityLogic = (int)v14;
  if (!v9->_pipeline)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v43 = MEMORY[0x24BDACB70];
    v44 = "Jasper Color In Field Calibration pipeline failed to init ";
LABEL_18:
    _os_log_error_impl(&dword_20B62B000, v43, OS_LOG_TYPE_ERROR, v44, buf, 2u);
    goto LABEL_19;
  }
  -[ADJasperColorInFieldCalibrationExecutor setVmcamToWmcamExtrinsics:](v9, "setVmcamToWmcamExtrinsics:");
  -[ADJasperColorInFieldCalibrationExecutor setWmcamToMcamExtrinsics:](v9, "setWmcamToMcamExtrinsics:", *(double *)&_PromotedConst_5315, 0.0078125, 0.0, 0.0);
  v9->super._engineType = a3;
  backendEspressoRunner = v9->_backendEspressoRunner;
  v9->_backendEspressoRunner = 0;

  frontendEspressoRunner = v9->_frontendEspressoRunner;
  v9->_frontendEspressoRunner = 0;

  mcamJCameraCalibration = v9->_mcamJCameraCalibration;
  v9->_mcamJCameraCalibration = 0;

  v18 = [ADJasperColorInFieldCalibrationExecutorParameters alloc];
  -[ADJasperColorInFieldCalibrationPipeline pipelineParameters](v9->_pipeline, "pipelineParameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ADJasperColorInFieldCalibrationExecutorParameters initWithPipelineParameters:](v18, "initWithPipelineParameters:", v19);
  executorParameters = v9->_executorParameters;
  v9->_executorParameters = (ADJasperColorInFieldCalibrationExecutorParameters *)v20;

  if (!v9->_executorParameters)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v43 = MEMORY[0x24BDACB70];
    v44 = "Jasper Color In Field Calibration executor parameters failed to init ";
    goto LABEL_18;
  }
  aggregatedPointCloud = v9->_aggregatedPointCloud;
  v9->_aggregatedPointCloud = 0;

  v9->_itmPreProcessedColor = 0;
  v9->_itmPreProcessedJasper = 0;
  featuresOutputEspressoBufferHandle = v9->_featuresOutputEspressoBufferHandle;
  v9->_featuresOutputEspressoBufferHandle = 0;

  frontendFeaturesInputEspressoBufferHandle = v9->_frontendFeaturesInputEspressoBufferHandle;
  v9->_frontendFeaturesInputEspressoBufferHandle = 0;

  frontendRotErrorXOutputEspressoBufferHandle = v9->_frontendRotErrorXOutputEspressoBufferHandle;
  v9->_frontendRotErrorXOutputEspressoBufferHandle = 0;

  frontendRotErrorYOutputEspressoBufferHandle = v9->_frontendRotErrorYOutputEspressoBufferHandle;
  v9->_frontendRotErrorYOutputEspressoBufferHandle = 0;

  frontendRotErrorZOutputEspressoBufferHandle = v9->_frontendRotErrorZOutputEspressoBufferHandle;
  v9->_frontendRotErrorZOutputEspressoBufferHandle = 0;

  frontendRotXOutputEspressoBufferHandle = v9->_frontendRotXOutputEspressoBufferHandle;
  v9->_frontendRotXOutputEspressoBufferHandle = 0;

  frontendRotYOutputEspressoBufferHandle = v9->_frontendRotYOutputEspressoBufferHandle;
  v9->_frontendRotYOutputEspressoBufferHandle = 0;

  frontendRotZOutputEspressoBufferHandle = v9->_frontendRotZOutputEspressoBufferHandle;
  v9->_frontendRotZOutputEspressoBufferHandle = 0;

  -[ADJasperColorInFieldCalibrationPipeline frontendInferenceDescriptor](v9->_pipeline, "frontendInferenceDescriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "featuresInput");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "imageDescriptor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_frontendFeaturesInputElementSize = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v33, "pixelFormat"), 0);

  frontendFeaturesInputElementSize = v9->_frontendFeaturesInputElementSize;
  if (frontendFeaturesInputElementSize != 2 && frontendFeaturesInputElementSize != 4)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v43 = MEMORY[0x24BDACB70];
    v44 = "Unexpected pixel format for frontend input";
    goto LABEL_18;
  }
  -[ADJasperColorInFieldCalibrationPipeline backendInferenceDescriptor](v9->_pipeline, "backendInferenceDescriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "featuresOutput");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "imageDescriptor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_backendFeaturesOutputElementSize = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v37, "pixelFormat"), 0);

  backendFeaturesOutputElementSize = v9->_backendFeaturesOutputElementSize;
  if (backendFeaturesOutputElementSize != 2 && backendFeaturesOutputElementSize != 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v43 = MEMORY[0x24BDACB70];
      v44 = "Unexpected pixel format for backend output";
      goto LABEL_18;
    }
LABEL_19:
    v42 = 0;
    goto LABEL_20;
  }
  v9->_backendResultAggregated = 0;
  v9->_backendResultAggregationCounter = 0;
  v9->_backendSingleResultSize = 0;
  v9->_lastColorTimestamp = 0.0;
  v40 = *MEMORY[0x24BDAEE00];
  v39 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
  v41 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
  *(_OWORD *)&v8->_anon_130[32] = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
  *(_OWORD *)&v8->_anon_130[48] = v41;
  *(_OWORD *)v8->_anon_130 = v40;
  *(_OWORD *)&v8->_anon_130[16] = v39;
LABEL_9:
  v42 = v9;
LABEL_20:
  kdebug_trace();

  return v42;
}

- (id)initForEngineType:(unint64_t)a3
{
  ADJasperColorInFieldCalibrationExecutorParameters *v5;
  id v6;

  kdebug_trace();
  v5 = objc_alloc_init(ADJasperColorInFieldCalibrationExecutorParameters);
  v6 = -[ADJasperColorInFieldCalibrationExecutor initForEngineType:andExecutorParameters:](self, "initForEngineType:andExecutorParameters:", a3, v5);

  kdebug_trace();
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_backendResultAggregated)
    MEMORY[0x20BD36480]();
  -[ADJasperColorInFieldCalibrationExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  v3.receiver = self;
  v3.super_class = (Class)ADJasperColorInFieldCalibrationExecutor;
  -[ADExecutor dealloc](&v3, sel_dealloc);
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  self->_itmPreProcessedJasper = 0;
}

- (int64_t)allocateIntermediateBuffers
{
  void *v3;
  ADEspressoRunner *backendEspressoRunner;
  void *v5;
  void *v6;
  ADEspressoRunner *v7;
  void *v8;
  uint64_t v9;
  ADEspressoRunner *v10;
  void *v11;
  ADEspressoBufferHandle *v12;
  ADEspressoBufferHandle *featuresOutputEspressoBufferHandle;
  ADEspressoRunner *frontendEspressoRunner;
  void *v15;
  ADEspressoBufferHandle *v16;
  ADEspressoBufferHandle *frontendFeaturesInputEspressoBufferHandle;
  ADEspressoRunner *v18;
  void *v19;
  ADEspressoBufferHandle *v20;
  ADEspressoBufferHandle *frontendRotXOutputEspressoBufferHandle;
  ADEspressoRunner *v22;
  void *v23;
  ADEspressoBufferHandle *v24;
  ADEspressoBufferHandle *frontendRotYOutputEspressoBufferHandle;
  ADEspressoRunner *v26;
  void *v27;
  ADEspressoBufferHandle *v28;
  ADEspressoBufferHandle *frontendRotErrorXOutputEspressoBufferHandle;
  ADEspressoRunner *v30;
  void *v31;
  ADEspressoBufferHandle *v32;
  ADEspressoBufferHandle *frontendRotErrorYOutputEspressoBufferHandle;
  void *v34;
  void *v35;
  ADEspressoRunner *v36;
  void *v37;
  ADEspressoBufferHandle *v38;
  ADEspressoBufferHandle *frontendRotZOutputEspressoBufferHandle;
  ADEspressoRunner *v40;
  void *v41;
  ADEspressoBufferHandle *v42;
  ADEspressoBufferHandle *frontendRotErrorZOutputEspressoBufferHandle;
  ADEspressoBufferHandle *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int64_t v49;
  void *v50;
  void *v51;

  -[ADJasperColorInFieldCalibrationExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  -[ADJasperColorInFieldCalibrationPipeline backendInferenceDescriptor](self->_pipeline, "backendInferenceDescriptor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADJasperColorInFieldCalibrationPipeline frontendInferenceDescriptor](self->_pipeline, "frontendInferenceDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backendEspressoRunner = self->_backendEspressoRunner;
  objc_msgSend(v50, "colorInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](backendEspressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  +[ADUtils getStandardNameForBufferOfType:moduleName:](ADUtils, "getStandardNameForBufferOfType:moduleName:", CFSTR("itmPreProcessedColor"), CFSTR("RGBJ"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADUtils updatePixelBufferIOSurfaceLabel:pixelBuffer:](ADUtils, "updatePixelBufferIOSurfaceLabel:pixelBuffer:", v6, self->_itmPreProcessedColor);
  v7 = self->_backendEspressoRunner;
  objc_msgSend(v50, "jasperInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedJasper = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v7, "createAndRegisterPixelBufferForDescriptor:", v8);

  +[ADUtils getStandardNameForBufferOfType:moduleName:](ADUtils, "getStandardNameForBufferOfType:moduleName:", CFSTR("itmPreProcessedJasper"), CFSTR("RGBJ"));
  v9 = objc_claimAutoreleasedReturnValue();

  v51 = (void *)v9;
  +[ADUtils updatePixelBufferIOSurfaceLabel:pixelBuffer:](ADUtils, "updatePixelBufferIOSurfaceLabel:pixelBuffer:", v9, self->_itmPreProcessedJasper);
  v10 = self->_backendEspressoRunner;
  objc_msgSend(v50, "featuresOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v10, "registerDescriptor:", v11);
  v12 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  featuresOutputEspressoBufferHandle = self->_featuresOutputEspressoBufferHandle;
  self->_featuresOutputEspressoBufferHandle = v12;

  frontendEspressoRunner = self->_frontendEspressoRunner;
  objc_msgSend(v3, "featuresInput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](frontendEspressoRunner, "registerDescriptor:", v15);
  v16 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendFeaturesInputEspressoBufferHandle = self->_frontendFeaturesInputEspressoBufferHandle;
  self->_frontendFeaturesInputEspressoBufferHandle = v16;

  v18 = self->_frontendEspressoRunner;
  objc_msgSend(v3, "rotationXOutput");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v18, "registerDescriptor:", v19);
  v20 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendRotXOutputEspressoBufferHandle = self->_frontendRotXOutputEspressoBufferHandle;
  self->_frontendRotXOutputEspressoBufferHandle = v20;

  v22 = self->_frontendEspressoRunner;
  objc_msgSend(v3, "rotationYOutput");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v22, "registerDescriptor:", v23);
  v24 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendRotYOutputEspressoBufferHandle = self->_frontendRotYOutputEspressoBufferHandle;
  self->_frontendRotYOutputEspressoBufferHandle = v24;

  v26 = self->_frontendEspressoRunner;
  objc_msgSend(v3, "errorXOutput");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v26, "registerDescriptor:", v27);
  v28 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendRotErrorXOutputEspressoBufferHandle = self->_frontendRotErrorXOutputEspressoBufferHandle;
  self->_frontendRotErrorXOutputEspressoBufferHandle = v28;

  v30 = self->_frontendEspressoRunner;
  objc_msgSend(v3, "errorYOutput");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v30, "registerDescriptor:", v31);
  v32 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  frontendRotErrorYOutputEspressoBufferHandle = self->_frontendRotErrorYOutputEspressoBufferHandle;
  self->_frontendRotErrorYOutputEspressoBufferHandle = v32;

  objc_msgSend(v3, "rotationZOutput");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(v3, "errorZOutput");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = self->_frontendEspressoRunner;
      objc_msgSend(v3, "rotationZOutput");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADEspressoRunner registerDescriptor:](v36, "registerDescriptor:", v37);
      v38 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
      frontendRotZOutputEspressoBufferHandle = self->_frontendRotZOutputEspressoBufferHandle;
      self->_frontendRotZOutputEspressoBufferHandle = v38;

      v40 = self->_frontendEspressoRunner;
      objc_msgSend(v3, "errorZOutput");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADEspressoRunner registerDescriptor:](v40, "registerDescriptor:", v41);
      v42 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
      frontendRotErrorZOutputEspressoBufferHandle = self->_frontendRotErrorZOutputEspressoBufferHandle;
      self->_frontendRotErrorZOutputEspressoBufferHandle = v42;

    }
  }
  if (self->_itmPreProcessedColor
    && self->_itmPreProcessedJasper
    && (v44 = self->_featuresOutputEspressoBufferHandle) != 0
    && self->_frontendFeaturesInputEspressoBufferHandle
    && self->_frontendRotXOutputEspressoBufferHandle
    && self->_frontendRotYOutputEspressoBufferHandle
    && self->_frontendRotErrorXOutputEspressoBufferHandle
    && self->_frontendRotErrorYOutputEspressoBufferHandle)
  {
    v45 = -[ADEspressoBufferHandle dimensionsProduct](v44, "dimensionsProduct");
    v46 = v50;
    -[ADJasperColorInFieldCalibrationExecutorParameters pipelineParameters](self->_executorParameters, "pipelineParameters");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "featuresVectorAggregationSize");

    self->_backendSingleResultSize = self->_backendFeaturesOutputElementSize * v45;
    v49 = 0;
    self->_backendResultAggregated = (void *)operator new[]();
  }
  else
  {
    -[ADJasperColorInFieldCalibrationExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
    v49 = -22971;
    v46 = v50;
  }

  return v49;
}

- (int64_t)prepare
{
  ADJasperColorInFieldCalibrationExecutor *v2;
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
  v22 = 335687084;
  v23 = 0u;
  v24 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "jasper color infield calibration executor: preparing executor", v21, 2u);
  }
  -[ADJasperColorInFieldCalibrationPipeline backendInferenceDescriptor](v2->_pipeline, "backendInferenceDescriptor");
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
    -[ADJasperColorInFieldCalibrationPipeline frontendInferenceDescriptor](v2->_pipeline, "frontendInferenceDescriptor");
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
          _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "preparing jasper color in field calibration executor", v21, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v21 = 0;
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "preparing jasper color in field calibration executor", v21, 2u);
      }
      v19 = -[ADJasperColorInFieldCalibrationExecutor allocateIntermediateBuffers](v2, "allocateIntermediateBuffers");
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

  *(_QWORD *)&result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1[50].f32)), a3, a1[50], 1), a4, *(float32x4_t *)a1[50].f32, 2).u64[0];
  return result;
}

- (void)setJasperCameraCalibration:(id)a3
{
  void *v4;
  ADCameraCalibration *jasperCameraCalibration;
  ADCameraCalibration *v6;
  ADCameraCalibration *v7;
  id v8;

  v8 = a3;
  -[ADExecutorParameters logger](self->_executorParameters, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCalibration:name:timestamp:", v8, "inputPointCloudCalibration", self->_lastColorTimestamp);

  jasperCameraCalibration = self->_jasperCameraCalibration;
  if (!jasperCameraCalibration || (-[ADCameraCalibration isEqual:](jasperCameraCalibration, "isEqual:", v8) & 1) == 0)
  {
    v6 = (ADCameraCalibration *)objc_msgSend(v8, "copy");
    v7 = self->_jasperCameraCalibration;
    self->_jasperCameraCalibration = v6;

    -[ADJasperColorInFieldCalibrationPipeline updateJasperCamera:](self->_pipeline, "updateJasperCamera:", v8);
  }

}

- (void)setColorCameraCalibration:(id)a3
{
  void *v4;
  ADCameraCalibration *colorCameraCalibration;
  ADCameraCalibration *v6;
  ADCameraCalibration *v7;
  ADJasperColorInFieldCalibrationPipeline *pipeline;
  ADCameraCalibration *v9;
  ADCameraCalibration *v10;
  ADCameraCalibration *mcamJCameraCalibration;
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
    -[ADJasperColorInFieldCalibrationExecutor rectifyColorCameraExtrinsics:](self, "rectifyColorCameraExtrinsics:");
    -[ADJasperColorInFieldCalibrationPipeline createReferenceCameraForColor:withExtrinsics:](pipeline, "createReferenceCameraForColor:withExtrinsics:", v9);
    v10 = (ADCameraCalibration *)objc_claimAutoreleasedReturnValue();
    mcamJCameraCalibration = self->_mcamJCameraCalibration;
    self->_mcamJCameraCalibration = v10;

    -[ADExecutorParameters logger](self->_executorParameters, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logCalibration:name:timestamp:", self->_mcamJCameraCalibration, "referenceColorCameraCalibration", self->_lastColorTimestamp);

  }
}

- (uint64_t)setWmcamToMcamExtrinsics:(float32x4_t)a3
{
  uint32x4_t v5;

  v5 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(result + 480), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(result + 464), a2)), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(result + 496), a4), (int8x16_t)vceqq_f32(*(float32x4_t *)(result + 512), a5)));
  v5.i32[3] = v5.i32[2];
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    *(float32x4_t *)(result + 464) = a2;
    *(float32x4_t *)(result + 480) = a3;
    *(float32x4_t *)(result + 496) = a4;
    *(float32x4_t *)(result + 512) = a5;
    return objc_msgSend(*(id *)(result + 368), "updateWmcamToMcamExtrinsics:");
  }
  return result;
}

- (uint64_t)preprocessInputColorFrame:(double)a3 colorPose:(double)a4 jasperPointClouds:(double)a5 jasperPoses:(double)a6 jasperCameraCalibration:(uint64_t)a7 colorCameraCalibration:(uint64_t)a8 timestamp:(void *)a9 colorMetadata:(double *)a10
{
  id v18;
  id v19;
  id v20;
  double v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  std::string *v27;
  std::string::size_type size;
  std::string *v29;
  __int128 v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  float32x4_t v57;
  int32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  void *v69;
  void *v70;
  void *v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  float32x4_t v82;
  id v83;
  void *v84;
  std::string v85;
  std::string v86;
  uint8_t buf[16];
  int64_t v88;

  v18 = a9;
  v19 = a11;
  v83 = a12;
  v20 = a13;
  v84 = v20;
  if (a6 == 0.0 && v20 != 0)
  {
    objc_msgSend(MEMORY[0x24BE05FB8], "getMidExposureTimestampFromMetadataDictionary:", v20);
    a6 = v22;
  }
  v23 = 0;
  *(double *)(a1 + 280) = a6;
  while (1)
  {
    v24 = v23;
    if (objc_msgSend(v18, "count") <= (unint64_t)v23)
      break;
    objc_msgSend(*(id *)(a1 + 376), "logger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)&v86.__r_.__value_.__s + 23) = 15;
    strcpy((char *)&v86, "inputPointCloud");
    std::to_string(&v85, v24);
    if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v27 = &v85;
    else
      v27 = (std::string *)v85.__r_.__value_.__r.__words[0];
    if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v85.__r_.__value_.__r.__words[2]);
    else
      size = v85.__r_.__value_.__l.__size_;
    v29 = std::string::append(&v86, (const std::string::value_type *)v27, size);
    v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
    v88 = v29->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v30;
    v29->__r_.__value_.__l.__size_ = 0;
    v29->__r_.__value_.__r.__words[2] = 0;
    v29->__r_.__value_.__r.__words[0] = 0;
    if (v88 >= 0)
      v31 = buf;
    else
      v31 = *(uint8_t **)buf;
    objc_msgSend(v25, "logPointCloud:name:timestamp:", v26, v31, *(double *)(a1 + 280));
    if (SHIBYTE(v88) < 0)
    {
      operator delete(*(void **)buf);
      if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_23:
        if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_8;
        goto LABEL_24;
      }
    }
    else if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_23;
    }
    operator delete(v85.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_8;
LABEL_24:
    operator delete(v86.__r_.__value_.__l.__data_);
LABEL_8:

    v23 = v24 + 1;
  }
  *(_BYTE *)(a1 + 288) = 0;
  objc_msgSend((id)a1, "setColorCameraCalibration:", v83);
  objc_msgSend((id)a1, "setJasperCameraCalibration:", v19);
  v32 = objc_msgSend((id)a1, "numberOfExecutionSteps");
  v33 = objc_msgSend(*(id *)(a1 + 376), "stepsToSkip");
  v34 = objc_msgSend(*(id *)(a1 + 376), "powerMeasureMode");
  objc_msgSend(*(id *)(a1 + 376), "timeProfiler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v32 - v33;
  if (v34 && (v37 = v36 < 1, --v36, v37))
  {
    v41 = 0;
  }
  else
  {
    kdebug_trace();
    objc_msgSend(v35, "startWithUTFString:", "preprocess color");
    objc_msgSend((id)a1, "frameExecutionStart");
    objc_msgSend(*(id *)(a1 + 376), "timeProfiler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "start:", CFSTR("preprocessColor"));

    objc_msgSend(*(id *)(a1 + 376), "logger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "logPixelBuffer:name:timestamp:", a8, "inputColor", *(double *)(a1 + 280));

    if (v84
      && ((objc_msgSend(*(id *)(a1 + 376), "logger"),
           v40 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v40, "logDictionary:name:timestamp:", v84, "inputColorMetadata", *(double *)(a1 + 280)),
           v40,
           *(_DWORD *)(a1 + 292))
       || (unint64_t)objc_msgSend(v18, "count") >= 3)
      && (objc_msgSend(*(id *)(a1 + 368), "isAngularVelocityValid:", v84) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration preprocessInputColorFrameImpl fail for to high angular velocity", buf, 2u);
      }
      v41 = -22964;
    }
    else
    {
      v41 = objc_msgSend(*(id *)(a1 + 368), "preProcessColor:processedColor:referenceCameraCalibration:colorCameraCalibration:colorMetadata:", a8, *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 384), v84);
      objc_msgSend(*(id *)(a1 + 376), "timeProfiler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stop:", CFSTR("preprocessColor"));

      objc_msgSend(*(id *)(a1 + 376), "logger");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "logPixelBuffer:name:timestamp:", *(_QWORD *)(a1 + 160), "processedColor", *(double *)(a1 + 280));

      if (v41)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed preProcessColor jasper", buf, 2u);
        }
      }
      else
      {
        objc_msgSend(v35, "stopWithUTFString:", "preprocess color");
        kdebug_trace();
        if (v36 < 1)
          v44 = v34;
        else
          v44 = 0;
        if ((v44 & 1) != 0)
        {
          v41 = 0;
        }
        else
        {
          kdebug_trace();
          objc_msgSend(v35, "startWithUTFString:", "preprocess jasper");
          objc_msgSend(*(id *)(a1 + 144), "cameraToPlatformTransform");
          v78 = v45;
          v79 = v46;
          v77 = v47;
          v82 = v48;
          objc_msgSend(*(id *)(a1 + 392), "cameraToPlatformTransform");
          v73 = v49;
          v74 = v50;
          v75 = v51;
          v76 = v52;
          objc_msgSend(*(id *)(a1 + 376), "timeProfiler");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "start:", CFSTR("AggregateAndProjectJasperPoints"));

          objc_msgSend(MEMORY[0x24BE05FE0], "pointCloudByMergingPointClouds:", v18);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 368), "pipelineParameters");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "pointCloudFilterParameters");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "pointCloudByApplyingFilter:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (float32x4_t)vzip1q_s32(vzip2q_s32(v78, v77), vdupq_laneq_s32(v79, 2));
          v58 = vzip1q_s32(v78, v77);
          v59 = (float32x4_t)vtrn2q_s32(v78, v79);
          v59.i32[2] = v77.i32[1];
          v60 = (float32x4_t)vzip1q_s32(v58, v79);
          v61 = vnegq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v82.f32[0]), v59, *(float32x2_t *)v82.f32, 1), v57, v82, 2));
          v61.i32[3] = 1.0;
          v57.i32[3] = 0;
          v62 = (float32x4_t)vzip2q_s32(v58, vdupq_lane_s32(*(int32x2_t *)v79.i8, 1));
          v62.i32[3] = 0;
          v60.i32[3] = 0;
          v82.i64[0] = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v73.f32[0]), v62, *(float32x2_t *)v73.f32, 1), v57, v73, 2), (float32x4_t)0, v61).u64[0];
          v79.i64[0] = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v74.f32[0]), v62, *(float32x2_t *)v74.f32, 1), v57, v74, 2), (float32x4_t)0, v61).u64[0];
          v77.i64[0] = vaddq_f32(v61, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v76.f32[0]), v62, *(float32x2_t *)v76.f32, 1), v57, v76, 2)).u64[0];
          v78.i64[0] = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v75.f32[0]), v62, *(float32x2_t *)v75.f32, 1), v57, v75, 2), (float32x4_t)0, v61).u64[0];

          objc_msgSend(v56, "pointCloudByChangingPointOfViewByTransform:to:", *(_QWORD *)(a1 + 144), *(double *)v82.i64, *(double *)v79.i64, *(double *)v78.i64, *(double *)v77.i64);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = *(void **)(a1 + 152);
          *(_QWORD *)(a1 + 152) = v63;

          objc_msgSend(*(id *)(a1 + 376), "logger");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "logPointCloud:name:timestamp:", *(_QWORD *)(a1 + 152), "aggregatedJasper", *(double *)(a1 + 280));

          v41 = objc_msgSend(*(id *)(a1 + 368), "preProcessJasper:pose:prevPose:referenceCameraCalibration:jasperCameraCalibration:reprojectedPointsBuffer:", *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 392), *(_QWORD *)(a1 + 168), *a10, a10[2], a10[4], a10[6], *(double *)(a1 + 304), *(double *)(a1 + 320), *(double *)(a1 + 336), *(double *)(a1 + 352));
          v66 = *(_OWORD *)a10;
          v67 = *((_OWORD *)a10 + 1);
          v68 = *((_OWORD *)a10 + 3);
          *(_OWORD *)(a1 + 336) = *((_OWORD *)a10 + 2);
          *(_OWORD *)(a1 + 352) = v68;
          *(_OWORD *)(a1 + 304) = v66;
          *(_OWORD *)(a1 + 320) = v67;
          objc_msgSend(*(id *)(a1 + 376), "timeProfiler");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "stop:", CFSTR("AggregateAndProjectJasperPoints"));

          if (v41)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed preProcessJasper jasper", buf, 2u);
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 376), "logger");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "logPixelBuffer:name:timestamp:", *(_QWORD *)(a1 + 168), "jasperProcessed", *(double *)(a1 + 280));

            objc_msgSend(v35, "stopWithUTFString:", "preprocess jasper");
            kdebug_trace();
            objc_msgSend((id)a1, "frameExecutionEnd");
            *(_BYTE *)(a1 + 288) = 1;
          }

        }
      }
    }
  }

  return v41;
}

- (uint64_t)preprocessInputColorFrame:(void *)a1 colorPose:(const char *)a2 jasperPointClouds:(uint64_t)a3 jasperPoses:(uint64_t)a4 jasperCameraCalibration:(uint64_t)a5 colorCameraCalibration:(uint64_t)a6 timestamp:(uint64_t)a7
{
  return objc_msgSend(a1, "preprocessInputColorFrame:colorPose:jasperPointClouds:jasperPoses:jasperCameraCalibration:colorCameraCalibration:timestamp:colorMetadata:", a3, a4, a5, a6, a7, 0);
}

- (uint64_t)preprocessInputColorFrame:(double)a3 colorPose:(double)a4 jasperPointClouds:(double)a5 jasperPoses:(double)a6 jasperCameraCalibration:colorCameraCalibration:colorMetadata:
{
  return objc_msgSend(a1, "preprocessInputColorFrame:colorPose:jasperPointClouds:jasperPoses:jasperCameraCalibration:colorCameraCalibration:timestamp:colorMetadata:", a3, a4, a5, a6, 0.0);
}

- (int64_t)executePreprocessedInputsWithInterSessionData:(id)a3 outResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  int v13;
  void *v14;
  void *backendResultAggregated;
  id v16;
  const void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  int64_t v21;
  BOOL v22;
  void *v23;
  unint64_t v24;
  int64_t v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  unsigned int backendResultAggregationCounter;
  void *v31;
  int v32;
  void *v33;
  BOOL v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  ADJasperColorInFieldCalibrationPipeline *pipeline;
  uint64_t v40;
  void *v41;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t frontendFeaturesInputElementSize;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
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
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  int v94;
  float v95;
  unint64_t v96;
  void *v97;
  uint64_t v98;
  _BOOL4 v99;
  void *v100;
  uint8_t buf[4];
  _BYTE v102[18];
  __int16 v103;
  double v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "setExecutionStatus:", -22950);
  -[ADExecutorParameters logger](self->_executorParameters, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistenceData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logDictionary:name:timestamp:", v9, "inputIntersessionData", self->_lastColorTimestamp);

  if (objc_msgSend(v6, "intersessionFeaturesHistoryCount"))
  {
    v10 = objc_msgSend(v6, "intersessionFeaturesHistoryCount");
    -[ADJasperColorInFieldCalibrationExecutorParameters pipelineParameters](self->_executorParameters, "pipelineParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "featuresVectorAggregationSize");

    if (v10 <= v12)
    {
      self->_backendResultAggregationCounter = objc_msgSend(v6, "intersessionFeaturesHistoryCount");
      backendResultAggregated = self->_backendResultAggregated;
      objc_msgSend(v6, "intersessionFeaturesHistory");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const void *)objc_msgSend(v16, "bytes");
      objc_msgSend(v6, "intersessionFeaturesHistory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      memcpy(backendResultAggregated, v17, objc_msgSend(v18, "length"));

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "intersessionFeaturesHistoryCount");
      -[ADJasperColorInFieldCalibrationExecutorParameters pipelineParameters](self->_executorParameters, "pipelineParameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v102 = v13;
      *(_WORD *)&v102[4] = 1024;
      *(_DWORD *)&v102[6] = objc_msgSend(v14, "featuresVectorAggregationSize");
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "mismatch intersession features count of %d against aggregation size of %d, history will not be loaded", buf, 0xEu);

    }
  }
  if (self->_preProcessInputColorFrameDone)
  {
    self->_preProcessInputColorFrameDone = 0;
    objc_msgSend(v7, "setExecuted:", 0);
    objc_msgSend(v6, "inFieldCalibrationTelemetryData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateValidPointsSum:", (int)-[ADJasperPointCloud length](self->_aggregatedPointCloud, "length"));
    if (!self->_isPrepared)
    {
      v25 = -22970;
LABEL_43:

      goto LABEL_44;
    }
    if (!self->_backendEspressoRunner || !self->_frontendEspressoRunner)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed preparing executor", buf, 2u);
      }
      v25 = -22960;
      goto LABEL_43;
    }
    if (!v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide a pointer to ADJasperColorInFieldCalibrationResult", buf, 2u);
      }
      v25 = -22953;
      goto LABEL_43;
    }
    v20 = -[ADJasperColorInFieldCalibrationExecutor numberOfExecutionSteps](self, "numberOfExecutionSteps");
    v21 = -[ADExecutorParameters stepsToSkip](self->_executorParameters, "stepsToSkip");
    v99 = -[ADExecutorParameters powerMeasureMode](self->_executorParameters, "powerMeasureMode");
    -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v20 - v21;
    if (v99)
    {
      v22 = v98-- < 1;
      if (v22)
        goto LABEL_41;
    }
    kdebug_trace();
    objc_msgSend(v100, "startWithUTFString:", "first network execution");
    -[ADExecutor frameExecutionStart](self, "frameExecutionStart");
    -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "start:", CFSTR("BackendProcess"));

    v24 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
    v25 = -[ADEspressoRunner execute](self->_backendEspressoRunner, "execute");
    objc_msgSend(v19, "reportBackendRunTime:", +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec") - v24);
    if (v25)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
LABEL_42:

        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v26 = MEMORY[0x24BDACB70];
      v27 = "failed executing backend";
LABEL_16:
      _os_log_error_impl(&dword_20B62B000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
      goto LABEL_42;
    }
    -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stop:", CFSTR("BackendProcess"));

    -[ADExecutorParameters logger](self->_executorParameters, "logger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logRawBuffer:size:name:timestamp:", -[ADEspressoBufferHandle data](self->_featuresOutputEspressoBufferHandle, "data"), self->_backendSingleResultSize, "featureVectorItr", self->_lastColorTimestamp);

    memcpy((char *)self->_backendResultAggregated + self->_backendSingleResultSize * self->_backendResultAggregationCounter, (const void *)-[ADEspressoBufferHandle data](self->_featuresOutputEspressoBufferHandle, "data"), self->_backendSingleResultSize);
    backendResultAggregationCounter = self->_backendResultAggregationCounter + 1;
    self->_backendResultAggregationCounter = backendResultAggregationCounter;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ADJasperColorInFieldCalibrationExecutorParameters pipelineParameters](self->_executorParameters, "pipelineParameters");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "featuresVectorAggregationSize");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v102 = backendResultAggregationCounter;
      *(_WORD *)&v102[4] = 1024;
      *(_DWORD *)&v102[6] = v32;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "executeForPreprocesed features index %d/%d", buf, 0xEu);

      backendResultAggregationCounter = self->_backendResultAggregationCounter;
    }
    -[ADJasperColorInFieldCalibrationExecutorParameters pipelineParameters](self->_executorParameters, "pipelineParameters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = backendResultAggregationCounter < objc_msgSend(v33, "featuresVectorAggregationSize");

    if (v34)
    {
      objc_msgSend(v7, "setExecutionStatus:", -22973);
      v35 = "first network execution";
    }
    else
    {
      -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "start:", CFSTR("FrontendProcess"));

      v96 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
      self->_backendResultAggregationCounter = 0;
      objc_msgSend(v100, "stopWithUTFString:", "first network execution");
      kdebug_trace();
      if (v99)
      {
        v22 = v98-- < 1;
        if (v22)
          goto LABEL_41;
      }
      kdebug_trace();
      objc_msgSend(v100, "startWithUTFString:", "preprocess features");
      pipeline = self->_pipeline;
      v97 = self->_backendResultAggregated;
      v40 = -[ADEspressoBufferHandle data](self->_frontendFeaturesInputEspressoBufferHandle, "data");
      -[ADEspressoBufferHandle dimensions](self->_featuresOutputEspressoBufferHandle, "dimensions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[ADJasperColorInFieldCalibrationPipeline processIntermediateResultsWithBackendFeaturesOutputVector:frontendEspressoFeaturesInput:dimensions:](pipeline, "processIntermediateResultsWithBackendFeaturesOutputVector:frontendEspressoFeaturesInput:dimensions:", v97, v40, v41);

      if (v25)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        *(_WORD *)buf = 0;
        v26 = MEMORY[0x24BDACB70];
        v27 = "failed processing intermediate results (backend features vector output to frontend features input)";
        goto LABEL_16;
      }
      objc_msgSend(v100, "stopWithUTFString:", "preprocess features");
      kdebug_trace();
      if (v99)
      {
        v22 = v98-- < 1;
        if (v22)
          goto LABEL_41;
      }
      kdebug_trace();
      objc_msgSend(v100, "startWithUTFString:", "second network execution");
      v25 = -[ADEspressoRunner execute](self->_frontendEspressoRunner, "execute");
      if (v25)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        *(_WORD *)buf = 0;
        v26 = MEMORY[0x24BDACB70];
        v27 = "failed executing frontend";
        goto LABEL_16;
      }
      v43 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
      -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stop:", CFSTR("FrontendProcess"));

      objc_msgSend(v19, "reportFrontendRunTime:", v43 - v96);
      v45 = -[ADEspressoBufferHandle dimensionsProduct](self->_frontendFeaturesInputEspressoBufferHandle, "dimensionsProduct");
      frontendFeaturesInputElementSize = self->_frontendFeaturesInputElementSize;
      -[ADExecutorParameters logger](self->_executorParameters, "logger");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "logRawBuffer:size:name:timestamp:", -[ADEspressoBufferHandle data](self->_frontendFeaturesInputEspressoBufferHandle, "data"), frontendFeaturesInputElementSize * v45, "featureVectorAvg", self->_lastColorTimestamp);

      objc_msgSend(v100, "stopWithUTFString:", "second network execution");
      kdebug_trace();
      v48 = v99;
      if (v98 >= 1)
        v48 = 0;
      if (v48)
      {
LABEL_41:
        v25 = 0;
        goto LABEL_42;
      }
      kdebug_trace();
      objc_msgSend(v100, "startWithUTFString:", "postprocess rotation");
      -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "start:", CFSTR("PostProcess"));

      v25 = -[ADJasperColorInFieldCalibrationPipeline postProcessFrontendOutputX:frontendOutputY:frontendOutputZ:frontendOutputErrorX:frontendOutputErrotY:frontendOutputErrorZ:interSessionData:jasperColorInFieldCalibrationResult:](self->_pipeline, "postProcessFrontendOutputX:frontendOutputY:frontendOutputZ:frontendOutputErrorX:frontendOutputErrotY:frontendOutputErrorZ:interSessionData:jasperColorInFieldCalibrationResult:", -[ADEspressoBufferHandle data](self->_frontendRotXOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendRotYOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendRotZOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendRotErrorXOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendRotErrorYOutputEspressoBufferHandle, "data"), -[ADEspressoBufferHandle data](self->_frontendRotErrorZOutputEspressoBufferHandle, "data"), v6, v7);
      if (v25)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        *(_WORD *)buf = 0;
        v26 = MEMORY[0x24BDACB70];
        v27 = "failed post processing pipeline results";
        goto LABEL_16;
      }
      -[ADExecutorParameters timeProfiler](self->_executorParameters, "timeProfiler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stop:", CFSTR("PostProcess"));

      -[ADExecutorParameters logger](self->_executorParameters, "logger");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictionaryRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "logDictionary:name:timestamp:", v52, "internalUseResults", self->_lastColorTimestamp);

      -[ADExecutorParameters logger](self->_executorParameters, "logger");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "jasperToColorExtrinsics");
      objc_msgSend(v53, "logMatrix4x3:name:timestamp:", "depthToColorExtrinsics");

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "preRelative2FactoryX");
        v55 = v54;
        objc_msgSend(v7, "preRelative2FactoryY");
        v57 = v56;
        objc_msgSend(v7, "preRelative2FactoryZ");
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v55;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v57;
        v103 = 2048;
        v104 = v58;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results relative to factory [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "postRelative2FactoryX");
        v60 = v59;
        objc_msgSend(v7, "postRelative2FactoryY");
        v62 = v61;
        objc_msgSend(v7, "postRelative2FactoryZ");
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v60;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v62;
        v103 = 2048;
        v104 = v63;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results relative to factory post ISF [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "deltaRotationX");
        v65 = v64;
        objc_msgSend(v7, "deltaRotationY");
        v67 = v66;
        objc_msgSend(v7, "deltaRotationZ");
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v65;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v67;
        v103 = 2048;
        v104 = v68;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results relative to previouse [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "postRelative2PrevX");
        v70 = v69;
        objc_msgSend(v7, "postRelative2PrevY");
        v72 = v71;
        objc_msgSend(v7, "postRelative2PrevZ");
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v70;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v72;
        v103 = 2048;
        v104 = v73;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results relative to previouse post ISF [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "absoluteRotationX");
        v75 = v74;
        objc_msgSend(v7, "absoluteRotationY");
        v77 = v76;
        objc_msgSend(v7, "absoluteRotationZ");
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v75;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v77;
        v103 = 2048;
        v104 = v78;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results absolute [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "absoluteRotationPostISFX");
        v80 = v79;
        objc_msgSend(v7, "absoluteRotationPostISFY");
        v82 = v81;
        objc_msgSend(v7, "absoluteRotationPostISFZ");
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v80;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v82;
        v103 = 2048;
        v104 = v83;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results absolute post ISF [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "factoryRotationX");
        v85 = v84;
        objc_msgSend(v7, "factoryRotationY");
        v87 = v86;
        objc_msgSend(v7, "factoryRotationZ");
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v85;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v87;
        v103 = 2048;
        v104 = v88;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run factory [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "stdX");
        v90 = v89;
        objc_msgSend(v7, "stdY");
        v92 = v91;
        objc_msgSend(v7, "stdZ");
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v90;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v92;
        v103 = 2048;
        v104 = v93;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run std [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v94 = objc_msgSend(v7, "executed");
        objc_msgSend(v7, "confidence");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v102 = v94;
        *(_WORD *)&v102[4] = 2048;
        *(double *)&v102[6] = v95;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run executed: %d with std: %f]", buf, 0x12u);
      }
      objc_msgSend(v19, "increaseRunTimesByOne");
      objc_msgSend(v19, "updateLastExecutionTime:", +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec"));
      if (-[ADJasperColorInFieldCalibrationExecutorParameters reportTelemetry](self->_executorParameters, "reportTelemetry"))
      {
        -[ADJasperColorInFieldCalibrationPipeline reportTelemetry:withInterSessionData:](self->_pipeline, "reportTelemetry:withInterSessionData:", v7, v6);
        objc_msgSend(v19, "reset");
      }
      v35 = "postprocess rotation";
    }
    objc_msgSend(v6, "setIntersessionFeaturesHistoryCount:", self->_backendResultAggregationCounter);
    v36 = self->_backendResultAggregationCounter;
    if ((_DWORD)v36)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_backendResultAggregated, self->_backendSingleResultSize * v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = (void *)objc_opt_new();
    }
    objc_msgSend(v6, "setIntersessionFeaturesHistory:", v37);

    objc_msgSend(v100, "stopWithUTFString:", v35);
    kdebug_trace();
    -[ADExecutor frameExecutionEnd](self, "frameExecutionEnd");
    goto LABEL_41;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "running executeForPreprocesed before preProcessInputColorFrame called", buf, 2u);
  }
  v25 = -22961;
LABEL_44:

  return v25;
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

- (ADJasperColorInFieldCalibrationPipeline)pipeline
{
  return self->_pipeline;
}

- (ADJasperColorInFieldCalibrationExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (ADCameraCalibration)colorCameraCalibration
{
  return self->_colorCameraCalibration;
}

- (ADCameraCalibration)jasperCameraCalibration
{
  return self->_jasperCameraCalibration;
}

- (__n128)vmcamToWmcamExtrinsics
{
  return a1[25];
}

- (__n128)setVmcamToWmcamExtrinsics:(__n128)a3
{
  result[25] = a2;
  result[26] = a3;
  result[27] = a4;
  result[28] = a5;
  return result;
}

- (__n128)wmcamToMcamExtrinsics
{
  return a1[29];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jasperCameraCalibration, 0);
  objc_storeStrong((id *)&self->_colorCameraCalibration, 0);
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_frontendRotErrorZOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotErrorYOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotErrorXOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotZOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotYOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotXOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendFeaturesInputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_featuresOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_aggregatedPointCloud, 0);
  objc_storeStrong((id *)&self->_mcamJCameraCalibration, 0);
  objc_storeStrong((id *)&self->_frontendEspressoRunner, 0);
  objc_storeStrong((id *)&self->_backendEspressoRunner, 0);
}

@end
