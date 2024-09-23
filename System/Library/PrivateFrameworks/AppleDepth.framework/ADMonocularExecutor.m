@implementation ADMonocularExecutor

- (ADMonocularExecutor)initWithInputPrioritization:(int64_t)a3
{
  ADMonocularExecutor *v5;
  ADMonocularPipeline *v6;
  ADMonocularPipeline *pipeline;
  ADMonocularExecutorParameters *v8;
  ADMonocularExecutorParameters *executorParameters;
  ADMonocularExecutor *v10;
  objc_super v12;
  int v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v13 = 335685792;
  v14 = a3;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  v12.receiver = self;
  v12.super_class = (Class)ADMonocularExecutor;
  v5 = -[ADExecutor init](&v12, sel_init);
  if (v5)
  {
    v6 = -[ADMonocularPipeline initWithInputPrioritization:]([ADMonocularPipeline alloc], "initWithInputPrioritization:", a3);
    pipeline = v5->_pipeline;
    v5->_pipeline = v6;

    if (!v5->_pipeline)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v8 = -[ADMonocularExecutorParameters initForPipeline:]([ADMonocularExecutorParameters alloc], "initForPipeline:", v5->_pipeline);
    executorParameters = v5->_executorParameters;
    v5->_executorParameters = v8;

    v5->_itmCroppedScaledColor = 0;
    v5->_itmRotatedColor = 0;
    v5->_itmPreProcessedColor = 0;
    v5->_itmUnprocessedDepth = 0;
    v5->_itmPostProcessedDepth = 0;
  }
  v10 = v5;
LABEL_6:
  kdebug_trace();

  return v10;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
}

- (int64_t)allocateIntermediateBuffers
{
  ADEspressoRunner *espressoRunner;
  void *v4;
  void *v5;
  ADEspressoRunner *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  int64_t v14;

  -[ADMonocularExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  espressoRunner = self->super._espressoRunner;
  -[ADMonocularPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](espressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  v6 = self->super._espressoRunner;
  -[ADMonocularPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "depthOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmUnprocessedDepth = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v6, "createAndRegisterPixelBufferForDescriptor:", v8);

  if (self->_itmPreProcessedColor && self->_itmUnprocessedDepth)
  {
    -[ADMonocularPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "depthOutput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "sizeForLayout:", self->super._layout);
    +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v11, "pixelFormat"), &self->_itmPostProcessedDepth, v12, v13);
    if (self->_itmPostProcessedDepth)
    {
      v14 = 0;
    }
    else
    {
      -[ADMonocularExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
      v14 = -22965;
    }

  }
  else
  {
    -[ADMonocularExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
    return -22971;
  }
  return v14;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5
{
  return -[ADMonocularExecutor prepareForEngineType:roi:exifOrientation:rotationPreference:](self, "prepareForEngineType:roi:exifOrientation:rotationPreference:", a3, *(_QWORD *)&a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 rotationPreference:(unint64_t)a6
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  ADMonocularExecutor *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;

  v7 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = self;
  objc_sync_enter(v13);
  kdebug_trace();
  -[ADMonocularPipeline inferenceDescriptor](v13->_pipeline, "inferenceDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorInput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v13, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v16, v7, a6, v14, x, y, width, height);

  if (!v17)
    v17 = -[ADMonocularExecutor allocateIntermediateBuffers](v13, "allocateIntermediateBuffers");

  kdebug_trace();
  objc_sync_exit(v13);

  return v17;
}

- (int64_t)executeWithColor:(__CVBuffer *)a3 outDepthMap:(__CVBuffer *)a4
{
  ADMonocularExecutor *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  int64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t rotationConstant;
  __CVBuffer *v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  OSType v29;
  uint8_t v31[16];
  uint8_t buf[8];
  __int128 v33;
  __int128 v34;
  CGSize v35;

  v6 = self;
  objc_sync_enter(v6);
  if (v6->super._espressoRunner)
  {
    if (a4)
    {
      -[ADExecutorParameters logger](v6->_executorParameters, "logger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "systemUptime");
      v10 = v9;

      *(_DWORD *)buf = 335683096;
      v33 = 0u;
      v34 = 0u;
      kdebug_trace();
      objc_msgSend(v7, "logPixelBuffer:name:timestamp:", a3, "inputColor", v10);
      v11 = -[ADMonocularExecutor numberOfExecutionSteps](v6, "numberOfExecutionSteps");
      v12 = -[ADExecutorParameters stepsToSkip](v6->_executorParameters, "stepsToSkip");
      v13 = -[ADExecutorParameters powerMeasureMode](v6->_executorParameters, "powerMeasureMode");
      -[ADExecutorParameters timeProfiler](v6->_executorParameters, "timeProfiler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v11 - v12;
      if (!v13 || (v16 = v15 < 1, --v15, !v16))
      {
        kdebug_trace();
        objc_msgSend(v14, "startWithUTFString:", "preprocess color");
        -[ADExecutor frameExecutionStart](v6, "frameExecutionStart");
        v17 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v6->super._rotationConstant), v6->_itmPreProcessedColor, &v6->_itmCroppedScaledColor, &v6->_itmRotatedColor, 0, v6->super._inputRoi.origin.x, v6->super._inputRoi.origin.y, v6->super._inputRoi.size.width, v6->super._inputRoi.size.height);
        if (v17)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v31 = 0;
            v18 = MEMORY[0x24BDACB70];
            v19 = "failed scaling color image";
LABEL_24:
            _os_log_error_impl(&dword_20B62B000, v18, OS_LOG_TYPE_ERROR, v19, v31, 2u);
            goto LABEL_44;
          }
          goto LABEL_44;
        }
        objc_msgSend(v7, "logPixelBuffer:name:timestamp:", v6->_itmPreProcessedColor, "processedColor", v10);
        objc_msgSend(v14, "stopWithUTFString:", "preprocess color");
        kdebug_trace();
        if (!v13 || (v16 = v15 < 1, --v15, !v16))
        {
          kdebug_trace();
          objc_msgSend(v14, "startWithUTFString:", "network execution");
          v17 = -[ADEspressoRunner execute](v6->super._espressoRunner, "execute");
          if (v17)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v31 = 0;
              v18 = MEMORY[0x24BDACB70];
              v19 = "failed executing espresso plan";
              goto LABEL_24;
            }
LABEL_44:

            kdebug_trace();
            goto LABEL_45;
          }
          objc_msgSend(v7, "logPixelBuffer:name:timestamp:", v6->_itmUnprocessedDepth, "depthOut", v10);
          objc_msgSend(v14, "stopWithUTFString:", "network execution");
          kdebug_trace();
          if (!v13 || (v16 = v15 < 1, --v15, !v16))
          {
            kdebug_trace();
            objc_msgSend(v14, "startWithUTFString:", "postprocess depth");
            v17 = -[ADMonocularPipeline postProcessWithDepth:depthOutput:](v6->_pipeline, "postProcessWithDepth:depthOutput:", v6->_itmUnprocessedDepth, v6->_itmPostProcessedDepth);
            if (v17)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v31 = 0;
                v18 = MEMORY[0x24BDACB70];
                v19 = "failed post processing network output";
                goto LABEL_24;
              }
              goto LABEL_44;
            }
            objc_msgSend(v7, "logPixelBuffer:name:timestamp:", v6->_itmPostProcessedDepth, "depthOutProcessed", v10);
            objc_msgSend(v14, "stopWithUTFString:", "postprocess depth");
            kdebug_trace();
            if (v15 >= 1 || !v13)
            {
              kdebug_trace();
              objc_msgSend(v14, "startWithUTFString:", "output rotation");
              rotationConstant = v6->super._rotationConstant;
              if (rotationConstant == 3)
              {
                rotationConstant = 1;
              }
              else if (rotationConstant == 1)
              {
                rotationConstant = 3;
              }
              v22 = *a4;
              if (!*a4)
              {
                -[ADMonocularPipeline processedDepthOutputDescriptor](v6->_pipeline, "processedDepthOutputDescriptor");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "sizeForLayout:", v6->super._layout);
                v26 = v24;
                if ((rotationConstant | 2) == 3)
                {
                  v27 = v25;
                }
                else
                {
                  v27 = v24;
                  v26 = v25;
                }

                -[ADMonocularPipeline processedDepthOutputDescriptor](v6->_pipeline, "processedDepthOutputDescriptor");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "pixelFormat");
                v35.width = v27;
                v35.height = v26;
                *a4 = PixelBufferUtils::createPixelBuffer(v29, v35, 1);

                v22 = *a4;
              }
              if (PixelBufferUtils::rotatePixelBuffer(v6->_itmPostProcessedDepth, v22, (__CVBuffer *)rotationConstant, 0))
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v31 = 0;
                  _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed rotating depth. please verify output buffer dimensions", v31, 2u);
                }
                v17 = -22950;
                goto LABEL_44;
              }
              -[ADExecutor convertIntrinsicsFrom:cropBy:to:](v6, "convertIntrinsicsFrom:cropBy:to:", a3, *a4, v6->super._inputRoi.origin.x, v6->super._inputRoi.origin.y, v6->super._inputRoi.size.width, v6->super._inputRoi.size.height);
              objc_msgSend(v7, "logPixelBuffer:name:priority:timestamp:", *a4, "depthOutProcessedRotated", 0, v10);
              objc_msgSend(v14, "stopWithUTFString:", "output rotation");
              kdebug_trace();
              -[ADExecutor frameExecutionEnd](v6, "frameExecutionEnd");
            }
          }
        }
      }
      v17 = 0;
      goto LABEL_44;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide a pointer to CVPixelBufferRef", buf, 2u);
    }
    v17 = -22953;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must call prepare before execution", buf, 2u);
    }
    v17 = -22960;
  }
LABEL_45:
  objc_sync_exit(v6);

  return v17;
}

- (void)dealloc
{
  __CVBuffer *itmCroppedScaledColor;
  __CVBuffer *itmRotatedColor;
  __CVBuffer *itmPreProcessedColor;
  __CVBuffer *itmUnprocessedDepth;
  __CVBuffer *itmPostProcessedDepth;
  objc_super v8;

  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
    CVPixelBufferRelease(itmCroppedScaledColor);
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
    CVPixelBufferRelease(itmRotatedColor);
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
    CVPixelBufferRelease(itmPreProcessedColor);
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
    CVPixelBufferRelease(itmUnprocessedDepth);
  itmPostProcessedDepth = self->_itmPostProcessedDepth;
  if (itmPostProcessedDepth)
    CVPixelBufferRelease(itmPostProcessedDepth);
  v8.receiver = self;
  v8.super_class = (Class)ADMonocularExecutor;
  -[ADExecutor dealloc](&v8, sel_dealloc);
}

- (id)getIntermediates
{
  void *v3;
  __CVBuffer *itmCroppedScaledColor;
  void *v5;
  __CVBuffer *itmRotatedColor;
  void *v7;
  __CVBuffer *itmPreProcessedColor;
  void *v9;
  __CVBuffer *itmUnprocessedDepth;
  void *v11;
  __CVBuffer *itmPostProcessedDepth;
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
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
  {
    v23[0] = CFSTR("name");
    v23[1] = CFSTR("image");
    v24[0] = CFSTR("CroppedScaledColor");
    v24[1] = itmCroppedScaledColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
  {
    v21[0] = CFSTR("name");
    v21[1] = CFSTR("image");
    v22[0] = CFSTR("RotatedColor");
    v22[1] = itmRotatedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v19[0] = CFSTR("name");
    v19[1] = CFSTR("image");
    v20[0] = CFSTR("PreProcessedColor");
    v20[1] = itmPreProcessedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
  {
    v17[0] = CFSTR("name");
    v17[1] = CFSTR("image");
    v18[0] = CFSTR("UnprocessedDepth");
    v18[1] = itmUnprocessedDepth;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  itmPostProcessedDepth = self->_itmPostProcessedDepth;
  if (itmPostProcessedDepth)
  {
    v15[0] = CFSTR("name");
    v15[1] = CFSTR("image");
    v16[0] = CFSTR("PostProcessedDepth");
    v16[1] = itmPostProcessedDepth;
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

- (ADMonocularExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_storeStrong((id *)&self->_executorParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
