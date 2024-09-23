@implementation ARImageDetectionTechnique

- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3
{
  return -[ARImageDetectionTechnique initWithReferenceImages:maximumNumberOfTrackedImages:](self, "initWithReferenceImages:maximumNumberOfTrackedImages:", a3, 0);
}

- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  ARImageDetectionTechnique *v11;
  __int16 v13;
  __int16 v14;

  v6 = a3;
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imageDetection.fixedPriorityProcessingQueue")))
  {
    ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.technique.imageDetection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ARLogTechnique();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 0;
      v9 = "ARImageDetectionTechnique: Created fixed priority serial queue for image detection";
      v10 = (uint8_t *)&v14;
LABEL_6:
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    }
  }
  else
  {
    ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.technique.imageDetection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ARLogTechnique();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 0;
      v9 = "ARImageDetectionTechnique: Created non-fixed priority serial queue for image detection";
      v10 = (uint8_t *)&v13;
      goto LABEL_6;
    }
  }

  v11 = -[ARImageDetectionTechnique initWithReferenceImages:maximumNumberOfTrackedImages:processingQueue:](self, "initWithReferenceImages:maximumNumberOfTrackedImages:processingQueue:", v6, a4, v7);
  return v11;
}

- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 processingQueue:(id)a5
{
  return -[ARImageDetectionTechnique initWithReferenceImages:maximumNumberOfTrackedImages:continuousDetection:processingQueue:](self, "initWithReferenceImages:maximumNumberOfTrackedImages:continuousDetection:processingQueue:", a3, a4, 1, a5);
}

- (ARImageDetectionTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 continuousDetection:(BOOL)a5 processingQueue:(id)a6
{
  id v10;
  id v11;
  ARImageDetectionTechnique *v12;
  ARImageDetectionTechnique *v13;
  uint64_t v14;
  NSArray *referenceImages;
  dispatch_semaphore_t v16;
  OS_dispatch_semaphore *loadingSemaphore;
  dispatch_semaphore_t v18;
  OS_dispatch_semaphore *dataSemaphore;
  dispatch_semaphore_t v20;
  OS_dispatch_semaphore *detectionSemaphore;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  int v26;
  __int128 v27;
  objc_super v28;

  v10 = a3;
  v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ARImageDetectionTechnique;
  v12 = -[ARImageBasedTechnique init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_maximumNumberOfTrackedImages = a4;
    v12->_continuousDetection = a5;
    v14 = objc_msgSend(v10, "copy");
    referenceImages = v13->_referenceImages;
    v13->_referenceImages = (NSArray *)v14;

    v16 = dispatch_semaphore_create(0);
    loadingSemaphore = v13->_loadingSemaphore;
    v13->_loadingSemaphore = (OS_dispatch_semaphore *)v16;

    dispatch_semaphore_signal((dispatch_semaphore_t)v13->_loadingSemaphore);
    v18 = dispatch_semaphore_create(1);
    dataSemaphore = v13->_dataSemaphore;
    v13->_dataSemaphore = (OS_dispatch_semaphore *)v18;

    v20 = dispatch_semaphore_create(1);
    detectionSemaphore = v13->_detectionSemaphore;
    v13->_detectionSemaphore = (OS_dispatch_semaphore *)v20;

    v13->_finishedLoadingImages = 0;
    v13->_needsWorldTrackingPoseData = 1;
    objc_storeStrong((id *)&v13->_processDataQueue, a6);
    v13->_tracking = a4 > 0;
    v26 = 120;
    std::allocate_shared[abi:ne180100]<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>,std::allocator<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>,int,void>(&v26, &v27);
    std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::operator=[abi:ne180100]((uint64_t)&v13->_poseBuffer, &v27);
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
    if (*((_QWORD *)&v27 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }

  return v13;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (BOOL)syncWithProcessedImage
{
  return self->_tracking || self->_deterministicMode;
}

- (double)requiredTimeInterval
{
  _BOOL4 v2;
  double result;

  v2 = -[ARImageDetectionTechnique syncWithProcessedImage](self, "syncWithProcessedImage");
  result = 0.016;
  if (!v2)
    return 0.0;
  return result;
}

- (int64_t)captureBehavior
{
  return -[ARImageDetectionTechnique syncWithProcessedImage](self, "syncWithProcessedImage");
}

- (BOOL)deterministicMode
{
  return self->_deterministicMode;
}

- (BOOL)finishedLoadingImages
{
  BOOL finishedLoadingImages;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  finishedLoadingImages = self->_finishedLoadingImages;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  return finishedLoadingImages;
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)ARImageDetectionTechnique;
    v5 = -[ARImageBasedTechnique processData:](&v9, sel_processData_, v4);
    v6 = v4;
    if (-[ARImageDetectionTechnique finishedLoadingImages](self, "finishedLoadingImages"))
    {
      if (-[ARImageDetectionTechnique syncWithProcessedImage](self, "syncWithProcessedImage"))
        -[ARImageDetectionTechnique _enqueueImageForTrackingSynced:](self, "_enqueueImageForTrackingSynced:", v6);
      else
        -[ARImageDetectionTechnique _enqueueImageForTrackingNonBlocking:](self, "_enqueueImageForTrackingNonBlocking:", v6);
      if (-[ARImageDetectionTechnique deterministicMode](self, "deterministicMode"))
        dispatch_sync((dispatch_queue_t)self->_processDataQueue, &__block_literal_global_14);
    }
    else
    {
      objc_msgSend(v6, "timestamp");
      -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", MEMORY[0x1E0C9AA60]);
    }
  }
  else
  {
    v7 = v4;
  }

  return v4;
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t i;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  _QWORD *ptr;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  void *__p[2];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  _BYTE buf[22];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v38 = a5;
  if (self->_needsWorldTrackingPoseData)
  {
    v41 = v7;
    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_6);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    -[ARImageDetectionTechnique setCurrentWorldTrackingPose:](self, "setCurrentWorldTrackingPose:", v9, v9);
    if (v9)
    {
      objc_msgSend(v37, "worldTrackingState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "vioTrackingState");

      if (!v12)
      {
        objc_msgSend(v37, "cameraTransform");
        *(_OWORD *)__p = v13;
        v49 = v14;
        v50 = v15;
        v51 = v16;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, 64);
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        arkit::wrapRawData((arkit *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), buf);
        objc_msgSend(v38, "imageData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        ARImageContextFromImageData(v18);
        v20 = v19;

        v47 = v20;
        arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>::insert((_QWORD *)self->_poseBuffer.__ptr_, (std::locale::__imp *)&v47, (char **)buf);
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }

      }
    }
    v21 = objc_msgSend(v41, "count");
    if (v21)
    {
      v40 = v21;
      v22 = 0;
      for (i = 0; i != v40; ++i)
      {
        objc_msgSend(v41, "objectAtIndex:", i);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = v42;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v39 = v24;
          objc_msgSend(v24, "detectedImages");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v44 != v27)
                  objc_enumerationMutation(v25);
                v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                __p[0] = 0;
                __p[1] = 0;
                *(_QWORD *)&v49 = 0;
                ptr = self->_poseBuffer.__ptr_;
                *(_QWORD *)buf = objc_msgSend(v29, "imageContext");
                if (arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>::find(ptr, buf, __p))
                {
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p[0], (char *)__p[1] - (char *)__p[0]);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setWorldTrackingCameraTransformAtDetection:", ARMatrix4x4FromNSData(v31));

                }
                else
                {
                  _ARLogTechnique();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    v33 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v33);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = v34;
                    *(_WORD *)&buf[12] = 2048;
                    *(_QWORD *)&buf[14] = self;
                    _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Could not find a matching pose for image detection, throwing away detection.", buf, 0x16u);

                  }
                  if (!v22)
                    v22 = (void *)objc_opt_new();
                  objc_msgSend(v22, "addIndex:", i);
                }
                if (__p[0])
                {
                  __p[1] = __p[0];
                  operator delete(__p[0]);
                }
              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v26);
          }

        }
      }
      if (v22)
      {
        v35 = (void *)objc_msgSend(v41, "mutableCopy");
        objc_msgSend(v35, "removeObjectsAtIndexes:", v22);

LABEL_36:
        v10 = v35;

        goto LABEL_37;
      }
    }
    else
    {
      v22 = 0;
    }
    v35 = v41;
    goto LABEL_36;
  }
  v10 = v7;
LABEL_37:

  return v10;
}

uint64_t __65__ARImageDetectionTechnique_processResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)_redetectionRequiredForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  BOOL v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "resultDataOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "worldTrackingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "poseGraphUpdated");

  if (v8)
  {
    _ARLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v11;
      v24 = 2048;
      v25 = a1;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Redetection of image anchors is required. Reason: pose-graph update.", (uint8_t *)&v22, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v6, "worldTrackingState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "majorRelocalization");

    if (v13)
    {
      _ARLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v15;
        v24 = 2048;
        v25 = a1;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Redetection of image anchors is required. Reason: Relocalization.", (uint8_t *)&v22, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v6, "worldTrackingState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "vioTrackingState");

      if (!v17)
      {
        v20 = 0;
        goto LABEL_11;
      }
      _ARLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v19;
        v24 = 2048;
        v25 = a1;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Redetection of image anchors is required. Reason: VIO Tracking state changed.", (uint8_t *)&v22, 0x16u);

      }
    }
  }

  v20 = 1;
LABEL_11:

  return v20;
}

- (void)_loadReferenceImagesInBackground
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processDataQueue);
  -[NSArray count](self->_referenceImages, "count");
  kdebug_trace();
  -[NSArray count](self->_referenceImages, "count");
  kdebug_trace();
  -[ARImageDetectionTechnique _addReferenceImagesAppleCV3D](self, "_addReferenceImagesAppleCV3D");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray count](self->_referenceImages, "count");
  objc_msgSend(v3, "code");
  kdebug_trace();
  if (v3)
  {
    -[NSArray count](self->_referenceImages, "count");
    objc_msgSend(v3, "code");
    kdebug_trace();
    -[ARTechnique delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "technique:didFailWithError:", self, v3);

  }
  else
  {
    -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "waitForAllObjectsAddToFinish");

    if ((_DWORD)v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      ARKitCoreBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Reference images could not be loaded due to an unknown error: %d"), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = *MEMORY[0x1E0CB2D80];
      +[ARODTHandleManager suggestionInternalError](ARODTHandleManager, "suggestionInternalError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = *MEMORY[0x1E0CB2D68];
      v16[0] = v11;
      v16[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      ARErrorWithCodeAndUserInfo(151, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARTechnique delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "technique:didFailWithError:", self, v13);

    }
    -[NSArray count](self->_referenceImages, "count");
    kdebug_trace();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    self->_finishedLoadingImages = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  }

}

- (void)_loadReferenceImages
{
  void *v3;
  OS_dispatch_semaphore *v4;
  NSObject *processDataQueue;
  _QWORD v6[4];
  id v7;
  id location;

  -[ARImageDetectionTechnique referenceImageMap](self, "referenceImageMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = self->_loadingSemaphore;
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)v4, 0))
    {
      objc_initWeak(&location, self);
      processDataQueue = self->_processDataQueue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __49__ARImageDetectionTechnique__loadReferenceImages__block_invoke;
      v6[3] = &unk_1E66723F8;
      objc_copyWeak(&v7, &location);
      dispatch_async(processDataQueue, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }

  }
}

void __49__ARImageDetectionTechnique__loadReferenceImages__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadReferenceImagesInBackground");

}

- (void)prepare:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  ARODTHandleManager *v6;
  ARODTHandleManager *odtTHandleManger;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  ARImageDetectionTechnique *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    self->_deterministicMode = v3;
    v6 = -[ARODTHandleManager initWithMaximumNumberOfTrackedImages:continuousDetection:deterministicMode:]([ARODTHandleManager alloc], "initWithMaximumNumberOfTrackedImages:continuousDetection:deterministicMode:", self->_maximumNumberOfTrackedImages, self->_continuousDetection, v3);
    odtTHandleManger = self->_odtTHandleManger;
    self->_odtTHandleManger = v6;

    -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      _ARLogTechnique();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v11;
        v14 = 2048;
        v15 = self;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection.", (uint8_t *)&v12, 0x16u);

      }
    }
    -[ARImageDetectionTechnique _loadReferenceImages](self, "_loadReferenceImages");
    if (-[ARImageDetectionTechnique deterministicMode](self, "deterministicMode"))
      dispatch_sync((dispatch_queue_t)self->_processDataQueue, &__block_literal_global_19);
  }
}

- (id)_addReferenceImagesAppleCV3D
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSArray *obj;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (id)objc_opt_new();
  v4 = (id)objc_opt_new();
  v22 = 0;
  v23 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_referenceImages;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      v8 = v4;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "addReferenceImage:tracking:pObjectID:", v10, 1, &v22);

        v16 = v8;
        v17 = v9;
        +[ARODTHandleManager accumulateReferenceImageErrorsForResult:refImage:objectID:pReferenceImageMap:pFailedReferenceImageNames:pUserErrorType:](ARODTHandleManager, "accumulateReferenceImageErrorsForResult:refImage:objectID:pReferenceImageMap:pFailedReferenceImageNames:pUserErrorType:", v12, v10, v22, &v17, &v16, &v23);
        v3 = v17;

        v4 = v16;
        ++v22;
        ++v7;
        v8 = v4;
        v9 = v3;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

  objc_storeStrong((id *)&self->_referenceImageMap, v3);
  +[ARODTHandleManager handleAccumulatedErrorType:failedReferenceImageNames:](ARODTHandleManager, "handleAccumulatedErrorType:failedReferenceImageNames:", v23, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_enqueueImageForTrackingSynced:(id)a3
{
  id v4;
  void *v5;
  NSObject *processDataQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  processDataQueue = self->_processDataQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ARImageDetectionTechnique__enqueueImageForTrackingSynced___block_invoke;
  v9[3] = &unk_1E6672D40;
  objc_copyWeak(&v12, &location);
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(processDataQueue, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __60__ARImageDetectionTechnique__enqueueImageForTrackingSynced___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "deterministicMode");
    v5 = 0.0;
    if ((v4 & 1) != 0
      || (objc_msgSend(v3, "requiredTimeInterval", 0.0),
          v7 = v6,
          objc_msgSend(a1[4], "timeIntervalSinceNow"),
          v5 = v7 + v8 + -0.002,
          v5 > 0.0))
    {
      objc_msgSend(v3, "_trackImagesWithImageData:timeBudget:", a1[5], v5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
      {
        v12[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C9AA60];
      }
      objc_msgSend(a1[5], "timestamp");
      objc_msgSend(v3, "pushResultData:forTimestamp:", v11);

    }
  }

}

- (void)_enqueueImageForTrackingNonBlocking:(id)a3
{
  id v4;
  OS_dispatch_semaphore *v5;
  NSObject *processDataQueue;
  _QWORD v7[4];
  OS_dispatch_semaphore *v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = self->_detectionSemaphore;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v5, 0))
  {
    objc_initWeak(&location, self);
    processDataQueue = self->_processDataQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__ARImageDetectionTechnique__enqueueImageForTrackingNonBlocking___block_invoke;
    v7[3] = &unk_1E6672D40;
    objc_copyWeak(&v10, &location);
    v8 = v5;
    v9 = v4;
    dispatch_async(processDataQueue, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __65__ARImageDetectionTechnique__enqueueImageForTrackingNonBlocking___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_trackImagesWithImageData:timeBudget:", *(_QWORD *)(a1 + 40), 0.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v7[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pushResultData:forFrame:", v6, 0);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

- (id)_trackImagesWithImageData:(id)a3 timeBudget:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  int v26;
  void *v27;
  unint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 needsWorldTrackingPoseData;
  void *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  ARImageDetectionTechnique *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v42 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timestamp");
    -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maximumNumberOfTrackedImages");
    kdebug_trace();

    _ARLogTechnique();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[ARImageDetectionTechnique enableAutomaticImageScaleEstimation](self, "enableAutomaticImageScaleEstimation");
      v12 = CFSTR("OFF");
      *(_DWORD *)buf = 138543874;
      v46 = v10;
      if (v11)
        v12 = CFSTR("ON");
      v47 = 2048;
      v48 = self;
      v49 = 2112;
      v50 = v12;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Attempting to track planar object. Automatic scale estimation = %@", buf, 0x20u);

    }
    if (-[ARImageDetectionTechnique enableAutomaticImageScaleEstimation](self, "enableAutomaticImageScaleEstimation"))
    {
      -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageDetectionTechnique currentWorldTrackingPose](self, "currentWorldTrackingPose");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ARImageContextFromImageData(v42);
      v44 = 0;
      v16 = objc_msgSend(v13, "trackPlanarObjectAndEstimateScaleForImageData:worldTrackingPose:imageContext:timeBudget:pResultArray:", v42, v14, v15, &v44, a4);
      v17 = v44;

    }
    else
    {
      -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ARImageContextFromImageData(v42);
      v43 = 0;
      v16 = objc_msgSend(v13, "trackPlanarObjectForImageData:imageContext:timeBudget:pResultArray:", v42, v19, &v43, a4);
      v17 = v43;
    }

    if (v16)
    {
      _ARLogTechnique();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v22;
        v47 = 2048;
        v48 = self;
        v49 = 1024;
        LODWORD(v50) = v16;
        _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tracking failed with error %d.", buf, 0x1Cu);

      }
    }
    objc_msgSend(v42, "timestamp");
    objc_msgSend(v17, "count");
    kdebug_trace();
    _ARLogTechnique();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138543874;
      v46 = v25;
      v47 = 2048;
      v48 = self;
      v49 = 1024;
      LODWORD(v50) = v26;
      _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tracking %d images", buf, 0x1Cu);

    }
    v27 = (void *)objc_opt_new();
    for (i = 0; objc_msgSend(v17, "count") > i; ++i)
    {
      -[ARImageDetectionTechnique referenceImageMap](self, "referenceImageMap");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v17, "objectAtIndexedSubscript:", i);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v31, "detectedObjectID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)objc_opt_new();
      objc_msgSend(v17, "objectAtIndexedSubscript:", i);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "visionTransform");
      objc_msgSend(v34, "setVisionTransform:");

      objc_msgSend(v17, "objectAtIndexedSubscript:", i);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setImageContext:", objc_msgSend(v36, "imageContext"));

      objc_msgSend(v34, "setReferenceImage:", v33);
      objc_msgSend(v17, "objectAtIndexedSubscript:", i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "estimatedScaleFactor");
      objc_msgSend(v34, "setEstimatedScaleFactor:");

      objc_msgSend(v17, "objectAtIndexedSubscript:", i);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setOdtObjectIdentifer:", objc_msgSend(v38, "detectedObjectID"));

      objc_msgSend(v27, "addObject:", v34);
    }
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setDetectedImages:", v27);
    objc_msgSend(v18, "setProvidesWorldTrackingCameraPose:", self->_needsWorldTrackingPoseData);
    -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "maximumNumberOfTrackedImages"))
      needsWorldTrackingPoseData = 0;
    else
      needsWorldTrackingPoseData = self->_needsWorldTrackingPoseData;
    objc_msgSend(v18, "setDetectionOnly:", needsWorldTrackingPoseData);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)setPowerUsage:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARImageDetectionTechnique;
  -[ARTechnique setPowerUsage:](&v6, sel_setPowerUsage_);
  -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePowerUsage:", a3);

}

- (id)predictAtTimeStamp:(double)a3 timeBudget:(double)a4 predictedWorldTrackingPose:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  _BOOL4 needsWorldTrackingPoseData;
  objc_class *v22;
  void *v23;
  int v24;
  unint64_t v25;
  __int128 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  ARImageDetectionTechnique *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "maximumNumberOfTrackedImages"))
  {

  }
  else
  {
    needsWorldTrackingPoseData = self->_needsWorldTrackingPoseData;

    if (needsWorldTrackingPoseData)
    {
      v20 = 0;
      goto LABEL_26;
    }
  }
  _ARLogTechnique();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v12;
    v46 = 2048;
    v47 = self;
    _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Attempting to predict planar object", buf, 0x16u);

  }
  -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v14 = objc_msgSend(v13, "predictPlanarObjectsAtTimestamp:worldTrackingPose:timeBudget:pResultArray:", 0, &v43, a3, a4);
  v15 = v43;

  _ARLogTechnique();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v19;
      v46 = 2048;
      v47 = self;
      v48 = 1024;
      v49 = v14;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Prediction failed with error %d.", buf, 0x1Cu);

    }
    v20 = 0;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 138543874;
      v45 = v23;
      v46 = 2048;
      v47 = self;
      v48 = 1024;
      v49 = v24;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Prediction %d images", buf, 0x1Cu);

    }
    v17 = objc_opt_new();
    v25 = 0;
    *(_QWORD *)&v26 = 138543618;
    v42 = v26;
    while (objc_msgSend(v15, "count", v42) > v25)
    {
      -[ARImageDetectionTechnique referenceImageMap](self, "referenceImageMap");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "detectedObjectID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v32 = objc_opt_new();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "visionTransform");
        -[NSObject setVisionTransform:](v32, "setVisionTransform:");

        objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setImageContext:](v32, "setImageContext:", objc_msgSend(v34, "imageContext"));

        -[NSObject setReferenceImage:](v32, "setReferenceImage:", v31);
        objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "estimatedScaleFactor");
        -[NSObject setEstimatedScaleFactor:](v32, "setEstimatedScaleFactor:");

        objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setOdtObjectIdentifer:](v32, "setOdtObjectIdentifer:", objc_msgSend(v36, "detectedObjectID"));

        if (v8)
        {
          objc_msgSend(v8, "cameraTransform");
          -[NSObject setWorldTrackingCameraTransformAtDetection:](v32, "setWorldTrackingCameraTransformAtDetection:");
          -[NSObject addObject:](v17, "addObject:", v32);
        }
      }
      else
      {
        _ARLogTechnique();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v42;
          v45 = v38;
          v46 = 2048;
          v47 = self;
          _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: No matching reference image found, throwing away prediction.", buf, 0x16u);

        }
      }

      ++v25;
    }
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setDetectedImages:", v17);
    objc_msgSend(v20, "setProvidesWorldTrackingCameraPose:", self->_needsWorldTrackingPoseData);
    -[ARImageDetectionTechnique odtTHandleManger](self, "odtTHandleManger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "maximumNumberOfTrackedImages"))
      v40 = 0;
    else
      v40 = self->_needsWorldTrackingPoseData;
    objc_msgSend(v20, "setDetectionOnly:", v40);

    objc_msgSend(v20, "setPredicted:", 1);
  }

LABEL_26:
  return v20;
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (_QWORD)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARImageDetectionTechnique;
  if (-[ARTechnique isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[NSArray isEqual:](self->_referenceImages, "isEqual:", v5[11])
      && self->_needsWorldTrackingPoseData == *((unsigned __int8 *)v5 + 176)
      && self->_enableAutomaticImageScaleEstimation == *((unsigned __int8 *)v5 + 177)
      && self->_maximumNumberOfTrackedImages == v5[18]
      && self->_continuousDetection == *((unsigned __int8 *)v5 + 152);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)enableAutomaticImageScaleEstimation
{
  return self->_enableAutomaticImageScaleEstimation;
}

- (void)setEnableAutomaticImageScaleEstimation:(BOOL)a3
{
  self->_enableAutomaticImageScaleEstimation = a3;
}

- (ARWorldTrackingPoseData)currentWorldTrackingPose
{
  return (ARWorldTrackingPoseData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCurrentWorldTrackingPose:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (ARODTHandleManager)odtTHandleManger
{
  return (ARODTHandleManager *)objc_getProperty(self, a2, 192, 1);
}

- (NSDictionary)referenceImageMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceImageMap, 0);
  objc_storeStrong((id *)&self->_odtTHandleManger, 0);
  objc_storeStrong((id *)&self->_currentWorldTrackingPose, 0);
  std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_poseBuffer);
  objc_storeStrong((id *)&self->_referenceImageData, 0);
  objc_storeStrong((id *)&self->_detectionSemaphore, 0);
  objc_storeStrong((id *)&self->_dataSemaphore, 0);
  objc_storeStrong((id *)&self->_loadingSemaphore, 0);
  objc_storeStrong((id *)&self->_processDataQueue, 0);
  objc_storeStrong((id *)&self->_referenceImages, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  return self;
}

@end
