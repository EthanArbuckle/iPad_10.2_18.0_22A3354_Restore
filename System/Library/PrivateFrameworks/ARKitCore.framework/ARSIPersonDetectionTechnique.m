@implementation ARSIPersonDetectionTechnique

- (ARSIPersonDetectionTechnique)init
{
  void *v3;
  ARSIPersonDetectionTechnique *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  ARSIPersonDetectionTechnique *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.persondetectiontechnique");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)ARSIPersonDetectionTechnique;
  v4 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v10, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v3, 1, 256.0, 256.0);
  if (v4)
  {
    _ARLogTechnique();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running person detection technique by SceneIntelligence", buf, 0x16u);

    }
    v4->_lastTimestamp = -1.0;
    v4->_imageNetworkSize = (CGSize)vdupq_n_s64(0x4070000000000000uLL);
    +[ARKitUserDefaults objectForKey:useCache:](ARKitUserDefaults, "objectForKey:useCache:", CFSTR("com.apple.arkit.personDetectionTechnique.mergeLargelyOverlappingBoundingBoxes"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_mergeLargelyOverlappingBoxes = objc_msgSend(v8, "BOOLValue");

    -[ARMLImageProcessingTechnique setAllowedResamplingImageSize:](v4, "setAllowedResamplingImageSize:", 256.0, 256.0);
  }

  return v4;
}

- (void)_prepareOnce:(BOOL)a3
{
  SIPersonDetectorAlgorithm *v4;
  SIPersonDetectorAlgorithm *algorithm;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  ARSIPersonDetectionTechnique *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (SIPersonDetectorAlgorithm *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8BEB8]), "initWithComputeEngine:andNetworkConfiguration:", 1, 0);
  algorithm = self->_algorithm;
  self->_algorithm = v4;

  if (!self->_algorithm)
  {
    if (_ARLogGeneral(void)::onceToken != -1)
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_107_0);
    v6 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SIPersonDetectorAlgorithm could not be initialized!", buf, 0x16u);

    }
    if (ARSkipCrashOnCrash(void)::onceToken != -1)
      dispatch_once(&ARSkipCrashOnCrash(void)::onceToken, &__block_literal_global_109_0);
    if (!ARSkipCrashOnCrash(void)::skipCrashOnCrash)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SIPersonDetectorAlgorithm could not be initialized!"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("ARCrash: %@"), v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      qword_1EF081328 = (uint64_t)strdup((const char *)objc_msgSend(v11, "UTF8String"));

      abort();
    }
  }
}

- (void)dealloc
{
  __CVPixelBufferPool *depthPixelBufferPool;
  objc_super v4;

  depthPixelBufferPool = self->_depthPixelBufferPool;
  if (depthPixelBufferPool)
  {
    CVPixelBufferPoolRelease(depthPixelBufferPool);
    self->_depthPixelBufferPool = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ARSIPersonDetectionTechnique;
  -[ARMLImageProcessingTechnique dealloc](&v4, sel_dealloc);
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (BOOL)isLoadedModelVersionCorrect:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARSIPersonDetectionTechnique;
  return -[ARMLImageProcessingTechnique ARMLVerifyLoadedModelVersion:deviceName:major:minor:](&v4, sel_ARMLVerifyLoadedModelVersion_deviceName_major_minor_, a3, CFSTR("D"), 2, 1);
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  height = a5.height;
  width = a5.width;
  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (self->_algorithm)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v10, "timestamp");
    -[ARSIPersonDetectionTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SIPersonDetectorAlgorithm runWithInput:output:](self->_algorithm, "runWithInput:output:", objc_msgSend(v11, "pixelBuffer"), v13);
    objc_msgSend(v11, "timestamp");
    -[ARSIPersonDetectionTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
    -[ARSIPersonDetectionTechnique createResultDataFromAlgorithmOutput:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:](self, "createResultDataFromAlgorithmOutput:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:", v13, v11, v11, a6, width, height);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)createResultDataFromAlgorithmOutput:(id)a3 imageDataForNeuralNetwork:(id)a4 inputImageData:(id)a5 rotationNeeded:(int64_t)a6 regionOfInterest:(CGSize)a7
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  ARPersonDetectionResult *v28;
  void *v29;
  double v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  id v34;
  void *v35;
  int v37;
  id v38;
  __int16 v39;
  ARSIPersonDetectionTechnique *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  v13 = objc_msgSend(v10, "count");
  if (v13)
  {
    v14 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "boundingBox");
      ARCGRectRotate(a6, v16, v17, v18, v19);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      v28 = -[ARPersonDetectionResult initWithBoundingBox:]([ARPersonDetectionResult alloc], "initWithBoundingBox:", v21, v23, v25, v27);
      objc_msgSend(v12, "addObject:", v28);

      ++v14;
    }
    while (v13 != v14);
  }
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setDetectedObjects:", v12);
  objc_msgSend(v11, "timestamp");
  objc_msgSend(v29, "setTimestamp:");
  if (self->_mergeLargelyOverlappingBoxes)
  {
    LODWORD(v30) = 1058642330;
    objc_msgSend(v29, "mergeOverlappingDetectionsWithThreshold:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    _ARLogTechnique();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "detectedObjects");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138544130;
      v38 = v34;
      v39 = 2048;
      v40 = self;
      v41 = 1024;
      v42 = objc_msgSend(v35, "count");
      v43 = 1024;
      v44 = objc_msgSend(v12, "count");
      _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Detections %d / %d.", (uint8_t *)&v37, 0x22u);

    }
  }
  else
  {
    v31 = v29;
  }

  return v31;
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

- (ARPersonDetectionData)latestResult
{
  return (ARPersonDetectionData *)objc_getProperty(self, a2, 368, 1);
}

- (void)setLatestResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestResult, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end
