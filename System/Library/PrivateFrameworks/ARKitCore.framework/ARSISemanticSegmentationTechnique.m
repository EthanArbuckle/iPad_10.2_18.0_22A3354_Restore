@implementation ARSISemanticSegmentationTechnique

+ (void)createUncertaintyMaskedSegmentationBuffer:(__CVBuffer *)a3 fromSegmentationBuffer:(__CVBuffer *)a4 uncertaintyBuffer:(__CVBuffer *)a5 maskValue:(unsigned __int8)a6
{
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  unsigned __int8 *BaseAddress;
  unsigned __int8 *v14;
  size_t v15;
  float *v16;
  uint64_t v17;
  size_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  float *i;
  unsigned __int8 v22;

  Height = CVPixelBufferGetHeight(a4);
  Width = CVPixelBufferGetWidth(a4);
  CVPixelBufferLockBaseAddress(a5, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  CVPixelBufferLockBaseAddress(a3, 0);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
  v14 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
  v15 = CVPixelBufferGetBytesPerRow(a5);
  v16 = (float *)CVPixelBufferGetBaseAddress(a5);
  if (Height)
  {
    v17 = 0;
    do
    {
      v18 = Width;
      v19 = BaseAddress;
      v20 = v14;
      for (i = v16; v18; --v18)
      {
        v22 = a6;
        if (*i > 0.0)
          v22 = *v19;
        *v20++ = v22;
        ++i;
        ++v19;
      }
      ++v17;
      v16 = (float *)((char *)v16 + v15);
      v14 += BytesPerRow;
      BaseAddress += BytesPerRow;
    }
    while (v17 != Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CVPixelBufferUnlockBaseAddress(a5, 1uLL);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
}

- (id)initLegacyAlgorithmUsingSynchronizedUltrawideWhenAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  ARSISemanticSegmentationTechnique *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  char v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARSISemanticSegmentationTechnique *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.semanticSegmentationTechnique");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)ARSISemanticSegmentationTechnique;
  v6 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v12, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v5, 1, 256.0, 192.0);
  if (v6)
  {
    _ARLogTechnique_7();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running scene segmentation technique legacy by SceneIntelligence", buf, 0x16u);

    }
    v6->_numClasses = 12;
    v6->_lastResultPushTimestamp = 0.0;
    if (v3)
      v10 = ARDeviceSupportsUltraWideCamera();
    else
      v10 = 0;
    v6->_shouldUseSynchronizedUltraWide = v10;
    v6->_isLegacyModel = 1;
  }

  return v6;
}

- (ARSISemanticSegmentationTechnique)init
{
  return (ARSISemanticSegmentationTechnique *)-[ARSISemanticSegmentationTechnique initUsingSynchronizedUltrawideWhenAvailable:](self, "initUsingSynchronizedUltrawideWhenAvailable:", 1);
}

- (id)initUsingSynchronizedUltrawideWhenAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  ARSISemanticSegmentationTechnique *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  char v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARSISemanticSegmentationTechnique *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.semanticSegmentationTechnique");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)ARSISemanticSegmentationTechnique;
  v6 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v12, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v5, 1, 256.0, 192.0);
  if (v6)
  {
    _ARLogTechnique_7();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running scene segmentation technique by SceneIntelligence", buf, 0x16u);

    }
    v6->_numClasses = 34;
    v6->_lastResultPushTimestamp = 0.0;
    if (v3)
      v10 = ARDeviceSupportsUltraWideCamera();
    else
      v10 = 0;
    v6->_shouldUseSynchronizedUltraWide = v10;
    v6->_isLegacyModel = 0;
  }

  return v6;
}

- (void)_prepareOnce:(BOOL)a3
{
  id v4;
  SISceneUnderstandingAlgorithm *v5;
  SISceneUnderstandingAlgorithm *sceneUnderstandingAlgorithm;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  double v13;
  SISceneSegmentationAlgorithm *v14;
  SISceneSegmentationAlgorithm *sceneSegmentationAlgorithm;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  ARSISemanticSegmentationTechnique *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_isLegacyModel)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8BEC8]);
    -[ARMLImageProcessingTechnique networkInputScaleBeforeRotation](self, "networkInputScaleBeforeRotation");
    v5 = (SISceneUnderstandingAlgorithm *)objc_msgSend(v4, "initWithInputResolution:andComputeEngine:", 1);
    sceneUnderstandingAlgorithm = self->_sceneUnderstandingAlgorithm;
    self->_sceneUnderstandingAlgorithm = v5;

    if (!self->_sceneUnderstandingAlgorithm)
    {
      _ARLogGeneral_22();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v9;
        v21 = 2048;
        v22 = self;
        _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SISceneUnderstandingAlgorithm could not be initialized!", (uint8_t *)&v19, 0x16u);

      }
      if (ARSkipCrashOnCrash_onceToken_1 != -1)
        dispatch_once(&ARSkipCrashOnCrash_onceToken_1, &__block_literal_global_153_0);
      if (!ARSkipCrashOnCrash_skipCrashOnCrash_1)
        -[ARSISemanticSegmentationTechnique _prepareOnce:].cold.2();
    }
  }
  else
  {
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.semanticSegmentation.uncertaintyThreshold"));
    v11 = v10;
    v12 = objc_alloc(MEMORY[0x1E0D8BEC0]);
    LODWORD(v13) = v11;
    v14 = (SISceneSegmentationAlgorithm *)objc_msgSend(v12, "initWithComputeEngine:andNetworkConfiguration:uncertaintyThreshold:", 1, 0, v13);
    sceneSegmentationAlgorithm = self->_sceneSegmentationAlgorithm;
    self->_sceneSegmentationAlgorithm = v14;

    if (!self->_sceneSegmentationAlgorithm)
    {
      _ARLogGeneral_22();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v18;
        v21 = 2048;
        v22 = self;
        _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SISceneSegmentationAlgorithm could not be initialized!", (uint8_t *)&v19, 0x16u);

      }
      if (ARSkipCrashOnCrash_onceToken_1 != -1)
        dispatch_once(&ARSkipCrashOnCrash_onceToken_1, &__block_literal_global_153_0);
      if (!ARSkipCrashOnCrash_skipCrashOnCrash_1)
        -[ARSISemanticSegmentationTechnique _prepareOnce:].cold.1();
    }
  }
}

- (void)dealloc
{
  __CVPixelBufferPool *outputSegmentationPixelBufferPool;
  __CVPixelBufferPool *outputConfidencePixelBufferPool;
  __CVPixelBufferPool *outputNormalPixelBufferPool;
  __CVPixelBufferPool *scaledSegmentationOutputPixelBufferPool;
  __CVPixelBufferPool *scaledConfidencePixelBufferPool;
  __CVPixelBufferPool *scaledNormalsPixelBufferPool;
  __CVPixelBufferPool *outputUncertaintyPixelBufferPool;
  objc_super v10;

  outputSegmentationPixelBufferPool = self->_outputSegmentationPixelBufferPool;
  if (outputSegmentationPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputSegmentationPixelBufferPool);
    self->_outputSegmentationPixelBufferPool = 0;
  }
  outputConfidencePixelBufferPool = self->_outputConfidencePixelBufferPool;
  if (outputConfidencePixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputConfidencePixelBufferPool);
    self->_outputConfidencePixelBufferPool = 0;
  }
  outputNormalPixelBufferPool = self->_outputNormalPixelBufferPool;
  if (outputNormalPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputNormalPixelBufferPool);
    self->_outputNormalPixelBufferPool = 0;
  }
  scaledSegmentationOutputPixelBufferPool = self->_scaledSegmentationOutputPixelBufferPool;
  if (scaledSegmentationOutputPixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledSegmentationOutputPixelBufferPool);
    self->_scaledSegmentationOutputPixelBufferPool = 0;
  }
  scaledConfidencePixelBufferPool = self->_scaledConfidencePixelBufferPool;
  if (scaledConfidencePixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledConfidencePixelBufferPool);
    self->_scaledConfidencePixelBufferPool = 0;
  }
  scaledNormalsPixelBufferPool = self->_scaledNormalsPixelBufferPool;
  if (scaledNormalsPixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledNormalsPixelBufferPool);
    self->_scaledNormalsPixelBufferPool = 0;
  }
  outputUncertaintyPixelBufferPool = self->_outputUncertaintyPixelBufferPool;
  if (outputUncertaintyPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputUncertaintyPixelBufferPool);
    self->_outputUncertaintyPixelBufferPool = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)ARSISemanticSegmentationTechnique;
  -[ARMLImageProcessingTechnique dealloc](&v10, sel_dealloc);
}

- (double)requiredTimeInterval
{
  return 0.045;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height;
  double width;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  __CVBuffer *v19;
  __CVBuffer *v20;
  int64_t v21;
  int64_t v22;
  SISceneUnderstandingAlgorithm *sceneUnderstandingAlgorithm;
  uint64_t v24;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  uint64_t v34;
  SISceneSegmentationAlgorithm *sceneSegmentationAlgorithm;
  uint64_t v36;
  IOSurfaceRef v37;
  IOSurfaceRef v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t *);
  void *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  CVPixelBufferRef v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  CVPixelBufferRef v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  CVPixelBufferRef v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  CVPixelBufferRef v71;
  NSObject *v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  ARSISemanticSegmentationTechnique *v76;
  uint64_t v77;

  height = a5.height;
  width = a5.width;
  v77 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (self->_sceneSegmentationAlgorithm)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    if (self->_sceneUnderstandingAlgorithm)
      v17 = v11 == 0;
    else
      v17 = 1;
    if (!v17)
    {
LABEL_3:
      objc_msgSend(v11, "timestamp");
      -[ARSISemanticSegmentationTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
      if (self->_isLegacyModel)
      {
        objc_msgSend(MEMORY[0x1E0D8BEC8], "outputResolution");
        v14 = v13;
        v16 = v15;
      }
      else if (self->_shouldUseSynchronizedUltraWide)
      {
        v16 = height;
        v14 = width;
      }
      else
      {
        v19 = (__CVBuffer *)objc_msgSend(v11, "pixelBuffer");
        if (v19)
        {
          v20 = v19;
          v14 = (double)CVPixelBufferGetWidth(v19);
          v16 = (double)CVPixelBufferGetHeight(v20);
        }
        else
        {
          v14 = *MEMORY[0x1E0C9D820];
          v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        }
      }
      v68 = 0;
      v69 = &v68;
      v70 = 0x2020000000;
      v71 = 0;
      v71 = ARCreateCVPixelBufferFromPool(&self->_outputSegmentationPixelBufferPool, 1278226488, self, CFSTR("segmentation output label"), v14, v16);
      v64 = 0;
      v65 = &v64;
      v66 = 0x2020000000;
      v67 = 0;
      v67 = ARCreateCVPixelBufferFromPool(&self->_outputConfidencePixelBufferPool, 1278226534, self, CFSTR("segmentation output confidence"), v14, v16);
      v60 = 0;
      v61 = &v60;
      v62 = 0x2020000000;
      v63 = 0;
      v63 = ARCreateCVPixelBufferFromPool(&self->_outputNormalPixelBufferPool, 1380410945, self, CFSTR("segmentation output normal"), v14, v16);
      v56 = 0;
      v57 = &v56;
      v58 = 0x2020000000;
      v59 = 0;
      v59 = ARCreateCVPixelBufferFromPool(&self->_outputUncertaintyPixelBufferPool, 1278226534, self, CFSTR("segmentation output uncertainty"), v14, v16);
      v48 = MEMORY[0x1E0C809B0];
      v49 = 3221225472;
      v50 = __125__ARSISemanticSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke;
      v51 = &unk_1E66745C8;
      v52 = &v68;
      v53 = &v64;
      v54 = &v56;
      v55 = &v60;
      if (v69[3] && v65[3] && v57[3] && (!self->_isLegacyModel || v61[3]))
      {
        v21 = -[ARMLImageProcessingTechnique getDeviceOrientationFromImageData:](self, "getDeviceOrientationFromImageData:", v12);
        v22 = v21;
        if (self->_isLegacyModel)
        {
          sceneUnderstandingAlgorithm = self->_sceneUnderstandingAlgorithm;
          v24 = objc_msgSend(v11, "pixelBuffer");
          IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)v69[3]);
          v26 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v65[3]);
          -[SISceneUnderstandingAlgorithm runWithInput:output:confidenceOutput:normalsOutput:orientation:](sceneUnderstandingAlgorithm, "runWithInput:output:confidenceOutput:normalsOutput:orientation:", v24, IOSurface, v26, CVPixelBufferGetIOSurface((CVPixelBufferRef)v61[3]), -[ARSISemanticSegmentationTechnique _mapUIDeviceOrientation:](self, "_mapUIDeviceOrientation:", v22));
          if (!-[ARSISemanticSegmentationTechnique _scaleOutputBuffersIfNeededForTargetResolution:segmentationPixelBuffer:confidencePixelBuffer:normalPixelBuffer:uncertaintyPixelBuffer:](self, "_scaleOutputBuffersIfNeededForTargetResolution:segmentationPixelBuffer:confidencePixelBuffer:normalPixelBuffer:uncertaintyPixelBuffer:", v69 + 3, v65 + 3, v61 + 3, 0, width, height))
          {
            _ARLogGeneral_22();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = (objc_class *)objc_opt_class();
              NSStringFromClass(v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v29;
              v75 = 2048;
              v76 = self;
              _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Output buffer scaling failed. (legacy)", buf, 0x16u);

            }
            if (ARSkipCrashOnCrash_onceToken_1 != -1)
              dispatch_once(&ARSkipCrashOnCrash_onceToken_1, &__block_literal_global_153_0);
            if (!ARSkipCrashOnCrash_skipCrashOnCrash_1)
            {
              v45 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output buffer scaling failed. (legacy)"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "stringWithFormat:", CFSTR("ARCrash: %@"), v46, v48, v49);
              v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              qword_1EF081328 = (uint64_t)strdup((const char *)objc_msgSend(v47, "UTF8String"));

              abort();
            }
LABEL_28:
            v18 = 0;
LABEL_33:
            v50(&v48);
            _Block_object_dispose(&v56, 8);
            _Block_object_dispose(&v60, 8);
            _Block_object_dispose(&v64, 8);
            _Block_object_dispose(&v68, 8);
            goto LABEL_34;
          }
        }
        else
        {
          if ((unint64_t)(v21 - 3) < 2)
            v34 = 1;
          else
            v34 = 2 * ((unint64_t)(v21 - 1) < 2);
          sceneSegmentationAlgorithm = self->_sceneSegmentationAlgorithm;
          v36 = objc_msgSend(v11, "pixelBuffer");
          v37 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v69[3]);
          v38 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v65[3]);
          -[SISceneSegmentationAlgorithm runWithInput:output:confidenceOutput:uncertaintyOutput:resampleOutput:networkConfiguration:](sceneSegmentationAlgorithm, "runWithInput:output:confidenceOutput:uncertaintyOutput:resampleOutput:networkConfiguration:", v36, v37, v38, CVPixelBufferGetIOSurface((CVPixelBufferRef)v57[3]), 1, v34);
          if (!self->_shouldUseSynchronizedUltraWide
            && !-[ARSISemanticSegmentationTechnique _scaleOutputBuffersIfNeededForTargetResolution:segmentationPixelBuffer:confidencePixelBuffer:normalPixelBuffer:uncertaintyPixelBuffer:](self, "_scaleOutputBuffersIfNeededForTargetResolution:segmentationPixelBuffer:confidencePixelBuffer:normalPixelBuffer:uncertaintyPixelBuffer:", v69 + 3, v65 + 3, 0, v57 + 3, width, height))
          {
            _ARLogGeneral_22();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = (objc_class *)objc_opt_class();
              NSStringFromClass(v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v41;
              v75 = 2048;
              v76 = self;
              _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Output buffer scaling failed. (Non-legacy)", buf, 0x16u);

            }
            if (ARSkipCrashOnCrash_onceToken_1 != -1)
              dispatch_once(&ARSkipCrashOnCrash_onceToken_1, &__block_literal_global_153_0);
            if (!ARSkipCrashOnCrash_skipCrashOnCrash_1)
            {
              v42 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output buffer scaling failed. (Non-legacy)"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "stringWithFormat:", CFSTR("ARCrash: %@"), v43, v48, v49);
              v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              qword_1EF081328 = (uint64_t)strdup((const char *)objc_msgSend(v44, "UTF8String"));

              abort();
            }
            goto LABEL_28;
          }
        }
        objc_msgSend(v11, "timestamp");
        -[ARSISemanticSegmentationTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
        -[ARSISemanticSegmentationTechnique createResultDataFromOutputSegmentation:outputConfidence:outputNormalize:outputUncertainty:inputImageData:originalData:rotationNeeded:regionOfInterest:](self, "createResultDataFromOutputSegmentation:outputConfidence:outputNormalize:outputUncertainty:inputImageData:originalData:rotationNeeded:regionOfInterest:", v69[3], v65[3], v61[3], v57[3], v12, v11, width, height, a6, v48, v49);
        v30 = objc_claimAutoreleasedReturnValue();
        v72 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _ARLogTechnique_7();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v32;
          v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Pixelbuffer is nil. Returning empty result.", buf, 0x16u);

        }
        v18 = (void *)MEMORY[0x1E0C9AA60];
      }

      goto LABEL_33;
    }
  }
  v18 = (void *)MEMORY[0x1E0C9AA60];
LABEL_34:

  return v18;
}

void __125__ARSISemanticSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke(_QWORD *a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[4] + 8) + 24));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[5] + 8) + 24));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[6] + 8) + 24));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[7] + 8) + 24));
}

- (BOOL)_scaleOutputBuffersIfNeededForTargetResolution:(CGSize)a3 segmentationPixelBuffer:(__CVBuffer *)a4 confidencePixelBuffer:(__CVBuffer *)a5 normalPixelBuffer:(__CVBuffer *)a6 uncertaintyPixelBuffer:(__CVBuffer *)a7
{
  double height;
  double width;
  __CVBuffer *v14;
  double v15;
  double v16;
  BOOL v17;
  _BOOL4 v18;

  height = a3.height;
  width = a3.width;
  v14 = *a4;
  if (*a4)
  {
    v15 = (double)CVPixelBufferGetWidth(*a4);
    v16 = (double)CVPixelBufferGetHeight(v14);
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v17 = width == v15 && height == v16;
  if (v17
    || (v18 = -[ARSISemanticSegmentationTechnique _scalePixelOutputBuffer:toTargetResolution:description:](self, "_scalePixelOutputBuffer:toTargetResolution:description:", a4, CFSTR("Scaled Segmentation Output"), width, height))&& (v18 = -[ARSISemanticSegmentationTechnique _scalePixelOutputBuffer:toTargetResolution:description:](self, "_scalePixelOutputBuffer:toTargetResolution:description:", a5, CFSTR("Scaled Confidence Output"), width, height))&& (!a6|| (v18 = -[ARSISemanticSegmentationTechnique _scalePixelOutputBuffer:toTargetResolution:description:](self, "_scalePixelOutputBuffer:toTargetResolution:description:", a6, CFSTR("Scaled Normals Output"),
                 width,
                 height)))
    && (!a7
     || (v18 = -[ARSISemanticSegmentationTechnique _scalePixelOutputBuffer:toTargetResolution:description:](self, "_scalePixelOutputBuffer:toTargetResolution:description:", a7, CFSTR("Scaled Uncertainty Output"), width, height))))
  {
    LOBYTE(v18) = 1;
  }
  return v18;
}

- (BOOL)_scalePixelOutputBuffer:(__CVBuffer *)a3 toTargetResolution:(CGSize)a4 description:(id)a5
{
  double height;
  double width;
  id v9;
  OSType PixelFormatType;
  CVPixelBufferRef v11;
  __CVBuffer *v12;
  __IOSurface *IOSurface;
  size_t BytesPerElement;
  int v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[2];
  void (*v22)(uint64_t);
  void *v23;
  CVPixelBufferRef v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARSISemanticSegmentationTechnique *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  height = a4.height;
  width = a4.width;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a3)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(*a3);
    v11 = ARCreateCVPixelBufferFromPool(&self->_scaledSegmentationOutputPixelBufferPool, PixelFormatType, self, v9, width, height);
    if (v11)
    {
      v12 = v11;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v22 = __92__ARSISemanticSegmentationTechnique__scalePixelOutputBuffer_toTargetResolution_description___block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0l;
      v24 = v11;
      IOSurface = CVPixelBufferGetIOSurface(*a3);
      if (IOSurface)
      {
        BytesPerElement = IOSurfaceGetBytesPerElement(IOSurface);
        v15 = ARResizeBufferWithNearestNeighbors(*a3, v12, BytesPerElement);
        if (!v15)
        {
          CVPixelBufferRelease(*a3);
          *a3 = CVPixelBufferRetain(v12);
          v19 = 1;
          goto LABEL_11;
        }
        _ARLogTechnique_7();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v26 = v18;
          v27 = 2048;
          v28 = self;
          v29 = 2112;
          v30 = v9;
          v31 = 1024;
          v32 = v15;
          _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer (%@): %i", buf, 0x26u);

        }
      }
      v19 = 0;
LABEL_11:
      v22((uint64_t)v21);
      goto LABEL_12;
    }
  }
  v19 = 0;
LABEL_12:

  return v19;
}

void __92__ARSISemanticSegmentationTechnique__scalePixelOutputBuffer_toTargetResolution_description___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (id)createResultDataFromOutputSegmentation:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 outputNormalize:(__CVBuffer *)a5 outputUncertainty:(__CVBuffer *)a6 inputImageData:(id)a7 originalData:(id)a8 rotationNeeded:(int64_t)a9 regionOfInterest:(CGSize)a10
{
  id v15;
  void *v16;
  void *v17;
  ARImageRotationTechnique *segmentationRotationTechnique;
  ARImageRotationTechnique *v19;
  ARImageRotationTechnique *v20;
  ARImageRotationTechnique *v21;
  ARImageRotationTechnique *confidenceUncertaintyRotationTechnique;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ARSegmentationData *v28;
  double v29;
  ARSegmentationData *v30;
  ARSegmentationData *v31;
  double v32;
  ARImageRotationTechnique *normalsRotationTechnique;
  ARImageRotationTechnique *v34;
  ARImageRotationTechnique *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CVBuffer *v43;
  void *v44;
  void *v45;
  void *v46;

  v15 = a7;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPixelBuffer:", a3);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setPixelBuffer:", a4);
  segmentationRotationTechnique = self->_segmentationRotationTechnique;
  if (!segmentationRotationTechnique
    || -[ARImageRotationTechnique rotationAngle](segmentationRotationTechnique, "rotationAngle") != a9
    || -[ARImageRotationTechnique mirrorMode](self->_segmentationRotationTechnique, "mirrorMode"))
  {
    v19 = -[ARImageRotationTechnique initWithRotation:mirror:]([ARImageRotationTechnique alloc], "initWithRotation:mirror:", a9, 0);
    v20 = self->_segmentationRotationTechnique;
    self->_segmentationRotationTechnique = v19;

    v21 = -[ARImageRotationTechnique initWithRotation:mirror:]([ARImageRotationTechnique alloc], "initWithRotation:mirror:", a9, 0);
    confidenceUncertaintyRotationTechnique = self->_confidenceUncertaintyRotationTechnique;
    self->_confidenceUncertaintyRotationTechnique = v21;

  }
  -[ARSISemanticSegmentationTechnique _rotateImageData:withRotationTechnique:rotationNeeded:](self, "_rotateImageData:withRotationTechnique:rotationNeeded:", v16, self->_segmentationRotationTechnique, a9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSISemanticSegmentationTechnique _rotateImageData:withRotationTechnique:rotationNeeded:](self, "_rotateImageData:withRotationTechnique:rotationNeeded:", v17, self->_confidenceUncertaintyRotationTechnique, a9);
  v45 = v23;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a6 || self->_isLegacyModel)
  {
    v31 = [ARSegmentationData alloc];
    objc_msgSend(v15, "timestamp");
    v30 = -[ARSegmentationData initWithTimestamp:segmentationBuffer:confidenceBuffer:source:](v31, "initWithTimestamp:segmentationBuffer:confidenceBuffer:source:", objc_msgSend(v23, "pixelBuffer"), objc_msgSend(v46, "pixelBuffer"), 2, v32);
  }
  else
  {
    v43 = a5;
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setPixelBuffer:", a6);
    -[ARSISemanticSegmentationTechnique _rotateImageData:withRotationTechnique:rotationNeeded:](self, "_rotateImageData:withRotationTechnique:rotationNeeded:", v24, self->_confidenceUncertaintyRotationTechnique, a9);
    v44 = v17;
    v25 = v16;
    v26 = v15;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = [ARSegmentationData alloc];
    objc_msgSend(v26, "timestamp");
    v30 = -[ARSegmentationData initWithTimestamp:segmentationBuffer:confidenceBuffer:uncertaintyBuffer:source:](v28, "initWithTimestamp:segmentationBuffer:confidenceBuffer:uncertaintyBuffer:source:", objc_msgSend(v23, "pixelBuffer"), objc_msgSend(v46, "pixelBuffer"), objc_msgSend(v27, "pixelBuffer"), 2, v29);

    v15 = v26;
    v16 = v25;
    v17 = v44;

    a5 = v43;
  }
  if (a5 && self->_isLegacyModel)
  {
    normalsRotationTechnique = self->_normalsRotationTechnique;
    if (!normalsRotationTechnique
      || -[ARImageRotationTechnique rotationAngle](normalsRotationTechnique, "rotationAngle") != a9
      || -[ARImageRotationTechnique mirrorMode](self->_normalsRotationTechnique, "mirrorMode"))
    {
      v34 = -[ARImageRotationTechnique initWithRotation:mirror:]([ARImageRotationTechnique alloc], "initWithRotation:mirror:", a9, 0);
      v35 = self->_normalsRotationTechnique;
      self->_normalsRotationTechnique = v34;

    }
    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "setPixelBuffer:", a5);
    -[ARSISemanticSegmentationTechnique _rotateImageData:withRotationTechnique:rotationNeeded:](self, "_rotateImageData:withRotationTechnique:rotationNeeded:", v36, self->_normalsRotationTechnique, a9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSegmentationData setNormalsBuffer:](v30, "setNormalsBuffer:", objc_msgSend(v37, "pixelBuffer"));

  }
  objc_msgSend(v15, "originalImage");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSegmentationData setSourceImageData:](v30, "setSourceImageData:", v38);

  -[ARSegmentationData sourceImageData](v30, "sourceImageData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "timestamp");
  -[ARSegmentationData sourceImageData](v30, "sourceImageData");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "cameraType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0C89F98]);
  CVPixelBufferGetWidth(-[ARSegmentationData segmentationBuffer](v30, "segmentationBuffer"));
  CVPixelBufferGetHeight(-[ARSegmentationData segmentationBuffer](v30, "segmentationBuffer"));
  kdebug_trace();

  return v30;
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

- (void)_captureMLRunNetworkInputImageData:(double)a3 cameraType:(int64_t)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6
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

- (int64_t)_mapUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return qword_1B3C07DC8[a3 - 1];
}

- (id)_rotateImageData:(id)a3 withRotationTechnique:(id)a4 rotationNeeded:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  ARSISemanticSegmentationTechnique *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a4, "processData:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (a5 && v9 == v8)
  {
    _ARLogTechnique_7();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2048;
      v19 = self;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not rotate image data.", (uint8_t *)&v16, 0x16u);

    }
    -[ARTechnique delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ARErrorWithCodeAndUserInfo(151, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "technique:didFailWithError:", self, v14);

  }
  return v9;
}

- (BOOL)shouldUseSynchronizedUltraWide
{
  return self->_shouldUseSynchronizedUltraWide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneUnderstandingAlgorithm, 0);
  objc_storeStrong((id *)&self->_sceneSegmentationAlgorithm, 0);
  objc_storeStrong((id *)&self->_confidenceUncertaintyRotationTechnique, 0);
  objc_storeStrong((id *)&self->_segmentationRotationTechnique, 0);
  objc_storeStrong((id *)&self->_normalsRotationTechnique, 0);
}

- (void)_prepareOnce:.cold.1()
{
  void *v0;
  void *v1;
  const char *v2;
  char *v3;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SISceneSegmentationAlgorithm could not be initialized!"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("ARCrash: %@"), v1);
  v2 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  v3 = strdup(v2);
  OUTLINED_FUNCTION_0_0((uint64_t)v3);

  abort();
}

- (void)_prepareOnce:.cold.2()
{
  void *v0;
  void *v1;
  const char *v2;
  char *v3;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SISceneUnderstandingAlgorithm could not be initialized!"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("ARCrash: %@"), v1);
  v2 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  v3 = strdup(v2);
  OUTLINED_FUNCTION_0_0((uint64_t)v3);

  abort();
}

@end
