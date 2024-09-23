@implementation VNSession

- (id)detectorOfType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  +[VNDetector detectorClassAndConfigurationOptions:forDetectorType:options:error:](VNDetector, "detectorClassAndConfigurationOptions:forDetectorType:options:error:", 0, v8, v9, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[VNSession detectorOfClass:configuredWithOptions:error:](self, "detectorOfClass:configuredWithOptions:error:", v10, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  -[objc_class fullyPopulatedConfigurationOptionsWithOverridingOptions:](a3, "fullyPopulatedConfigurationOptionsWithOverridingOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("VNDetectorProcessOption_Session"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("VNDetectorProcessOption_Canceller"));
  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detectorAccessingLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "lock");
  -[VNSession _locateDetectorOfClass:configuredWithOptions:allowingCreation:error:]((uint64_t)self, (uint64_t)a3, v9, 1, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

  return v12;
}

- (id)_locateDetectorOfClass:(void *)a3 configuredWithOptions:(int)a4 allowingCreation:(_QWORD *)a5 error:
{
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = a3;
  if (a1)
  {
    if (a4)
      v10 = 0;
    else
      v10 = a5;
    objc_msgSend(*(id *)(a1 + 24), "detectorOfClass:configuredWithOptions:error:", a2, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 && (a4 & 1) != 0)
    {
      -[VNSession _frameworkManagerWithError:](a1, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "detectorOfClass:configuredWithOptions:forSession:error:", a2, v9, a1, a5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(*(id *)(a1 + 24), "cacheDetector:", v11);
      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_frameworkManagerWithError:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else if (a2)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("framework manager is unavailable"));
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  -[VNDetectorCache releaseDetectorsThatCanBeReplacedByDetectorOfClass:withConfiguration:](self->_detectorCache_onlyAccessWithDetectorAccessingLock, "releaseDetectorsThatCanBeReplacedByDetectorOfClass:withConfiguration:", a3, a4);
}

- (void)detectorCache:(id)a3 didCacheDetector:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "VNClassCode");
  kdebug_trace();

}

- (id)vnvtSessionManager
{
  return self->_vtSessionManager;
}

- (id)vncvPixelBufferPoolManager
{
  return self->_cvPixelBufferPoolManager;
}

- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  id v7;
  VNRequestPerformingContext *v8;
  VNRequestPerformingContext *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  id v16;
  void *v17;
  int v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  VNRequestPerformer *v33;
  id v34;
  void *v35;
  void *context;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  context = (void *)MEMORY[0x1A1B0B060]();
  if (v5)
  {
    v44 = 0;
    v6 = +[VNValidationUtilities validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:](VNValidationUtilities, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v5, CFSTR("requests"), objc_opt_class(), 0, 0, &v44);
    v7 = v44;
    if (v6)
    {
      v33 = objc_alloc_init(VNRequestPerformer);
      v8 = -[VNRequestPerformingContext initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:]([VNRequestPerformingContext alloc], "initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:", self, v33, 0, 0, 0);
      v9 = v8;
      -[VNRequestPerformingContext qosClass](v8, "qosClass");
      v43 = v7;
      -[VNRequestPerformer dependencyAnalyzedRequestsForRequests:withPerformingContext:error:](v33, "dependencyAnalyzedRequestsForRequests:withPerformingContext:error:", v5, v8, &v43);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v43;

      if (v35)
      {
        -[VNRequestPerformer orderedRequestsForRequests:](v33, "orderedRequestsForRequests:");
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v40;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v40 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              v38 = 0;
              v15 = objc_msgSend(v14, "warmUpSession:error:", self, &v38);
              v16 = v38;
              v17 = v16;
              if ((v15 & 1) == 0)
              {
                v20 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v17, "localizedDescription");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = v9;
                v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@ could not be warmed up (%@)"), v14, v21);

                v23 = objc_retainAutorelease(v22);
                v24 = objc_msgSend(v23, "UTF8String");
                VNValidatedLog(4, (uint64_t)CFSTR("%s"), v25, v26, v27, v28, v29, v30, v24);
                +[VNError errorForOperationFailedErrorWithLocalizedDescription:underlyingError:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:underlyingError:", v23, v17);
                v31 = objc_claimAutoreleasedReturnValue();

                v18 = 0;
                v34 = (id)v31;
                goto LABEL_16;
              }

            }
            v8 = v9;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
            if (v11)
              continue;
            break;
          }
        }
        v18 = 1;
LABEL_16:

      }
      else
      {
        v18 = 0;
      }

      v19 = v18 != 0;
      v7 = v34;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v7 = 0;
    v19 = 1;
  }
  objc_autoreleasePoolPop(context);
  if (!v5)
    v19 = 1;
  if (a4 && !v19)
    *a4 = objc_retainAutorelease(v7);

  return v19;
}

+ (id)globalSession
{
  if (+[VNSession globalSession]::onceToken != -1)
    dispatch_once(&+[VNSession globalSession]::onceToken, &__block_literal_global_21775);
  return (id)+[VNSession globalSession]::ourGlobalSession;
}

void __26__VNSession_globalSession__block_invoke()
{
  _VNGlobalSession *v0;
  void *v1;

  v0 = objc_alloc_init(_VNGlobalSession);
  v1 = (void *)+[VNSession globalSession]::ourGlobalSession;
  +[VNSession globalSession]::ourGlobalSession = (uint64_t)v0;

}

- (VNSession)init
{
  return -[VNSession initWithCachingBehavior:](self, "initWithCachingBehavior:", 1);
}

- (VNSession)initWithCachingBehavior:(unint64_t)a3
{
  VNSession *v3;
  void *v4;
  VNDetectorCache *v5;
  VNDetectorCache *detectorCache_onlyAccessWithDetectorAccessingLock;
  VNRPNTrackerEspressoResourcesCache *v7;
  VNRPNTrackerEspressoResourcesCache *trackerResourceCache;
  VNVTSessionManager *v9;
  VNVTSessionManager *vtSessionManager;
  VNCIContextManager *v11;
  VNCIContextManager *ciContextManager;
  VNCVPixelBufferPoolManager *v13;
  VNCVPixelBufferPoolManager *cvPixelBufferPoolManager;
  VNTrackerManager *v15;
  VNTrackerManager *trackerManager;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VNSession;
  v3 = -[VNSession init](&v18, sel_init, a3);
  if (v3)
  {
    +[VNFrameworkManager manager](VNFrameworkManager, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", v4 != 0, CFSTR("Cannot create framework manager singleton"));
    objc_storeWeak((id *)&v3->_frameworkManager, v4);
    v5 = objc_alloc_init(VNDetectorCache);
    detectorCache_onlyAccessWithDetectorAccessingLock = v3->_detectorCache_onlyAccessWithDetectorAccessingLock;
    v3->_detectorCache_onlyAccessWithDetectorAccessingLock = v5;

    -[VNDetectorCache setDelegate:](v3->_detectorCache_onlyAccessWithDetectorAccessingLock, "setDelegate:", v3);
    v7 = objc_alloc_init(VNRPNTrackerEspressoResourcesCache);
    trackerResourceCache = v3->_trackerResourceCache;
    v3->_trackerResourceCache = v7;

    v9 = objc_alloc_init(VNVTSessionManager);
    vtSessionManager = v3->_vtSessionManager;
    v3->_vtSessionManager = v9;

    v11 = objc_alloc_init(VNCIContextManager);
    ciContextManager = v3->_ciContextManager;
    v3->_ciContextManager = v11;

    v13 = objc_alloc_init(VNCVPixelBufferPoolManager);
    cvPixelBufferPoolManager = v3->_cvPixelBufferPoolManager;
    v3->_cvPixelBufferPoolManager = v13;

    v15 = objc_alloc_init(VNTrackerManager);
    trackerManager = v3->_trackerManager;
    v3->_trackerManager = v15;

    kdebug_trace();
    objc_msgSend(v4, "registerSession:", v3);

  }
  return v3;
}

- (id)_cachedDetectorOfClass:(Class)a3 configuredWithOptions:(id)a4
{
  -[VNSession _locateDetectorOfClass:configuredWithOptions:allowingCreation:error:]((uint64_t)self, (uint64_t)a3, a4, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)trackerClassForOptions:(id)a3 error:(id *)a4
{
  +[VNTrackerManager trackerClassForOptions:error:]((uint64_t)VNTrackerManager, a3, a4);
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)MEMORY[0x1A1B0B060](-[VNSession releaseCachedResources](self, "releaseCachedResources"));
  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  kdebug_trace();

  v6.receiver = self;
  v6.super_class = (Class)VNSession;
  -[VNSession dealloc](&v6, sel_dealloc);
}

- (id)_locateResourceObjectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  VisionCoreObjectCache *v10;
  VisionCoreObjectCache *resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v18;
  VNSession *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  if (!self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock)
  {
    v10 = (VisionCoreObjectCache *)objc_alloc_init(MEMORY[0x1E0DC6CA0]);
    resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock = self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock;
    self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock = v10;

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__VNSession__locateResourceObjectForIdentifier_creationBlock_error___block_invoke;
  aBlock[3] = &unk_1E4546AF0;
  v12 = v8;
  v18 = v12;
  v19 = self;
  v13 = v9;
  v20 = v13;
  v14 = _Block_copy(aBlock);
  -[VisionCoreObjectCache objectForIdentifier:creationBlock:error:](self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock, "objectForIdentifier:creationBlock:error:", v12, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)createRPNTrackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4
{
  -[VNRPNTrackerEspressoResourcesCache createRPNTrackerResourcesConfiguredWithOptions:error:](self->_trackerResourceCache, "createRPNTrackerResourcesConfiguredWithOptions:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)vnciContextManager
{
  return self->_ciContextManager;
}

- (void)releaseCachedResources
{
  VNVTSessionManager *vtSessionManager;
  void *value;
  void *v5;
  VNCIContextManager *ciContextManager;
  VNCVPixelBufferPoolManager *cvPixelBufferPoolManager;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<apple::vision::BufferSizeFormat, __CVPixelBufferPool *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<apple::vision::BufferSizeFormat, __CVPixelBufferPool *>, void *>>> *p_p1;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<apple::vision::BufferSizeFormat, __CVPixelBufferPool *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<apple::vision::BufferSizeFormat, __CVPixelBufferPool *>, void *>>> *i;
  _QWORD *next;
  _QWORD *v11;
  unint64_t v12;
  uint64_t j;
  VNTrackerManager *trackerManager;
  NSObject *trackersCollectionManagementQueue;
  void *v16;
  VisionCoreObjectCache *resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock;
  id v18;
  _QWORD block[5];

  -[VNSession _releaseAllDetectors]((uint64_t)self);
  -[VNRPNTrackerEspressoResourcesCache releaseCachedResources](self->_trackerResourceCache, "releaseCachedResources");
  vtSessionManager = self->_vtSessionManager;
  if (vtSessionManager)
  {
    value = vtSessionManager->_pixelTransferSessionsHandler.__ptr_.__value_;
    os_unfair_lock_lock((os_unfair_lock_t)value + 4);
    objc_msgSend(*((id *)value + 3), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)value + 4);
    v5 = vtSessionManager->_pixelRotationSessionsHandler.__ptr_.__value_;
    os_unfair_lock_lock((os_unfair_lock_t)v5 + 4);
    objc_msgSend(*((id *)v5 + 3), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)v5 + 4);
  }
  ciContextManager = self->_ciContextManager;
  if (ciContextManager)
  {
    -[VNCIContextsHandler releaseCachedResources]((uint64_t)ciContextManager->_cpuContextsHandler);
    os_unfair_lock_lock(&ciContextManager->_gpuHandlersLock);
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](ciContextManager->_gpuContextsHandlers, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_22925);
    os_unfair_lock_unlock(&ciContextManager->_gpuHandlersLock);
  }
  cvPixelBufferPoolManager = self->_cvPixelBufferPoolManager;
  if (cvPixelBufferPoolManager)
  {
    os_unfair_lock_lock(&cvPixelBufferPoolManager->_poolsLock);
    p_p1 = &cvPixelBufferPoolManager->_pools.__table_.__p1_;
    for (i = &cvPixelBufferPoolManager->_pools.__table_.__p1_;
          ;
          CVPixelBufferPoolRelease((CVPixelBufferPoolRef)i[5].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<apple::vision::BufferSizeFormat, __CVPixelBufferPool *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<apple::vision::BufferSizeFormat, __CVPixelBufferPool *>, void *>>> *)i->__value_.__next_;
      if (!i)
        break;
    }
    if (cvPixelBufferPoolManager->_pools.__table_.__p2_.__value_)
    {
      next = p_p1->__value_.__next_;
      if (p_p1->__value_.__next_)
      {
        do
        {
          v11 = (_QWORD *)*next;
          operator delete(next);
          next = v11;
        }
        while (v11);
      }
      cvPixelBufferPoolManager->_pools.__table_.__p1_.__value_.__next_ = 0;
      v12 = cvPixelBufferPoolManager->_pools.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (v12)
      {
        for (j = 0; j != v12; ++j)
          cvPixelBufferPoolManager->_pools.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
      }
      cvPixelBufferPoolManager->_pools.__table_.__p2_.__value_ = 0;
    }
    os_unfair_lock_unlock(&cvPixelBufferPoolManager->_poolsLock);
  }
  trackerManager = self->_trackerManager;
  if (trackerManager)
  {
    trackersCollectionManagementQueue = trackerManager->_trackersCollectionManagementQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__VNTrackerManager_releaseAllTrackers__block_invoke;
    block[3] = &unk_1E45455C8;
    block[4] = trackerManager;
    dispatch_sync(trackersCollectionManagementQueue, block);
  }
  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sessionResourcesAccessingLock");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "lock");
  resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock = self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock;
  self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock = 0;

  objc_msgSend(v18, "unlock");
}

- (void)releaseCachedResourcesWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    if (_asyncProcessingDispatchQueue(void)::onceToken != -1)
      dispatch_once(&_asyncProcessingDispatchQueue(void)::onceToken, &__block_literal_global_179);
    v5 = (id)_asyncProcessingDispatchQueue(void)::ourProcessingDispatchQueue;
    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __55__VNSession_releaseCachedResourcesWithCompletionBlock___block_invoke;
      v7[3] = &unk_1E4546B38;
      v7[4] = self;
      v8 = v4;
      dispatch_barrier_async(v5, v7);

    }
    else
    {
      v6 = (void *)MEMORY[0x1A1B0B060](+[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, CFSTR("Processing dispatch queue is unavailable")));
      v4[2](v4);
      objc_autoreleasePoolPop(v6);
    }

  }
  else
  {
    -[VNSession releaseCachedResources](self, "releaseCachedResources");
  }

}

- (id)resourceObjectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionResourcesAccessingLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "lock");
  -[VNSession _locateResourceObjectForIdentifier:creationBlock:error:](self, "_locateResourceObjectForIdentifier:creationBlock:error:", v8, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

  return v12;
}

- (id)cachedResourceObjectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionResourcesAccessingLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lock");
  -[VisionCoreObjectCache objectForIdentifier:creationBlock:error:](self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock, "objectForIdentifier:creationBlock:error:", v4, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return v7;
}

- (id)_cachedTrackerResourcesConfiguredWithOptions:(id)a3
{
  -[VNSession _locateRPNTrackerResourcesForOptions:allowingCreation:error:]((uint64_t)self, a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)detectorCache:(id)a3 didEvictDetector:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "VNClassCode");
  kdebug_trace();

}

- (id)trackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackerResourcesAccessingLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lock");
  -[VNSession _locateRPNTrackerResourcesForOptions:allowingCreation:error:]((uint64_t)self, v6, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  return v9;
}

- (id)loadedDetectors
{
  void *v3;
  void *v4;
  void *v5;

  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detectorAccessingLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lock");
  -[VNDetectorCache loadedDetectors](self->_detectorCache_onlyAccessWithDetectorAccessingLock, "loadedDetectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return v5;
}

- (void)releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectorAccessingLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lock");
  -[VNSession _releaseDetectorsThatCanBeReplacedByDetectorOfClass:withConfiguration:](self, "_releaseDetectorsThatCanBeReplacedByDetectorOfClass:withConfiguration:", a3, v8);
  objc_msgSend(v7, "unlock");

}

- (id)trackerWithOptions:(id)a3 error:(id *)a4
{
  VNTrackerManager *trackerManager;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;

  trackerManager = self->_trackerManager;
  v6 = a3;
  v7 = v6;
  if (!trackerManager)
  {
    v11 = 0;
    goto LABEL_32;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_TrackerKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[VNTrackerManager _getTracker:](trackerManager, "_getTracker:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v11 = v10;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_TrackerType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("VNObjectTrackerRevision1Type")) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", CFSTR("VNObjectTrackerRevision2Type")) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", CFSTR("VNObjectTrackerRevisionLegacyFaceCoreType")) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", CFSTR("VNRectangleTrackerType")) & 1) != 0)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("VNTrackingOption_TrackingLevelFast"), CFSTR("VNTrackingOption_TrackingLevel"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", trackerManager->_trackingProcessingQueue, CFSTR("VNTrackingOption_ProcessingQueue"));
      objc_msgSend(v13, "addEntriesFromDictionary:", v7);
      v14 = v13;
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_ComputeDevice"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_17;
      v25 = v12;
      v16 = v15;
      v17 = +[VNTrackerManager trackerClassForOptions:error:]((uint64_t)VNTrackerManager, v14, a4);
      v18 = v16;
      if (v17)
      {
        objc_msgSend(v17, "supportedComputeDevicesForOptions:error:", v14, a4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v16;
        if (v19)
        {
          v24 = v19;
          objc_msgSend(v16, "computeDevice");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNComputeDeviceUtilities computeDeviceOfComputeDevices:mostCompatibleWithComputeDevice:options:](VNComputeDeviceUtilities, "computeDeviceOfComputeDevices:mostCompatibleWithComputeDevice:options:", v24, v20, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15
            || (+[VNComputeDeviceUtilities mostPerformantComputeDeviceOfComputeDevices:](VNComputeDeviceUtilities, "mostPerformantComputeDeviceOfComputeDevices:", v24), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("VNTrackingOption_ComputeDevice"));

            v12 = v25;
LABEL_17:

            -[VNTrackerManager _createTracker:type:options:error:](trackerManager, "_createTracker:type:options:error:", v8, v12, v14, a4);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              v10 = v21;
            else
              v10 = 0;
            goto LABEL_28;
          }
          if (a4)
          {
            objc_msgSend(v16, "processingDevice");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[VNError errorForUnsupportedProcessingDevice:](VNError, "errorForUnsupportedProcessingDevice:", v22);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v18 = 0;
          v19 = v24;
        }

      }
      v10 = 0;
      v12 = v25;
    }
    else
    {
      if (!a4)
      {
        v10 = 0;
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot create a Tracker with unknown tracker type: %@"), v12);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v14);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_28:

LABEL_29:
    v11 = v10;
    goto LABEL_30;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A tracker cannot be created without specifying a unique tracker key"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v10);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v11 = 0;
LABEL_31:

LABEL_32:
  return v11;
}

- (void)releaseTracker:(id)a3
{
  VNTrackerManager *trackerManager;
  id v4;
  NSObject *trackersCollectionManagementQueue;
  id v6;
  _QWORD block[5];
  id v8;

  trackerManager = self->_trackerManager;
  v4 = a3;
  if (trackerManager)
  {
    trackersCollectionManagementQueue = trackerManager->_trackersCollectionManagementQueue;
    block[1] = 3221225472;
    block[2] = __35__VNTrackerManager_releaseTracker___block_invoke;
    block[3] = &unk_1E4545438;
    block[4] = trackerManager;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(trackersCollectionManagementQueue, block);

    v4 = v6;
  }

}

- (void)legacyForcedCleanupWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("VNRequestHandlerCleanupOption_AllPipelines"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("VNRequestHandlerCleanupOption_FacePipeline"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      v6 = v5;
    objc_msgSend(v11, "objectForKey:", CFSTR("VNRequestHandlerCleanupOption_ScenePipeline"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      v7 = v5;
    objc_msgSend(v11, "objectForKey:", CFSTR("VNRequestHandlerCleanupOption_SmartCamPipeline"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = v5;
    objc_msgSend(v11, "objectForKey:", CFSTR("VNRequestHandlerCleanupOption_JunkPipeline"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (!v5)
        goto LABEL_14;
    }
    else
    {
      v9 = v5;
      if (!v5)
        goto LABEL_14;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("VNCleanupLevel_Complete")))
    {
      -[VNSession _releaseAllDetectors]((uint64_t)self);
      +[VNFrameworkManager manager](VNFrameworkManager, "manager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "releaseMetalDeviceWisdomParameters");

LABEL_15:
      v4 = v11;
      goto LABEL_16;
    }
LABEL_14:
    -[VNSession legacyForcedCleanupOfFacePipelineWithLevel:](self, "legacyForcedCleanupOfFacePipelineWithLevel:", v6);
    -[VNSession legacyForcedCleanupOfScenePipelineWithLevel:](self, "legacyForcedCleanupOfScenePipelineWithLevel:", v7);
    -[VNSession legacyForcedCleanupOfSmartCamPipelineWithLevel:](self, "legacyForcedCleanupOfSmartCamPipelineWithLevel:", v8);
    -[VNSession legacyForcedCleanupOfJunkPipelineWithLevel:](self, "legacyForcedCleanupOfJunkPipelineWithLevel:", v9);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)legacyForcedCleanupOfFacePipelineWithLevel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  VNDetectorCache *detectorCache_onlyAccessWithDetectorAccessingLock;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("VNCleanupLevel_Partial")))
    {
      v6 = &__block_literal_global_52;
      if (self)
      {
        +[VNFrameworkManager manager](VNFrameworkManager, "manager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "detectorAccessingLock");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "lock");
        detectorCache_onlyAccessWithDetectorAccessingLock = self->_detectorCache_onlyAccessWithDetectorAccessingLock;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __43__VNSession__enumerateDetectorsUsingBlock___block_invoke;
        v13[3] = &unk_1E4546AA0;
        v10 = &__block_literal_global_52;
        v14 = &__block_literal_global_52;
        -[VNDetectorCache evictDetectorsPassingTest:](detectorCache_onlyAccessWithDetectorAccessingLock, "evictDetectorsPassingTest:", v13);

        objc_msgSend(v8, "unlock");
      }

    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("VNCleanupLevel_Complete")))
    {
      v15[0] = CFSTR("VNFaceDetectorType");
      v15[1] = CFSTR("VNFaceBoxAlignerType");
      v15[2] = CFSTR("VNFaceLandmarkDetectorType");
      v15[3] = CFSTR("VNFaceExpressionDetectorType");
      v15[4] = CFSTR("VNFaceAnalyzerMultiDetectorType");
      v15[5] = CFSTR("VNANFDMultiDetectorType");
      v15[6] = CFSTR("VNFaceQualityGeneratorType");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNSession _releaseDetectorTypes:]((uint64_t)self, v11);

      +[VNFrameworkManager manager](VNFrameworkManager, "manager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "releaseMetalDeviceWisdomParameters");

    }
  }

}

- (void)legacyForcedCleanupOfScenePipelineWithLevel:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("VNCleanupLevel_Partial")) & 1) == 0
    && objc_msgSend(v4, "isEqualToString:", CFSTR("VNCleanupLevel_Complete")))
  {
    v6[0] = CFSTR("VNImageAnalyzerMultiDetectorType");
    v6[1] = CFSTR("VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType");
    v6[2] = CFSTR("VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNSession _releaseDetectorTypes:]((uint64_t)self, v5);

  }
}

- (void)legacyForcedCleanupOfSmartCamPipelineWithLevel:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("VNCleanupLevel_Partial")) & 1) == 0
    && objc_msgSend(v4, "isEqualToString:", CFSTR("VNCleanupLevel_Complete")))
  {
    v6[0] = CFSTR("VNSmartCamClassifierType");
    v6[1] = CFSTR("VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType");
    v6[2] = CFSTR("VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNSession _releaseDetectorTypes:]((uint64_t)self, v5);

  }
}

- (void)legacyForcedCleanupOfJunkPipelineWithLevel:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("VNCleanupLevel_Partial")) & 1) == 0
    && objc_msgSend(v4, "isEqualToString:", CFSTR("VNCleanupLevel_Complete")))
  {
    v6[0] = CFSTR("VNJunkIdentifierType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNSession _releaseDetectorTypes:]((uint64_t)self, v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackerManager, 0);
  objc_storeStrong((id *)&self->_cvPixelBufferPoolManager, 0);
  objc_storeStrong((id *)&self->_ciContextManager, 0);
  objc_storeStrong((id *)&self->_vtSessionManager, 0);
  objc_storeStrong((id *)&self->_trackerResourceCache, 0);
  objc_storeStrong((id *)&self->_detectorCache_onlyAccessWithDetectorAccessingLock, 0);
  objc_storeStrong((id *)&self->_resourceObjectsCache_onlyAccessWithSessionResourcesAccessingLock, 0);
  objc_destroyWeak((id *)&self->_frameworkManager);
}

- (void)_releaseDetectorTypes:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  objc_class *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = +[VNDetector detectorClassForDetectorType:error:](VNDetector, "detectorClassForDetectorType:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), 0, (_QWORD)v14);
          if (v9)
            objc_msgSend(v4, "addObject:", v9);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v6);
    }

    objc_msgSend(v4, "allObjects");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __40__VNSession__releaseDetectorsOfClasses___block_invoke;
      v18[3] = &unk_1E4546AC8;
      v19 = v10;
      v11 = v18;
      +[VNFrameworkManager manager](VNFrameworkManager, "manager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "detectorAccessingLock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "lock");
      objc_msgSend(*(id *)(a1 + 24), "evictDetectorsPassingTest:", v11);
      objc_msgSend(v13, "unlock");

    }
  }

}

uint64_t __40__VNSession__releaseDetectorsOfClasses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __43__VNSession__enumerateDetectorsUsingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

void __56__VNSession_legacyForcedCleanupOfFacePipelineWithLevel___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "purgeIntermediates");

}

- (void)_releaseAllDetectors
{
  void *v2;
  id v3;

  if (a1)
  {
    +[VNFrameworkManager manager](VNFrameworkManager, "manager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "detectorAccessingLock");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "lock");
    objc_msgSend(*(id *)(a1 + 24), "evictAllDetectors");
    objc_msgSend(v3, "unlock");

  }
}

- (id)_locateRPNTrackerResourcesForOptions:(int)a3 allowingCreation:(_QWORD *)a4 error:
{
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a2;
  if (a1)
  {
    if (a3)
      v8 = 0;
    else
      v8 = a4;
    objc_msgSend(*(id *)(a1 + 32), "locateRPNTrackerResourcesConfiguredForOptions:error:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 && (a3 & 1) != 0)
    {
      -[VNSession _frameworkManagerWithError:](a1, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "trackerResourcesConfiguredWithOptions:forSession:error:", v7, a1, a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(*(id *)(a1 + 32), "addRPNTrackerResourcesConfiguredForOptions:resources:error:", v7, v9, a4);
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __55__VNSession_releaseCachedResourcesWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A1B0B060](objc_msgSend(*(id *)(a1 + 32), "releaseCachedResources"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __68__VNSession__locateResourceObjectForIdentifier_creationBlock_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;

  +[VNFrameworkManager manager](VNFrameworkManager, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_locateResourceObjectForIdentifier:requestingSession:creationBlock:error:", a1[4], a1[5], a1[6], a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
