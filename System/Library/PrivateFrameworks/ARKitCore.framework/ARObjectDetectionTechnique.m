@implementation ARObjectDetectionTechnique

- (ARObjectDetectionTechnique)initWithDetectionObjects:(id)a3
{
  id v4;
  ARObjectDetectionTechnique *v5;
  uint64_t v6;
  NSArray *detectionObjects;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *dataSemaphore;
  uint64_t v10;
  OS_dispatch_queue *loadObjectsQueue;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *detectionSemaphore;
  uint64_t v14;
  OS_dispatch_queue *processDataQueue;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARObjectDetectionTechnique;
  v5 = -[ARImageBasedTechnique init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    detectionObjects = v5->_detectionObjects;
    v5->_detectionObjects = (NSArray *)v6;

    v8 = dispatch_semaphore_create(1);
    dataSemaphore = v5->_dataSemaphore;
    v5->_dataSemaphore = (OS_dispatch_semaphore *)v8;

    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.technique.objectDetection");
    v10 = objc_claimAutoreleasedReturnValue();
    loadObjectsQueue = v5->_loadObjectsQueue;
    v5->_loadObjectsQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_semaphore_create(1);
    detectionSemaphore = v5->_detectionSemaphore;
    v5->_detectionSemaphore = (OS_dispatch_semaphore *)v12;

    ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.technique.objectDetection");
    v14 = objc_claimAutoreleasedReturnValue();
    processDataQueue = v5->_processDataQueue;
    v5->_processDataQueue = (OS_dispatch_queue *)v14;

  }
  return v5;
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (void)prepare:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  ARODTHandleManager *v6;
  ARODTHandleManager *v7;
  ARODTHandleManager *odtHandleManager;
  NSObject *loadObjectsQueue;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARObjectDetectionTechnique *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_odtHandleManager)
  {
    v3 = a3;
    v5 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.objctdetection.regionProposalModel"));
    v6 = [ARODTHandleManager alloc];
    if (v5)
      v7 = -[ARODTHandleManager initWithRegionProposalModelAndDeterministicMode:](v6, "initWithRegionProposalModelAndDeterministicMode:", v3);
    else
      v7 = -[ARODTHandleManager initWithDeterministicMode:](v6, "initWithDeterministicMode:", v3);
    odtHandleManager = self->_odtHandleManager;
    self->_odtHandleManager = v7;

    self->_deterministicMode = v3;
    objc_initWeak(&location, self);
    loadObjectsQueue = self->_loadObjectsQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __38__ARObjectDetectionTechnique_prepare___block_invoke;
    v13[3] = &unk_1E66723F8;
    objc_copyWeak(&v14, &location);
    dispatch_async(loadObjectsQueue, v13);
    if (self->_deterministicMode)
      dispatch_sync((dispatch_queue_t)self->_loadObjectsQueue, &__block_literal_global_108);
    if (_ARLogTechnique(void)::onceToken != -1)
      dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_70);
    v10 = (id)_ARLogTechnique(void)::logObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2048;
      v19 = self;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: prepared.", buf, 0x16u);

    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __38__ARObjectDetectionTechnique_prepare___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadReferenceObjects");

}

- (void)_loadReferenceObjects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *obj;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[ARObjectDetectionTechnique finishedLoadingObjects](self, "finishedLoadingObjects"))
  {
    -[NSArray count](self->_detectionObjects, "count");
    kdebug_trace();
    -[ARObjectDetectionTechnique setFinishedLoadingObjects:](self, "setFinishedLoadingObjects:", 0);
    v3 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = self->_detectionObjects;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v14;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
          v12 = 0;
          if (-[ARODTHandleManager addReferenceObject:tracking:pObjectID:](self->_odtHandleManager, "addReferenceObject:tracking:pObjectID:", v7, 0, &v12))
          {
            -[ARTechnique delegate](self, "delegate");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            ARErrorWithCodeAndUserInfo(301, 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "technique:didFailWithError:", self, v9);

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v7, v10);

          ++v6;
        }
        while (v4 != v6);
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

    objc_storeStrong((id *)&self->_referenceObjecteMap, v3);
    -[ARODTHandleManager waitForAllObjectsAddToFinish](self->_odtHandleManager, "waitForAllObjectsAddToFinish");
    -[ARObjectDetectionTechnique setFinishedLoadingObjects:](self, "setFinishedLoadingObjects:", 1);
    kdebug_trace();

  }
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_6_2);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ARObjectDetectionTechnique setCurrentWorldTrackingPose:](self, "setCurrentWorldTrackingPose:", v8);

  return v6;
}

uint64_t __66__ARObjectDetectionTechnique_processResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
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
    v9.super_class = (Class)ARObjectDetectionTechnique;
    v5 = -[ARImageBasedTechnique processData:](&v9, sel_processData_, v4);
    v6 = v4;
    if (-[ARObjectDetectionTechnique finishedLoadingObjects](self, "finishedLoadingObjects"))
    {
      -[ARObjectDetectionTechnique _enqueueObjectForDetectionNonBlocking:](self, "_enqueueObjectForDetectionNonBlocking:", v6);
      if (self->_deterministicMode)
        dispatch_sync((dispatch_queue_t)self->_processDataQueue, &__block_literal_global_11_1);
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

- (void)_enqueueObjectForDetectionNonBlocking:(id)a3
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
    v7[2] = __68__ARObjectDetectionTechnique__enqueueObjectForDetectionNonBlocking___block_invoke;
    v7[3] = &unk_1E6672D40;
    objc_copyWeak(&v10, &location);
    v8 = v5;
    v9 = v4;
    dispatch_async(processDataQueue, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __68__ARObjectDetectionTechnique__enqueueObjectForDetectionNonBlocking___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_processImageDataInBackgound:", *(_QWORD *)(a1 + 40));
  else
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_processImageDataInBackgound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  ARODTHandleManager *odtHandleManager;
  void *v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  objc_class *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  id v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  ARObjectDetectionTechnique *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processDataQueue);
  objc_msgSend(v4, "timestamp");
  kdebug_trace();
  -[ARObjectDetectionTechnique currentWorldTrackingPose](self, "currentWorldTrackingPose");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_3;
  -[ARObjectDetectionTechnique currentWorldTrackingPose](self, "currentWorldTrackingPose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "worldTrackingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "vioTrackingState");

  if (!v8)
  {
    odtHandleManager = self->_odtHandleManager;
    -[ARObjectDetectionTechnique currentWorldTrackingPose](self, "currentWorldTrackingPose");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    LODWORD(odtHandleManager) = -[ARODTHandleManager detectReferenceObjectsForImageData:worldTrackingPose:imageContext:pResultArray:](odtHandleManager, "detectReferenceObjectsForImageData:worldTrackingPose:imageContext:pResultArray:", v4, v11, 0, &v29);
    v9 = v29;

    if ((_DWORD)odtHandleManager)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_detectionSemaphore);
      if (self->_deterministicMode)
        -[ARImageBasedTechnique pushResultData:forFrame:](self, "pushResultData:forFrame:", MEMORY[0x1E0C9AA60], 0);
    }
    else
    {
      v12 = (void *)objc_opt_new();
      v13 = 0;
      *(_QWORD *)&v14 = 138543874;
      v28 = v14;
      while (objc_msgSend(v9, "count", v28) > v13)
      {
        -[ARObjectDetectionTechnique referenceObjecteMap](self, "referenceObjecteMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "detectedObjectID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = objc_opt_new();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "visionTransform");
          -[NSObject setVisionTransform:](v20, "setVisionTransform:");

          -[NSObject setReferenceObject:](v20, "setReferenceObject:", v19);
          objc_msgSend(v12, "addObject:", v20);
        }
        else
        {
          if (_ARLogGeneral(void)::onceToken != -1)
            dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_73);
          v20 = (id)_ARLogGeneral(void)::logObj;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "detectedObjectID");
            *(_DWORD *)buf = v28;
            v32 = v23;
            v33 = 2048;
            v34 = self;
            v35 = 2048;
            v36 = v25;
            _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unknown 'detectedObjectID' %llu encountered.", buf, 0x20u);

          }
        }

        ++v13;
      }
      if (objc_msgSend(v12, "count"))
      {
        v26 = (void *)objc_opt_new();
        objc_msgSend(v26, "setDetectedObjects:", v12);
        v30 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageBasedTechnique pushResultData:forFrame:](self, "pushResultData:forFrame:", v27, 0);

      }
      else if (self->_deterministicMode)
      {
        -[ARImageBasedTechnique pushResultData:forFrame:](self, "pushResultData:forFrame:", MEMORY[0x1E0C9AA60], 0);
      }
      objc_msgSend(v4, "timestamp");
      objc_msgSend(v9, "count");
      kdebug_trace();
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_detectionSemaphore);

    }
  }
  else
  {
LABEL_3:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_detectionSemaphore);
    if (self->_deterministicMode)
      -[ARImageBasedTechnique pushResultData:forFrame:](self, "pushResultData:forFrame:", MEMORY[0x1E0C9AA60], 0);
    v9 = 0;
  }

}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (_QWORD)a3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *detectionObjects;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARObjectDetectionTechnique;
  if (-[ARTechnique isEqual:](&v8, sel_isEqual_, v4))
  {
    detectionObjects = self->_detectionObjects;
    if (detectionObjects == (NSArray *)v4[19])
      v6 = 1;
    else
      v6 = -[NSArray isEqual:](detectionObjects, "isEqual:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)referenceObjecteMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)finishedLoadingObjects
{
  return self->_finishedLoadingObjects;
}

- (void)setFinishedLoadingObjects:(BOOL)a3
{
  self->_finishedLoadingObjects = a3;
}

- (NSArray)detectionObjects
{
  return self->_detectionObjects;
}

- (ARWorldTrackingPoseData)currentWorldTrackingPose
{
  return (ARWorldTrackingPoseData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentWorldTrackingPose:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentWorldTrackingPose, 0);
  objc_storeStrong((id *)&self->_detectionObjects, 0);
  objc_storeStrong((id *)&self->_referenceObjecteMap, 0);
  objc_storeStrong((id *)&self->_processDataQueue, 0);
  objc_storeStrong((id *)&self->_detectionSemaphore, 0);
  objc_storeStrong((id *)&self->_odtHandleManager, 0);
  objc_storeStrong((id *)&self->_latestResultData, 0);
  objc_storeStrong((id *)&self->_loadObjectsQueue, 0);
  objc_storeStrong((id *)&self->_dataSemaphore, 0);
}

@end
