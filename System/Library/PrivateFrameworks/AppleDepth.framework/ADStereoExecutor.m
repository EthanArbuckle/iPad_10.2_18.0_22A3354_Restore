@implementation ADStereoExecutor

- (ADStereoExecutor)initWithInputAlignment:(unint64_t)a3 andPrioritization:(int64_t)a4
{
  return -[ADStereoExecutor initWithInputAlignment:prioritization:andParameters:](self, "initWithInputAlignment:prioritization:andParameters:", a3, a4, 0);
}

- (ADStereoExecutor)initWithInputAlignment:(unint64_t)a3 prioritization:(int64_t)a4 andParameters:(id)a5
{
  id v8;
  ADStereoExecutor *v9;
  ADStereoPipeline *v10;
  void *v11;
  uint64_t v12;
  ADStereoPipeline *pipeline;
  ADStereoExecutorParameters *v14;
  ADStereoExecutorParameters *executorParameters;
  ADStereoExecutor *v16;
  objc_super v18;
  int v19;
  __int128 v20;
  __int128 v21;

  v8 = a5;
  v19 = 335681024;
  v20 = 0u;
  v21 = 0u;
  kdebug_trace();
  v18.receiver = self;
  v18.super_class = (Class)ADStereoExecutor;
  v9 = -[ADExecutor init](&v18, sel_init);
  if (v9)
  {
    v10 = [ADStereoPipeline alloc];
    objc_msgSend(v8, "pipelineParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ADStereoPipeline initWithInputAlignment:prioritization:andParameters:](v10, "initWithInputAlignment:prioritization:andParameters:", a3, a4, v11);
    pipeline = v9->_pipeline;
    v9->_pipeline = (ADStereoPipeline *)v12;

    if (!v9->_pipeline
      || !v9->_executorParameters
      && (v14 = -[ADStereoExecutorParameters initForPipeline:]([ADStereoExecutorParameters alloc], "initForPipeline:", v9->_pipeline), executorParameters = v9->_executorParameters, v9->_executorParameters = v14, executorParameters, !v9->_executorParameters))
    {
      v16 = 0;
      goto LABEL_8;
    }
    v9->_refColor = 0;
    v9->_itmCroppedScaledRefColor = 0;
    v9->_itmRotatedRefColor = 0;
    v9->_itmChunkyRefColor = 0;
    v9->_auxColor = 0;
    v9->_itmCroppedScaledAuxColor = 0;
    v9->_itmRotatedAuxColor = 0;
    v9->_itmChunkyAuxColor = 0;
    v9->_disparity = 0;
    v9->_isPrepared = 0;
  }
  v16 = v9;
LABEL_8:
  kdebug_trace();

  return v16;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_refColor);
  self->_refColor = 0;
  CVPixelBufferRelease(self->_auxColor);
  self->_auxColor = 0;
  CVPixelBufferRelease(self->_disparity);
  self->_disparity = 0;
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
  __CVBuffer *v12;
  __CVBuffer *refColor;
  __CVBuffer *v14;
  __CVBuffer *PixelBufferCopy;
  int64_t result;

  -[ADStereoExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  espressoRunner = self->super._espressoRunner;
  -[ADStereoPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_refColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](espressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  v6 = self->super._espressoRunner;
  -[ADStereoPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "auxiliaryInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_auxColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v6, "createAndRegisterPixelBufferForDescriptor:", v8);

  v9 = self->super._espressoRunner;
  -[ADStereoPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disparityOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_disparity = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v9, "createAndRegisterPixelBufferForDescriptor:", v11);

  refColor = self->_refColor;
  if (refColor && self->_auxColor && self->_disparity)
  {
    self->_itmChunkyRefColor = PixelBufferUtils::createPixelBufferCopy(refColor, v12);
    PixelBufferCopy = PixelBufferUtils::createPixelBufferCopy(self->_auxColor, v14);
    result = 0;
    self->_itmChunkyAuxColor = PixelBufferCopy;
  }
  else
  {
    -[ADStereoExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
    return -22971;
  }
  return result;
}

- (int64_t)prepareForEngineType:(unint64_t)a3
{
  ADStereoExecutor *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double x;
  double y;
  double width;
  double height;
  void *v23;
  void *v24;

  v4 = self;
  objc_sync_enter(v4);
  kdebug_trace();
  v5 = -[ADStereoPipeline adjustForEngine:](v4->_pipeline, "adjustForEngine:", a3);
  if (!v5)
  {
    -[ADStereoPipeline inferenceDescriptor](v4->_pipeline, "inferenceDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "referenceInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeForLayout:", 255);
    v10 = v9;
    v12 = v11;

    v4->_refColorROI.origin.x = 0.0;
    v4->_refColorROI.origin.y = 0.0;
    v4->_refColorROI.size.width = v10;
    v4->_refColorROI.size.height = v12;
    objc_msgSend(v6, "auxiliaryInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeForLayout:", 255);
    v16 = v15;
    v18 = v17;

    v4->_auxColorROI.origin.x = 0.0;
    v4->_auxColorROI.origin.y = 0.0;
    v4->_auxColorROI.size.width = v16;
    v4->_auxColorROI.size.height = v18;
    x = v4->_refColorROI.origin.x;
    y = v4->_refColorROI.origin.y;
    width = v4->_refColorROI.size.width;
    height = v4->_refColorROI.size.height;
    objc_msgSend(v6, "referenceInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageDescriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v4, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v24, 1, 2, v6, x, y, width, height);

    if (!v5)
    {
      v5 = -[ADStereoExecutor allocateIntermediateBuffers](v4, "allocateIntermediateBuffers");
      v4->_isPrepared = v5 == 0;
    }

  }
  kdebug_trace();
  objc_sync_exit(v4);

  return v5;
}

- (int64_t)prepareWithBestEngine
{
  if (self->_isPrepared || !-[ADStereoExecutor prepareForEngineType:](self, "prepareForEngineType:", 4))
    return 0;
  else
    return -[ADStereoExecutor prepareForEngineType:](self, "prepareForEngineType:", 0);
}

- (int64_t)executeWithRefColor:(__CVBuffer *)a3 auxColor:(__CVBuffer *)a4 outDisparityMap:(__CVBuffer *)a5
{
  ADStereoExecutor *v8;
  int64_t v9;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  _BOOL4 v20;
  int *v21;
  uint64_t v22;
  double *v23;
  void *v24;
  _BOOL4 v25;
  int *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  BOOL v30;
  __CVBuffer *PixelBufferWithSameSize;
  __CVBuffer *disparity;
  __CVBuffer *PixelFormatType;
  _BOOL4 v34;
  void *v35;
  uint8_t v36[16];
  uint8_t buf[8];
  __int128 v38;
  __int128 v39;

  v8 = self;
  objc_sync_enter(v8);
  v9 = -[ADStereoExecutor prepareWithBestEngine](v8, "prepareWithBestEngine");
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to prepare engine", buf, 2u);
    }
    goto LABEL_4;
  }
  if (v8->super._espressoRunner)
  {
    if (a5)
    {
      -[ADExecutorParameters logger](v8->_executorParameters, "logger");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "systemUptime");
      v13 = v12;

      *(_DWORD *)buf = 335685944;
      v38 = 0u;
      v39 = 0u;
      kdebug_trace();
      objc_msgSend(v35, "logPixelBuffer:name:timestamp:", a3, "refColor", v13);
      objc_msgSend(v35, "logPixelBuffer:name:timestamp:", a4, "auxColor", v13);
      v14 = -[ADStereoExecutor numberOfExecutionSteps](v8, "numberOfExecutionSteps");
      v15 = -[ADExecutorParameters stepsToSkip](v8->_executorParameters, "stepsToSkip");
      v16 = -[ADExecutorParameters powerMeasureMode](v8->_executorParameters, "powerMeasureMode");
      -[ADExecutorParameters timeProfiler](v8->_executorParameters, "timeProfiler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14 - v15;
      if (v16)
      {
        v19 = v18-- < 1;
        if (v19)
        {
          v9 = 0;
          v24 = v35;
          goto LABEL_37;
        }
      }
      v34 = v16;
      kdebug_trace();
      objc_msgSend(v17, "startWithUTFString:", "preprocess color");
      -[ADExecutor frameExecutionStart](v8, "frameExecutionStart");
      v20 = -[ADStereoPipeline shouldPreProcessColorInputs](v8->_pipeline, "shouldPreProcessColorInputs");
      v21 = &OBJC_IVAR___ADStereoExecutor__refColor;
      if (v20)
        v21 = &OBJC_IVAR___ADStereoExecutor__itmChunkyRefColor;
      v22 = *(uint64_t *)((char *)&v8->super.super.isa + *v21);
      v23 = (double *)MEMORY[0x24BDBF090];
      v9 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v8->super._rotationConstant), v22, &v8->_itmCroppedScaledRefColor, &v8->_itmRotatedRefColor, 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      if (-[ADStereoPipeline shouldPreProcessColorInputs](v8->_pipeline, "shouldPreProcessColorInputs"))
        -[ADStereoPipeline preProcessColorInput:toBuffer:](v8->_pipeline, "preProcessColorInput:toBuffer:", v22, v8->_refColor);
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v36 = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed converting ref image", v36, 2u);
        }
        goto LABEL_16;
      }
      objc_msgSend(v17, "stopWithUTFString:", "preprocess color");
      kdebug_trace();
      if (v34)
      {
        v19 = v18-- < 1;
        if (v19)
        {
          v9 = 0;
LABEL_16:
          v24 = v35;
LABEL_37:

          kdebug_trace();
          goto LABEL_4;
        }
      }
      kdebug_trace();
      objc_msgSend(v17, "startWithUTFString:", "preprocess auxiliary color");
      v24 = v35;
      v25 = -[ADStereoPipeline shouldPreProcessColorInputs](v8->_pipeline, "shouldPreProcessColorInputs");
      v26 = &OBJC_IVAR___ADStereoExecutor__auxColor;
      if (v25)
        v26 = &OBJC_IVAR___ADStereoExecutor__itmChunkyAuxColor;
      v27 = *(uint64_t *)((char *)&v8->super.super.isa + *v26);
      v9 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a4, LOBYTE(v8->super._rotationConstant), v27, &v8->_itmCroppedScaledAuxColor, &v8->_itmRotatedAuxColor, 1, *v23, v23[1], v23[2], v23[3]);
      if (-[ADStereoPipeline shouldPreProcessColorInputs](v8->_pipeline, "shouldPreProcessColorInputs"))
        -[ADStereoPipeline preProcessColorInput:toBuffer:](v8->_pipeline, "preProcessColorInput:toBuffer:", v27, v8->_auxColor);
      if (v9)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_37;
        *(_WORD *)v36 = 0;
        v28 = MEMORY[0x24BDACB70];
        v29 = "failed converting aux image";
LABEL_51:
        _os_log_error_impl(&dword_20B62B000, v28, OS_LOG_TYPE_ERROR, v29, v36, 2u);
        goto LABEL_37;
      }
      objc_msgSend(v35, "logPixelBuffer:name:timestamp:", v8->_refColor, "refColorProcessed", v13);
      objc_msgSend(v35, "logPixelBuffer:name:timestamp:", v8->_auxColor, "auxColorProcessed", v13);
      objc_msgSend(v17, "stopWithUTFString:", "preprocess auxiliary color");
      kdebug_trace();
      if (!v34 || (v19 = v18 < 1, --v18, !v19))
      {
        kdebug_trace();
        objc_msgSend(v17, "startWithUTFString:", "network execution");
        v9 = -[ADEspressoRunner execute](v8->super._espressoRunner, "execute");
        if (v9)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_37;
          *(_WORD *)v36 = 0;
          v28 = MEMORY[0x24BDACB70];
          v29 = "failed executing espresso plan";
          goto LABEL_51;
        }
        objc_msgSend(v35, "logPixelBuffer:name:timestamp:", v8->_disparity, "disparityOut", v13);
        objc_msgSend(v17, "stopWithUTFString:", "network execution");
        kdebug_trace();
        v30 = v34;
        if (v18 >= 1)
          v30 = 0;
        if (!v30)
        {
          kdebug_trace();
          objc_msgSend(v17, "startWithUTFString:", "postprocess depth");
          PixelBufferWithSameSize = *a5;
          if (!*a5)
          {
            disparity = v8->_disparity;
            PixelFormatType = (__CVBuffer *)CVPixelBufferGetPixelFormatType(disparity);
            PixelBufferWithSameSize = PixelBufferUtils::createPixelBufferWithSameSize(disparity, PixelFormatType, 1);
            *a5 = PixelBufferWithSameSize;
          }
          if (PixelBufferUtils::copyPixelBuffer(PixelBufferWithSameSize, v8->_disparity, 0))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v36 = 0;
              _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed copying disparity to output buffer. please verify buffer dimensions", v36, 2u);
            }
            v9 = -22950;
          }
          else
          {
            objc_msgSend(v35, "logPixelBuffer:name:timestamp:", *a5, "disparityOutProcessed", v13);
            objc_msgSend(v17, "stopWithUTFString:", "postprocess depth");
            kdebug_trace();
            -[ADExecutor frameExecutionEnd](v8, "frameExecutionEnd");
            v9 = 0;
          }
          goto LABEL_37;
        }
      }
      v9 = 0;
      goto LABEL_37;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide an output pointer to CVPixelBufferRef", buf, 2u);
    }
    v9 = -22953;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must call prepare before execution", buf, 2u);
    }
    v9 = -22960;
  }
LABEL_4:
  objc_sync_exit(v8);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_refColor);
  CVPixelBufferRelease(self->_itmCroppedScaledRefColor);
  CVPixelBufferRelease(self->_itmRotatedRefColor);
  CVPixelBufferRelease(self->_itmChunkyRefColor);
  CVPixelBufferRelease(self->_auxColor);
  CVPixelBufferRelease(self->_itmCroppedScaledAuxColor);
  CVPixelBufferRelease(self->_itmRotatedAuxColor);
  CVPixelBufferRelease(self->_itmChunkyAuxColor);
  CVPixelBufferRelease(self->_disparity);
  v3.receiver = self;
  v3.super_class = (Class)ADStereoExecutor;
  -[ADExecutor dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfExecutionSteps
{
  return 4;
}

- (ADStereoExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (ADStereoPipeline)pipeline
{
  return self->_pipeline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_executorParameters, 0);
}

@end
