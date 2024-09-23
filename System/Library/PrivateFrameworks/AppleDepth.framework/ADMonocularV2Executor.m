@implementation ADMonocularV2Executor

- (ADMonocularV2Executor)initWithInputPrioritization:(int64_t)a3
{
  return -[ADMonocularV2Executor initWithInputPrioritization:parameters:](self, "initWithInputPrioritization:parameters:", a3, 0);
}

- (ADMonocularV2Executor)initWithInputPrioritization:(int64_t)a3 parameters:(id)a4
{
  id v6;
  ADMonocularV2Executor *v7;
  ADMonocularV2Pipeline *v8;
  void *v9;
  uint64_t v10;
  ADMonocularV2Pipeline *pipeline;
  ADMonocularV2Executor *v12;
  objc_super v14;
  int v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a4;
  v15 = 335686448;
  v16 = a3;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  kdebug_trace();
  v14.receiver = self;
  v14.super_class = (Class)ADMonocularV2Executor;
  v7 = -[ADExecutor init](&v14, sel_init);
  if (v7)
  {
    v8 = [ADMonocularV2Pipeline alloc];
    objc_msgSend(v6, "pipelineParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ADMonocularV2Pipeline initWithInputPrioritization:andParameters:](v8, "initWithInputPrioritization:andParameters:", a3, v9);
    pipeline = v7->_pipeline;
    v7->_pipeline = (ADMonocularV2Pipeline *)v10;

    if (!v7->_pipeline
      || !v6
      && (v6 = -[ADMonocularV2ExecutorParameters initForPipeline:]([ADMonocularV2ExecutorParameters alloc], "initForPipeline:", v7->_pipeline)) == 0)
    {
      v12 = 0;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v7->_executorParameters, v6);
    v7->_itmPreProcessedColor = 0;
    v7->_itmUnprocessedOutputDisparity = 0;
    v7->_itmCroppedScaledColor = 0;
    v7->_itmRotatedColor = 0;
    v7->_itmPrevDisparity = 0;
    v7->_isPrepared = 0;
  }
  v12 = v7;
LABEL_8:
  kdebug_trace();

  return v12;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmUnprocessedOutputDisparity);
  self->_itmUnprocessedOutputDisparity = 0;
  CVPixelBufferRelease(self->_itmPrevDisparity);
  self->_itmPrevDisparity = 0;
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

  -[ADMonocularV2Executor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  espressoRunner = self->super._espressoRunner;
  -[ADMonocularV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](espressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  v6 = self->super._espressoRunner;
  -[ADMonocularV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disparityOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmUnprocessedOutputDisparity = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v6, "createAndRegisterPixelBufferForDescriptor:", v8);

  v9 = self->super._espressoRunner;
  -[ADMonocularV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prevDisparityInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPrevDisparity = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v9, "createAndRegisterPixelBufferForDescriptor:", v11);

  if (self->_itmPreProcessedColor && self->_itmUnprocessedOutputDisparity && self->_itmPrevDisparity)
    return 0;
  -[ADMonocularV2Executor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  return -22971;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 inputColorROI:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  ADMonocularV2Executor *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *BaseAddress;
  size_t DataSize;
  uint8_t v17[8];
  int v18;
  __int128 v19;
  __int128 v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = self;
  objc_sync_enter(v9);
  v18 = 335685116;
  v19 = 0u;
  v20 = 0u;
  kdebug_trace();
  v10 = -[ADMonocularV2Pipeline adjustForEngine:](v9->_pipeline, "adjustForEngine:", a3);
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to adjust for engine", v17, 2u);
    }
  }
  else
  {
    -[ADMonocularV2Pipeline inferenceDescriptor](v9->_pipeline, "inferenceDescriptor");
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
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to prepare engine", v17, 2u);
      }
    }
    else
    {
      v10 = -[ADMonocularV2Executor allocateIntermediateBuffers](v9, "allocateIntermediateBuffers");
      CVPixelBufferLockBaseAddress(v9->_itmPrevDisparity, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(v9->_itmPrevDisparity);
      DataSize = CVPixelBufferGetDataSize(v9->_itmPrevDisparity);
      bzero(BaseAddress, DataSize);
      CVPixelBufferUnlockBaseAddress(v9->_itmPrevDisparity, 0);
      v9->_isPrepared = v10 == 0;
    }

  }
  kdebug_trace();
  objc_sync_exit(v9);

  return v10;
}

- (__CVBuffer)prevDisparity
{
  return self->_itmPrevDisparity;
}

- (int64_t)executeWithColor:(__CVBuffer *)a3 outDisparity:(__CVBuffer *)a4
{
  ADMonocularV2Executor *v6;
  size_t Width;
  size_t Height;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  int64_t v19;
  NSObject *v20;
  const char *v21;
  PixelBufferUtils **p_itmUnprocessedOutputDisparity;
  ADEspressoRunner *espressoRunner;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint8_t v30[16];
  uint8_t buf[8];
  __int128 v32;
  __int128 v33;

  v6 = self;
  objc_sync_enter(v6);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (!v6->_isPrepared)
  {
    v19 = -[ADMonocularV2Executor prepareForEngineType:inputColorROI:](v6, "prepareForEngineType:inputColorROI:", v6->super._engineType, 0.0, 0.0, (double)Width, (double)Height);
    if (v19)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to prepare engine", buf, 2u);
      }
      goto LABEL_41;
    }
  }
  if (v6->super._espressoRunner)
  {
    if (a4)
    {
      -[ADExecutorParameters logger](v6->_executorParameters, "logger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "systemUptime");
      v12 = v11;

      *(_DWORD *)buf = 335683588;
      v32 = 0u;
      v33 = 0u;
      kdebug_trace();
      objc_msgSend(v9, "logPixelBuffer:name:timestamp:", a3, "inputColor", v12);
      v13 = -[ADMonocularV2Executor numberOfExecutionSteps](v6, "numberOfExecutionSteps");
      v14 = -[ADExecutorParameters stepsToSkip](v6->_executorParameters, "stepsToSkip");
      v15 = -[ADExecutorParameters powerMeasureMode](v6->_executorParameters, "powerMeasureMode");
      -[ADExecutorParameters timeProfiler](v6->_executorParameters, "timeProfiler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13 - v14;
      if (!v15 || (v18 = v17 < 1, --v17, !v18))
      {
        kdebug_trace();
        objc_msgSend(v16, "startWithUTFString:", "preprocess color");
        -[ADExecutor frameExecutionStart](v6, "frameExecutionStart");
        v19 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v6->super._rotationConstant), v6->_itmPreProcessedColor, &v6->_itmCroppedScaledColor, &v6->_itmRotatedColor, 1, v6->super._inputRoi.origin.x, v6->super._inputRoi.origin.y, v6->super._inputRoi.size.width, v6->super._inputRoi.size.height);
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v30 = 0;
            v20 = MEMORY[0x24BDACB70];
            v21 = "failed scaling color image";
LABEL_30:
            _os_log_error_impl(&dword_20B62B000, v20, OS_LOG_TYPE_ERROR, v21, v30, 2u);
            goto LABEL_40;
          }
          goto LABEL_40;
        }
        objc_msgSend(v9, "logPixelBuffer:name:timestamp:", v6->_itmPreProcessedColor, "preProcessedColor", v12);
        objc_msgSend(v9, "logPixelBuffer:name:timestamp:", v6->_itmPrevDisparity, "prevDisparity", v12);
        objc_msgSend(v16, "stopWithUTFString:", "preprocess color");
        kdebug_trace();
        if (!v15 || (v18 = v17 < 1, --v17, !v18))
        {
          kdebug_trace();
          objc_msgSend(v16, "startWithUTFString:", "network execution");
          v19 = -[ADEspressoRunner execute](v6->super._espressoRunner, "execute");
          if (v19)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v30 = 0;
              v20 = MEMORY[0x24BDACB70];
              v21 = "failed executing espresso plan";
              goto LABEL_30;
            }
LABEL_40:

            kdebug_trace();
            goto LABEL_41;
          }
          p_itmUnprocessedOutputDisparity = &v6->_itmUnprocessedOutputDisparity;
          objc_msgSend(v9, "logPixelBuffer:name:timestamp:", v6->_itmUnprocessedOutputDisparity, "outputDisparity", v12);
          objc_msgSend(v16, "stopWithUTFString:", "network execution");
          kdebug_trace();
          if (!v15 || (v18 = v17 < 1, --v17, !v18))
          {
            kdebug_trace();
            objc_msgSend(v16, "startWithUTFString:", "postprocess depth");
            if (!*a4)
              *a4 = PixelBufferUtils::createPixelBufferWithSameSize(*p_itmUnprocessedOutputDisparity, (__CVBuffer *)0x66646973, 1);
            v19 = -[ADMonocularV2Pipeline postProcessDisparity:output:](v6->_pipeline, "postProcessDisparity:output:", *p_itmUnprocessedOutputDisparity);
            if (v19)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v30 = 0;
                v20 = MEMORY[0x24BDACB70];
                v21 = "failed post-processing disparity";
                goto LABEL_30;
              }
              goto LABEL_40;
            }
            objc_msgSend(v9, "logPixelBuffer:name:timestamp:", *a4, "outputConvertedUnits", v12);
            objc_msgSend(v16, "stopWithUTFString:", "postprocess depth");
            kdebug_trace();
            if (v17 >= 1 || !v15)
            {
              kdebug_trace();
              objc_msgSend(v16, "startWithUTFString:", "postprocess previous depth");
              espressoRunner = v6->super._espressoRunner;
              -[ADMonocularV2Pipeline inferenceDescriptor](v6->_pipeline, "inferenceDescriptor");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "prevDisparityInput");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[ADMonocularV2Pipeline inferenceDescriptor](v6->_pipeline, "inferenceDescriptor");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "disparityOutput");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = -[ADEspressoRunner updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:](espressoRunner, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", &v6->_itmPrevDisparity, v25, &v6->_itmUnprocessedOutputDisparity, v27);

              if (v19)
              {
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  goto LABEL_40;
                *(_WORD *)v30 = 0;
                v20 = MEMORY[0x24BDACB70];
                v21 = "failed updating previous disparity";
                goto LABEL_30;
              }
              objc_msgSend(v16, "stopWithUTFString:", "postprocess previous depth");
              kdebug_trace();
              -[ADExecutor frameExecutionEnd](v6, "frameExecutionEnd");
            }
          }
        }
      }
      v19 = 0;
      goto LABEL_40;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide an output pointer to CVPixelBufferRef", buf, 2u);
    }
    v19 = -22953;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "executor could not be initialized", buf, 2u);
    }
    v19 = -22960;
  }
LABEL_41:
  objc_sync_exit(v6);

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[ADMonocularV2Executor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  CVPixelBufferRelease(self->_itmCroppedScaledColor);
  CVPixelBufferRelease(self->_itmRotatedColor);
  v3.receiver = self;
  v3.super_class = (Class)ADMonocularV2Executor;
  -[ADExecutor dealloc](&v3, sel_dealloc);
}

- (id)getIntermediates
{
  void *v3;
  __CVBuffer *itmPreProcessedColor;
  void *v5;
  __CVBuffer *itmUnprocessedOutputDisparity;
  void *v7;
  __CVBuffer *itmCroppedScaledColor;
  void *v9;
  __CVBuffer *itmRotatedColor;
  void *v11;
  __CVBuffer *itmPrevDisparity;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v23[0] = CFSTR("name");
    v23[1] = CFSTR("image");
    v24[0] = CFSTR("PreProcessed Color");
    v24[1] = itmPreProcessedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  itmUnprocessedOutputDisparity = self->_itmUnprocessedOutputDisparity;
  if (itmUnprocessedOutputDisparity)
  {
    v21[0] = CFSTR("name");
    v21[1] = CFSTR("image");
    v22[0] = CFSTR("Unprocessed OutputDisparity");
    v22[1] = itmUnprocessedOutputDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
  {
    v19[0] = CFSTR("name");
    v19[1] = CFSTR("image");
    v20[0] = CFSTR("Cropped ScaledColor");
    v20[1] = itmCroppedScaledColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
  {
    v17[0] = CFSTR("name");
    v17[1] = CFSTR("image");
    v18[0] = CFSTR("Rotated Color");
    v18[1] = itmRotatedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  itmPrevDisparity = self->_itmPrevDisparity;
  if (itmPrevDisparity)
  {
    v15[0] = CFSTR("name");
    v15[1] = CFSTR("image");
    v16[0] = CFSTR("Previous Disparity");
    v16[1] = itmPrevDisparity;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  return v3;
}

- (int64_t)numberOfExecutionSteps
{
  return 4;
}

- (ADMonocularV2ExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
