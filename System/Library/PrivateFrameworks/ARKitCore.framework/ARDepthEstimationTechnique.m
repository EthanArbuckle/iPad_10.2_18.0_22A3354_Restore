@implementation ARDepthEstimationTechnique

- (ARDepthEstimationTechnique)init
{
  void *v3;
  void *v4;
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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  ARDepthEstimationTechnique *v23;
  objc_super v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.depthestimationtechnique");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCDE8]), "initWithInputPrioritization:", 1);
  objc_msgSend(v4, "inferenceDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inferenceDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "depthOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inferenceDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "networkURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inferenceDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeForLayout:", 1);
  v17 = v16;
  v19 = v18;

  v27[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)ARDepthEstimationTechnique;
  v23 = -[ARMLImageProcessingTechnique initWithDispatchQueue:inputTensorNames:outputTensorNames:networkInputScaleBeforeRotation:networkFilePath:](&v25, sel_initWithDispatchQueue_inputTensorNames_outputTensorNames_networkInputScaleBeforeRotation_networkFilePath_, v3, v20, v21, v22, v17, v19);

  if (v23)
  {
    v23->_outputPixelBufferPool = 0;
    v23->_scaledOutputPixelBufferPool = 0;
    v23->_alphaChannelPixelBufferPool = 0;
  }

  return v23;
}

- (void)dealloc
{
  __CVPixelBufferPool *outputPixelBufferPool;
  __CVPixelBufferPool *scaledOutputPixelBufferPool;
  objc_super v5;

  outputPixelBufferPool = self->_outputPixelBufferPool;
  if (outputPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputPixelBufferPool);
    self->_outputPixelBufferPool = 0;
  }
  scaledOutputPixelBufferPool = self->_scaledOutputPixelBufferPool;
  if (scaledOutputPixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledOutputPixelBufferPool);
    self->_scaledOutputPixelBufferPool = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARDepthEstimationTechnique;
  -[ARMLImageProcessingTechnique dealloc](&v5, sel_dealloc);
}

- (int64_t)depthDataSource
{
  return 1;
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
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
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v16.receiver = self;
  v16.super_class = (Class)ARDepthEstimationTechnique;
  -[ARImageBasedTechnique _fullDescription](&v16, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARImageRotationTechnique _fullDescription](self->_rotationTechnique, "_fullDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tRotation Technique: %@\n\n"), v8);

  CVPixelBufferPoolGetPixelBufferAttributes(self->_outputPixelBufferPool);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tOutputPixelBufferPool attr: %@\n"), v11);

  CVPixelBufferPoolGetPixelBufferAttributes(self->_scaledOutputPixelBufferPool);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tScaledOutputPixelBufferPool attr: %@\n"), v14);

  return v5;
}

- (int64_t)numberOfInputChannelsToExpectInNetwork
{
  return 3;
}

- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8
{
  double height;
  double width;
  id v13;
  float *var0;
  unint64_t v15;
  unint64_t var4;
  unint64_t var5;
  __CVBuffer *v18;
  __CVBuffer *v19;
  size_t BytesPerRow;
  float *BaseAddress;
  double v22;
  double v23;
  float v24;
  double v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  unint64_t v31;
  float *v32;
  float *i;
  float v34;
  __CVBuffer *v36;
  int v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  ARImageRotationTechnique *rotationTechnique;
  ARImageRotationTechnique *v43;
  ARImageRotationTechnique *v44;
  void *v45;
  ARMLDepthData *v46;
  double v47;
  ARMLDepthData *v48;
  int v50;
  void *v51;
  __int16 v52;
  ARDepthEstimationTechnique *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  height = a8.height;
  width = a8.width;
  v56 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  var0 = (float *)a3->var0;
  v15 = a3->var3[0];
  var4 = a3->var4;
  var5 = a3->var5;
  v18 = ARCreateCVPixelBufferFromPool(&self->_outputPixelBufferPool, 1717855600, self, CFSTR("Estimated Depth Map"), (double)var4, (double)var5);
  v19 = v18;
  if (!v18)
    goto LABEL_31;
  CVPixelBufferLockBaseAddress(v18, 0);
  BytesPerRow = CVPixelBufferGetBytesPerRow(v19);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(v19);
  objc_msgSend(v13, "imageResolution");
  v23 = v22;
  objc_msgSend(v13, "cameraIntrinsics");
  if (a7 == -90 || a7 == 90)
    v26 = height;
  else
    v26 = width;
  if (var5)
  {
    v27 = 0;
    v28 = v26;
    v29 = v28 / v23;
    v30 = (float)(v29 * v24) / 191.40249;
    do
    {
      v31 = var4;
      v32 = BaseAddress;
      for (i = var0; v31; --v31)
      {
        v34 = *i++;
        *v32++ = v34 * v30;
      }
      ++v27;
      var0 = (float *)((char *)var0 + v15);
      BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
    }
    while (v27 != var5);
  }
  CVPixelBufferUnlockBaseAddress(v19, 0);
  if ((_DWORD)var4 == (int)width && (_DWORD)var5 == (int)height)
  {
    v36 = v19;
    goto LABEL_25;
  }
  v36 = ARCreateCVPixelBufferFromPool(&self->_scaledOutputPixelBufferPool, 1717855600, self, CFSTR("Scaled Depth"), width, height);
  if (!v36)
  {
    CVPixelBufferRelease(v19);
LABEL_31:
    v48 = 0;
    goto LABEL_32;
  }
  v37 = ARResizeBufferWithNearestNeighbors(v19, v36, 4uLL);
  if (v37)
  {
    if (_ARLogTechnique(void)::onceToken != -1)
      dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_86);
    v38 = (id)_ARLogTechnique(void)::logObj;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 138543874;
      v51 = v40;
      v52 = 2048;
      v53 = self;
      v54 = 1024;
      v55 = v37;
      _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer: %i", (uint8_t *)&v50, 0x1Cu);

    }
    CVPixelBufferRelease(v19);
    CVPixelBufferRelease(v36);
    goto LABEL_31;
  }
  CVPixelBufferRelease(v19);
LABEL_25:
  v41 = (void *)objc_opt_new();
  objc_msgSend(v41, "setPixelBuffer:", v36);
  CVPixelBufferRelease(v36);
  rotationTechnique = self->_rotationTechnique;
  if (!rotationTechnique
    || -[ARImageRotationTechnique rotationAngle](rotationTechnique, "rotationAngle") != a7
    || -[ARImageRotationTechnique mirrorMode](self->_rotationTechnique, "mirrorMode"))
  {
    v43 = -[ARImageRotationTechnique initWithRotation:mirror:]([ARImageRotationTechnique alloc], "initWithRotation:mirror:", a7, 0);
    v44 = self->_rotationTechnique;
    self->_rotationTechnique = v43;

  }
  -[ARImageRotationTechnique processData:](self->_rotationTechnique, "processData:", v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = [ARMLDepthData alloc];
  objc_msgSend(v13, "timestamp");
  v48 = -[ARMLDepthData initWithTimestamp:depthBuffer:source:](v46, "initWithTimestamp:depthBuffer:source:", objc_msgSend(v45, "pixelBuffer"), 1, v47);

LABEL_32:
  return v48;
}

- (void)_startLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_endLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_startMLProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMLProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5
{
  kdebug_trace();
}

- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCroppingTechnique, 0);
  objc_storeStrong((id *)&self->_rotationTechnique, 0);
}

@end
