@implementation AR2DSkeletonDetectionTechnique

+ (CGSize)inputDimensionsForMLModel
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  double v11;
  double v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;
  CGSize result;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7828]), "initWithAlgorithmMode:", 1);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CF7848], "inputDimensionsForModelWithABPKNetworkConfig:", v3);
    v5 = v4;
    v7 = v6;
  }
  else
  {
    _ARLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2048;
      v16 = a1;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to initialize config for ABPK 2D Detection module", (uint8_t *)&v13, 0x16u);

    }
    v5 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (AR2DSkeletonDetectionTechnique)init
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  AR2DSkeletonDetectionTechnique *v7;
  AR2DSkeletonDetectionTechnique *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  AR2DSkeletonDetectionTechnique *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Initializing", buf, 0x16u);

  }
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.abpk.humanpose2d");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "inputDimensionsForMLModel");
  v10.receiver = self;
  v10.super_class = (Class)AR2DSkeletonDetectionTechnique;
  v7 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v10, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v6, 1);
  v8 = v7;
  if (v7)
    -[ARMLImageProcessingTechnique setUseEspressoZeroCopyOutput:](v7, "setUseEspressoZeroCopyOutput:", 1);

  return v8;
}

- (void)_prepareOnce:(BOOL)a3
{
  void *v4;
  ABPK2DDetection *v5;
  ABPK2DDetection *algorithm;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  AR2DSkeletonDetectionTechnique *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7828]), "initWithAlgorithmMode:", 1);
  v5 = (ABPK2DDetection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7820]), "initWithNetworkConfig:", v4);
  algorithm = self->_algorithm;
  self->_algorithm = v5;

  if (!self->_algorithm)
  {
    _ARLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ABPK2DDetection could not be initialized!", buf, 0x16u);

    }
    if (ARSkipCrashOnCrash(void)::onceToken != -1)
      dispatch_once(&ARSkipCrashOnCrash(void)::onceToken, &__block_literal_global_85);
    if (!ARSkipCrashOnCrash(void)::skipCrashOnCrash)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABPK2DDetection could not be initialized!"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("ARCrash: %@"), v11);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      qword_1EF081328 = (uint64_t)strdup((const char *)objc_msgSend(v12, "UTF8String"));

      abort();
    }
  }

}

- (double)requiredTimeInterval
{
  if (-[AR2DSkeletonDetectionTechnique requiredTimeInterval]::onceToken != -1)
    dispatch_once(&-[AR2DSkeletonDetectionTechnique requiredTimeInterval]::onceToken, &__block_literal_global_3);
  return *(double *)&-[AR2DSkeletonDetectionTechnique requiredTimeInterval]::sTimeInterval;
}

uint64_t __54__AR2DSkeletonDetectionTechnique_requiredTimeInterval__block_invoke()
{
  uint64_t result;
  double v1;

  result = ARIsANEVersionEqualOrPriorToH12();
  v1 = 0.008;
  if ((_DWORD)result)
    v1 = 0.016;
  -[AR2DSkeletonDetectionTechnique requiredTimeInterval]::sTimeInterval = *(_QWORD *)&v1;
  return result;
}

- (id)processImageDataThroughNeuralNetwork:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  ABPK2DDetection *algorithm;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  AR2DSkeletonDetectionTechnique *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "timestamp");
  -[AR2DSkeletonDetectionTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
  _ARLogGeneral();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543618;
    v32 = v13;
    v33 = 2048;
    v34 = self;
    _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processImageDataThroughNeuralNetwork", (uint8_t *)&v31, 0x16u);

  }
  v14 = -[ARMLImageProcessingTechnique getDeviceOrientationFromImageData:](self, "getDeviceOrientationFromImageData:", v10);
  objc_msgSend(v10, "imageResolution");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v9, "imageResolution");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7878]), "initWithType:inputResolution:outputResolution:", 1, v16, v18, v19, v20);
  v22 = objc_alloc(MEMORY[0x1E0CF7880]);
  v23 = objc_msgSend(v9, "pixelBuffer");
  objc_msgSend(v9, "timestamp");
  v24 = (void *)objc_msgSend(v22, "initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:", v23, v14, v21);
  v25 = objc_alloc(MEMORY[0x1E0CF7870]);
  v26 = objc_msgSend(v10, "pixelBuffer");
  objc_msgSend(v10, "timestamp");
  v27 = (void *)objc_msgSend(v25, "initWithPixelBuffer:timestamp:", v26);
  algorithm = self->_algorithm;
  objc_msgSend(v24, "timestamp");
  -[ABPK2DDetection runWithMLImage:originalImage:abpkOrientation:atTimestamp:rotationOfResultTensor:](algorithm, "runWithMLImage:originalImage:abpkOrientation:atTimestamp:rotationOfResultTensor:", v24, v27, v14, a6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  -[AR2DSkeletonDetectionTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");

  return v29;
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height;
  double width;
  id v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  AR2DSkeletonDetectionTechnique *v24;
  uint64_t v25;

  height = a5.height;
  width = a5.width;
  v25 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  _ARLogGeneral();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v15;
    v23 = 2048;
    v24 = self;
    _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: runNeuralNetworkWithImageData", buf, 0x16u);

  }
  if (self->_algorithm)
    v16 = v11 == 0;
  else
    v16 = 1;
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v12, "timestamp");
    -[AR2DSkeletonDetectionTechnique _startMLProcessingSignpostWithTimestamp:](self, "_startMLProcessingSignpostWithTimestamp:");
    -[AR2DSkeletonDetectionTechnique processImageDataThroughNeuralNetwork:originalImageData:regionOfInterest:rotationOfResultTensor:](self, "processImageDataThroughNeuralNetwork:originalImageData:regionOfInterest:rotationOfResultTensor:", v11, v12, a6, width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timestamp");
    -[AR2DSkeletonDetectionTechnique _endMLProcessingSignpostWithTimestamp:](self, "_endMLProcessingSignpostWithTimestamp:");
    if (v18)
    {
      v20 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v17;
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
  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end
