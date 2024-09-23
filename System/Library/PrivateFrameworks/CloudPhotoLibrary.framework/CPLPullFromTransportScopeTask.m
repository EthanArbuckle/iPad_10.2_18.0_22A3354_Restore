@implementation CPLPullFromTransportScopeTask

- (CPLPullFromTransportScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12;
  CPLPullFromTransportScopeTask *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  CPLEngineTransport *transport;
  dispatch_queue_t v19;
  OS_dispatch_queue *notifyQueue;
  objc_super v22;

  v12 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPLPullFromTransportScopeTask;
  v13 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](&v22, sel_initWithEngineLibrary_session_clientCacheIdentifier_scope_transportScope_, v12, a4, a5, a6, a7);
  if (v13)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.cpl.pullfromtransport", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_msgSend(v12, "transport");
    v17 = objc_claimAutoreleasedReturnValue();
    transport = v13->_transport;
    v13->_transport = (CPLEngineTransport *)v17;

    v13->_taskItem = -1;
    v19 = dispatch_queue_create("com.apple.cpl.pullfromtransport.notify", 0);
    notifyQueue = v13->_notifyQueue;
    v13->_notifyQueue = (OS_dispatch_queue *)v19;

  }
  return v13;
}

- (id)transportScope
{
  NSData *updateTransportScope;
  NSData *v3;
  objc_super v5;

  updateTransportScope = self->_updateTransportScope;
  if (updateTransportScope || (updateTransportScope = self->_stagingTransportScope) != 0)
  {
    v3 = updateTransportScope;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLPullFromTransportScopeTask;
    -[CPLEngineScopedTask transportScope](&v5, sel_transportScope);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_reallyNotifySchedulerPullQueueIsFull
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Notifying scheduler that there is some change in the pull queue", v6, 2u);
    }

  }
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteClientNeedsToPull");

}

- (void)_notifySchedulerPullQueueIsFull
{
  OS_dispatch_queue *notifyQueue;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  if (self->_didNotifySchedulerPullQueueIsFullOnce)
  {
    notifyQueue = self->_notifyQueue;
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFull__block_invoke;
    v8[3] = &unk_1E60D65B8;
    v8[4] = self;
    v5 = v8;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_20279;
    block[3] = &unk_1E60D71F8;
    v10 = v5;
    v6 = notifyQueue;
    v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v6, v7);

  }
  else
  {
    -[CPLPullFromTransportScopeTask _reallyNotifySchedulerPullQueueIsFull](self, "_reallyNotifySchedulerPullQueueIsFull");
    self->_didNotifySchedulerPullQueueIsFullOnce = 1;
  }
}

- (void)_notifySchedulerPullQueueIsFullNowIfNecessary
{
  OS_dispatch_queue *notifyQueue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  notifyQueue = self->_notifyQueue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFullNowIfNecessary__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20279;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = notifyQueue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_cancelAllTasks
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CPLPullFromTransportScopeTask__cancelAllTasks__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20279;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (id)_transientPullRepositoryInStore:(id)a3
{
  CPLEngineTransientRepository *transientPullRepository;
  CPLEngineTransientRepository *v5;
  CPLEngineTransientRepository *v6;

  transientPullRepository = self->_transientPullRepository;
  if (!transientPullRepository)
  {
    objc_msgSend(a3, "transientPullRepository");
    v5 = (CPLEngineTransientRepository *)objc_claimAutoreleasedReturnValue();
    v6 = self->_transientPullRepository;
    self->_transientPullRepository = v5;

    transientPullRepository = self->_transientPullRepository;
  }
  return transientPullRepository;
}

- (id)_cloudCacheInStore:(id)a3
{
  CPLEngineCloudCache *cloudCache;
  CPLEngineCloudCache *v5;
  CPLEngineCloudCache *v6;

  cloudCache = self->_cloudCache;
  if (!cloudCache)
  {
    objc_msgSend(a3, "cloudCache");
    v5 = (CPLEngineCloudCache *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cloudCache;
    self->_cloudCache = v5;

    cloudCache = self->_cloudCache;
  }
  return cloudCache;
}

- (void)_extractAndMinglePersonsIfPossibleFromBatch:(id)a3 inTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CPLChangeBatch *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  CPLChangeBatch *v25;
  NSObject *v26;
  CPLChangeBatch *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  _QWORD v37[4];
  CPLChangeBatch *v38;
  CPLPullFromTransportScopeTask *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  CPLChangeBatch *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_useCourtesyMingling)
  {
    v31 = v7;
    v9 = objc_msgSend(v6, "count");
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "store");
    v11 = objc_claimAutoreleasedReturnValue();

    -[CPLPullFromTransportScopeTask _transientPullRepositoryInStore:](self, "_transientPullRepositoryInStore:", v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)v11;
    -[CPLPullFromTransportScopeTask _cloudCacheInStore:](self, "_cloudCacheInStore:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v9);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
    v28 = v9;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v32 = v6;
    obj = v6;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    v33 = v12;
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v43;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(obj);
          v18 = *(CPLChangeBatch **)(*((_QWORD *)&v42 + 1) + 8 * v17);
          -[CPLChangeBatch scopedIdentifier](v18, "scopedIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (*((uint64_t (**)(void))self->_allowsMinglingChangeWithScopedIdentifier + 2))();
          v21 = v13;
          if (v20)
          {
            -[CPLChangeBatch relatedScopedIdentifier](v18, "relatedScopedIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v22
              || (objc_msgSend(v36, "containsObject:", v22) & 1) != 0
              || (objc_msgSend(v12, "hasRecordWithScopedIdentifier:", v22) & 1) != 0)
            {

              objc_msgSend(v36, "addObject:", v19);
              v21 = v34;
            }
            else
            {
              if (!_CPLSilentLogging)
              {
                __CPLTaskOSLogDomain_20266();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v47 = v18;
                  v48 = 2112;
                  v49 = v22;
                  _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEFAULT, "Can't mingle %@ prematurely because it targets an unknown person %@", buf, 0x16u);
                }

                v12 = v33;
              }

              v21 = v13;
            }
          }
          objc_msgSend(v21, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v15 = v24;
      }
      while (v24);
    }

    v8 = v31;
    v6 = v32;
    if (objc_msgSend(v34, "count"))
    {
      v25 = -[CPLChangeBatch initWithRecords:]([CPLChangeBatch alloc], "initWithRecords:", v34);
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v25;
          _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEFAULT, "As a courtesy for a quiet client, mingling immediately new persons we got %@", buf, 0xCu);
        }

      }
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __91__CPLPullFromTransportScopeTask__extractAndMinglePersonsIfPossibleFromBatch_inTransaction___block_invoke;
      v37[3] = &unk_1E60DDA58;
      v38 = v25;
      v39 = self;
      v40 = v30;
      v41 = v29;
      v27 = v25;
      objc_msgSend(v31, "do:", v37);

    }
    if (objc_msgSend(v13, "count") != v28)
      objc_msgSend(obj, "_setRecords:", v13);

  }
}

- (void)_extractAndMingleAssetsIfPossibleFromBatch:(id)a3 inTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  CPLPullFromTransportScopeTask *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_useCourtesyMingling)
  {
    v7 = a3;
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPLPullFromTransportScopeTask _transientPullRepositoryInStore:](self, "_transientPullRepositoryInStore:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLPullFromTransportScopeTask _cloudCacheInStore:](self, "_cloudCacheInStore:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v23 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke;
    v21[3] = &unk_1E60DD110;
    v21[4] = self;
    v13 = v11;
    v22 = v13;
    objc_msgSend(v7, "extractInitialDownloadBatch:shouldConsiderRecordFilter:", &v23, v21);

    v14 = v23;
    if (objc_msgSend(v14, "count"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v14;
          _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "As a courtesy for a quiet client, mingling immediately new assets we got %@", buf, 0xCu);
        }

      }
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke_20;
      v16[3] = &unk_1E60DDA58;
      v17 = v14;
      v18 = self;
      v19 = v9;
      v20 = v10;
      objc_msgSend(v6, "do:", v16);

    }
  }

}

- (unint64_t)_totalAssetCountForScope
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  if (!self->_hasCachedTotalAssetCountForScope)
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineScopedTask scope](self, "scope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scopeChangeForScope:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "libraryInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "assetCounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_totalAssetCountForScope = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__CPLPullFromTransportScopeTask__totalAssetCountForScope__block_invoke;
    v11[3] = &unk_1E60DD138;
    v11[4] = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);
    self->_hasCachedTotalAssetCountForScope = 1;

  }
  return self->_totalAssetCountForScope;
}

- (void)_handleNewBatchFromChanges:(id)a3 newSyncAnchor:(id)a4 inTransaction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  CPLPullFromTransportScopeTask *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  CPLPullFromTransportScopeTask *v27;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPLPullFromTransportScopeTask _transientPullRepositoryInStore:](self, "_transientPullRepositoryInStore:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_newSyncAnchor_inTransaction___block_invoke;
    v24[3] = &unk_1E60DD160;
    v15 = v18;
    v25 = v15;
    v26 = v13;
    v27 = self;
    v16 = v13;
    objc_msgSend(v9, "do:", v24);
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __88__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_newSyncAnchor_inTransaction___block_invoke_22;
    v19[3] = &unk_1E60DDA58;
    v20 = v8;
    v21 = self;
    v22 = v12;
    v23 = v15;
    v17 = v12;
    objc_msgSend(v9, "do:", v19);

  }
}

- (id)scopesForTask
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (-[NSMutableArray count](self->_partnerScopes, "count"))
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLPullFromTransportScopeTask;
    -[CPLEngineScopedTask scopesForTask](&v7, sel_scopesForTask);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", self->_partnerScopes);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CPLPullFromTransportScopeTask;
    -[CPLEngineScopedTask scopesForTask](&v6, sel_scopesForTask);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id allowsMinglingChangeWithScopedIdentifier;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  void *v47;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)CPLPullFromTransportScopeTask;
  v4 = -[CPLEngineScopedTask checkScopeIsValidInTransaction:](&v49, sel_checkScopeIsValidInTransaction_, a3);
  if (v4)
  {
    -[CPLEngineScopedTask store](self, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushRepository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineScopedTask scope](self, "scope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scopeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "minimumPriorityForChangesInScopeWithIdentifier:", v8);
    if (v9 < +[CPLRecordPushContext minimumPriorityForLocalConflictResolution](CPLRecordPushContext, "minimumPriorityForLocalConflictResolution"))
    {
      -[CPLEngineSyncTask session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "allowsLocalConflictResolution");

      if ((v11 & 1) == 0)
      {
        -[CPLEngineSyncTask session](self, "session");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "allowsLocalConflictResolutionWhenOverQuota");

        if (!v13
          || (objc_msgSend(v5, "scopes"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "valueForFlag:forScope:", 2, v7),
              v14,
              (v15 & 1) == 0))
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_20266();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v8;
              _os_log_impl(&dword_1B03C2000, v38, OS_LOG_TYPE_DEFAULT, "Push repository contains changes for %@, stopping pull from transport now", buf, 0xCu);
            }

          }
          -[CPLPullFromTransportScopeTask cancel](self, "cancel");

          goto LABEL_23;
        }
      }
    }
    objc_msgSend(v5, "cloudCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transientPullRepository");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __64__CPLPullFromTransportScopeTask_checkScopeIsValidInTransaction___block_invoke;
      v46[3] = &unk_1E60DD190;
      v47 = v16;
      v48 = v17;
      v19 = v17;
      v20 = v16;
      v21 = (void *)MEMORY[0x1B5E08DC4](v46);
      allowsMinglingChangeWithScopedIdentifier = self->_allowsMinglingChangeWithScopedIdentifier;
      self->_allowsMinglingChangeWithScopedIdentifier = v21;

      v23 = v47;
    }
    else
    {
      objc_msgSend(v5, "idMapping");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineScopedTask scope](self, "scope");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __64__CPLPullFromTransportScopeTask_checkScopeIsValidInTransaction___block_invoke_2;
      v40[3] = &unk_1E60DD1B8;
      v41 = v16;
      v42 = v18;
      v43 = v24;
      v44 = v25;
      v45 = v6;
      v26 = v25;
      v23 = v24;
      v27 = v18;
      v28 = v16;
      v29 = (void *)MEMORY[0x1B5E08DC4](v40);
      v30 = self->_allowsMinglingChangeWithScopedIdentifier;
      self->_allowsMinglingChangeWithScopedIdentifier = v29;

    }
    -[CPLEngineScopedTask store](self, "store");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "cleanupTasks");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "hasCleanupTasks");

    if (v33)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEFAULT, "Can't download records until cleanup tasks have been done", buf, 2u);
        }

      }
      -[CPLPullFromTransportScopeTask cancel](self, "cancel");
LABEL_23:
      LOBYTE(v4) = 0;
      return v4;
    }
    if (self->_taskItem == -1)
    {
      -[CPLEngineScopedTask store](self, "store");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "scopes");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineScopedTask scope](self, "scope");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      self->_taskItem = objc_msgSend(v36, "pullFromTransportTaskForScope:", v37);

    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)_storeRewindSyncAnchors:(id)a3 inScopes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "count"))
  {

    v8 = 0;
  }
  -[CPLEngineScopedTask scope](self, "scope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "storeRewindSyncAnchors:forScope:error:", v8, v10, a5);

  return v11;
}

- (BOOL)_fetchRewindSyncAnchorsInScopes:(id)a3 startSyncAnchor:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  NSMutableSet *otherRewindSyncAnchors;
  NSObject *v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CPLEngineScopedTask scope](self, "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rewindSyncAnchorsForScope:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    -[CPLEngineScopedTask scope](self, "scope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v12 = (NSMutableSet *)objc_msgSend(v10, "mutableCopy");
      otherRewindSyncAnchors = self->_otherRewindSyncAnchors;
      self->_otherRewindSyncAnchors = v12;

      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = -[NSMutableSet count](self->_otherRewindSyncAnchors, "count");
          v19 = 138412546;
          v20 = v11;
          v21 = 2048;
          v22 = v15;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "%@ might need to rewind fetching changes up to %lu times to catch up with missed features", (uint8_t *)&v19, 0x16u);
        }

      }
      v16 = 1;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138412290;
          v20 = v11;
          _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "%@ does not need to rewind to catch up with missed features as it will fetch all records since the beginning", (uint8_t *)&v19, 0xCu);
        }

      }
      v16 = -[CPLPullFromTransportScopeTask _storeRewindSyncAnchors:inScopes:error:](self, "_storeRewindSyncAnchors:inScopes:error:", 0, v8, a5);
    }

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)_dequeueFromPendingRecordChecksIfNecessary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (self->_hasExtraRecordsToCheck && objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v14, "scopedIdentifier", (_QWORD)v20);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      -[CPLEngineScopedTask store](self, "store");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pendingRecordChecks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "dequeueCloudScopedIdentifiersToCheck:error:", v8, a4);

    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (void)_checkExtraRecordsWithScopedIdentifiers:(id)a3
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
    __CPLTaskOSLogDomain_20266();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Will check records directly on Server: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke;
  v12[3] = &unk_1E60D6F88;
  v12[4] = self;
  v13 = v4;
  v8 = v12;
  *(_QWORD *)&buf = v7;
  *((_QWORD *)&buf + 1) = 3221225472;
  v15 = __cpl_dispatch_async_block_invoke_20279;
  v16 = &unk_1E60D71F8;
  v17 = v8;
  v9 = queue;
  v10 = v4;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v9, v11);

}

- (void)_checkExtraRecords
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t *v9;
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (!self->_hasExtraRecordsToCheck)
    __assert_rtn("-[CPLPullFromTransportScopeTask _checkExtraRecords]", "CPLPullFromTransportTask.m", 565, "_hasExtraRecordsToCheck");
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Checking extra records", buf, 2u);
    }

  }
  -[CPLEngineScopedTask store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v11 = buf;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__20328;
  v14 = __Block_byref_object_dispose__20329;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__CPLPullFromTransportScopeTask__checkExtraRecords__block_invoke;
  v7[3] = &unk_1E60DD280;
  v7[4] = self;
  v9 = buf;
  v5 = v4;
  v8 = v5;
  v6 = (id)objc_msgSend(v5, "performReadTransactionWithBlock:", v7);

  _Block_object_dispose(buf, 8);
}

- (void)_notePartnerScopesNeedingToPullChanges:(id)a3 scopes:(id)a4 inTransaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CPLPullFromTransportScopeTask *v13;
  id v14;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v10, "count")
    && -[NSMutableDictionary count](self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__CPLPullFromTransportScopeTask__notePartnerScopesNeedingToPullChanges_scopes_inTransaction___block_invoke;
    v11[3] = &unk_1E60DD160;
    v12 = v10;
    v13 = self;
    v14 = v8;
    objc_msgSend(v9, "do:", v11);

  }
}

- (void)_handleNewBatchFromChanges:(id)a3 updatedFlags:(id)a4 newSyncAnchor:(id)a5 partnerScopesNeedingToPullChanges:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  CPLPullFromTransportScopeTask *v29;
  __int128 *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 *p_buf;
  char v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[CPLEngineScopedTask store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_suspend((dispatch_object_t)self->_queue);
  if (self->_rewindSyncAnchor
    && -[CPLFeatureVersionHistory featureVersionForSyncAnchor:](self->_versionHistory, "featureVersionForSyncAnchor:", v12) <= self->_rewindFeatureVersion)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLEngineScopedTask scope](self, "scope");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "No need to rewind in %@ as we just caught up with the sync anchor we need to match current feature version", (uint8_t *)&buf, 0xCu);

      }
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v10, "filterScopeChangeFromBatch");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v19 = MEMORY[0x1E0C809B0];
  v42 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke;
  v31[3] = &unk_1E60DD258;
  v31[4] = self;
  v20 = v12;
  v32 = v20;
  v21 = v18;
  v33 = v21;
  p_buf = &buf;
  v22 = v11;
  v34 = v22;
  v35 = v10;
  v39 = v15;
  v23 = v14;
  v36 = v23;
  v24 = v13;
  v37 = v24;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_53;
  v27[3] = &unk_1E60DD280;
  v25 = v35;
  v28 = v25;
  v29 = self;
  v30 = &buf;
  v26 = (id)objc_msgSend(v23, "performWriteTransactionWithBlock:completionHandler:", v31, v27);

  _Block_object_dispose(&buf, 8);
}

- (void)_updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  CPLPullFromTransportScopeTask *v14;
  id v15;

  v4 = a3;
  -[CPLEngineScopedTask store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke;
  v12[3] = &unk_1E60DD2A8;
  v13 = v5;
  v14 = self;
  v15 = v4;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke_54;
  v10[3] = &unk_1E60DD810;
  v10[4] = self;
  v11 = v15;
  v7 = v15;
  v8 = v5;
  v9 = (id)objc_msgSend(v8, "performWriteTransactionWithBlock:completionHandler:", v12, v10);

}

- (void)_relaunchFetchChangesFromOtherRewindSyncAnchors
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  if (!-[NSMutableSet count](self->_otherRewindSyncAnchors, "count"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "We should have rewind sync anchors here", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPullFromTransportTask.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 763, CFSTR("We should have rewind sync anchors here"));

    abort();
  }
  -[CPLEngineScopedTask store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet anyObject](self->_otherRewindSyncAnchors, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](self->_otherRewindSyncAnchors, "removeObject:", v6);
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke;
  v16[3] = &unk_1E60DD2A8;
  v16[4] = self;
  v17 = v5;
  v18 = v6;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke_60;
  v14[3] = &unk_1E60DD810;
  v14[4] = self;
  v15 = v18;
  v8 = v18;
  v9 = v5;
  v10 = (id)objc_msgSend(v4, "performWriteTransactionWithBlock:completionHandler:", v16, v14);

}

- (void)_launchFetchChangesFromSyncAnchor:(id)a3
{
  id v5;
  NSObject *v6;
  CPLEngineTransport *transport;
  void *v8;
  CPLTransportScopeMapping *transportScopeMapping;
  CPLScopeChange *currentScopeChange;
  uint64_t v11;
  CPLEngineTransportDownloadBatchTask *v12;
  CPLEngineTransportDownloadBatchTask *downloadTask;
  NSMutableDictionary *syncAnchorsOfPartnerScopesThatMightNeedToPullChanges;
  NSObject *v15;
  CPLEngineTransportDownloadBatchTask *v16;
  int v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  __int128 *p_buf;
  uint8_t v31[4];
  CPLEngineTransportDownloadBatchTask *v32;
  __int16 v33;
  const char *v34;
  __int128 buf;
  uint64_t v36;
  CFAbsoluteTime Current;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("fetching changes"));
  if (!self->_rewindSyncAnchor)
    goto LABEL_4;
  if (v5)
  {
    if (-[CPLFeatureVersionHistory featureVersionForSyncAnchor:](self->_versionHistory, "featureVersionForSyncAnchor:", v5) > self->_rewindFeatureVersion)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Launching transport download task", (uint8_t *)&buf, 2u);
        }

      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v36 = 0x2020000000;
      Current = 0.0;
      Current = CFAbsoluteTimeGetCurrent();
      transport = self->_transport;
      -[CPLEngineScopedTask scope](self, "scope");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      transportScopeMapping = self->_transportScopeMapping;
      currentScopeChange = self->_currentScopeChange;
      v11 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke;
      v28[3] = &unk_1E60DD2F8;
      v28[4] = self;
      p_buf = &buf;
      v29 = v5;
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_64;
      v27[3] = &unk_1E60DD348;
      v27[4] = self;
      -[CPLEngineTransport downloadBatchTaskForSyncAnchor:scope:transportScopeMapping:currentScopeChange:progressHandler:completionHandler:](transport, "downloadBatchTaskForSyncAnchor:scope:transportScopeMapping:currentScopeChange:progressHandler:completionHandler:", v29, v8, transportScopeMapping, currentScopeChange, v28, v27);
      v12 = (CPLEngineTransportDownloadBatchTask *)objc_claimAutoreleasedReturnValue();
      downloadTask = self->_downloadTask;
      self->_downloadTask = v12;

      if (!self->_downloadTask)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_20266();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v31 = 0;
            _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "We should have a download task at this point", v31, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPullFromTransportTask.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v25, 878, CFSTR("We should have a download task at this point"));

        abort();
      }
      syncAnchorsOfPartnerScopesThatMightNeedToPullChanges = self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges;
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_69;
      v26[3] = &unk_1E60DD370;
      v26[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](syncAnchorsOfPartnerScopesThatMightNeedToPullChanges, "enumerateKeysAndObjectsUsingBlock:", v26);
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v16 = self->_downloadTask;
          v17 = -[CPLEngineTransportDownloadBatchTask foreground](v16, "foreground");
          v18 = " with background priority";
          if (v17)
            v18 = " with foreground priority";
          *(_DWORD *)v31 = 138412546;
          v32 = v16;
          v33 = 2080;
          v34 = v18;
          _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEBUG, "Launching %@%s", v31, 0x16u);
        }

      }
      -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", self->_downloadTask, self->_transportGroup);

      _Block_object_dispose(&buf, 8);
      goto LABEL_26;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLEngineScopedTask scope](self, "scope");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "No need to rewind in %@ as we just caught up with the sync anchor we need", (uint8_t *)&buf, 0xCu);

      }
    }
    -[CPLPullFromTransportScopeTask _updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:](self, "_updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:", v5);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLEngineScopedTask scope](self, "scope");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "No need to rewind in %@ as we are fetching everything from the beginning", (uint8_t *)&buf, 0xCu);

      }
    }
    -[CPLPullFromTransportScopeTask _updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:](self, "_updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:", 0);
  }
LABEL_26:

}

- (void)_handleNewBatchFromQuery:(id)a3 newCursor:(id)a4 inTransaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  Class currentQueryClass;
  Class v16;
  BOOL v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CPLPullFromTransportScopeTask *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  CPLPullFromTransportScopeTask *v31;
  _QWORD v32[5];
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke;
  v32[3] = &unk_1E60DDA30;
  v32[4] = self;
  v22 = v8;
  v33 = v22;
  objc_msgSend(v10, "do:", v32);
  objc_msgSend(v10, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[CPLEngineScopedTask store](self, "store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLPullFromTransportScopeTask _transientPullRepositoryInStore:](self, "_transientPullRepositoryInStore:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    currentQueryClass = self->_currentQueryClass;
    if (currentQueryClass == (Class)objc_opt_class())
    {
      -[CPLPullFromTransportScopeTask _extractAndMinglePersonsIfPossibleFromBatch:inTransaction:](self, "_extractAndMinglePersonsIfPossibleFromBatch:inTransaction:", v22, v10);
    }
    else
    {
      v16 = self->_currentQueryClass;
      v17 = v16 == (Class)objc_opt_class();
      v18 = v22;
      if (!v17)
        goto LABEL_8;
      -[CPLPullFromTransportScopeTask _extractAndMingleAssetsIfPossibleFromBatch:inTransaction:](self, "_extractAndMingleAssetsIfPossibleFromBatch:inTransaction:", v22, v10);
    }
    v18 = v22;
LABEL_8:
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke_2;
    v28[3] = &unk_1E60DD160;
    v19 = v18;
    v29 = v19;
    v30 = v14;
    v31 = self;
    v20 = v14;
    objc_msgSend(v10, "do:", v28);
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke_73;
    v23[3] = &unk_1E60DDA58;
    v24 = v9;
    v25 = v13;
    v26 = self;
    v27 = v19;
    v21 = v13;
    objc_msgSend(v10, "do:", v23);

  }
}

- (void)_storeInitialSyncAnchorIfNecessaryInTransaction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__CPLPullFromTransportScopeTask__storeInitialSyncAnchorIfNecessaryInTransaction___block_invoke;
  v3[3] = &unk_1E60DD6D0;
  v3[4] = self;
  objc_msgSend(a3, "do:", v3);
}

- (void)_handleNewBatchFromQuery:(id)a3 queryClass:(Class)a4 newCursor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CPLPullFromTransportScopeTask *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a5;
  -[CPLEngineScopedTask store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_suspend((dispatch_object_t)self->_queue);
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_queryClass_newCursor___block_invoke;
  v17[3] = &unk_1E60DD2A8;
  v17[4] = self;
  v18 = v7;
  v19 = v8;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __79__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_queryClass_newCursor___block_invoke_2;
  v14[3] = &unk_1E60DD810;
  v15 = v18;
  v16 = self;
  v11 = v18;
  v12 = v8;
  v13 = (id)objc_msgSend(v9, "performWriteTransactionWithBlock:completionHandler:", v17, v14);

}

- (void)_launchQueryForClass:(Class)a3 cursor:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  CPLEngineTransport *transport;
  void *v11;
  CPLTransportScopeMapping *transportScopeMapping;
  uint64_t v13;
  id v14;
  CPLEngineTransportQueryTask *v15;
  CPLEngineTransportQueryTask *queryTask;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  CPLEngineTransportQueryTask *v20;
  int v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[6];
  _QWORD v27[5];
  id v28;
  uint8_t *v29;
  Class v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  CFAbsoluteTime Current;
  uint8_t v35[4];
  Class v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("running query for %@"), a3);
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", v8);

  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Launching transport download task", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v32 = buf;
  v33 = 0x2020000000;
  Current = 0.0;
  Current = CFAbsoluteTimeGetCurrent();
  self->_didNotifySchedulerPullQueueIsFullOnce = 0;
  transport = self->_transport;
  -[CPLEngineScopedTask scope](self, "scope");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  transportScopeMapping = self->_transportScopeMapping;
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke;
  v27[3] = &unk_1E60DD3C0;
  v27[4] = self;
  v29 = buf;
  v14 = v7;
  v28 = v14;
  v30 = a3;
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_79;
  v26[3] = &unk_1E60DD410;
  v26[4] = self;
  v26[5] = a3;
  -[CPLEngineTransport queryTaskForCursor:class:scope:transportScopeMapping:progressHandler:completionHandler:](transport, "queryTaskForCursor:class:scope:transportScopeMapping:progressHandler:completionHandler:", v14, a3, v11, transportScopeMapping, v27, v26);
  v15 = (CPLEngineTransportQueryTask *)objc_claimAutoreleasedReturnValue();
  queryTask = self->_queryTask;
  self->_queryTask = v15;

  if (!self->_queryTask)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "We should have a query task at this point", v35, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPullFromTransportTask.m");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v25, 1083, CFSTR("We should have a query task at this point"));

    abort();
  }
  self->_currentQueryClass = a3;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLEngineScopedTask scope](self, "scope");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 138412546;
      v36 = a3;
      v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "Launching query for %@ in %@", v35, 0x16u);

    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = self->_queryTask;
        v21 = -[CPLEngineTransportQueryTask foreground](v20, "foreground");
        v22 = " with background priority";
        if (v21)
          v22 = " with foreground priority";
        *(_DWORD *)v35 = 138412546;
        v36 = v20;
        v37 = 2080;
        v38 = v22;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEBUG, "Launching %@%s", v35, 0x16u);
      }

    }
  }
  -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", self->_queryTask, self->_transportGroup);

  _Block_object_dispose(buf, 8);
}

- (void)_launchNextQueryTask
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[7];
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  uint8_t *v12;
  _QWORD v13[4];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Launch pull task", buf, 2u);
    }

  }
  -[CPLEngineScopedTask store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v15 = buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20328;
  v18 = __Block_byref_object_dispose__20329;
  v19 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2050000000;
  v5 = MEMORY[0x1E0C809B0];
  v13[3] = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke;
  v9[3] = &unk_1E60DD438;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = v13;
  v12 = buf;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_87;
  v8[3] = &unk_1E60DDAD0;
  v8[4] = self;
  v8[5] = v13;
  v8[6] = buf;
  v7 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v9, v8);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(buf, 8);

}

- (void)_launchPullTasksAndDisableQueries:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[7];
  _QWORD v14[5];
  id v15;
  __int128 *p_buf;
  _QWORD *v17;
  char v18;
  _QWORD v19[4];
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (_launchPullTasksAndDisableQueries__onceToken != -1)
    dispatch_once(&_launchPullTasksAndDisableQueries__onceToken, &__block_literal_global_20324);
  if (_launchPullTasksAndDisableQueries__alwaysDisableQueries)
    v5 = 1;
  else
    v5 = v3;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = &stru_1E60DF6B8;
      if (v5)
        v7 = CFSTR(" without queries");
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Launching pull task%@", (uint8_t *)&buf, 0xCu);
    }

  }
  -[CPLEngineScopedTask store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scopes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__20328;
  v23 = __Block_byref_object_dispose__20329;
  v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2050000000;
  v10 = MEMORY[0x1E0C809B0];
  v19[3] = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_96;
  v14[3] = &unk_1E60DD4A8;
  v14[4] = self;
  v11 = v9;
  v15 = v11;
  p_buf = &buf;
  v18 = v5;
  v17 = v19;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_2;
  v13[3] = &unk_1E60DDAD0;
  v13[4] = self;
  v13[5] = v19;
  v13[6] = &buf;
  v12 = (id)objc_msgSend(v8, "performWriteTransactionWithBlock:completionHandler:", v14, v13);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&buf, 8);

}

- (void)_fetchInitialSyncAnchor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CPLScopeChange *currentScopeChange;
  CPLEngineTransportGetCurrentSyncAnchorTask *v8;
  CPLEngineTransportGetCurrentSyncAnchorTask *fetchInitialSyncAnchorTask;
  NSObject *v10;
  CPLEngineTransportGetCurrentSyncAnchorTask *v11;
  int v12;
  const char *v13;
  CPLEngineTransportGetCurrentSyncAnchorTask *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  CPLEngineTransportGetCurrentSyncAnchorTask *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("fetching initial sync anchor"));
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPLPullFromTransportScopeTask transportScope](self, "transportScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  currentScopeChange = self->_currentScopeChange;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke;
  v16[3] = &unk_1E60DD4D0;
  v16[4] = self;
  objc_msgSend(v4, "getCurrentSyncAnchorWithTransportScope:scope:previousScopeChange:completionHandler:", v5, v6, currentScopeChange, v16);
  v8 = (CPLEngineTransportGetCurrentSyncAnchorTask *)objc_claimAutoreleasedReturnValue();
  fetchInitialSyncAnchorTask = self->_fetchInitialSyncAnchorTask;
  self->_fetchInitialSyncAnchorTask = v8;

  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = self->_fetchInitialSyncAnchorTask;
      v12 = -[CPLEngineTransportGetCurrentSyncAnchorTask foreground](v11, "foreground");
      v13 = " with background priority";
      if (v12)
        v13 = " with foreground priority";
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      v19 = 2080;
      v20 = v13;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Launching %@%s", buf, 0x16u);
    }

  }
  v14 = self->_fetchInitialSyncAnchorTask;
  objc_msgSend(v4, "createGroupForLibraryStateCheck");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", v14, v15);

}

- (void)_addPartnerScope:(id)a3 scopes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableArray *partnerScopes;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *syncAnchorsOfPartnerScopesThatMightNeedToPullChanges;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "mostCurrentChangesSyncAnchorForScope:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (objc_msgSend(v7, "doesScopeNeedToPullChangesFromTransport:", v6))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[CPLEngineScopedTask scope](self, "scope");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412546;
          v21 = v6;
          v22 = 2112;
          v23 = v10;
          v11 = "%@ (partner with %@) is already scheduled to pull changes. Not using sync obligations";
LABEL_9:
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, 0x16u);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          -[CPLEngineScopedTask scope](self, "scope");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "cplSyncAnchorDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412802;
          v21 = v6;
          v22 = 2112;
          v23 = v13;
          v24 = 2112;
          v25 = v14;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "%@ (partner with %@) might need to pull changes from %@. Using sync obligations to determine that", (uint8_t *)&v20, 0x20u);

        }
      }
      partnerScopes = self->_partnerScopes;
      if (!partnerScopes)
      {
        v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = self->_partnerScopes;
        self->_partnerScopes = v16;

        v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        syncAnchorsOfPartnerScopesThatMightNeedToPullChanges = self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges;
        self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges = v18;

        partnerScopes = self->_partnerScopes;
      }
      -[NSMutableArray addObject:](partnerScopes, "addObject:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges, "setObject:forKeyedSubscript:", v8, v6);
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLEngineScopedTask scope](self, "scope");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v10;
      v11 = "%@ (partner with %@) has not pulled changes yet. Not using sync obligations";
      goto LABEL_9;
    }
LABEL_10:

  }
}

- (void)_checkServerFeatureVersionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  CPLPullFromTransportScopeTask *v13;

  v4 = a3;
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("checking feature version"));
  -[CPLEngineScopedTask store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60DD810;
  v12 = v5;
  v13 = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke_119;
  v9[3] = &unk_1E60DD500;
  v9[4] = self;
  v6 = v4;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "performWriteTransactionWithBlock:completionHandler:", v11, v9);

}

- (void)_launch
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_useCourtesyMingling = objc_msgSend(v4, "shouldTryToMingleImmediately");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__CPLPullFromTransportScopeTask__launch__block_invoke;
  v5[3] = &unk_1E60DDB80;
  v5[4] = self;
  -[CPLPullFromTransportScopeTask _checkServerFeatureVersionWithCompletionHandler:](self, "_checkServerFeatureVersionWithCompletionHandler:", v5);
}

- (void)launch
{
  objc_super v3;

  -[CPLPullFromTransportScopeTask hash](self, "hash");
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)CPLPullFromTransportScopeTask;
  -[CPLEngineSyncTask launch](&v3, sel_launch);
  -[CPLPullFromTransportScopeTask _launch](self, "_launch");
}

- (void)taskDidFinishWithError:(id)a3
{
  NSError *v4;
  NSError *endTaskError;
  NSError *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  CPLPullFromTransportScopeTask *v16;

  v4 = (NSError *)a3;
  -[CPLPullFromTransportScopeTask hash](self, "hash");
  kdebug_trace();
  -[CPLPullFromTransportScopeTask _notifySchedulerPullQueueIsFullNowIfNecessary](self, "_notifySchedulerPullQueueIsFullNowIfNecessary");
  endTaskError = self->_endTaskError;
  if (endTaskError)
  {
    v6 = endTaskError;

    v4 = v6;
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  if (!-[NSError isCPLErrorWithCode:](v4, "isCPLErrorWithCode:", 33))
  {
LABEL_10:
    v12.receiver = self;
    v12.super_class = (Class)CPLPullFromTransportScopeTask;
    -[CPLEngineSyncTask taskDidFinishWithError:](&v12, sel_taskDidFinishWithError_, v4);
    goto LABEL_11;
  }
  -[CPLEngineSyncTask session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excludeScopeIdentifierFromMingling:", v9);

LABEL_6:
  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled") || self->_taskItem == -1)
  {
    v4 = 0;
    goto LABEL_10;
  }
  -[CPLEngineScopedTask store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke;
  v14[3] = &unk_1E60DD810;
  v15 = v10;
  v16 = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke_124;
  v13[3] = &unk_1E60DD838;
  v4 = v10;
  v11 = (id)-[NSError performWriteTransactionWithBlock:completionHandler:](v4, "performWriteTransactionWithBlock:completionHandler:", v14, v13);

LABEL_11:
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLPullFromTransportScopeTask;
  -[CPLEngineSyncTask cancel](&v3, sel_cancel);
  -[CPLPullFromTransportScopeTask _cancelAllTasks](self, "_cancelAllTasks");
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.pullfromtransport");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_allowsMinglingChangeWithScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_checkRecordsTask, 0);
  objc_storeStrong((id *)&self->_stagingTransportScope, 0);
  objc_storeStrong((id *)&self->_stagingScope, 0);
  objc_storeStrong((id *)&self->_updateTransportScope, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_fetchInitialSyncAnchorTask, 0);
  objc_storeStrong((id *)&self->_initialScopeChange, 0);
  objc_storeStrong((id *)&self->_initialSyncAnchor, 0);
  objc_storeStrong((id *)&self->_otherRewindSyncAnchors, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_versionHistory, 0);
  objc_storeStrong((id *)&self->_rewindSyncAnchor, 0);
  objc_storeStrong((id *)&self->_currentScopeChange, 0);
  objc_storeStrong((id *)&self->_queryTask, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_transientPullRepository, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_finalListOfPartnerScopesNeedingToPullChanges, 0);
  objc_storeStrong((id *)&self->_allPartnerScopeIdentifiersNeedingToPullChanges, 0);
  objc_storeStrong((id *)&self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges, 0);
  objc_storeStrong((id *)&self->_partnerScopes, 0);
  objc_storeStrong((id *)&self->_primaryScope, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_endTaskError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke_2;
  v21[3] = &unk_1E60DDA30;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v22 = v5;
  v23 = v6;
  objc_msgSend(v3, "do:", v21);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "count"))
    objc_msgSend(*(id *)(a1 + 40), "_notePartnerScopesNeedingToPullChanges:scopes:inTransaction:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168), v5, v3);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "count"))
  {
    v15 = v5;
    v16 = v3;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 40) + 152);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          if (!_CPLSilentLogging)
          {
            v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            __CPLTaskOSLogDomain_20266();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "scope");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v25 = v12;
              v26 = 2112;
              v27 = v14;
              _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "%@ (partner with %@) does not need to pull changes according to sync obligations", buf, 0x16u);

            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
      }
      while (v9);
    }

    v5 = v15;
    v3 = v16;
  }

}

void __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  objc_super v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = v5;
    v17.super_class = (Class)CPLPullFromTransportScopeTask;
    objc_msgSendSuper2(&v17, sel_taskDidFinishWithError_, v6);

  }
  else
  {
    v7 = (void *)v5[20];
    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "componentsJoinedByString:", CFSTR(", "));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "scope");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v19 = v9;
          v20 = 2112;
          v21 = v10;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Will retry sync session to pull changes from %{public}@ (partner of %@)", buf, 0x16u);

        }
        v5 = *(_QWORD **)(a1 + 32);
        v7 = (void *)v5[20];
      }
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scopeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10000, CFSTR("Fulfilling sync obligation for %@ (partner with %@)"), v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16.receiver = v5;
      v16.super_class = (Class)CPLPullFromTransportScopeTask;
      objc_msgSendSuper2(&v16, sel_taskDidFinishWithError_, v14);

    }
    else
    {
      v15.receiver = *(id *)(a1 + 32);
      v15.super_class = (Class)CPLPullFromTransportScopeTask;
      objc_msgSendSuper2(&v15, sel_taskDidFinishWithError_, 0);
    }
  }

}

uint64_t __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "setScope:hasCompletedPullFromTransportTask:error:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 296), a2);

  return v6;
}

void __40__CPLPullFromTransportScopeTask__launch__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  dispatch_block_t v10;
  id v11;
  _QWORD v12[5];
  _QWORD block[4];
  id v14;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "taskDidFinishWithError:", a2);
  }
  else
  {
    v4 = objc_msgSend(v3, "isCancelled");
    v5 = *(_QWORD **)(a1 + 32);
    if (v4)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskDidFinishWithError:", v11);

    }
    else
    {
      v6 = (void *)v5[13];
      v7 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __40__CPLPullFromTransportScopeTask__launch__block_invoke_2;
      v12[3] = &unk_1E60D65B8;
      v12[4] = v5;
      v8 = v12;
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __cpl_dispatch_async_block_invoke_20279;
      block[3] = &unk_1E60D71F8;
      v14 = v8;
      v9 = v6;
      v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v9, v10);

    }
  }
}

void __40__CPLPullFromTransportScopeTask__launch__block_invoke_2(uint64_t a1)
{
  int v2;
  _BYTE *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(_BYTE **)(a1 + 32);
  if (v2)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "taskDidFinishWithError:", v4);

  }
  else if (v3[304])
  {
    objc_msgSend(v3, "_launchPullTasksAndDisableQueries:", 0);
  }
  else
  {
    objc_msgSend(v3, "_fetchInitialSyncAnchor");
  }
}

void __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __objc2_meth_list **p_class_meths;
  BOOL v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CPLTransportScopeMapping *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  unint64_t v46;
  NSObject *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  char v59;
  NSObject *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  unint64_t v75;
  uint64_t v76;
  id v77;
  NSObject *v78;
  uint64_t v79;
  id v80;
  void *v81;
  char v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  void *v94;
  id obj;
  id v96;
  _QWORD v97[4];
  id v98;
  uint64_t v99;
  uint8_t buf[4];
  unint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  void *v107;
  void *v108;
  _QWORD v109[2];
  _QWORD v110[4];

  v110[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stagingScopeForScope:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 360);
  *(_QWORD *)(v7 + 360) = v6;

  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 360);
  p_class_meths = &OBJC_PROTOCOL___CPLNetworkWatcherDelegate.class_meths;
  if (v9)
    v11 = _CPLSilentLogging == 0;
  else
    v11 = 0;
  if (v11)
  {
    __CPLTaskOSLogDomain_20266();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360);
      *(_DWORD *)buf = 138412546;
      v101 = v13;
      v102 = 2112;
      v103 = (uint64_t)v5;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Will pull changes from %@ on behalf of %@", buf, 0x16u);
    }

    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 360);
  }
  if (v9)
    v14 = v9;
  else
    v14 = v5;
  if (objc_msgSend(v4, "valueForFlag:forScope:", 36, v14))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v101 = (unint64_t)v5;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "%@ is meant to be deleted - ignoring", buf, 0xCu);
      }

    }
    objc_msgSend(v5, "scopeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v16;
    v17 = CFSTR("%@ is deleted");
    v18 = 33;
    goto LABEL_18;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "checkScopeIsValidInTransaction:", v3))
    goto LABEL_28;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 360))
  {
    objc_msgSend(v4, "transportScopeForScope:");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(void **)(v21 + 368);
    *(_QWORD *)(v21 + 368) = v20;

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 368))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360);
          *(_DWORD *)buf = 138412546;
          v101 = v42;
          v102 = 2112;
          v103 = (uint64_t)v5;
          _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_ERROR, "%@ (staging %@) has no transport scope and will need to be updated first", buf, 0x16u);
        }

      }
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke_110;
      v97[3] = &unk_1E60DDA30;
      v43 = v4;
      v44 = *(_QWORD *)(a1 + 40);
      v98 = v43;
      v99 = v44;
      objc_msgSend(v3, "do:", v97);
      v16 = v98;
      goto LABEL_19;
    }
  }
  v23 = [CPLTransportScopeMapping alloc];
  objc_msgSend(*(id *)(a1 + 40), "engineLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "transport");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[CPLTransportScopeMapping initWithTranslator:](v23, "initWithTranslator:", v25);
  v27 = *(_QWORD *)(a1 + 40);
  v28 = *(void **)(v27 + 120);
  *(_QWORD *)(v27 + 120) = v26;

  v29 = *(_QWORD **)(a1 + 40);
  v30 = (void *)v29[15];
  objc_msgSend(v29, "transportScope");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addTransportScope:forScopeWithIdentifier:", v31, v32);

  objc_msgSend(v4, "sharingScopeForScope:", v5);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = *(_QWORD *)(a1 + 40);
  v35 = *(void **)(v34 + 128);
  *(_QWORD *)(v34 + 128) = v33;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 128))
  {
LABEL_46:
    objc_msgSend(*(id *)(a1 + 32), "pendingRecordChecks");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scopeIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 376) = objc_msgSend(v50, "hasRecordsToCheckWithScopeIdentifier:", v51);

    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 376) && !*((_BYTE *)p_class_meths + 3376))
    {
      __CPLTaskOSLogDomain_20266();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v52, OS_LOG_TYPE_DEFAULT, "Will need to check some extra records at the end", buf, 2u);
      }

    }
    if ((objc_msgSend(v5, "scopeType") & 0xFFFFFFFFFFFFFFFELL) != 4)
      goto LABEL_65;
    objc_msgSend(v4, "primaryScope");
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = *(_QWORD *)(a1 + 40);
    v55 = *(void **)(v54 + 136);
    *(_QWORD *)(v54 + 136) = v53;

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 136))
      goto LABEL_65;
    objc_msgSend(v4, "sharingScopeForScope:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scopeIdentifier");
    v56 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scopeIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (unint64_t)v57;
    if (v56 && v57)
    {
      v59 = objc_msgSend((id)v56, "isEqual:", v57);

      if ((v59 & 1) == 0)
        goto LABEL_63;
    }
    else
    {

      if (v56 | v58)
      {
LABEL_63:
        v62 = *(_QWORD *)(a1 + 40);
        v63 = *(void **)(v62 + 136);
        *(_QWORD *)(v62 + 136) = 0;
LABEL_64:

LABEL_65:
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 304) = objc_msgSend(v4, "hasScopeFetchedInitialSyncAnchor:", v5);
        if (!(*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 304) | _CPLSilentLogging))
        {
          __CPLTaskOSLogDomain_20266();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "scopeIdentifier");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v101 = (unint64_t)v65;
            _os_log_impl(&dword_1B03C2000, v64, OS_LOG_TYPE_DEFAULT, "Will need to fetch initial sync anchor before queries for %@", buf, 0xCu);

          }
        }
        objc_msgSend(v4, "scopeChangeForScope:", v5);
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = *(_QWORD *)(a1 + 40);
        v68 = *(void **)(v67 + 216);
        *(_QWORD *)(v67 + 216) = v66;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "libraryInfo");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v69;
        if (v69)
        {
          objc_msgSend(v69, "featureVersionHistory");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v4, "supportedFeatureVersionInLastSyncForScope:", v5);
          v72 = objc_msgSend(v70, "currentFeatureVersion");
          if (v71 <= 0x13)
          {
            v73 = v72;
            objc_msgSend(v5, "scopeIdentifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (v73 <= v71)
            {
              v96 = 0;
              v82 = objc_msgSend(v4, "storeSupportedFeatureVersionInLastSync:forScope:error:", 20, v5, &v96);
              v77 = v96;
              if ((v82 & 1) == 0)
              {
                if (!_CPLSilentLogging)
                {
                  __CPLTaskOSLogDomain_20266();
                  v83 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v101 = (unint64_t)v74;
                    v102 = 2112;
                    v103 = (uint64_t)v77;
                    _os_log_impl(&dword_1B03C2000, v83, OS_LOG_TYPE_ERROR, "Unable to store supported feature version for %@: %@", buf, 0x16u);
                  }

                }
                objc_msgSend(v3, "setError:", v77);
              }
            }
            else
            {
              v75 = v71 + 1;
              objc_msgSend(v70, "syncAnchorForFeatureVersion:", v71 + 1);
              v76 = objc_claimAutoreleasedReturnValue();
              obj = (id)v76;
              if (v76)
              {
                v77 = (id)v76;
                if (!_CPLSilentLogging)
                {
                  __CPLTaskOSLogDomain_20266();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218754;
                    v101 = v75;
                    v102 = 2048;
                    v103 = 20;
                    v104 = 2112;
                    v105 = v70;
                    v106 = 2112;
                    v107 = v74;
                    _os_log_impl(&dword_1B03C2000, v78, OS_LOG_TYPE_DEFAULT, "Will need to rewind sync anchor and fetch changes to catch up with changes from %lu to %lu using version history %@ in %@", buf, 0x2Au);
                  }

                }
                *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240) = v75;
                objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 248), obj);
                v79 = *(_QWORD *)(a1 + 40);
                v80 = v70;
                v81 = *(void **)(v79 + 256);
                *(_QWORD *)(v79 + 256) = v80;
              }
              else
              {
                if (!_CPLSilentLogging)
                {
                  __CPLTaskOSLogDomain_20266();
                  v88 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218498;
                    v101 = v71 + 1;
                    v102 = 2048;
                    v103 = 20;
                    v104 = 2112;
                    v105 = v74;
                    _os_log_impl(&dword_1B03C2000, v88, OS_LOG_TYPE_DEFAULT, "Needs to re-fetch everything to catch up with changes from %lu to %lu in %@", buf, 0x20u);
                  }

                }
                v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Last supported feature version was %lu - server version is: %lu"), v71, v73);
                v109[1] = CFSTR("CPLErrorScopeIdentifiers");
                v110[0] = v81;
                v109[0] = CFSTR("CPLErrorResetReason");
                v108 = v74;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v110[1] = v89;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
                v90 = v74;
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 24, 0, v91, CFSTR("Sync state needs a refresh"));
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setError:", v92);

                v74 = v90;
                v77 = 0;
              }

            }
          }

        }
        goto LABEL_19;
      }
    }
    if (objc_msgSend(v4, "valueForFlag:forScope:", 36, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136)))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136);
          *(_DWORD *)buf = 138412290;
          v101 = v61;
          _os_log_impl(&dword_1B03C2000, v60, OS_LOG_TYPE_DEFAULT, "%@ is deleted - ignoring it", buf, 0xCu);
        }

      }
      goto LABEL_63;
    }
    objc_msgSend(v4, "transportScopeForScope:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
    v84 = objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      v63 = (void *)v84;
      v85 = *(_QWORD *)(a1 + 40);
      v86 = *(void **)(v85 + 120);
      objc_msgSend(*(id *)(v85 + 136), "scopeIdentifier");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addTransportScope:forScopeWithIdentifier:", v63, v87);

      objc_msgSend(*(id *)(a1 + 40), "_addPartnerScope:scopes:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), v4);
      goto LABEL_64;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v45 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      v93 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136);
      *(_DWORD *)buf = 138412290;
      v101 = v93;
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  objc_msgSend(v4, "flagsForScope:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "valueForFlag:", 36) && (objc_msgSend(v16, "valueForFlag:", 64) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128);
        *(_DWORD *)buf = 138412290;
        v101 = v48;
        _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_DEFAULT, "%@ is deleted - ignoring it", buf, 0xCu);
      }

    }
    v49 = *(_QWORD *)(a1 + 40);
    v37 = *(void **)(v49 + 128);
    *(_QWORD *)(v49 + 128) = 0;
    goto LABEL_45;
  }
  objc_msgSend(v4, "transportScopeForScope:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    v38 = *(_QWORD *)(a1 + 40);
    v39 = *(void **)(v38 + 120);
    objc_msgSend(*(id *)(v38 + 128), "scopeIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addTransportScope:forScopeWithIdentifier:", v37, v40);

    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CPLNetworkWatcherDelegate + 32);
    objc_msgSend(*(id *)(a1 + 40), "_addPartnerScope:scopes:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), v4);
LABEL_45:

    goto LABEL_46;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
LABEL_38:

      goto LABEL_39;
    }
    v46 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128);
    *(_DWORD *)buf = 138412290;
    v101 = v46;
LABEL_37:
    _os_log_impl(&dword_1B03C2000, v45, OS_LOG_TYPE_ERROR, "Missing transport scope for %@", buf, 0xCu);
    goto LABEL_38;
  }
LABEL_39:
  v17 = CFSTR("missing shared transport scope");
  v18 = 32;
LABEL_18:
  +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", v18, v17, v94);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setError:", v19);

LABEL_19:
LABEL_28:

}

void __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke_119(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v4 = *(_QWORD *)(a1 + 40);
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldDefer");

    if (v7)
    {
      v4 = *(_QWORD *)(a1 + 40);
      +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v4 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
    {
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10000, CFSTR("Some transport scopes are missing"));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  objc_msgSend(v9, "error");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v8 = (void *)v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);

}

uint64_t __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke_110(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setScopeNeedsUpdateFromTransport:error:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360), a2);
}

void __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  dispatch_block_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 104);
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_2;
  v23[3] = &unk_1E60D6F38;
  v24 = v12;
  v25 = v13;
  v26 = v9;
  v27 = v10;
  v28 = v11;
  v16 = v23;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20279;
  block[3] = &unk_1E60D71F8;
  v30 = v16;
  v17 = v14;
  v18 = v11;
  v19 = v10;
  v20 = v9;
  v21 = v12;
  v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v17, v22);

}

void __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  _BYTE *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *);
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *);
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "taskDidFinishWithError:");
  }
  else
  {
    v4 = objc_msgSend(v2, "isCancelled");
    v5 = *(_BYTE **)(a1 + 40);
    if (v4)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "taskDidFinishWithError:", v6);

    }
    else
    {
      v5[305] = 1;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 312), *(id *)(a1 + 48));
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 320), *(id *)(a1 + 56));
      if (CPLEnableWorkaroundFor101242629())
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 128))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = *(id *)(a1 + 56);
            objc_msgSend(v7, "rewindAnchorsPerSharingScopes");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "scopeIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              if (!_CPLSilentLogging)
              {
                __CPLTaskOSLogDomain_20266();
                v11 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "scopeIdentifier");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "scopeIdentifier");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v53 = v12;
                  v54 = 2114;
                  v55 = v13;
                  _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Will use rewind sync anchor for %{public}@ after initial queries for %{public}@", buf, 0x16u);

                }
              }
              v14 = *(_QWORD *)(a1 + 40);
              v15 = v10;
              v16 = *(void **)(v14 + 312);
              *(_QWORD *)(v14 + 312) = v15;
            }
            else
            {
              if (!_CPLSilentLogging)
              {
                __CPLTaskOSLogDomain_20266();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "scopeIdentifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "scopeIdentifier");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v53 = v18;
                  v54 = 2114;
                  v55 = v19;
                  _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Rewind sync anchor for %{public}@ is missing in %{public}@: will need to fetch full journal after initial queries", buf, 0x16u);

                }
              }
              v20 = *(_QWORD *)(a1 + 40);
              v16 = *(void **)(v20 + 312);
              *(_QWORD *)(v20 + 312) = 0;
            }

          }
        }
      }
      v21 = *(void **)(a1 + 64);
      if (v21)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 352), v21);
        v22 = *(_QWORD **)(a1 + 40);
        v23 = (void *)v22[15];
        v24 = *(_QWORD *)(a1 + 64);
        objc_msgSend(v22, "scope");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "scopeIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addTransportScope:forScopeWithIdentifier:", v24, v26);

        objc_msgSend(*(id *)(a1 + 40), "engineLibrary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "store");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "scopes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = MEMORY[0x1E0C809B0];
        v45 = MEMORY[0x1E0C809B0];
        v46 = 3221225472;
        v47 = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_102;
        v48 = &unk_1E60DD2A8;
        v49 = v29;
        v31 = *(id *)(a1 + 64);
        v32 = *(_QWORD *)(a1 + 40);
        v50 = v31;
        v51 = v32;
        v40 = v30;
        v41 = 3221225472;
        v42 = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_3;
        v43 = &unk_1E60DD838;
        v44 = v32;
        v33 = v29;
        v34 = (id)objc_msgSend(v28, "performWriteTransactionWithBlock:completionHandler:", &v45, &v40);

      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "scope");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "cplSyncAnchorDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v53 = v36;
          v54 = 2112;
          v55 = v37;
          _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_DEFAULT, "Fetched initial sync anchor for %@: %@", buf, 0x16u);

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "_launchPullTasksAndDisableQueries:", 0, v40, v41, v42, v43, v44, v45, v46, v47, v48);
    }
  }
  v38 = *(_QWORD *)(a1 + 40);
  v39 = *(void **)(v38 + 328);
  *(_QWORD *)(v38 + 328) = 0;

}

void __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_102(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_2_103;
  v6[3] = &unk_1E60DD160;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Failed to update transport scope for %@: %@", (uint8_t *)&v8, 0x16u);

    }
  }

}

uint64_t __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_2_103(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "setTransportScope:forScope:error:", v4, v5, a2);

  return v6;
}

void __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3) & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Preparing to receive batches from transport", buf, 2u);
      }

    }
    v5 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v6 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setError:", v7);
    }
    else
    {
      v9 = *(_BYTE **)(a1 + 32);
      if (v9[233])
      {
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v9, "scope");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v10, "doesScopeAllowCourtesyMingling:", v11);

        v9 = *(_BYTE **)(a1 + 32);
        if ((v10 & 1) == 0)
        {
          v9[233] = 0;
          v9 = *(_BYTE **)(a1 + 32);
        }
      }
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v9, "scope");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "transientSyncAnchorForScope:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      if (*(_BYTE *)(a1 + 64))
      {
        v49[0] = v6;
        v49[1] = 3221225472;
        v49[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_97;
        v49[3] = &unk_1E60DDA30;
        v17 = *(id *)(a1 + 40);
        v18 = *(_QWORD *)(a1 + 32);
        v50 = v17;
        v51 = v18;
        objc_msgSend(v3, "do:", v49);
        v19 = v50;
      }
      else
      {
        v20 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v20, "classOfRecordsForInitialQueryForScope:", v19);
      }

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
          v38 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "scope");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "syncAnchorForScope:", v39);
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v42 = *(void **)(v41 + 40);
          *(_QWORD *)(v41 + 40) = v40;

        }
        objc_msgSend(*(id *)(a1 + 32), "_storeInitialSyncAnchorIfNecessaryInTransaction:", v3);
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_20266();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cplSyncAnchorDescription");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "scope");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v53 = v44;
            v54 = 2112;
            v55 = v45;
            _os_log_impl(&dword_1B03C2000, v43, OS_LOG_TYPE_DEBUG, "Will fetch changes since sync anchor %@ for %@", buf, 0x16u);

          }
        }
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 0;
        goto LABEL_23;
      }
      if (_CPLSilentLogging)
      {
LABEL_23:
        v24 = *(_QWORD **)(a1 + 32);
        if (!v24[33])
        {
          objc_msgSend(v3, "error");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = *(_QWORD **)(a1 + 32);
          if (!v25)
          {
            v26 = *(void **)(a1 + 40);
            objc_msgSend(v24, "scope");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "downloadTransportGroupForScope:", v27);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = *(_QWORD *)(a1 + 32);
            v30 = *(void **)(v29 + 264);
            *(_QWORD *)(v29 + 264) = v28;

            v24 = *(_QWORD **)(a1 + 32);
            if (!v24[33])
            {
              objc_msgSend(v24, "engineLibrary");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "transport");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "createGroupForChangeDownload");
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = *(_QWORD *)(a1 + 32);
              v35 = *(void **)(v34 + 264);
              *(_QWORD *)(v34 + 264) = v33;

              v24 = *(_QWORD **)(a1 + 32);
            }
          }
        }
        v46[0] = v6;
        v46[1] = 3221225472;
        v46[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_98;
        v46[3] = &unk_1E60DDB30;
        v46[4] = v24;
        v36 = *(id *)(a1 + 40);
        v37 = *(_QWORD *)(a1 + 48);
        v47 = v36;
        v48 = v37;
        objc_msgSend(v3, "do:", v46);

        goto LABEL_28;
      }
      __CPLTaskOSLogDomain_20266();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cplQueryCursorDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v53 = v21;
        v54 = 2112;
        v55 = v22;
        v56 = 2112;
        v57 = v23;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Will query records of class %@ since cursor %@ for %@", buf, 0x20u);

      }
    }

    goto LABEL_23;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Client cache has been reset. Stopping for now", buf, 2u);
    }

  }
LABEL_28:

}

void __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  __int128 v15;
  uint8_t buf[8];
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;

  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Committed", buf, 2u);
    }

  }
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v3, "error");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v6 = *(_QWORD **)(a1 + 32);
    if (!v8)
    {
      v10 = (void *)v6[13];
      v11 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_99;
      v14[3] = &unk_1E60DD460;
      v14[4] = v6;
      v15 = *(_OWORD *)(a1 + 40);
      v12 = v14;
      *(_QWORD *)buf = v11;
      v17 = 3221225472;
      v18 = __cpl_dispatch_async_block_invoke_20279;
      v19 = &unk_1E60D71F8;
      v20 = v12;
      v9 = v10;
      v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v9, v13);

      goto LABEL_11;
    }
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  objc_msgSend(v6, "taskDidFinishWithError:", v7);
LABEL_11:

}

uint64_t __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_99(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v4)
    return objc_msgSend(v2, "_launchQueryForClass:cursor:", v4, *(_QWORD *)(v5 + 40));
  else
    return objc_msgSend(v2, "_launchFetchChangesFromSyncAnchor:", *(_QWORD *)(v5 + 40));
}

uint64_t __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_97(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "disableInitialQueriesForScope:error:", v4, a2);

  return v5;
}

uint64_t __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_98(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRewindSyncAnchorsInScopes:startSyncAnchor:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
}

void __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke()
{
  void *v0;
  BOOL v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _launchPullTasksAndDisableQueries__alwaysDisableQueries = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPLDisableQueries"));

  if (_launchPullTasksAndDisableQueries__alwaysDisableQueries)
    v1 = _CPLSilentLogging == 0;
  else
    v1 = 0;
  if (v1)
  {
    __CPLTaskOSLogDomain_20266();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Queries are disabled for this user", v3, 2u);
    }

  }
}

void __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3) & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Looking for next class to query", buf, 2u);
      }

    }
    if (!objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_86;
      v23 = &unk_1E60DDA30;
      v6 = *(id *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 32);
      v24 = v6;
      v25 = v7;
      objc_msgSend(v3, "do:", &v20);
      objc_msgSend(*(id *)(a1 + 32), "_storeInitialSyncAnchorIfNecessaryInTransaction:", v3, v20, v21, v22, v23);
      objc_msgSend(*(id *)(a1 + 40), "scopes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "classOfRecordsForInitialQueryForScope:", v9);

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_20266();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
            objc_msgSend(*(id *)(a1 + 32), "scope");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v27 = v11;
            v28 = 2112;
            v29 = v12;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Will query records of class %@ for %@", buf, 0x16u);

          }
LABEL_15:

        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "scopes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "transientSyncAnchorForScope:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_20266();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "cplSyncAnchorDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "scope");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v27 = v18;
            v28 = 2112;
            v29 = v19;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Will fetch changes since sync anchor %@ for %@", buf, 0x16u);

          }
          goto LABEL_15;
        }
      }

      goto LABEL_17;
    }
  }
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setError:", v5);

LABEL_17:
}

void __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  __int128 v15;
  uint8_t buf[8];
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;

  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Committed", buf, 2u);
    }

  }
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v3, "error");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v6 = *(_QWORD **)(a1 + 32);
    if (!v8)
    {
      v10 = (void *)v6[13];
      v11 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_88;
      v14[3] = &unk_1E60DD460;
      v14[4] = v6;
      v15 = *(_OWORD *)(a1 + 40);
      v12 = v14;
      *(_QWORD *)buf = v11;
      v17 = 3221225472;
      v18 = __cpl_dispatch_async_block_invoke_20279;
      v19 = &unk_1E60D71F8;
      v20 = v12;
      v9 = v10;
      v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v9, v13);

      goto LABEL_11;
    }
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  objc_msgSend(v6, "taskDidFinishWithError:", v7);
LABEL_11:

}

uint64_t __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_88(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v4)
    return objc_msgSend(v2, "_launchQueryForClass:cursor:", v4, *(_QWORD *)(v5 + 40));
  else
    return objc_msgSend(v2, "_launchFetchChangesFromSyncAnchor:", *(_QWORD *)(v5 + 40));
}

uint64_t __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_86(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 40);
  v6 = v5[28];
  objc_msgSend(v5, "scope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "markInitialQueryIsDoneForRecordsOfClass:forScope:error:", v6, v7, a2);

  return v8;
}

void __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 104);
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_2;
  v17[3] = &unk_1E60DD398;
  v17[4] = v7;
  v18 = v5;
  v16 = *(_OWORD *)(a1 + 40);
  v19 = v6;
  v10 = (id)v16;
  v20 = v16;
  v21 = *(_QWORD *)(a1 + 56);
  v11 = v17;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20279;
  block[3] = &unk_1E60D71F8;
  v23 = v11;
  v12 = v8;
  v13 = v6;
  v14 = v5;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  dispatch_block_t v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_2_80;
  v10[3] = &unk_1E60DD3E8;
  v11 = v3;
  v12 = *(_OWORD *)(a1 + 32);
  v6 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20279;
  block[3] = &unk_1E60D71F8;
  v14 = v6;
  v7 = v4;
  v8 = v3;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);

}

uint64_t __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_2_80(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(void **)(a1 + 32);
      v15 = 138412290;
      v16 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Query task did finish with error %@", (uint8_t *)&v15, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "scope");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 32);
        v15 = 138412802;
        v16 = v5;
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Query task for %@ in %@ did finish with error %@", (uint8_t *)&v15, 0x20u);

      }
    }
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 208);
  *(_QWORD *)(v8 + 208) = 0;

  v10 = *(void **)(a1 + 32);
  if (!v10)
    return objc_msgSend(*(id *)(a1 + 40), "_launchNextQueryTask");
  if (!objc_msgSend(v10, "isCPLErrorWithCode:", 255))
    return objc_msgSend(*(id *)(a1 + 40), "taskDidFinishWithError:", *(_QWORD *)(a1 + 32));
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "scope");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 48);
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Transport for %@ does not support queries for %@. Moving to regular initial changes fetch", (uint8_t *)&v15, 0x16u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_launchPullTasksAndDisableQueries:", 1);
}

void __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  CFAbsoluteTime v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  CFAbsoluteTime v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 232))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Query task did get a batch", (uint8_t *)&v20, 2u);
      }

      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "scope");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = CFAbsoluteTimeGetCurrent() - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          v11 = *(_QWORD *)(a1 + 40);
          v20 = 138412802;
          v21 = v9;
          v22 = 2048;
          v23 = v10;
          v24 = 2112;
          v25 = v11;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Transport successfully downloaded for %@ (query) in %.2fs %@", (uint8_t *)&v20, 0x20u);

        }
      }
    }
    *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = CFAbsoluteTimeGetCurrent();
    if (!objc_msgSend(*(id *)(a1 + 40), "count"))
      goto LABEL_29;
    if (*(_QWORD *)(a1 + 48))
    {
      v12 = *(id *)(a1 + 56);
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 48);
      if (v12 && v14)
      {
        v15 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 48));

        if (!v15)
          goto LABEL_28;
      }
      else
      {

        if (v13 || v14)
          goto LABEL_28;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 48), "cplQueryCursorDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412290;
          v21 = v17;
          _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Got some changes starting from cursor %@ and the new cursor is identical", (uint8_t *)&v20, 0xCu);

        }
      }
    }
LABEL_28:
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scheduler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resetBackoffInterval");

LABEL_29:
    objc_msgSend(*(id *)(a1 + 32), "_handleNewBatchFromQuery:queryClass:newCursor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
    return;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "summaryDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Dropping incoming %@ because we are stopping", (uint8_t *)&v20, 0xCu);

    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(double *)(a1 + 40);
        v20 = 138412546;
        v21 = v5;
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Dropping incoming batch for %@ (query) because we are stopping %@", (uint8_t *)&v20, 0x16u);

      }
    }
  }
}

void __79__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_queryClass_newCursor___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  _BYTE *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:");
  v4 = *(_BYTE **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "_storeInitialSyncAnchorIfNecessaryInTransaction:", v6);
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(*(id *)(a1 + 32), "_handleNewBatchFromQuery:newCursor:inTransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);
  }
  else
  {
    v4[232] = 1;
  }

}

void __79__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_queryClass_newCursor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = objc_msgSend(*(id *)(a1 + 32), "count");
        objc_msgSend(v3, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 134218242;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Can't store batch with %lu changes: %@", (uint8_t *)&v8, 0x16u);

      }
    }
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 232) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_cancelAllTasks");
  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 104));

}

uint64_t __81__CPLPullFromTransportScopeTask__storeInitialSyncAnchorIfNecessaryInTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 304))
    goto LABEL_2;
  if (!objc_msgSend(v5, "setHasFetchedInitialSyncAnchor:forScope:error:", 1, v6, a2))
  {
    v7 = 0;
    goto LABEL_27;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 305))
  {
    *(_BYTE *)(v8 + 305) = 0;
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "scopeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Storing initial sync anchor for %@", (uint8_t *)&v19, 0xCu);

      }
    }
    v11 = objc_msgSend(v5, "setInitialSyncAnchor:forScope:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), v6, a2);
    v12 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v13 = *(void **)(v12 + 320);
      if (v13)
      {
        objc_storeStrong((id *)(v12 + 216), v13);
        v7 = objc_msgSend(v5, "storeScopeChange:forScope:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320), v6, a2);
        v12 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v7 = 1;
      }
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(*(id *)(v12 + 320), "libraryState");
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = v16;
    if (!(_DWORD)v7 || !v16)
      goto LABEL_26;
    if (-[NSObject isDisabled](v16, "isDisabled"))
    {
      v7 = objc_msgSend(v5, "setValue:forFlag:forScope:error:", 1, 8, v6, a2);
      -[NSObject disabledDate](v14, "disabledDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!(_DWORD)v7)
      {
LABEL_25:

        goto LABEL_26;
      }
      v7 = objc_msgSend(v5, "setDisabledDate:forScope:error:", v17, v6, a2);

      if (!(_DWORD)v7)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    -[NSObject deleteDate](v14, "deleteDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "setDeleteDate:forScope:error:", v17, v6, a2);
    goto LABEL_25;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "scopeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v15;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Not storing any initial sync anchor for %@ but marking it has being alredy fetched", (uint8_t *)&v19, 0xCu);

    }
    v7 = 1;
    goto LABEL_26;
  }
LABEL_2:
  v7 = 1;
LABEL_27:

  return v7;
}

uint64_t __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueFromPendingRecordChecksIfNecessary:error:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)v7 = 134217984;
      *(_QWORD *)&v7[4] = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Storing %lu changes in transient repository", v7, 0xCu);
    }

  }
  *(_QWORD *)v7 = 0;
  result = objc_msgSend(*(id *)(a1 + 40), "appendBatch:alreadyMingled:countOfAssetChanges:error:", *(_QWORD *)(a1 + 32), 0, v7, a2);
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 392) += *(_QWORD *)v7;
  return result;
}

uint64_t __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke_73(id *a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1[4], "cplQueryCursorDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Storing transient cursor %@", buf, 0xCu);

    }
  }
  objc_msgSend(a1[5], "scopes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  objc_msgSend(a1[6], "scope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "storeTransientSyncAnchor:forScope:error:", v7, v8, a2);

  if ((_DWORD)v9 && objc_msgSend(a1[7], "count"))
  {
    v10 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10[49], CFSTR("CPLSyncProgressCountOfPulledAssetsKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 0.5;
    objc_msgSend(v10, "taskDidProgress:userInfo:", v12, v13);

  }
  return v9;
}

void __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  id v29;
  uint64_t v30;
  _QWORD block[4];
  id v32;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a1[4];
  v14 = (void *)a1[5];
  v15 = *(void **)(v13 + 104);
  v24[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_2;
  v24[3] = &unk_1E60DD2D0;
  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[4] = v13;
  v25 = v9;
  v30 = a1[6];
  v26 = v11;
  v27 = v14;
  v28 = v10;
  v29 = v12;
  v17 = v24;
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20279;
  block[3] = &unk_1E60D71F8;
  v32 = v17;
  v18 = v15;
  v19 = v12;
  v20 = v10;
  v21 = v11;
  v22 = v9;
  v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v18, v23);

}

void __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_64(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  dispatch_block_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  char v26;
  _QWORD block[4];
  id v28;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 104);
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_2_65;
  v21[3] = &unk_1E60DD320;
  v22 = v9;
  v23 = v11;
  v24 = v12;
  v25 = v10;
  v26 = a4;
  v15 = v21;
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20279;
  block[3] = &unk_1E60D71F8;
  v28 = v15;
  v16 = v13;
  v17 = v10;
  v18 = v11;
  v19 = v9;
  v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v16, v20);

}

uint64_t __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_69(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "addPartnerScope:mostCurrentSyncAnchor:", a2, a3);
}

void __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_2_65(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _BYTE *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BYTE *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(void **)(a1 + 40);
      v27 = 138412290;
      v28 = v4;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Fetch changes task did finish with error %@", (uint8_t *)&v27, 0xCu);
    }

  }
  v5 = *(id *)(a1 + 40);
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isCPLErrorWithCode:", 22) && _CPLSilentLogging == 0)
    {
      __CPLTaskOSLogDomain_20266();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Sync anchor is too old. Will need to download everything from the beginning", (uint8_t *)&v27, 2u);
      }

    }
  }
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(v9 + 200);
  *(_QWORD *)(v9 + 200) = 0;

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v12 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v13 = *(void **)(v12 + 168);
    if (v13)
    {
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(void **)(v15 + 168);
      *(_QWORD *)(v15 + 168) = v14;
    }
    else
    {
      v17 = v11;
      v16 = *(void **)(v12 + 168);
      *(_QWORD *)(v12 + 168) = v17;
    }

  }
  if (v6
    || ((v18 = *(_BYTE **)(a1 + 48), v18[232]) || objc_msgSend(v18, "isCancelled"))
    && (+[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError"),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 48), "taskDidFinishWithError:", v6);

  }
  else
  {
    v19 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend((id)v19, "_launchFetchChangesFromSyncAnchor:", v2);
    }
    else if (*(_QWORD *)(v19 + 248))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 48), "scope");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 240);
          v27 = 138412802;
          v28 = v21;
          v29 = 2048;
          v30 = v22;
          v31 = 2048;
          v32 = 20;
          _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Rewinding in %@ now to catch up with changes from %lu to %lu", (uint8_t *)&v27, 0x20u);

        }
        v19 = *(_QWORD *)(a1 + 48);
      }
      objc_msgSend((id)v19, "engineLibrary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "feedback");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "reportFetchChangesRewindToFeatureVersion:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 240));

      objc_msgSend(*(id *)(a1 + 48), "_updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 248));
    }
    else
    {
      v25 = objc_msgSend(*(id *)(v19 + 272), "count");
      v26 = *(_BYTE **)(a1 + 48);
      if (v25)
      {
        objc_msgSend(v26, "_relaunchFetchChangesFromOtherRewindSyncAnchors");
      }
      else if (v26[376])
      {
        objc_msgSend(v26, "_checkExtraRecords");
      }
      else
      {
        objc_msgSend(v26, "taskDidFinishWithError:", 0);
      }
    }
  }

}

void __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  CFAbsoluteTime v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  CFAbsoluteTime v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 232))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "summaryDescription");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Dropping incoming %@ because we are stopping", (uint8_t *)&v18, 0xCu);

      }
    }
    return;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Fetch changes task did get a batch", (uint8_t *)&v18, 2u);
    }

    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = CFAbsoluteTimeGetCurrent() - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v8 = *(_QWORD *)(a1 + 40);
        v18 = 138412802;
        v19 = v6;
        v20 = 2048;
        v21 = v7;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Transport successfully downloaded for %@ in %.2fs %@", (uint8_t *)&v18, 0x20u);

      }
    }
  }
  *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = CFAbsoluteTimeGetCurrent();
  if (*(_QWORD *)(a1 + 48))
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "count"))
    {
LABEL_30:
      objc_msgSend(*(id *)(a1 + 32), "_handleNewBatchFromChanges:updatedFlags:newSyncAnchor:partnerScopesNeedingToPullChanges:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
      return;
    }
    v9 = *(id *)(a1 + 56);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 48);
    if (v9 && v11)
    {
      v12 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 48));

      if (!v12)
      {
LABEL_29:
        objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scheduler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resetBackoffInterval");

        goto LABEL_30;
      }
    }
    else
    {

      if (v10 || v11)
        goto LABEL_29;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 56), "cplSyncAnchorDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v15;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Got some changes starting from sync anchor %@ and the new sync anchor is identical", (uint8_t *)&v18, 0xCu);

      }
    }
    goto LABEL_29;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Transport returned an empty sync anchor", (uint8_t *)&v18, 2u);
    }

  }
}

void __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke_2;
  v5[3] = &unk_1E60DD160;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "do:", v5);

}

void __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke_60(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v8, "error");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v4 = *(void **)(a1 + 32);
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "_launchFetchChangesFromSyncAnchor:", *(_QWORD *)(a1 + 40));
      goto LABEL_7;
    }
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  objc_msgSend(v4, "taskDidFinishWithError:", v5);

LABEL_7:
}

uint64_t __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Rewinding now for %@ to catch up with missed features", (uint8_t *)&v9, 0xCu);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "storeTransientSyncAnchor:forScope:error:", *(_QWORD *)(a1 + 48), v4, a2))v7 = objc_msgSend(*(id *)(a1 + 32), "_storeRewindSyncAnchors:inScopes:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), *(_QWORD *)(a1 + 40), a2);
  else
    v7 = 0;

  return v7;
}

void __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke_2;
  v7[3] = &unk_1E60DD160;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  objc_msgSend(a2, "do:", v7);

}

void __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke_54(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v11, "error");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v4 = *(_QWORD **)(a1 + 32);
    if (!v6)
    {
      v8 = (void *)v4[31];
      v4[31] = 0;

      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 256);
      *(_QWORD *)(v9 + 256) = 0;

      objc_msgSend(*(id *)(a1 + 32), "_launchFetchChangesFromSyncAnchor:", *(_QWORD *)(a1 + 40));
      goto LABEL_7;
    }
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  objc_msgSend(v4, "taskDidFinishWithError:", v5);

LABEL_7:
}

uint64_t __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "storeSupportedFeatureVersionInLastSync:forScope:error:", 20, v5, a2);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "scopes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "scope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "storeTransientSyncAnchor:forScope:error:", v8, v9, a2);

    return v10;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *a2;
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Unable to store supported feature version: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    return 0;
  }
}

void __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3);
  v5 = *(_BYTE **)(a1 + 32);
  if ((v4 & 1) == 0)
  {
    v5[232] = 1;
    goto LABEL_24;
  }
  objc_msgSend(v5, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scopes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "containsObject:", *(_QWORD *)(a1 + 40));
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "removeObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "count"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "scope");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v12;
          v13 = "Caught up with some rewind sync anchor in %@ but we might still have to rewind for additional features";
LABEL_11:
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v12;
        v13 = "No need to rewind in %@ as we we just caught up with the sync anchor we need for additional features";
        goto LABEL_11;
      }
LABEL_12:

    }
    v32[0] = v10;
    v32[1] = 3221225472;
    v32[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_46;
    v32[3] = &unk_1E60DDA30;
    v32[4] = *(_QWORD *)(a1 + 32);
    v33 = v8;
    objc_msgSend(v3, "do:", v32);

  }
  v14 = *(void **)(a1 + 48);
  if (v14)
  {
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_2;
    v28[3] = &unk_1E60DD918;
    v28[4] = *(_QWORD *)(a1 + 32);
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 88);
    v29 = v15;
    v31 = v16;
    v30 = v8;
    objc_msgSend(v3, "do:", v28);

  }
  v17 = *(void **)(a1 + 56);
  if (v17 && objc_msgSend(v17, "hasFlagUpdates"))
  {
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_48;
    v25[3] = &unk_1E60DD160;
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = *(id *)(a1 + 56);
    v27 = v8;
    objc_msgSend(v3, "do:", v25);

  }
  objc_msgSend(*(id *)(a1 + 32), "_handleNewBatchFromChanges:newSyncAnchor:inTransaction:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v3);
  if (*(_BYTE *)(a1 + 96))
  {
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_49;
    v23[3] = &unk_1E60DDA30;
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = *(id *)(a1 + 72);
    objc_msgSend(v3, "do:", v23);

  }
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_50;
    v19[3] = &unk_1E60DDA58;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v18;
    v21 = v8;
    v22 = v3;
    objc_msgSend(v22, "do:", v19);

  }
  objc_msgSend(*(id *)(a1 + 32), "_notePartnerScopesNeedingToPullChanges:scopes:inTransaction:", *(_QWORD *)(a1 + 80), v8, v3);

LABEL_24:
}

void __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = objc_msgSend(*(id *)(a1 + 32), "count");
        objc_msgSend(v3, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 134218242;
        v19 = v6;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Can't store batch with %lu changes: %@", (uint8_t *)&v18, 0x16u);

      }
    }
    v8 = (id *)(*(_QWORD *)(a1 + 40) + 112);
    v9 = *v8;
    if (*v8)
    {
LABEL_7:
      objc_storeStrong(v8, v9);
      goto LABEL_13;
    }
    objc_msgSend(v3, "error");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v10 = *(void **)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(v10, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, 1);

    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
LABEL_12:
    v14 = *(void **)(v13 + 112);
    *(_QWORD *)(v13 + 112) = v12;

    goto LABEL_13;
  }
  if ((objc_msgSend(v10, "isCancelled") & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = 138412290;
        v19 = v17;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "%@ has been cancelled while handling batches", (uint8_t *)&v18, 0xCu);
      }

    }
    v8 = (id *)(*(_QWORD *)(a1 + 40) + 112);
    v9 = *v8;
    if (*v8)
      goto LABEL_7;
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v13 = *(_QWORD *)(a1 + 40);
    goto LABEL_12;
  }
LABEL_13:
  v15 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v15 + 112))
  {
    *(_BYTE *)(v15 + 232) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_cancelAllTasks");
    v15 = *(_QWORD *)(a1 + 40);
  }
  dispatch_resume(*(dispatch_object_t *)(v15 + 104));

}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_46(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeRewindSyncAnchors:inScopes:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Updating scope info for %@", (uint8_t *)&v21, 0xCu);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 128) && objc_msgSend(*(id *)(v6 + 216), "scopeType") == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = *(id *)(a1 + 40);
        objc_msgSend(v7, "rewindAnchorsPerSharingScopesData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
LABEL_21:

          goto LABEL_22;
        }
        v9 = *(id *)(*(_QWORD *)(a1 + 32) + 216);
        objc_msgSend(v7, "rewindAnchorsPerSharingScopesData");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rewindAnchorsPerSharingScopesData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (unint64_t)v11;
        if (v10 && v11)
        {
          v13 = objc_msgSend((id)v10, "isEqual:", v11);

          if ((v13 & 1) != 0)
            goto LABEL_20;
        }
        else
        {

          if (!(v10 | v12))
          {
LABEL_20:

            goto LABEL_21;
          }
        }
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_20266();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "scope");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 138412290;
            v22 = v15;
            _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "%@ has an updated list of rewind anchors without a known shared scope - will need to check this", (uint8_t *)&v21, 0xCu);

          }
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        goto LABEL_20;
      }
    }
  }
LABEL_22:
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), *(id *)(a1 + 40));
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "storeScopeChange:forScope:error:", v17, v18, a2);

  return v19;
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_48(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Updating scope flags for %@: %@", (uint8_t *)&v12, 0x16u);

    }
  }
  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "updateFlags:forScope:error:", v8, v9, a2);

  return v10;
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_49(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 248);
  *(_QWORD *)(v4 + 248) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 256);
  *(_QWORD *)(v6 + 256) = 0;

  objc_msgSend(*(id *)(a1 + 40), "scopes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "storeSupportedFeatureVersionInLastSync:forScope:error:", 20, v9, a2);

  if ((v10 & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *a2;
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Unable to store supported feature version: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  return v10;
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_50(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Updating library state for %@", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "disabledDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "setDisabledDate:forScope:error:", v6, v8, a2);

  if (!(_DWORD)v7)
    goto LABEL_15;
  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "setValue:forFlag:forScope:error:", v6 != 0, 8, v10, a2);

  if (!(_DWORD)v9)
    goto LABEL_15;
  v11 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "deleteDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "setDeleteDate:forScope:error:", v12, v13, a2);

  if (v14)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isScopeValidInTransaction:", *(_QWORD *)(a1 + 56)) & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_20266();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "scope");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "%@ is not valid anymore, finishing sync session immediately", buf, 0xCu);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 40, CFSTR("%@ has been reset"), v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 112);
      *(_QWORD *)(v20 + 112) = v19;

    }
    v22 = 1;
  }
  else
  {
LABEL_15:
    v22 = 0;
  }

  return v22;
}

uint64_t __93__CPLPullFromTransportScopeTask__notePartnerScopesNeedingToPullChanges_scopes_inTransaction___block_invoke(uint64_t a1, _QWORD *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v5)
  {
    v6 = v5;
    v24 = a2;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_20266();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "scope");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v31 = v10;
              v32 = 2112;
              v33 = v13;
              _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "%@ (partner with %@) will need to pull changes according to sync obligations", buf, 0x16u);

            }
          }
          v14 = *(void **)(a1 + 48);
          v25 = v7;
          v15 = objc_msgSend(v14, "setScopeHasChangesToPullFromTransport:error:", v10, &v25);
          v16 = v25;

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "removeObjectForKey:", v10);
          v17 = *(void **)(*(_QWORD *)(a1 + 40) + 160);
          if (!v17)
          {
            v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v19 = *(_QWORD *)(a1 + 40);
            v20 = *(void **)(v19 + 160);
            *(_QWORD *)(v19 + 160) = v18;

            v17 = *(void **)(*(_QWORD *)(a1 + 40) + 160);
          }
          objc_msgSend(v10, "scopeIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v21);

          if (!v15)
          {

            if (v24)
            {
              v16 = objc_retainAutorelease(v16);
              v22 = 0;
              *v24 = v16;
            }
            else
            {
              v22 = 0;
            }
            goto LABEL_23;
          }
          v7 = v16;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  v22 = 1;
  v16 = v7;
LABEL_23:

  return v22;
}

void __51__CPLPullFromTransportScopeTask__checkExtraRecords__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:")
    && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "pendingRecordChecks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scopeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextBatchOfRecordsToCheckWithScopeIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v15 = *(void **)(a1 + 32);
    if (v14)
      objc_msgSend(v15, "_checkExtraRecordsWithScopedIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    else
      objc_msgSend(v15, "taskDidFinishWithError:", 0);
  }
  else
  {
    objc_msgSend(v16, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v16, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "taskDidFinishWithError:", v5);

    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v6 = *(void **)(a1 + 32);
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "taskDidFinishWithError:", v7);

    }
  }

}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  CPLRecordTargetMapping *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  CPLScopedIdentifier *v11;
  void *v12;
  void *v13;
  CPLScopedIdentifier *v14;
  CPLRecordTarget *v15;
  CFAbsoluteTime Current;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  const char *v26;
  void *v27;
  id obja;
  id obj;
  _QWORD v30[5];
  id v31;
  CFAbsoluteTime v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const char *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "taskDidFinishWithError:");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(CPLRecordTargetMapping);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = *(id *)(a1 + 40);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
          {
            v11 = [CPLScopedIdentifier alloc];
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "scopeIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v11, "initWithScopeIdentifier:identifier:", v12, v13);

            v15 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v10, v14, 0);
          }
          else
          {
            v15 = -[CPLRecordTarget initWithScopedIdentifier:]([CPLRecordTarget alloc], "initWithScopedIdentifier:", v10);
          }
          -[CPLRecordTargetMapping setTarget:forRecordWithScopedIdentifier:](v5, "setTarget:forRecordWithScopedIdentifier:", v15, v10);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v7);
    }

    Current = CFAbsoluteTimeGetCurrent();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(v17 + 120);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_2;
    v30[3] = &unk_1E60DD8C8;
    v30[4] = v17;
    v31 = v18;
    v32 = Current;
    objc_msgSend(v27, "fetchRecordsTaskForRecordsWithScopedIdentifiers:targetMapping:transportScopeMapping:completionHandler:", v31, v5, v19, v30);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 384);
    *(_QWORD *)(v21 + 384) = v20;

    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = *(void **)(*(_QWORD *)(a1 + 32) + 384);
        v25 = objc_msgSend(v24, "foreground");
        v26 = " with background priority";
        if (v25)
          v26 = " with foreground priority";
        *(_DWORD *)buf = 138412546;
        v38 = v24;
        v39 = 2080;
        v40 = v26;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEBUG, "Launching %@%s", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));

  }
}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = (void *)a1[5];
  v9 = *(void **)(v7 + 104);
  v16[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_3;
  v16[3] = &unk_1E60D6F60;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[4] = v7;
  v17 = v6;
  v18 = v8;
  v19 = v5;
  v20 = a1[6];
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20279;
  block[3] = &unk_1E60D71F8;
  v22 = v11;
  v12 = v9;
  v13 = v5;
  v14 = v6;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  CPLChangeBatch *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  CPLChangeBatch *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  NSObject *v17;
  void *v18;
  CFAbsoluteTime v19;
  void *v20;
  id v21;
  CPLChangeBatch *v22;
  id v23;
  id v24;
  _QWORD v25[6];
  _QWORD v26[5];
  id v27;
  CPLChangeBatch *v28;
  id v29;
  _BYTE *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  CPLChangeBatch *v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 384);
  *(_QWORD *)(v2 + 384) = 0;

  v4 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "taskDidFinishWithError:");
  }
  else if (objc_msgSend(v4, "isCancelled"))
  {
    v5 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskDidFinishWithError:", v24);

  }
  else
  {
    v6 = objc_alloc_init(CPLChangeBatch);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 48));
    v8 = *(void **)(a1 + 56);
    v9 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_4;
    v35[3] = &unk_1E60DD1E0;
    v10 = v7;
    v36 = v10;
    v11 = v6;
    v37 = v11;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v35);
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
    v31 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v12);
          v16 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:](CPLRecordChange, "newDeleteChangeWithScopedIdentifier:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          -[CPLChangeBatch addRecord:](v11, "addRecord:", v16);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      }
      while (v13);
    }

    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_20266();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2048;
        *(CFAbsoluteTime *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v39 = (uint64_t (*)(uint64_t, uint64_t))v11;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "Transport successfully downloaded for %@ (extra check) in %.2fs %@", buf, 0x20u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "store");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__20328;
    v40 = __Block_byref_object_dispose__20329;
    v41 = 0;
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_37;
    v26[3] = &unk_1E60DD230;
    v26[4] = *(_QWORD *)(a1 + 32);
    v21 = v20;
    v27 = v21;
    v22 = v11;
    v28 = v22;
    v29 = *(id *)(a1 + 48);
    v30 = buf;
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_3_40;
    v25[3] = &unk_1E60DDB58;
    v25[4] = *(_QWORD *)(a1 + 32);
    v25[5] = buf;
    v23 = (id)objc_msgSend(v21, "performWriteTransactionWithBlock:completionHandler:", v26, v25);

    _Block_object_dispose(buf, 8);
  }
}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", v5);
  objc_msgSend(v6, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = objc_msgSend(v6, "inExpunged");
    v10 = *(void **)(a1 + 40);
    if (v9)
    {
      v11 = (void *)objc_msgSend((id)objc_opt_class(), "newDeleteChangeWithScopedIdentifier:", v5);
      objc_msgSend(v10, "addRecord:", v11);

    }
    else
    {
      objc_msgSend(v10, "addRecord:", v6);
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "scopedIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring check for %@ which is remapped to %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_37(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;

  v18 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transientPullRepositoryInStore:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pendingRecordChecks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_2_38;
    v19[3] = &unk_1E60DD208;
    v6 = v3;
    v20 = v6;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v21 = v7;
    v22 = v8;
    v9 = v5;
    v23 = v9;
    v24 = *(id *)(a1 + 56);
    objc_msgSend(v18, "do:", v19);
    objc_msgSend(v18, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "store");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pendingRecordChecks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scopeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nextBatchOfRecordsToCheckWithScopeIdentifier:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
  }

}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_3_40(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v10, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskDidFinishWithError:", v5);

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v6 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskDidFinishWithError:", v7);

  }
  else
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v9 = *(void **)(a1 + 32);
    if (v8)
      objc_msgSend(v9, "_checkExtraRecordsWithScopedIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    else
      objc_msgSend(v9, "taskDidFinishWithError:", 0);
  }

}

uint64_t __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_2_38(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;

  v6 = 0;
  v4 = objc_msgSend(*(id *)(a1 + 32), "appendBatch:alreadyMingled:countOfAssetChanges:error:", *(_QWORD *)(a1 + 40), 0, &v6, a2);
  result = 0;
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 392) += v6;
    return objc_msgSend(*(id *)(a1 + 56), "dequeueCloudScopedIdentifiersToCheck:error:", *(_QWORD *)(a1 + 64), a2);
  }
  return result;
}

uint64_t __64__CPLPullFromTransportScopeTask_checkScopeIsValidInTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasRecordWithScopedIdentifier:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 40), "hasRecordWithScopedIdentifier:", v3) ^ 1;

  return v4;
}

uint64_t __64__CPLPullFromTransportScopeTask_checkScopeIsValidInTransaction___block_invoke_2(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  CPLScopedIdentifier *v5;
  CPLScopedIdentifier *v6;
  CPLScopedIdentifier *v7;
  void *v8;
  void *v9;
  char v11;

  v3 = a2;
  if ((objc_msgSend(a1[4], "hasRecordWithScopedIdentifier:", v3) & 1) != 0
    || (objc_msgSend(a1[5], "hasRecordWithScopedIdentifier:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v11 = 0;
    objc_msgSend(a1[6], "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v3, &v11);
    v5 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      -[CPLScopedIdentifier setScopeIndex:](v5, "setScopeIndex:", objc_msgSend(a1[7], "localIndex"));
    }
    else
    {
      v7 = [CPLScopedIdentifier alloc];
      objc_msgSend(a1[7], "scopeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:](v7, "initWithScopeIdentifier:identifier:scopeIndex:", v8, v9, objc_msgSend(a1[7], "localIndex"));

    }
    v4 = objc_msgSend(a1[8], "hasSomeChangeWithScopedIdentifier:", v6) ^ 1;

  }
  return v4;
}

uint64_t __88__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_newSyncAnchor_inTransaction___block_invoke(id *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t result;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(a1[4], "count");
      *(_DWORD *)v8 = 134217984;
      *(_QWORD *)&v8[4] = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Storing %lu changes in transient repository", v8, 0xCu);
    }

  }
  *(_QWORD *)v8 = 0;
  v6 = objc_msgSend(a1[5], "appendBatch:alreadyMingled:countOfAssetChanges:error:", a1[4], 0, v8, a2);
  result = 0;
  if (v6)
  {
    *((_QWORD *)a1[6] + 49) += *(_QWORD *)v8;
    return objc_msgSend(a1[6], "_dequeueFromPendingRecordChecksIfNecessary:error:", a1[4], a2);
  }
  return result;
}

uint64_t __88__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_newSyncAnchor_inTransaction___block_invoke_22(id *a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_20266();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1[4], "cplSyncAnchorDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "scope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Storing transient sync anchor %@ for %@", buf, 0x16u);

    }
  }
  objc_msgSend(a1[6], "scopes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[4];
  objc_msgSend(a1[5], "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "storeTransientSyncAnchor:forScope:error:", v8, v9, a2);

  if ((_DWORD)v10 && objc_msgSend(a1[7], "count"))
  {
    v11 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11[49], CFSTR("CPLSyncProgressCountOfPulledAssetsKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 0.5;
    objc_msgSend(v11, "taskDidProgress:userInfo:", v13, v14);

  }
  return v10;
}

uint64_t __57__CPLPullFromTransportScopeTask__totalAssetCountForScope__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) += result;
  return result;
}

uint64_t __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  CPLScopedIdentifier *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "scopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) + 16))())
  {
    if (objc_msgSend(v3, "isAssetChange"))
    {
      objc_msgSend(v3, "people");
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v6)
      {
        v7 = v6;
        v18 = v4;
        v8 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v20 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "personIdentifier");
            v10 = objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v11 = (void *)v10;
              v12 = [CPLScopedIdentifier alloc];
              objc_msgSend(v3, "scopedIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v12, "initRelativeToScopedIdentifier:identifier:", v13, v11);

              if (v14 && (objc_msgSend(*(id *)(a1 + 40), "hasRecordWithScopedIdentifier:", v14) & 1) == 0)
              {
                v4 = v18;
                if (!_CPLSilentLogging)
                {
                  __CPLTaskOSLogDomain_20266();
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v24 = v3;
                    v25 = 2112;
                    v26 = v14;
                    _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Can't mingle %@ prematurely because it refers to an unknown person %@", buf, 0x16u);
                  }

                }
                v15 = 0;
                goto LABEL_24;
              }
            }
            else
            {
              v14 = 0;
            }

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v7)
            continue;
          break;
        }
        v15 = 1;
        v4 = v18;
      }
      else
      {
        v15 = 1;
      }
LABEL_24:

    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke_20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[5];

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke_2;
  v10[3] = &unk_1E60DD0E8;
  v6 = *(_QWORD *)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v7 = +[CPLMingleUtility mingleChangeBatch:scope:forStore:onPutBatchInPullQueue:error:](CPLMingleUtility, "mingleChangeBatch:scope:forStore:onPutBatchInPullQueue:error:", v4, v5, v6, v10, a2);

  if (!v7)
    return 0;
  v9 = 0;
  result = objc_msgSend(*(id *)(a1 + 56), "appendBatch:alreadyMingled:countOfAssetChanges:error:", *(_QWORD *)(a1 + 32), 1, &v9, a2);
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 392) += v9;
  return result;
}

uint64_t __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_notifySchedulerPullQueueIsFull");
  return 1;
}

uint64_t __91__CPLPullFromTransportScopeTask__extractAndMinglePersonsIfPossibleFromBatch_inTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[5];

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__CPLPullFromTransportScopeTask__extractAndMinglePersonsIfPossibleFromBatch_inTransaction___block_invoke_2;
  v10[3] = &unk_1E60DD0E8;
  v6 = *(_QWORD *)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v7 = +[CPLMingleUtility mingleChangeBatch:scope:forStore:onPutBatchInPullQueue:error:](CPLMingleUtility, "mingleChangeBatch:scope:forStore:onPutBatchInPullQueue:error:", v4, v5, v6, v10, a2);

  if (!v7)
    return 0;
  v9 = 0;
  result = objc_msgSend(*(id *)(a1 + 56), "appendBatch:alreadyMingled:countOfAssetChanges:error:", *(_QWORD *)(a1 + 32), 1, &v9, a2);
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 392) += v9;
  return result;
}

uint64_t __91__CPLPullFromTransportScopeTask__extractAndMinglePersonsIfPossibleFromBatch_inTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_notifySchedulerPullQueueIsFull");
  return 1;
}

uint64_t __48__CPLPullFromTransportScopeTask__cancelAllTasks__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "cancel");
}

void __78__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFullNowIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 345))
  {
    v2 = (void *)MEMORY[0x1B5E08BF0]();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 345) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_reallyNotifySchedulerPullQueueIsFull");
    objc_autoreleasePoolPop(v2);
  }
}

void __64__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFull__block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 345))
  {
    *(_BYTE *)(v1 + 345) = 1;
    v3 = dispatch_time(0, 10000000000);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 336);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFull__block_invoke_2;
    block[3] = &unk_1E60D65B8;
    block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

void __64__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFull__block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 345))
  {
    v2 = (void *)MEMORY[0x1B5E08BF0]();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 345) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_reallyNotifySchedulerPullQueueIsFull");
    objc_autoreleasePoolPop(v2);
  }
}

@end
