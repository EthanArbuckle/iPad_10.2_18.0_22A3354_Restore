@implementation ARPersonSegmentationTechnique

- (ARPersonSegmentationTechnique)init
{
  void *v3;
  ARPersonSegmentationTechnique *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARPersonSegmentationTechnique *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.personsegmentationtechnique");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)ARPersonSegmentationTechnique;
  v4 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v9, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v3, 1, 256.0, 192.0);
  if (v4)
  {
    _ARLogTechnique_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running person segmentation by ARPersonSegmentationTechnique.", buf, 0x16u);

    }
    v4->_outputSegmentationCopyPixelBufferPool = 0;
    v4->_scaledSegmentationOutputPixelBufferPool = 0;
    v4->_shouldOperateOnHighResolutionImages = 0;
  }

  return v4;
}

- (void)_prepareOnce:(BOOL)a3
{
  id v4;
  SIPeopleSegmentationAlgorithm *v5;
  SIPeopleSegmentationAlgorithm *algorithm;
  SIImageInputData *v7;
  SIImageInputData *imageInputData;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  ARPersonSegmentationTechnique *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0D8BEB0]);
  objc_msgSend(v4, "setRunByE5RT:", 1);
  objc_msgSend(v4, "setEngineType:", 1);
  v5 = (SIPeopleSegmentationAlgorithm *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8BEA0]), "initWithNetworkConfiguration:", v4);
  algorithm = self->_algorithm;
  self->_algorithm = v5;

  v7 = (SIImageInputData *)objc_alloc_init(MEMORY[0x1E0D8BE98]);
  imageInputData = self->_imageInputData;
  self->_imageInputData = v7;

  if (!self->_algorithm)
  {
    if (_ARLogGeneral_onceToken_19 != -1)
      dispatch_once(&_ARLogGeneral_onceToken_19, &__block_literal_global_72);
    v9 = (void *)_ARLogGeneral_logObj_19;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_19, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SIPeopleSegmentationAlgorithm could not be initialized!", (uint8_t *)&v13, 0x16u);

    }
    if (ARSkipCrashOnCrash_onceToken_0 != -1)
      dispatch_once(&ARSkipCrashOnCrash_onceToken_0, &__block_literal_global_74);
    if (!ARSkipCrashOnCrash_skipCrashOnCrash_0)
      -[ARPersonSegmentationTechnique _prepareOnce:].cold.1();
  }
  if (-[ARPersonSegmentationTechnique shouldOperateOnHighResolutionImages](self, "shouldOperateOnHighResolutionImages"))
    -[SIPeopleSegmentationAlgorithm setSnapEveryFrameCount:](self->_algorithm, "setSnapEveryFrameCount:", 1);

}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferPoolRelease(self->_outputSegmentationCopyPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledSegmentationOutputPixelBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)ARPersonSegmentationTechnique;
  -[ARMLImageProcessingTechnique dealloc](&v3, sel_dealloc);
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)processData:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5 = -[ARPersonSegmentationTechnique shouldOperateOnHighResolutionImages](self, "shouldOperateOnHighResolutionImages"), objc_msgSend(v4, "originalImageData"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isHighResolution"), v6, v5 == v7))
  {
    v11.receiver = self;
    v11.super_class = (Class)ARPersonSegmentationTechnique;
    -[ARMLImageProcessingTechnique processData:](&v11, sel_processData_, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v13;

  v6 = a4;
  v7 = -[ARPersonSegmentationTechnique shouldOperateOnHighResolutionImages](self, "shouldOperateOnHighResolutionImages");
  objc_msgSend(v6, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHighResolution");

  if (v7 == v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ARPersonSegmentationTechnique;
    -[ARImageBasedTechnique requestResultDataAtTimestamp:context:](&v13, sel_requestResultDataAtTimestamp_context_, v6, a3);
  }
  else
  {
    -[ARTechnique delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[ARTechnique delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v6, a3);

    }
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)ARPersonSegmentationTechnique;
  if (-[ARTechnique isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_shouldOperateOnHighResolutionImages == v4[376];
  else
    v5 = 0;

  return v5;
}

- (BOOL)isLoadedModelVersionCorrect:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARPersonSegmentationTechnique;
  return -[ARMLImageProcessingTechnique ARMLVerifyLoadedModelVersion:deviceName:major:minor:](&v4, sel_ARMLVerifyLoadedModelVersion_deviceName_major_minor_, a3, CFSTR("D"), 1, 4);
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height;
  double width;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  SIPeopleSegmentationData **p_peopleSegmentationOutputPortrait;
  SIPeopleSegmentationData *peopleSegmentationOutputPortrait;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  SIPeopleSegmentationData *v23;
  SIPeopleSegmentationData *v24;
  id v25;
  uint64_t v26;
  double v27;
  double v28;
  __CVBuffer *v29;
  __CVBuffer *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  __CVBuffer *v39;
  __CVBuffer *v40;
  int v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  ARImageRotationTechnique *segmentationRotationTechnique;
  ARImageRotationTechnique *v46;
  ARImageRotationTechnique *v47;
  void *v48;
  uint64_t v49;
  __CVBuffer *v50;
  __CVBuffer *v51;
  __CVBuffer *v52;
  ARSegmentationData *v53;
  ARSegmentationData *v54;
  NSObject *v55;
  objc_class *v56;
  void *v57;
  _QWORD v59[5];
  _QWORD v60[2];
  void (*v61)(uint64_t);
  void *v62;
  __CVBuffer *v63;
  ARSegmentationData *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  ARPersonSegmentationTechnique *v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  height = a5.height;
  width = a5.width;
  v71 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (self->_algorithm)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    v15 = -[ARMLImageProcessingTechnique getDeviceOrientationFromImageData:](self, "getDeviceOrientationFromImageData:", v12);
    v16 = v15;
    if ((unint64_t)(v15 - 3) > 1)
    {
      if ((unint64_t)(v15 - 1) > 1)
      {
        v19 = 0;
        v24 = 0;
        goto LABEL_17;
      }
      v19 = 1;
      -[SIPeopleSegmentationAlgorithm switchConfiguration:](self->_algorithm, "switchConfiguration:", 1);
      p_peopleSegmentationOutputPortrait = &self->_peopleSegmentationOutputPortrait;
      peopleSegmentationOutputPortrait = self->_peopleSegmentationOutputPortrait;
      if (peopleSegmentationOutputPortrait)
      {
LABEL_16:
        v24 = peopleSegmentationOutputPortrait;
LABEL_17:
        objc_msgSend(v11, "timestamp");
        -[ARMLImageProcessingTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
        -[SIImageInputData setInputImageBuffer:](self->_imageInputData, "setInputImageBuffer:", objc_msgSend(v11, "pixelBuffer"));
        -[SIPeopleSegmentationAlgorithm runWithInput:output:resolutionConfiguration:](self->_algorithm, "runWithInput:output:resolutionConfiguration:", self->_imageInputData, v24, v19);
        objc_msgSend(v11, "timestamp");
        -[ARMLImageProcessingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
        objc_msgSend(v11, "timestamp");
        v28 = v27;
        v29 = (__CVBuffer *)-[SIImageInputData inputImageBuffer](self->_imageInputData, "inputImageBuffer");
        if (v29)
        {
          v30 = v29;
          v31 = (double)CVPixelBufferGetWidth(v29);
          v32 = (double)CVPixelBufferGetHeight(v30);
        }
        else
        {
          v31 = *MEMORY[0x1E0C9D820];
          v32 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        }
        -[ARMLImageProcessingTechnique _startMLCreateResultSignpostWithTimestamp:orientation:outputSize:](self, "_startMLCreateResultSignpostWithTimestamp:orientation:outputSize:", v16, v28, v31, v32);
        -[SIPeopleSegmentationAlgorithm getOutputResolution](self->_algorithm, "getOutputResolution");
        v34 = v33;
        v36 = v35;
        v37 = (void *)objc_opt_new();
        if ((int)v34 == (int)width && (int)v36 == (int)height)
        {
          objc_msgSend(v37, "setPixelBuffer:", -[SIPeopleSegmentationData segmentation](v24, "segmentation"));
        }
        else
        {
          v39 = ARCreateCVPixelBufferFromPool(&self->_scaledSegmentationOutputPixelBufferPool, 1278226488, self, CFSTR("Scaled Segmentation"), width, height);
          if (!v39)
          {
            _ARLogTechnique_5();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v56 = (objc_class *)objc_opt_class();
              NSStringFromClass(v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v66 = v57;
              v67 = 2048;
              v68 = self;
              _os_log_impl(&dword_1B3A68000, v55, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create scaled person segmentation buffer", buf, 0x16u);

            }
            goto LABEL_41;
          }
          v40 = v39;
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v61 = __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke;
          v62 = &__block_descriptor_40_e5_v8__0l;
          v63 = v39;
          v41 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)-[SIPeopleSegmentationData segmentation](v24, "segmentation"), v39, 1uLL);
          if (v41)
          {
            _ARLogTechnique_5();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v43 = (objc_class *)objc_opt_class();
              NSStringFromClass(v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v66 = v44;
              v67 = 2048;
              v68 = self;
              v69 = 1024;
              v70 = v41;
              _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer: %i", buf, 0x1Cu);

            }
            v61((uint64_t)v60);
LABEL_41:
            v14 = 0;
LABEL_42:

            goto LABEL_43;
          }
          objc_msgSend(v37, "setPixelBuffer:", v40);
          v61((uint64_t)v60);
        }
        segmentationRotationTechnique = self->_segmentationRotationTechnique;
        if (!segmentationRotationTechnique
          || -[ARImageRotationTechnique rotationAngle](segmentationRotationTechnique, "rotationAngle") != a6
          || -[ARImageRotationTechnique mirrorMode](self->_segmentationRotationTechnique, "mirrorMode"))
        {
          v46 = -[ARImageRotationTechnique initWithRotation:mirror:]([ARImageRotationTechnique alloc], "initWithRotation:mirror:", a6, 0);
          v47 = self->_segmentationRotationTechnique;
          self->_segmentationRotationTechnique = v46;

        }
        -[ARImageRotationTechnique processData:](self->_segmentationRotationTechnique, "processData:", v37);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "pixelBuffer");
        LODWORD(v49) = v49 == -[SIPeopleSegmentationData segmentation](v24, "segmentation");
        v50 = (__CVBuffer *)objc_msgSend(v48, "pixelBuffer");
        if ((_DWORD)v49)
          v51 = -[ARPersonSegmentationTechnique _createCopyWithCVPixelBufferPoolForBuffer:](self, "_createCopyWithCVPixelBufferPoolForBuffer:", v50);
        else
          v51 = CVPixelBufferRetain(v50);
        v52 = v51;
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke_30;
        v59[3] = &__block_descriptor_40_e5_v8__0l;
        v59[4] = v51;
        v53 = [ARSegmentationData alloc];
        objc_msgSend(v12, "timestamp");
        v54 = -[ARSegmentationData initWithTimestamp:segmentationBuffer:](v53, "initWithTimestamp:segmentationBuffer:", v52);
        v64 = v54;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timestamp");
        -[ARMLImageProcessingTechnique _endMLCreateResultSignpostWithTimestamp:](self, "_endMLCreateResultSignpostWithTimestamp:");

        __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke_30((uint64_t)v59);
        goto LABEL_42;
      }
      v20 = objc_alloc(MEMORY[0x1E0D8BEA8]);
      -[SIPeopleSegmentationAlgorithm networkConfiguration](self->_algorithm, "networkConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "initWithConfig:", v21);
      v23 = *p_peopleSegmentationOutputPortrait;
      *p_peopleSegmentationOutputPortrait = (SIPeopleSegmentationData *)v22;
      v19 = 1;
    }
    else
    {
      -[SIPeopleSegmentationAlgorithm switchConfiguration:](self->_algorithm, "switchConfiguration:", 0);
      p_peopleSegmentationOutputPortrait = &self->_peopleSegmentationOutputLandscape;
      peopleSegmentationOutputPortrait = self->_peopleSegmentationOutputLandscape;
      if (peopleSegmentationOutputPortrait)
      {
        v19 = 0;
        goto LABEL_16;
      }
      v25 = objc_alloc(MEMORY[0x1E0D8BEA8]);
      -[SIPeopleSegmentationAlgorithm networkConfiguration](self->_algorithm, "networkConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "initWithConfig:", v21);
      v19 = 0;
      v23 = *p_peopleSegmentationOutputPortrait;
      *p_peopleSegmentationOutputPortrait = (SIPeopleSegmentationData *)v26;
    }

    peopleSegmentationOutputPortrait = *p_peopleSegmentationOutputPortrait;
    goto LABEL_16;
  }
  v14 = (void *)MEMORY[0x1E0C9AA60];
LABEL_43:

  return v14;
}

void __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke_30(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (__CVBuffer)_createCopyWithCVPixelBufferPoolForBuffer:(__CVBuffer *)a3
{
  __CVPixelBufferPool **p_outputSegmentationCopyPixelBufferPool;
  double Width;
  double Height;
  OSType PixelFormatType;
  __CVBuffer *v9;
  __CVBuffer *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  ARPersonSegmentationTechnique *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_outputSegmentationCopyPixelBufferPool = &self->_outputSegmentationCopyPixelBufferPool;
  Width = (double)CVPixelBufferGetWidth(a3);
  Height = (double)CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v9 = ARCreateCVPixelBufferFromPool(p_outputSegmentationCopyPixelBufferPool, PixelFormatType, self, CFSTR("Copied person segmentation output"), Width, Height);
  if (!v9)
  {
    _ARLogTechnique_5();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2048;
      v21 = self;
      _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create a copied buffer for person segmentation result", (uint8_t *)&v18, 0x16u);

    }
    return 0;
  }
  v10 = v9;
  if ((ARPixelBufferCopy(a3, v9) & 1) == 0)
  {
    _ARLogTechnique_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v13;
      v20 = 2048;
      v21 = self;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to copy for person segmentation result", (uint8_t *)&v18, 0x16u);

    }
    CVPixelBufferRelease(v10);
    return 0;
  }
  return v10;
}

- (BOOL)shouldOperateOnHighResolutionImages
{
  return self->_shouldOperateOnHighResolutionImages;
}

- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3
{
  self->_shouldOperateOnHighResolutionImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleSegmentationOutputPortrait, 0);
  objc_storeStrong((id *)&self->_peopleSegmentationOutputLandscape, 0);
  objc_storeStrong((id *)&self->_imageInputData, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
  objc_storeStrong((id *)&self->_segmentationRotationTechnique, 0);
}

- (void)_prepareOnce:.cold.1()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SIPeopleSegmentationAlgorithm could not be initialized!"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("ARCrash: %@"), v1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  qword_1EF081328 = (uint64_t)strdup((const char *)objc_msgSend(v2, "UTF8String"));

  abort();
}

@end
