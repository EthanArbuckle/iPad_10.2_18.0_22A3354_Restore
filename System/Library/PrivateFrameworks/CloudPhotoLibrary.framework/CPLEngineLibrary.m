@implementation CPLEngineLibrary

- (CPLEngineLibrary)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CPLEngineLibrary *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *closingQueue;
  NSMutableDictionary *v27;
  NSMutableDictionary *blocksToDispatchWhenLibraryAttaches;
  uint64_t v29;
  NSURL *clientLibraryBaseURL;
  uint64_t v31;
  NSURL *cloudLibraryStateStorageURL;
  uint64_t v33;
  NSURL *cloudLibraryResourceStorageURL;
  uint64_t v35;
  NSString *libraryIdentifier;
  NSObject *v37;
  CPLStatus *v38;
  CPLStatus *status;
  CPLMetrics *v40;
  CPLMetrics *metrics;
  CPLEngineStore *v42;
  CPLEngineStore *store;
  CPLEngineSyncManager *v44;
  CPLEngineSyncManager *syncManager;
  CPLEngineTransport *v46;
  CPLEngineTransport *transport;
  CPLEngineScheduler *v48;
  CPLEngineScheduler *scheduler;
  CPLEngineSystemMonitor *v50;
  CPLEngineSystemMonitor *systemMonitor;
  CPLEngineFeedbackManager *v52;
  CPLEngineFeedbackManager *feedback;
  CPLConfiguration *v54;
  CPLConfiguration *configuration;
  void *v56;
  uint64_t v57;
  CPLPlatformObject *platformObject;
  void *v59;
  CPLEngineStore *v60;
  CPLEngineScheduler *v61;
  CPLEngineSystemMonitor *v62;
  CPLEngineFeedbackManager *v63;
  uint64_t v64;
  NSArray *components;
  uint64_t v66;
  NSHashTable *attachedObjects;
  uint64_t v68;
  NSHashTable *invalidAttachedObjects;
  NSCountedSet *v70;
  NSCountedSet *holdTestAssertions;
  NSObject *v73;
  CPLEngineLibrary *v74;
  CPLEngineLibrary *v75;
  void *v76;
  void *v77;
  objc_super v78;
  _QWORD v79[2];
  __int128 v80;
  CPLEngineScheduler *v81;
  CPLEngineSystemMonitor *v82;
  CPLEngineFeedbackManager *v83;
  uint8_t buf[4];
  CPLEngineLibrary *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v78.receiver = self;
  v78.super_class = (Class)CPLEngineLibrary;
  v20 = -[CPLEngineLibrary init](&v78, sel_init);
  if (v20)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.cpl.enginelibrary", v21);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v22;

    CPLCopyDefaultSerialQueueAttributes();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.cpl.enginelibrary.closing", v24);
    closingQueue = v20->_closingQueue;
    v20->_closingQueue = (OS_dispatch_queue *)v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    blocksToDispatchWhenLibraryAttaches = v20->_blocksToDispatchWhenLibraryAttaches;
    v20->_blocksToDispatchWhenLibraryAttaches = v27;

    v29 = objc_msgSend(v15, "copy");
    clientLibraryBaseURL = v20->_clientLibraryBaseURL;
    v20->_clientLibraryBaseURL = (NSURL *)v29;

    v31 = objc_msgSend(v16, "copy");
    cloudLibraryStateStorageURL = v20->_cloudLibraryStateStorageURL;
    v20->_cloudLibraryStateStorageURL = (NSURL *)v31;

    v33 = objc_msgSend(v17, "copy");
    cloudLibraryResourceStorageURL = v20->_cloudLibraryResourceStorageURL;
    v20->_cloudLibraryResourceStorageURL = (NSURL *)v33;

    v35 = objc_msgSend(v18, "copy");
    libraryIdentifier = v20->_libraryIdentifier;
    v20->_libraryIdentifier = (NSString *)v35;

    objc_storeStrong((id *)&v20->_mainScopeIdentifier, a7);
    v20->_isSystemLibrary = objc_msgSend(v18, "isEqualToString:", CFSTR("SystemLibrary"));
    v20->_isAppLibrary = objc_msgSend(v18, "hasPrefix:", CPLAppLibraryIdentifierPrefix);
    v20->_libraryOptions = a8;
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v85 = v20;
        v86 = 2112;
        v87 = v15;
        v88 = 2112;
        v89 = v16;
        v90 = 2112;
        v91 = v17;
        _os_log_impl(&dword_1B03C2000, v37, OS_LOG_TYPE_DEBUG, "Creating %@ in %@ (storage: %@/resources: %@)", buf, 0x2Au);
      }

    }
    v38 = -[CPLStatus initWithClientLibraryBaseURLForCPLEngine:]([CPLStatus alloc], "initWithClientLibraryBaseURLForCPLEngine:", v20->_clientLibraryBaseURL);
    status = v20->_status;
    v20->_status = v38;

    -[CPLStatus setDelegate:](v20->_status, "setDelegate:", v20);
    v40 = -[CPLMetrics initWithClientLibraryBaseURLForCPLEngine:]([CPLMetrics alloc], "initWithClientLibraryBaseURLForCPLEngine:", v20->_clientLibraryBaseURL);
    metrics = v20->_metrics;
    v20->_metrics = v40;

    v42 = -[CPLEngineStore initWithEngineLibrary:]([CPLEngineStore alloc], "initWithEngineLibrary:", v20);
    store = v20->_store;
    v20->_store = v42;

    v44 = -[CPLEngineSyncManager initWithEngineLibrary:]([CPLEngineSyncManager alloc], "initWithEngineLibrary:", v20);
    syncManager = v20->_syncManager;
    v20->_syncManager = v44;

    v46 = -[CPLEngineTransport initWithEngineLibrary:]([CPLEngineTransport alloc], "initWithEngineLibrary:", v20);
    transport = v20->_transport;
    v20->_transport = v46;

    v48 = -[CPLEngineScheduler initWithEngineLibrary:]([CPLEngineScheduler alloc], "initWithEngineLibrary:", v20);
    scheduler = v20->_scheduler;
    v20->_scheduler = v48;

    v50 = -[CPLEngineSystemMonitor initWithEngineLibrary:]([CPLEngineSystemMonitor alloc], "initWithEngineLibrary:", v20);
    systemMonitor = v20->_systemMonitor;
    v20->_systemMonitor = v50;

    v52 = -[CPLEngineFeedbackManager initWithEngineLibrary:]([CPLEngineFeedbackManager alloc], "initWithEngineLibrary:", v20);
    feedback = v20->_feedback;
    v20->_feedback = v52;

    v54 = -[CPLConfiguration initWithClientLibraryBaseURL:]([CPLConfiguration alloc], "initWithClientLibraryBaseURL:", v20->_clientLibraryBaseURL);
    configuration = v20->_configuration;
    v20->_configuration = v54;

    -[CPLConfiguration setConfigurationDictionaryUniquifier:](v20->_configuration, "setConfigurationDictionaryUniquifier:", &__block_literal_global_24);
    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "newPlatformImplementationForObject:", v20);
    platformObject = v20->_platformObject;
    v20->_platformObject = (CPLPlatformObject *)v57;

    if (!v20->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v74 = (CPLEngineLibrary *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v85 = v74;
          v75 = v74;
          _os_log_impl(&dword_1B03C2000, v73, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineLibrary.m");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, v77, 224, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }
    -[CPLEngineLibrary platformObject](v20, "platformObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v20->_store;
    v61 = v20->_scheduler;
    v79[0] = v59;
    v79[1] = v60;
    v80 = *(_OWORD *)&v20->_syncManager;
    v62 = v20->_systemMonitor;
    v63 = v20->_feedback;
    v81 = v61;
    v82 = v62;
    v83 = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 7);
    v64 = objc_claimAutoreleasedReturnValue();
    components = v20->_components;
    v20->_components = (NSArray *)v64;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v66 = objc_claimAutoreleasedReturnValue();
    attachedObjects = v20->_attachedObjects;
    v20->_attachedObjects = (NSHashTable *)v66;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v68 = objc_claimAutoreleasedReturnValue();
    invalidAttachedObjects = v20->_invalidAttachedObjects;
    v20->_invalidAttachedObjects = (NSHashTable *)v68;

    v70 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    holdTestAssertions = v20->_holdTestAssertions;
    v20->_holdTestAssertions = v70;

  }
  return v20;
}

- (void)reportLibraryCorrupted
{
  self->_libraryIsCorrupted = 1;
}

- (void)_reportQuarantineCountIfNecessaryWithLastReportDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  CPLEngineStore *store;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  v8 = v7;

  if (v8 > 86400.0 || v8 < 0.0)
  {
    v9 = MEMORY[0x1E0C809B0];
    store = self->_store;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke;
    v14[3] = &unk_1E60DD810;
    v14[4] = self;
    v15 = v6;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_3;
    v12[3] = &unk_1E60DD810;
    v12[4] = self;
    v13 = v15;
    v11 = -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:](store, "performWriteTransactionWithBlock:completionHandler:", v14, v12);

  }
}

- (void)reportQuarantineCountIfNecessary
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)corruptionInfo
{
  return -[CPLEngineStore corruptionInfo](self->_store, "corruptionInfo");
}

- (void)_openNextComponent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  CPLEngineLibrary *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  CPLEngineLibrary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "nextObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v16 = v8;
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Opening %{public}@ for %@", buf, 0x16u);
      }

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__CPLEngineLibrary__openNextComponent_completionHandler___block_invoke;
    v10[3] = &unk_1E60DB0D8;
    v11 = v8;
    v12 = self;
    v14 = v7;
    v13 = v6;
    +[CPLCallObserver observeAsyncCallOn:selector:block:](CPLCallObserver, "observeAsyncCallOn:selector:block:", v11, sel_openWithCompletionHandler_, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  __int128 buf;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Opening %{public}@", (uint8_t *)&buf, 0xCu);
    }

  }
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60D6708;
  v12[4] = self;
  v13 = v4;
  v8 = v12;
  *(_QWORD *)&buf = v7;
  *((_QWORD *)&buf + 1) = 3221225472;
  v15 = __cpl_dispatch_async_block_invoke_14500;
  v16 = &unk_1E60D71F8;
  v17 = v8;
  v9 = queue;
  v10 = v4;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v9, v11);

}

- (void)_closeNextComponent:(id)a3 deactivate:(BOOL)a4 lastError:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  CPLEngineLibrary *v22;
  id v23;
  id v24;
  _BYTE *v25;
  BOOL v26;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v8 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "Closing %{public}@", buf, 0xCu);
      }

      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (v8)
            v16 = "Deactivating";
          else
            v16 = "Closing";
          objc_msgSend(v13, "componentName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v17;
          _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
    }
    objc_msgSend(v13, "componentName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineLibrary _setCurrentClosingComponentName:](self, "_setCurrentClosingComponentName:", v18);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__14519;
    v29 = __Block_byref_object_dispose__14520;
    v30 = v11;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__CPLEngineLibrary__closeNextComponent_deactivate_lastError_completionHandler___block_invoke;
    v20[3] = &unk_1E60DB158;
    v26 = v8;
    v25 = buf;
    v21 = v13;
    v22 = self;
    v23 = v10;
    v24 = v12;
    +[CPLCallObserver observeAsyncCallOn:selector:block:](CPLCallObserver, "observeAsyncCallOn:selector:block:", v21, sel_closeAndDeactivate_completionHandler_, v20);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ is closed", buf, 0xCu);
      }

    }
    -[CPLStatus setDelegate:](self->_status, "setDelegate:", 0);
    (*((void (**)(id, id))v12 + 2))(v12, v11);
    dispatch_resume((dispatch_object_t)self->_queue);
  }

}

- (void)_setCurrentClosingComponentName:(id)a3
{
  id v4;
  NSObject *closingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  closingQueue = self->_closingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CPLEngineLibrary__setCurrentClosingComponentName___block_invoke;
  v7[3] = &unk_1E60D6F88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(closingQueue, v7);

}

- (NSString)currentClosingComponentName
{
  NSObject *closingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14519;
  v10 = __Block_byref_object_dispose__14520;
  v11 = 0;
  closingQueue = self->_closingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__CPLEngineLibrary_currentClosingComponentName__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(closingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  __int128 buf;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Closing %{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ is closing", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__CPLEngineLibrary_closeAndDeactivate_completionHandler___block_invoke;
  v15[3] = &unk_1E60DC058;
  v17 = a3;
  v15[4] = self;
  v16 = v6;
  v11 = v15;
  *(_QWORD *)&buf = v10;
  *((_QWORD *)&buf + 1) = 3221225472;
  v19 = __cpl_dispatch_async_block_invoke_14500;
  v20 = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v12, v14);

}

- (void)updateLastSuccessfullSyncDate:(id)a3
{
  -[CPLStatus setLastSuccessfulSyncDate:](self->_status, "setLastSuccessfulSyncDate:", a3);
}

- (void)updateInitialSyncDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  OS_dispatch_queue *queue;
  _QWORD *v8;
  NSObject *v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  _QWORD block[4];
  id v13;

  v4 = a3;
  if (v4)
  {
    -[CPLStatus initialSyncDate](self->_status, "initialSyncDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = MEMORY[0x1E0C809B0];
      queue = self->_queue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42__CPLEngineLibrary_updateInitialSyncDate___block_invoke;
      v11[3] = &unk_1E60D65B8;
      v11[4] = self;
      v8 = v11;
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __cpl_dispatch_async_block_invoke_14500;
      block[3] = &unk_1E60D71F8;
      v13 = v8;
      v9 = queue;
      v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v9, v10);

    }
  }
  -[CPLStatus setInitialSyncDate:](self->_status, "setInitialSyncDate:", v4);

}

- (NSDate)initialSyncDate
{
  return -[CPLStatus initialSyncDate](self->_status, "initialSyncDate");
}

- (void)updateInitialDownloadDate:(id)a3
{
  -[CPLStatus setInitialDownloadDate:](self->_status, "setInitialDownloadDate:", a3);
}

- (NSDate)initialDownloadDate
{
  return -[CPLStatus initialDownloadDate](self->_status, "initialDownloadDate");
}

- (BOOL)hasChangesToProcess
{
  return -[CPLStatus hasChangesToProcess](self->_status, "hasChangesToProcess");
}

- (void)setHasChangesToProcess:(BOOL)a3
{
  -[CPLStatus setHasChangesToProcess:](self->_status, "setHasChangesToProcess:", a3);
}

- (BOOL)isExceedingQuota
{
  return -[CPLStatus isExceedingQuota](self->_status, "isExceedingQuota");
}

- (void)setIsExceedingQuota:(BOOL)a3
{
  -[CPLStatus setIsExceedingQuota:](self->_status, "setIsExceedingQuota:", a3);
}

- (BOOL)isExceedingSharedLibraryQuota
{
  return -[CPLStatus isExceedingSharedLibraryQuota](self->_status, "isExceedingSharedLibraryQuota");
}

- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3
{
  -[CPLStatus setIsExceedingSharedLibraryQuota:](self->_status, "setIsExceedingSharedLibraryQuota:", a3);
}

- (unint64_t)estimatedCountOfRemainingRecordsDuringSharedLibraryExit
{
  return -[CPLStatus estimatedCountOfRemainingRecordsDuringSharedLibraryExit](self->_status, "estimatedCountOfRemainingRecordsDuringSharedLibraryExit");
}

- (void)setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:(unint64_t)a3
{
  -[CPLStatus setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:](self->_status, "setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:", a3);
}

- (int64_t)busyState
{
  return -[CPLStatus busyState](self->_status, "busyState");
}

- (void)setBusyState:(int64_t)a3
{
  -[CPLStatus setBusyState:](self->_status, "setBusyState:", a3);
}

- (NSDate)exitDeleteTime
{
  return -[CPLStatus exitDeleteTime](self->_status, "exitDeleteTime");
}

- (void)setExitDeleteTime:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  CPLStatus *status;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  double v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPLStatus exitDeleteTime](self->_status, "exitDeleteTime");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 || !v5)
  {
    if (!v4)
      goto LABEL_38;
    if (!v5)
      goto LABEL_17;
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    if (v17 < 0.0)
      v17 = -v17;
    if (v17 <= 1.0)
    {
      if (_CPLSilentLogging)
        goto LABEL_29;
      __CPLLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

LABEL_29:
        -[NSURL URLByAppendingPathComponent:](self->_clientLibraryBaseURL, "URLByAppendingPathComponent:", CFSTR("initialsync_marker"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v21 = objc_msgSend(v20, "removeItemAtURL:error:", v11, &v24);
        v12 = v24;
        if ((v21 & 1) == 0 && (objc_msgSend(v20, "cplIsFileDoesNotExistError:", v12) & 1) == 0 && !_CPLSilentLogging)
        {
          __CPLLibraryOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v27 = v23;
            v28 = 2112;
            v29 = (const __CFString *)v12;
            _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_ERROR, "Fail to remove %{public}@, error: %@", buf, 0x16u);

          }
        }

        goto LABEL_36;
      }
      *(_DWORD *)buf = 138543618;
      v27 = v4;
      v28 = 2114;
      v29 = CFSTR("initialsync_marker");
      v19 = "Updating exit mode (%{public}@), removing %{public}@ if present";
    }
    else
    {
LABEL_17:
      if (_CPLSilentLogging)
        goto LABEL_29;
      __CPLLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_DWORD *)buf = 138543618;
      v27 = v4;
      v28 = 2114;
      v29 = CFSTR("initialsync_marker");
      v19 = "Starting exit mode (%{public}@), removing %{public}@ if present";
    }
    _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
    goto LABEL_28;
  }
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Engine is no longer in exit mode, resetting to normal operations", buf, 2u);
    }

  }
  -[CPLStatus initialSyncDate](self->_status, "initialSyncDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    status = self->_status;
    v25 = 0;
    v10 = -[CPLStatus writeInitialSyncMarker:](status, "writeInitialSyncMarker:", &v25);
    v11 = v25;
    if (v10)
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v13 = "Rewriting initial sync marker";
          v14 = v12;
          v15 = OS_LOG_TYPE_DEFAULT;
          v16 = 2;
LABEL_23:
          _os_log_impl(&dword_1B03C2000, v14, v15, v13, buf, v16);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v11;
        v13 = "Fail to write initial sync marker, error: %@";
        v14 = v12;
        v15 = OS_LOG_TYPE_ERROR;
        v16 = 12;
        goto LABEL_23;
      }
LABEL_36:

    }
  }
LABEL_38:
  -[CPLStatus setExitDeleteTime:](self->_status, "setExitDeleteTime:", v4);

}

- (BOOL)isWalrusEnabled
{
  return -[CPLStatus isWalrusEnabled](self->_status, "isWalrusEnabled");
}

- (void)setWalrusEnabled:(BOOL)a3
{
  -[CPLStatus setWalrusEnabled:](self->_status, "setWalrusEnabled:", a3);
}

- (BOOL)isKeychainCDPEnabled
{
  return -[CPLStatus isKeychainCDPEnabled](self->_status, "isKeychainCDPEnabled");
}

- (void)setKeychainCDPEnabled:(BOOL)a3
{
  -[CPLStatus setKeychainCDPEnabled:](self->_status, "setKeychainCDPEnabled:", a3);
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  return -[CPLStatus isUpgradeSuggestedToAccessAllPhotos](self->_status, "isUpgradeSuggestedToAccessAllPhotos");
}

- (void)setUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  -[CPLStatus setUpgradeSuggestedToAccessAllPhotos:](self->_status, "setUpgradeSuggestedToAccessAllPhotos:", a3);
}

- (int64_t)serverFeatureCompatibleVersion
{
  return -[CPLStatus serverFeatureCompatibleVersion](self->_status, "serverFeatureCompatibleVersion");
}

- (void)setServerFeatureCompatibleVersion:(int64_t)a3
{
  -[CPLStatus setServerFeatureCompatibleVersion:](self->_status, "setServerFeatureCompatibleVersion:", a3);
}

- (BOOL)containerHasBeenWiped
{
  return -[CPLStatus containerHasBeenWiped](self->_status, "containerHasBeenWiped");
}

- (void)setContainerHasBeenWiped:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[CPLStatus setContainerHasBeenWiped:](self->_status, "setContainerHasBeenWiped:");
  if (v3)
    -[CPLEngineScheduler noteContainerHasBeenWiped](self->_scheduler, "noteContainerHasBeenWiped");
}

- (BOOL)iCloudLibraryClientVersionTooOld
{
  return -[CPLStatus iCloudLibraryClientVersionTooOld](self->_status, "iCloudLibraryClientVersionTooOld");
}

- (void)setICloudLibraryClientVersionTooOld:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[CPLStatus iCloudLibraryClientVersionTooOld](self->_status, "iCloudLibraryClientVersionTooOld");
  -[CPLStatus setICloudLibraryClientVersionTooOld:](self->_status, "setICloudLibraryClientVersionTooOld:", v3);
  if (v5 && !v3)
  {
    __CPLBuildVersion();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Client version (%@) is no longer blacklisted, resetting to normal operations", buf, 0xCu);
      }

    }
    -[CPLEngineLibrary store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__CPLEngineLibrary_setICloudLibraryClientVersionTooOld___block_invoke;
    v11[3] = &unk_1E60DD838;
    v12 = v8;
    v9 = v8;
    v10 = (id)objc_msgSend(v9, "performWriteTransactionWithBlock:completionHandler:", v11, &__block_literal_global_14679);

  }
}

- (BOOL)iCloudLibraryClientIsNotAuthenticated
{
  return -[CPLStatus iCloudLibraryClientIsNotAuthenticated](self->_status, "iCloudLibraryClientIsNotAuthenticated");
}

- (void)setICloudLibraryClientIsNotAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[CPLStatus iCloudLibraryClientIsNotAuthenticated](self->_status, "iCloudLibraryClientIsNotAuthenticated");
  -[CPLStatus setICloudLibraryClientIsNotAuthenticated:](self->_status, "setICloudLibraryClientIsNotAuthenticated:", v3);
  if (v5 && !v3)
    -[CPLEngineScheduler noteNetworkStateDidChange](self->_scheduler, "noteNetworkStateDidChange");
}

- (void)updateBlockedMetrics:(BOOL)a3 syncRequested:(BOOL)a4
{
  OS_dispatch_queue *queue;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  dispatch_block_t v8;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;
  _QWORD block[4];
  id v13;

  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__CPLEngineLibrary_updateBlockedMetrics_syncRequested___block_invoke;
  v9[3] = &unk_1E60DB240;
  v10 = a4;
  v9[4] = self;
  v11 = a3;
  v6 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v13 = v6;
  v7 = queue;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

}

- (void)updateComputeSyncMetrics:(int64_t)a3 silentDecryptionFailed:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  id v8;
  CPLMetrics **p_metrics;
  CPLMetrics *v10;
  __CFString **v11;
  CPLMetrics *metrics;
  int v13;
  __CFString **v14;
  id v15;

  v5 = a4;
  v8 = a5;
  if (a3 == 1)
  {
    v15 = v8;
    metrics = self->_metrics;
    p_metrics = &self->_metrics;
    -[CPLMetrics incrementCountForKey:](metrics, "incrementCountForKey:", CFSTR("DownloadCount"));
    v8 = v15;
    if (v15)
    {
      -[CPLMetrics incrementCountForKey:](*p_metrics, "incrementCountForKey:", CFSTR("DownloadFailureCount"));
      if ((objc_msgSend(v15, "isCPLEncryptionError") & 1) == 0)
      {
        v13 = objc_msgSend(v15, "isCPLThrottlingError");
        v11 = &PLCoreAnalyticsLibrarySummaryiCPLComputeSyncDownloadCKErrorCountKey;
        v14 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncDownloadThrottledErrorCountKey;
        goto LABEL_13;
      }
    }
    else
    {
      if (!v5)
        goto LABEL_16;
      -[CPLMetrics incrementCountForKey:](*p_metrics, "incrementCountForKey:", CFSTR("DownloadFailureCount"));
    }
    v11 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncDownloadDecryptionErrorCountKey;
    goto LABEL_15;
  }
  if (!a3)
  {
    v15 = v8;
    v10 = self->_metrics;
    p_metrics = &self->_metrics;
    -[CPLMetrics incrementCountForKey:](v10, "incrementCountForKey:", CFSTR("UploadCount"));
    v8 = v15;
    if (v15)
    {
      -[CPLMetrics incrementCountForKey:](*p_metrics, "incrementCountForKey:", CFSTR("UploadFailureCount"));
      if ((objc_msgSend(v15, "isCPLEncryptionError") & 1) != 0)
      {
        v11 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncUploadEncryptionErrorCountKey;
LABEL_15:
        -[CPLMetrics incrementCountForKey:](*p_metrics, "incrementCountForKey:", *v11);
        v8 = v15;
        goto LABEL_16;
      }
      v13 = objc_msgSend(v15, "isCPLThrottlingError");
      v11 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncUploadCKErrorCountKey;
      v14 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncUploadThrottledErrorCountKey;
LABEL_13:
      if (v13)
        v11 = v14;
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (BOOL)isStuckInExitForSharedLibrary
{
  return -[CPLStatus isStuckInExitForSharedLibrary](self->_status, "isStuckInExitForSharedLibrary");
}

- (void)setIsStuckInExitForSharedLibrary:(BOOL)a3
{
  -[CPLStatus setIsStuckInExitForSharedLibrary:](self->_status, "setIsStuckInExitForSharedLibrary:", a3);
}

- (void)setHasCellularBudget:(BOOL)a3 hasBatteryBudget:(BOOL)a4 hasLowBatteryLevel:(BOOL)a5 isConstrainedNetwork:(BOOL)a6 isBlockedByLowPowerMode:(BOOL)a7 hasHeavyResourceUsage:(BOOL)a8 hasPoorNetworkQuality:(BOOL)a9 hasModerateThermalPressure:(BOOL)a10 hasThermalPressure:(BOOL)a11 hasPoorSystemConditions:(BOOL)a12 isBudgetValid:(BOOL)a13 blockedReason:(int64_t)a14 unBlockedReason:(int64_t)a15
{
  -[CPLStatus setHasCellularBudget:hasBatteryBudget:hasLowBatteryLevel:isConstrainedNetwork:isBlockedByLowPowerMode:hasHeavyResourceUsage:hasPoorNetworkQuality:hasModerateThermalPressure:hasThermalPressure:hasPoorSystemConditions:isBudgetValid:blockedReason:unBlockedReason:](self->_status, "setHasCellularBudget:hasBatteryBudget:hasLowBatteryLevel:isConstrainedNetwork:isBlockedByLowPowerMode:hasHeavyResourceUsage:hasPoorNetworkQuality:hasModerateThermalPressure:hasThermalPressure:hasPoorSystemConditions:isBudgetValid:blockedReason:unBlockedReason:", a3, a4, a5, a6, a7, a8);
}

- (void)setConnectedToNetwork:(BOOL)a3 cellularIsRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5
{
  -[CPLStatus setConnectedToNetwork:cellularIsRestricted:inAirplaneMode:](self->_status, "setConnectedToNetwork:cellularIsRestricted:inAirplaneMode:", a3, a4, a5);
}

- (void)setLowDiskSpace:(BOOL)a3 veryLowDiskSpace:(BOOL)a4
{
  -[CPLStatus setLowDiskSpace:veryLowDiskSpace:](self->_status, "setLowDiskSpace:veryLowDiskSpace:", a3, a4);
}

- (void)updateDisabledFeatures:(id)a3
{
  -[CPLStatus setDisabledFeatures:](self->_status, "setDisabledFeatures:", a3);
}

- (void)_updateTotalAssetCountWithAssetCounts:(id)a3
{
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CPLEngineLibrary__updateTotalAssetCountWithAssetCounts___block_invoke;
  v5[3] = &unk_1E60DB2B8;
  v5[4] = &v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  self->_totalAssetCount = v7[3];
  self->_totalAssetCountHasBeenCalculated = 1;
  _Block_object_dispose(&v6, 8);

}

- (void)updateAssetCountsFromServer:(id)a3
{
  CPLStatus *status;
  id v5;

  status = self->_status;
  v5 = a3;
  -[CPLStatus setCloudAssetCountPerType:updateCheckDate:](status, "setCloudAssetCountPerType:updateCheckDate:", v5, 1);
  -[CPLEngineLibrary _updateTotalAssetCountWithAssetCounts:](self, "_updateTotalAssetCountWithAssetCounts:", v5);

}

- (unint64_t)totalAssetCountOnServer
{
  void *v3;

  if (!self->_totalAssetCountHasBeenCalculated)
  {
    -[CPLStatus cloudAssetCountPerType](self->_status, "cloudAssetCountPerType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineLibrary _updateTotalAssetCountWithAssetCounts:](self, "_updateTotalAssetCountWithAssetCounts:", v3);

  }
  return self->_totalAssetCount;
}

- (BOOL)hasAssetCountOnServer
{
  void *v2;
  BOOL v3;

  -[CPLStatus cloudAssetCountPerType](self->_status, "cloudAssetCountPerType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)updateAccountFlagsData:(id)a3
{
  -[CPLStatus setAccountFlagsData:](self->_status, "setAccountFlagsData:", a3);
}

- (BOOL)iCloudLibraryHasBeenWiped
{
  return -[CPLStatus iCloudLibraryHasBeenWiped](self->_status, "iCloudLibraryHasBeenWiped");
}

- (void)setICloudLibraryHasBeenWiped:(BOOL)a3
{
  -[CPLStatus setICloudLibraryHasBeenWiped:](self->_status, "setICloudLibraryHasBeenWiped:", a3);
}

- (BOOL)iCloudLibraryExists
{
  return -[CPLStatus iCloudLibraryExists](self->_status, "iCloudLibraryExists");
}

- (void)setICloudLibraryExists:(BOOL)a3
{
  -[CPLStatus setICloudLibraryExists:](self->_status, "setICloudLibraryExists:", a3);
}

- (void)startSyncSession
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CPLEngineLibrary_startSyncSession__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)clientIsPushingChanges
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CPLEngineLibrary_clientIsPushingChanges__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CPLEngineLibrary libraryIdentifier](self, "libraryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineLibrary clientLibraryBaseURL](self, "clientLibraryBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAbbreviatingWithTildeInPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ at %@>"), v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)redactedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CPLEngineLibrary libraryIdentifier](self, "libraryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineLibrary clientLibraryBaseURL](self, "clientLibraryBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ at %@>"), v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_libraryObject
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_attachedObjects;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!-[NSHashTable containsObject:](self->_invalidAttachedObjects, "containsObject:", v8, (_QWORD)v11)
          && (objc_msgSend(v8, "isLibraryManagerForEngineLibrary:", self) & 1) != 0)
        {
          v9 = v8;
          goto LABEL_12;
        }
      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)attachObject:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)detachObject:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__CPLEngineLibrary_detachObject_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)markAttachedObjectAsInvalid:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__CPLEngineLibrary_markAttachedObjectAsInvalid___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)_performBlockWithLibrary:(BOOL)a3 enumerateAttachedObjects:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD block[4];
  id v17;

  v6 = a4;
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__CPLEngineLibrary__performBlockWithLibrary_enumerateAttachedObjects___block_invoke;
  v13[3] = &unk_1E60DC058;
  v13[4] = self;
  v14 = v6;
  v15 = a3;
  v9 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = queue;
  v11 = v6;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

- (void)_performPendingBlockForWhenLibraryAttaches
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableDictionary count](self->_blocksToDispatchWhenLibraryAttaches, "count"))
  {
    if (self->_closed)
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v4 = -[NSMutableDictionary count](self->_blocksToDispatchWhenLibraryAttaches, "count");
          *(_DWORD *)v7 = 134217984;
          *(_QWORD *)&v7[4] = v4;
          v5 = "Performing %lu pending blocks after engine was closed";
LABEL_9:
          _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, v5, v7, 0xCu);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = -[NSMutableDictionary count](self->_blocksToDispatchWhenLibraryAttaches, "count");
        *(_DWORD *)v7 = 134217984;
        *(_QWORD *)&v7[4] = v6;
        v5 = "Performing %lu pending blocks after library attached to the engine";
        goto LABEL_9;
      }
LABEL_10:

    }
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_blocksToDispatchWhenLibraryAttaches, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_57, *(_OWORD *)v7);
    -[NSMutableDictionary removeAllObjects](self->_blocksToDispatchWhenLibraryAttaches, "removeAllObjects");
  }
}

- (id)_performBlockWhenLibraryAttaches:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1B5E08DC4](v5);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_blocksToDispatchWhenLibraryAttaches, "setObject:forKeyedSubscript:", v7, v6);
  return v6;
}

- (void)_cancelBlockWhenLibraryAttaches:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableDictionary removeObjectForKey:](self->_blocksToDispatchWhenLibraryAttaches, "removeObjectForKey:", v5);

}

- (void)performBlockOnLibrary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[3];
  char v29;
  _QWORD block[4];
  id v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__14519;
  v26[4] = __Block_byref_object_dispose__14520;
  v27 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke;
  v21[3] = &unk_1E60DB300;
  v21[4] = self;
  v24 = v28;
  v25 = v26;
  v7 = v5;
  v22 = v7;
  v8 = v4;
  v23 = v8;
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_2;
  v19[3] = &unk_1E60D6708;
  v19[4] = self;
  v9 = (id)MEMORY[0x1B5E08DC4](v21);
  v20 = v9;
  objc_msgSend(v7, "setCancellationHandler:", v19);
  queue = self->_queue;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_4;
  v15[3] = &unk_1E60DBBA0;
  v15[4] = self;
  v16 = v9;
  v17 = v28;
  v18 = v26;
  v11 = v15;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v31 = v11;
  v12 = queue;
  v13 = v9;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v14);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

}

- (void)requestAttachedLibrary
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CPLEngineLibrary_requestAttachedLibrary__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)notifyAttachedObjectsPullQueueIsFull
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__CPLEngineLibrary_notifyAttachedObjectsPullQueueIsFull__block_invoke;
  v2[3] = &unk_1E60DB328;
  v2[4] = self;
  -[CPLEngineLibrary _performBlockWithLibrary:enumerateAttachedObjects:](self, "_performBlockWithLibrary:enumerateAttachedObjects:", 1, v2);
}

- (void)notifyAttachedObjectsHasStatusChanges
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__CPLEngineLibrary_notifyAttachedObjectsHasStatusChanges__block_invoke;
  v2[3] = &unk_1E60DB328;
  v2[4] = self;
  -[CPLEngineLibrary _performBlockWithLibrary:enumerateAttachedObjects:](self, "_performBlockWithLibrary:enumerateAttachedObjects:", 1, v2);
}

- (void)_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged
{
  NSDate *v3;
  NSDate *mostRecentScopeStatusCountsDidChangeNotificationDate;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  mostRecentScopeStatusCountsDidChangeNotificationDate = self->_mostRecentScopeStatusCountsDidChangeNotificationDate;
  self->_mostRecentScopeStatusCountsDidChangeNotificationDate = v3;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CPLScopeStatusCountsDidChangeNotification"), 0, 0, 0);
}

- (void)notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__CPLEngineLibrary_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)notifyAttachedObjectsResourceDidDownloadInBackground:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CPLEngineLibrary *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__CPLEngineLibrary_notifyAttachedObjectsResourceDidDownloadInBackground___block_invoke;
  v6[3] = &unk_1E60DB350;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CPLEngineLibrary _performBlockWithLibrary:enumerateAttachedObjects:](self, "_performBlockWithLibrary:enumerateAttachedObjects:", 1, v6);

}

- (void)notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CPLEngineLibrary *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__CPLEngineLibrary_notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource___block_invoke;
  v6[3] = &unk_1E60DB350;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CPLEngineLibrary _performBlockWithLibrary:enumerateAttachedObjects:](self, "_performBlockWithLibrary:enumerateAttachedObjects:", 1, v6);

}

- (void)notifyAttachedObjectsUploadTaskDidStart:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CPLEngineLibrary *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CPLEngineLibrary_notifyAttachedObjectsUploadTaskDidStart___block_invoke;
  v6[3] = &unk_1E60DB350;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CPLEngineLibrary _performBlockWithLibrary:enumerateAttachedObjects:](self, "_performBlockWithLibrary:enumerateAttachedObjects:", 0, v6);

}

- (void)notifyAttachedObjectsUploadTask:(id)a3 didProgress:(float)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CPLEngineLibrary *v10;
  float v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CPLEngineLibrary_notifyAttachedObjectsUploadTask_didProgress___block_invoke;
  v8[3] = &unk_1E60DB378;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[CPLEngineLibrary _performBlockWithLibrary:enumerateAttachedObjects:](self, "_performBlockWithLibrary:enumerateAttachedObjects:", 0, v8);

}

- (void)notifyAttachedObjectsUploadTask:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  CPLEngineLibrary *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__CPLEngineLibrary_notifyAttachedObjectsUploadTask_didFinishWithError___block_invoke;
  v10[3] = &unk_1E60DB3A0;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[CPLEngineLibrary _performBlockWithLibrary:enumerateAttachedObjects:](self, "_performBlockWithLibrary:enumerateAttachedObjects:", 1, v10);

}

- (void)notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7
{
  _QWORD v7[10];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __161__CPLEngineLibrary_notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke;
  v7[3] = &unk_1E60DB3C8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  v7[8] = a6;
  v7[9] = a7;
  -[CPLEngineLibrary _performBlockWithLibrary:enumerateAttachedObjects:](self, "_performBlockWithLibrary:enumerateAttachedObjects:", 1, v7);
}

- (id)componentName
{
  return CFSTR("engine");
}

- (void)providePayloadForComputeStates:(id)a3 inFolderWithURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  OS_dispatch_queue *queue;
  _QWORD *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  dispatch_block_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[3];
  char v40;
  _QWORD block[4];
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke;
  v33[3] = &unk_1E60DB3F0;
  v33[4] = self;
  v36 = v37;
  v13 = v11;
  v34 = v13;
  v14 = v10;
  v35 = v14;
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2;
  v30[3] = &unk_1E60DB440;
  v30[4] = self;
  v32 = v39;
  v15 = (id)MEMORY[0x1B5E08DC4](v33);
  v31 = v15;
  objc_msgSend(v13, "setCancellationHandler:", v30);
  queue = self->_queue;
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4;
  v24[3] = &unk_1E60DB490;
  v28 = v15;
  v29 = v39;
  v24[4] = self;
  v25 = v13;
  v26 = v8;
  v27 = v9;
  v17 = v24;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v42 = v17;
  v18 = queue;
  v19 = v9;
  v20 = v8;
  v21 = v13;
  v22 = v15;
  v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v18, v23);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__CPLEngineLibrary_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__CPLEngineLibrary_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  OS_dispatch_queue *queue;
  _QWORD *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  dispatch_block_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  SEL v35;
  _QWORD v36[5];
  id v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD *v42;
  _QWORD v43[3];
  char v44;
  _QWORD v45[3];
  char v46;
  _QWORD block[4];
  id v48;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke;
  v39[3] = &unk_1E60DB508;
  v39[4] = self;
  v42 = v43;
  v8 = v6;
  v40 = v8;
  v9 = v5;
  v41 = v9;
  v36[0] = v7;
  v36[1] = 3221225472;
  v36[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2;
  v36[3] = &unk_1E60DB440;
  v36[4] = self;
  v38 = v45;
  v10 = (id)MEMORY[0x1B5E08DC4](v39);
  v37 = v10;
  objc_msgSend(v8, "setCancellationHandler:", v36);
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4;
  v31[3] = &unk_1E60DB530;
  v31[4] = self;
  v33 = v45;
  v34 = v43;
  v35 = a2;
  v11 = v10;
  v32 = v11;
  v12 = (void *)MEMORY[0x1B5E08DC4](v31);
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_86;
  v28[3] = &unk_1E60DB580;
  v28[4] = self;
  v30 = v45;
  v13 = v11;
  v29 = v13;
  v14 = (void *)MEMORY[0x1B5E08DC4](v28);
  queue = self->_queue;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_97;
  v23[3] = &unk_1E60DB710;
  v23[4] = self;
  v24 = v8;
  v25 = v12;
  v26 = v14;
  v27 = v13;
  v16 = v23;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v48 = v16;
  v17 = queue;
  v18 = v13;
  v19 = v14;
  v20 = v8;
  v21 = v12;
  v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v17, v22);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

}

- (void)requestClientToPullAllChangesWithScopeIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  CPLEngineStore *v8;
  void *v9;
  OS_dispatch_queue *v10;
  uint64_t v11;
  OS_dispatch_queue *v12;
  void *v13;
  OS_dispatch_queue *v14;
  id v15;
  CPLEngineStore *v16;
  id v17;
  id v18;
  void *v19;
  OS_dispatch_queue *v20;
  id v21;
  void *v22;
  OS_dispatch_queue *v23;
  id v24;
  OS_dispatch_queue *v25;
  id v26;
  id v27;
  id v28;
  OS_dispatch_queue *v29;
  id v30;
  id v31;
  id v32;
  CPLEngineStore *v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  dispatch_block_t v42;
  CPLEngineLibrary *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  CPLEngineStore *v56;
  id v57;
  id v58;
  OS_dispatch_queue *v59;
  CPLEngineLibrary *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD *v65;
  _QWORD v66[4];
  OS_dispatch_queue *v67;
  CPLEngineLibrary *v68;
  id v69;
  id v70;
  _QWORD *v71;
  _QWORD *v72;
  SEL v73;
  _QWORD v74[4];
  OS_dispatch_queue *v75;
  id v76;
  _QWORD *v77;
  _QWORD v78[4];
  OS_dispatch_queue *v79;
  id v80;
  id v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD v84[4];
  OS_dispatch_queue *v85;
  CPLEngineStore *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD v93[4];
  OS_dispatch_queue *v94;
  _QWORD *v95;
  _QWORD v96[5];
  id v97;
  _QWORD v98[5];
  id v99;
  _QWORD v100[3];
  char v101;
  _QWORD v102[3];
  char v103;
  _QWORD block[4];
  id v105;

  v46 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = 0;
  v102[1] = v102;
  v102[2] = 0x2020000000;
  v103 = 0;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x2020000000;
  v101 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x3032000000;
  v98[3] = __Block_byref_object_copy__14519;
  v98[4] = __Block_byref_object_dispose__14520;
  v99 = 0;
  v8 = self->_store;
  -[CPLEngineStore pullQueue](v8, "pullQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = self;
  v10 = self->_queue;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  v96[3] = __Block_byref_object_copy__14519;
  v96[4] = __Block_byref_object_dispose__14520;
  v97 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke;
  v93[3] = &unk_1E60DC8A0;
  v12 = v10;
  v94 = v12;
  v95 = v96;
  v13 = (void *)MEMORY[0x1B5E08DC4](v93);
  v84[0] = v11;
  v84[1] = 3221225472;
  v84[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2;
  v84[3] = &unk_1E60DB738;
  v14 = v12;
  v85 = v14;
  v15 = v13;
  v89 = v15;
  v91 = v98;
  v16 = v8;
  v86 = v16;
  v17 = v9;
  v87 = v17;
  v92 = v100;
  v18 = v7;
  v88 = v18;
  v45 = v6;
  v90 = v45;
  v19 = (void *)MEMORY[0x1B5E08DC4](v84);
  v78[0] = v11;
  v78[1] = 3221225472;
  v78[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_4;
  v78[3] = &unk_1E60DB5F8;
  v20 = v14;
  v79 = v20;
  v82 = v100;
  v44 = v15;
  v80 = v44;
  v83 = v96;
  v21 = v19;
  v81 = v21;
  v22 = (void *)MEMORY[0x1B5E08DC4](v78);
  v74[0] = v11;
  v74[1] = 3221225472;
  v74[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_102;
  v74[3] = &unk_1E60DB440;
  v23 = v20;
  v75 = v23;
  v77 = v102;
  v24 = v21;
  v76 = v24;
  objc_msgSend(v18, "setCancellationHandler:", v74);
  v66[0] = v11;
  v66[1] = 3221225472;
  v66[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_104;
  v66[3] = &unk_1E60DB620;
  v25 = v23;
  v71 = v102;
  v72 = v100;
  v73 = a2;
  v67 = v25;
  v68 = v43;
  v26 = v46;
  v69 = v26;
  v27 = v24;
  v70 = v27;
  v55[0] = v11;
  v55[1] = 3221225472;
  v55[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_107;
  v55[3] = &unk_1E60DB6E8;
  v28 = (id)MEMORY[0x1B5E08DC4](v66);
  v56 = v16;
  v57 = v26;
  v62 = v28;
  v58 = v17;
  v29 = v25;
  v59 = v29;
  v30 = v27;
  v63 = v30;
  v60 = v43;
  v31 = v18;
  v61 = v31;
  v64 = v22;
  v65 = v98;
  v32 = v22;
  v47 = v17;
  v49 = v26;
  v33 = v16;
  v34 = (void *)MEMORY[0x1B5E08DC4](v55);
  v35 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_116;
  v50[3] = &unk_1E60DB710;
  v52 = v28;
  v53 = v34;
  v50[4] = v43;
  v51 = v31;
  v54 = v30;
  v36 = v50;
  block[0] = v35;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v105 = v36;
  v37 = v29;
  v38 = v30;
  v39 = v31;
  v40 = v34;
  v41 = v28;
  v42 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v37, v42);

  _Block_object_dispose(v96, 8);
  _Block_object_dispose(v98, 8);

  _Block_object_dispose(v100, 8);
  _Block_object_dispose(v102, 8);

}

- (void)noteMainScopeHasBeenActivated
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CPLEngineLibrary_noteMainScopeHasBeenActivated__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)requestScopesWithIdentifiersToBeActivated:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CPLEngineStore *v10;
  void *v11;
  OS_dispatch_queue *v12;
  uint64_t v13;
  OS_dispatch_queue *v14;
  void *v15;
  OS_dispatch_queue *v16;
  id v17;
  id v18;
  void *v19;
  OS_dispatch_queue *v20;
  id v21;
  id v22;
  OS_dispatch_queue *v23;
  id v24;
  OS_dispatch_queue *v25;
  id v26;
  id v27;
  void *v28;
  OS_dispatch_queue *v29;
  id v30;
  id v31;
  void *v32;
  OS_dispatch_queue *v33;
  id v34;
  id v35;
  id v36;
  CPLEngineStore *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  CPLEngineStore *v46;
  void *v47;
  id v48;
  SEL v49;
  id v50;
  CPLEngineLibrary *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  OS_dispatch_queue *v56;
  CPLEngineStore *v57;
  CPLEngineLibrary *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD *v64;
  _QWORD v65[4];
  OS_dispatch_queue *v66;
  CPLEngineLibrary *v67;
  id v68;
  id v69;
  _QWORD *v70;
  SEL v71;
  _QWORD v72[4];
  OS_dispatch_queue *v73;
  CPLEngineLibrary *v74;
  id v75;
  id v76;
  _QWORD *v77;
  _QWORD v78[4];
  OS_dispatch_queue *v79;
  id v80;
  _QWORD *v81;
  _QWORD v82[4];
  OS_dispatch_queue *v83;
  id v84;
  id v85;
  id v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD v89[4];
  OS_dispatch_queue *v90;
  CPLEngineStore *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD v98[4];
  OS_dispatch_queue *v99;
  _QWORD *v100;
  _QWORD v101[5];
  id v102;
  _QWORD v103[5];
  id v104;
  _QWORD v105[3];
  char v106;
  _QWORD v107[3];
  char v108;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x2020000000;
  v108 = 0;
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  v106 = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x3032000000;
  v103[3] = __Block_byref_object_copy__14519;
  v103[4] = __Block_byref_object_dispose__14520;
  v104 = 0;
  v10 = self->_store;
  -[CPLEngineStore scopes](v10, "scopes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = a2;
  v51 = self;
  v12 = self->_queue;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v7);
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3032000000;
  v101[3] = __Block_byref_object_copy__14519;
  v101[4] = __Block_byref_object_dispose__14520;
  v102 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke;
  v98[3] = &unk_1E60DC8A0;
  v14 = v12;
  v99 = v14;
  v100 = v101;
  v15 = (void *)MEMORY[0x1B5E08DC4](v98);
  v89[0] = v13;
  v89[1] = 3221225472;
  v89[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2;
  v89[3] = &unk_1E60DB738;
  v16 = v14;
  v90 = v16;
  v96 = v103;
  v46 = v10;
  v91 = v46;
  v44 = v11;
  v92 = v44;
  v97 = v105;
  v17 = v15;
  v94 = v17;
  v18 = v9;
  v93 = v18;
  v42 = v8;
  v95 = v42;
  v19 = (void *)MEMORY[0x1B5E08DC4](v89);
  v82[0] = v13;
  v82[1] = 3221225472;
  v82[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_4;
  v82[3] = &unk_1E60DB790;
  v20 = v16;
  v83 = v20;
  v87 = v105;
  v41 = v17;
  v85 = v41;
  v88 = v101;
  v21 = v7;
  v84 = v21;
  v22 = v19;
  v86 = v22;
  v43 = (void *)MEMORY[0x1B5E08DC4](v82);
  v78[0] = v13;
  v78[1] = 3221225472;
  v78[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_123;
  v78[3] = &unk_1E60DB440;
  v23 = v20;
  v79 = v23;
  v81 = v107;
  v24 = v22;
  v80 = v24;
  objc_msgSend(v18, "setCancellationHandler:", v78);
  v72[0] = v13;
  v72[1] = 3221225472;
  v72[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3_125;
  v72[3] = &unk_1E60DB7B8;
  v25 = v23;
  v77 = v107;
  v73 = v25;
  v74 = v51;
  v26 = v21;
  v75 = v26;
  v27 = v24;
  v76 = v27;
  v28 = (void *)MEMORY[0x1B5E08DC4](v72);
  v65[0] = v13;
  v65[1] = 3221225472;
  v65[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_126;
  v65[3] = &unk_1E60DB7E0;
  v29 = v25;
  v70 = v103;
  v71 = v49;
  v66 = v29;
  v67 = v51;
  v30 = v18;
  v68 = v30;
  v31 = v43;
  v69 = v31;
  v32 = (void *)MEMORY[0x1B5E08DC4](v65);
  v52[0] = v13;
  v52[1] = 3221225472;
  v52[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_129;
  v52[3] = &unk_1E60DB880;
  v50 = v26;
  v53 = v50;
  v45 = v44;
  v54 = v45;
  v48 = v47;
  v55 = v48;
  v33 = v29;
  v56 = v33;
  v34 = v27;
  v60 = v34;
  v35 = v28;
  v61 = v35;
  v36 = v31;
  v62 = v36;
  v37 = v46;
  v64 = v103;
  v57 = v37;
  v58 = v51;
  v38 = v32;
  v63 = v38;
  v39 = v30;
  v59 = v39;
  v40 = -[CPLEngineStore performReadTransactionWithBlock:](v37, "performReadTransactionWithBlock:", v52);

  _Block_object_dispose(v101, 8);
  _Block_object_dispose(v103, 8);

  _Block_object_dispose(v105, 8);
  _Block_object_dispose(v107, 8);

}

- (void)forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  void (**v26)(_QWORD);
  uint8_t buf[16];
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD *v36;
  _QWORD v37[7];
  _QWORD v38[3];
  char v39;
  _QWORD v40[5];
  id v41;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__14519;
  v40[4] = __Block_byref_object_dispose__14520;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke;
  v37[3] = &unk_1E60DD460;
  v37[4] = self;
  v37[5] = v40;
  v37[6] = v38;
  objc_msgSend(v11, "setCancellationHandler:", v37);
  v34[0] = v12;
  v34[1] = 3221225472;
  v34[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_135;
  v34[3] = &unk_1E60DB8D0;
  v34[4] = self;
  v36 = v38;
  v13 = v9;
  v35 = v13;
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_2_138;
  v28[3] = &unk_1E60DB9E8;
  v28[4] = self;
  v14 = (id)MEMORY[0x1B5E08DC4](v34);
  v31 = v14;
  v33 = v40;
  v15 = v8;
  v29 = v15;
  v16 = v11;
  v30 = v16;
  v17 = v13;
  v32 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x1B5E08DC4](v28);
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLBackupOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "Starting forced backup - asking client to push all pending changes first", buf, 2u);
      }

    }
    objc_msgSend(v16, "becomeCurrentWithPendingUnitCount:", 1);
    v21 = v12;
    v22 = 3221225472;
    v23 = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_141;
    v24 = &unk_1E60DB920;
    v25 = v17;
    v26 = v18;
    -[CPLEngineLibrary requestClientToPushAllChangesWithCompletionHandler:](self, "requestClientToPushAllChangesWithCompletionHandler:", &v21);
    objc_msgSend(v16, "resignCurrent", v21, v22, v23, v24);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLBackupOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Starting forced backup", buf, 2u);
      }

    }
    v18[2](v18);
  }

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

}

- (void)forceInitialDownloadWithActivity:(id)a3 scopeIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *v13;
  uint64_t v14;
  OS_dispatch_queue *v15;
  id v16;
  id v17;
  void *v18;
  OS_dispatch_queue *v19;
  id v20;
  id v21;
  OS_dispatch_queue *v22;
  id v23;
  id v24;
  void *v25;
  OS_dispatch_queue *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  OS_dispatch_queue *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  CPLEngineStore *v37;
  id v38;
  OS_dispatch_queue *v39;
  id v40;
  id v41;
  id v42;
  CPLEngineStore *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  CPLEngineStore *v47;
  id v48;
  OS_dispatch_queue *v49;
  id v50;
  id v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD v54[4];
  OS_dispatch_queue *v55;
  CPLEngineLibrary *v56;
  id v57;
  id v58;
  id v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD v62[4];
  OS_dispatch_queue *v63;
  CPLEngineLibrary *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD *v69;
  __int128 *v70;
  _QWORD v71[4];
  OS_dispatch_queue *v72;
  id v73;
  CPLEngineLibrary *v74;
  id v75;
  _QWORD *v76;
  _QWORD v77[4];
  OS_dispatch_queue *v78;
  id v79;
  id v80;
  _QWORD v81[4];
  OS_dispatch_queue *v82;
  id v83;
  id v84;
  CPLEngineLibrary *v85;
  id v86;
  _QWORD *v87;
  __int128 *p_buf;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  _QWORD v93[3];
  char v94;
  _QWORD v95[5];
  id v96;
  _QWORD v97[3];
  char v98;
  _QWORD v99[3];
  char v100;
  __int128 buf;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v8 = a4;
  v9 = a5;
  if (!_CPLSilentLogging)
  {
    __CPLInitialDownloadOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Forcing initial download of %{public}@", (uint8_t *)&buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x2020000000;
  v100 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__14519;
  v104 = __Block_byref_object_dispose__14520;
  v105 = 0;
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x2020000000;
  v98 = 0;
  v43 = self->_store;
  v13 = self->_queue;
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x3032000000;
  v95[3] = __Block_byref_object_copy__14519;
  v95[4] = __Block_byref_object_dispose__14520;
  v96 = 0;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  v94 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke;
  v81[3] = &unk_1E60DB998;
  v15 = v13;
  v82 = v15;
  v87 = v99;
  v16 = v12;
  v92 = 3;
  v83 = v16;
  p_buf = &buf;
  v17 = v8;
  v84 = v17;
  v89 = v93;
  v90 = v97;
  v42 = v9;
  v85 = self;
  v86 = v42;
  v91 = v95;
  v18 = (void *)MEMORY[0x1B5E08DC4](v81);
  v77[0] = v14;
  v77[1] = 3221225472;
  v77[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_5;
  v77[3] = &unk_1E60D70C8;
  v19 = v15;
  v78 = v19;
  v20 = v17;
  v79 = v20;
  v21 = v18;
  v80 = v21;
  objc_msgSend(v16, "setCancellationHandler:", v77);
  v71[0] = v14;
  v71[1] = 3221225472;
  v71[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_146;
  v71[3] = &unk_1E60DB9C0;
  v22 = v19;
  v72 = v22;
  v76 = v99;
  v23 = v16;
  v73 = v23;
  v74 = self;
  v24 = v21;
  v75 = v24;
  v25 = (void *)MEMORY[0x1B5E08DC4](v71);
  v62[0] = v14;
  v62[1] = 3221225472;
  v62[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_150;
  v62[3] = &unk_1E60DBA38;
  v26 = v22;
  v69 = v99;
  v70 = &buf;
  v63 = v26;
  v64 = self;
  v45 = v44;
  v65 = v45;
  v27 = v24;
  v67 = v27;
  v28 = v23;
  v66 = v28;
  v29 = v25;
  v68 = v29;
  v30 = (void *)MEMORY[0x1B5E08DC4](v62);
  v54[0] = v14;
  v54[1] = 3221225472;
  v54[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_155;
  v54[3] = &unk_1E60DBAB0;
  v31 = v26;
  v55 = v31;
  v56 = self;
  v60 = v99;
  v61 = v97;
  v32 = v28;
  v57 = v32;
  v33 = v27;
  v58 = v33;
  v34 = v30;
  v59 = v34;
  v35 = (void *)MEMORY[0x1B5E08DC4](v54);
  v46[0] = v14;
  v46[1] = 3221225472;
  v46[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_158;
  v46[3] = &unk_1E60DBB00;
  v46[4] = self;
  v36 = v33;
  v50 = v36;
  v37 = v43;
  v47 = v37;
  v38 = v20;
  v48 = v38;
  v39 = v31;
  v49 = v39;
  v52 = v95;
  v40 = v35;
  v51 = v40;
  v53 = v93;
  v41 = -[CPLEngineStore performReadTransactionWithBlock:](v37, "performReadTransactionWithBlock:", v46);

  _Block_object_dispose(v93, 8);
  _Block_object_dispose(v95, 8);

  _Block_object_dispose(v97, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v99, 8);
}

- (void)blockEngineWithReason:(id)a3 onlyIfBlocked:(BOOL)a4 block:(id)a5
{
  _BOOL8 v5;
  id v8;
  CPLEngineScheduler *scheduler;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  v8 = a5;
  scheduler = self->_scheduler;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CPLEngineLibrary_blockEngineWithReason_onlyIfBlocked_block___block_invoke;
  v11[3] = &unk_1E60DBB50;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[CPLEngineScheduler blockAllSyncSessionsWithReason:onlyIfBlocked:block:](scheduler, "blockAllSyncSessionsWithReason:onlyIfBlocked:block:", a3, v5, v11);

}

- (void)performMaintenanceCleanupWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  NSObject *v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[4];
  NSObject *v25;
  CPLEngineLibrary *v26;
  _QWORD *v27;
  _QWORD *v28;
  SEL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[3];
  char v34;
  _QWORD v35[3];
  char v36;

  v5 = a3;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  CPLCopyDefaultSerialQueueAttributes();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.cpl.enginelibrary.maintenance", v6);

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke;
  v30[3] = &unk_1E60D6708;
  v10 = v8;
  v31 = v10;
  v11 = v5;
  v32 = v11;
  v12 = (void *)MEMORY[0x1B5E08DC4](v30);
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2;
  v24[3] = &unk_1E60DBB78;
  v13 = v7;
  v25 = v13;
  v26 = self;
  v28 = v35;
  v29 = a2;
  v27 = v33;
  objc_msgSend(v10, "setCancellationHandler:", v24);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 1;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_167;
  v16[3] = &unk_1E60DBC40;
  v16[4] = self;
  v14 = v13;
  v17 = v14;
  v19 = v33;
  v20 = v22;
  v15 = v12;
  v18 = v15;
  v21 = v35;
  objc_msgSend(v10, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v16);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

}

- (void)emergencyClose
{
  -[CPLEngineLibrarySupervisor engineWillClose:](self->_supervisor, "engineWillClose:", self);
  -[CPLEngineStore emergencyClose](self->_store, "emergencyClose");
}

- (NSArray)processesInvolvedInSyncSessions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[CPLEngineStore derivativesCache](self->_store, "derivativesCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v3, "derivativeGeneratorClass"), "involvedProcesses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CPLEngineTransport involvedProcesses](self->_transport, "involvedProcesses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  return (NSArray *)v5;
}

- (NSString)clientAppBundleIdentifier
{
  void *v2;
  void *v3;

  -[CPLEngineLibrary libraryIdentifier](self, "libraryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CPLBundleIdentifierForLibraryIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (NSString)mainScopeIdentifier
{
  return self->_mainScopeIdentifier;
}

- (NSURL)clientLibraryBaseURL
{
  return self->_clientLibraryBaseURL;
}

- (NSURL)cloudLibraryStateStorageURL
{
  return self->_cloudLibraryStateStorageURL;
}

- (NSURL)cloudLibraryResourceStorageURL
{
  return self->_cloudLibraryResourceStorageURL;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (BOOL)isSystemLibrary
{
  return self->_isSystemLibrary;
}

- (BOOL)isAppLibrary
{
  return self->_isAppLibrary;
}

- (unint64_t)libraryOptions
{
  return self->_libraryOptions;
}

- (CPLEngineLibraryOwner)owner
{
  return (CPLEngineLibraryOwner *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (CPLEngineLibrarySupervisor)supervisor
{
  return self->_supervisor;
}

- (void)setSupervisor:(id)a3
{
  objc_storeStrong((id *)&self->_supervisor, a3);
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (CPLEngineScheduler)scheduler
{
  return self->_scheduler;
}

- (CPLEngineSyncManager)syncManager
{
  return self->_syncManager;
}

- (CPLEngineTransport)transport
{
  return self->_transport;
}

- (CPLEngineSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (CPLEngineFeedbackManager)feedback
{
  return self->_feedback;
}

- (CPLConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)libraryIsCorrupted
{
  return self->_libraryIsCorrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_supervisor, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudLibraryResourceStorageURL, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStateStorageURL, 0);
  objc_storeStrong((id *)&self->_clientLibraryBaseURL, 0);
  objc_storeStrong((id *)&self->_mainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_currentClosingComponentName, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong(&self->_metricsObserver, 0);
  objc_storeStrong((id *)&self->_mostRecentScopeStatusCountsDidChangeNotificationDate, 0);
  objc_storeStrong((id *)&self->_timerForPushRepositoryFlagsCountsHaveChanged, 0);
  objc_storeStrong(&self->_pingRequestToPushAllChanges, 0);
  objc_storeStrong((id *)&self->_holdTestAssertions, 0);
  objc_storeStrong((id *)&self->_cachedLastQuarantineCountReportDate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_openingError, 0);
  objc_storeStrong((id *)&self->_invalidAttachedObjects, 0);
  objc_storeStrong((id *)&self->_attachedObjects, 0);
  objc_storeStrong((id *)&self->_blocksToDispatchWhenLibraryAttaches, 0);
  objc_storeStrong((id *)&self->_closingQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

uint64_t __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  _QWORD block[4];
  id v11;

  v1 = *(void **)(a1 + 32);
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E60DDAF8;
  v3 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 40);
  v9 = v3;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v11 = v4;
  v5 = v1;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_167(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 232);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2_168;
  v17[3] = &unk_1E60DBBF0;
  v17[4] = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 64);
  v18 = v6;
  v20 = v7;
  v12 = *(_OWORD *)(a1 + 48);
  v8 = (id)v12;
  v19 = v12;
  v21 = *(_QWORD *)(a1 + 72);
  v13[0] = v2;
  v13[1] = 3221225472;
  v13[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3_172;
  v13[3] = &unk_1E60DBC18;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 72);
  v14 = v9;
  v16 = v10;
  v15 = *(id *)(a1 + 48);
  v11 = (id)objc_msgSend(v5, "performWriteTransactionWithBlock:completionHandler:", v17, v13);

}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2_168(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3_169;
  v9[3] = &unk_1E60DBBC8;
  v4 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  v10 = v5;
  v12 = v6;
  v8 = *(_OWORD *)(a1 + 48);
  v7 = (id)v8;
  v11 = v8;
  v13 = *(_QWORD *)(a1 + 72);
  objc_msgSend(a2, "do:", v9);

}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3_172(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  _QWORD block[4];
  id v11;

  v1 = *(void **)(a1 + 32);
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_4;
  v8[3] = &unk_1E60DB418;
  v7 = *(_OWORD *)(a1 + 40);
  v3 = (id)v7;
  v9 = v7;
  v4 = v8;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v11 = v4;
  v5 = v1;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_4(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3_169(uint64_t a1, _QWORD *a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _QWORD *v20;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  uint64_t v24;
  _QWORD block[4];
  __int128 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[8];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Performing store maintenance", buf, 2u);
    }

  }
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "storages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v20 = a2;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        v13 = (void *)MEMORY[0x1B5E08BF0]();
        v27 = v11;
        LODWORD(v12) = objc_msgSend(v12, "performMaintenanceWithError:", &v27);
        v8 = v27;

        if (!(_DWORD)v12)
        {
          objc_autoreleasePoolPop(v13);

          if (v20)
          {
            v8 = objc_retainAutorelease(v8);
            v18 = 0;
            *v20 = v8;
          }
          else
          {
            v18 = 0;
          }
          goto LABEL_22;
        }
        v14 = *(NSObject **)(a1 + 40);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_170;
        block[3] = &unk_1E60DB8A8;
        v26 = *(_OWORD *)(a1 + 56);
        dispatch_sync(v14, block);
        v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        objc_autoreleasePoolPop(v13);
        if (!v15)
          goto LABEL_16;
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_16:

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2_171;
    v22[3] = &unk_1E60DBBA0;
    v16 = *(NSObject **)(a1 + 40);
    v22[4] = *(_QWORD *)(a1 + 32);
    v21 = *(_OWORD *)(a1 + 48);
    v17 = (id)v21;
    v23 = v21;
    v24 = *(_QWORD *)(a1 + 72);
    dispatch_sync(v16, v22);

  }
  v18 = 1;
LABEL_22:

  return v18;
}

uint64_t __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_170(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
  return result;
}

_QWORD *__67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2_171(_QWORD *result)
{
  _QWORD *v1;

  if (!*(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24))
  {
    v1 = result;
    result = (_QWORD *)objc_msgSend(*(id *)(result[4] + 232), "startVacuumWithCompletionHandler:", result[5]);
    *(_BYTE *)(*(_QWORD *)(v1[7] + 8) + 24) = 1;
  }
  return result;
}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  const char *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_opt_class();
      v4 = (const char *)a1[7];
      v5 = v3;
      NSStringFromSelector(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "-[%@ %@] was cancelled by caller", (uint8_t *)&v7, 0x16u);

    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    objc_msgSend(*(id *)(a1[4] + 232), "stopVacuum");
}

void __62__CPLEngineLibrary_blockEngineWithReason_onlyIfBlocked_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__CPLEngineLibrary_blockEngineWithReason_onlyIfBlocked_block___block_invoke_2;
    v6[3] = &unk_1E60DBB28;
    v7 = v3;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "blockWriteTransactionsWithCompletionHandler:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __62__CPLEngineLibrary_blockEngineWithReason_onlyIfBlocked_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CPLEngineBlocker *v4;

  v3 = a2;
  v4 = -[CPLEngineBlocker initWithWriteTransactionBlocker:schedulerBlocker:]([CPLEngineBlocker alloc], "initWithWriteTransactionBlocker:schedulerBlocker:", v3, *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (!*(_BYTE *)(v4 + 24))
  {
    v5 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(v4 + 24) = 1;
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2;
    v23[3] = &unk_1E60DB948;
    v24 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 112);
    v7 = *(_QWORD *)(a1 + 80);
    v25 = v6;
    v29 = v7;
    v26 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 64);
    v30 = *(_OWORD *)(a1 + 88);
    v27 = *(_QWORD *)(a1 + 56);
    v28 = v8;
    v9 = MEMORY[0x1B5E08DC4](v23);
    v10 = (void *)v9;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "store");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scopes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "store");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_144;
      v20[3] = &unk_1E60DDB58;
      v14 = *(_QWORD *)(a1 + 104);
      v21 = v12;
      v22 = v14;
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3;
      v17[3] = &unk_1E60DD500;
      v18 = *(id *)(a1 + 32);
      v19 = v10;
      v15 = v12;
      v16 = (id)objc_msgSend(v13, "performWriteTransactionWithBlock:completionHandler:", v20, v17);

    }
  }

}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD block[4];
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_6;
  v7[3] = &unk_1E60D6708;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v11 = v4;
  v5 = v3;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_146(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v7 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v3 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_147;
    v8[3] = &unk_1E60D70C8;
    v4 = v7;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v9 = v4;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v3, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_150(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CPLEngineDownloadSyncTask *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v7 = -[CPLEngineForceSyncTask initWithScopeIdentifiers:engineLibrary:filter:delegate:]([CPLEngineDownloadSyncTask alloc], "initWithScopeIdentifiers:engineLibrary:filter:delegate:", v6, *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setTaskActivity:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setTaskIdentifier:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setBypassForceSyncLimitations:", 1);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3_152;
    v19 = &unk_1E60DBA10;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 80);
    v20 = v12;
    v25 = v13;
    v23 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 72);
    v22 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setTaskDidFinishWithErrorBlock:", &v16);
    if (!_CPLSilentLogging)
    {
      __CPLInitialDownloadOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v27 = v15;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Starting %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "launchTask", v16, v17, v18, v19);

  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a2;
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "disableSynchronizationWithReason:", CFSTR("initial download"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_156;
    v8[3] = &unk_1E60DBA88;
    v6 = *(void **)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v9 = v7;
    v10 = v5;
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_158(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  NSObject *v25;
  id v26;
  dispatch_block_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  NSObject *v31;
  dispatch_block_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _BYTE v53[128];
  __int128 block;
  void (*v55)(uint64_t);
  void *v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3_159;
    v50[3] = &unk_1E60DB970;
    v52 = *(id *)(a1 + 64);
    v51 = v3;
    v7 = v50;
    *(_QWORD *)&block = v5;
    *((_QWORD *)&block + 1) = 3221225472;
    v55 = __cpl_dispatch_async_block_invoke_14500;
    v56 = &unk_1E60D71F8;
    v57 = v7;
    v8 = v6;
    v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v8, v9);

    v10 = v52;
  }
  else
  {
    v34 = v3;
    objc_msgSend(*(id *)(a1 + 40), "scopes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v33 = a1;
    v11 = *(id *)(a1 + 48);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v47;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v47 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v15);
          objc_msgSend(v10, "scopeWithIdentifier:", v16, v33);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17
            || (objc_msgSend(v10, "valueForFlag:forScope:", 16, v17) & 1) != 0
            || (objc_msgSend(v10, "hasFinishedInitialDownloadForScope:", v17) & 1) != 0)
          {
            if (!_CPLSilentLogging)
            {
              __CPLInitialDownloadOSLogDomain();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(block) = 138543362;
                *(_QWORD *)((char *)&block + 4) = v16;
                _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ does not need to perform initial download", (uint8_t *)&block, 0xCu);
              }

            }
          }
          else
          {
            objc_msgSend(v36, "addObject:", v16);
            objc_msgSend(v35, "addObject:", v17);
          }

          ++v15;
        }
        while (v13 != v15);
        v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        v13 = v19;
      }
      while (v19);
    }

    if (objc_msgSend(v36, "count"))
    {
      objc_msgSend(v10, "filterForIncludedScopeIdentifiers:", v36);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(v33 + 56);
      v22 = MEMORY[0x1E0C809B0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_161;
      v40[3] = &unk_1E60DBAD8;
      v45 = *(_QWORD *)(v33 + 80);
      v23 = v35;
      v41 = v35;
      v44 = *(id *)(v33 + 72);
      v42 = v20;
      v43 = v36;
      v24 = v40;
      *(_QWORD *)&block = v22;
      *((_QWORD *)&block + 1) = 3221225472;
      v55 = __cpl_dispatch_async_block_invoke_14500;
      v56 = &unk_1E60D71F8;
      v57 = v24;
      v25 = v21;
      v26 = v20;
      v27 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v25, v27);

    }
    else
    {
      v28 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_162;
      v37[3] = &unk_1E60DB418;
      v39 = *(_QWORD *)(v33 + 88);
      v29 = *(void **)(v33 + 56);
      v38 = *(id *)(v33 + 64);
      v30 = v37;
      *(_QWORD *)&block = v28;
      *((_QWORD *)&block + 1) = 3221225472;
      v55 = __cpl_dispatch_async_block_invoke_14500;
      v56 = &unk_1E60D71F8;
      v57 = v30;
      v31 = v29;
      v32 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v31, v32);

      v26 = v38;
      v23 = v35;
    }

    v3 = v34;
  }

}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3_159(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_161(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);

}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_162(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_156(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint8_t buf[16];

  if (!_CPLSilentLogging)
  {
    __CPLInitialDownloadOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Making sure client has pushed all changes", buf, 2u);
    }

  }
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_157;
  v4[3] = &unk_1E60DBA60;
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "requestClientToPushAllChangesWithCompletionHandler:", v4);

}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_157(_QWORD *a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  else
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3_152(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_4_153;
  v11[3] = &unk_1E60DB9E8;
  v17 = *(_QWORD *)(a1 + 72);
  v12 = v4;
  v15 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 48);
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v7;
  v8 = v5;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_4_153(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 24))
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 32);
    if (v2)
    {
      v3 = *(_QWORD *)(result + 56);
    }
    else
    {
      objc_msgSend(*(id *)(result + 40), "setCompletedUnitCount:", 2);
      v3 = *(_QWORD *)(v1 + 64);
      v2 = *(_QWORD *)(v1 + 48);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
  }
  return result;
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_147(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLInitialDownloadOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(", "));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Making sure client has pulled all changes for %@", buf, 0xCu);

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_148;
  v6[3] = &unk_1E60D7268;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "requestClientToPullAllChangesWithScopeIdentifiers:completionHandler:", v5, v6);

}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLInitialDownloadOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(", "));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Forced initial download of %{public}@ has been cancelled", (uint8_t *)&v6, 0xCu);

    }
  }
  v4 = *(_QWORD *)(a1 + 40);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", *(_QWORD *)(a1 + 96));
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v5)
  {
    objc_msgSend(v5, "cancelTask");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  if (!v3)
  {
    if (_CPLSilentLogging)
      goto LABEL_17;
    __CPLInitialDownloadOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v9;
    v10 = "Initial download of %{public}@ finished successfully";
LABEL_11:
    v11 = v8;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 12;
LABEL_15:
    _os_log_impl(&dword_1B03C2000, v11, v12, v10, (uint8_t *)&v14, v13);

    goto LABEL_16;
  }
  if (objc_msgSend(v3, "isCPLOperationCancelledError"))
  {
    if (_CPLSilentLogging)
      goto LABEL_17;
    __CPLInitialDownloadOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v9;
    v10 = "Initial download of %{public}@ has been cancelled";
    goto LABEL_11;
  }
  if (_CPLSilentLogging)
    goto LABEL_17;
  __CPLInitialDownloadOSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    v10 = "Initial download of %{public}@ finished with error: %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), v3, v4);
  objc_msgSend(*(id *)(a1 + 40), "setCancellationHandler:", 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 240), "enableSynchronizationWithReason:", CFSTR("initial download"));

}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_144(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_145;
  v6[3] = &unk_1E60DD7C0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_4;
  v11[3] = &unk_1E60DB970;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v12 = v3;
  v13 = v6;
  v7 = v11;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_145(uint64_t a1, _QWORD *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "validLocalScopeIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsIndex:", objc_msgSend(v11, "localIndex")))
        {
          v12 = *(void **)(a1 + 32);
          v17 = v8;
          v13 = objc_msgSend(v12, "setHasFinishedInitialDownloadForScope:error:", v11, &v17);
          v14 = v17;

          if (!v13)
          {

            if (a2)
            {
              v14 = objc_retainAutorelease(v14);
              v15 = 0;
              *a2 = v14;
            }
            else
            {
              v15 = 0;
            }
            goto LABEL_17;
          }
          v8 = v14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  v15 = 1;
  v14 = v8;
LABEL_17:

  return v15;
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  dispatch_block_t v5;
  _QWORD v6[4];
  __int128 v7;
  _QWORD block[4];
  id v9;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60DB8A8;
  v7 = *(_OWORD *)(a1 + 40);
  v3 = v6;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v9 = v3;
  v4 = v1;
  v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);

}

uint64_t __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_135(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16));
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v2 = a1[5];
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (void *)v3;
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);

    return 0;
  }
  if (*(_BYTE *)(a1[4] + 80))
  {
    v2 = a1[5];
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("closed"));
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return 1;
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_2_138(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_3;
  v10[3] = &unk_1E60DB9E8;
  v4 = *(id *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v13 = v4;
  v10[4] = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 64);
  v7 = v10;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v17 = v7;
  v8 = v3;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v9);

}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "isCPLErrorWithCode:", 255))
  {
    if (!_CPLSilentLogging)
    {
      __CPLBackupOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Client might not have pushed all changes yet - continuing backup nonetheless", (uint8_t *)&v7, 2u);
      }

    }
    goto LABEL_8;
  }
  if (!_CPLSilentLogging)
  {
    __CPLBackupOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Client failed to push all changes to engine: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_14:
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_3(uint64_t a1)
{
  CPLEngineBackupSyncTask *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    v2 = -[CPLEngineBackupSyncTask initWithEngineLibrary:delegate:]([CPLEngineBackupSyncTask alloc], "initWithEngineLibrary:delegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setTaskActivity:", *(_QWORD *)(a1 + 40));
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTaskIdentifier:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setBypassForceSyncLimitations:", 1);
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_4;
    v16 = &unk_1E60DB8F8;
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(id *)(a1 + 48);
    v12 = *(_OWORD *)(a1 + 64);
    v9 = (id)v12;
    v19 = v12;
    objc_msgSend(v8, "setTaskDidFinishWithErrorBlock:", &v13);
    if (!_CPLSilentLogging)
    {
      __CPLBackupOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Launching forced backup task %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "launchTask", v12, v13, v14, v15, v16, v17);

  }
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  _QWORD block[4];
  id v19;

  v4 = a3;
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_5;
  v14[3] = &unk_1E60D6820;
  v15 = v5;
  v16 = v4;
  v13 = *(_OWORD *)(a1 + 48);
  v8 = (id)v13;
  v17 = v13;
  v9 = v14;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v9;
  v10 = v6;
  v11 = v4;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    if (_CPLSilentLogging)
    {
      v3 = 0;
      goto LABEL_10;
    }
    __CPLBackupOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v14 = 138412290;
    v15 = v11;
    v7 = "Forced backup task %@ did finish successfully";
    v8 = v4;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_8;
  }
  if (!_CPLSilentLogging)
  {
    __CPLBackupOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v3 = *(_QWORD *)(a1 + 40);
      goto LABEL_10;
    }
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v6 = *(_QWORD *)(a1 + 40);
    v14 = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v7 = "Forced backup task %@ did finish with error %@";
    v8 = v4;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 22;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v8, v9, v7, (uint8_t *)&v14, v10);
    goto LABEL_9;
  }
LABEL_10:
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, v2);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLBackupOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v6 = 138412290;
        v7 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Backup task %@ has been cancelled", (uint8_t *)&v6, 0xCu);
      }

      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v2, "cancelTask");
  }
  else if (!_CPLSilentLogging)
  {
    __CPLBackupOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Backup has been cancelled", (uint8_t *)&v6, 2u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3;
    v16[3] = &unk_1E60DD810;
    v11 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v18 = v8;
    v12 = v8;
    v13 = (id)objc_msgSend(v11, "performReadTransactionWithBlock:", v16);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v4, v5, v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v3, v14, v15);
    objc_msgSend(*(id *)(a1 + 56), "setCancellationHandler:", 0);
  }

}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 32));
    v3 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)&_timeToWaitForClientToActivateScopes);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_5;
    v9[3] = &unk_1E60DB768;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 72);
    v10 = v4;
    v13 = v5;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 56);
    dispatch_source_set_event_handler(v4, v9);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v4;
    v8 = v4;

    dispatch_resume(v8);
  }
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_123(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  _QWORD block[4];
  id v11;

  v1 = *(void **)(a1 + 32);
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2_124;
  v8[3] = &unk_1E60DB418;
  v7 = *(_OWORD *)(a1 + 40);
  v3 = (id)v7;
  v9 = v7;
  v4 = v8;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v11 = v4;
  v5 = v1;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3_125(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 80))
      return 1;
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(", "));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Engine got a request to have %{public}@ activated but it is closed", (uint8_t *)&v7, 0xCu);

      }
    }
    v4 = *(_QWORD *)(a1 + 56);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Engine is closed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  return 0;
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_126(uint64_t a1)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Engine should be observing scopes changes", v8, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 72);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineLibrary.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, v7, 2013, CFSTR("Engine should be observing scopes changes"));

    abort();
  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_129(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  NSObject *v17;
  id v18;
  dispatch_block_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  NSObject *v23;
  dispatch_block_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t block;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v44 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "scopeWithIdentifier:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && (objc_msgSend(*(id *)(a1 + 40), "valueForFlag:forScope:", 16, v8) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 48), "removeObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v4);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3_131;
    v35[3] = &unk_1E60DB830;
    v12 = *(void **)(a1 + 40);
    v36 = *(id *)(a1 + 48);
    v37 = *(id *)(a1 + 56);
    v38 = *(id *)(a1 + 88);
    v39 = *(id *)(a1 + 96);
    v40 = *(id *)(a1 + 104);
    objc_msgSend(v12, "addScopeFlagsObserver:withIdentifier:", v35, v10);
    v13 = *(void **)(a1 + 56);
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_6;
    v25[3] = &unk_1E60DB858;
    v31 = *(id *)(a1 + 96);
    v26 = *(id *)(a1 + 64);
    v27 = *(id *)(a1 + 40);
    v28 = v10;
    v14 = *(_QWORD *)(a1 + 72);
    v15 = *(void **)(a1 + 112);
    v34 = *(_QWORD *)(a1 + 120);
    v29 = v14;
    v32 = v15;
    v30 = *(id *)(a1 + 80);
    v33 = *(id *)(a1 + 88);
    v16 = v25;
    block = v11;
    v48 = 3221225472;
    v49 = __cpl_dispatch_async_block_invoke_14500;
    v50 = &unk_1E60D71F8;
    v51 = v16;
    v17 = v13;
    v18 = v10;
    v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v17, v19);

  }
  else
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = *(void **)(a1 + 56);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2_130;
    v41[3] = &unk_1E60D71F8;
    v42 = *(id *)(a1 + 88);
    v22 = v41;
    block = v20;
    v48 = 3221225472;
    v49 = __cpl_dispatch_async_block_invoke_14500;
    v50 = &unk_1E60D71F8;
    v51 = v22;
    v23 = v21;
    v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v23, v24);

    v18 = v42;
  }

}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2_130(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3_131(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  _QWORD *v11;
  NSObject *v12;
  dispatch_block_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  NSObject *v17;
  dispatch_block_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t block;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;

  v6 = a4;
  objc_msgSend(a3, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7)
    || (objc_msgSend(v6, "valueForFlag:", 16) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7), objc_msgSend(*(id *)(a1 + 32), "count")))
  {
    v8 = *(void **)(a1 + 40);
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_5_133;
    v19[3] = &unk_1E60DB808;
    v10 = &v20;
    v20 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 64);
    v11 = v19;
    block = v9;
    v25 = 3221225472;
    v26 = __cpl_dispatch_async_block_invoke_14500;
    v27 = &unk_1E60D71F8;
    v28 = v11;
    v12 = v8;
    v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v12, v13);

  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_4_132;
    v22[3] = &unk_1E60D71F8;
    v10 = &v23;
    v15 = *(void **)(a1 + 40);
    v23 = *(id *)(a1 + 48);
    v16 = v22;
    block = v14;
    v25 = 3221225472;
    v26 = __cpl_dispatch_async_block_invoke_14500;
    v27 = &unk_1E60D71F8;
    v28 = v16;
    v17 = v15;
    v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v17, v18);

  }
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "_libraryObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "setCompletedUnitCount:", 1);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_8;
      v6[3] = &unk_1E60DB5D0;
      v4 = *(void **)(a1 + 64);
      v6[4] = *(_QWORD *)(a1 + 56);
      v7 = *(id *)(a1 + 72);
      v8 = *(id *)(a1 + 80);
      v9 = *(id *)(a1 + 88);
      objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v6);

    }
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_7;
    v10[3] = &unk_1E60DD810;
    v2 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v3 = (id)objc_msgSend(v2, "performReadTransactionWithBlock:", v10);

  }
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeScopeFlagsObserverWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_8(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_9;
  v3[3] = &unk_1E60DB5A8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performBlockOnLibrary:", v3);

}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_9(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
  {
    if (a2)
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Engine failed to get a client to get scopes activated", v7, 2u);
        }

      }
      (*(void (**)(void))(a1[6] + 16))();
    }
  }

}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_4_132(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_5_133(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2_124(uint64_t a1)
{
  uint64_t v1;
  id v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(", "));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Client has not tried to activate %@ for a long time", buf, 0xCu);

      }
    }
    v4 = *(_QWORD *)(a1 + 48);
    v7 = CFSTR("CPLErrorLibraryHasNotBeenActivated");
    v8 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 83, 0, v5, CFSTR("Client failed to activate scopes in time"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeScopeFlagsObserverWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void __49__CPLEngineLibrary_noteMainScopeHasBeenActivated__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasFinishedInitialDownload") & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "mainScopeIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = *(_QWORD *)(a1 + 32);
        v6 = 138543618;
        v7 = v3;
        v8 = 2112;
        v9 = v4;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ for %@ has been activated - signaling owner", (uint8_t *)&v6, 0x16u);

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
    objc_msgSend(WeakRetained, "engineLibraryNeedsInitialDownloadOfMainScope:", *(_QWORD *)(a1 + 32));

  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3;
    v14[3] = &unk_1E60DD810;
    v8 = *(void **)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v16 = v5;
    v9 = v5;
    v10 = (id)objc_msgSend(v8, "performReadTransactionWithBlock:", v14);

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  if (!*(_BYTE *)(v11 + 24))
  {
    *(_BYTE *)(v11 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v3, v12, v13);
    objc_msgSend(*(id *)(a1 + 56), "setCancellationHandler:", 0);
  }

}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD handler[4];
  NSObject *v10;
  id v11;
  uint64_t v12;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 32));
    v3 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)&_timeToWaitForClientToPullChanges);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_5;
    handler[3] = &unk_1E60DB440;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 64);
    v10 = v4;
    v12 = v5;
    v11 = *(id *)(a1 + 48);
    dispatch_source_set_event_handler(v4, handler);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v4;
    v8 = v4;

    dispatch_resume(v8);
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_102(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  _QWORD block[4];
  id v11;

  v1 = *(void **)(a1 + 32);
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_103;
  v8[3] = &unk_1E60DB418;
  v7 = *(_OWORD *)(a1 + 40);
  v3 = (id)v7;
  v9 = v7;
  v4 = v8;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v11 = v4;
  v5 = v1;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_104(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Completion handler should have been called by cancellation handler", (uint8_t *)&v12, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 80);
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineLibrary.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v4, v5, v6, 1827, CFSTR("Completion handler should have been called by cancellation handler"));

      abort();
    }
  }
  else
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 80))
      return 1;
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(", "));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v8;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to pull changes in %{public}@ but it is closed", (uint8_t *)&v12, 0xCu);

      }
    }
    v9 = *(_QWORD *)(a1 + 56);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Engine is closed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  return 0;
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_107(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 80) + 16))())
  {
    v2 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_108;
    v8[3] = &unk_1E60DB6C0;
    v9 = v2;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v3 = *(id *)(a1 + 88);
    v4 = *(_QWORD *)(a1 + 64);
    v15 = v3;
    v13 = v4;
    v16 = *(id *)(a1 + 80);
    v14 = *(id *)(a1 + 72);
    v5 = *(id *)(a1 + 96);
    v6 = *(_QWORD *)(a1 + 104);
    v17 = v5;
    v18 = v6;
    v7 = (id)objc_msgSend(v9, "performReadTransactionWithBlock:", v8);

  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_116(id *a1)
{
  id v2;
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  if ((*((unsigned int (**)(void))a1[6] + 2))())
  {
    objc_msgSend(a1[4], "_libraryObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      (*((void (**)(void))a1[7] + 2))();
    }
    else
    {
      objc_msgSend(a1[5], "setCompletedUnitCount:", 1);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_117;
      v4[3] = &unk_1E60DB5D0;
      v2 = a1[5];
      v4[4] = a1[4];
      v5 = a1[6];
      v6 = a1[7];
      v7 = a1[8];
      objc_msgSend(v2, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v4);

    }
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_117(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_4_118;
  v3[3] = &unk_1E60DB5A8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performBlockOnLibrary:", v3);

}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_4_118(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
  {
    if (a2)
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Engine failed to get a client to get changes pulled", v7, 2u);
        }

      }
      (*(void (**)(void))(a1[6] + 16))();
    }
  }

}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_108(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  dispatch_block_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  dispatch_block_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  __int128 block;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterForIncludedScopeIdentifiers:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 48), "hasSomeChangeWithScopeFilter:", v3) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "notifyAttachedObjectsPullQueueIsFull");
    v4 = *(void **)(a1 + 48);
    v5 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_110;
    v29[3] = &unk_1E60DB670;
    v6 = &v30;
    v30 = v3;
    v31 = *(id *)(a1 + 40);
    v32 = *(id *)(a1 + 56);
    v34 = *(id *)(a1 + 80);
    v35 = *(id *)(a1 + 88);
    v33 = *(id *)(a1 + 72);
    v36 = *(id *)(a1 + 96);
    objc_msgSend(v4, "addDequeueObserverWithDequeueSignalBlock:", v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 56);
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_114;
    v21[3] = &unk_1E60DB698;
    v9 = *(id *)(a1 + 88);
    v28 = *(_QWORD *)(a1 + 104);
    v26 = v9;
    v22 = v7;
    v23 = *(id *)(a1 + 40);
    v27 = *(id *)(a1 + 96);
    v24 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 48);
    v10 = v21;
    *(_QWORD *)&block = v5;
    *((_QWORD *)&block + 1) = 3221225472;
    v40 = __cpl_dispatch_async_block_invoke_14500;
    v41 = &unk_1E60D71F8;
    v42 = v10;
    v11 = v8;
    v12 = v7;
    v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v11, v13);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(", "));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(block) = 138543362;
        *(_QWORD *)((char *)&block + 4) = v15;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Client has no changes to pull for %{public}@", (uint8_t *)&block, 0xCu);

      }
    }
    v16 = *(void **)(a1 + 56);
    v17 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_109;
    v37[3] = &unk_1E60D71F8;
    v6 = &v38;
    v38 = *(id *)(a1 + 80);
    v18 = v37;
    *(_QWORD *)&block = v17;
    *((_QWORD *)&block + 1) = 3221225472;
    v40 = __cpl_dispatch_async_block_invoke_14500;
    v41 = &unk_1E60D71F8;
    v42 = v18;
    v19 = v16;
    v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v19, v20);

  }
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_110(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  _QWORD *v10;
  NSObject *v11;
  dispatch_block_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  dispatch_block_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 block;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3 && (objc_msgSend(v5, "hasSomeChangeWithScopeFilter:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(", "));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(block) = 138543362;
        *(_QWORD *)((char *)&block + 4) = v14;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Client has no more changes to pull for %{public}@", (uint8_t *)&block, 0xCu);

      }
    }
    v15 = *(void **)(a1 + 48);
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_111;
    v24[3] = &unk_1E60D71F8;
    v9 = &v25;
    v25 = *(id *)(a1 + 64);
    v17 = v24;
    *(_QWORD *)&block = v16;
    *((_QWORD *)&block + 1) = 3221225472;
    v27 = __cpl_dispatch_async_block_invoke_14500;
    v28 = &unk_1E60D71F8;
    v29 = v17;
    v18 = v15;
    v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v18, v19);

  }
  else
  {
    v7 = *(void **)(a1 + 48);
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_112;
    v20[3] = &unk_1E60DB648;
    v9 = &v22;
    v22 = *(id *)(a1 + 72);
    v21 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 80);
    v10 = v20;
    *(_QWORD *)&block = v8;
    *((_QWORD *)&block + 1) = 3221225472;
    v27 = __cpl_dispatch_async_block_invoke_14500;
    v28 = &unk_1E60D71F8;
    v29 = v10;
    v11 = v7;
    v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v11, v12);

  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_114(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 32));
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(", "));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v10 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Start waiting for client to pull all changes for %{public}@", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_115;
    v6[3] = &unk_1E60DD810;
    v4 = *(void **)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    v8 = *(id *)(a1 + 32);
    v5 = (id)objc_msgSend(v4, "performReadTransactionWithBlock:", v6);

  }
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_115(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeDequeueObserver:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_112(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 2);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return result;
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_103(uint64_t a1)
{
  uint64_t v1;
  id v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_5(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (a1[4] == *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Client has not tried to pull or acknowledge changes for a long time", v5, 2u);
      }

    }
    v3 = a1[5];
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 83, CFSTR("Client failed to pull changes in time"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeDequeueObserver:", *(_QWORD *)(a1 + 40));
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 0;

    objc_msgSend(*(id *)(a1 + 40), "setCancellationHandler:", 0);
  }

}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  _QWORD block[4];
  id v11;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E60DB418;
  v7 = *(_OWORD *)(a1 + 40);
  v3 = (id)v7;
  v9 = v7;
  v4 = v8;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v11 = v4;
  v5 = v1;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16));
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Completion handler should have been called by cancellation handler", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = a1[8];
      v5 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineLibrary.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v4, v5, v6, 1645, CFSTR("Completion handler should have been called by cancellation handler"));

      abort();
    }
  }
  else
  {
    if (!*(_BYTE *)(a1[4] + 80))
      return 1;
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to push all changes but it is closed", v11, 2u);
      }

    }
    v8 = a1[5];
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Engine is closed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  return 0;
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_86(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  uint64_t v15;
  id v16;
  uint8_t *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t *v21;
  uint64_t v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16));
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Engine is asking client to push all changes", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14519;
  v27 = __Block_byref_object_dispose__14520;
  v28 = 0;
  v5 = *(id *)(a1[4] + 16);
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_87;
  v18[3] = &unk_1E60DBBA0;
  v7 = v5;
  v19 = v7;
  v9 = (void *)a1[5];
  v8 = a1[6];
  v21 = buf;
  v22 = v8;
  v20 = v9;
  v10 = objc_msgSend(v18, "copy");
  v11 = a1[4];
  v12 = *(void **)(v11 + 112);
  *(_QWORD *)(v11 + 112) = v10;

  (*(void (**)(void))(*(_QWORD *)(a1[4] + 112) + 16))();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_91;
  v14[3] = &unk_1E60DB558;
  v13 = (void *)a1[5];
  v15 = a1[4];
  v17 = buf;
  v16 = v13;
  objc_msgSend(v3, "engineLibrary:pushAllChangesWithCompletionHandler:", v15, v14);

  _Block_object_dispose(buf, 8);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_97(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 32), "_libraryObject");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 40);
    v5 = (id)v2;
    if (v2)
    {
      objc_msgSend(v3, "setCompletedUnitCount:", 2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(v3, "setCompletedUnitCount:", 1);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_98;
      v6[3] = &unk_1E60DB5D0;
      v4 = *(void **)(a1 + 40);
      v6[4] = *(_QWORD *)(a1 + 32);
      v7 = *(id *)(a1 + 48);
      v8 = *(id *)(a1 + 56);
      v9 = *(id *)(a1 + 64);
      objc_msgSend(v4, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v6);

    }
  }
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_98(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3_99;
  v3[3] = &unk_1E60DB5A8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performBlockOnLibrary:", v3);

}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3_99(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
  {
    if (v5)
    {
      v7 = *(void (**)(void))(a1[5] + 16);
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Engine failed to get a client to get all changes pushed", v9, 2u);
        }

      }
      v7 = *(void (**)(void))(a1[6] + 16);
    }
    v7();
  }

}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_87(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  _QWORD handler[4];
  NSObject *v16;
  __int128 v17;
  uint64_t v18;
  uint8_t buf[16];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Client is pushing changes...", buf, 2u);
      }

      v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    dispatch_source_cancel(v2);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 32));
  v7 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)&_timeToWaitForClientToPushChanges);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_88;
  handler[3] = &unk_1E60DBBA0;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 56);
  v16 = v8;
  v18 = v9;
  v14 = *(_OWORD *)(a1 + 40);
  v10 = (id)v14;
  v17 = v14;
  dispatch_source_set_event_handler(v8, handler);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_resume(v13);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  __int128 v15;
  _QWORD block[4];
  id v17;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_92;
  v12[3] = &unk_1E60DB768;
  v13 = v3;
  v11 = *(_OWORD *)(a1 + 40);
  v6 = (id)v11;
  v15 = v11;
  v14 = *(_QWORD *)(a1 + 32);
  v7 = v12;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v17 = v7;
  v8 = v4;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_92(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  v5 = (void *)a1[4];
  if (v5)
  {
    if (objc_msgSend(v5, "isCPLErrorWithCode:", 255))
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Client does not support pushing all changes yet - some changes might not be uploaded", buf, 2u);
        }

      }
      v7 = a1[6];
      v8 = a1[4];
LABEL_16:
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v8);
      return;
    }
    v8 = a1[4];
    if (v8)
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = a1[4];
          *(_DWORD *)buf = 138412290;
          v20 = v10;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Client failed to push all changes: %@", buf, 0xCu);
        }

        v8 = a1[4];
      }
      v7 = a1[6];
      goto LABEL_16;
    }
  }
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Client successfully pushed all changes", buf, 2u);
    }

  }
  v12 = a1[5];
  v13 = (void *)a1[6];
  v14 = *(void **)(v12 + 232);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_93;
  v18[3] = &unk_1E60DD838;
  v18[4] = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3_95;
  v16[3] = &unk_1E60DD500;
  v16[4] = v12;
  v17 = v13;
  v15 = (id)objc_msgSend(v14, "performWriteTransactionWithBlock:completionHandler:", v18, v16);

}

uint64_t __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_93(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_94;
  v3[3] = &unk_1E60DD6D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "do:", v3);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3_95(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4_96;
  v11[3] = &unk_1E60D6708;
  v12 = v3;
  v13 = v5;
  v7 = v11;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v6;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4_96(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLBackupOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "error");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Failed to commit pending change updates: %@", (uint8_t *)&v7, 0xCu);

      }
    }
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

uint64_t __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_94(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "forceApplyPendingChangeSessionUpdateWithError:", a2);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_88(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (a1[4] == *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    if (_failOnPushingChangesTimeout)
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Client has not tried to push any changes for a long time - timing out", buf, 2u);
        }

      }
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
      v3 = a1[5];
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 83, CFSTR("Client failed to push changes in time"));
      v4 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, NSObject *))(v3 + 16))(v3, v4);
    }
    else
    {
      if (_CPLSilentLogging)
        return;
      __CPLLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Client has not tried to push any changes for a long time", v5, 2u);
      }
    }

  }
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide %@ but it is closed. Should try again later", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide %@", buf, 0xCu);
      }

      v2 = *(_QWORD *)(a1 + 32);
    }
    v7 = *(void **)(v2 + 232);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_77;
    v9[3] = &unk_1E60DCA60;
    v9[4] = v2;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v8 = (id)objc_msgSend(v7, "performReadTransactionWithBlock:", v9);

  }
}

void __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_77(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  NSObject *v34;
  void *v35;
  void (*v36)(void);
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "isClientInSyncWithClientCache") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "itemScopedIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scopeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "scopes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopeWithIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (!_CPLSilentLogging)
      {
        __CPLDataRecoveryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v48 = v3;
          v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "%@ is an unknown scope. Marking (cloud) %@ as unavailable", buf, 0x16u);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_52;
    }
    objc_msgSend(v4, "scopeForSharingScope:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "cloudCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "targetForRecordWithSharedCloudScopedIdentifier:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scopedIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "setItemScopedIdentifier:", v9);
    }
    else
    {
      v9 = 0;
    }

    if (objc_msgSend(v4, "valueForFlag:forScope:", 16, v5))
    {
      if (!_CPLSilentLogging)
      {
        __CPLDataRecoveryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v48 = v3;
          v49 = 2112;
          v50 = v15;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "%@ is inactive. Marking (cloud) %@ as unavailable", buf, 0x16u);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_51;
    }
    objc_msgSend(*(id *)(a1 + 40), "identity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "localResourceForCloudResource:recordClass:", *(_QWORD *)(a1 + 40), &v46);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v16, "fingerPrint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
LABEL_27:

        v22 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(v22, "identity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fileURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setFileURL:", v24);

        v25 = *(void **)(a1 + 32);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_78;
        v39[3] = &unk_1E60DB4E0;
        v39[4] = v25;
        v40 = v22;
        v45 = v46;
        v41 = v9;
        v42 = *(id *)(a1 + 40);
        v43 = v2;
        v44 = *(id *)(a1 + 48);
        v26 = v22;
        objc_msgSend(v25, "performBlockOnLibrary:", v39);

LABEL_50:
LABEL_51:

LABEL_52:
        return;
      }
      v38 = v16;
      objc_msgSend(v18, "identity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fingerPrint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 && (objc_msgSend(v19, "isEqual:", v21) & 1) != 0)
      {

        v16 = v38;
        goto LABEL_27;
      }

      if (!_CPLSilentLogging)
      {
        __CPLDataRecoveryOSLogDomain();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v48 = v28;
          _os_log_impl(&dword_1B03C2000, v27, OS_LOG_TYPE_DEFAULT, "Fingerprint for (cloud) %@ does not match the one in client cache", buf, 0xCu);
        }

      }
      v16 = v38;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "hasPendingChangeSessionUpdate"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLDataRecoveryOSLogDomain();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v48 = v30;
          v31 = "Engine has pending changes to apply. Should try again later for (cloud) %@";
          v32 = v29;
          v33 = 12;
LABEL_46:
          _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
          goto LABEL_47;
        }
        goto LABEL_47;
      }
    }
    else
    {
      if ((objc_msgSend(v4, "hasFinishedInitialSyncForScope:", v5) & 1) != 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLDataRecoveryOSLogDomain();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v48 = v35;
            _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEFAULT, "Unable to find (cloud) %@ for recovery", buf, 0xCu);
          }

        }
        v36 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
        goto LABEL_49;
      }
      if (!_CPLSilentLogging)
      {
        __CPLDataRecoveryOSLogDomain();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v37 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v48 = v3;
          v49 = 2112;
          v50 = v37;
          v31 = "%@ is not fully synchronized. Should try again later for (cloud) %@";
          v32 = v29;
          v33 = 22;
          goto LABEL_46;
        }
LABEL_47:

      }
    }
    v36 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_49:
    v36();
    goto LABEL_50;
  }
  if (!_CPLSilentLogging)
  {
    __CPLDataRecoveryOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v48 = v11;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Engine is not in sync with client. Should try again later for (cloud) %@", buf, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412290;
        v24 = v13;
        v14 = "Client is not attached. Should try again later for (cloud) %@";
LABEL_10:
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      }
LABEL_11:

    }
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        v14 = "Client has not implemented recovery yet. Should try again later for (cloud) %@";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 80);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_2;
  v16[3] = &unk_1E60DB4B8;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 32);
  v20 = v10;
  v21 = v11;
  v22 = *(id *)(a1 + 72);
  objc_msgSend(v10, "engineLibrary:provideLocalResource:recordClass:completionHandler:", v7, v8, v9, v16);

LABEL_13:
}

void __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemScopedIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 32));

      if (v12)
        objc_msgSend(*(id *)(a1 + 40), "setItemScopedIdentifier:", *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(v5, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      if (!_CPLSilentLogging)
      {
        __CPLDataRecoveryOSLogDomain();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 56), "displayableNameForEngineLibrary:", *(_QWORD *)(a1 + 64));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (!v27)
          {
            objc_msgSend(*(id *)(a1 + 56), "description");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v29 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v35 = v28;
          v36 = 2112;
          v37 = v29;
          _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_ERROR, "Client (%{public}@) did not provide a file for (cloud) %@ yet it says the resource is available", buf, 0x16u);
          if (!v27)

        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      goto LABEL_44;
    }
    v15 = (void *)objc_msgSend(v13, "copy");
    if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 56), "displayableNameForEngineLibrary:", *(_QWORD *)(a1 + 64));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17)
        {
          objc_msgSend(*(id *)(a1 + 56), "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v35 = v18;
        v36 = 2112;
        v37 = v19;
        v38 = 2112;
        v39 = v20;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Client (%{public}@) provided %@ for (cloud) %@", buf, 0x20u);
        if (!v17)

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "identity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fileURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      if ((objc_msgSend(v22, "isEqual:", v14) & 1) != 0)
      {
LABEL_27:
        objc_msgSend(v15, "setFileURL:", v22);

LABEL_43:
        objc_msgSend(*(id *)(a1 + 40), "setIdentity:", v15);
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

LABEL_44:
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v24 = objc_msgSend(v23, "cplCopyItemAtURL:toURL:error:", v14, v22, &v33);
      v25 = v33;

      if ((v24 & 1) != 0)
      {

        goto LABEL_27;
      }
      if (!_CPLSilentLogging)
      {
        __CPLDataRecoveryOSLogDomain();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v35 = v31;
          v36 = 2112;
          v37 = v32;
          v38 = 2112;
          v39 = v25;
          _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@. Will provide the source URL instead: %@", buf, 0x20u);

        }
      }

    }
    objc_msgSend(v15, "setFileURL:", v14);
    goto LABEL_43;
  }
  if (!_CPLSilentLogging)
  {
    __CPLDataRecoveryOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 56), "displayableNameForEngineLibrary:", *(_QWORD *)(a1 + 64));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
      {
        objc_msgSend(*(id *)(a1 + 56), "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = *(void **)(a1 + 40);
      +[CPLLibraryManager descriptionForProvideContentResult:](CPLLibraryManager, "descriptionForProvideContentResult:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v10;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Client (%{public}@) recovery result for (cloud) %@ is: %@", buf, 0x20u);
      if (!v7)

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_45:

}

void __76__CPLEngineLibrary_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide record %@ but it is closed. Should try again later", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(void **)(v2 + 232);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__CPLEngineLibrary_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_76;
    v7[3] = &unk_1E60DCA60;
    v7[4] = v2;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v6 = (id)objc_msgSend(v5, "performReadTransactionWithBlock:", v7);

  }
}

void __76__CPLEngineLibrary_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_76(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void (*v15)(void);
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  _BYTE v26[12];
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "isClientInSyncWithClientCache") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "scopeIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "scopes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scopeWithIdentifier:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (!objc_msgSend(v3, "valueForFlag:forScope:", 16, v4))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "cloudCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recordWithScopedIdentifier:isFinal:", *(_QWORD *)(a1 + 40), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (!_CPLSilentLogging)
          {
            __CPLDataRecoveryOSLogDomain();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)v26 = 138412290;
              *(_QWORD *)&v26[4] = v14;
              _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Record %@ is available in cloud cache", v26, 0xCu);
            }

          }
          v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
        }
        else
        {
          v16 = objc_msgSend(v3, "hasFinishedInitialSyncForScope:", v4);
          if ((v16 & 1) == 0 && !_CPLSilentLogging)
          {
            __CPLDataRecoveryOSLogDomain();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)v26 = 138412546;
              *(_QWORD *)&v26[4] = v2;
              v27 = 2112;
              v28 = v18;
              _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "%@ is not fully synchronized. Should try again later for record %@", v26, 0x16u);
            }

          }
          if (!v16)
            goto LABEL_32;
          v26[0] = 0;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "idMapping", *(_QWORD *)v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", *(_QWORD *)(a1 + 40), v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            goto LABEL_33;
          v21 = v16 ^ 1;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "transactionClientCacheView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "hasRecordWithScopedIdentifier:", v20);

          if ((v23 | v21) == 1)
          {
LABEL_32:
            v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
          }
          else
          {
LABEL_33:
            if (!_CPLSilentLogging)
            {
              __CPLDataRecoveryOSLogDomain();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)v26 = 138412290;
                *(_QWORD *)&v26[4] = v25;
                _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEFAULT, "Record %@ is not in cloud cache and it does not seem it might appear later. Marking as unavailable", v26, 0xCu);
              }

            }
            v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
          }
        }
        v15();

        goto LABEL_39;
      }
      if (!_CPLSilentLogging)
      {
        __CPLDataRecoveryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)v26 = 138412546;
          *(_QWORD *)&v26[4] = v2;
          v27 = 2112;
          v28 = v6;
          v7 = "%@ is inactive. Marking record %@ as unavailable";
LABEL_15:
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, v7, v26, 0x16u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v26 = 138412546;
        *(_QWORD *)&v26[4] = v2;
        v27 = 2112;
        v28 = v10;
        v7 = "%@ is an unknown scope. Marking record %@ as unavailable";
        goto LABEL_15;
      }
LABEL_16:

    }
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, 1);
LABEL_39:

    return;
  }
  if (!_CPLSilentLogging)
  {
    __CPLDataRecoveryOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v26 = 138412290;
      *(_QWORD *)&v26[4] = v9;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Engine is not in sync with client. Should try again later to get record %@", v26, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __79__CPLEngineLibrary_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide library info for %@ but it is closed. Should try again later", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(void **)(v2 + 232);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__CPLEngineLibrary_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_75;
    v7[3] = &unk_1E60DCA60;
    v7[4] = v2;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v6 = (id)objc_msgSend(v5, "performReadTransactionWithBlock:", v7);

  }
}

void __79__CPLEngineLibrary_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_75(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 232), "isClientInSyncWithClientCache") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 232), "scopes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scopeWithIdentifier:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      if (objc_msgSend(v3, "scopeType"))
      {
        if ((objc_msgSend(v2, "doesScopeSupportToBePulledByClient:", v4) & 1) != 0)
        {
          objc_msgSend(v2, "scopeChangeForScope:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5)
          {
            if (!_CPLSilentLogging)
            {
              __CPLDataRecoveryOSLogDomain();
              v6 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
              {
                v7 = a1[5];
                v18 = 138412290;
                v19 = v7;
                _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Scope Change for %@ is available", (uint8_t *)&v18, 0xCu);
              }

            }
            v8 = *(void (**)(void))(a1[6] + 16);
          }
          else
          {
            if (!_CPLSilentLogging)
            {
              __CPLDataRecoveryOSLogDomain();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                v17 = a1[5];
                v18 = 138412290;
                v19 = v17;
                _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Scope Change for %@ is not available", (uint8_t *)&v18, 0xCu);
              }

            }
            v8 = *(void (**)(void))(a1[6] + 16);
          }
          v8();

          goto LABEL_28;
        }
        if (!_CPLSilentLogging)
        {
          __CPLDataRecoveryOSLogDomain();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v15 = a1[5];
            v18 = 138412290;
            v19 = v15;
            v13 = "%@ is inactive. Marking scope info as unavailable";
            goto LABEL_25;
          }
LABEL_26:

        }
LABEL_27:
        (*(void (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], 0);
LABEL_28:

        return;
      }
      if (_CPLSilentLogging)
        goto LABEL_27;
      __CPLDataRecoveryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v14 = a1[5];
      v18 = 138412290;
      v19 = v14;
      v13 = "%@ is an unknown type of scope. Marking scope info as unavailable";
    }
    else
    {
      if (_CPLSilentLogging)
        goto LABEL_27;
      __CPLDataRecoveryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v12 = a1[5];
      v18 = 138412290;
      v19 = v12;
      v13 = "%@ is an unknown scope. Marking library info as unavailable";
    }
LABEL_25:
    _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 0xCu);
    goto LABEL_26;
  }
  if (!_CPLSilentLogging)
  {
    __CPLDataRecoveryOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[5];
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Engine is not in sync with client. Should try again later to get library info for %@", (uint8_t *)&v18, 0xCu);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    *(_BYTE *)(v6 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "setCancellationHandler:", 0);
  }

}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  _QWORD block[4];
  id v11;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3;
  v8[3] = &unk_1E60DB418;
  v7 = *(_OWORD *)(a1 + 40);
  v3 = (id)v7;
  v9 = v7;
  v4 = v8;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v11 = v4;
  v5 = v1;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    if (!_CPLSilentLogging)
    {
      __CPLDataRecoveryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide compute state payloads but it is closed. Should try again later", buf, 2u);
      }

    }
    v4 = *(_QWORD *)(a1 + 64);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 72);
    if (!*(_BYTE *)(*(_QWORD *)(v6 + 8) + 24))
    {
      v7 = *(void **)(a1 + 40);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_71;
      v8[3] = &unk_1E60DBAD8;
      v8[4] = v2;
      v12 = v6;
      v11 = *(id *)(a1 + 64);
      v9 = *(id *)(a1 + 48);
      v10 = *(id *)(a1 + 56);
      objc_msgSend(v7, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v8);

    }
  }
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_71(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  __int128 v5;
  _QWORD v6[5];
  id v7;
  id v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2_72;
  v6[3] = &unk_1E60DB468;
  v5 = *(_OWORD *)(a1 + 56);
  v3 = (id)v5;
  v9 = v5;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performBlockOnLibrary:", v6);

}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2_72(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3_73;
      v10[3] = &unk_1E60D7078;
      v10[4] = v7;
      v9 = *(_QWORD *)(a1 + 48);
      v11 = *(id *)(a1 + 56);
      objc_msgSend(v5, "engineLibrary:providePayloadForComputeStates:inFolderWithURL:completionHandler:", v7, v8, v9, v10);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3_73(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4_74;
  v15[3] = &unk_1E60DC4C0;
  v17 = v6;
  v18 = v7;
  v16 = v5;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v20 = v10;
  v11 = v8;
  v12 = v6;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

uint64_t __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4_74(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __161__CPLEngineLibrary_notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = a1[5];
      v6 = a1[6];
      v7 = 138543874;
      v8 = v3;
      v9 = 2048;
      v10 = v5;
      v11 = 2048;
      v12 = v6;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Notifying %{public}@ that size of resources to upload did change to %llu (%llu)", (uint8_t *)&v7, 0x20u);
    }

  }
  objc_msgSend(v3, "engineLibrary:sizeOfResourcesToUploadDidChangeToSize:sizeOfOriginalResourcesToUpload:numberOfImages:numberOfVideos:numberOfOtherItems:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);

}

void __71__CPLEngineLibrary_notifyAttachedObjectsUploadTask_didFinishWithError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = a1[4];
      v6 = a1[5];
      v7 = 138543874;
      v8 = v3;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Notifying %{public}@ that %@ did finish with error %@", (uint8_t *)&v7, 0x20u);
    }

  }
  objc_msgSend(v3, "engineLibrary:uploadTask:didFinishWithError:", a1[6], a1[4], a1[5]);

}

void __64__CPLEngineLibrary_notifyAttachedObjectsUploadTask_didProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = (float)(*(float *)(a1 + 48) * 100.0);
      v8 = 138543874;
      v9 = v3;
      v10 = 2112;
      v11 = v6;
      v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Notifying %{public}@ that %@ did progress to %.0f%%", (uint8_t *)&v8, 0x20u);
    }

  }
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  objc_msgSend(v3, "engineLibrary:uploadTask:didProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v4);

}

void __60__CPLEngineLibrary_notifyAttachedObjectsUploadTaskDidStart___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v3;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Notifying %{public}@ that %@ did start", (uint8_t *)&v6, 0x16u);
    }

  }
  objc_msgSend(v3, "engineLibrary:didStartUploadTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __85__CPLEngineLibrary_notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Notifying %@ was downloaded in background to %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  objc_msgSend(v3, "engineLibrary:didFailBackgroundDownloadOfResource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __73__CPLEngineLibrary_notifyAttachedObjectsResourceDidDownloadInBackground___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Notifying %@ was downloaded in background to %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  objc_msgSend(v3, "engineLibrary:didDownloadResourceInBackground:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __81__CPLEngineLibrary_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged__block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_source_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  int64_t v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  NSObject *v18;
  uint64_t v19;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 80) && !*(_QWORD *)(v1 + 120))
  {
    v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v1 + 16));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), v3);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __81__CPLEngineLibrary_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged__block_invoke_2;
    v17 = &unk_1E60D6F88;
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    v18 = v4;
    v19 = v5;
    dispatch_source_set_event_handler(v4, &v14);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    if (v6)
    {
      objc_msgSend(v6, "timeIntervalSinceNow", v14, v15, v16, v17);
      v8 = fabs(v7);
      v9 = 5.0 - v8;
      v10 = v8 < 5.0;
      v11 = 0.0;
      if (v10)
        v11 = v9;
      v12 = 1000000000 * (uint64_t)v11;
    }
    else
    {
      v12 = 0;
    }
    v13 = dispatch_time(0, v12);
    dispatch_source_set_timer(v4, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(v4);

  }
}

void __81__CPLEngineLibrary_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[15])
  {
    objc_msgSend(v2, "_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = 0;

  }
}

void __57__CPLEngineLibrary_notifyAttachedObjectsHasStatusChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Notifying status changes to %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(v3, "engineLibraryHasStatusChanges:", *(_QWORD *)(a1 + 32));

}

void __56__CPLEngineLibrary_notifyAttachedObjectsPullQueueIsFull__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Notifying changes in pull queue to %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(v3, "engineLibraryHasChangesInPullQueue:", *(_QWORD *)(a1 + 32));

}

void __42__CPLEngineLibrary_requestAttachedLibrary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  uint8_t v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 80))
  {
    objc_msgSend(*(id *)(v1 + 40), "objectEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (!v4)
      goto LABEL_10;
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isLibraryManagerForEngineLibrary:", *(_QWORD *)(a1 + 32));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
    if ((v6 & 1) == 0)
    {
LABEL_10:
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Engine has no attached library. Trying to get one", v10, 2u);
        }

      }
      if (_requestBlock)
        (*(void (**)(void))(_requestBlock + 16))();
    }

  }
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_cancelBlockWhenLibraryAttaches:");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    *(_BYTE *)(v6 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_3;
  v7[3] = &unk_1E60D71F8;
  v8 = v1;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v10 = v4;
  v5 = v2;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_4(_QWORD *a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17[2];
  id v18[2];
  _QWORD block[5];
  __int128 v20;
  _QWORD v21[5];
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)a1[4];
  if (v2[80])
  {
    v3 = a1[5];
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Engine is closed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

  }
  else if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(v2, "_libraryObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v24 = _timeToWaitForLibrary;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Engine has no attached library. Trying to get one and will wait %.0fs", buf, 0xCu);
        }

      }
      if (_requestBlock)
        (*(void (**)(void))(_requestBlock + 16))();
      v6 = (void *)a1[4];
      v7 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_63;
      v21[3] = &unk_1E60DB440;
      v21[4] = v6;
      *(_OWORD *)v17 = *(_OWORD *)(a1 + 5);
      v8 = v17[0];
      v22 = *(_OWORD *)v17;
      objc_msgSend(v6, "_performBlockWhenLibraryAttaches:", v21);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1[7] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v12 = dispatch_time(0, (uint64_t)(*(double *)&_timeToWaitForLibrary * 1000000000.0));
      v13 = a1[4];
      v14 = *(NSObject **)(v13 + 16);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_64;
      block[3] = &unk_1E60DB440;
      block[4] = v13;
      *(_OWORD *)v18 = *(_OWORD *)(a1 + 5);
      v15 = v18[0];
      v20 = *(_OWORD *)v18;
      dispatch_after(v12, v14, block);

    }
  }
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_63(_QWORD *a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v2 = (_BYTE *)a1[4];
    if (v2[80])
    {
      v3 = a1[5];
      +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Engine is closed"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v9);

    }
    else
    {
      objc_msgSend(v2, "_libraryObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        if (!_CPLSilentLogging)
        {
          __CPLLibraryOSLogDomain();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Successfully requested a library", buf, 2u);
          }

        }
        (*(void (**)(void))(a1[5] + 16))();
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLLibraryOSLogDomain();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Failed to acquire a library", v10, 2u);
          }

        }
        v7 = a1[5];
        +[CPLErrors unknownError](CPLErrors, "unknownError");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

      }
    }
  }
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_64(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (!(*(unsigned __int8 *)(a1[4] + 80) | _CPLSilentLogging))
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v5 = 134217984;
        v6 = _timeToWaitForLibrary;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Engine still has no attached library after %0.fs", (uint8_t *)&v5, 0xCu);
      }

    }
    v3 = a1[5];
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 83, CFSTR("Library failed to attach in time"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __62__CPLEngineLibrary__performPendingBlockForWhenLibraryAttaches__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

void __70__CPLEngineLibrary__performBlockWithLibrary_enumerateAttachedObjects___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 80))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = *(id *)(v1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          if ((*(_BYTE *)(a1 + 48) == 0) | v6 & 1)
            v6 |= *(_BYTE *)(a1 + 48) != 0;
          else
            v6 = objc_msgSend(v9, "isLibraryManagerForEngineLibrary:", *(_QWORD *)(a1 + 32));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    if (*(_BYTE *)(a1 + 48) && (v6 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Engine has no attached library. Trying to get one", v11, 2u);
        }

      }
      if (_requestBlock)
        (*(void (**)(void))(_requestBlock + 16))();
    }
  }
}

void __48__CPLEngineLibrary_markAttachedObjectAsInvalid___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v3 = *(_QWORD *)(a1 + 40);
        v5 = 138543618;
        v6 = v3;
        v7 = 2112;
        v8 = v4;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ has become invalid for %@", (uint8_t *)&v5, 0x16u);
      }

    }
  }
}

void __55__CPLEngineLibrary_detachObject_withCompletionHandler___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1[4] + 40), "containsObject:", a1[5]))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = a1[5];
        *(_DWORD *)buf = 138543362;
        v16 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Detaching %{public}@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1[4] + 40), "removeObject:", a1[5]);
    if (objc_msgSend(*(id *)(a1[4] + 48), "containsObject:", a1[5]))
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v6 = (void *)a1[4];
          v5 = a1[5];
          *(_DWORD *)buf = 138543618;
          v16 = v5;
          v17 = 2112;
          v18 = v6;
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Invalid %{public}@ detached from %@", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1[4] + 48), "removeObject:", a1[5]);
    }
    if (objc_msgSend(*(id *)(a1[4] + 40), "count"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v8 = a1[4];
          objc_msgSend(*(id *)(v8 + 40), "allObjects");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v16 = v8;
          v17 = 2114;
          v18 = v9;
          _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ is opened with attached: %{public}@", buf, 0x16u);

        }
LABEL_24:

      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v14 = a1[4];
        *(_DWORD *)buf = 138543362;
        v16 = v14;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ is opened", buf, 0xCu);
      }
      goto LABEL_24;
    }
    (*(void (**)(void))(a1[6] + 16))();
    return;
  }
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[5];
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ tried to detach while it was not attached", buf, 0xCu);
    }

  }
  v12 = a1[6];
  +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("%@ is not attached to %@"), a1[5], a1[4]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

}

void __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  NSObject *v28;
  dispatch_block_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  _BYTE buf[24];
  void *v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "%{public}@ tried to attach twice", buf, 0xCu);
      }

    }
    v4 = *(_QWORD *)(a1 + 48);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("%@ is already attached to %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ tried to attach to %@ but it has been marked as invalid", buf, 0x16u);
      }

    }
    v9 = *(_QWORD *)(a1 + 48);
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("%@ has been marked as invalid"), *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEBUG, "Can't attach %{public}@", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "isLibraryManagerForEngineLibrary:");
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "_libraryObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        if (!_CPLSilentLogging)
        {
          __CPLLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "%@ tried to attach to engine while there is already %@ attached to it", buf, 0x16u);
          }

        }
        +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("library"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          return;
        }
      }
      else if (!_CPLSilentLogging)
      {
        __CPLLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v20;
          _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "Attaching client %@ to engine", buf, 0xCu);
        }

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(v22 + 40), "allObjects");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ is opened with attached: %{public}@.", buf, 0x16u);

      }
    }
    v24 = MEMORY[0x1E0C809B0];
    if (v13 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
    {
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(void **)(v25 + 16);
      v36[0] = v24;
      v36[1] = 3221225472;
      v36[2] = __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_53;
      v36[3] = &unk_1E60D65B8;
      v36[4] = v25;
      v27 = v36;
      *(_QWORD *)buf = v24;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_14500;
      v38 = &unk_1E60D71F8;
      v39 = v27;
      v28 = v26;
      v29 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v28, v29);

    }
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(void **)(a1 + 40);
    v32 = *(void **)(v30 + 232);
    v34[0] = v24;
    v34[1] = 3221225472;
    v34[2] = __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_2;
    v34[3] = &unk_1E60DD810;
    v34[4] = v30;
    v35 = v31;
    v33 = (id)objc_msgSend(v32, "performReadTransactionWithBlock:", v34);

  }
}

uint64_t __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPendingBlockForWhenLibraryAttaches");
}

void __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_3;
  v5[3] = &unk_1E60DDA30;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "do:", v5);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

}

uint64_t __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "downloadQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForDownloadedResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "engineLibrary:didDownloadResourceInBackground:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
      }
      v7 += v6;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v26 = v7;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "%lu resources were downloaded since last attachment of %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "pullQueue", (_QWORD)v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countOfQueuedBatches");

  if (v13)
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v26 = v13;
        v27 = 2114;
        v28 = v15;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "%lu batches have been accumulated in the pull queue since the last attachment of %{public}@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "engineLibraryHasChangesInPullQueue:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "statusCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasStatusChanges");

  if (v17)
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v26 = v19;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "Status changes have been accumulated since the last attachment of %{public}@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "engineLibraryHasStatusChanges:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 32), "_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged");

  return 1;
}

uint64_t __42__CPLEngineLibrary_clientIsPushingChanges__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __36__CPLEngineLibrary_startSyncSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring request for a sync session as the library failed to open (error: %@)", buf, 0xCu);
      }

    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Forcing a sync session with all scopes", buf, 2u);
      }

      v2 = *(_QWORD *)(a1 + 32);
    }
    v6 = *(void **)(v2 + 232);
    v8[4] = v2;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__CPLEngineLibrary_startSyncSession__block_invoke_42;
    v9[3] = &unk_1E60DD838;
    v9[4] = v2;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__CPLEngineLibrary_startSyncSession__block_invoke_43;
    v8[3] = &unk_1E60DD838;
    v7 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v9, v8);
  }
}

void __36__CPLEngineLibrary_startSyncSession__block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  v3 = a2;
  objc_msgSend(v2, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__CPLEngineLibrary_startSyncSession__block_invoke_2;
  v6[3] = &unk_1E60DD6D0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "do:", v6);

}

void __36__CPLEngineLibrary_startSyncSession__block_invoke_43(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteServerHasChanges");

    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kickOffSyncSession");

  }
}

uint64_t __36__CPLEngineLibrary_startSyncSession__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "enumeratorForScopesIncludeInactive:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "setScopeHasChangesToPullFromTransport:error:", v9, a2) & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLLibraryOSLogDomain();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "scopeIdentifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v19 = v12;
              _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Failed to force %@ to pull changes from transport", buf, 0xCu);

            }
          }
          v10 = 0;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_15:

  return v10;
}

uint64_t __58__CPLEngineLibrary__updateTotalAssetCountWithAssetCounts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __55__CPLEngineLibrary_updateBlockedMetrics_syncRequested___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  __CFString **v2;
  void *v3;
  __int16 v4;
  char v5;
  char v6;
  uint64_t result;

  if (*(_BYTE *)(a1 + 40))
  {
    v1 = (_BYTE *)(a1 + 32);
    v2 = PLCoreAnalyticsLibrarySummaryiCPLSyncSessionTotalSessionsCountKey;
    return objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", *v2);
  }
  v1 = (_BYTE *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1[9])
  {
    v4 = objc_msgSend(v3, "blockedReason");
    v5 = objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "hasBatteryBudget");
    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("BatteryBlockedCount"));
    if (objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "hasLowBatteryLevel"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("LowBatteryLevelBlockedCount"));
      v6 = 1;
    }
    else
    {
      v6 = v5 ^ 1;
    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "hasCellularBudget") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("CellularBlockedCount"));
      v6 = 1;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "isBlockedByLowPowerMode"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("LowPowerModeBlockedCount"));
      v6 = 1;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "isConstrainedNetwork"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("LowDataModeBlockedCount"));
      v6 = 1;
      if ((v4 & 0x40) == 0)
      {
LABEL_19:
        if ((v4 & 0x80) == 0)
          goto LABEL_21;
        goto LABEL_20;
      }
    }
    else if ((v4 & 0x40) == 0)
    {
      goto LABEL_19;
    }
    objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("CPUUsageBlockedCount"));
    v6 = 1;
    if ((v4 & 0x80) == 0)
    {
LABEL_21:
      if (objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "hasPoorNetworkQuality"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("PoorNetworkQualityBlockedCount"));
        v6 = 1;
        if ((v4 & 0x400) == 0)
        {
LABEL_23:
          if ((v4 & 0x4000) == 0)
          {
LABEL_25:
            if (objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "hasModerateThermalPressure"))
            {
              objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("ModerateThermalPressureBlockedCount"));
              v6 = 1;
            }
            if (objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "hasThermalPressure"))
            {
              objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("ThermalPressureBlockedCount"));
              v6 = 1;
            }
            if ((v4 & 0xA200) != 0)
            {
              objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("PoorSystemConditionsBlockedCount"));
              v6 = 1;
            }
            if (objc_msgSend(*(id *)(*(_QWORD *)v1 + 240), "isClientInForeground"))
              objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("UIVisibleBlockedCount"));
            if ((v6 & 1) == 0)
              objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("UnknownReasonBlockedCount"));
            v2 = &PLCoreAnalyticsLibrarySummaryiCPLSyncSessionBlockedSessionsCountKey;
            return objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", *v2);
          }
LABEL_24:
          objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("GroupSchedulingBlockedCount"));
          v6 = 1;
          goto LABEL_25;
        }
      }
      else if ((v4 & 0x400) == 0)
      {
        goto LABEL_23;
      }
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("ThunderingHerdBlockedCount"));
      v6 = 1;
      if ((v4 & 0x4000) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
LABEL_20:
    objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", CFSTR("MemoryPressureBlockedCount"));
    v6 = 1;
    goto LABEL_21;
  }
  result = objc_msgSend(v3, "unBlockedReason");
  switch(result)
  {
    case 1:
      v2 = PLCoreAnalyticsLibrarySummaryiCPLSyncSessionDASUnBlockedCountKey;
      break;
    case 4:
      v2 = PLCoreAnalyticsLibrarySummaryiCPLSyncSessionRemoteDeviceIntentUnBlockedCountKey;
      break;
    case 2:
      v2 = PLCoreAnalyticsLibrarySummaryiCPLSyncSessionOverrideUnBlockedCountKey;
      break;
    default:
      return result;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "incrementCountForKey:", *v2);
}

void __56__CPLEngineLibrary_setICloudLibraryClientVersionTooOld___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__CPLEngineLibrary_setICloudLibraryClientVersionTooOld___block_invoke_2;
  v3[3] = &unk_1E60DD6D0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "do:", v3);

}

uint64_t __56__CPLEngineLibrary_setICloudLibraryClientVersionTooOld___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetCompleteSyncStateWithCause:error:", CFSTR("out of blacklist"), a2);
}

void __42__CPLEngineLibrary_updateInitialSyncDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "engineLibraryDidCompleteInitialSyncOfMainScope:", *(_QWORD *)(a1 + 32));

}

void __57__CPLEngineLibrary_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_source_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "engineWillClose:");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
  v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[15])
  {
    dispatch_source_cancel(v2[15]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 120);
    *(_QWORD *)(v3 + 120) = 0;

    v2 = *(dispatch_source_t **)(a1 + 32);
  }
  -[dispatch_source_t _performPendingBlockForWhenLibraryAttaches](v2, "_performPendingBlockForWhenLibraryAttaches");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reverseObjectEnumerator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_closeNextComponent:deactivate:lastError:completionHandler:");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), CFSTR("CPLMetricsDidChangeNotification"), 0);

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 136);
    *(_QWORD *)(v6 + 136) = 0;

  }
}

void __47__CPLEngineLibrary_currentClosingComponentName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

void __52__CPLEngineLibrary__setCurrentClosingComponentName___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
}

void __79__CPLEngineLibrary__closeNextComponent_deactivate_lastError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__CPLEngineLibrary__closeNextComponent_deactivate_lastError_completionHandler___block_invoke_2;
  v10[3] = &unk_1E60DB130;
  v11 = v3;
  v6 = v4;
  v16 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v17 = *(_BYTE *)(a1 + 72);
  v15 = *(id *)(a1 + 56);
  v9 = v3;
  objc_msgSend(v6, "closeAndDeactivate:completionHandler:", v5, v10);

}

void __79__CPLEngineLibrary__closeNextComponent_deactivate_lastError_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callDidFinish");
  v4 = _CPLSilentLogging;
  if (!_CPLSilentLogging)
  {
    __CPLLibraryOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v13 = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Closing %{public}@ completed", (uint8_t *)&v13, 0xCu);
    }

    v4 = _CPLSilentLogging;
  }
  if (v3)
  {
    if (!v4)
    {
      __CPLLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v13 = 138543618;
        v14 = v8;
        v15 = 2112;
        v16 = v3;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to close with error: %@", (uint8_t *)&v13, 0x16u);
      }

    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (!*(_QWORD *)(v9 + 40))
    {
      v10 = v3;
      v11 = *(NSObject **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v10;
LABEL_15:

    }
  }
  else if (!v4)
  {
    __CPLLibraryOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ is closed", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 48), "_closeNextComponent:deactivate:lastError:completionHandler:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 64));

}

void __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E60D7330;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_openNextComponent:completionHandler:", v2, v4);

}

void __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLLibraryOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2112;
    v20 = v3;
    v6 = "Opening %{public}@ failed: %@";
    v7 = v4;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 22;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "checkInitialSyncMarker");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "engineDidOpen:");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E60DB108;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", CFSTR("CPLMetricsDidChangeNotification"), 0, 0, v16);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 136);
  *(_QWORD *)(v12 + 136) = v11;

  if (_CPLSilentLogging)
    goto LABEL_10;
  __CPLLibraryOSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    v6 = "Opening %{public}@ succeeded";
    v7 = v4;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 12;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v7, v8, v6, buf, v9);
  }
LABEL_9:

LABEL_10:
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

}

void __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(v1 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E60D65B8;
  v7[4] = v1;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = v3;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "forceLoad");
}

void __57__CPLEngineLibrary__openNextComponent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__CPLEngineLibrary__openNextComponent_completionHandler___block_invoke_2;
  v8[3] = &unk_1E60DB0B0;
  v9 = v3;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v13 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v5, "openWithCompletionHandler:", v8);

}

void __57__CPLEngineLibrary__openNextComponent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callDidFinish");
  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(a1 + 48);
        v11 = 138543874;
        v12 = v6;
        v13 = 2112;
        v14 = v7;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "%{public}@ for %@ failed to open: %@", (uint8_t *)&v11, 0x20u);
      }

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 56), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
        v11 = 138543618;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Opened %{public}@ for %@", (uint8_t *)&v11, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "_openNextComponent:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

id __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v3;
  _QWORD v4[5];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[11])
    return (id)objc_msgSend(v1, "_reportQuarantineCountIfNecessaryWithLastReportDate:");
  v3 = (void *)v1[29];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke_2;
  v4[3] = &unk_1E60DD838;
  v4[4] = v1;
  return (id)objc_msgSend(v3, "performReadTransactionWithBlock:", v4);
}

void __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  dispatch_block_t v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[4];
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "lastQuarantineCountReportDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke_3;
  v10[3] = &unk_1E60D6F88;
  v10[4] = v3;
  v11 = v2;
  v6 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v13 = v6;
  v7 = v4;
  v8 = v2;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);

}

uint64_t __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_reportQuarantineCountIfNecessaryWithLastReportDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

void __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_2;
  v4[3] = &unk_1E60DDA30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "do:", v4);

}

void __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[4];
  id v11;

  v1 = MEMORY[0x1E0C809B0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_4;
  v8[3] = &unk_1E60D6F88;
  v8[4] = v2;
  v9 = v3;
  v5 = v8;
  block[0] = v1;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

void __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

uint64_t __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "storeLastQuarantineCountReportDate:error:", *(_QWORD *)(a1 + 40), a2);
}

+ (double)timeToWaitForLibrary
{
  return *(double *)&_timeToWaitForLibrary;
}

+ (void)setTimeToWaitForLibrary:(double)a3
{
  if (a3 == 0.0)
    a3 = 10.0;
  _timeToWaitForLibrary = *(_QWORD *)&a3;
}

+ (double)timeToWaitForClientToActivateScopes
{
  return *(double *)&_timeToWaitForClientToActivateScopes;
}

+ (void)setTimeToWaitForClientToActivateScopes:(double)a3
{
  if (a3 == 0.0)
    a3 = 60.0;
  _timeToWaitForClientToActivateScopes = *(_QWORD *)&a3;
}

+ (double)timeToWaitForClientToPushChanges
{
  return *(double *)&_timeToWaitForClientToPushChanges;
}

+ (void)setTimeToWaitForClientToPushChanges:(double)a3
{
  if (a3 == 0.0)
    a3 = 20.0;
  _timeToWaitForClientToPushChanges = *(_QWORD *)&a3;
}

+ (BOOL)failOnPushingChangesTimeout
{
  return _failOnPushingChangesTimeout;
}

+ (void)setFailOnPushingChangesTimeout:(BOOL)a3
{
  _failOnPushingChangesTimeout = a3;
}

+ (double)timeToWaitForClientToPullChanges
{
  return *(double *)&_timeToWaitForClientToPullChanges;
}

+ (void)setTimeToWaitForClientToPullChanges:(double)a3
{
  if (a3 == 0.0)
    a3 = 60.0;
  _timeToWaitForClientToPullChanges = *(_QWORD *)&a3;
}

+ (id)platformImplementationProtocol
{
  void *v2;
  NSString *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Implementation"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__CPLEngineLibrary_CPLManagement__getListOfComponentsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)_fillStatus:(id)a3 forComponents:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPLEngineComponentEnumerator *v11;
  NSArray *components;
  id v13;
  id v14;
  id v15;
  CPLEngineComponentEnumerator *v16;
  _QWORD v17[4];
  id v18;
  CPLEngineLibrary *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14519;
  v27 = __Block_byref_object_dispose__14520;
  v28 = 0;
  v11 = [CPLEngineComponentEnumerator alloc];
  components = self->_components;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke;
  v17[3] = &unk_1E60DBD80;
  v13 = v9;
  v18 = v13;
  v19 = self;
  v14 = v8;
  v20 = v14;
  v22 = &v23;
  v15 = v10;
  v21 = v15;
  v16 = -[CPLEngineComponentEnumerator initWithComponents:handler:](v11, "initWithComponents:handler:", components, v17);
  objc_storeStrong(v24 + 5, v16);
  objc_msgSend(v24[5], "handleNextComponent");

  _Block_object_dispose(&v23, 8);
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)_fillStatusArray:(id)a3 forComponents:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPLEngineComponentEnumerator *v11;
  NSArray *components;
  id v13;
  id v14;
  id v15;
  CPLEngineComponentEnumerator *v16;
  _QWORD v17[4];
  id v18;
  CPLEngineLibrary *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14519;
  v27 = __Block_byref_object_dispose__14520;
  v28 = 0;
  v11 = [CPLEngineComponentEnumerator alloc];
  components = self->_components;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke;
  v17[3] = &unk_1E60DBD80;
  v13 = v9;
  v18 = v13;
  v19 = self;
  v14 = v8;
  v20 = v14;
  v22 = &v23;
  v15 = v10;
  v21 = v15;
  v16 = -[CPLEngineComponentEnumerator initWithComponents:handler:](v11, "initWithComponents:handler:", components, v17);
  objc_storeStrong(v24 + 5, v16);
  objc_msgSend(v24[5], "handleNextComponent");

  _Block_object_dispose(&v23, 8);
}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)_testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  __CFString *v9;
  void (**v10)(id, const __CFString *, _QWORD);
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  OS_dispatch_queue *v21;
  uint64_t v22;
  _QWORD *v23;
  NSObject *v24;
  dispatch_block_t v25;
  OS_dispatch_queue *queue;
  uint64_t v27;
  _QWORD *v28;
  NSObject *v29;
  __CFString *v30;
  __CFString *v31;
  dispatch_block_t v32;
  _QWORD v33[5];
  __CFString *v34;
  void (**v35)(id, const __CFString *, _QWORD);
  _QWORD v36[5];
  __CFString *v37;
  __CFString *v38;
  void (**v39)(id, const __CFString *, _QWORD);
  uint64_t block;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  id v44;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (void (**)(id, const __CFString *, _QWORD))a5;
  if (objc_msgSend(v8, "isEqual:", CFSTR("ping")))
  {
    if (v9)
      v11 = v9;
    else
      v11 = CFSTR("pong");
    v10[2](v10, v11, 0);
  }
  else
  {
    if (objc_msgSend(v8, "isEqual:", CFSTR("hold-assertion")))
    {
      -[__CFString componentsSeparatedByString:](v9, "componentsSeparatedByString:", CFSTR(" "));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString firstObject](v12, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("ctl.test-assertion");
      if (v13)
        v15 = (__CFString *)v13;
      v16 = v15;

      if ((unint64_t)-[__CFString count](v12, "count") < 2)
      {
        v18 = CFSTR("testing assertions");
      }
      else
      {
        -[__CFString subarrayWithRange:](v12, "subarrayWithRange:", 1, -[__CFString count](v12, "count") - 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      queue = self->_queue;
      v27 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __68__CPLEngineLibrary_CPLManagement___testKey_value_completionHandler___block_invoke;
      v36[3] = &unk_1E60D6CD0;
      v36[4] = self;
      v37 = v16;
      v38 = v18;
      v39 = v10;
      v28 = v36;
      block = v27;
      v41 = 3221225472;
      v42 = __cpl_dispatch_async_block_invoke_14500;
      v43 = &unk_1E60D71F8;
      v44 = v28;
      v29 = queue;
      v30 = v18;
      v31 = v16;
      v32 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v29, v32);

    }
    else if (objc_msgSend(v8, "isEqual:", CFSTR("release-assertion")))
    {
      v19 = CFSTR("ctl.test-assertion");
      if (v9)
        v19 = v9;
      v20 = v19;
      v21 = self->_queue;
      v22 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __68__CPLEngineLibrary_CPLManagement___testKey_value_completionHandler___block_invoke_2;
      v33[3] = &unk_1E60D70C8;
      v33[4] = self;
      v34 = v20;
      v35 = v10;
      v23 = v33;
      block = v22;
      v41 = 3221225472;
      v42 = __cpl_dispatch_async_block_invoke_14500;
      v43 = &unk_1E60D71F8;
      v44 = v23;
      v24 = v21;
      v12 = v20;
      v25 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v24, v25);

    }
    else
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", v8);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, const __CFString *, __CFString *))v10)[2](v10, 0, v12);
    }

  }
}

- (id)_allComponentsIncludingPlatformObjects:(BOOL)a3 respondingToSelector:(SEL)a4
{
  _BOOL4 v4;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_components;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if (v4
          && objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "conformsToProtocol:", &unk_1EEEBA410, (_QWORD)v15))
        {
          objc_msgSend(v12, "platformObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EEEBBBA8)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v6, "addObject:", v13);
          }

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "addObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPLEngineComponentEnumerator *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  CPLEngineComponentEnumerator *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__14519;
  v26 = __Block_byref_object_dispose__14520;
  v27 = 0;
  v11 = [CPLEngineComponentEnumerator alloc];
  -[CPLEngineLibrary _allComponentsIncludingPlatformObjects:respondingToSelector:](self, "_allComponentsIncludingPlatformObjects:respondingToSelector:", 1, sel_testKey_value_completionHandler_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__CPLEngineLibrary_CPLManagement__testKey_value_completionHandler___block_invoke;
  v17[3] = &unk_1E60DBD80;
  v17[4] = self;
  v13 = v8;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  v15 = v10;
  v20 = v15;
  v21 = &v22;
  v16 = -[CPLEngineComponentEnumerator initWithComponents:handler:](v11, "initWithComponents:handler:", v12, v17);

  objc_storeStrong(v23 + 5, v16);
  -[CPLEngineComponentEnumerator handleNextComponent](v16, "handleNextComponent");

  _Block_object_dispose(&v22, 8);
}

void __67__CPLEngineLibrary_CPLManagement__testKey_value_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__CPLEngineLibrary_CPLManagement__testKey_value_completionHandler___block_invoke_2;
    v8[3] = &unk_1E60DBD58;
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = v6;
    v10 = v7;
    objc_msgSend(a2, "testKey:value:completionHandler:", v4, v5, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_testKey:value:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

uint64_t __67__CPLEngineLibrary_CPLManagement__testKey_value_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "handleNextComponent");
}

uint64_t __68__CPLEngineLibrary_CPLManagement___testKey_value_completionHandler___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 104), "addObject:", a1[5]);
  +[CPLTransaction beginTransactionWithIdentifier:description:keepPower:](CPLTransaction, "beginTransactionWithIdentifier:description:keepPower:", a1[5], a1[6], 1);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __68__CPLEngineLibrary_CPLManagement___testKey_value_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1[4] + 104), "containsObject:", a1[5]))
  {
    objc_msgSend(*(id *)(a1[4] + 104), "removeObject:", a1[5]);
    +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", a1[5]);
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v2 = a1[6];
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("unknown assertion"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

void __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_2;
  v18[3] = &unk_1E60D6CD0;
  v18[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v19 = v4;
  v20 = *(id *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  v5 = (void (**)(_QWORD))MEMORY[0x1B5E08DC4](v18);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "ownerNameForEngineLibrary:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && ((v8 = *(void **)(a1 + 40)) == 0 || objc_msgSend(v8, "containsObject:", v7)))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_4;
    v12[3] = &unk_1E60DBD30;
    v13 = v4;
    v14 = v7;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = v11;
    v17 = v5;
    objc_msgSend(WeakRetained, "engineLibrary:getStatusDictionaryWithCompletionHandler:", v9, v12);

  }
  else
  {
    v5[2](v5);
  }

}

void __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_3;
  v5[3] = &unk_1E60D64F0;
  v4 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_fillStatusArray:forComponents:completionHandler:", v3, v4, v5);

}

void __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  dispatch_block_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD block[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v9 = (void *)a1[4];
    v8 = a1[5];
    v32[0] = CFSTR("componentName");
    v32[1] = CFSTR("status");
    v33[0] = v8;
    objc_msgSend(v6, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

LABEL_8:
    goto LABEL_9;
  }
  if (v5)
  {
    v13 = (void *)a1[4];
    v12 = a1[5];
    v30[0] = CFSTR("componentName");
    v30[1] = CFSTR("status");
    v31[0] = v12;
    v31[1] = v5;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v31;
    v16 = v30;
LABEL_7:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v10);
    goto LABEL_8;
  }
  if (a1[6])
  {
    v13 = (void *)a1[4];
    v17 = a1[5];
    v28[0] = CFSTR("componentName");
    v28[1] = CFSTR("status");
    v29[0] = v17;
    v29[1] = CFSTR("no status");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v29;
    v16 = v28;
    goto LABEL_7;
  }
LABEL_9:
  v18 = (void *)a1[8];
  v19 = *(void **)(a1[7] + 16);
  v20 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_5;
  v24[3] = &unk_1E60D71F8;
  v25 = v18;
  v21 = v24;
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v27 = v21;
  v22 = v19;
  v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v22, v23);

}

uint64_t __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

void __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[3];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    if (!v5
      || (objc_msgSend(v3, "componentName"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "containsObject:", v6),
          v6,
          v7))
    {
      objc_msgSend(*(id *)(a1 + 40), "platformObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v11 = *(id *)(*(_QWORD *)(a1 + 40) + 40);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v38 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v16, "displayableNameForEngineLibrary:", *(_QWORD *)(a1 + 40));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                objc_msgSend(v10, "addObject:", v17);
              }
              else
              {
                objc_msgSend(v16, "description");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          }
          while (v13);
        }

        v19 = *(_QWORD *)(a1 + 40);
        v20 = *(const __CFString **)(v19 + 200);
        if (!v20)
          v20 = CFSTR("???");
        v45[0] = CFSTR("libraryIdentifier");
        v45[1] = CFSTR("attached");
        v46[0] = v20;
        v46[1] = v10;
        v45[2] = CFSTR("libraryPath");
        objc_msgSend(*(id *)(v19 + 176), "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByAbbreviatingWithTildeInPath");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        v24 = CFSTR("<unknown>");
        if (v22)
          v24 = (const __CFString *)v22;
        v46[2] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
          goto LABEL_24;
        if (v9)
        {
          v27 = *(void **)(a1 + 48);
          v43[0] = CFSTR("componentName");
          objc_msgSend(v4, "componentName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v43[1] = CFSTR("status");
          v44[0] = v28;
          v44[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v29);
          goto LABEL_29;
        }
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = 0;
LABEL_24:
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke_2;
        v31[3] = &unk_1E60DBC90;
        v32 = v4;
        v33 = *(id *)(a1 + 48);
        v9 = v9;
        v34 = v9;
        v25 = *(id *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 64);
        v35 = v25;
        v36 = v26;
        +[CPLCallObserver observeAsyncCallOn:selector:block:](CPLCallObserver, "observeAsyncCallOn:selector:block:", v32, sel_getStatusDictionaryWithCompletionHandler_, v31);

LABEL_32:
        goto LABEL_33;
      }
      if (!*(_QWORD *)(a1 + 32))
      {
        v9 = 0;
        goto LABEL_31;
      }
      v30 = *(void **)(a1 + 48);
      v41[0] = CFSTR("componentName");
      objc_msgSend(v4, "componentName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = CFSTR("status");
      v42[0] = v28;
      v42[1] = CFSTR("no status");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v29);
      v9 = 0;
LABEL_29:

LABEL_31:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "handleNextComponent");
      goto LABEL_32;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "handleNextComponent");
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
LABEL_33:

}

void __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke_3;
  v8[3] = &unk_1E60DBD08;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v13 = v5;
  v14 = v6;
  v7 = v3;
  objc_msgSend(v4, "getStatusDictionaryWithCompletionHandler:", v8);

}

void __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callDidFinish");
  if (v6)
  {
    v27[0] = CFSTR("componentName");
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = CFSTR("status");
    v28[0] = v8;
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v28;
    v12 = v27;
LABEL_3:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

LABEL_13:
    goto LABEL_14;
  }
  v14 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    if (v14)
    {
      v8 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v8, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 56));
      v25[0] = CFSTR("componentName");
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "componentName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = CFSTR("status");
      v26[0] = v9;
      v26[1] = v8;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v26;
      v12 = v25;
      goto LABEL_3;
    }
    v23[0] = CFSTR("componentName");
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("status");
    v24[0] = v8;
    v24[1] = v5;
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = v24;
    v18 = v23;
LABEL_12:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v9);
    goto LABEL_13;
  }
  if (v14)
  {
    v21[0] = CFSTR("componentName");
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = CFSTR("status");
    v22[0] = v8;
    v22[1] = *(_QWORD *)(a1 + 56);
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = v22;
    v18 = v21;
    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v19[0] = CFSTR("componentName");
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("status");
    v20[0] = v8;
    v20[1] = CFSTR("no status");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = v20;
    v18 = v19;
    goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "handleNextComponent");

}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_2;
  v18[3] = &unk_1E60D6CD0;
  v18[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v19 = v4;
  v20 = *(id *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  v5 = (void (**)(_QWORD))MEMORY[0x1B5E08DC4](v18);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "ownerNameForEngineLibrary:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && ((v8 = *(void **)(a1 + 40)) == 0 || objc_msgSend(v8, "containsObject:", v7)))
  {
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_4;
    v11[3] = &unk_1E60DBCE0;
    v9 = WeakRetained;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    v14 = v4;
    v15 = v7;
    v16 = *(id *)(a1 + 40);
    v17 = v5;
    +[CPLCallObserver observeAsyncCallOn:selector:block:](CPLCallObserver, "observeAsyncCallOn:selector:block:", v9, sel_getStatusWithCompletionHandler_, v11);

  }
  else
  {
    v5[2](v5);
  }

}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_3;
  v5[3] = &unk_1E60D64F0;
  v4 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_fillStatus:forComponents:completionHandler:", v3, v4, v5);

}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_5;
  v9[3] = &unk_1E60DBCB8;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v15 = *(id *)(a1 + 72);
  v8 = v3;
  objc_msgSend(v4, "engineLibrary:getStatusWithCompletionHandler:", v5, v9);

}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  dispatch_block_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD block[4];
  id v27;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callDidFinish");
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (owner): error '%@'"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

LABEL_7:
    goto LABEL_8;
  }
  if (v5)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n\t"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (owner):\n\t%@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

    goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v17 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (owner): no status"), *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v10);
    goto LABEL_7;
  }
LABEL_8:
  v18 = *(void **)(a1 + 72);
  v19 = *(void **)(*(_QWORD *)(a1 + 64) + 16);
  v20 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_6;
  v24[3] = &unk_1E60D71F8;
  v25 = v18;
  v21 = v24;
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14500;
  block[3] = &unk_1E60D71F8;
  v27 = v21;
  v22 = v19;
  v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v22, v23);

}

uint64_t __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR("\n\n"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    if (!v5
      || (objc_msgSend(v3, "componentName"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "containsObject:", v6),
          v6,
          v7))
    {
      objc_msgSend(*(id *)(a1 + 40), "platformObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
      {
        v10 = objc_alloc(MEMORY[0x1E0CB37A0]);
        v11 = *(_QWORD *)(a1 + 40);
        if (*(_QWORD *)(v11 + 200))
          v12 = *(const __CFString **)(v11 + 200);
        else
          v12 = CFSTR("<unknown>");
        objc_msgSend(*(id *)(v11 + 176), "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAbbreviatingWithTildeInPath");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (const __CFString *)v14;
        else
          v16 = CFSTR("<unknown>");
        v9 = (id)objc_msgSend(v10, "initWithFormat:", CFSTR("identifier: %@\n\tpath: %@"), v12, v16);

        if (overridesFeatureFlag == 1 && !isFeatureEnabled)
          objc_msgSend(v9, "appendFormat:", CFSTR("\n\tShared library feature is disabled"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"))
        {
          v53 = v17;
          v54 = v9;
          v55 = v4;
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"));
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v19 = *(id *)(*(_QWORD *)(a1 + 40) + 40);
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v63 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                objc_msgSend(v24, "displayableNameForEngineLibrary:", *(_QWORD *)(a1 + 40));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v25;
                if (v25)
                {
                  v27 = v25;
                }
                else
                {
                  objc_msgSend(v24, "description");
                  v27 = (id)objc_claimAutoreleasedReturnValue();
                }
                v28 = v27;

                if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "containsObject:", v24))
                {
                  objc_msgSend(v28, "stringByAppendingString:", CFSTR(" (invalid)"));
                  v29 = objc_claimAutoreleasedReturnValue();

                  v28 = (void *)v29;
                }
                objc_msgSend(v18, "addObject:", v28);

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
            }
            while (v21);
          }

          v30 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count");
          v17 = v53;
          +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:", v53);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n\t\t"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v54;
          objc_msgSend(v54, "appendFormat:", CFSTR("\n\t%lu attached object(s) at %@ (%@):\n\t\t%@"), v30, v31, v33, v34);

          v4 = v55;
        }
        else
        {
          +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:", v17);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendFormat:", CFSTR("\n\tNo attached objects at %@ (%@)"), v35, v37);

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "statusDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v38)
        {
          objc_msgSend(v38, "componentsSeparatedByString:", CFSTR("\n"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n\t\t"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendFormat:", CFSTR("\n\tstatus:\n\t\t%@"), v41);

        }
        objc_msgSend(*(id *)(a1 + 40), "configuration");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "lastUpdateDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v43, v17);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendFormat:", CFSTR("\n\tconfiguration update: %@"), v44);

        }
        else
        {
          objc_msgSend(v9, "appendFormat:", CFSTR("\n\tconfiguration update: %@"), CFSTR("never"));
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
          goto LABEL_39;
        if (v9)
        {
          v47 = *(void **)(a1 + 48);
          v48 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v4, "componentName");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@:\n\t%@"), v49, v9);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v50);
          goto LABEL_44;
        }
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = 0;
LABEL_39:
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke_2;
        v56[3] = &unk_1E60DBC90;
        v57 = v4;
        v58 = *(id *)(a1 + 48);
        v9 = v9;
        v59 = v9;
        v45 = *(id *)(a1 + 32);
        v46 = *(_QWORD *)(a1 + 64);
        v60 = v45;
        v61 = v46;
        +[CPLCallObserver observeAsyncCallOn:selector:block:](CPLCallObserver, "observeAsyncCallOn:selector:block:", v57, sel_getStatusWithCompletionHandler_, v56);

LABEL_47:
        goto LABEL_48;
      }
      if (!*(_QWORD *)(a1 + 32))
      {
        v9 = 0;
        goto LABEL_46;
      }
      v51 = *(void **)(a1 + 48);
      v52 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "componentName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringWithFormat:", CFSTR("%@: no status"), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObject:", v50);
      v9 = 0;
LABEL_44:

LABEL_46:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "handleNextComponent");
      goto LABEL_47;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "handleNextComponent");
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
LABEL_48:

}

void __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke_3;
  v8[3] = &unk_1E60DBC68;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v13 = v5;
  v14 = v6;
  v7 = v3;
  objc_msgSend(v4, "getStatusWithCompletionHandler:", v8);

}

void __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callDidFinish");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: error '%@'"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

LABEL_13:
    goto LABEL_14;
  }
  if (v22)
  {
    objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "componentName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n\t"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:\n\t%@\n\t%@"), v9, v14, v15);
    }
    else
    {
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n\t"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:\n\t%@"), v9, v15, v21);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v18);

    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@:\n\t%@"), v8, *(_QWORD *)(a1 + 56));
LABEL_12:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v9);
    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    v17 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: no status"), v8, v20);
    goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "handleNextComponent");

}

void __76__CPLEngineLibrary_CPLManagement__getListOfComponentsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));

  if (v4)
  {
    objc_msgSend(WeakRetained, "ownerNameForEngineLibrary:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v2, "addObject:", v5);

  }
  v16 = WeakRetained;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "platformObject");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 == (void *)v12)
        {

LABEL_14:
          objc_msgSend(v11, "componentName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v15);

          goto LABEL_15;
        }
        v13 = (void *)v12;
        v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) != 0)
          goto LABEL_14;
LABEL_15:
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
