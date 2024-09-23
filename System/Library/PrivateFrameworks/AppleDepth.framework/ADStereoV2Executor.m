@implementation ADStereoV2Executor

- (ADStereoV2Executor)init
{
  return -[ADStereoV2Executor initWithParameters:](self, "initWithParameters:", 0);
}

- (ADStereoV2Executor)initWithParameters:(id)a3
{
  id v4;
  ADStereoV2Executor *v5;
  ADStereoV2Pipeline *v6;
  void *v7;
  uint64_t v8;
  ADStereoV2Pipeline *pipeline;
  ADEspressoBufferHandle *temporalSmoothingCurrentFeaturesRatioMinBuffer;
  ADEspressoBufferHandle *temporalSmoothingPreviousFeaturesRatioMinBuffer;
  ADStereoV2Executor *v12;
  objc_super v14;
  int v15;
  __int128 v16;
  __int128 v17;

  v4 = a3;
  v15 = 335682764;
  v16 = 0u;
  v17 = 0u;
  kdebug_trace();
  v14.receiver = self;
  v14.super_class = (Class)ADStereoV2Executor;
  v5 = -[ADExecutor init](&v14, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = (id)objc_opt_new();
    objc_storeStrong((id *)&v5->_executorParameters, v4);
    if (!v5->_executorParameters)
      goto LABEL_8;
    v6 = [ADStereoV2Pipeline alloc];
    -[ADStereoV2ExecutorParameters pipelineParameters](v5->_executorParameters, "pipelineParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ADStereoV2Pipeline initWithParameters:](v6, "initWithParameters:", v7);
    pipeline = v5->_pipeline;
    v5->_pipeline = (ADStereoV2Pipeline *)v8;

    if (!v5->_pipeline)
    {
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
    temporalSmoothingCurrentFeaturesRatioMinBuffer = v5->_temporalSmoothingCurrentFeaturesRatioMinBuffer;
    v5->_temporalSmoothingCurrentFeaturesRatioMinBuffer = 0;

    temporalSmoothingPreviousFeaturesRatioMinBuffer = v5->_temporalSmoothingPreviousFeaturesRatioMinBuffer;
    v5->_temporalSmoothingPreviousFeaturesRatioMinBuffer = 0;

    v5->_refColor = 0;
    v5->_itmChunkyRefColor = 0;
    v5->_itmCroppedScaledRefColor = 0;
    v5->_itmRotatedRefColor = 0;
    v5->_auxColor = 0;
    v5->_itmChunkyAuxColor = 0;
    v5->_itmCroppedScaledAuxColor = 0;
    v5->_itmRotatedAuxColor = 0;
    v5->_itmPrevDepthFeatures = 0;
    v5->_itmPrevColorFeatures = 0;
    v5->_disparity = 0;
    v5->_itmDepthFeaturesOutput = 0;
    v5->_itmColorFeaturesOutput = 0;
    v5->_isPrepared = 0;
  }
  v12 = v5;
LABEL_9:
  kdebug_trace();

  return v12;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_refColor);
  self->_refColor = 0;
  CVPixelBufferRelease(self->_auxColor);
  self->_auxColor = 0;
  CVPixelBufferRelease(self->_disparity);
  self->_disparity = 0;
  CVPixelBufferRelease(self->_itmPrevDepthFeatures);
  self->_itmPrevDepthFeatures = 0;
  CVPixelBufferRelease(self->_itmPrevColorFeatures);
  self->_itmPrevColorFeatures = 0;
  CVPixelBufferRelease(self->_itmDepthFeaturesOutput);
  self->_itmDepthFeaturesOutput = 0;
  CVPixelBufferRelease(self->_itmColorFeaturesOutput);
  self->_itmColorFeaturesOutput = 0;
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
  ADEspressoRunner *v15;
  void *v16;
  void *v17;
  ADEspressoRunner *v18;
  void *v19;
  void *v20;
  ADEspressoBufferHandle *v21;
  ADEspressoBufferHandle *temporalSmoothingCurrentFeaturesRatioMinBuffer;
  ADEspressoRunner *v23;
  void *v24;
  void *v25;
  ADEspressoBufferHandle *v26;
  ADEspressoBufferHandle *temporalSmoothingPreviousFeaturesRatioMinBuffer;
  ADEspressoRunner *v28;
  void *v29;
  void *v30;
  ADEspressoRunner *v31;
  void *v32;
  void *v33;
  __CVBuffer *v34;
  __CVBuffer *v35;

  -[ADStereoV2Executor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  espressoRunner = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_refColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](espressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  v6 = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "auxiliaryInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_auxColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v6, "createAndRegisterPixelBufferForDescriptor:", v8);

  v9 = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disparityOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_disparity = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v9, "createAndRegisterPixelBufferForDescriptor:", v11);

  v12 = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prevDepthFeaturesInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPrevDepthFeatures = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v12, "createAndRegisterPixelBufferForDescriptor:", v14);

  v15 = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "prevColorFeaturesInput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPrevColorFeatures = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v15, "createAndRegisterPixelBufferForDescriptor:", v17);

  v18 = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "temporalSmoothingCurrentFeaturesRatioMinInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v18, "registerDescriptor:", v20);
  v21 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  temporalSmoothingCurrentFeaturesRatioMinBuffer = self->_temporalSmoothingCurrentFeaturesRatioMinBuffer;
  self->_temporalSmoothingCurrentFeaturesRatioMinBuffer = v21;

  v23 = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "temporalSmoothingPreviousFeaturesRatioMinInput");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoRunner registerDescriptor:](v23, "registerDescriptor:", v25);
  v26 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
  temporalSmoothingPreviousFeaturesRatioMinBuffer = self->_temporalSmoothingPreviousFeaturesRatioMinBuffer;
  self->_temporalSmoothingPreviousFeaturesRatioMinBuffer = v26;

  v28 = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "depthFeaturesOutput");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmDepthFeaturesOutput = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v28, "createAndRegisterPixelBufferForDescriptor:", v30);

  v31 = self->super._espressoRunner;
  -[ADStereoV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "colorFeaturesOutput");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmColorFeaturesOutput = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v31, "createAndRegisterPixelBufferForDescriptor:", v33);

  self->_itmChunkyRefColor = PixelBufferUtils::createPixelBufferCopy(self->_refColor, v34);
  self->_itmChunkyAuxColor = PixelBufferUtils::createPixelBufferCopy(self->_auxColor, v35);
  return 0;
}

- (int64_t)prepareForEngineType:(unint64_t)a3
{
  ADStereoV2Executor *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  __CVBuffer *v15;
  __CVBuffer *v16;
  uint8_t v18[8];
  int v19;
  __int128 v20;
  __int128 v21;

  v4 = self;
  objc_sync_enter(v4);
  v19 = 335682368;
  v20 = 0u;
  v21 = 0u;
  kdebug_trace();
  v5 = -[ADStereoV2Pipeline adjustForEngine:](v4->_pipeline, "adjustForEngine:", a3);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to adjust for engine", v18, 2u);
    }
  }
  else
  {
    -[ADStereoV2Pipeline inferenceDescriptor](v4->_pipeline, "inferenceDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "referenceInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeForLayout:", 255);
    v10 = v9;
    v12 = v11;

    objc_msgSend(v6, "referenceInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v4, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v14, 1, 2, v6, 0.0, 0.0, v10, v12);

    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to prepare engine", v18, 2u);
      }
    }
    else
    {
      v5 = -[ADStereoV2Executor allocateIntermediateBuffers](v4, "allocateIntermediateBuffers");
      PixelBufferUtils::blacken(v4->_itmPrevDepthFeatures, v15);
      PixelBufferUtils::blacken(v4->_itmPrevColorFeatures, v16);
      v4->_isPrepared = v5 == 0;
    }

  }
  kdebug_trace();
  objc_sync_exit(v4);

  return v5;
}

- (__CVBuffer)prevColorFeatures
{
  if (-[ADStereoV2ExecutorParameters temporalConsistencyActive](self->_executorParameters, "temporalConsistencyActive"))
    return self->_itmPrevColorFeatures;
  else
    return 0;
}

- (__CVBuffer)prevDepthFeatures
{
  if (-[ADStereoV2ExecutorParameters temporalConsistencyActive](self->_executorParameters, "temporalConsistencyActive"))
    return self->_itmPrevDepthFeatures;
  else
    return 0;
}

- (int64_t)executeWithRefColor:(__CVBuffer *)a3 auxColor:(__CVBuffer *)a4 outDisparityMap:(__CVBuffer *)a5
{
  ADStereoV2Executor *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  BOOL v16;
  _BOOL4 v17;
  int *v18;
  uint64_t v19;
  double *v20;
  int64_t v21;
  NSObject *v22;
  const char *v23;
  _BOOL4 v24;
  int *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int v32;
  __CVBuffer *disparity;
  __CVBuffer *PixelFormatType;
  ADEspressoRunner *espressoRunner;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  ADEspressoRunner *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CVBuffer **p_itmPrevColorFeatures;
  void *v48;
  void *v49;
  uint8_t buf[16];
  uint8_t v51[8];
  __int128 v52;
  __int128 v53;

  v8 = self;
  objc_sync_enter(v8);
  if (!v8->_isPrepared)
  {
    v21 = -[ADStereoV2Executor prepareForEngineType:](v8, "prepareForEngineType:", v8->super._engineType);
    if (v21)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v51 = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to prepare engine", v51, 2u);
      }
      goto LABEL_70;
    }
  }
  if (v8->super._espressoRunner)
  {
    if (a5)
    {
      -[ADExecutorParameters logger](v8->_executorParameters, "logger");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemUptime");
      v11 = v10;

      *(_DWORD *)v51 = 335683080;
      v52 = 0u;
      v53 = 0u;
      kdebug_trace();
      objc_msgSend(v48, "logPixelBuffer:name:timestamp:", a3, "refColor", v11);
      objc_msgSend(v48, "logPixelBuffer:name:timestamp:", a4, "auxColor", v11);
      v12 = -[ADStereoV2Executor numberOfExecutionSteps](v8, "numberOfExecutionSteps");
      v13 = -[ADExecutorParameters stepsToSkip](v8->_executorParameters, "stepsToSkip");
      v14 = -[ADExecutorParameters powerMeasureMode](v8->_executorParameters, "powerMeasureMode");
      -[ADExecutorParameters timeProfiler](v8->_executorParameters, "timeProfiler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12 - v13;
      if (!v14 || (v16 = v15 < 1, --v15, !v16))
      {
        kdebug_trace();
        objc_msgSend(v49, "startWithUTFString:", "preprocess color");
        -[ADExecutor frameExecutionStart](v8, "frameExecutionStart");
        v17 = -[ADStereoV2Pipeline shouldPreProcessColorInputs](v8->_pipeline, "shouldPreProcessColorInputs");
        v18 = &OBJC_IVAR___ADStereoV2Executor__refColor;
        if (v17)
          v18 = &OBJC_IVAR___ADStereoV2Executor__itmChunkyRefColor;
        v19 = *(uint64_t *)((char *)&v8->super.super.isa + *v18);
        v20 = (double *)MEMORY[0x24BDBF090];
        v21 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v8->super._rotationConstant), v19, &v8->_itmCroppedScaledRefColor, &v8->_itmRotatedRefColor, 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        if (v21)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
LABEL_69:

            kdebug_trace();
            goto LABEL_70;
          }
          *(_WORD *)buf = 0;
          v22 = MEMORY[0x24BDACB70];
          v23 = "failed converting ref image";
LABEL_11:
          _os_log_error_impl(&dword_20B62B000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
          goto LABEL_69;
        }
        if (-[ADStereoV2Pipeline shouldPreProcessColorInputs](v8->_pipeline, "shouldPreProcessColorInputs"))
        {
          v21 = -[ADStereoV2Pipeline preProcessColorInput:toBuffer:](v8->_pipeline, "preProcessColorInput:toBuffer:", v19, v8->_refColor);
          if (v21)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_69;
            *(_WORD *)buf = 0;
            v22 = MEMORY[0x24BDACB70];
            v23 = "failed pre processing ref image";
            goto LABEL_11;
          }
        }
        objc_msgSend(v49, "stopWithUTFString:", "preprocess color");
        kdebug_trace();
        if (!v14 || (v16 = v15 < 1, --v15, !v16))
        {
          kdebug_trace();
          objc_msgSend(v49, "startWithUTFString:", "preprocess auxiliary color");
          v24 = -[ADStereoV2Pipeline shouldPreProcessColorInputs](v8->_pipeline, "shouldPreProcessColorInputs");
          v25 = &OBJC_IVAR___ADStereoV2Executor__auxColor;
          if (v24)
            v25 = &OBJC_IVAR___ADStereoV2Executor__itmChunkyAuxColor;
          v26 = *(uint64_t *)((char *)&v8->super.super.isa + *v25);
          v21 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a4, LOBYTE(v8->super._rotationConstant), v26, &v8->_itmCroppedScaledAuxColor, &v8->_itmRotatedAuxColor, 1, *v20, v20[1], v20[2], v20[3]);
          if (v21)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_69;
            *(_WORD *)buf = 0;
            v22 = MEMORY[0x24BDACB70];
            v23 = "failed converting aux image";
            goto LABEL_11;
          }
          if (-[ADStereoV2Pipeline shouldPreProcessColorInputs](v8->_pipeline, "shouldPreProcessColorInputs"))
          {
            v21 = -[ADStereoV2Pipeline preProcessColorInput:toBuffer:](v8->_pipeline, "preProcessColorInput:toBuffer:", v26, v8->_auxColor);
            if (v21)
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_69;
              *(_WORD *)buf = 0;
              v22 = MEMORY[0x24BDACB70];
              v23 = "failed pre processing aux image";
              goto LABEL_11;
            }
          }
          objc_msgSend(v48, "logPixelBuffer:name:timestamp:", v8->_refColor, "refColorProcessed", v11);
          objc_msgSend(v48, "logPixelBuffer:name:timestamp:", v8->_auxColor, "auxColorProcessed", v11);
          objc_msgSend(v48, "logPixelBuffer:name:timestamp:", v8->_itmPrevDepthFeatures, "prevDepthFeatures", v11);
          p_itmPrevColorFeatures = &v8->_itmPrevColorFeatures;
          objc_msgSend(v48, "logPixelBuffer:name:timestamp:", v8->_itmPrevColorFeatures, "prevColorFeatures", v11);
          -[ADStereoV2Pipeline inferenceDescriptor](v8->_pipeline, "inferenceDescriptor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "temporalSmoothingCurrentFeaturesRatioMinInput");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "imageDescriptor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "pixelFormat");

          if (v30 != 1278226534 && v30 != 1278226536)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "unsupported temporal smoothing knob pixel format", buf, 2u);
            }
            v21 = -22950;
            goto LABEL_69;
          }
          -[ADStereoV2ExecutorParameters temporalSmoothingCurrentFeaturesRatioMin](v8->_executorParameters, "temporalSmoothingCurrentFeaturesRatioMin");
          *(_DWORD *)-[ADEspressoBufferHandle data](v8->_temporalSmoothingCurrentFeaturesRatioMinBuffer, "data") = v31;
          -[ADStereoV2ExecutorParameters temporalSmoothingPreviousFeaturesRatioMin](v8->_executorParameters, "temporalSmoothingPreviousFeaturesRatioMin");
          *(_DWORD *)-[ADEspressoBufferHandle data](v8->_temporalSmoothingPreviousFeaturesRatioMinBuffer, "data") = v32;
          objc_msgSend(v49, "stopWithUTFString:", "preprocess auxiliary color");
          kdebug_trace();
          if (!v14 || (v16 = v15 < 1, --v15, !v16))
          {
            kdebug_trace();
            objc_msgSend(v49, "startWithUTFString:", "network execution");
            v21 = -[ADEspressoRunner execute](v8->super._espressoRunner, "execute");
            if (v21)
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_69;
              *(_WORD *)buf = 0;
              v22 = MEMORY[0x24BDACB70];
              v23 = "failed executing espresso plan";
              goto LABEL_11;
            }
            objc_msgSend(v48, "logPixelBuffer:name:timestamp:", v8->_disparity, "outputDisparity", v11);
            objc_msgSend(v48, "logPixelBuffer:name:timestamp:", v8->_itmColorFeaturesOutput, "outputColorFeatures", v11);
            objc_msgSend(v48, "logPixelBuffer:name:timestamp:", v8->_itmDepthFeaturesOutput, "outputDepthFeatures", v11);
            objc_msgSend(v49, "stopWithUTFString:", "network execution");
            kdebug_trace();
            if (!v14 || (v16 = v15 < 1, --v15, !v16))
            {
              kdebug_trace();
              objc_msgSend(v49, "startWithUTFString:", "postprocess depth");
              if (!*a5)
              {
                disparity = v8->_disparity;
                PixelFormatType = (__CVBuffer *)CVPixelBufferGetPixelFormatType(disparity);
                *a5 = PixelBufferUtils::createPixelBufferWithSameSize(disparity, PixelFormatType, 1);
              }
              v21 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", v8->_disparity);
              if (v21)
              {
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  goto LABEL_69;
                *(_WORD *)buf = 0;
                v22 = MEMORY[0x24BDACB70];
                v23 = "failed converting disparity";
                goto LABEL_11;
              }
              objc_msgSend(v48, "logPixelBuffer:name:timestamp:", *a5, "outputDisparityConvertedUnits", v11);
              objc_msgSend(v49, "stopWithUTFString:", "postprocess depth");
              kdebug_trace();
              if (v15 >= 1 || !v14)
              {
                kdebug_trace();
                objc_msgSend(v49, "startWithUTFString:", "postprocess previous depth");
                if (-[ADStereoV2ExecutorParameters temporalConsistencyActive](v8->_executorParameters, "temporalConsistencyActive"))
                {
                  if (v8->_itmPrevDepthFeatures)
                  {
                    espressoRunner = v8->super._espressoRunner;
                    -[ADStereoV2Pipeline inferenceDescriptor](v8->_pipeline, "inferenceDescriptor");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "prevDepthFeaturesInput");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ADStereoV2Pipeline inferenceDescriptor](v8->_pipeline, "inferenceDescriptor");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "depthFeaturesOutput");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = -[ADEspressoRunner updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:](espressoRunner, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", &v8->_itmPrevDepthFeatures, v38, &v8->_itmDepthFeaturesOutput, v40);

                    if (v21)
                    {
                      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        goto LABEL_69;
                      *(_WORD *)buf = 0;
                      v22 = MEMORY[0x24BDACB70];
                      v23 = "failed updating previous depth features";
                      goto LABEL_11;
                    }
                  }
                  if (*p_itmPrevColorFeatures)
                  {
                    v41 = v8->super._espressoRunner;
                    -[ADStereoV2Pipeline inferenceDescriptor](v8->_pipeline, "inferenceDescriptor");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "prevColorFeaturesInput");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ADStereoV2Pipeline inferenceDescriptor](v8->_pipeline, "inferenceDescriptor");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "colorFeaturesOutput");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = -[ADEspressoRunner updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:](v41, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", p_itmPrevColorFeatures, v43, &v8->_itmColorFeaturesOutput, v45);

                    if (v21)
                    {
                      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        goto LABEL_69;
                      *(_WORD *)buf = 0;
                      v22 = MEMORY[0x24BDACB70];
                      v23 = "failed updating previous color features";
                      goto LABEL_11;
                    }
                  }
                }
                objc_msgSend(v49, "stopWithUTFString:", "postprocess previous depth");
                kdebug_trace();
                -[ADExecutor frameExecutionEnd](v8, "frameExecutionEnd");
              }
            }
          }
        }
      }
      v21 = 0;
      goto LABEL_69;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v51 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide an output pointer to CVPixelBufferRef", v51, 2u);
    }
    v21 = -22953;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v51 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "executor could not be initialized", v51, 2u);
    }
    v21 = -22960;
  }
LABEL_70:
  objc_sync_exit(v8);

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  -[ADStereoV2Executor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  CVPixelBufferRelease(self->_itmCroppedScaledRefColor);
  CVPixelBufferRelease(self->_itmRotatedRefColor);
  CVPixelBufferRelease(self->_itmChunkyRefColor);
  CVPixelBufferRelease(self->_itmCroppedScaledAuxColor);
  CVPixelBufferRelease(self->_itmRotatedAuxColor);
  CVPixelBufferRelease(self->_itmChunkyAuxColor);
  v3.receiver = self;
  v3.super_class = (Class)ADStereoV2Executor;
  -[ADExecutor dealloc](&v3, sel_dealloc);
}

- (id)getIntermediates
{
  void *v3;
  _BOOL4 v4;
  int *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  int *v9;
  uint64_t v10;
  void *v11;
  __CVBuffer *itmPrevColorFeatures;
  void *v13;
  __CVBuffer *itmPrevDepthFeatures;
  void *v15;
  __CVBuffer *itmColorFeaturesOutput;
  void *v17;
  __CVBuffer *itmDepthFeaturesOutput;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = -[ADStereoV2Pipeline shouldPreProcessColorInputs](self->_pipeline, "shouldPreProcessColorInputs");
  v5 = &OBJC_IVAR___ADStereoV2Executor__refColor;
  if (v4)
    v5 = &OBJC_IVAR___ADStereoV2Executor__itmChunkyRefColor;
  v6 = *(uint64_t *)((char *)&self->super.super.isa + *v5);
  if (v6)
  {
    v31[0] = CFSTR("name");
    v31[1] = CFSTR("image");
    v32[0] = CFSTR("PreProcessed Reference");
    v32[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = -[ADStereoV2Pipeline shouldPreProcessColorInputs](self->_pipeline, "shouldPreProcessColorInputs");
  v9 = &OBJC_IVAR___ADStereoV2Executor__auxColor;
  if (v8)
    v9 = &OBJC_IVAR___ADStereoV2Executor__itmChunkyAuxColor;
  v10 = *(uint64_t *)((char *)&self->super.super.isa + *v9);
  if (v10)
  {
    v29[0] = CFSTR("name");
    v29[1] = CFSTR("image");
    v30[0] = CFSTR("PreProcessed Auxerence");
    v30[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  itmPrevColorFeatures = self->_itmPrevColorFeatures;
  if (itmPrevColorFeatures)
  {
    v27[0] = CFSTR("name");
    v27[1] = CFSTR("image");
    v28[0] = CFSTR("Previous Color Features");
    v28[1] = itmPrevColorFeatures;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  itmPrevDepthFeatures = self->_itmPrevDepthFeatures;
  if (itmPrevDepthFeatures)
  {
    v25[0] = CFSTR("name");
    v25[1] = CFSTR("image");
    v26[0] = CFSTR("Previous Depth Features");
    v26[1] = itmPrevDepthFeatures;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  itmColorFeaturesOutput = self->_itmColorFeaturesOutput;
  if (itmColorFeaturesOutput)
  {
    v23[0] = CFSTR("name");
    v23[1] = CFSTR("image");
    v24[0] = CFSTR("Output Color Features");
    v24[1] = itmColorFeaturesOutput;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  itmDepthFeaturesOutput = self->_itmDepthFeaturesOutput;
  if (itmDepthFeaturesOutput)
  {
    v21[0] = CFSTR("name");
    v21[1] = CFSTR("image");
    v22[0] = CFSTR("Output Depth Features");
    v22[1] = itmDepthFeaturesOutput;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  return v3;
}

- (int64_t)numberOfExecutionSteps
{
  return 5;
}

- (ADStereoV2ExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_temporalSmoothingPreviousFeaturesRatioMinBuffer, 0);
  objc_storeStrong((id *)&self->_temporalSmoothingCurrentFeaturesRatioMinBuffer, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
