@implementation ADPCEDisparityColorExecutor

- (ADPCEDisparityColorExecutor)init
{
  return (ADPCEDisparityColorExecutor *)-[ADPCEDisparityColorExecutor initForInputSource:](self, "initForInputSource:", 0);
}

- (id)initForInputSource:(unint64_t)a3
{
  return -[ADPCEDisparityColorExecutor initForInputSource:parameters:](self, "initForInputSource:parameters:", a3, 0);
}

- (id)initForInputSource:(unint64_t)a3 parameters:(id)a4
{
  id v6;
  ADPCEDisparityColorExecutor *v7;
  ADPCEDisparityColorPipeline *v8;
  void *v9;
  uint64_t v10;
  ADPCEDisparityColorPipeline *pipeline;
  ADPCEDisparityColorExecutorParameters *v12;
  void *executorParameters;
  ADPCEDisparityColorExecutorParameters *v14;
  uint64_t v15;
  ADPCEDisparityColorExecutorParameters *v16;
  MTLDevice *v17;
  MTLDevice *metalDevice;
  ADPCEDisparityColorExecutor *v19;
  uint8_t v21[8];
  objc_super v22;
  int v23;
  __int128 v24;
  __int128 v25;

  v6 = a4;
  v23 = 335685520;
  v24 = 0u;
  v25 = 0u;
  kdebug_trace();
  v22.receiver = self;
  v22.super_class = (Class)ADPCEDisparityColorExecutor;
  v7 = -[ADExecutor init](&v22, sel_init);
  if (!v7)
    goto LABEL_9;
  v8 = [ADPCEDisparityColorPipeline alloc];
  objc_msgSend(v6, "pipelineParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ADPCEDisparityColorPipeline initWithParameters:inputSource:metalDevice:](v8, "initWithParameters:inputSource:metalDevice:", v9, a3, 0);
  pipeline = v7->_pipeline;
  v7->_pipeline = (ADPCEDisparityColorPipeline *)v10;

  if (!v7->_pipeline)
    goto LABEL_12;
  if (v6)
  {
    v12 = (ADPCEDisparityColorExecutorParameters *)v6;
    executorParameters = v7->_executorParameters;
    v7->_executorParameters = v12;
  }
  else
  {
    v14 = [ADPCEDisparityColorExecutorParameters alloc];
    -[ADPCEDisparityColorPipeline pipelineParameters](v7->_pipeline, "pipelineParameters");
    executorParameters = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ADPCEDisparityColorExecutorParameters initForPipelineParameters:inputSource:](v14, "initForPipelineParameters:inputSource:", executorParameters, a3);
    v16 = v7->_executorParameters;
    v7->_executorParameters = (ADPCEDisparityColorExecutorParameters *)v15;

  }
  if (!v7->_executorParameters)
  {
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  v17 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  metalDevice = v7->_metalDevice;
  v7->_metalDevice = v17;

  if (!v7->_metalDevice)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot create default metal device", v21, 2u);
    }
    goto LABEL_12;
  }
  v7->_itmPreProcessedColor = 0;
  v7->_itmProcessedUnfilteredDisparity = 0;
  v7->_itmPreProcessedDisparity = 0;
  v7->_itmUnprocessedOutputDisparity = 0;
  v7->_itmPostProcessedDisparity = 0;
  v7->_itmCroppedScaledColor = 0;
  v7->_itmRotatedColor = 0;
  v7->_itmCroppedScaledDisparity = 0;
  v7->_itmRotatedDisparity = 0;
  v7->_itmPrevDisparity = 0;
  v7->_itmPrevFeatures = 0;
  v7->_itmFeaturesOutput = 0;
  v7->_preprocessorInputMetalHelper = 0;
  v7->_preprocessorOutputMetalHelper = 0;
  v7->_postprocessorInputMetalHelper = 0;
  v7->_postprocessorOutputMetalHelper = 0;
  v7->_prevDisparityIsZeros = 0;
  v7->_isPrepared = 0;
LABEL_9:
  v19 = v7;
LABEL_13:
  kdebug_trace();

  return v19;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedDisparity);
  self->_itmPreProcessedDisparity = 0;
  CVPixelBufferRelease(self->_itmUnprocessedOutputDisparity);
  self->_itmUnprocessedOutputDisparity = 0;
  CVPixelBufferRelease(self->_itmPrevDisparity);
  self->_itmPrevDisparity = 0;
  CVPixelBufferRelease(self->_itmPrevFeatures);
  self->_itmPrevFeatures = 0;
  CVPixelBufferRelease(self->_itmFeaturesOutput);
  self->_itmFeaturesOutput = 0;
}

- (int64_t)allocateIntermediateBuffers
{
  ADEspressoRunner *espressoRunner;
  void *v4;
  void *v5;
  ADEspressoRunner *v6;
  void *v7;
  void *v8;
  ADEspressoRunner *v9;
  void *v10;
  void *v11;
  ADEspressoRunner *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ADEspressoRunner *v17;
  void *v18;
  void *v19;
  ADEspressoRunner *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CVBuffer *itmFeaturesOutput;

  -[ADPCEDisparityColorExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  espressoRunner = self->super._espressoRunner;
  -[ADPCEDisparityColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](espressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  v6 = self->super._espressoRunner;
  -[ADPCEDisparityColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disparityInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedDisparity = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v6, "createAndRegisterPixelBufferForDescriptor:", v8);

  v9 = self->super._espressoRunner;
  -[ADPCEDisparityColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disparityOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmUnprocessedOutputDisparity = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v9, "createAndRegisterPixelBufferForDescriptor:", v11);

  v12 = self->super._espressoRunner;
  -[ADPCEDisparityColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prevDisparityInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPrevDisparity = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v12, "createAndRegisterPixelBufferForDescriptor:", v14);

  -[ADPCEDisparityColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "prevFeaturesInput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = self->super._espressoRunner;
    -[ADPCEDisparityColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "prevFeaturesInput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmPrevFeatures = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v17, "createAndRegisterPixelBufferForDescriptor:", v19);

    v20 = self->super._espressoRunner;
    -[ADPCEDisparityColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "featuresOutput");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmFeaturesOutput = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v20, "createAndRegisterPixelBufferForDescriptor:", v22);

    if (!self->_itmPreProcessedColor)
      goto LABEL_15;
  }
  else
  {
    self->_itmPrevFeatures = 0;
    self->_itmFeaturesOutput = 0;
    if (!self->_itmPreProcessedColor)
      goto LABEL_15;
  }
  if (!self->_itmPreProcessedDisparity || !self->_itmUnprocessedOutputDisparity || !self->_itmPrevDisparity)
    goto LABEL_15;
  -[ADPCEDisparityColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "prevFeaturesInput");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

    return 0;
  }
  if (self->_itmPrevFeatures)
  {
    itmFeaturesOutput = self->_itmFeaturesOutput;

    if (!itmFeaturesOutput)
      goto LABEL_15;
    return 0;
  }

LABEL_15:
  -[ADPCEDisparityColorExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  return -22971;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 inputColorROI:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  ADPCEDisparityColorExecutor *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *BaseAddress;
  size_t DataSize;
  __CVBuffer *v16;
  uint8_t v18[8];
  int v19;
  __int128 v20;
  __int128 v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = self;
  objc_sync_enter(v9);
  v19 = 335680668;
  v20 = 0u;
  v21 = 0u;
  kdebug_trace();
  v10 = -[ADPCEDisparityColorPipeline adjustForEngine:](v9->_pipeline, "adjustForEngine:", a3);
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to adjust for engine", v18, 2u);
    }
  }
  else
  {
    -[ADPCEDisparityColorPipeline inferenceDescriptor](v9->_pipeline, "inferenceDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v9, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v13, 1, 2, v11, x, y, width, height);

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to prepare engine", v18, 2u);
      }
    }
    else
    {
      v10 = -[ADPCEDisparityColorExecutor allocateIntermediateBuffers](v9, "allocateIntermediateBuffers");
      CVPixelBufferLockBaseAddress(v9->_itmPrevDisparity, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(v9->_itmPrevDisparity);
      DataSize = CVPixelBufferGetDataSize(v9->_itmPrevDisparity);
      bzero(BaseAddress, DataSize);
      CVPixelBufferUnlockBaseAddress(v9->_itmPrevDisparity, 0);
      v9->_prevDisparityIsZeros = 1;
      PixelBufferUtils::blacken(v9->_itmPrevFeatures, v16);
      v9->_isPrepared = v10 == 0;
    }

  }
  kdebug_trace();
  objc_sync_exit(v9);

  return v10;
}

- (__CVBuffer)prevDisparity
{
  if (!-[ADPCEDisparityColorExecutorParameters temporalConsistencyActive](self->_executorParameters, "temporalConsistencyActive"))return 0;
  self->_prevDisparityIsZeros = 0;
  return self->_itmPrevDisparity;
}

- (__CVBuffer)prevFeatures
{
  if (-[ADPCEDisparityColorExecutorParameters temporalConsistencyActive](self->_executorParameters, "temporalConsistencyActive"))
  {
    return self->_itmPrevFeatures;
  }
  else
  {
    return 0;
  }
}

- (int64_t)preProcessDisparity:(__CVBuffer *)a3 normalizationMultiplier:(float)a4 normalizationOffset:(float)a5 output:(__CVBuffer *)a6
{
  __CVBuffer *v9;
  double Width;
  double Height;
  __CVBuffer **p_preprocessorInputMetalHelper;
  NSObject *v14;
  uint8_t *v15;
  os_log_type_t v16;
  __CVBuffer *v17;
  OSType PixelFormatType;
  __CVBuffer *preprocessorOutputMetalHelper;
  double v20;
  double v21;
  NSObject *v22;
  uint8_t *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  MTLCommandQueue *cmdQueue;
  MTLCommandQueue *v28;
  MTLCommandQueue *v29;
  void *v30;
  ADPCEDisparityColorPipeline *pipeline;
  uint64_t v32;
  int64_t v33;
  double v34;
  double v35;
  int64_t v36;
  OSType v37;
  uint8_t v39[16];
  uint8_t v40[16];
  uint8_t v41[16];
  uint8_t v42[2];
  __int16 v43;
  uint8_t buf[2];
  __int16 v45;

  v9 = a3;
  if (CVPixelBufferGetIOSurface(a3))
    goto LABEL_12;
  Width = (double)CVPixelBufferGetWidth(v9);
  Height = (double)CVPixelBufferGetHeight(v9);
  p_preprocessorInputMetalHelper = &self->_preprocessorInputMetalHelper;
  if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(v9), &self->_preprocessorInputMetalHelper, Width, Height))
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v45 = 0;
        v14 = MEMORY[0x24BDACB70];
        v15 = (uint8_t *)&v45;
        v16 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_20B62B000, v14, v16, "Preprocessor input disparity buffer is not io-surface backed. This will degregate performance", v15, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v14 = MEMORY[0x24BDACB70];
      v15 = buf;
      v16 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
  }
  v17 = *p_preprocessorInputMetalHelper;
  PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
  if (PixelFormatType == CVPixelBufferGetPixelFormatType(v17))
    copyPixelBufferVImage(v17, *MEMORY[0x24BDBEFB0], v9, *MEMORY[0x24BDBF090]);
  v9 = *p_preprocessorInputMetalHelper;
LABEL_12:
  preprocessorOutputMetalHelper = a6;
  if (!CVPixelBufferGetIOSurface(a6))
  {
    v20 = (double)CVPixelBufferGetWidth(a6);
    v21 = (double)CVPixelBufferGetHeight(a6);
    if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(a6), &self->_preprocessorOutputMetalHelper, v20, v21))
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v43 = 0;
          v22 = MEMORY[0x24BDACB70];
          v23 = (uint8_t *)&v43;
          v24 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
          _os_log_impl(&dword_20B62B000, v22, v24, "Preprocessor output disparity buffer is not io-surface backed. This will degregate performance", v23, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v42 = 0;
        v22 = MEMORY[0x24BDACB70];
        v23 = v42;
        v24 = OS_LOG_TYPE_INFO;
        goto LABEL_19;
      }
    }
    preprocessorOutputMetalHelper = self->_preprocessorOutputMetalHelper;
  }
  +[ADMetalUtils bindPixelBufferToMTL2DTexture:metalDevice:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:metalDevice:", v9, self->_metalDevice);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADMetalUtils bindPixelBufferToMTL2DTexture:metalDevice:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:metalDevice:", preprocessorOutputMetalHelper, self->_metalDevice);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  cmdQueue = self->_cmdQueue;
  if (cmdQueue
    || (v28 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_metalDevice, "newCommandQueue"),
        v29 = self->_cmdQueue,
        self->_cmdQueue = v28,
        v29,
        (cmdQueue = self->_cmdQueue) != 0))
  {
    -[MTLCommandQueue commandBuffer](cmdQueue, "commandBuffer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    pipeline = self->_pipeline;
    v32 = -[ADPCEDisparityColorExecutorParameters disparityInvalidValue](self->_executorParameters, "disparityInvalidValue");
    v33 = -[ADPCEDisparityColorExecutorParameters disparityRotation](self->_executorParameters, "disparityRotation");
    *(float *)&v34 = a4;
    *(float *)&v35 = a5;
    v36 = -[ADPCEDisparityColorPipeline encodeDisparityPreprocessingToCommandBuffer:input:normalizationMultiplier:normalizationOffset:invalidValue:rotation:output:](pipeline, "encodeDisparityPreprocessingToCommandBuffer:input:normalizationMultiplier:normalizationOffset:invalidValue:rotation:output:", v30, v25, v32, v33, v26, v34, v35);
    if (v36)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v40 = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed encoding preprocessing to command buffer", v40, 2u);
      }
    }
    else
    {
      objc_msgSend(v30, "commit");
      objc_msgSend(v30, "waitUntilCompleted");
      if (preprocessorOutputMetalHelper == a6
        || (v37 = CVPixelBufferGetPixelFormatType(preprocessorOutputMetalHelper),
            v37 == CVPixelBufferGetPixelFormatType(a6))
        && !copyPixelBufferVImage(a6, *MEMORY[0x24BDBEFB0], preprocessorOutputMetalHelper, *MEMORY[0x24BDBF090]))
      {
        v36 = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v39 = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed copying result to output buffer", v39, 2u);
        }
        v36 = -22950;
      }
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v41 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed initializing command queue", v41, 2u);
    }
    v36 = -22950;
  }

  return v36;
}

- (int64_t)postProcessDisparity:(__CVBuffer *)a3 output:(__CVBuffer *)a4
{
  __CVBuffer *v5;
  double Width;
  double Height;
  __CVBuffer **p_postprocessorInputMetalHelper;
  NSObject *v10;
  uint8_t *v11;
  os_log_type_t v12;
  __CVBuffer *v13;
  OSType PixelFormatType;
  __CVBuffer *postprocessorOutputMetalHelper;
  double v16;
  double v17;
  NSObject *v18;
  uint8_t *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  MTLCommandQueue *cmdQueue;
  MTLCommandQueue *v24;
  MTLCommandQueue *v25;
  void *v26;
  int64_t v27;
  OSType v28;
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t v33[2];
  __int16 v34;
  uint8_t buf[2];
  __int16 v36;

  v5 = a3;
  if (CVPixelBufferGetIOSurface(a3))
    goto LABEL_12;
  Width = (double)CVPixelBufferGetWidth(v5);
  Height = (double)CVPixelBufferGetHeight(v5);
  p_postprocessorInputMetalHelper = &self->_postprocessorInputMetalHelper;
  if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(v5), &self->_postprocessorInputMetalHelper, Width, Height))
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v36 = 0;
        v10 = MEMORY[0x24BDACB70];
        v11 = (uint8_t *)&v36;
        v12 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_20B62B000, v10, v12, "preprocessor input disparity buffer is not io-surface backed. This will degregate performance", v11, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = MEMORY[0x24BDACB70];
      v11 = buf;
      v12 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
  }
  v13 = *p_postprocessorInputMetalHelper;
  PixelFormatType = CVPixelBufferGetPixelFormatType(v5);
  if (PixelFormatType == CVPixelBufferGetPixelFormatType(v13))
    copyPixelBufferVImage(v13, *MEMORY[0x24BDBEFB0], v5, *MEMORY[0x24BDBF090]);
  v5 = *p_postprocessorInputMetalHelper;
LABEL_12:
  postprocessorOutputMetalHelper = a4;
  if (!CVPixelBufferGetIOSurface(a4))
  {
    v16 = (double)CVPixelBufferGetWidth(a4);
    v17 = (double)CVPixelBufferGetHeight(a4);
    if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(a4), &self->_postprocessorOutputMetalHelper, v16, v17))
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v34 = 0;
          v18 = MEMORY[0x24BDACB70];
          v19 = (uint8_t *)&v34;
          v20 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
          _os_log_impl(&dword_20B62B000, v18, v20, "preprocessor output disparity buffer is not io-surface backed. This will degregate performance", v19, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v33 = 0;
        v18 = MEMORY[0x24BDACB70];
        v19 = v33;
        v20 = OS_LOG_TYPE_INFO;
        goto LABEL_19;
      }
    }
    postprocessorOutputMetalHelper = self->_postprocessorOutputMetalHelper;
  }
  +[ADMetalUtils bindPixelBufferToMTL2DTexture:metalDevice:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:metalDevice:", v5, self->_metalDevice);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADMetalUtils bindPixelBufferToMTL2DTexture:metalDevice:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:metalDevice:", postprocessorOutputMetalHelper, self->_metalDevice);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  cmdQueue = self->_cmdQueue;
  if (cmdQueue
    || (v24 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_metalDevice, "newCommandQueue"),
        v25 = self->_cmdQueue,
        self->_cmdQueue = v24,
        v25,
        (cmdQueue = self->_cmdQueue) != 0))
  {
    -[MTLCommandQueue commandBuffer](cmdQueue, "commandBuffer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[ADPCEDisparityColorPipeline encodeDisparityPostprocessingToCommandBuffer:input:output:](self->_pipeline, "encodeDisparityPostprocessingToCommandBuffer:input:output:", v26, v21, v22);
    if (v27)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v31 = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed encoding postprocessing to command buffer", v31, 2u);
      }
    }
    else
    {
      objc_msgSend(v26, "commit");
      objc_msgSend(v26, "waitUntilCompleted");
      if (postprocessorOutputMetalHelper == a4
        || (v28 = CVPixelBufferGetPixelFormatType(postprocessorOutputMetalHelper),
            v28 == CVPixelBufferGetPixelFormatType(a4))
        && !copyPixelBufferVImage(a4, *MEMORY[0x24BDBEFB0], postprocessorOutputMetalHelper, *MEMORY[0x24BDBF090]))
      {
        v27 = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v30 = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed copying result to output buffer", v30, 2u);
        }
        v27 = -22950;
      }
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v32 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed initializing command queue", v32, 2u);
    }
    v27 = -22950;
  }

  return v27;
}

- (int64_t)executeWithDisparity:(__CVBuffer *)a3 color:(__CVBuffer *)a4 outDisparity:(__CVBuffer *)a5
{
  double v5;
  double v6;

  LODWORD(v5) = 1.0;
  LODWORD(v6) = 0;
  return -[ADPCEDisparityColorExecutor executeWithDisparity:normalizationMultiplier:normalizationOffset:color:outDisparity:](self, "executeWithDisparity:normalizationMultiplier:normalizationOffset:color:outDisparity:", a3, a4, a5, v5, v6);
}

- (int64_t)executeWithDisparity:(__CVBuffer *)a3 normalizationMultiplier:(float)a4 normalizationOffset:(float)a5 color:(__CVBuffer *)a6 outDisparity:(__CVBuffer *)a7
{
  ADPCEDisparityColorExecutor *v12;
  size_t Width;
  size_t Height;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double x;
  double y;
  double v30;
  double v31;
  int v32;
  int64_t v33;
  size_t v34;
  size_t v35;
  size_t v36;
  unint64_t v37;
  size_t v38;
  size_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t v48;
  BOOL v49;
  NSObject *v50;
  const char *v51;
  OSType PixelFormatType;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  BOOL v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v63;
  size_t v64;
  CVPixelBufferRef *p_itmProcessedUnfilteredDisparity;
  double v66;
  double v67;
  CVPixelBufferRef *p_itmPrevDisparity;
  CVPixelBufferRef *p_itmUnprocessedOutputDisparity;
  PixelBufferUtils *itmPostProcessedDisparity;
  size_t v71;
  size_t v72;
  BOOL v73;
  ADEspressoRunner *espressoRunner;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *BaseAddress;
  size_t DataSize;
  ADEspressoRunner *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __CVBuffer **v87;
  void *v88;
  void *v89;
  double v90;
  void *v91;
  uint8_t v92[16];
  uint8_t buf[8];
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  _QWORD v97[6];
  CGRect v98;
  CGRect v99;

  v97[4] = *MEMORY[0x24BDAC8D0];
  v12 = self;
  objc_sync_enter(v12);
  Width = CVPixelBufferGetWidth(a6);
  Height = CVPixelBufferGetHeight(a6);
  if (!v12->_isPrepared)
  {
    v33 = -[ADPCEDisparityColorExecutor prepareForEngineType:inputColorROI:](v12, "prepareForEngineType:inputColorROI:", v12->super._engineType, 0.0, 0.0, (double)Width, (double)Height);
    if (v33)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to prepare engine", buf, 2u);
      }
      goto LABEL_104;
    }
  }
  if (v12->super._espressoRunner)
  {
    if (a7)
    {
      -[ADExecutorParameters logger](v12->_executorParameters, "logger");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "systemUptime");
      v90 = v16;

      *(_DWORD *)buf = 335684600;
      v94 = 0u;
      v95 = 0u;
      kdebug_trace();
      v87 = a7;
      objc_msgSend(v91, "logPixelBuffer:name:timestamp:", a3, "inputDisparity", v90);
      objc_msgSend(v91, "logPixelBuffer:name:timestamp:", a6, "inputColor", v90);
      v96[0] = CFSTR("DisparityNormalizationMultiplier");
      *(float *)&v17 = a4;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v18;
      v96[1] = CFSTR("DisparityNormalizationOffset");
      *(float *)&v19 = a5;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v97[1] = v20;
      v96[2] = CFSTR("PCEBias");
      v21 = (void *)MEMORY[0x24BDD16E0];
      -[ADPCEDisparityColorPipeline pipelineParameters](v12->_pipeline, "pipelineParameters");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pceBias");
      objc_msgSend(v21, "numberWithFloat:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v97[2] = v23;
      v96[3] = CFSTR("NetworkTrainingWidth");
      v24 = (void *)MEMORY[0x24BDD16E0];
      -[ADPCEDisparityColorPipeline pipelineParameters](v12->_pipeline, "pipelineParameters");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "trainingWidth"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v97[3] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 4);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v91, "logDictionary:name:timestamp:", v89, "frameMetadata", v90);
      v27 = objc_msgSend(MEMORY[0x24BE05FF0], "adjustLayout:sourceOrientation:toRotationPreference:", objc_msgSend(MEMORY[0x24BE05FF0], "layoutForSize:", v12->super._inputRoi.size.width, v12->super._inputRoi.size.height), 1, 2);
      x = v12->super._inputRoi.origin.x;
      y = v12->super._inputRoi.origin.y;
      v30 = v12->super._inputRoi.size.width;
      v31 = v12->super._inputRoi.size.height;
      if (!-[ADPCEDisparityColorExecutorParameters disparityPreprocessingActive](v12->_executorParameters, "disparityPreprocessingActive"))
      {
        v32 = 0;
        goto LABEL_24;
      }
      if (-[ADPCEDisparityColorExecutorParameters disparityRotation](v12->_executorParameters, "disparityRotation") == 3)
      {
        x = v12->super._inputRoi.origin.y;
        y = (double)CVPixelBufferGetWidth(a6) - v12->super._inputRoi.origin.x;
        v30 = v12->super._inputRoi.size.height;
        v31 = -v12->super._inputRoi.size.width;
      }
      else
      {
        if (-[ADPCEDisparityColorExecutorParameters disparityRotation](v12->_executorParameters, "disparityRotation") == 2)
        {
          v32 = 0;
          x = (double)CVPixelBufferGetWidth(a6) - v12->super._inputRoi.origin.x;
          y = (double)CVPixelBufferGetHeight(a6) - v12->super._inputRoi.origin.y;
          v30 = -v12->super._inputRoi.size.width;
          v31 = -v12->super._inputRoi.size.height;
          goto LABEL_23;
        }
        if (-[ADPCEDisparityColorExecutorParameters disparityRotation](v12->_executorParameters, "disparityRotation") != 1)
        {
          v32 = 0;
          goto LABEL_23;
        }
        v34 = CVPixelBufferGetHeight(a6);
        y = v12->super._inputRoi.origin.x;
        x = (double)v34 - v12->super._inputRoi.origin.y;
        v31 = v12->super._inputRoi.size.width;
        v30 = -v12->super._inputRoi.size.height;
      }
      v32 = 1;
LABEL_23:
      v98.origin.x = x;
      v98.origin.y = y;
      v98.size.width = v30;
      v98.size.height = v31;
      v99 = CGRectStandardize(v98);
      x = v99.origin.x;
      y = v99.origin.y;
      v30 = v99.size.width;
      v31 = v99.size.height;
LABEL_24:
      v35 = CVPixelBufferGetWidth(a3);
      if (v32)
        v36 = CVPixelBufferGetHeight(a6);
      else
        v36 = CVPixelBufferGetWidth(a6);
      v37 = v36;
      v38 = CVPixelBufferGetHeight(a3);
      if (v32)
        v39 = CVPixelBufferGetWidth(a6);
      else
        v39 = CVPixelBufferGetHeight(a6);
      v40 = (float)((float)v35 / (float)v37);
      v41 = (float)((float)v38 / (float)v39);
      v42 = floor(v30 * v40);
      v43 = floor(v31 * v41);
      v44 = objc_msgSend(MEMORY[0x24BE05FF0], "adjustLayout:sourceOrientation:toRotationPreference:", objc_msgSend(MEMORY[0x24BE05FF0], "layoutForSize:", v42, v43), 1, 2);
      if (v32)
        v44 = objc_msgSend(MEMORY[0x24BE05FF0], "transposeLayout:", v44);
      if (v27 != v44)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v92 = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "color and disparity layouts don't match", v92, 2u);
        }
        v33 = -22957;
        goto LABEL_103;
      }
      v45 = -[ADPCEDisparityColorExecutor numberOfExecutionSteps](v12, "numberOfExecutionSteps");
      v46 = -[ADExecutorParameters stepsToSkip](v12->_executorParameters, "stepsToSkip");
      v47 = -[ADExecutorParameters powerMeasureMode](v12->_executorParameters, "powerMeasureMode");
      -[ADExecutorParameters timeProfiler](v12->_executorParameters, "timeProfiler");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v45 - v46;
      if (!v47 || (v49 = v48 < 1, --v48, !v49))
      {
        kdebug_trace();
        objc_msgSend(v88, "startWithUTFString:", "preprocess color");
        -[ADExecutor frameExecutionStart](v12, "frameExecutionStart");
        v33 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a6, LOBYTE(v12->super._rotationConstant), v12->_itmPreProcessedColor, &v12->_itmCroppedScaledColor, &v12->_itmRotatedColor, 1, v12->super._inputRoi.origin.x, v12->super._inputRoi.origin.y, v12->super._inputRoi.size.width, v12->super._inputRoi.size.height);
        if (v33)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v92 = 0;
            v50 = MEMORY[0x24BDACB70];
            v51 = "failed scaling color image";
LABEL_64:
            _os_log_error_impl(&dword_20B62B000, v50, OS_LOG_TYPE_ERROR, v51, v92, 2u);
            goto LABEL_102;
          }
          goto LABEL_102;
        }
        objc_msgSend(v91, "logPixelBuffer:name:timestamp:", v12->_itmPreProcessedColor, "preProcessedColor", v90);
        objc_msgSend(v88, "stopWithUTFString:", "preprocess color");
        kdebug_trace();
        if (!v47 || (v49 = v48 < 1, --v48, !v49))
        {
          kdebug_trace();
          objc_msgSend(v88, "startWithUTFString:", "preprocess disparity");
          PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
          -[ADPCEDisparityColorPipeline inferenceDescriptor](v12->_pipeline, "inferenceDescriptor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "disparityInput");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "imageDescriptor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 1751411059;
          v58 = objc_msgSend(v55, "pixelFormat") == 1751411059 && PixelFormatType == 1717856627;

          if (!v58)
          {
            -[ADPCEDisparityColorPipeline inferenceDescriptor](v12->_pipeline, "inferenceDescriptor");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "disparityInput");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "imageDescriptor");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v61, "pixelFormat") == 1717856627 && PixelFormatType == 1751411059;

            if (v63)
              v56 = 1717856627;
            else
              v56 = PixelFormatType;
          }
          v64 = CVPixelBufferGetWidth(a3);
          p_itmProcessedUnfilteredDisparity = &v12->_itmProcessedUnfilteredDisparity;
          if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", v56, &v12->_itmProcessedUnfilteredDisparity, (double)v64, (double)CVPixelBufferGetHeight(a3)))
          {
            CVPixelBufferRelease(v12->_itmCroppedScaledDisparity);
            v12->_itmCroppedScaledDisparity = 0;
            CVPixelBufferRelease(v12->_itmRotatedDisparity);
            v12->_itmRotatedDisparity = 0;
          }
          v33 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v12->super._rotationConstant), *p_itmProcessedUnfilteredDisparity, &v12->_itmCroppedScaledDisparity, &v12->_itmRotatedDisparity, 1, floor(x * v40), floor(y * v41), v42, v43);
          if (v33)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v92 = 0;
              v50 = MEMORY[0x24BDACB70];
              v51 = "failed scaling disparity image";
              goto LABEL_64;
            }
LABEL_102:

LABEL_103:
            kdebug_trace();

            goto LABEL_104;
          }
          objc_msgSend(v91, "logPixelBuffer:name:timestamp:", *p_itmProcessedUnfilteredDisparity, "preProcessedUnfilteredDisparity", v90);
          if (-[ADPCEDisparityColorExecutorParameters disparityPreprocessingActive](v12->_executorParameters, "disparityPreprocessingActive"))
          {
            *(float *)&v66 = a4;
            *(float *)&v67 = a5;
            v33 = -[ADPCEDisparityColorExecutor preProcessDisparity:normalizationMultiplier:normalizationOffset:output:](v12, "preProcessDisparity:normalizationMultiplier:normalizationOffset:output:", *p_itmProcessedUnfilteredDisparity, v12->_itmPreProcessedDisparity, v66, v67);
            if (v33)
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_102;
              *(_WORD *)v92 = 0;
              v50 = MEMORY[0x24BDACB70];
              v51 = "failed to pre-process disparity";
              goto LABEL_64;
            }
          }
          else
          {
            PixelBufferUtils::copyPixelBuffer(v12->_itmPreProcessedDisparity, *p_itmProcessedUnfilteredDisparity, 0);
          }
          objc_msgSend(v91, "logPixelBuffer:name:timestamp:", v12->_itmPreProcessedDisparity, "preProcessedDisparity", v90);
          p_itmPrevDisparity = &v12->_itmPrevDisparity;
          objc_msgSend(v91, "logPixelBuffer:name:timestamp:", v12->_itmPrevDisparity, "prevDisparity", v90);
          objc_msgSend(v91, "logPixelBuffer:name:timestamp:", v12->_itmPrevFeatures, "prevFeatures", v90);
          objc_msgSend(v88, "stopWithUTFString:", "preprocess disparity");
          kdebug_trace();
          if (!v47 || (v49 = v48 < 1, --v48, !v49))
          {
            kdebug_trace();
            objc_msgSend(v88, "startWithUTFString:", "network execution");
            v33 = -[ADEspressoRunner execute](v12->super._espressoRunner, "execute");
            if (v33)
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_102;
              *(_WORD *)v92 = 0;
              v50 = MEMORY[0x24BDACB70];
              v51 = "failed executing espresso plan";
              goto LABEL_64;
            }
            p_itmUnprocessedOutputDisparity = &v12->_itmUnprocessedOutputDisparity;
            objc_msgSend(v91, "logPixelBuffer:name:timestamp:", v12->_itmUnprocessedOutputDisparity, "outputDisparity", v90);
            objc_msgSend(v91, "logPixelBuffer:name:timestamp:", v12->_itmFeaturesOutput, "outputFeatures", v90);
            objc_msgSend(v88, "stopWithUTFString:", "network execution");
            kdebug_trace();
            if (!v47 || (v49 = v48 < 1, --v48, !v49))
            {
              kdebug_trace();
              objc_msgSend(v88, "startWithUTFString:", "postprocess depth");
              itmPostProcessedDisparity = *p_itmUnprocessedOutputDisparity;
              if (-[ADPCEDisparityColorExecutorParameters disparityPostprocessingActive](v12->_executorParameters, "disparityPostprocessingActive"))
              {
                v71 = CVPixelBufferGetWidth(*p_itmUnprocessedOutputDisparity);
                v72 = CVPixelBufferGetHeight(*p_itmUnprocessedOutputDisparity);
                +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(*p_itmUnprocessedOutputDisparity), &v12->_itmPostProcessedDisparity, (double)v71, (double)v72);
                v33 = -[ADPCEDisparityColorExecutor postProcessDisparity:output:](v12, "postProcessDisparity:output:", *p_itmUnprocessedOutputDisparity, v12->_itmPostProcessedDisparity);
                if (v33)
                {
                  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    goto LABEL_102;
                  *(_WORD *)v92 = 0;
                  v50 = MEMORY[0x24BDACB70];
                  v51 = "failed to post-process disparity";
                  goto LABEL_64;
                }
                itmPostProcessedDisparity = v12->_itmPostProcessedDisparity;
              }
              objc_msgSend(v91, "logPixelBuffer:name:timestamp:", itmPostProcessedDisparity, "postProcessedOutputDisparity", v90);
              if (!*v87)
                *v87 = PixelBufferUtils::createPixelBufferWithSameSize(itmPostProcessedDisparity, (__CVBuffer *)0x66646973, 1);
              v33 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", itmPostProcessedDisparity);
              if (v33)
              {
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  goto LABEL_102;
                *(_WORD *)v92 = 0;
                v50 = MEMORY[0x24BDACB70];
                v51 = "failed converting disparity";
                goto LABEL_64;
              }
              objc_msgSend(v91, "logPixelBuffer:name:timestamp:", *v87, "outputConvertedUnits", v90);
              objc_msgSend(v88, "stopWithUTFString:", "postprocess depth");
              kdebug_trace();
              v73 = v47;
              if (v48 >= 1)
                v73 = 0;
              if (!v73)
              {
                kdebug_trace();
                objc_msgSend(v88, "startWithUTFString:", "postprocess previous depth");
                if (-[ADPCEDisparityColorExecutorParameters temporalConsistencyActive](v12->_executorParameters, "temporalConsistencyActive"))
                {
                  v12->_prevDisparityIsZeros = 0;
                  espressoRunner = v12->super._espressoRunner;
                  -[ADPCEDisparityColorPipeline inferenceDescriptor](v12->_pipeline, "inferenceDescriptor");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "prevDisparityInput");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ADPCEDisparityColorPipeline inferenceDescriptor](v12->_pipeline, "inferenceDescriptor");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "disparityOutput");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = -[ADEspressoRunner updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:](espressoRunner, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", &v12->_itmPrevDisparity, v76, &v12->_itmUnprocessedOutputDisparity, v78);

                  if (v33)
                  {
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      goto LABEL_102;
                    *(_WORD *)v92 = 0;
                    v50 = MEMORY[0x24BDACB70];
                    v51 = "failed updating previous disparity";
                    goto LABEL_64;
                  }
                  if (v12->_itmPrevFeatures)
                  {
                    v81 = v12->super._espressoRunner;
                    -[ADPCEDisparityColorPipeline inferenceDescriptor](v12->_pipeline, "inferenceDescriptor");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "prevFeaturesInput");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ADPCEDisparityColorPipeline inferenceDescriptor](v12->_pipeline, "inferenceDescriptor");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "featuresOutput");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = -[ADEspressoRunner updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:](v81, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", &v12->_itmPrevFeatures, v83, &v12->_itmFeaturesOutput, v85);

                    if (v33)
                    {
                      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        goto LABEL_102;
                      *(_WORD *)v92 = 0;
                      v50 = MEMORY[0x24BDACB70];
                      v51 = "failed updating previous features";
                      goto LABEL_64;
                    }
                  }
                }
                else if (!v12->_prevDisparityIsZeros)
                {
                  CVPixelBufferLockBaseAddress(*p_itmPrevDisparity, 0);
                  BaseAddress = CVPixelBufferGetBaseAddress(*p_itmPrevDisparity);
                  DataSize = CVPixelBufferGetDataSize(*p_itmPrevDisparity);
                  bzero(BaseAddress, DataSize);
                  CVPixelBufferUnlockBaseAddress(*p_itmPrevDisparity, 0);
                  v12->_prevDisparityIsZeros = 1;
                }
                objc_msgSend(v88, "stopWithUTFString:", "postprocess previous depth");
                kdebug_trace();
                -[ADExecutor frameExecutionEnd](v12, "frameExecutionEnd");
              }
            }
          }
        }
      }
      v33 = 0;
      goto LABEL_102;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide an output pointer to CVPixelBufferRef", buf, 2u);
    }
    v33 = -22953;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "executor could not be initialized", buf, 2u);
    }
    v33 = -22960;
  }
LABEL_104:
  objc_sync_exit(v12);

  return v33;
}

- (void)dealloc
{
  objc_super v3;

  -[ADPCEDisparityColorExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  CVPixelBufferRelease(self->_itmProcessedUnfilteredDisparity);
  CVPixelBufferRelease(self->_itmCroppedScaledColor);
  CVPixelBufferRelease(self->_itmRotatedColor);
  CVPixelBufferRelease(self->_itmCroppedScaledDisparity);
  CVPixelBufferRelease(self->_itmRotatedDisparity);
  CVPixelBufferRelease(self->_itmPostProcessedDisparity);
  CVPixelBufferRelease(self->_preprocessorInputMetalHelper);
  CVPixelBufferRelease(self->_preprocessorOutputMetalHelper);
  CVPixelBufferRelease(self->_postprocessorInputMetalHelper);
  CVPixelBufferRelease(self->_postprocessorOutputMetalHelper);
  v3.receiver = self;
  v3.super_class = (Class)ADPCEDisparityColorExecutor;
  -[ADExecutor dealloc](&v3, sel_dealloc);
}

- (id)getIntermediates
{
  void *v3;
  __CVBuffer *itmPreProcessedColor;
  void *v5;
  __CVBuffer *itmProcessedUnfilteredDisparity;
  void *v7;
  __CVBuffer *itmPreProcessedDisparity;
  void *v9;
  __CVBuffer *itmUnprocessedOutputDisparity;
  void *v11;
  __CVBuffer *itmPostProcessedDisparity;
  void *v13;
  __CVBuffer *itmCroppedScaledColor;
  void *v15;
  __CVBuffer *itmRotatedColor;
  void *v17;
  __CVBuffer *itmCroppedScaledDisparity;
  void *v19;
  __CVBuffer *itmRotatedDisparity;
  void *v21;
  __CVBuffer *itmPrevDisparity;
  void *v23;
  __CVBuffer *itmPrevFeatures;
  void *v25;
  __CVBuffer *itmFeaturesOutput;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v51[0] = CFSTR("name");
    v51[1] = CFSTR("image");
    v52[0] = CFSTR("PreProcessed Color");
    v52[1] = itmPreProcessedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  itmProcessedUnfilteredDisparity = self->_itmProcessedUnfilteredDisparity;
  if (itmProcessedUnfilteredDisparity)
  {
    v49[0] = CFSTR("name");
    v49[1] = CFSTR("image");
    v50[0] = CFSTR("Processed Unfiltered Disparity");
    v50[1] = itmProcessedUnfilteredDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  itmPreProcessedDisparity = self->_itmPreProcessedDisparity;
  if (itmPreProcessedDisparity)
  {
    v47[0] = CFSTR("name");
    v47[1] = CFSTR("image");
    v48[0] = CFSTR("PreProcessed Disparity");
    v48[1] = itmPreProcessedDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  itmUnprocessedOutputDisparity = self->_itmUnprocessedOutputDisparity;
  if (itmUnprocessedOutputDisparity)
  {
    v45[0] = CFSTR("name");
    v45[1] = CFSTR("image");
    v46[0] = CFSTR("Unprocessed OutputDisparity");
    v46[1] = itmUnprocessedOutputDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  itmPostProcessedDisparity = self->_itmPostProcessedDisparity;
  if (itmPostProcessedDisparity)
  {
    v43[0] = CFSTR("name");
    v43[1] = CFSTR("image");
    v44[0] = CFSTR("PostProcessed OutputDisparity");
    v44[1] = itmPostProcessedDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
  {
    v41[0] = CFSTR("name");
    v41[1] = CFSTR("image");
    v42[0] = CFSTR("Cropped ScaledColor");
    v42[1] = itmCroppedScaledColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
  {
    v39[0] = CFSTR("name");
    v39[1] = CFSTR("image");
    v40[0] = CFSTR("Rotated Color");
    v40[1] = itmRotatedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  itmCroppedScaledDisparity = self->_itmCroppedScaledDisparity;
  if (itmCroppedScaledDisparity)
  {
    v37[0] = CFSTR("name");
    v37[1] = CFSTR("image");
    v38[0] = CFSTR("Cropped Scaled Disparity");
    v38[1] = itmCroppedScaledDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  itmRotatedDisparity = self->_itmRotatedDisparity;
  if (itmRotatedDisparity)
  {
    v35[0] = CFSTR("name");
    v35[1] = CFSTR("image");
    v36[0] = CFSTR("Rotated Disparity");
    v36[1] = itmRotatedDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  itmPrevDisparity = self->_itmPrevDisparity;
  if (itmPrevDisparity)
  {
    v33[0] = CFSTR("name");
    v33[1] = CFSTR("image");
    v34[0] = CFSTR("Previous Disparity");
    v34[1] = itmPrevDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  itmPrevFeatures = self->_itmPrevFeatures;
  if (itmPrevFeatures)
  {
    v31[0] = CFSTR("name");
    v31[1] = CFSTR("image");
    v32[0] = CFSTR("Previous Features");
    v32[1] = itmPrevFeatures;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v25);

  }
  itmFeaturesOutput = self->_itmFeaturesOutput;
  if (itmFeaturesOutput)
  {
    v29[0] = CFSTR("name");
    v29[1] = CFSTR("image");
    v30[0] = CFSTR("Output Features");
    v30[1] = itmFeaturesOutput;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

  }
  return v3;
}

- (int64_t)numberOfExecutionSteps
{
  return 5;
}

- (ADPCEDisparityColorExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_cmdQueue, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
