@implementation CPLEngineStore

- (NSString)mainScopeIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  objc_msgSend(WeakRetained, "mainScopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)supportsSharingScopeWithIdentifier:(id)a3 forScopeWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  CPLSharingScopePrefixForScopeWithIdentifier(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasPrefix:", v6);

  return v7;
}

- (BOOL)mainScopeSupportsSharingScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CPLEngineStore supportsSharingScopeWithIdentifier:forScopeWithIdentifier:](self, "supportsSharingScopeWithIdentifier:forScopeWithIdentifier:", v4, v5);

  return (char)self;
}

- (CPLEngineStore)initWithEngineLibrary:(id)a3
{
  id v5;
  CPLEngineStore *v6;
  CPLEngineStore *v7;
  CPLEngineScopeStorage *v8;
  CPLEngineScopeStorage *scopes;
  CPLEngineScopeCleanupTasks *v10;
  CPLEngineScopeCleanupTasks *cleanupTasks;
  CPLEnginePushRepository *v12;
  CPLEnginePushRepository *pushRepository;
  CPLEngineChangePipe *v14;
  CPLEngineChangePipe *pullQueue;
  CPLEngineRevertRecords *v16;
  CPLEngineRevertRecords *revertRecords;
  CPLEngineIDMapping *v18;
  CPLEngineIDMapping *idMapping;
  CPLEngineCloudCache *v20;
  CPLEngineCloudCache *cloudCache;
  CPLEngineTransientRepository *v22;
  CPLEngineTransientRepository *transientPullRepository;
  CPLEngineResourceStorage *v24;
  CPLEngineResourceStorage *resourceStorage;
  CPLEngineResourceDownloadQueue *v26;
  CPLEngineResourceDownloadQueue *downloadQueue;
  CPLEngineOutgoingResources *v28;
  CPLEngineOutgoingResources *outgoingResources;
  CPLEngineRemappedRecords *v30;
  CPLEngineRemappedRecords *remappedRecords;
  CPLEngineQuarantinedRecords *v32;
  CPLEngineQuarantinedRecords *quarantinedRecords;
  CPLEngineStatusCenter *v34;
  CPLEngineStatusCenter *statusCenter;
  CPLEnginePendingRecordChecks *v36;
  CPLEnginePendingRecordChecks *pendingRecordChecks;
  CPLEngineIgnoredRecords *v38;
  CPLEngineIgnoredRecords *ignoredRecords;
  NSMutableArray *v40;
  NSMutableArray *batchedTransactions;
  NSObject *v42;
  dispatch_queue_t v43;
  OS_dispatch_queue *batchedTransactionsQueue;
  id WeakRetained;
  void *v46;
  uint64_t v47;
  NSURL *resetEventsURL;
  NSObject *v49;
  dispatch_queue_t v50;
  OS_dispatch_queue *pendingUpdateQueue;
  id v52;
  void *v53;
  void *v54;
  CPLEngineDerivativesCache *v55;
  CPLEngineDerivativesCache *derivativesCache;
  NSObject *v57;
  dispatch_queue_t v58;
  OS_dispatch_queue *shouldSyncScopeListQueue;
  CPLEngineRecordComputeStatePushQueue *v60;
  CPLEngineRecordComputeStatePushQueue *recordComputeStatePushQueue;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  CPLPlatformObject *platformObject;
  NSObject *v68;
  CPLEngineStore *v69;
  CPLEngineStore *v70;
  void *v71;
  void *v72;
  objc_super v73;
  uint8_t buf[4];
  CPLEngineStore *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v73.receiver = self;
  v73.super_class = (Class)CPLEngineStore;
  v6 = -[CPLEngineStore init](&v73, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engineLibrary, v5);
    v8 = -[CPLEngineScopeStorage initWithEngineStore:name:]([CPLEngineScopeStorage alloc], "initWithEngineStore:name:", v7, CFSTR("scopes"));
    scopes = v7->_scopes;
    v7->_scopes = v8;

    v10 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineScopeCleanupTasks alloc], "initWithEngineStore:name:", v7, CFSTR("cleanupTasks"));
    cleanupTasks = v7->_cleanupTasks;
    v7->_cleanupTasks = v10;

    v12 = -[CPLEnginePushRepository initWithEngineStore:name:]([CPLEnginePushRepository alloc], "initWithEngineStore:name:", v7, CFSTR("pushRepository"));
    pushRepository = v7->_pushRepository;
    v7->_pushRepository = v12;

    v14 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineChangePipe alloc], "initWithEngineStore:name:", v7, CFSTR("pullQueue"));
    pullQueue = v7->_pullQueue;
    v7->_pullQueue = v14;

    v16 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineRevertRecords alloc], "initWithEngineStore:name:", v7, CFSTR("revertRecords"));
    revertRecords = v7->_revertRecords;
    v7->_revertRecords = v16;

    v18 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineIDMapping alloc], "initWithEngineStore:name:", v7, CFSTR("idMapping"));
    idMapping = v7->_idMapping;
    v7->_idMapping = v18;

    v20 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineCloudCache alloc], "initWithEngineStore:name:", v7, CFSTR("cloudCache"));
    cloudCache = v7->_cloudCache;
    v7->_cloudCache = v20;

    v22 = -[CPLEngineTransientRepository initWithEngineStore:name:]([CPLEngineTransientRepository alloc], "initWithEngineStore:name:", v7, CFSTR("transientPullRepository"));
    transientPullRepository = v7->_transientPullRepository;
    v7->_transientPullRepository = v22;

    v24 = -[CPLEngineResourceStorage initWithEngineStore:name:]([CPLEngineResourceStorage alloc], "initWithEngineStore:name:", v7, CFSTR("resources"));
    resourceStorage = v7->_resourceStorage;
    v7->_resourceStorage = v24;

    v26 = -[CPLEngineResourceDownloadQueue initWithEngineStore:name:]([CPLEngineResourceDownloadQueue alloc], "initWithEngineStore:name:", v7, CFSTR("downloadQueue"));
    downloadQueue = v7->_downloadQueue;
    v7->_downloadQueue = v26;

    v28 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineOutgoingResources alloc], "initWithEngineStore:name:", v7, CFSTR("outgoingResources"));
    outgoingResources = v7->_outgoingResources;
    v7->_outgoingResources = v28;

    v30 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineRemappedRecords alloc], "initWithEngineStore:name:", v7, CFSTR("remappedDeletes"));
    remappedRecords = v7->_remappedRecords;
    v7->_remappedRecords = v30;

    v32 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineQuarantinedRecords alloc], "initWithEngineStore:name:", v7, CFSTR("quarantinedRecords"));
    quarantinedRecords = v7->_quarantinedRecords;
    v7->_quarantinedRecords = v32;

    v34 = -[CPLEngineStatusCenter initWithEngineStore:name:]([CPLEngineStatusCenter alloc], "initWithEngineStore:name:", v7, CFSTR("statusCenter"));
    statusCenter = v7->_statusCenter;
    v7->_statusCenter = v34;

    v36 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEnginePendingRecordChecks alloc], "initWithEngineStore:name:", v7, CFSTR("pendingRecordChecks"));
    pendingRecordChecks = v7->_pendingRecordChecks;
    v7->_pendingRecordChecks = v36;

    v38 = -[CPLEngineStorage initWithEngineStore:name:]([CPLEngineIgnoredRecords alloc], "initWithEngineStore:name:", v7, CFSTR("ignoredRecords"));
    ignoredRecords = v7->_ignoredRecords;
    v7->_ignoredRecords = v38;

    v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    batchedTransactions = v7->_batchedTransactions;
    v7->_batchedTransactions = v40;

    CPLCopyDefaultSerialQueueAttributes();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = dispatch_queue_create("com.apple.cpl.store.batchedtransactions", v42);
    batchedTransactionsQueue = v7->_batchedTransactionsQueue;
    v7->_batchedTransactionsQueue = (OS_dispatch_queue *)v43;

    WeakRetained = objc_loadWeakRetained((id *)&v7->_engineLibrary);
    objc_msgSend(WeakRetained, "clientLibraryBaseURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "URLByAppendingPathComponent:isDirectory:", CFSTR("resetevents.plist"), 0);
    v47 = objc_claimAutoreleasedReturnValue();
    resetEventsURL = v7->_resetEventsURL;
    v7->_resetEventsURL = (NSURL *)v47;

    CPLCopyDefaultSerialQueueAttributes();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = dispatch_queue_create("com.apple.cpl.pendingupdate", v49);
    pendingUpdateQueue = v7->_pendingUpdateQueue;
    v7->_pendingUpdateQueue = (OS_dispatch_queue *)v50;

    v52 = objc_loadWeakRetained((id *)&v7->_engineLibrary);
    objc_msgSend(v52, "clientLibraryBaseURL");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "URLByAppendingPathComponent:isDirectory:", CFSTR("derivatives"), 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = -[CPLEngineDerivativesCache initWithCacheURL:]([CPLEngineDerivativesCache alloc], "initWithCacheURL:", v54);
    derivativesCache = v7->_derivativesCache;
    v7->_derivativesCache = v55;

    CPLCopyDefaultSerialQueueAttributes();
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = dispatch_queue_create("com.apple.cpl.shouldsyncscopelist", v57);
    shouldSyncScopeListQueue = v7->_shouldSyncScopeListQueue;
    v7->_shouldSyncScopeListQueue = (OS_dispatch_queue *)v58;

    v60 = -[CPLEngineRecordComputeStatePushQueue initWithEngineStore:name:]([CPLEngineRecordComputeStatePushQueue alloc], "initWithEngineStore:name:", v7, CFSTR("recordComputeStatePushQueue"));
    recordComputeStatePushQueue = v7->_recordComputeStatePushQueue;
    v7->_recordComputeStatePushQueue = v60;

    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        -[NSHashTable allObjects](v7->_storages, "allObjects");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v75 = v7;
        v76 = 2112;
        v77 = v63;
        _os_log_impl(&dword_1B03C2000, v62, OS_LOG_TYPE_DEBUG, "Initing store %@ - storages: %@", buf, 0x16u);

      }
    }
    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "newPlatformImplementationForObject:", v7);
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v65;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v69 = (CPLEngineStore *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v75 = v69;
          v70 = v69;
          _os_log_impl(&dword_1B03C2000, v68, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, v72, 354, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }

  }
  return v7;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  CPLEngineStore *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_state)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", self->_state);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v11 = self;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "at dealloc time, %@ should not be in state %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", self->_state);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 360, CFSTR("at dealloc time, %@ should not be in state %@"), self, v8);

    abort();
  }
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineStore;
  -[CPLEngineStore dealloc](&v9, sel_dealloc);
}

- (NSArray)storages
{
  return -[NSHashTable allObjects](self->_storages, "allObjects");
}

- (void)registerStorage:(id)a3
{
  NSHashTable *storages;
  NSHashTable *v6;
  NSHashTable *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  CPLEngineStore *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (-[CPLEngineStore state](self, "state"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v11;
        v14 = 2112;
        v15 = self;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to register %@ to %@ while the library is already open", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 368, CFSTR("Trying to register %@ to %@ while the library is already open"), v11, self);

    abort();
  }
  storages = self->_storages;
  if (!storages)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_storages;
    self->_storages = v6;

    storages = self->_storages;
  }
  -[NSHashTable addObject:](storages, "addObject:", v11);

}

- (void)_loadResetEvents
{
  NSMutableArray *v3;
  NSMutableArray *resetEvents;
  NSMutableArray *v5;
  NSMutableArray *v6;

  if (!self->_resetEvents)
  {
    v3 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithContentsOfURL:", self->_resetEventsURL);
    resetEvents = self->_resetEvents;
    self->_resetEvents = v3;

    if (!self->_resetEvents)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = self->_resetEvents;
      self->_resetEvents = v5;

    }
  }
}

- (void)_storeResetEvent:(id)a3 scopeIdentifier:(id)a4 date:(id)a5 pending:(BOOL)a6 cause:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSMutableArray *resetEvents;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  id WeakRetained;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[5];
  _QWORD v32[6];

  v8 = a6;
  v32[5] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (__CFString *)a7;
  -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "isEqualToString:", v16);

  if (v17)
  {
    -[CPLEngineStore _loadResetEvents](self, "_loadResetEvents");
    if ((unint64_t)-[NSMutableArray count](self->_resetEvents, "count") >= 5)
    {
      do
        -[NSMutableArray removeObjectAtIndex:](self->_resetEvents, "removeObjectAtIndex:", 0);
      while ((unint64_t)-[NSMutableArray count](self->_resetEvents, "count") > 4);
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      v15 = CFSTR("unknown reason");
    resetEvents = self->_resetEvents;
    if (v8)
    {
      v31[0] = CFSTR("type");
      v31[1] = CFSTR("cause");
      v32[0] = v12;
      v32[1] = v15;
      v32[2] = v19;
      v21 = v14;
      v31[2] = CFSTR("uuid");
      v31[3] = CFSTR("date");
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v31[4] = CFSTR("pending");
      v32[3] = v21;
      v32[4] = MEMORY[0x1E0C9AAB0];
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v32;
      v24 = v31;
      v25 = 5;
    }
    else
    {
      v29[0] = CFSTR("type");
      v29[1] = CFSTR("cause");
      v30[0] = v12;
      v30[1] = v15;
      v30[2] = v19;
      v21 = v14;
      v29[2] = CFSTR("uuid");
      v29[3] = CFSTR("date");
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v30[3] = v21;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v30;
      v24 = v29;
      v25 = 4;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](resetEvents, "addObject:", v26);

    if (!v14)
    -[NSMutableArray writeToURL:atomically:](self->_resetEvents, "writeToURL:atomically:", self->_resetEventsURL, 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    objc_msgSend(WeakRetained, "feedback");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "reportResetType:reason:uuid:", v12, v15, v19);

  }
}

- (void)_storeResetEvent:(id)a3 scopeIdentifier:(id)a4 date:(id)a5 cause:(id)a6
{
  -[CPLEngineStore _storeResetEvent:scopeIdentifier:date:pending:cause:](self, "_storeResetEvent:scopeIdentifier:date:pending:cause:", a3, a4, a5, 1, a6);
}

- (void)noteResetSyncFinished
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id WeakRetained;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;

  -[CPLEngineStore _loadResetEvents](self, "_loadResetEvents");
  -[CPLEngineResourceStorage fileStorage](self->_resourceStorage, "fileStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTrackAllStoresAndDeletes:", 0);

  -[NSMutableArray lastObject](self->_resetEvents, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pending"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    v4 = v16;
    if (v6)
    {
      v7 = (void *)objc_msgSend(v16, "mutableCopy");
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("pending"));
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("endDate"));

      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_resetEvents, "replaceObjectAtIndex:withObject:", -[NSMutableArray count](self->_resetEvents, "count") - 1, v7);
      -[NSMutableArray writeToURL:atomically:](self->_resetEvents, "writeToURL:atomically:", self->_resetEventsURL, 1);
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("uuid"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
      objc_msgSend(WeakRetained, "feedback");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v12 = v9;
      else
        v12 = CFSTR("none");
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("cause"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (const __CFString *)v13;
      else
        v15 = CFSTR("End of reset");
      objc_msgSend(v11, "reportEndOfResetWithUUID:reason:", v12, v15);

      v4 = v16;
    }
  }

}

- (BOOL)hasPendingResetSync
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[CPLEngineStore _loadResetEvents](self, "_loadResetEvents");
  -[NSMutableArray lastObject](self->_resetEvents, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pending"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_resetEventsDescriptions
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v22;
  NSMutableArray *obj;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStore _loadResetEvents](self, "_loadResetEvents");
  v3 = -[NSMutableArray count](self->_resetEvents, "count");
  if (v3)
  {
    v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray lastObject](self->_resetEvents, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = self->_resetEvents;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v6 = v5;
      v24 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("date"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cause"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v9, v4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v10, v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (%@) - %@ finished %@"), v12, v13, v14, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v16);

          }
          else
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pending"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "BOOLValue");

            if (v18)
            {
              v19 = (void *)MEMORY[0x1E0CB3940];
              if (v22 == v8)
              {
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("type"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("cause"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v9, v4);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (%@) - %@ ongoing"), v12, v13, v14);
              }
              else
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cause"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v9, v4);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (%@) - %@ aborted"), v12, v13, v14);
              }
            }
            else
            {
              v20 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cause"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v9, v4);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ (%@) - %@"), v12, v13, v14);
            }
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v15);
          }

        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v6);
    }

  }
  else
  {
    v25 = 0;
  }
  return v25;
}

- (id)_resetEventsJSON
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStore _loadResetEvents](self, "_loadResetEvents");
  v3 = (void *)-[NSMutableArray count](self->_resetEvents, "count");
  if (v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = self->_resetEvents;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v11 = (void *)objc_msgSend(v10, "mutableCopy");
          v14[0] = v8;
          v14[1] = 3221225472;
          v14[2] = __34__CPLEngineStore__resetEventsJSON__block_invoke;
          v14[3] = &unk_1E60DD618;
          v15 = v11;
          v12 = v11;
          objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
          objc_msgSend(v3, "addObject:", v12);

        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

  }
  return v3;
}

- (BOOL)_resetGlobalStateWithError:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;

  -[CPLEngineStore platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStore createNewLibraryVersion](self, "createNewLibraryVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CPLEngineStore storeLibraryVersion:withError:](self, "storeLibraryVersion:withError:", v6, a3);

  if (!v7)
    goto LABEL_10;
  if (!objc_msgSend(v5, "storeClientIsNotInSyncWithClientCacheWithError:", a3))
    goto LABEL_10;
  objc_msgSend(v5, "createNewClientCacheIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "storeClientCacheIdentifier:error:", v8, a3);

  if (!v9)
    goto LABEL_10;
  objc_msgSend(v5, "storedChangeSessionUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "discardFromStore:error:", self, a3) & 1) == 0)
  {

LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v12 = objc_msgSend(v5, "storeChangeSessionUpdate:error:", 0, a3);
  -[CPLEngineStore _unschedulePendingUpdateApply](self, "_unschedulePendingUpdateApply");

  if (!v12
    || !-[CPLEnginePushRepository storeExtractedBatch:error:](self->_pushRepository, "storeExtractedBatch:error:", 0, a3))
  {
    goto LABEL_10;
  }
  -[CPLEnginePushRepository setExtractionStrategy:](self->_pushRepository, "setExtractionStrategy:", 0);
  -[CPLEngineScopeStorage storeScopeListSyncAnchor:error:](self->_scopes, "storeScopeListSyncAnchor:error:", 0, a3);
  v13 = 1;
  self->_schedulePullFromClient = 1;
  -[CPLEngineStatusCenter resetAllTransientStatuses](self->_statusCenter, "resetAllTransientStatuses");
LABEL_11:

  return v13;
}

- (BOOL)_resetLocalSyncStateWithCause:(id)a3 scope:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  BOOL v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "scopeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v13;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Resetting local sync state for %@ (%@)", (uint8_t *)&v19, 0x16u);
    }

  }
  -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqualToString:", v15);

  if (v16)
    -[CPLEngineStore _storeResetEvent:scopeIdentifier:date:cause:](self, "_storeResetEvent:scopeIdentifier:date:cause:", CFSTR("soft"), v13, v12, v10);
  v17 = -[CPLEngineScopeStorage resetLocalSyncStateForScope:error:](self->_scopes, "resetLocalSyncStateForScope:error:", v11, a6);

  return v17;
}

- (BOOL)_resetCompleteSyncStateWithCause:(id)a3 scope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  BOOL v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Resetting complete sync state for %@ (%@)", (uint8_t *)&v16, 0x16u);
    }

  }
  -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v13)
    -[CPLEngineStore _storeResetEvent:scopeIdentifier:date:cause:](self, "_storeResetEvent:scopeIdentifier:date:cause:", CFSTR("hard"), v10, 0, v8);
  v14 = -[CPLEngineScopeStorage resetCompleteSyncStateForScope:error:](self->_scopes, "resetCompleteSyncStateForScope:error:", v9, a5);

  return v14;
}

- (BOOL)_resetCompleteSyncStateIncludingIDMappingWithCause:(id)a3 scope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  BOOL v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Resetting complete sync state for %@ (%@)", (uint8_t *)&v16, 0x16u);
    }

  }
  -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v13)
    -[CPLEngineStore _storeResetEvent:scopeIdentifier:date:cause:](self, "_storeResetEvent:scopeIdentifier:date:cause:", CFSTR("hard"), v10, 0, v8);
  v14 = -[CPLEngineScopeStorage resetCompleteSyncStateIncludingIDMappingForScope:error:](self->_scopes, "resetCompleteSyncStateIncludingIDMappingForScope:error:", v9, a5);

  return v14;
}

- (BOOL)_resetSyncAnchorWithCause:(id)a3 scope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  BOOL v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Resetting sync anchor (%@) for %@", (uint8_t *)&v16, 0x16u);
    }

  }
  -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v13)
    -[CPLEngineStore _storeResetEvent:scopeIdentifier:date:cause:](self, "_storeResetEvent:scopeIdentifier:date:cause:", CFSTR("anchor"), v10, 0, v8);
  v14 = -[CPLEngineScopeStorage resetSyncAnchorForScope:error:](self->_scopes, "resetSyncAnchorForScope:error:", v9, a5);

  return v14;
}

- (BOOL)resetLocalSyncStateWithCause:(id)a3 error:(id *)a4
{
  return -[CPLEngineStore resetLocalSyncStateWithCause:date:error:](self, "resetLocalSyncStateWithCause:date:error:", a3, 0, a4);
}

- (BOOL)resetLocalSyncStateWithCause:(id)a3 date:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_isUpdatingDisabledFeatures)
  {
    v10 = 1;
    self->_shouldTriggerResetSyncAfterDisabledFeaturesUpdate = 1;
  }
  else
  {
    -[CPLEngineStore isClientInSyncWithClientCache](self, "isClientInSyncWithClientCache");
    if (-[CPLEngineStore _resetGlobalStateWithError:](self, "_resetGlobalStateWithError:", a5))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            if (!-[CPLEngineStore _resetLocalSyncStateWithCause:scope:date:error:](self, "_resetLocalSyncStateWithCause:scope:date:error:", v8, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v9, a5))
            {

              goto LABEL_14;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v13)
            continue;
          break;
        }
      }

      v10 = 1;
    }
    else
    {
LABEL_14:
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)resetCompleteSyncStateWithCause:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_isUpdatingDisabledFeatures)
  {
    v7 = 1;
    self->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate = 1;
  }
  else if (-[CPLEngineStore _resetGlobalStateWithError:](self, "_resetGlobalStateWithError:", a4))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if (!-[CPLEngineStore _resetCompleteSyncStateWithCause:scope:error:](self, "_resetCompleteSyncStateWithCause:scope:error:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a4))
          {

            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = -[CPLEngineStore storeUserIdentifier:error:](self, "storeUserIdentifier:error:", 0, a4);
  }
  else
  {
LABEL_14:
    v7 = 0;
  }

  return v7;
}

- (BOOL)resetCompleteSyncStateIncludingIDMappingWithCause:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CPLEngineStore _resetGlobalStateWithError:](self, "_resetGlobalStateWithError:", a4))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          if (!-[CPLEngineStore _resetCompleteSyncStateIncludingIDMappingWithCause:scope:error:](self, "_resetCompleteSyncStateIncludingIDMappingWithCause:scope:error:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a4))
          {

            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }

    v12 = -[CPLEngineStore storeUserIdentifier:error:](self, "storeUserIdentifier:error:", 0, a4);
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

- (BOOL)resetSyncAnchorWithCause:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!-[CPLEngineStore _resetSyncAnchorWithCause:scope:error:](self, "_resetSyncAnchorWithCause:scope:error:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a4))
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)noteOtherResetEvent:(id)a3 cause:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStore _storeResetEvent:scopeIdentifier:date:cause:](self, "_storeResetEvent:scopeIdentifier:date:cause:", v7, v8, 0, v6);

}

- (void)noteInvalidRecordScopedIdentifiersInPushSession:(id)a3
{
  void *v4;
  id v5;
  NSDate *v6;
  NSDate *lastInvalidRecordsDate;
  NSSet *v8;
  NSSet *lastInvalidRecordScopedIdentifiers;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastInvalidRecordsDate = self->_lastInvalidRecordsDate;
  self->_lastInvalidRecordsDate = v6;

  v8 = (NSSet *)objc_msgSend(v5, "copy");
  lastInvalidRecordScopedIdentifiers = self->_lastInvalidRecordScopedIdentifiers;
  self->_lastInvalidRecordScopedIdentifiers = v8;

}

- (BOOL)createStoragesDynamically:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "createStoragesDynamically:error:", v6, a4);

  return (char)a4;
}

- (BOOL)deleteDynamicallyCreatedStorages:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "deleteDynamicallyCreatedStorages:error:", v6, a4);

  return (char)a4;
}

- (BOOL)_handleException:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "name"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CPLAssertStoreException")),
        v5,
        v6))
  {
    objc_msgSend(v4, "reason");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("Store exception raised");
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__CPLEngineStore__handleException___block_invoke;
    v13[3] = &unk_1E60D65B8;
    v14 = v4;
    -[CPLEngineStore wipeStoreAtNextOpeningWithReason:completionBlock:](self, "wipeStoreAtNextOpeningWithReason:completionBlock:", v10, v13);

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_performTransaction:(id)a3 withBlock:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id WeakRetained;
  NSObject *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void (**v31)(void);
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = (void (**)(void))a4;
  -[CPLEngineStore _setTransactionOnCurrentThread:](self, "_setTransactionOnCurrentThread:", v6);
  if (objc_msgSend(v6, "canWrite") && -[CPLEngineStore state](self, "state") == 2)
  {
    v7 = -[CPLEngineOutgoingResources sizeOfResourcesToUpload](self->_outgoingResources, "sizeOfResourcesToUpload");
    v8 = -[CPLEngineOutgoingResources sizeOfOriginalResourcesToUpload](self->_outgoingResources, "sizeOfOriginalResourcesToUpload");
    v9 = -[CPLEngineOutgoingResources countOfOriginalImages](self->_outgoingResources, "countOfOriginalImages");
    v10 = -[CPLEngineOutgoingResources countOfOriginalVideos](self->_outgoingResources, "countOfOriginalVideos");
    v11 = 1;
    v29 = -[CPLEngineOutgoingResources countOfOriginalOthers](self->_outgoingResources, "countOfOriginalOthers");
    v30 = v10;
    v12 = v9;
    v13 = v8;
    v14 = v7;
  }
  else
  {
    v11 = 0;
    v29 = 0;
    v30 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  v31[2]();
  if (!v11)
    goto LABEL_12;
  objc_msgSend(v6, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    || (v16 = -[CPLEngineOutgoingResources sizeOfResourcesToUpload](self->_outgoingResources, "sizeOfResourcesToUpload"),
        v17 = -[CPLEngineOutgoingResources sizeOfOriginalResourcesToUpload](self->_outgoingResources, "sizeOfOriginalResourcesToUpload"), v18 = -[CPLEngineOutgoingResources countOfOriginalImages](self->_outgoingResources, "countOfOriginalImages"), v19 = -[CPLEngineOutgoingResources countOfOriginalVideos](self->_outgoingResources, "countOfOriginalVideos"), v20 = -[CPLEngineOutgoingResources countOfOriginalOthers](self->_outgoingResources, "countOfOriginalOthers"), v16 == v14)&& v17 == v13&& v18 == v12&& v19 == v30&& v20 == v29)
  {
LABEL_12:
    v21 = 0;
  }
  else
  {
    v21 = 1;
    v29 = v20;
    v30 = v19;
    v12 = v18;
    v13 = v17;
    v14 = v16;
  }
  objc_msgSend(v6, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if (!objc_msgSend(v22, "isCPLOperationCancelledError"))
    {
      if (objc_msgSend(v23, "isCPLError"))
      {
        if (_CPLSilentLogging)
          goto LABEL_30;
        __CPLTransactionOSLogDomain();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "error");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v6;
          v34 = 2112;
          v35 = v27;
          _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEFAULT, "! %@ failed: %@", buf, 0x16u);

        }
      }
      else
      {
        if (_CPLSilentLogging)
          goto LABEL_30;
        __CPLTransactionOSLogDomain();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "error");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v6;
          v34 = 2112;
          v35 = v28;
          _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_ERROR, "! %@ failed: %@", buf, 0x16u);

        }
      }

      goto LABEL_30;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTransactionOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v6;
        _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEBUG, "! %@ failed: transaction was cancelled", buf, 0xCu);
      }

    }
  }
  else if (v21)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    objc_msgSend(WeakRetained, "notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize:sizeOfOriginalResourcesToUpload:numberOfImages:numberOfVideos:numberOfOtherItems:", v14, v13, v12, v30, v29);

  }
LABEL_30:
  -[CPLEngineStore _removeTransactionOnCurrentThread:](self, "_removeTransactionOnCurrentThread:", v6);

}

- (void)_finishTransaction
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_storages;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "transactionDidFinish", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CPLEngineStore transactionDidFinish](self, "transactionDidFinish");
}

- (void)_performBarrierTransaction:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = +[CPLTransaction newTransactionWithIdentifier:description:keepPower:](CPLTransaction, "newTransactionWithIdentifier:description:keepPower:", CFSTR("cpl.store.barrier"), CFSTR("barrier"), 1);
  -[CPLEngineStore platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__CPLEngineStore__performBarrierTransaction_withBlock___block_invoke;
  v12[3] = &unk_1E60DC4C0;
  v13 = v8;
  v14 = v6;
  v12[4] = self;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v9, "performBarrierTransaction:withBlock:", v7, v12);

}

- (void)openWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, void *);
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if (-[CPLEngineStore state](self, "state"))
  {
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Can't open library if it's not closed first"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[CPLEngineStore platformObject](self, "platformObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Opening concrete store: %@", buf, 0xCu);

      }
    }
    -[CPLEngineStore setState:](self, "setState:", 1);
    v8 = -[CPLEngineStoreTransaction initForWrite:store:identifier:description:]([CPLEngineStoreTransaction alloc], "initForWrite:store:identifier:description:", 1, self, CFSTR("cpl.store.open"), CFSTR("open store"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__CPLEngineStore_openWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E60D70C8;
    v10[4] = self;
    v11 = v8;
    v12 = v4;
    v9 = v8;
    -[CPLEngineStore _performBarrierTransaction:withBlock:](self, "_performBarrierTransaction:withBlock:", v9, v10);

  }
}

- (id)performReadTransactionWithBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CPLEngineStoreTransaction initForWrite:store:identifier:description:]([CPLEngineStoreTransaction alloc], "initForWrite:store:identifier:description:", 0, self, CFSTR("cpl.store.read"), CFSTR("read store"));
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Will read store with %@", buf, 0xCu);
    }

  }
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__CPLEngineStore_performReadTransactionWithBlock___block_invoke;
  v13[3] = &unk_1E60D70C8;
  v13[4] = self;
  v8 = v5;
  v14 = v8;
  v15 = v4;
  v9 = v4;
  objc_msgSend(v7, "performReadTransaction:withBlock:", v8, v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

- (void)writeTransactionDidSucceed
{
  NSObject *shouldSyncScopeListQueue;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  NSMutableDictionary *transactionNewPredictions;
  id v15;
  _QWORD block[5];

  if (self->_unschedulePendingUpdateApplyOnWriteSuccess)
    -[CPLEngineStore _reallyUnschedulePendingUpdateApply](self, "_reallyUnschedulePendingUpdateApply");
  if (self->_schedulePendingUpdateApplyOnWriteSuccess)
    -[CPLEngineStore _reallySchedulePendingUpdateApply](self, "_reallySchedulePendingUpdateApply");
  if (self->_shouldEnableScopeListSyncOnWriteSuccess)
  {
    shouldSyncScopeListQueue = self->_shouldSyncScopeListQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__CPLEngineStore_writeTransactionDidSucceed__block_invoke;
    block[3] = &unk_1E60D65B8;
    block[4] = self;
    dispatch_sync(shouldSyncScopeListQueue, block);
    -[CPLEngineStore engineLibrary](self, "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteScopeListNeedsUpdate");

    self->_shouldEnableScopeListSyncOnWriteSuccess = 0;
  }
  if (self->_scheduleSetupOnWriteSuccess)
  {
    -[CPLEngineStore engineLibrary](self, "engineLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noteStoreNeedsSetup");

    self->_scheduleSetupOnWriteSuccess = 0;
  }
  if (self->_scheduleDisabledFeatureUpdateOnWriteSuccess)
  {
    -[CPLEngineStore engineLibrary](self, "engineLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "noteStoreNeedsToUpdateDisabledFeatures");

    self->_scheduleDisabledFeatureUpdateOnWriteSuccess = 0;
  }
  if (self->_schedulePullFromClient)
  {
    -[CPLEngineStore engineLibrary](self, "engineLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notifyAttachedObjectsPullQueueIsFull");

    self->_schedulePullFromClient = 0;
  }
  self->_discardUnacknowledgedBatchOnTransactionFail = 0;
  self->_pendingUpdateInterval = 0.0;
  self->_hasUpdatedDisabledFeatures = 0;
  if (self->_transactionNewPredictions)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    objc_msgSend(WeakRetained, "scheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predictor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updatePredictionWithValuesAndTypes:", self->_transactionNewPredictions);

    transactionNewPredictions = self->_transactionNewPredictions;
    self->_transactionNewPredictions = 0;

  }
  -[CPLEngineStore platformObject](self, "platformObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "writeTransactionDidSucceed");

}

- (void)writeTransactionDidFail
{
  CPLChangeBatch *unacknowledgedBatch;
  NSArray *disabledFeatures;
  NSMutableDictionary *transactionNewPredictions;
  id v6;

  self->_shouldEnableScopeListSyncOnWriteSuccess = 0;
  self->_pendingUpdateInterval = 0.0;
  *(double *)((char *)&self->_pendingUpdateInterval + 5) = 0.0;
  if (self->_discardUnacknowledgedBatchOnTransactionFail)
  {
    self->_discardUnacknowledgedBatchOnTransactionFail = 0;
    unacknowledgedBatch = self->_unacknowledgedBatch;
    self->_unacknowledgedBatch = 0;

  }
  if (self->_hasUpdatedDisabledFeatures)
  {
    disabledFeatures = self->_disabledFeatures;
    self->_disabledFeatures = 0;

    self->_hasUpdatedDisabledFeatures = 0;
  }
  transactionNewPredictions = self->_transactionNewPredictions;
  self->_transactionNewPredictions = 0;

  -[CPLEngineStore platformObject](self, "platformObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeTransactionDidFail");

}

- (void)transactionDidFinish
{
  CPLTransportScopeMapping *transactionTransportScopeMapping;

  transactionTransportScopeMapping = self->_transactionTransportScopeMapping;
  self->_transactionTransportScopeMapping = 0;

  -[CPLEngineStore _dropTransactionClientCacheView](self, "_dropTransactionClientCacheView");
}

- (void)_commitWriteTransaction:(id)a3 commitError:(id)a4
{
  id v6;
  id v7;
  unint64_t state;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  NSHashTable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSObject *v21;
  void *v22;
  CPLEngineStore *v23;
  NSObject *v25;
  void *v26;
  NSHashTable *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  CPLEngineStore *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state = self->_state;
  objc_msgSend(v6, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v6;
  v37 = self;
  v35 = v7;
  if (v9)
  {
LABEL_27:
    if (state == 3 && _CPLSilentLogging == 0)
    {
      __CPLStoreOSLogDomain_2635();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "error");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v26;
        _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_ERROR, "Closing transaction did fail: %@", buf, 0xCu);

      }
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v27 = self->_storages;
    v28 = -[NSHashTable countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v43 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (state == 3 && !_CPLSilentLogging)
          {
            __CPLStoreOSLogDomain_2635();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v32, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v49 = v34;
              _os_log_impl(&dword_1B03C2000, v33, OS_LOG_TYPE_DEFAULT, "Closing %{public}@ after failed transaction", buf, 0xCu);

            }
          }
          objc_msgSend(v32, "writeTransactionDidFail");
        }
        v29 = -[NSHashTable countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v29);
    }

    v23 = v37;
    -[CPLEngineStore writeTransactionDidFail](v37, "writeTransactionDidFail");
    goto LABEL_48;
  }
  if (v7)
  {
    if (state != 3)
    {
      if (objc_msgSend(v7, "isCPLOperationCancelledError"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTransactionOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v6;
            v11 = "! %@ commit failed: operation was cancelled";
            v12 = v10;
            v13 = OS_LOG_TYPE_DEBUG;
            v14 = 12;
LABEL_24:
            _os_log_impl(&dword_1B03C2000, v12, v13, v11, buf, v14);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
      }
      else if (!_CPLSilentLogging)
      {
        __CPLTransactionOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v49 = v6;
          v50 = 2112;
          v51 = v7;
          v11 = "! %@ commit failed: %@";
          v12 = v10;
          v13 = OS_LOG_TYPE_ERROR;
          v14 = 22;
          goto LABEL_24;
        }
LABEL_25:

      }
    }
    objc_msgSend(v6, "setError:", v7);
    goto LABEL_27;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_storages;
  v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        if (state == 3 && !_CPLSilentLogging)
        {
          __CPLStoreOSLogDomain_2635();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v20, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v49 = v22;
            _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Closing %{public}@", buf, 0xCu);

          }
        }
        objc_msgSend(v20, "writeTransactionDidSucceed");
      }
      v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v17);
  }

  v23 = self;
  -[CPLEngineStore writeTransactionDidSucceed](self, "writeTransactionDidSucceed");
LABEL_48:
  -[CPLEngineStore _finishTransaction](v23, "_finishTransaction");

}

- (id)_performWriteTransactionByPassBlocker:(id)a3 WithBlock:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id WeakRetained;
  char v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  CPLEngineStore *v25;
  id v26;
  __int128 *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CPLEngineStoreTransaction initForWrite:store:identifier:description:]([CPLEngineStoreTransaction alloc], "initForWrite:store:identifier:description:", 1, self, CFSTR("cpl.store.write"), CFSTR("write store"));
  objc_msgSend(v11, "setBlocker:", v8);
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "Will write store with %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x2020000000;
  v34 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  v14 = objc_msgSend(WeakRetained, "hasChangesToProcess");

  v34 = v14;
  -[CPLEngineStore platformObject](self, "platformObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke;
  v28[3] = &unk_1E60DB768;
  v28[4] = self;
  v29 = v11;
  v17 = v9;
  v30 = v17;
  p_buf = &buf;
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke_207;
  v23[3] = &unk_1E60D6870;
  v18 = v29;
  v24 = v18;
  v25 = self;
  v27 = &buf;
  v19 = v10;
  v26 = v19;
  objc_msgSend(v15, "performWriteTransaction:withBlock:completionHandler:", v18, v28, v23);

  v20 = v26;
  v21 = v18;

  _Block_object_dispose(&buf, 8);
  return v21;
}

- (id)performWriteTransactionWithBlock:(id)a3 completionHandler:(id)a4
{
  return -[CPLEngineStore _performWriteTransactionByPassBlocker:WithBlock:completionHandler:](self, "_performWriteTransactionByPassBlocker:WithBlock:completionHandler:", 0, a3, a4);
}

- (void)blockWriteTransactionsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockWriteTransactionsWithCompletionHandler:", v4);

}

- (void)_scheduleBatchedTransactionsLocked
{
  dispatch_time_t v3;
  NSObject *batchedTransactionsQueue;
  _QWORD block[5];

  self->_batchedTransactionDequeueIsScheduled = 1;
  v3 = dispatch_walltime(0, 1000000000);
  batchedTransactionsQueue = self->_batchedTransactionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CPLEngineStore__scheduleBatchedTransactionsLocked__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_after(v3, batchedTransactionsQueue, block);
}

- (void)_reallyPerformBatchedTransactionsLocked
{
  id v3;
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[5];
  id v7;

  if (-[NSMutableArray count](self->_batchedTransactions, "count"))
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3032000000;
    v6[3] = __Block_byref_object_copy__640;
    v6[4] = __Block_byref_object_dispose__641;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4[5] = v6;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke;
    v5[3] = &unk_1E60DDB58;
    v5[4] = self;
    v5[5] = v6;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_3;
    v4[3] = &unk_1E60DDB58;
    v4[4] = self;
    v3 = -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:](self, "performWriteTransactionWithBlock:completionHandler:", v5, v4);
    _Block_object_dispose(v6, 8);

  }
}

- (void)performBatchedWriteTransactionWithBlock:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  OS_dispatch_queue *batchedTransactionsQueue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;

  v6 = a3;
  v7 = a4;
  if (_dontBatchTransactions)
  {
    v8 = -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:](self, "performWriteTransactionWithBlock:completionHandler:", v6, v7);
  }
  else
  {
    batchedTransactionsQueue = self->_batchedTransactionsQueue;
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__CPLEngineStore_performBatchedWriteTransactionWithBlock_completionHandler___block_invoke;
    v14[3] = &unk_1E60DB648;
    v15 = v6;
    v16 = v7;
    v14[4] = self;
    v11 = v14;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_644;
    block[3] = &unk_1E60D71F8;
    v18 = v11;
    v12 = batchedTransactionsQueue;
    v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v12, v13);

  }
}

- (void)performBatchedWriteTransactionBarrier
{
  NSObject *batchedTransactionsQueue;
  _QWORD block[5];

  batchedTransactionsQueue = self->_batchedTransactionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CPLEngineStore_performBatchedWriteTransactionBarrier__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_sync(batchedTransactionsQueue, block);
}

- (void)performBatchedWriteTransactionBarrierWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *batchedTransactionsQueue;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  batchedTransactionsQueue = self->_batchedTransactionsQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke;
  block[3] = &unk_1E60D64C8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(batchedTransactionsQueue, block);
  if (*((_BYTE *)v17 + 24))
  {
    v7 = -[CPLEngineStoreTransaction initForWrite:store:identifier:description:]([CPLEngineStoreTransaction alloc], "initForWrite:store:identifier:description:", 0, self, CFSTR("cpl.store.batch.barrier"), CFSTR("barrier for batched write"));
    -[CPLEngineStore platformObject](self, "platformObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke_2;
    v12[3] = &unk_1E60DB970;
    v14 = v4;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "performBarrierTransaction:withBlock:", v9, v12);

  }
  else
  {
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke_4;
    v10[3] = &unk_1E60D8CA8;
    v11 = v4;
    -[CPLEngineStore performBatchedWriteTransactionWithBlock:completionHandler:](self, "performBatchedWriteTransactionWithBlock:completionHandler:", &__block_literal_global_215, v10);
    v9 = v11;
  }

  _Block_object_dispose(&v16, 8);
}

- (void)performBarrier
{
  id v3;

  -[CPLEngineStore performBatchedWriteTransactionBarrier](self, "performBatchedWriteTransactionBarrier");
  -[CPLEngineStore platformObject](self, "platformObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performBarrier");

}

- (void)_closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[CPLEngineStore state](self, "state") == 2)
  {
    -[CPLEngineStore setState:](self, "setState:", 3);
    v7 = -[CPLEngineStoreTransaction initForWrite:store:identifier:description:]([CPLEngineStoreTransaction alloc], "initForWrite:store:identifier:description:", 1, self, CFSTR("cpl.store.close"), CFSTR("close store"));
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[CPLEngineStore platformObject](self, "platformObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Closing concrete store: %@", buf, 0xCu);

      }
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke;
    v12[3] = &unk_1E60D6D48;
    v12[4] = self;
    v13 = v7;
    v15 = a3;
    v14 = v6;
    v10 = v7;
    -[CPLEngineStore _performBarrierTransaction:withBlock:](self, "_performBarrierTransaction:withBlock:", v10, v12);

  }
  else
  {
    +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Library is not open"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v11);

  }
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  char v11;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__CPLEngineStore_closeAndDeactivate_completionHandler___block_invoke;
    v9[3] = &unk_1E60DC058;
    v9[4] = self;
    v11 = 1;
    v10 = v6;
    -[CPLEngineStore wipeStoreAtNextOpeningWithReason:completionBlock:](self, "wipeStoreAtNextOpeningWithReason:completionBlock:", CFSTR("wiping database because it has been marked as deactivated"), v9, v7);

  }
  else
  {
    -[CPLEngineStore _closeAndDeactivate:completionHandler:](self, "_closeAndDeactivate:completionHandler:", 0, v6, v6);
  }

}

- (BOOL)storeLibraryVersion:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeLibraryVersion:withError:", v6, a4);

  return (char)a4;
}

- (unint64_t)libraryOptions
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "libraryOptions");

  return v3;
}

- (BOOL)updateLibraryOptions:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  int v8;

  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "updateLibraryOptions:error:", a3, a4);

  if (v8)
    -[CPLEngineStore _updateShouldSyncScopeList:](self, "_updateShouldSyncScopeList:", -[CPLEngineStore _shouldSyncScopeListWithOptions:](self, "_shouldSyncScopeListWithOptions:", a3));
  return v8;
}

- (BOOL)_shouldSyncScopeListWithOptions:(unint64_t)a3
{
  return a3 != 0;
}

- (void)_updateShouldSyncScopeList:(BOOL)a3
{
  NSObject *shouldSyncScopeListQueue;
  _QWORD v4[5];
  BOOL v5;

  shouldSyncScopeListQueue = self->_shouldSyncScopeListQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CPLEngineStore__updateShouldSyncScopeList___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(shouldSyncScopeListQueue, v4);
}

- (BOOL)shouldSyncScopeList
{
  NSObject *shouldSyncScopeListQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  shouldSyncScopeListQueue = self->_shouldSyncScopeListQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CPLEngineStore_shouldSyncScopeList__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(shouldSyncScopeListQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)libraryVersion
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createNewLibraryVersion
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createNewLibraryVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)pushRepositoryIsFull
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  CPLEnginePushRepository *pushRepository;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        pushRepository = self->_pushRepository;
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "scopeIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(pushRepository) = -[CPLEnginePushRepository hasChangesInScopeWithIdentifier:](pushRepository, "hasChangesInScopeWithIdentifier:", v9);

        if ((pushRepository & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)userIdentifier
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)storeUserIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;

  v6 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "storeUserIdentifier:error:", v6, a4);

  if (!v6 && v8)
    self->_scheduleSetupOnWriteSuccess = 1;
  return v8;
}

- (id)lastQuarantineCountReportDate
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastQuarantineCountReportDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)storeLastQuarantineCountReportDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeLastQuarantineCountReportDate:error:", v6, a4);

  return (char)a4;
}

- (id)clientCacheIdentifier
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientCacheIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)storeClientIsInSyncWithClientCacheWithError:(id *)a3
{
  void *v4;

  -[CPLEngineStore platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "storeClientIsInSyncWithClientCacheWithError:", a3);

  return (char)a3;
}

- (BOOL)isClientInSyncWithClientCache
{
  void *v2;
  char v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClientInSyncWithClientCache");

  return v3;
}

- (NSDate)libraryCreationDate
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryCreationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)corruptionInfo
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "corruptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldGenerateDerivatives
{
  return -[CPLEngineDerivativesCache derivativeGeneratorClass](self->_derivativesCache, "derivativeGeneratorClass") != 0;
}

- (CPLRecordStorageView)transactionClientCacheView
{
  CPLRecordStorageView *transactionClientCacheView;
  CPLRecordStorageView *v4;
  CPLRecordStorageView *v5;

  transactionClientCacheView = self->_transactionClientCacheView;
  if (!transactionClientCacheView)
  {
    v4 = -[CPLEngineStore newClientCacheViewUsesPushRepository:](self, "newClientCacheViewUsesPushRepository:", &self->_transactionClientCacheViewHasPushRepository);
    v5 = self->_transactionClientCacheView;
    self->_transactionClientCacheView = v4;

    transactionClientCacheView = self->_transactionClientCacheView;
  }
  return transactionClientCacheView;
}

- (void)notePushRepositoryStoredSomeChanges
{
  if (self->_transactionClientCacheView)
  {
    if (!self->_transactionClientCacheViewHasPushRepository)
      -[CPLEngineStore _dropTransactionClientCacheView](self, "_dropTransactionClientCacheView");
  }
}

- (BOOL)_applyAndDiscardPendingUpdate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  v6 = a3;
  v7 = v6;
  LOBYTE(v8) = 1;
  if (!self->_applyingChangeSessionUpdate)
  {
    self->_applyingChangeSessionUpdate = 1;
    v14 = 0;
    v8 = objc_msgSend(v6, "applyToStore:error:", self, &v14);
    v9 = v14;
    v10 = v9;
    if (v8)
    {
      v13 = v9;
      LOBYTE(v8) = -[CPLEngineStore _storeChangeSessionUpdate:error:](self, "_storeChangeSessionUpdate:error:", 0, &v13);
      v11 = v13;

      v10 = v11;
    }
    if (a4 && (v8 & 1) == 0)
      *a4 = objc_retainAutorelease(v10);
    self->_applyingChangeSessionUpdate = 0;

  }
  return v8;
}

- (BOOL)_applyPendingUpdate:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  id v18;

  v6 = a3;
  v18 = 0;
  v7 = -[CPLEngineStore _applyAndDiscardPendingUpdate:error:](self, "_applyAndDiscardPendingUpdate:error:", v6, &v18);
  v8 = v18;
  v9 = v8;
  if (!v7)
  {
    if (objc_msgSend(v8, "isCPLErrorWithCode:", 20)
      && (objc_msgSend(v9, "userInfo"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CPLErrorResetReason")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v11))
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to apply delayed update (%@) to client cache: %@"), objc_opt_class(), v11, v17);
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      v14 = objc_opt_class();
      objc_msgSend(v9, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "initWithFormat:", CFSTR("Failed to apply delayed update (%@) to client cache (%@/%ld)"), v14, v11, objc_msgSend(v9, "code"));
    }
    v15 = (void *)v12;

    if (a4)
      *a4 = objc_retainAutorelease(v9);
    +[CPLResetTracker registerLikelyResetReason:](CPLResetTracker, "registerLikelyResetReason:", CFSTR("%@"), v15);

  }
  return v7;
}

- (void)_reallySchedulePendingUpdateApply
{
  double pendingUpdateInterval;
  double v3;
  NSObject *pendingUpdateQueue;
  _QWORD v5[6];

  pendingUpdateInterval = self->_pendingUpdateInterval;
  v3 = 30.0;
  if (pendingUpdateInterval > 0.0)
  {
    if (pendingUpdateInterval <= 30.0)
      v3 = self->_pendingUpdateInterval;
    self->_pendingUpdateInterval = 0.0;
  }
  pendingUpdateQueue = self->_pendingUpdateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke;
  v5[3] = &unk_1E60D6DF8;
  v5[4] = self;
  *(double *)&v5[5] = v3;
  dispatch_sync(pendingUpdateQueue, v5);
}

- (void)_reallyUnschedulePendingUpdateApply
{
  NSObject *pendingUpdateQueue;
  _QWORD block[5];

  self->_pendingUpdateInterval = 0.0;
  pendingUpdateQueue = self->_pendingUpdateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CPLEngineStore__reallyUnschedulePendingUpdateApply__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_sync(pendingUpdateQueue, block);
}

- (void)_schedulePendingUpdateApply
{
  if (self->_unschedulePendingUpdateApplyOnWriteSuccess)
    self->_unschedulePendingUpdateApplyOnWriteSuccess = 0;
  self->_schedulePendingUpdateApplyOnWriteSuccess = 1;
}

- (void)_unschedulePendingUpdateApply
{
  if (self->_schedulePendingUpdateApplyOnWriteSuccess)
    self->_schedulePendingUpdateApplyOnWriteSuccess = 0;
  self->_unschedulePendingUpdateApplyOnWriteSuccess = 1;
}

- (void)_dropTransactionClientCacheView
{
  CPLRecordStorageView *transactionClientCacheView;

  transactionClientCacheView = self->_transactionClientCacheView;
  if (transactionClientCacheView)
  {
    self->_transactionClientCacheView = 0;

  }
}

- (BOOL)addPushPullGatekeeper:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushPullGatekeepers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  -[CPLEngineStore platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "arrayByAddingObject:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  v13 = objc_msgSend(v10, "storePushPullGatekeepers:error:", v12, a4);
  return v13;
}

- (BOOL)clearAllPushPullGatekeepersWithError:(id *)a3
{
  void *v4;

  -[CPLEngineStore platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "storePushPullGatekeepers:error:", 0, a3);

  return (char)a3;
}

- (NSArray)pushPullGatekeepers
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushPullGatekeepers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_storeChangeSessionUpdate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStore _dropTransactionClientCacheView](self, "_dropTransactionClientCacheView");
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeChangeSessionUpdate:error:", v6, a4);

  return (char)a4;
}

- (BOOL)storeChangeSessionUpdate:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  BOOL v12;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (self->_dontDelayChangeSessionUpdate)
  {
    if (!objc_msgSend(v7, "applyToStore:error:", self, a4))
    {
      v12 = 0;
      goto LABEL_8;
    }
    v9 = -[CPLEngineStore storeClientIsInSyncWithClientCacheWithError:](self, "storeClientIsInSyncWithClientCacheWithError:", a4);
  }
  else
  {
    -[CPLEngineStore platformObject](self, "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasStoredChangeSessionUpdate");

    if (v11)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          -[CPLEngineStore platformObject](self, "platformObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "storedChangeSessionUpdate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v22 = v8;
          v23 = 2112;
          v24 = v16;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Trying to store %@ while %@ is already stored", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineStore platformObject](self, "platformObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "storedChangeSessionUpdate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 1713, CFSTR("Trying to store %@ while %@ is already stored"), v8, v20);

      abort();
    }
    -[CPLEngineStore _schedulePendingUpdateApply](self, "_schedulePendingUpdateApply");
    v9 = -[CPLEngineStore _storeChangeSessionUpdate:error:](self, "_storeChangeSessionUpdate:error:", v8, a4);
  }
  v12 = v9;
LABEL_8:

  return v12;
}

- (BOOL)beginChangeSession:(id)a3 withLibraryVersion:(id)a4 resetTracker:(id)a5 error:(id *)a6
{
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  CPLResetTracker *pendingTracker;
  id *p_pendingTracker;
  void *v17;
  double v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  char v24;
  void *v25;
  void *v26;
  id *v27;
  NSObject *v28;
  NSObject *v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  BOOL v39;
  int v40;
  BOOL v41;
  NSObject *v42;
  void *v43;
  int v44;
  NSObject *v45;
  BOOL v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  char v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  id v55;
  _BOOL4 v56;
  NSObject *v57;
  BOOL v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  int v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  const char *v70;
  NSObject *v71;
  uint32_t v72;
  NSObject *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  SEL v84;
  id v85;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  NSObject *v89;
  __int16 v90;
  NSObject *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (_CPLDontDelayChangeSessionUpdate)
  {
    self->_dontDelayChangeSessionUpdate = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_dontDelayChangeSessionUpdate = objc_msgSend(v14, "BOOLForKey:", CFSTR("CPLDontDelayChangeSessionUpdate"));

  }
  p_pendingTracker = (id *)&self->_pendingTracker;
  pendingTracker = self->_pendingTracker;
  if (pendingTracker)
  {
    -[CPLResetTracker likelyResetDate](pendingTracker, "likelyResetDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceNow");
    if (v18 < -60.0)
    {
      v19 = *p_pendingTracker;
      *p_pendingTracker = 0;

    }
  }
  v84 = a2;
  if (v12)
  {
    -[CPLEngineStore libraryVersion](self, "libraryVersion");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v74, OS_LOG_TYPE_ERROR, "Library version should be set here", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v76, 1733, CFSTR("Library version should be set here"));

      abort();
    }
    v21 = v20;
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v87 = v12;
        v88 = 2112;
        v89 = v21;
        v90 = 2112;
        v91 = v11;
        _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEBUG, "Checking client version %@ against our own version %@ during %@", buf, 0x20u);
      }

    }
    v23 = v11;
    v24 = -[NSObject isEqualToString:](v21, "isEqualToString:", v12);
    -[CPLEngineStore platformObject](self, "platformObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "storedChangeSessionUpdate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v24 & 1) != 0)
    {
      v27 = a6;
      if (!v26)
      {
        v42 = v23;
        if (!_CPLSilentLogging)
        {
          __CPLStoreOSLogDomain_2635();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v87 = v12;
            v88 = 2112;
            v89 = v23;
            _os_log_impl(&dword_1B03C2000, v57, OS_LOG_TYPE_DEBUG, "Client has the correct version (%@). Starting %@", buf, 0x16u);
          }

        }
        v58 = -[CPLEngineStore storeClientIsInSyncWithClientCacheWithError:](self, "storeClientIsInSyncWithClientCacheWithError:", a6);

        v40 = 0;
        v41 = 0;
        if (!v58)
          goto LABEL_87;
        goto LABEL_68;
      }
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v26, "libraryVersion");
          v29 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v87 = v12;
          v88 = 2112;
          v89 = v29;
          v90 = 2112;
          v91 = v23;
          _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_ERROR, "Client has an incorrect version (%@) but it matches the previous version, discarding lost pending update (%@). Recovering %@", buf, 0x20u);

          v27 = a6;
        }

      }
      if ((objc_msgSend(v26, "discardFromStore:error:", self, v27) & 1) != 0)
      {
        v30 = -[CPLEngineStore _storeChangeSessionUpdate:error:](self, "_storeChangeSessionUpdate:error:", 0, v27);
        -[CPLEngineStore _unschedulePendingUpdateApply](self, "_unschedulePendingUpdateApply");

        if (!v30)
          goto LABEL_76;
        goto LABEL_37;
      }
      goto LABEL_75;
    }
    if (v26)
    {
      objc_msgSend(v26, "libraryVersion");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v12, "isEqualToString:", v43);

      if (v44)
      {
        v27 = a6;
        if (!_CPLSilentLogging)
        {
          __CPLStoreOSLogDomain_2635();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v87 = v12;
            v88 = 2112;
            v89 = v23;
            _os_log_impl(&dword_1B03C2000, v45, OS_LOG_TYPE_ERROR, "Client has the correct version (%@) after an unfinished session. Recovering %@", buf, 0x16u);
          }

        }
        if (-[CPLEngineStore _applyAndDiscardPendingUpdate:error:](self, "_applyAndDiscardPendingUpdate:error:", v26, a6))
        {
          -[CPLEngineStore _unschedulePendingUpdateApply](self, "_unschedulePendingUpdateApply");

LABEL_37:
          v46 = -[CPLEngineStore storeClientIsInSyncWithClientCacheWithError:](self, "storeClientIsInSyncWithClientCacheWithError:", v27);

          v42 = v23;
          if (!v46)
            goto LABEL_77;
          v40 = 1;
          goto LABEL_68;
        }
        +[CPLResetTracker registerLikelyResetReason:](CPLResetTracker, "registerLikelyResetReason:", CFSTR("Failed to apply delayed update (%@) to client cache"), objc_opt_class());
LABEL_75:

LABEL_76:
        v42 = v23;
LABEL_77:
        if (v27)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStoreOSLogDomain_2635();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v69 = *v27;
              *(_DWORD *)buf = 138412290;
              v87 = v69;
              v70 = "Failed to recover mismatched session: %@";
              v71 = v21;
              v72 = 12;
LABEL_84:
              _os_log_impl(&dword_1B03C2000, v71, OS_LOG_TYPE_ERROR, v70, buf, v72);
              goto LABEL_85;
            }
            goto LABEL_85;
          }
        }
        else if (!_CPLSilentLogging)
        {
          __CPLStoreOSLogDomain_2635();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v70 = "Failed to recover mismatched session";
            v71 = v21;
            v72 = 2;
            goto LABEL_84;
          }
LABEL_85:
          v41 = 0;
LABEL_86:

          goto LABEL_87;
        }
        v41 = 0;
        goto LABEL_87;
      }
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v26, "libraryVersion");
          v60 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v87 = v12;
          v88 = 2112;
          v89 = v21;
          v90 = 2112;
          v91 = v60;
          _os_log_impl(&dword_1B03C2000, v59, OS_LOG_TYPE_ERROR, "Client has an incorrect version (%@) - current version is (%@) and pending version is (%@). Client will have to perform a reset sync", buf, 0x20u);

        }
LABEL_63:

      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v87 = v12;
        v88 = 2112;
        v89 = v21;
        _os_log_impl(&dword_1B03C2000, v59, OS_LOG_TYPE_ERROR, "Client has an incorrect version (%@) - current version is (%@). Client will have to perform a reset sync", buf, 0x16u);
      }
      goto LABEL_63;
    }
    if (a6)
    {
      +[CPLErrors versionMismatchError](CPLErrors, "versionMismatchError");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[CPLResetTracker registerLikelyResetReason:](CPLResetTracker, "registerLikelyResetReason:", CFSTR("version mismatch during %@"), v23);

    v42 = v23;
    goto LABEL_85;
  }
  v31 = objc_alloc(MEMORY[0x1E0CB3940]);
  v83 = v11;
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("client library version reset in a %@ session"), v32);

  if ((objc_msgSend(v13, "hasReasons") & 1) == 0 && *p_pendingTracker)
  {
    v34 = *p_pendingTracker;

    v13 = v34;
  }
  -[CPLEngineStore platformObject](self, "platformObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isClientInSyncWithClientCache");

  if (v36)
  {
    objc_msgSend(v13, "likelyResetReasonWithImmediateReason:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "likelyResetDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[CPLEngineStore resetLocalSyncStateWithCause:date:error:](self, "resetLocalSyncStateWithCause:date:error:", v37, v38, a6);

    v40 = 0;
    v41 = 0;
    v42 = v83;
    if (!v39)
      goto LABEL_87;
  }
  else
  {
    -[CPLEngineStore platformObject](self, "platformObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "storedChangeSessionUpdate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v82 = v13;
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "likelyResetReasonWithImmediateReason:", v33);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v87 = v50;
          _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_ERROR, "Client is resetting library version but we are already out of sync - we still need to discard a pending update (%@)", buf, 0xCu);

        }
      }
      v85 = 0;
      v51 = objc_msgSend(v48, "discardFromStore:error:", self, &v85);
      v52 = v85;
      if ((v51 & 1) == 0 && !_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v87 = v54;
          v88 = 2112;
          v89 = v52;
          v55 = v54;
          _os_log_impl(&dword_1B03C2000, v53, OS_LOG_TYPE_ERROR, "Failed to cleanly discard pending update (%@): %@", buf, 0x16u);

        }
      }
      v56 = -[CPLEngineStore _storeChangeSessionUpdate:error:](self, "_storeChangeSessionUpdate:error:", 0, a6);

      v40 = 0;
      v41 = 0;
      v13 = v82;
      v42 = v83;
      if (!v56)
        goto LABEL_87;
    }
    else
    {

      v40 = 0;
      v42 = v83;
    }
  }
LABEL_68:
  -[CPLEngineStore platformObject](self, "platformObject");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "hasStoredChangeSessionUpdate");

  if (v62)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "shortDescription");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v87 = v78;
        _os_log_impl(&dword_1B03C2000, v77, OS_LOG_TYPE_ERROR, "A %@ session should always start with not pending updates", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "shortDescription");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", v84, self, v80, 1803, CFSTR("A %@ session should always start with not pending updates"), v81);

    abort();
  }
  if (v40)
  {
    v63 = objc_alloc(MEMORY[0x1E0CB3940]);
    v64 = v42;
    objc_msgSend((id)objc_opt_class(), "shortDescription");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v63, "initWithFormat:", CFSTR("client library version reset in a %@ session"), v65);

    -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "likelyResetDate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "likelyResetReasonWithImmediateReason:", v21);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineStore _storeResetEvent:scopeIdentifier:date:pending:cause:](self, "_storeResetEvent:scopeIdentifier:date:pending:cause:", CFSTR("recover"), v66, v67, 0, v68);

    if (objc_msgSend(v13, "hasReasons"))
      objc_storeStrong((id *)&self->_pendingTracker, v13);
    v41 = 1;
    v42 = v64;
    goto LABEL_86;
  }
  v41 = 1;
LABEL_87:

  return v41;
}

- (BOOL)applyPreviousChangeSessionUpdateWithExpectedLibraryVersion:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  id v15;
  id v16;
  id v17;

  v6 = a3;
  if (self->_dontDelayChangeSessionUpdate)
  {
    v7 = -[CPLEngineStore checkExpectedLibraryVersion:error:](self, "checkExpectedLibraryVersion:error:", v6, a4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1B5E08BF0]();
    -[CPLEngineStore platformObject](self, "platformObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storedChangeSessionUpdate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v17 = 0;
      v11 = -[CPLEngineStore _applyAndDiscardPendingUpdate:error:](self, "_applyAndDiscardPendingUpdate:error:", v10, &v17);
      v12 = v17;
      if (v11)
      {
        -[CPLEngineStore _unschedulePendingUpdateApply](self, "_unschedulePendingUpdateApply");
        v16 = v12;
        v7 = -[CPLEngineStore storeClientIsInSyncWithClientCacheWithError:](self, "storeClientIsInSyncWithClientCacheWithError:", &v16);
        v13 = v16;

        v12 = v13;
      }
      else
      {
        +[CPLResetTracker registerLikelyResetReason:](CPLResetTracker, "registerLikelyResetReason:", CFSTR("Failed to apply delayed update (%@) to client cache"), objc_opt_class());
        v7 = 0;
      }
    }
    else
    {
      v15 = 0;
      v7 = -[CPLEngineStore checkExpectedLibraryVersion:error:](self, "checkExpectedLibraryVersion:error:", v6, &v15);
      v12 = v15;
    }

    objc_autoreleasePoolPop(v8);
    if (a4 && !v7)
      *a4 = objc_retainAutorelease(v12);

  }
  return v7;
}

- (BOOL)forceApplyPendingChangeSessionUpdateWithError:(id *)a3
{
  BOOL v3;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  id v12;

  if (!self->_applyingChangeSessionUpdate)
  {
    v6 = (void *)MEMORY[0x1B5E08BF0]();
    -[CPLEngineStore platformObject](self, "platformObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storedChangeSessionUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v12 = 0;
      v9 = -[CPLEngineStore _applyAndDiscardPendingUpdate:error:](self, "_applyAndDiscardPendingUpdate:error:", v8, &v12);
      v10 = v12;
      if (!v9)
      {

        objc_autoreleasePoolPop(v6);
        if (a3)
        {
          v10 = objc_retainAutorelease(v10);
          v3 = 0;
          *a3 = v10;
        }
        else
        {
          v3 = 0;
        }
        goto LABEL_11;
      }
      -[CPLEngineStore _unschedulePendingUpdateApply](self, "_unschedulePendingUpdateApply");
    }
    else
    {
      v10 = 0;
    }

    objc_autoreleasePoolPop(v6);
    v3 = 1;
LABEL_11:

    return v3;
  }
  return 1;
}

- (BOOL)hasPendingChangeSessionUpdate
{
  void *v2;
  char v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasStoredChangeSessionUpdate");

  return v3;
}

- (BOOL)checkExpectedLibraryVersion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  -[CPLEngineStore libraryVersion](self, "libraryVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (a4 && (v8 & 1) == 0)
  {
    +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", CFSTR("Client cache has been reset during session"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)keepUnacknowledgedBatch:(id)a3
{
  objc_storeStrong((id *)&self->_unacknowledgedBatch, a3);
  -[CPLEngineStore _dropTransactionClientCacheView](self, "_dropTransactionClientCacheView");
  self->_discardUnacknowledgedBatchOnTransactionFail = 1;
}

- (void)dropUnacknowledgedBatch
{
  CPLChangeBatch *unacknowledgedBatch;

  unacknowledgedBatch = self->_unacknowledgedBatch;
  self->_unacknowledgedBatch = 0;

  -[CPLEngineStore _dropTransactionClientCacheView](self, "_dropTransactionClientCacheView");
  self->_discardUnacknowledgedBatchOnTransactionFail = 0;
}

- (id)unacknowledgedChangeWithLocalScopedIdentifier:(id)a3
{
  id v4;
  CPLChangeBatch *unacknowledgedBatch;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  unacknowledgedBatch = self->_unacknowledgedBatch;
  if (unacknowledgedBatch)
  {
    -[CPLChangeBatch recordWithScopedIdentifier:](unacknowledgedBatch, "recordWithScopedIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CPLEngineStore platformObject](self, "platformObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storedChangeSessionUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "pendingRecordChangeForClientCacheWithLocalScopedIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)hasUnacknowledgedChanges
{
  void *v4;
  char v5;

  if (-[CPLChangeBatch count](self->_unacknowledgedBatch, "count"))
    return 1;
  -[CPLEngineStore platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStoredChangeSessionUpdate");

  return v5;
}

- (id)_storedDisabledFeatures
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disabledFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)updateDisabledFeatures:(id)a3 didReset:(BOOL *)a4 error:(id *)a5
{
  id v8;
  NSArray *disabledFeatures;
  NSArray *v10;
  NSArray *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CPLEngineStore *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  CPLEngineStore *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  CPLEngineStore *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  NSObject *v52;
  char v53;
  void *v54;
  NSObject *v55;
  id v56;
  BOOL *v58;
  void *v59;
  NSArray **p_disabledFeatures;
  id *v61;
  id v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  CPLEngineStore *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  void *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v58 = a4;
  *a4 = 0;
  disabledFeatures = self->_disabledFeatures;
  *(_WORD *)&self->_hasUpdatedDisabledFeatures = 257;
  if (!disabledFeatures)
  {
    -[CPLEngineStore _storedDisabledFeatures](self, "_storedDisabledFeatures");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_disabledFeatures;
    self->_disabledFeatures = v10;

  }
  v66 = self;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v12 = v8;
  v59 = v12;
  v13 = v12;

  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  p_disabledFeatures = &self->_disabledFeatures;
  v16 = self->_disabledFeatures;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v84 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
        v22 = objc_msgSend(v14, "indexOfObject:", v21);
        if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v15, "addObject:", v21);
        else
          objc_msgSend(v14, "removeObjectAtIndex:", v22);
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v18);
  }

  if (!objc_msgSend(v15, "count") && !objc_msgSend(v14, "count"))
  {
    v36 = 0;
    v69 = 0;
    v67 = 0;
    v47 = v66;
    goto LABEL_72;
  }
  if (objc_msgSend(v15, "count"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v90 = v24;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEFAULT, "Features re-enabled: %@", buf, 0xCu);

      }
    }
    v61 = a5;
    v62 = v13;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v15;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    if (v25)
    {
      v26 = v25;
      v67 = 0;
      v68 = 0;
      v69 = 0;
      v64 = *(_QWORD *)v80;
      v27 = 1;
      v28 = v66;
LABEL_24:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v80 != v64)
          objc_enumerationMutation(obj);
        v30 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v29);
        v31 = (void *)MEMORY[0x1B5E08BF0]();
        +[CPLFeature featureWithName:](CPLFeature, "featureWithName:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          v78 = v68;
          v34 = objc_msgSend(v32, "enableFeatureInStore:error:", v28, &v78);
          v35 = v78;

          v68 = v35;
        }
        else
        {
          v34 = v27;
        }
        v27 = v34;
        if ((v34 & 1) == 0)
          goto LABEL_66;
        v28 = v66;
        if (v66->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate && !v69)
          v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ has been re-enabled"), v30);
        if (v66->_shouldTriggerResetSyncAfterDisabledFeaturesUpdate && !v67)
          v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ has been re-enabled"), v30);

        objc_autoreleasePoolPop(v31);
        if (v26 == ++v29)
        {
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
          if (v26)
            goto LABEL_24;
          goto LABEL_42;
        }
      }
    }
    v68 = 0;
    v69 = 0;
    v67 = 0;
    v27 = 1;
LABEL_42:

    a5 = v61;
    v13 = v62;
    v36 = v68;
  }
  else
  {
    v36 = 0;
    v69 = 0;
    v67 = 0;
    v27 = 1;
  }
  if (!objc_msgSend(v14, "count"))
    goto LABEL_69;
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v90 = v38;
      _os_log_impl(&dword_1B03C2000, v37, OS_LOG_TYPE_DEFAULT, "Features disabled: %@", buf, 0xCu);

    }
  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v14;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
  if (v39)
  {
    v40 = v39;
    v68 = v36;
    v61 = a5;
    v62 = v13;
    v65 = *(_QWORD *)v75;
    v41 = v66;
LABEL_50:
    v42 = 0;
    while (1)
    {
      if (*(_QWORD *)v75 != v65)
        objc_enumerationMutation(obj);
      v43 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v42);
      v31 = (void *)MEMORY[0x1B5E08BF0]();
      +[CPLFeature featureWithName:](CPLFeature, "featureWithName:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v44;
      if (v44)
      {
        v73 = v68;
        v45 = objc_msgSend(v44, "disableFeatureInStore:error:", v41, &v73);
        v46 = v73;

        v68 = v46;
      }
      else
      {
        v45 = v27;
      }
      v27 = v45;
      if ((v45 & 1) == 0)
        break;
      v41 = v66;
      if (v66->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate && !v69)
        v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ has been disabled"), v43);
      if (v66->_shouldTriggerResetSyncAfterDisabledFeaturesUpdate && !v67)
        v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ has been disabled"), v43);

      objc_autoreleasePoolPop(v31);
      if (v40 == ++v42)
      {
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
        if (v40)
          goto LABEL_50;
        goto LABEL_67;
      }
    }
LABEL_66:

    objc_autoreleasePoolPop(v31);
LABEL_67:
    a5 = v61;
    v13 = v62;
    v36 = v68;
  }

LABEL_69:
  v47 = v66;
  -[CPLEngineStore engineLibrary](v66, "engineLibrary");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "updateDisabledFeatures:", v13);

  if ((v27 & 1) == 0)
    goto LABEL_79;
LABEL_72:
  v49 = v36;
  -[CPLEngineStore platformObject](v47, "platformObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v36;
  v51 = objc_msgSend(v50, "storeDisabledFeatures:error:", v13, &v72);
  v36 = v72;

  if (!v51)
  {
LABEL_79:
    v53 = 0;
    v47->_isUpdatingDisabledFeatures = 0;
    goto LABEL_87;
  }
  objc_storeStrong((id *)p_disabledFeatures, v59);
  v47->_isUpdatingDisabledFeatures = 0;
  if (v47->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v69;
        _os_log_impl(&dword_1B03C2000, v52, OS_LOG_TYPE_ERROR, "Triggering complete reset sync now because %@", buf, 0xCu);
      }

    }
    *v58 = 1;
    v71 = v36;
    v47 = v66;
    v53 = -[CPLEngineStore resetCompleteSyncStateWithCause:error:](v66, "resetCompleteSyncStateWithCause:error:", v69, &v71);
    v54 = v71;
  }
  else
  {
    if (!v47->_shouldTriggerResetSyncAfterDisabledFeaturesUpdate)
    {
      *(_WORD *)&v47->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate = 0;
      v53 = 1;
      goto LABEL_90;
    }
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v69;
        _os_log_impl(&dword_1B03C2000, v55, OS_LOG_TYPE_ERROR, "Triggering complete reset sync now because %@", buf, 0xCu);
      }

    }
    *v58 = 1;
    v70 = v36;
    v47 = v66;
    v53 = -[CPLEngineStore resetLocalSyncStateWithCause:error:](v66, "resetLocalSyncStateWithCause:error:", v67, &v70);
    v54 = v70;
  }
  v56 = v54;

  v36 = v56;
LABEL_87:
  *(_WORD *)&v47->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate = 0;
  if (a5 && (v53 & 1) == 0)
  {
    v36 = objc_retainAutorelease(v36);
    v53 = 0;
    *a5 = v36;
  }
LABEL_90:

  return v53;
}

- (BOOL)isFeatureDisabled:(id)a3
{
  id v4;
  NSArray *disabledFeatures;
  NSArray *v6;
  NSArray *v7;
  BOOL v8;

  v4 = a3;
  disabledFeatures = self->_disabledFeatures;
  if (!disabledFeatures)
  {
    -[CPLEngineStore _storedDisabledFeatures](self, "_storedDisabledFeatures");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_disabledFeatures;
    self->_disabledFeatures = v6;

    disabledFeatures = self->_disabledFeatures;
  }
  v8 = -[NSArray containsObject:](disabledFeatures, "containsObject:", v4);

  return v8;
}

- (NSArray)disabledFeatures
{
  NSArray *disabledFeatures;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;

  disabledFeatures = self->_disabledFeatures;
  if (!disabledFeatures)
  {
    -[CPLEngineStore _storedDisabledFeatures](self, "_storedDisabledFeatures");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_disabledFeatures;
    self->_disabledFeatures = v4;

    disabledFeatures = self->_disabledFeatures;
  }
  if (disabledFeatures)
    v6 = disabledFeatures;
  else
    v6 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v6;
}

- (BOOL)shouldUpdateDisabledFeatures
{
  void *v2;
  char v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUpdateDisabledFeatures");

  return v3;
}

- (BOOL)setShouldUpdateDisabledFeaturesWithError:(id *)a3
{
  void *v5;
  int v6;

  -[CPLEngineStore platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setShouldUpdateDisabledFeaturesWithError:", a3);

  if (v6)
    self->_scheduleDisabledFeatureUpdateOnWriteSuccess = 1;
  return v6;
}

- (id)localResourceForCloudResource:(id)a3 recordClass:(Class *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;

  v6 = a3;
  objc_msgSend(v6, "itemScopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = 0;
    -[CPLEngineIDMapping localScopedIdentifierForCloudScopedIdentifier:isFinal:](self->_idMapping, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[CPLEngineStore transactionClientCacheView](self, "transactionClientCacheView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resourceOfType:forRecordWithScopedIdentifier:recordClass:error:", objc_msgSend(v6, "resourceType"), v8, a4, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)derivativesFilter
{
  void *v2;
  void *v3;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "derivativesFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)storeDerivativesFilter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeDerivativesFilter:error:", v6, a4);

  return (char)a4;
}

- (void)wipeStoreAtNextOpeningWithReason:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wipeStoreAtNextOpeningWithReason:completionBlock:", v7, v6);

}

- (void)predictSyncSessionValue:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *transactionNewPredictions;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Updating prediction for %@ to %@", (uint8_t *)&v12, 0x16u);
    }

  }
  transactionNewPredictions = self->_transactionNewPredictions;
  if (!transactionNewPredictions)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = self->_transactionNewPredictions;
    self->_transactionNewPredictions = v10;

    transactionNewPredictions = self->_transactionNewPredictions;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](transactionNewPredictions, "setObject:forKeyedSubscript:", v6, v7);

}

- (BOOL)syncSessionShouldRequestMoreTime
{
  void *v3;
  _BOOL4 v4;
  void *v6;

  -[CPLEngineScopeStorage primaryScope](self->_scopes, "primaryScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[CPLEngineScopeStorage valueForFlag:forScope:](self->_scopes, "valueForFlag:forScope:", 16, v3))
  {
    if (-[CPLEngineScopeStorage hasFinishedInitialDownloadForScope:](self->_scopes, "hasFinishedInitialDownloadForScope:", v3))
    {
      -[CPLEngineScopeStorage sharingScopeForScope:](self->_scopes, "sharingScopeForScope:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v4 = !-[CPLEngineScopeStorage hasFinishedInitialDownloadForScope:](self->_scopes, "hasFinishedInitialDownloadForScope:", v6);
      else
        LOBYTE(v4) = 0;

    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (CPLTransportScopeMapping)transactionTransportScopeMapping
{
  CPLTransportScopeMapping *transactionTransportScopeMapping;
  CPLTransportScopeMapping *v4;
  void *v5;
  void *v6;
  CPLTransportScopeMapping *v7;
  CPLTransportScopeMapping *v8;

  transactionTransportScopeMapping = self->_transactionTransportScopeMapping;
  if (!transactionTransportScopeMapping)
  {
    v4 = [CPLTransportScopeMapping alloc];
    -[CPLEngineStore engineLibrary](self, "engineLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CPLTransportScopeMapping initWithTranslator:](v4, "initWithTranslator:", v6);
    v8 = self->_transactionTransportScopeMapping;
    self->_transactionTransportScopeMapping = v7;

    transactionTransportScopeMapping = self->_transactionTransportScopeMapping;
  }
  return transactionTransportScopeMapping;
}

- (BOOL)_canHaveActivatedScope:(id)a3 libraryOptions:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = objc_msgSend(v8, "scopeType");
  if ((unint64_t)(v9 - 2) < 2)
  {
    self = (CPLEngineStore *)((a4 >> 2) & 1);
    if (!a5)
      goto LABEL_15;
  }
  else if ((unint64_t)(v9 - 4) >= 2)
  {
    if (v9 == 1)
    {
      objc_msgSend(v8, "scopeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
      {
        LOBYTE(self) = 1;
        goto LABEL_15;
      }
      self = (CPLEngineStore *)((a4 >> 1) & 1);
      if (!a5)
        goto LABEL_15;
    }
    else
    {
      LOBYTE(self) = 0;
      if (!a5)
        goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(v8, "scopeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = -[CPLEngineStore mainScopeSupportsSharingScopeWithIdentifier:](self, "mainScopeSupportsSharingScopeWithIdentifier:", v10);

    if (!a5)
      goto LABEL_15;
  }
  if ((self & 1) == 0)
  {
    objc_msgSend(v8, "scopeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", objc_msgSend(v8, "scopeType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLLibraryManager descriptionForLibraryOptions:](CPLLibraryManager, "descriptionForLibraryOptions:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 38, CFSTR("%@ (%@) can't be active with these library options (%@)"), v14, v15, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(self) = 0;
  }
LABEL_15:

  return (char)self;
}

- (BOOL)canActivateScope:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = -[CPLEngineStore libraryOptions](self, "libraryOptions");
  if (-[CPLEngineStore _canHaveActivatedScope:libraryOptions:error:](self, "_canHaveActivatedScope:libraryOptions:error:", v6, v7, a4))
  {
    v8 = +[CPLScopeChange shouldAutoActivateScopeWithType:](CPLScopeChange, "shouldAutoActivateScopeWithType:", objc_msgSend(v6, "scopeType"));
    v9 = !v8;
    if (a4 && v8)
    {
      objc_msgSend(v6, "scopeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", objc_msgSend(v6, "scopeType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLLibraryManager descriptionForLibraryOptions:](CPLLibraryManager, "descriptionForLibraryOptions:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 38, CFSTR("You are not allowed to activate %@ (%@) with these library options (%@)"), v10, v11, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)startVacuumWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLEngineStore platformObject](self, "platformObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startVacuumWithCompletionHandler:", v4);

}

- (void)stopVacuum
{
  id v2;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopVacuum");

}

- (void)emergencyClose
{
  id v2;

  -[CPLEngineStore platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emergencyClose");

}

- (void)markAsCorrupted
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Marking the store as corrupted manually", v5, 2u);
    }

  }
  -[CPLEngineStore platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markAsCorrupted");

}

- (void)_setSharingScopeIdentifier:(id)a3
{
  NSString *v5;
  NSString *v6;
  NSObject *v7;
  NSString *sharingScopeIdentifier;
  NSString *v9;
  void *v10;
  NSString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  NSString *v18;
  CPLEngineStore *v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (NSString *)a3;
  if (v5
    && !-[CPLEngineStore mainScopeSupportsSharingScopeWithIdentifier:](self, "mainScopeSupportsSharingScopeWithIdentifier:", v5))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v5;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Trying to bind sharing scope %@ with %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineStore mainScopeIdentifier](self, "mainScopeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 2179, CFSTR("Trying to bind sharing scope %@ with %@"), v5, v16);

    abort();
  }
  v6 = self->_sharingScopeIdentifier;
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Setting sharing scope identifier to %{public}@", buf, 0xCu);
    }

  }
  sharingScopeIdentifier = self->_sharingScopeIdentifier;
  self->_sharingScopeIdentifier = v5;
  v9 = v5;

  if (!self->_sharingScopeIdentifier)
  {
    -[CPLEngineStore engineLibrary](self, "engineLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:", 0);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__CPLEngineStore__setSharingScopeIdentifier___block_invoke;
  v17[3] = &unk_1E60DD6F8;
  v18 = v6;
  v19 = self;
  v11 = v6;
  -[CPLEngineStore _addCleanupBlock:](self, "_addCleanupBlock:", v17);

}

- (void)dropSharingScopeIdentifier:(id)a3
{
  unint64_t v4;
  void *v5;
  NSString *sharingScopeIdentifier;
  char v7;
  id v8;

  v4 = (unint64_t)a3;
  v5 = (void *)v4;
  sharingScopeIdentifier = self->_sharingScopeIdentifier;
  v8 = (id)v4;
  if (v4 && sharingScopeIdentifier)
  {
    v7 = objc_msgSend((id)v4, "isEqual:");
    v5 = v8;
    if ((v7 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (!(v4 | (unint64_t)sharingScopeIdentifier))
  {
LABEL_6:
    -[CPLEngineStore _setSharingScopeIdentifier:](self, "_setSharingScopeIdentifier:", 0);
    v5 = v8;
  }
LABEL_7:

}

- (NSString)sharingScopeIdentifier
{
  return self->_sharingScopeIdentifier;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CPLEngineStore engineLibrary](self, "engineLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_addCleanupBlock:(id)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[16];

  v10 = a3;
  -[CPLEngineStore _currentTransaction](self, "_currentTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Trying to add a clean-up block while not in a transaction", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 2222, CFSTR("Trying to add a clean-up block while not in a transaction"));

    abort();
  }
  v6 = v5;
  objc_msgSend(v5, "addCleanupBlock:", v10);

}

- (id)_currentTransaction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setTransactionOnCurrentThread:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v13;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to setup a transaction %@ on a thread which already has one: %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 2234, CFSTR("Trying to setup a transaction %@ on a thread which already has one: %@"), v13, v12);

    abort();
  }
  objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
  objc_msgSend(v13, "_transactionWillBeginOnThread:", v5);

}

- (void)_removeTransactionOnCurrentThread:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(v13, "_transactionDidFinish");
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v13)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to remove the wrong transaction on thread: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 2243, CFSTR("Trying to remove the wrong transaction on thread: %@"), v12);

    abort();
  }
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("com.apple.cloudphotolibrary.currenttransaction"));

}

- (BOOL)_canRead
{
  void *v2;
  char v3;

  -[CPLEngineStore _currentTransaction](self, "_currentTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canRead");

  return v3;
}

- (BOOL)_canWrite
{
  void *v2;
  char v3;

  -[CPLEngineStore _currentTransaction](self, "_currentTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canWrite");

  return v3;
}

- (void)assertCanWrite
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  CPLEngineStore *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[CPLEngineStore _canWrite](self, "_canWrite"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLEngineStore _currentTransaction](self, "_currentTransaction");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v12 = v5;
        v13 = 2112;
        v14 = self;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Trying to write on thread %p in %@ outside of a write transaction (current transaction is %@)", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineStore _currentTransaction](self, "_currentTransaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 2260, CFSTR("Trying to write on thread %p in %@ outside of a write transaction (current transaction is %@)"), v9, self, v10);

    abort();
  }
}

- (void)assertCanRead
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  CPLEngineStore *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[CPLEngineStore _canRead](self, "_canRead"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLEngineStore _currentTransaction](self, "_currentTransaction");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v12 = v5;
        v13 = 2112;
        v14 = self;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Trying to read on thread %p in %@ outside of a read transaction (current transaction is %@)", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineStore _currentTransaction](self, "_currentTransaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 2264, CFSTR("Trying to read on thread %p in %@ outside of a read transaction (current transaction is %@)"), v9, self, v10);

    abort();
  }
}

- (void)assertNoUnacknowledgedChanges
{
  void *v4;
  int v5;
  NSObject *v6;
  CPLChangeBatch *unacknowledgedBatch;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  CPLChangeBatch *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  CPLChangeBatch *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_unacknowledgedBatch)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unacknowledgedBatch = self->_unacknowledgedBatch;
        *(_DWORD *)buf = 138412290;
        v16 = unacknowledgedBatch;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Store still has an unacknowledged batch %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 2268, CFSTR("Store still has an unacknowledged batch %@"), self->_unacknowledgedBatch);
LABEL_14:

    abort();
  }
  -[CPLEngineStore platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStoredChangeSessionUpdate");

  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[CPLEngineStore platformObject](self, "platformObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "storedChangeSessionUpdate");
        v12 = (CPLChangeBatch *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Store still has an un-applied session update: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineStore platformObject](self, "platformObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "storedChangeSessionUpdate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 2269, CFSTR("Store still has an un-applied session update: %@"), v14);

    goto LABEL_14;
  }
}

- (id)componentName
{
  return CFSTR("store");
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60DD500;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = -[CPLEngineStore performReadTransactionWithBlock:](self, "performReadTransactionWithBlock:", v7);

}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CPLEngineStore_getStatusDictionaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60DD500;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = -[CPLEngineStore performReadTransactionWithBlock:](self, "performReadTransactionWithBlock:", v7);

}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[3];
  char v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__640;
  v25[4] = __Block_byref_object_dispose__641;
  v11 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__CPLEngineStore_testKey_value_completionHandler___block_invoke;
  v20[3] = &unk_1E60D8270;
  v20[4] = self;
  v12 = v8;
  v21 = v12;
  v13 = v9;
  v22 = v13;
  v23 = v27;
  v24 = v25;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __50__CPLEngineStore_testKey_value_completionHandler___block_invoke_3;
  v16[3] = &unk_1E60D77D0;
  v18 = v27;
  v14 = v10;
  v17 = v14;
  v19 = v25;
  v15 = -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:](self, "performWriteTransactionWithBlock:completionHandler:", v20, v16);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);

}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (CPLEngineLibrary)engineLibrary
{
  return (CPLEngineLibrary *)objc_loadWeakRetained((id *)&self->_engineLibrary);
}

- (CPLEnginePushRepository)pushRepository
{
  return self->_pushRepository;
}

- (CPLEngineScopeStorage)scopes
{
  return self->_scopes;
}

- (CPLEngineScopeCleanupTasks)cleanupTasks
{
  return self->_cleanupTasks;
}

- (CPLEngineChangePipe)pullQueue
{
  return self->_pullQueue;
}

- (CPLEngineRevertRecords)revertRecords
{
  return self->_revertRecords;
}

- (CPLEngineIDMapping)idMapping
{
  return self->_idMapping;
}

- (CPLEngineCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (CPLEngineTransientRepository)transientPullRepository
{
  return self->_transientPullRepository;
}

- (CPLEngineResourceStorage)resourceStorage
{
  return self->_resourceStorage;
}

- (CPLEngineResourceDownloadQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (CPLEngineOutgoingResources)outgoingResources
{
  return self->_outgoingResources;
}

- (CPLEngineRemappedRecords)remappedRecords
{
  return self->_remappedRecords;
}

- (CPLEngineQuarantinedRecords)quarantinedRecords
{
  return self->_quarantinedRecords;
}

- (CPLEngineStatusCenter)statusCenter
{
  return self->_statusCenter;
}

- (CPLEnginePendingRecordChecks)pendingRecordChecks
{
  return self->_pendingRecordChecks;
}

- (CPLEngineIgnoredRecords)ignoredRecords
{
  return self->_ignoredRecords;
}

- (CPLEngineRecordComputeStatePushQueue)recordComputeStatePushQueue
{
  return self->_recordComputeStatePushQueue;
}

- (CPLEngineDerivativesCache)derivativesCache
{
  return self->_derivativesCache;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivativesCache, 0);
  objc_storeStrong((id *)&self->_recordComputeStatePushQueue, 0);
  objc_storeStrong((id *)&self->_ignoredRecords, 0);
  objc_storeStrong((id *)&self->_pendingRecordChecks, 0);
  objc_storeStrong((id *)&self->_statusCenter, 0);
  objc_storeStrong((id *)&self->_quarantinedRecords, 0);
  objc_storeStrong((id *)&self->_remappedRecords, 0);
  objc_storeStrong((id *)&self->_outgoingResources, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_resourceStorage, 0);
  objc_storeStrong((id *)&self->_transientPullRepository, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_revertRecords, 0);
  objc_storeStrong((id *)&self->_pullQueue, 0);
  objc_storeStrong((id *)&self->_cleanupTasks, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_transactionTransportScopeMapping, 0);
  objc_storeStrong((id *)&self->_transactionClientCacheView, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_disabledFeatures, 0);
  objc_storeStrong((id *)&self->_shouldSyncScopeListQueue, 0);
  objc_storeStrong((id *)&self->_pendingUpdateQueue, 0);
  objc_storeStrong((id *)&self->_pendingUpdateTimer, 0);
  objc_storeStrong((id *)&self->_lastInvalidRecordsDate, 0);
  objc_storeStrong((id *)&self->_lastInvalidRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionNewPredictions, 0);
  objc_storeStrong((id *)&self->_unacknowledgedBatch, 0);
  objc_storeStrong((id *)&self->_pendingTracker, 0);
  objc_storeStrong((id *)&self->_resetEvents, 0);
  objc_storeStrong((id *)&self->_resetEventsURL, 0);
  objc_storeStrong((id *)&self->_batchedTransactions, 0);
  objc_storeStrong((id *)&self->_batchedTransactionsQueue, 0);
  objc_storeStrong((id *)&self->_sharingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_storages, 0);
}

void __50__CPLEngineStore_testKey_value_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  __int128 v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__CPLEngineStore_testKey_value_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D77A8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 56);
  objc_msgSend(a2, "do:", v5);

}

void __50__CPLEngineStore_testKey_value_completionHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = a1[4];
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    objc_msgSend(a2, "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, 1, v3, v4);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(a1[4], 0, 0, 0);
  }
}

uint64_t __50__CPLEngineStore_testKey_value_completionHandler___block_invoke_2(_QWORD *a1, _QWORD *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = *(id *)(a1[4] + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
LABEL_3:
    v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
      v12 = a1[5];
      v13 = a1[6];
      v14 = *(_QWORD *)(a1[7] + 8) + 24;
      v15 = *(_QWORD *)(a1[8] + 8);
      v16 = *(void **)(v15 + 40);
      v19 = v10;
      obj = v16;
      v17 = objc_msgSend(v11, "testKey:value:didHandle:result:error:", v12, v13, v14, &obj, &v19);
      objc_storeStrong((id *)(v15 + 40), obj);
      v7 = v19;

      if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
        break;
      ++v9;
      v10 = v7;
      if (v6 == v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v7 = 0;
    v17 = 1;
  }

  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    if (a2)
      *a2 = objc_retainAutorelease(v7);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

void __59__CPLEngineStore_getStatusDictionaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "name", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "statusDictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "_resetEventsJSON");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("resets"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  id WeakRetained;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  BOOL v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  id v71;
  void *v72;
  uint64_t v73;
  __CFString *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t j;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  _QWORD *v98;
  id v99;
  NSObject *v100;
  dispatch_block_t v101;
  uint64_t v102;
  __CFString *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  id obj;
  id obja;
  id v115;
  id v116;
  void *v117;
  id v118;
  _QWORD v119[5];
  id v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD block[6];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v109 = a2;
  objc_msgSend(v109, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v109, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "userIdentifier");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v105, "cplShareParticipantUserIdentifier");
    else
      objc_msgSend(v105, "description");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "libraryCreationDate");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storedChangeSessionUpdate");
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "storageForStatusInStore:", *(_QWORD *)(a1 + 32));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v110, "libraryVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR(" (pending: %@ for %@)"), v7, objc_opt_class());

    }
    else
    {
      v103 = &stru_1E60DF6B8;
    }
    v8 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v9 = v108;
    if (v108)
    {
      +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = v108;
    }
    else
    {
      v10 = CFSTR("unknown");
    }
    v11 = v9 == 0;
    objc_msgSend(*(id *)(a1 + 32), "libraryVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientCacheIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 32), "isClientInSyncWithClientCache");
    v15 = CFSTR("out of sync");
    if (v14)
      v15 = CFSTR("in sync");
    v16 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("creation date: %@\nlibrary version: %@%@\nclient cache id: %@ (%@)\nuser identifier: %@\n"), v10, v12, v103, v13, v15, v104);

    if (!v11)
    v17 = a1;
    if (objc_msgSend(*(id *)(a1 + 32), "shouldSyncScopeList"))
      objc_msgSend(v16, "appendString:", CFSTR("synchronizing scope list: enabled\n"));
    v18 = *(_QWORD **)(a1 + 32);
    v19 = (void *)v18[20];
    v117 = v16;
    if (!v19)
    {
      objc_msgSend(v18, "_storedDisabledFeatures");
      v20 = objc_claimAutoreleasedReturnValue();
      v17 = a1;
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 160);
      *(_QWORD *)(v21 + 160) = v20;

      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    }
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v17 + 32) + 160), "componentsJoinedByString:", CFSTR(", "));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendFormat:", CFSTR("disabled features: %@\n"), v23);

      v17 = a1;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v17 + 32) + 216), "primaryScope");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = a1;
      v26 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "valueForFlag:forScope:", 16, v24) ^ 1;
    }
    else
    {
      v26 = 0;
      v25 = a1;
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v25 + 32) + 200));
    objc_msgSend(WeakRetained, "libraryIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "hasPrefix:", CPLAppLibraryIdentifierPrefix))
    {
      v29 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
      objc_msgSend(v29, "libraryIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      CPLBundleIdentifierForLibraryIdentifier(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(*(id *)(a1 + 32), "mainScopeIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("Synchronizing App Library for %@ with %@"), v31, v33);

    }
    else
    {
      v35 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(*(id *)(a1 + 32), "mainScopeIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("Synchronizing %@ with %@"), v28, v31);
    }

    v36 = CFSTR("is NOT enabled");
    if (v26)
      v36 = CFSTR("is ENABLED");
    objc_msgSend(v117, "appendFormat:", CFSTR("\n%@ %@"), v34, v36);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
      objc_msgSend(v117, "appendFormat:", CFSTR("\nSharing is enabled using %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v117, "appendString:", CFSTR("\n"));

    objc_msgSend(*(id *)(a1 + 32), "_resetEventsDescriptions");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v107, "componentsJoinedByString:", CFSTR("\n\t"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "appendFormat:", CFSTR("\nresets:\n\t%@"), v37);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "BOOLForKey:", CFSTR("CPLShowPossibleResets"));

    if (v39)
    {
      +[CPLResetTracker currentReasonDescriptions](CPLResetTracker, "currentReasonDescriptions");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "count"))
      {
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n\t"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "appendFormat:", CFSTR("\nmight reset soon because:\n\t%@"), v41);

      }
    }
    v42 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v42 + 104))
    {
      v43 = objc_msgSend(*(id *)(v42 + 96), "count");
      if (v43 < 4)
      {
        +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allObjects");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR(", "));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "appendFormat:", CFSTR("\nlast invalid records pushed by client %@:\n\t%@"), v46, v48, v102);
      }
      else
      {
        v44 = v43;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allObjects");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "subarrayWithRange:", 0, 3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR(", "));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "appendFormat:", CFSTR("\nlast invalid records pushed by client %@:\n\t%@ + %lu more"), v47, v48, v44 - 3);
      }

      v42 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v42, "platformObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "status");
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      objc_msgSend(v106, "componentsSeparatedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n\t"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "appendFormat:", CFSTR("\n%@"), v51);

    }
    v118 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v142, 16);
    if (v52)
    {
      v115 = *(id *)v132;
      do
      {
        v53 = 0;
        do
        {
          if (*(id *)v132 != v115)
            objc_enumerationMutation(obj);
          v54 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v53);
          if (objc_msgSend(v54, "shouldIncludeInStatus"))
          {
            objc_msgSend(v54, "name");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "status");
            v56 = objc_claimAutoreleasedReturnValue();
            v57 = (void *)v56;
            if (v111 == v54)
            {
              v135 = 0;
              v136 = (uint64_t)&v135;
              v137 = 0x2020000000;
              LOBYTE(v138) = 0;
              v64 = *(_QWORD *)(a1 + 32);
              v65 = *(NSObject **)(v64 + 120);
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke_2;
              block[3] = &unk_1E60D64C8;
              block[4] = v64;
              block[5] = &v135;
              dispatch_sync(v65, block);
              objc_msgSend(v110, "statusDescription");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "queuedDate");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              if (v67)
              {
                if (*(_BYTE *)(v136 + 24))
                {
                  objc_msgSend(v67, "dateByAddingTimeInterval:", 30.0);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "timeIntervalSinceDate:", v68);
                  if (v70 >= 0.0)
                  {
                    v75 = objc_alloc(MEMORY[0x1E0CB3940]);
                    +[CPLDateFormatter stringForTimeIntervalAgo:now:](CPLDateFormatter, "stringForTimeIntervalAgo:now:", v69, v68);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = objc_msgSend(v75, "initWithFormat:", CFSTR("will auto-apply %@"), v72);
                  }
                  else
                  {
                    v71 = objc_alloc(MEMORY[0x1E0CB3940]);
                    +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v67, v68);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = objc_msgSend(v71, "initWithFormat:", CFSTR("%@ - auto-apply overdue"), v72);
                  }
                  v74 = (__CFString *)v73;

                }
                else
                {
                  +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v67, 0);
                  v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
              }
              else if (*(_BYTE *)(v136 + 24))
              {
                v74 = CFSTR("no queued date - waiting for auto-apply");
              }
              else
              {
                v74 = CFSTR("no queued date");
              }
              if (v57)
              {
                v76 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\nPending update: %@ - %@"), v57, v66, v74);

                v57 = (void *)v76;
              }
              else
              {
                v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Pending update: %@ - %@"), v66, v74);
              }

              _Block_object_dispose(&v135, 8);
            }
            else
            {
              v58 = *(_QWORD *)(a1 + 32);
              if (*(_QWORD *)(v58 + 72) && v54 == *(void **)(v58 + 232))
              {
                v59 = v56 == 0;
                v60 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "summaryDescription");
                v61 = objc_claimAutoreleasedReturnValue();
                v62 = (void *)v61;
                if (v59)
                {
                  v57 = (void *)objc_msgSend(v60, "initWithFormat:", CFSTR("Pending update: waiting for ack of %@"), v61);

                }
                else
                {
                  v63 = objc_msgSend(v60, "initWithFormat:", CFSTR("%@\nPending update: waiting for ack of %@"), v57, v61);

                  v57 = (void *)v63;
                }
              }
            }
            if (v57)
              objc_msgSend(v118, "setObject:forKey:", v57, v55);

          }
          ++v53;
        }
        while (v52 != v53);
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v142, 16);
        v52 = v77;
      }
      while (v77);
    }

    if (objc_msgSend(v118, "count"))
    {
      objc_msgSend(v117, "appendString:", CFSTR("\nstorages:"));
      objc_msgSend((id)objc_opt_class(), "storageNames");
      v116 = (id)objc_claimAutoreleasedReturnValue();
      v128 = 0u;
      v129 = 0u;
      v127 = 0u;
      v126 = 0u;
      v78 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v126, v141, 16);
      if (v78)
      {
        v79 = *(_QWORD *)v127;
        do
        {
          for (i = 0; i != v78; ++i)
          {
            if (*(_QWORD *)v127 != v79)
              objc_enumerationMutation(v116);
            v81 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * i);
            objc_msgSend(v118, "objectForKeyedSubscript:", v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v82;
            if (v82)
            {
              objc_msgSend(v82, "componentsSeparatedByString:", CFSTR("\n"));
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "componentsJoinedByString:", CFSTR("\n\t\t"));
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "appendFormat:", CFSTR("\n\t%@ = %@"), v81, v85);

              objc_msgSend(v118, "removeObjectForKey:", v81);
            }

          }
          v78 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v126, v141, 16);
        }
        while (v78);
      }
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      objc_msgSend(v118, "allKeys");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "sortedArrayUsingSelector:", sel_compare_);
      obja = (id)objc_claimAutoreleasedReturnValue();

      v87 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v122, v140, 16);
      if (v87)
      {
        v88 = *(_QWORD *)v123;
        do
        {
          for (j = 0; j != v87; ++j)
          {
            if (*(_QWORD *)v123 != v88)
              objc_enumerationMutation(obja);
            v90 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * j);
            objc_msgSend(v118, "objectForKey:", v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "componentsSeparatedByString:", CFSTR("\n"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "componentsJoinedByString:", CFSTR("\n\t\t"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "appendFormat:", CFSTR("\n\t%@ = %@"), v90, v93);

          }
          v87 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v122, v140, 16);
        }
        while (v87);
      }

    }
    v94 = *(_QWORD *)(a1 + 32);
    v95 = *(void **)(a1 + 40);
    v96 = *(void **)(v94 + 24);
    v97 = MEMORY[0x1E0C809B0];
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke_3;
    v119[3] = &unk_1E60D70C8;
    v119[4] = v94;
    v120 = v117;
    v121 = v95;
    v98 = v119;
    v135 = v97;
    v136 = 3221225472;
    v137 = (uint64_t)__cpl_dispatch_async_block_invoke_644;
    v138 = &unk_1E60D71F8;
    v139 = v98;
    v99 = v117;
    v100 = v96;
    v101 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v135);
    dispatch_async(v100, v101);

  }
}

uint64_t __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 112) != 0;
  return result;
}

uint64_t __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\nlow-priority transactions: %lu pending"), v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __45__CPLEngineStore__setSharingScopeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 138543362;
        v7 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Resetting sharing scope identifier to %{public}@", (uint8_t *)&v6, 0xCu);
      }

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 32));
  }

}

void __53__CPLEngineStore__reallyUnschedulePendingUpdateApply__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 112);
    *(_QWORD *)(v3 + 112) = 0;

  }
}

void __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  dispatch_source_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  NSObject *v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 112);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v2 + 120));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_2;
  v10[3] = &unk_1E60D6F88;
  v10[4] = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v11 = v5;
  dispatch_source_set_event_handler(v5, v10);
  v6 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)(a1 + 40));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_resume(v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 112);
  *(_QWORD *)(v7 + 112) = v5;
  v9 = v5;

}

void __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[14];
  if (v2 == *(void **)(a1 + 40))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_3;
    v4[3] = &unk_1E60DD810;
    v4[4] = v1;
    v5 = v2;
    v3 = (id)objc_msgSend(v1, "performWriteTransactionWithBlock:completionHandler:", v4, &__block_literal_global_236);

  }
}

void __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_4;
  block[3] = &unk_1E60DC8F0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 120);
  block[1] = 3221225472;
  block[4] = v4;
  v22 = v5;
  v23 = &v24;
  dispatch_sync(v6, block);
  if (*((_BYTE *)v25 + 24))
  {
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "platformObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "storedChangeSessionUpdate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = *(void **)(a1 + 32);
        v20 = 0;
        v12 = objc_msgSend(v11, "_applyPendingUpdate:error:", v10, &v20);
        v13 = v20;
        if (v12)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStoreOSLogDomain_2635();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v15 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v29 = v15;
              v16 = v15;
              _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Applied pending update %@ automatically because client did not do it", buf, 0xCu);

            }
          }
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            __CPLStoreOSLogDomain_2635();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v29 = v18;
              v30 = 2112;
              v31 = v13;
              v19 = v18;
              _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Failed to apply pending update %@ automatically because client did not do it: %@", buf, 0x16u);

            }
          }
          objc_msgSend(v3, "setError:", v13);
        }

      }
    }
  }

  _Block_object_dispose(&v24, 8);
}

void __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_4(_QWORD *a1)
{
  uint64_t v1;
  void *v2;

  v1 = a1[4];
  v2 = *(void **)(v1 + 112);
  if (v2 == (void *)a1[5])
  {
    *(_QWORD *)(v1 + 112) = 0;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

uint64_t __37__CPLEngineStore_shouldSyncScopeList__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 172);
  return result;
}

uint64_t __45__CPLEngineStore__updateShouldSyncScopeList___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 172))
  {
    if (*(_BYTE *)(result + 40))
      *(_BYTE *)(v1 + 152) = 1;
  }
  return result;
}

uint64_t __55__CPLEngineStore_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeAndDeactivate:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60DC110;
  v7 = *(_BYTE *)(a1 + 56);
  v5[4] = v3;
  v6 = v2;
  objc_msgSend(v3, "_performTransaction:withBlock:", v6, v5);
  objc_msgSend(*(id *)(a1 + 32), "_unschedulePendingUpdateApply");
  objc_msgSend(*(id *)(a1 + 32), "_commitWriteTransaction:commitError:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "_releaseDirty");

}

uint64_t __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = CFSTR("Deactivating");
      if (!*(_BYTE *)(a1 + 48))
        v3 = CFSTR("Closing");
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ all storages: %@", buf, 0x16u);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke_226;
  v7[3] = &unk_1E60D7760;
  v8 = *(_BYTE *)(a1 + 48);
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v5, "do:", v7);
}

uint64_t __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke_226(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Marking database as deactivated", buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "markDatabaseAsDeactivatedWithError:", a2);

  }
  else
  {
    v6 = 1;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v6 &= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "closeWithError:", a2, (_QWORD)v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "closeWithError:", a2);

  return v13 & v6;
}

uint64_t __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

uint64_t __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_releaseDirty");
}

uint64_t __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__CPLEngineStore_performBatchedWriteTransactionBarrier__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyPerformBatchedTransactionsLocked");
}

void __76__CPLEngineStore_performBatchedWriteTransactionWithBlock_completionHandler___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  _CPLEngineStoreBatchedTransaction *v3;

  v3 = objc_alloc_init(_CPLEngineStoreBatchedTransaction);
  -[_CPLEngineStoreBatchedTransaction setBlock:](v3, "setBlock:", a1[5]);
  -[_CPLEngineStoreBatchedTransaction setCompletionHandler:](v3, "setCompletionHandler:", a1[6]);
  objc_msgSend(*(id *)(a1[4] + 32), "addObject:", v3);
  v2 = (_BYTE *)a1[4];
  if (!v2[40])
    objc_msgSend(v2, "_scheduleBatchedTransactionsLocked");

}

void __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double Current;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__640;
    v15 = __Block_byref_object_dispose__641;
    v16 = 0;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 24);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_2;
    v10[3] = &unk_1E60D64C8;
    v10[4] = v6;
    v10[5] = &v11;
    dispatch_sync(v7, v10);
    if (!v12[5])
      break;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:");
    objc_msgSend((id)v12[5], "block");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v3);

    objc_msgSend(v3, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 || CFAbsoluteTimeGetCurrent() - Current > 2.0)
      break;
    _Block_object_dispose(&v11, 8);

  }
  _Block_object_dispose(&v11, 8);

}

void __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  NSObject *v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "completionHandler");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v10)[2](v10, v3);

        objc_msgSend(v9, "_releaseDirty");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

  v11 = *(_QWORD *)(a1 + 32);
  v12 = MEMORY[0x1E0C809B0];
  v13 = *(void **)(v11 + 24);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_4;
  v17[3] = &unk_1E60D65B8;
  v17[4] = v11;
  v14 = v17;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_644;
  block[3] = &unk_1E60D71F8;
  v23 = v14;
  v15 = v13;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v16);

}

uint64_t __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 32), "count");
    if (result)
      return objc_msgSend(*(id *)(v2 + 32), "_scheduleBatchedTransactionsLocked");
  }
  return result;
}

void __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectAtIndex:", 0);
}

void __52__CPLEngineStore__scheduleBatchedTransactionsLocked__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E08BF0]();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_reallyPerformBatchedTransactionsLocked");
  objc_autoreleasePoolPop(v2);
}

void __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60DB768;
  v7 = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9 = v4;
  v10 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "_performTransaction:withBlock:", v7, v6);

}

void __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Finished writing %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_commitWriteTransaction:commitError:", *(_QWORD *)(a1 + 32), v3);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 200));
  objc_msgSend(WeakRetained, "setHasChangesToProcess:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_releaseDirty");

}

uint64_t __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = a1[4];
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Performing %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();
  result = objc_msgSend(*(id *)(a1[5] + 216), "hasStagedSyncAnchors");
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

uint64_t __44__CPLEngineStore_writeTransactionDidSucceed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 172) = 1;
  return result;
}

void __50__CPLEngineStore_performReadTransactionWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __50__CPLEngineStore_performReadTransactionWithBlock___block_invoke_2;
  v7 = &unk_1E60D6708;
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_performTransaction:withBlock:", v8, &v4);
  objc_msgSend(*(id *)(a1 + 40), "_releaseDirty", v4, v5, v6, v7);

}

uint64_t __50__CPLEngineStore_performReadTransactionWithBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Performing %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __44__CPLEngineStore_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __44__CPLEngineStore_openWithCompletionHandler___block_invoke_2;
  v11 = &unk_1E60D6F88;
  v12 = v3;
  v13 = v2;
  objc_msgSend(v3, "_performTransaction:withBlock:", v13, &v8);
  objc_msgSend(*(id *)(a1 + 40), "error", v8, v9, v10, v11, v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setState:", 2 * (v4 == 0));
  objc_msgSend(*(id *)(a1 + 32), "_commitWriteTransaction:commitError:", *(_QWORD *)(a1 + 40), v4);
  objc_msgSend(*(id *)(a1 + 32), "_resetEventsDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n\t"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Last reset events:\n\t%@", buf, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "_releaseDirty");

}

uint64_t __44__CPLEngineStore_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStoreOSLogDomain_2635();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Opening all storages: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "discardCache");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__CPLEngineStore_openWithCompletionHandler___block_invoke_175;
  v6[3] = &unk_1E60DD6D0;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v4, "do:", v6);
}

uint64_t __44__CPLEngineStore_openWithCompletionHandler___block_invoke_175(uint64_t a1, _QWORD *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  _BOOL4 v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  void *v36;
  NSObject *v37;
  char v38;
  NSObject *v39;
  char v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  id v54;
  void *v55;
  char v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  char v63;
  int v64;
  void *v65;
  int v66;
  NSObject *v67;
  void *v68;
  void *v69;
  char v70;
  NSObject *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  id v77;
  uint64_t v78;
  NSObject *v79;
  id v80;
  id v81;
  uint64_t v82;
  char v83;
  void *v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  void *v89;
  char v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  NSObject *v100;
  uint64_t v101;
  void *v102;
  NSObject *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  NSObject *v110;
  NSObject *v111;
  id v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  id obj;
  uint64_t v120;
  uint64_t v121;
  _QWORD v123[5];
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  id v129;
  id v130;
  id v131;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint8_t buf[4];
  id v142;
  __int16 v143;
  double v144;
  __int16 v145;
  uint64_t v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "openWithError:", a2);

  if (!v4)
    goto LABEL_31;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 172) = objc_msgSend(v5, "_shouldSyncScopeListWithOptions:", objc_msgSend(v6, "libraryOptions"));

  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 172))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 172) = objc_msgSend(v8, "BOOLForKey:", CFSTR("CPLForceScopeListSync"));

    v7 = *(_QWORD *)(a1 + 32);
  }
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v9 = *(id *)(v7 + 8);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v138;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v138 != v11)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * i), "openWithError:", a2))
        {

LABEL_30:
          v4 = 0;
          goto LABEL_31;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "_loadResetEvents");
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v13, "executePostOpenWithError:", a2);

  if (!v4)
    goto LABEL_31;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "storedExtractedBatch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 208);
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "batch");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v142 = v17;
        v143 = 2114;
        v144 = *(double *)&v18;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Reinjecting %@ in %{public}@", buf, 0x16u);

      }
    }
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    objc_msgSend(v14, "batch");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v133, v148, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v134;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v134 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * j), "_setShouldNotTrustCloudCache:", 1);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v133, v148, 16);
      }
      while (v20);
    }

    objc_msgSend(v14, "clientCacheIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    if (v24)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v39, OS_LOG_TYPE_ERROR, "Found extracted batch but no client cache identifier - triggering a reset sync", buf, 2u);
        }

      }
      +[CPLResetTracker currentTracker](CPLResetTracker, "currentTracker");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "likelyResetReasonWithImmediateReason:", CFSTR("found extracted batch at launch without a client cache identifier"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(*(id *)(a1 + 32), "resetLocalSyncStateWithCause:error:", v26, a2);
      +[CPLResetTracker discardTracker:](CPLResetTracker, "discardTracker:", v27);
    }
    else
    {
      v131 = 0;
      v132 = 0;
      v25 = objc_msgSend(v15, "reinjectExtractedBatch:overwrittenRecordIdentifiers:error:", v14, &v132, &v131);
      v26 = v132;
      v27 = v131;
      if (v25)
      {
        v28 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
        v130 = v27;
        v29 = objc_msgSend(v28, "storeExtractedBatch:error:", 0, &v130);
        v30 = v130;

        if ((v29 & 1) != 0)
        {

          goto LABEL_61;
        }
        v27 = v30;
      }
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "batch");
          v42 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v142 = v42;
          v143 = 2112;
          v144 = *(double *)&v27;
          _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_ERROR, "Re-injecting %@ failed: %@", buf, 0x16u);

        }
      }
      +[CPLResetTracker currentTracker](CPLResetTracker, "currentTracker");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "likelyResetReasonWithImmediateReason:", CFSTR("failed to re-inject extracted batch at launch"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(*(id *)(a1 + 32), "resetLocalSyncStateWithCause:error:", v44, a2);
      +[CPLResetTracker discardTracker:](CPLResetTracker, "discardTracker:", v43);

    }
    if ((v40 & 1) == 0)
      goto LABEL_30;
  }
LABEL_61:
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "storedChangeSessionUpdate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v46, "queuedDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "timeIntervalSinceNow");
    if (v47 && v48 >= -30.0)
    {
      v49 = v48 + 30.0;
      if (v49 <= 30.0)
        v50 = v49;
      else
        v50 = 30.0;
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = (id)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v142 = v52;
          v143 = 2048;
          v144 = v50;
          _os_log_impl(&dword_1B03C2000, v51, OS_LOG_TYPE_DEFAULT, "Store has some %@ to apply, will apply it in %.1fs", buf, 0x16u);

        }
      }
      *(double *)(*(_QWORD *)(a1 + 32) + 128) = v50;
      objc_msgSend(*(id *)(a1 + 32), "_schedulePendingUpdateApply");
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = (id)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v142 = v54;
          _os_log_impl(&dword_1B03C2000, v53, OS_LOG_TYPE_DEFAULT, "Store has some %@ to apply, applying now", buf, 0xCu);

        }
      }
      v55 = *(void **)(a1 + 32);
      v129 = 0;
      v56 = objc_msgSend(v55, "_applyPendingUpdate:error:", v46, &v129);
      v57 = v129;
      v58 = v57;
      if ((v56 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStoreOSLogDomain_2635();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v142 = v58;
            _os_log_impl(&dword_1B03C2000, v111, OS_LOG_TYPE_ERROR, "Failed to apply pending update, will trigger a reset sync: %@", buf, 0xCu);
          }

        }
        v112 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v58, "domain");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend(v112, "initWithFormat:", CFSTR("failed to apply pending update to store (%@/%ld)"), v113, objc_msgSend(v58, "code"));

        +[CPLResetTracker currentTracker](CPLResetTracker, "currentTracker");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "likelyResetReasonWithImmediateReason:", v114);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v114) = objc_msgSend(*(id *)(a1 + 32), "resetLocalSyncStateWithCause:error:", v116, a2);
        +[CPLResetTracker discardTracker:](CPLResetTracker, "discardTracker:", v115);

        if ((v114 & 1) == 0)
          goto LABEL_30;
        goto LABEL_79;
      }

    }
  }
LABEL_79:
  v118 = objc_msgSend(*(id *)(a1 + 32), "libraryOptions");
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "transport");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "enumeratorForScopesIncludeInactive:", 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v147, 16);
  if (!v121)
    goto LABEL_179;
  v120 = *(_QWORD *)v126;
  do
  {
    v60 = 0;
    do
    {
      if (*(_QWORD *)v126 != v120)
        objc_enumerationMutation(obj);
      v61 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v60);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "flagsForScope:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "valueForFlag:", 16);
      v64 = objc_msgSend(v62, "valueForFlag:", 4);
      if ((v63 & 1) == 0)
      {
        if (!v64 || (objc_msgSend(v62, "valueForFlag:", 0x10000) & 1) != 0)
        {
          v69 = *(void **)(a1 + 32);
          v124 = 0;
          v70 = objc_msgSend(v69, "_canHaveActivatedScope:libraryOptions:error:", v61, v118, &v124);
          v71 = v124;
          if ((v70 & 1) == 0)
          {
            if (!_CPLSilentLogging)
            {
              __CPLStoreOSLogDomain_2635();
              v103 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                -[NSObject localizedDescription](v71, "localizedDescription");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v142 = v61;
                v143 = 2112;
                v144 = *(double *)&v104;
                _os_log_impl(&dword_1B03C2000, v103, OS_LOG_TYPE_ERROR, "Opening store with incorrectly activated %@ (%@)", buf, 0x16u);

              }
            }
            v105 = objc_alloc(MEMORY[0x1E0CB3940]);
            +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", objc_msgSend(v61, "scopeType"));
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = (void *)objc_msgSend(v105, "initWithFormat:", CFSTR("Found scope with type %@ active at opening time"), v106);

            v107 = *(void **)(a1 + 32);
            v123[0] = MEMORY[0x1E0C809B0];
            v123[1] = 3221225472;
            v123[2] = __44__CPLEngineStore_openWithCompletionHandler___block_invoke_194;
            v123[3] = &unk_1E60D65B8;
            v123[4] = v107;
            objc_msgSend(v107, "wipeStoreAtNextOpeningWithReason:completionBlock:", v75, v123);
            if (a2)
              *a2 = objc_retainAutorelease(v71);
LABEL_189:

LABEL_190:
LABEL_191:

            goto LABEL_30;
          }
          v72 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "supportedFeatureVersionInLastSyncForScope:", v61);
          if (v72 > 0x13)
          {

            goto LABEL_117;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "scopeChangeForScope:", v61);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "libraryInfo");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "featureVersionHistory");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (v75)
          {
            if (v72 < objc_msgSend(v75, "currentFeatureVersion"))
            {
              if (!_CPLSilentLogging)
              {
                __CPLStoreOSLogDomain_2635();
                v76 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v61, "scopeIdentifier");
                  v77 = (id)objc_claimAutoreleasedReturnValue();
                  v78 = objc_msgSend(v75, "currentFeatureVersion");
                  *(_DWORD *)buf = 138543874;
                  v142 = v77;
                  v143 = 2048;
                  v144 = *(double *)&v72;
                  v145 = 2048;
                  v146 = v78;
                  _os_log_impl(&dword_1B03C2000, v76, OS_LOG_TYPE_DEFAULT, "Last supported feature version in sync for %{public}@ is %lu while server feature version was at least %lu - will have to catch up some changes though", buf, 0x20u);

                }
                goto LABEL_114;
              }
LABEL_115:
              if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setScopeNeedsUpdateFromTransport:error:", v61, a2))goto LABEL_189;
              v83 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setScopeHasChangesToPullFromTransport:error:", v61, a2);

              if ((v83 & 1) == 0)
                goto LABEL_191;
LABEL_117:
              if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
                || (objc_msgSend(v61, "scopeType") & 0xFFFFFFFFFFFFFFFELL) != 4)
              {
                if ((v63 & 1) != 0)
                  goto LABEL_152;
              }
              else
              {
                if ((overridesFeatureFlag != 1 || isFeatureEnabled)
                  && (v84 = *(void **)(a1 + 32),
                      objc_msgSend(v61, "scopeIdentifier"),
                      v85 = (void *)objc_claimAutoreleasedReturnValue(),
                      LODWORD(v84) = objc_msgSend(v84, "mainScopeSupportsSharingScopeWithIdentifier:", v85),
                      v85,
                      (_DWORD)v84))
                {
                  if ((v63 & 1) != 0)
                  {
                    if (CPLAllowsInactiveSharedLibraryScope_onceToken != -1)
                      dispatch_once(&CPLAllowsInactiveSharedLibraryScope_onceToken, &__block_literal_global_1_21468);
                    if (CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope)
                    {
                      if (_CPLSilentLogging)
                        goto LABEL_152;
                      __CPLStoreOSLogDomain_2635();
                      v71 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                        goto LABEL_145;
                      goto LABEL_151;
                    }
                    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "primaryScope");
                    v71 = objc_claimAutoreleasedReturnValue();
                    if (!v71
                      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "valueForFlag:forScope:", 16, v71) & 1) != 0)
                    {
                      goto LABEL_151;
                    }
                    if (!_CPLSilentLogging)
                    {
                      __CPLStoreOSLogDomain_2635();
                      v98 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v142 = v61;
                        _os_log_impl(&dword_1B03C2000, v98, OS_LOG_TYPE_DEFAULT, "Found inactive shared library scope at opening time: %@ - automatically activating it", buf, 0xCu);
                      }

                    }
                    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setValue:forFlag:forScope:error:", 0, 16, v61, a2))goto LABEL_190;
                    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "primaryScope");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v99)
                      goto LABEL_151;
                    if (!_CPLSilentLogging)
                    {
                      __CPLStoreOSLogDomain_2635();
                      v100 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v142 = v99;
                        _os_log_impl(&dword_1B03C2000, v100, OS_LOG_TYPE_DEFAULT, "Resetting sync anchor for %@", buf, 0xCu);
                      }

                    }
                    v90 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "resetSyncAnchorForScope:error:", v99, a2);

                    goto LABEL_140;
                  }
                  if (!_CPLSilentLogging)
                  {
                    __CPLStoreOSLogDomain_2635();
                    v96 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v142 = v61;
                      _os_log_impl(&dword_1B03C2000, v96, OS_LOG_TYPE_DEFAULT, "Setting sharing scope to %@ at opening", buf, 0xCu);
                    }

                  }
                  v97 = *(void **)(a1 + 32);
                  objc_msgSend(v61, "scopeIdentifier");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v97, "_setSharingScopeIdentifier:", v94);
                }
                else
                {
                  if ((v63 & 1) != 0)
                  {
                    if (_CPLSilentLogging)
                      goto LABEL_152;
                    __CPLStoreOSLogDomain_2635();
                    v71 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                    {
LABEL_145:
                      *(_DWORD *)buf = 138412290;
                      v142 = v61;
                      _os_log_impl(&dword_1B03C2000, v71, OS_LOG_TYPE_DEFAULT, "Found inactive shared library scope at opening time: %@", buf, 0xCu);
                    }
LABEL_151:

                    goto LABEL_152;
                  }
                  if (!_CPLSilentLogging)
                  {
                    __CPLStoreOSLogDomain_2635();
                    v93 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v142 = v61;
                      _os_log_impl(&dword_1B03C2000, v93, OS_LOG_TYPE_ERROR, "Found an active shared library scope at opening time: %@ - this will need to be cleaned-up first", buf, 0xCu);
                    }

                  }
                  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "syncManager");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "addBrokenScope:", v61);

                }
              }
              v86 = objc_msgSend(v61, "scopeType");
              if ((unint64_t)(v86 - 1) < 3
                || (unint64_t)(v86 - 4) <= 1 && (overridesFeatureFlag != 1 || isFeatureEnabled))
              {
                goto LABEL_152;
              }
              if (!objc_msgSend(v62, "valueForFlag:", 4))
              {
                if (!_CPLSilentLogging)
                {
                  __CPLStoreOSLogDomain_2635();
                  v91 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v142 = v61;
                    _os_log_impl(&dword_1B03C2000, v91, OS_LOG_TYPE_ERROR, "Found broken active scope at opening time: %@ - this will need to be cleaned-up first", buf, 0xCu);
                  }

                }
                objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
                v71 = objc_claimAutoreleasedReturnValue();
                -[NSObject syncManager](v71, "syncManager");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "addBrokenScope:", v61);

                goto LABEL_151;
              }
              if (!_CPLSilentLogging)
              {
                __CPLStoreOSLogDomain_2635();
                v87 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v142 = v61;
                  _os_log_impl(&dword_1B03C2000, v87, OS_LOG_TYPE_ERROR, "Found broken active scope at opening time: %@ - the scope is already known to have ben deleted. Deleting the entry immediately", buf, 0xCu);
                }

              }
LABEL_139:
              v88 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
              objc_msgSend(v61, "scopeIdentifier");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = objc_msgSend(v88, "deleteScopeWithIdentifier:error:", v89, a2);

LABEL_140:
              if ((v90 & 1) == 0)
                goto LABEL_191;
              goto LABEL_152;
            }
            if (_CPLSilentLogging)
              goto LABEL_115;
            __CPLStoreOSLogDomain_2635();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v61, "scopeIdentifier");
              v81 = (id)objc_claimAutoreleasedReturnValue();
              v82 = objc_msgSend(v75, "currentFeatureVersion");
              *(_DWORD *)buf = 138543874;
              v142 = v81;
              v143 = 2048;
              v144 = *(double *)&v72;
              v145 = 2048;
              v146 = v82;
              _os_log_impl(&dword_1B03C2000, v76, OS_LOG_TYPE_DEFAULT, "Last supported feature version in sync for %{public}@ is %lu while server feature version was likely %lu - might have to catch up some changes though", buf, 0x20u);

            }
          }
          else
          {
            if (_CPLSilentLogging)
              goto LABEL_115;
            __CPLStoreOSLogDomain_2635();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v61, "scopeIdentifier");
              v80 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v142 = v80;
              v143 = 2048;
              v144 = *(double *)&v72;
              _os_log_impl(&dword_1B03C2000, v76, OS_LOG_TYPE_DEFAULT, "Last supported feature version in sync for %{public}@ is %lu - will have to confirm server feature version and maybe catch up some changes though", buf, 0x16u);

            }
          }
LABEL_114:

          goto LABEL_115;
        }
        if (!_CPLSilentLogging)
        {
          __CPLStoreOSLogDomain_2635();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v142 = v61;
            _os_log_impl(&dword_1B03C2000, v79, OS_LOG_TYPE_ERROR, "Found remaining deleted scope %@ that should have been removed already", buf, 0xCu);
          }

        }
        goto LABEL_139;
      }
      if ((v64 & 1) != 0)
        goto LABEL_117;
      objc_msgSend(v61, "scopeIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v117, "shouldIgnoreScopeWithIdentifier:", v65);

      if (!v66)
        goto LABEL_117;
      if (!_CPLSilentLogging)
      {
        __CPLStoreOSLogDomain_2635();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v61, "scopeIdentifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v142 = v68;
          _os_log_impl(&dword_1B03C2000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ should be ignored by this engine - removing it", buf, 0xCu);

        }
      }
      objc_msgSend(v62, "setValue:forFlag:", 1, 4);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "updateFlags:forScope:error:", v62, v61, a2) & 1) == 0)
        goto LABEL_191;
LABEL_152:

      ++v60;
    }
    while (v121 != v60);
    v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v147, 16);
    v121 = v101;
  }
  while (v101);
LABEL_179:

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "sizeOfResourcesToUpload")
    || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "isEmpty"))
  {
    goto LABEL_193;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "storedExtractedBatch");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
  {

    goto LABEL_193;
  }
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v108, "hasStoredChangeSessionUpdate");

  if ((v109 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v110, OS_LOG_TYPE_ERROR, "Resources storage has orphaned resources - clearing", buf, 2u);
      }

    }
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "resetWithError:", a2);
  }
  else
  {
LABEL_193:
    v4 = 1;
  }
LABEL_31:
  if (!CPLIsInTestReadonlyMode())
  {
    if (!v4)
      return 0;
    goto LABEL_38;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "primaryScope");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
    goto LABEL_35;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "disabledDateForScope:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 31536000.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_CPLSilentLogging)
    {
      __CPLStoreOSLogDomain_2635();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v37, OS_LOG_TYPE_DEFAULT, "Simulating Exit mode for Test Read-only mode", buf, 2u);
      }

    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setDisabledDate:forScope:error:", v35, v31, a2))
    {

      v33 = 0;
      goto LABEL_39;
    }
    v38 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setDeleteDate:forScope:error:", v36, v31, a2);

    if ((v38 & 1) == 0)
      return 0;
LABEL_38:
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "performPostUpgradeMigrationsWithError:", a2);
LABEL_39:

    return v33;
  }

LABEL_35:
  if ((v4 & 1) != 0)
    goto LABEL_38;
  return 0;
}

void __44__CPLEngineStore_openWithCompletionHandler___block_invoke_194(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CPLLibraryMustBeWipedNotificationName"), v2);

}

uint64_t __55__CPLEngineStore__performBarrierTransaction_withBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_finishTransaction");
  return objc_msgSend(*(id *)(a1 + 40), "endTransaction");
}

void __35__CPLEngineStore__handleException___block_invoke(uint64_t a1)
{
  objc_exception_throw(objc_retainAutorelease(*(id *)(a1 + 32)));
}

void __34__CPLEngineStore__resetEventsJSON__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

+ (BOOL)dontBatchTransactions
{
  return _dontBatchTransactions;
}

+ (void)setDontBatchTransactions:(BOOL)a3
{
  _dontBatchTransactions = a3;
}

+ (NSArray)storageNames
{
  if (storageNames_onceToken != -1)
    dispatch_once(&storageNames_onceToken, &__block_literal_global_700);
  return (NSArray *)(id)storageNames_storageNames;
}

+ (id)stateDescriptionForState:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("UNKNOWN");
  else
    return off_1E60D7830[a3];
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

void __30__CPLEngineStore_storageNames__block_invoke()
{
  void *v0;

  v0 = (void *)storageNames_storageNames;
  storageNames_storageNames = (uint64_t)&unk_1E611B6B8;

}

- (id)newClientCacheViewUsesPushRepository:(BOOL *)a3
{
  CPLClientCacheBaseView *v5;
  void *v6;
  void *v7;
  CPLChangeBatchChangeStorage *v8;
  void *v9;
  CPLChangeBatchChangeStorage *v10;
  CPLChangedRecordStorageView *v11;
  CPLPushRepositoryStorage *v12;
  CPLChangedRecordStorageView *v13;
  CPLUnacknowledgedChangeStorage *v14;
  CPLChangedRecordStorageView *v15;

  v5 = -[CPLClientCacheBaseView initWithStore:]([CPLClientCacheBaseView alloc], "initWithStore:", self);
  -[CPLEngineStore pushRepository](self, "pushRepository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storedExtractedBatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = [CPLChangeBatchChangeStorage alloc];
    objc_msgSend(v7, "batch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CPLChangeBatchChangeStorage initWithBatch:name:](v8, "initWithBatch:name:", v9, CFSTR("extractedBatch"));

    v11 = -[CPLChangedRecordStorageView initWithChangeStorage:overStorageView:]([CPLChangedRecordStorageView alloc], "initWithChangeStorage:overStorageView:", v10, v5);
    v5 = (CPLClientCacheBaseView *)v11;
  }
  if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
  {
    if (a3)
      *a3 = 0;
  }
  else
  {
    v12 = -[CPLPushRepositoryStorage initWithPushRepository:]([CPLPushRepositoryStorage alloc], "initWithPushRepository:", v6);
    v13 = -[CPLChangedRecordStorageView initWithChangeStorage:overStorageView:]([CPLChangedRecordStorageView alloc], "initWithChangeStorage:overStorageView:", v12, v5);

    if (a3)
      *a3 = 1;

    v5 = (CPLClientCacheBaseView *)v13;
  }
  if (-[CPLEngineStore hasUnacknowledgedChanges](self, "hasUnacknowledgedChanges"))
  {
    v14 = -[CPLUnacknowledgedChangeStorage initWithStore:]([CPLUnacknowledgedChangeStorage alloc], "initWithStore:", self);
    v15 = -[CPLChangedRecordStorageView initWithChangeStorage:overStorageView:]([CPLChangedRecordStorageView alloc], "initWithChangeStorage:overStorageView:", v14, v5);

    v5 = (CPLClientCacheBaseView *)v15;
  }

  return v5;
}

@end
