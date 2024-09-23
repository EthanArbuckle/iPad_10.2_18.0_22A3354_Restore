@implementation CPLUploadPushedChangesTask

- (CPLUploadPushedChangesTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7 storedTransportGroup:(id)a8 sharedScope:(id)a9 transportScopeMapping:(id)a10 ruleGroup:(int64_t)a11 highPriority:(BOOL)a12 maxBatchSize:(unint64_t)a13 pushRepositoryPriority:(unint64_t)a14 pushRepository:(id)a15
{
  id v21;
  id v22;
  CPLUploadPushedChangesTask *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *lock;
  void *v27;
  uint64_t v28;
  CPLEngineTransport *transport;
  void *v30;
  void *v31;
  uint64_t v32;
  CPLEnginePushRepository *pushRepository;
  void *v34;
  void *v35;
  uint64_t v36;
  CPLEngineScopeStorage *scopes;
  uint64_t v38;
  CPLEngineScheduler *scheduler;
  uint64_t v40;
  NSString *scopeIdentifier;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;

  v21 = a3;
  v22 = a6;
  v46 = a8;
  v45 = a9;
  v44 = a10;
  v43 = a15;
  v47.receiver = self;
  v47.super_class = (Class)CPLUploadPushedChangesTask;
  v23 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](&v47, sel_initWithEngineLibrary_session_clientCacheIdentifier_scope_transportScope_, v21, a4, a5, v22, a7);
  if (v23)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.cpl.pushtotransport", v24);
    lock = v23->_lock;
    v23->_lock = (OS_dispatch_queue *)v25;

    -[CPLEngineSyncTask engineLibrary](v23, "engineLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "transport");
    v28 = objc_claimAutoreleasedReturnValue();
    transport = v23->_transport;
    v23->_transport = (CPLEngineTransport *)v28;

    -[CPLEngineSyncTask engineLibrary](v23, "engineLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "store");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "pushRepository");
    v32 = objc_claimAutoreleasedReturnValue();
    pushRepository = v23->_pushRepository;
    v23->_pushRepository = (CPLEnginePushRepository *)v32;

    -[CPLEngineSyncTask engineLibrary](v23, "engineLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "store");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "scopes");
    v36 = objc_claimAutoreleasedReturnValue();
    scopes = v23->_scopes;
    v23->_scopes = (CPLEngineScopeStorage *)v36;

    objc_msgSend(v21, "scheduler");
    v38 = objc_claimAutoreleasedReturnValue();
    scheduler = v23->_scheduler;
    v23->_scheduler = (CPLEngineScheduler *)v38;

    v23->_taskItem = -1;
    objc_msgSend(v22, "scopeIdentifier");
    v40 = objc_claimAutoreleasedReturnValue();
    scopeIdentifier = v23->_scopeIdentifier;
    v23->_scopeIdentifier = (NSString *)v40;

    objc_storeStrong((id *)&v23->_storedTransportGroup, a8);
    objc_storeStrong((id *)&v23->_sharedScope, a9);
    objc_storeStrong((id *)&v23->_transportScopeMapping, a10);
    v23->_ruleGroup = a11;
    v23->_highPriority = a12;
    v23->_maxBatchSize = a13;
    v23->_pushRepositoryPriority = a14;
    objc_storeStrong((id *)&v23->_pushRepository, a15);
  }

  return v23;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CPLEngineSyncTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "task:checkScopeIsValidInTransaction:", self, v4);

  return (char)self;
}

- (void)_didStartTaskWithKey:(id)a3 recordCount:(unint64_t)a4
{
  NSString *v7;
  NSString *v8;
  NSDate *v9;
  NSDate *taskStartDate;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (NSString *)a3;
  if (self->_currentTaskKey)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "%@ called too many times", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 206, CFSTR("%@ called too many times"), v15);

    abort();
  }
  self->_currentTaskKey = v7;
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  taskStartDate = self->_taskStartDate;
  self->_taskStartDate = v9;

  self->_recordCount = a4;
}

- (void)_didFinishTaskWithKey:(id)a3 error:(BOOL)a4 cancelled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  NSString *currentTaskKey;
  CPLEnginePushRepository *pushRepository;
  double v12;
  NSString *v13;
  NSDate *taskStartDate;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v5 = a5;
  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  currentTaskKey = self->_currentTaskKey;
  if (!currentTaskKey)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "%@ called without any started task", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 213, CFSTR("%@ called without any started task"), v19);

    abort();
  }
  v20 = v9;
  pushRepository = self->_pushRepository;
  -[NSDate timeIntervalSinceNow](self->_taskStartDate, "timeIntervalSinceNow");
  -[CPLEnginePushRepository updateTimingStatisticForKey:duration:recordCount:error:cancelled:](pushRepository, "updateTimingStatisticForKey:duration:recordCount:error:cancelled:", currentTaskKey, self->_recordCount, v6, v5, -v12);
  v13 = self->_currentTaskKey;
  self->_currentTaskKey = 0;

  taskStartDate = self->_taskStartDate;
  self->_taskStartDate = 0;

}

- (void)_prepareTransportGroupForOneBatch
{
  CPLEngineTransportGroup *storedTransportGroup;
  CPLEngineTransportGroup *v4;
  BOOL v5;
  CPLEngineTransportGroup *transportGroup;
  CPLEngineTransportGroup *v7;

  storedTransportGroup = self->_storedTransportGroup;
  if (storedTransportGroup)
  {
    v4 = storedTransportGroup;
    v5 = 0;
    transportGroup = self->_transportGroup;
    self->_transportGroup = v4;
  }
  else
  {
    -[CPLEngineTransport createGroupForChangeUpload](self->_transport, "createGroupForChangeUpload");
    v7 = (CPLEngineTransportGroup *)objc_claimAutoreleasedReturnValue();
    transportGroup = self->_transportGroup;
    self->_transportGroup = v7;
    v5 = 1;
  }

  self->_shouldSetupEstimatedSize = v5;
}

- (void)_popNextBatchAndContinue
{
  CPLEngineTransportUploadBatchTask *uploadTask;

  uploadTask = self->_uploadTask;
  self->_uploadTask = 0;

  self->_hasUploadedOneBatch = 1;
  -[CPLUploadPushedChangesTask _extractAndUploadOneBatch](self, "_extractAndUploadOneBatch");
}

- (void)_updateQuotaStrategyAfterSuccessInTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v4 = a3;
  if (self->_isUsingOverQuotaStrategy
    && -[CPLBeforeUploadCheckItems shouldResetExceedingQuotaOnSuccessfulUpload](self->_checkItems, "shouldResetExceedingQuotaOnSuccessfulUpload"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Uploaded batch shows user is back under quota", buf, 2u);
      }

    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__CPLUploadPushedChangesTask__updateQuotaStrategyAfterSuccessInTransaction___block_invoke;
    v6[3] = &unk_1E60DD6D0;
    v6[4] = self;
    objc_msgSend(v4, "do:", v6);
    self->_isUsingOverQuotaStrategy = 0;
    self->_resetStrategy = 1;
  }

}

- (BOOL)_markUploadedTasksDidFinishWithError:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  NSArray *uploadResourceTasks;
  NSArray *v9;
  NSObject *v10;
  NSUInteger v11;
  const char *v12;
  NSArray *v13;
  CPLUploadPushedChangesTask *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *cloudScopedIdentifiersToUploadResourceTaskErrors;
  void *v30;
  void *v31;
  BOOL v32;
  NSArray *v33;
  NSMutableDictionary *v34;
  NSArray *v36;
  CPLUploadPushedChangesTask *v37;
  void *v39;
  NSArray *obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  NSArray *v46;
  uint8_t v47[128];
  uint8_t buf[4];
  NSUInteger v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  NSArray *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  uploadResourceTasks = self->_uploadResourceTasks;
  if (uploadResourceTasks)
  {
    v9 = uploadResourceTasks;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __85__CPLUploadPushedChangesTask__markUploadedTasksDidFinishWithError_transaction_error___block_invoke;
    v45[3] = &unk_1E60DD6F8;
    v37 = self;
    v45[4] = self;
    v36 = v9;
    v46 = v36;
    objc_msgSend(a4, "addCleanupBlock:", v45);
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = -[NSArray count](self->_uploadResourceTasks, "count");
        v12 = "failed";
        v13 = self->_uploadResourceTasks;
        *(_DWORD *)buf = 134218498;
        v49 = v11;
        if (!v7)
          v12 = "succeeded";
        v50 = 2080;
        v51 = v12;
        v52 = 2112;
        v53 = v13;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Notifying upload tasks for %lu resources as %s: %@", buf, 0x20u);
      }

    }
    v14 = self;
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "store");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resourceStorage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = self->_uploadResourceTasks;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v42;
      v20 = 1;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v22, "cloudResource");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if ((v20 & 1) != 0)
          {
            objc_msgSend(v23, "identity");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "fileURL");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v39, "releaseFileURL:forResource:error:", v26, v24, a5);

          }
          -[CPLEngineSyncTask engineLibrary](v14, "engineLibrary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v7)
          {
            objc_msgSend(v27, "notifyAttachedObjectsUploadTask:didFinishWithError:", v22, v7);
          }
          else
          {
            cloudScopedIdentifiersToUploadResourceTaskErrors = v14->_cloudScopedIdentifiersToUploadResourceTaskErrors;
            objc_msgSend(v24, "itemScopedIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](cloudScopedIdentifiersToUploadResourceTaskErrors, "objectForKeyedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "notifyAttachedObjectsUploadTask:didFinishWithError:", v22, v31);

            v14 = v37;
          }

        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v18);
    }
    else
    {
      v20 = 1;
    }

    v33 = v14->_uploadResourceTasks;
    v14->_uploadResourceTasks = 0;

    v32 = v20 & 1;
  }
  else
  {
    v32 = 1;
    v14 = self;
  }
  v34 = v14->_cloudScopedIdentifiersToUploadResourceTaskErrors;
  v14->_cloudScopedIdentifiersToUploadResourceTaskErrors = 0;

  return v32;
}

- (BOOL)_discardUploadedExtractedBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outgoingResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "uploadIdentifiers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (!objc_msgSend(v9, "deleteResourcesToUploadWithUploadIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), a4))
        {

          v15 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }

  v15 = -[CPLEnginePushRepository storeExtractedBatch:error:](self->_pushRepository, "storeExtractedBatch:error:", 0, a4);
LABEL_11:

  return v15;
}

- (BOOL)_reenqueueExtractedBatchWithRejectedRecords:(id)a3 extractedBatch:(id)a4 error:(id *)a5
{
  id v8;
  CPLEnginePushRepository *pushRepository;
  int v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v8 = a3;
  if (a4)
  {
    pushRepository = self->_pushRepository;
    v17 = 0;
    v10 = -[CPLEnginePushRepository reinjectExtractedBatch:overwrittenRecordIdentifiers:error:](pushRepository, "reinjectExtractedBatch:overwrittenRecordIdentifiers:error:", a4, &v17, a5);
    v11 = v17;
    if (v10)
    {
      v12 = -[CPLEnginePushRepository storeExtractedBatch:error:](self->_pushRepository, "storeExtractedBatch:error:", 0, a5);
      LOBYTE(v10) = v12;
      if (v8)
      {
        if (v12)
        {
          objc_msgSend(v8, "removeRejectedRecordsWithScopedIdentifiers:", v11);
          -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "store");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "quarantinedRecords");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v10) = objc_msgSend(v15, "bumpRejectedRecords:error:", v8, a5);

        }
      }
    }

  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)_clearUploadBatch
{
  CPLChangeBatch *diffedBatch;
  CPLChangeBatch *batchToCommit;
  CPLBeforeUploadCheckItems *checkItems;
  CPLRecordTargetMapping *targetMapping;

  diffedBatch = self->_diffedBatch;
  self->_diffedBatch = 0;

  batchToCommit = self->_batchToCommit;
  self->_batchToCommit = 0;

  checkItems = self->_checkItems;
  self->_checkItems = 0;

  targetMapping = self->_targetMapping;
  self->_targetMapping = 0;

}

- (void)_checkPrioritiesWithFetchCache:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;

  v5 = a3;
  -[CPLBeforeUploadCheckItems itemsToReinject](self->_checkItems, "itemsToReinject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_mustConsiderOtherPriorities)
  {
    self->_mustConsiderOtherPriorities = 1;
  }
  else
  {
    v8 = objc_msgSend(v6, "count");
    self->_mustConsiderOtherPriorities = v8 != 0;
    if (!v8)
    {
      -[CPLUploadPushedChangesTask _generateNeededDerivativesWithFetchCache:](self, "_generateNeededDerivativesWithFetchCache:", v5);
      goto LABEL_5;
    }
  }
  -[CPLEngineScopedTask store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke;
  v15[3] = &unk_1E60DD7E8;
  v15[4] = self;
  v16 = v9;
  v17 = v7;
  v18 = a2;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_43;
  v13[3] = &unk_1E60DD810;
  v13[4] = self;
  v14 = v5;
  v11 = v9;
  v12 = (id)objc_msgSend(v11, "performWriteTransactionWithBlock:completionHandler:", v15, v13);

LABEL_5:
}

- (void)_checkForRecordExistence
{
  void *v4;
  CFAbsoluteTime Current;
  CPLEngineTransport *transport;
  CPLRecordTargetMapping *targetMapping;
  CPLTransportScopeMapping *transportScopeMapping;
  CPLEngineTransportFetchRecordsTask *v9;
  CPLEngineTransportFetchRecordsTask *fetchRecordsTask;
  CPLEngineTransportFetchRecordsTask *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[8];
  _QWORD v17[5];
  id v18;
  CFAbsoluteTime v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[CPLUploadPushedChangesTask _uploadTaskDidFinishWithError:](self, "_uploadTaskDidFinishWithError:", v15);

    return;
  }
  -[CPLBeforeUploadCheckItems recordsToFetch](self->_checkItems, "recordsToFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    -[CPLUploadPushedChangesTask _checkPrioritiesWithFetchCache:](self, "_checkPrioritiesWithFetchCache:", 0);
    goto LABEL_11;
  }
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("checking records on server"));
  Current = CFAbsoluteTimeGetCurrent();
  -[CPLUploadPushedChangesTask _didStartTaskWithKey:recordCount:](self, "_didStartTaskWithKey:recordCount:", CFSTR("existence-check"), objc_msgSend(v4, "count"));
  -[CPLRecordTargetMapping startTrackingUpdates](self->_targetMapping, "startTrackingUpdates");
  transport = self->_transport;
  targetMapping = self->_targetMapping;
  transportScopeMapping = self->_transportScopeMapping;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke;
  v17[3] = &unk_1E60DD8C8;
  v17[4] = self;
  v18 = v4;
  v19 = Current;
  -[CPLEngineTransport fetchRecordsTaskForRecordsWithScopedIdentifiers:targetMapping:transportScopeMapping:completionHandler:](transport, "fetchRecordsTaskForRecordsWithScopedIdentifiers:targetMapping:transportScopeMapping:completionHandler:", v18, targetMapping, transportScopeMapping, v17);
  v9 = (CPLEngineTransportFetchRecordsTask *)objc_claimAutoreleasedReturnValue();
  fetchRecordsTask = self->_fetchRecordsTask;
  self->_fetchRecordsTask = v9;

  v11 = self->_fetchRecordsTask;
  if (!v11)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "We should have a task to check for existing records here", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 619, CFSTR("We should have a task to check for existing records here"));

    abort();
  }
  if (self->_highPriority)
    goto LABEL_8;
  if (!-[CPLBeforeUploadCheckItems willUploadSomeResources](self->_checkItems, "willUploadSomeResources"))
  {
    v11 = self->_fetchRecordsTask;
LABEL_8:
    -[CPLEngineTransportFetchRecordsTask setHighPriorityBackground:](v11, "setHighPriorityBackground:", 1);
  }
  -[CPLEngineTransportFetchRecordsTask setAllowsFetchCache:](self->_fetchRecordsTask, "setAllowsFetchCache:", 1);
  -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", self->_fetchRecordsTask, self->_transportGroup);

LABEL_11:
}

- (BOOL)_shouldUploadBatchesWithDropReason:(id *)a3 shouldQuarantineRecords:(BOOL *)a4 inTransaction:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  -[CPLEngineSyncTask delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "task:shouldUploadBatchesWithDropReason:shouldQuarantineRecords:inTransaction:", self, a3, a4, v8);

  return (char)a4;
}

- (void)_extractBatchWithTransaction:(id)a3 andStore:(id)a4
{
  id v6;
  id v7;
  id v8;
  __int128 v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  CPLBatchExtractionStrategy *currentStrategy;
  void *v14;
  CPLBatchExtractionStrategy *v15;
  CPLEngineScopeStorage *scopes;
  void *v17;
  CPLEngineScopeStorage *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  CPLBatchExtractionStrategy *v22;
  void *v23;
  CPLBatchExtractionStrategy *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  BOOL v32;
  id v33;
  NSObject *v34;
  CPLChangeBatch *v35;
  CPLChangeBatch *diffedBatch;
  void *v37;
  int v38;
  NSObject *v39;
  CPLChangeBatch *v40;
  int v41;
  void *v42;
  NSObject *v43;
  NSString *scopeIdentifier;
  uint64_t v45;
  __int128 v46;
  void *v47;
  void *v48;
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[5];
  id v52;
  id v53;
  _BYTE *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  _BYTE *v58;
  uint64_t *v59;
  char v60;
  id v61;
  char v62;
  _QWORD v63[6];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint8_t v70[4];
  CPLChangeBatch *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  uint64_t v75;
  _BYTE buf[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
  {
    v8 = v7;
    objc_msgSend(v7, "cloudCache");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "idMapping");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v9 = 138412546;
    v46 = v9;
    while (1)
    {
      objc_msgSend(v6, "error", v46);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (!v11)
      {
LABEL_66:

        v7 = v8;
        goto LABEL_67;
      }
      v12 = (void *)MEMORY[0x1B5E08BF0]();
      v64 = 0;
      v65 = &v64;
      v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__21278;
      v68 = __Block_byref_object_dispose__21279;
      v69 = 0;
      if (!self->_resetStrategy)
        goto LABEL_7;
      currentStrategy = self->_currentStrategy;
      if (currentStrategy)
      {
        -[CPLBatchExtractionStrategy name](currentStrategy, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = self->_currentStrategy;
        self->_currentStrategy = 0;

        self->_resetStrategy = 0;
      }
      else
      {
LABEL_7:
        v14 = 0;
      }
      if (!self->_currentStrategy)
        break;
LABEL_35:
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke;
      v63[3] = &unk_1E60DD7C0;
      v63[4] = self;
      v63[5] = &v64;
      objc_msgSend(v6, "do:", v63);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v77 = __Block_byref_object_copy__21278;
      v78 = __Block_byref_object_dispose__21279;
      objc_msgSend((id)v65[5], "batch");
      v79 = (id)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v31 = v8;
        v62 = 0;
        v61 = 0;
        v32 = -[CPLUploadPushedChangesTask _shouldUploadBatchesWithDropReason:shouldQuarantineRecords:inTransaction:](self, "_shouldUploadBatchesWithDropReason:shouldQuarantineRecords:inTransaction:", &v61, &v62, v6);
        v33 = v61;
        if (v32)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_21238();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              v35 = *(CPLChangeBatch **)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v70 = 138412290;
              v71 = v35;
              _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEBUG, "Translating local batch to cloud batch: %@", v70, 0xCu);
            }

          }
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_62;
          v51[3] = &unk_1E60DD918;
          v51[4] = self;
          v52 = v48;
          v54 = buf;
          v53 = v47;
          objc_msgSend(v6, "do:", v51);
          diffedBatch = self->_diffedBatch;
          if (diffedBatch)
          {
            if (-[CPLChangeBatch count](diffedBatch, "count")
              || CFAbsoluteTimeGetCurrent() - self->_startOfIteration > 3.0
              || (-[CPLEngineSyncTask session](self, "session"),
                  v37 = (void *)objc_claimAutoreleasedReturnValue(),
                  v38 = objc_msgSend(v37, "shouldDefer"),
                  v37,
                  v38))
            {
              if (!_CPLSilentLogging)
              {
                __CPLTaskOSLogDomain_21238();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  v40 = self->_diffedBatch;
                  *(_DWORD *)v70 = 138412290;
                  v71 = v40;
                  _os_log_impl(&dword_1B03C2000, v39, OS_LOG_TYPE_DEBUG, "Cloud batch is: %@", v70, 0xCu);
                }

              }
              v50[0] = MEMORY[0x1E0C809B0];
              v50[1] = 3221225472;
              v50[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_63;
              v50[3] = &unk_1E60DD7C0;
              v50[4] = self;
              v50[5] = &v64;
              objc_msgSend(v6, "do:", v50);
LABEL_50:
              v41 = 0;
              LODWORD(v42) = 3;
LABEL_59:

              if (v41)
LABEL_60:
                LODWORD(v42) = 0;

              goto LABEL_62;
            }
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_2;
            v49[3] = &unk_1E60DD7C0;
            v49[4] = self;
            v49[5] = &v64;
            objc_msgSend(v6, "do:", v49);
            objc_msgSend(v6, "error");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              -[CPLUploadPushedChangesTask _clearUploadBatch](self, "_clearUploadBatch");
              goto LABEL_50;
            }
          }
          else
          {
            LODWORD(v42) = 0;
          }
          v41 = 1;
          goto LABEL_59;
        }
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_21238();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            scopeIdentifier = self->_scopeIdentifier;
            v45 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v70 = 138543874;
            v71 = (CPLChangeBatch *)scopeIdentifier;
            v72 = 2112;
            v73 = v33;
            v74 = 2112;
            v75 = v45;
            _os_log_impl(&dword_1B03C2000, v43, OS_LOG_TYPE_DEFAULT, "Discarding batch to push because %{public}@ is read-only (%@): %@", v70, 0x20u);
          }

          v31 = v8;
        }
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_61;
        v55[3] = &unk_1E60DD8F0;
        v58 = buf;
        v55[4] = self;
        v60 = v62;
        v56 = v31;
        v57 = v33;
        v59 = &v64;
        objc_msgSend(v6, "do:", v55);

        goto LABEL_60;
      }
      LODWORD(v42) = 3;
LABEL_62:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v64, 8);
      objc_autoreleasePoolPop(v12);
      if ((_DWORD)v42)
        goto LABEL_66;
    }
    scopes = self->_scopes;
    -[CPLEngineScopedTask scope](self, "scope");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isUsingOverQuotaStrategy = -[CPLEngineScopeStorage valueForFlag:forScope:](scopes, "valueForFlag:forScope:", 2, v17);

    if (!self->_isUsingOverQuotaStrategy)
    {
      +[CPLBatchExtractionStrategy usualStrategyWithStorage:coveringScopeIdentifier:](CPLBatchExtractionStrategy, "usualStrategyWithStorage:coveringScopeIdentifier:", self->_batchStorage, self->_scopeIdentifier);
      v22 = (CPLBatchExtractionStrategy *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    if (!self->_pushRepositoryPriority)
    {
      v18 = self->_scopes;
      -[CPLEngineScopedTask scope](self, "scope");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      self->_shouldCheckAssetsWithServerWhenOverQuota = -[CPLEngineScopeStorage shouldCheckAssetsWithServerWhenOverQuotaForScope:](v18, "shouldCheckAssetsWithServerWhenOverQuotaForScope:", v19);

      if (self->_shouldCheckAssetsWithServerWhenOverQuota)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_21238();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            -[CPLEngineScopedTask scope](self, "scope");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v21;
            _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Will check assets of %@ with server when over-quota", buf, 0xCu);

          }
LABEL_19:

        }
      }
      else if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[CPLEngineScopedTask scope](self, "scope");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v23;
          _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Will check assets of %@ only against cloud cache when over-quota", buf, 0xCu);

        }
        goto LABEL_19;
      }
    }
    +[CPLBatchExtractionStrategy overQuotaStrategyWithStorage:coveringScopeIdentifier:](CPLBatchExtractionStrategy, "overQuotaStrategyWithStorage:coveringScopeIdentifier:", self->_batchStorage, self->_scopeIdentifier);
    v22 = (CPLBatchExtractionStrategy *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v24 = self->_currentStrategy;
    self->_currentStrategy = v22;

    -[CPLBatchExtractionStrategy setMaximumRecordCountPerBatch:](self->_currentStrategy, "setMaximumRecordCountPerBatch:", self->_maxBatchSize);
    if (v14)
    {
      if (_CPLSilentLogging)
      {
LABEL_34:
        -[CPLEnginePushRepository setExtractionStrategy:](self->_pushRepository, "setExtractionStrategy:", self->_currentStrategy);
        goto LABEL_35;
      }
      __CPLTaskOSLogDomain_21238();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLBatchExtractionStrategy name](self->_currentStrategy, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v46;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_DEFAULT, "Changing extraction strategy from %@ to %@", buf, 0x16u);

      }
    }
    else
    {
      v27 = _CPLSilentLogging;
      if (!self->_isUsingOverQuotaStrategy || _CPLSilentLogging)
      {
LABEL_30:
        if (!v27)
        {
          __CPLTaskOSLogDomain_21238();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            -[CPLBatchExtractionStrategy stepsDescription](self->_currentStrategy, "stepsDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v30;
            _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEBUG, "Strategy steps: %@", buf, 0xCu);

          }
        }
        goto LABEL_34;
      }
      __CPLTaskOSLogDomain_21238();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLBatchExtractionStrategy name](self->_currentStrategy, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v28;
        _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_DEFAULT, "Will use extraction strategy %@", buf, 0xCu);

      }
    }

    v27 = _CPLSilentLogging;
    goto LABEL_30;
  }
LABEL_67:

}

- (void)_uploadBatchWithFetchCache:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  CFAbsoluteTime Current;
  CPLEngineTransport *transport;
  void *v9;
  CPLRecordTargetMapping *targetMapping;
  CPLTransportScopeMapping *transportScopeMapping;
  id v12;
  id v13;
  CPLEngineTransportUploadBatchTask *v14;
  CPLEngineTransportUploadBatchTask *uploadTask;
  CPLEngineTransportUploadBatchTask *v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  int v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  CPLUploadPushedChangesTask *v28;
  id v29;
  id v30;
  CFAbsoluteTime v31;
  _QWORD v32[5];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLUploadPushedChangesTask _uploadTaskDidFinishWithError:](self, "_uploadTaskDidFinishWithError:", v5);
  }
  else
  {
    -[CPLBeforeUploadCheckItems batchToUpload](self->_checkItems, "batchToUpload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("uploading batch"));
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v5;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Launching transport upload task for %@", buf, 0xCu);
        }

      }
      Current = CFAbsoluteTimeGetCurrent();
      -[CPLUploadPushedChangesTask _didStartTaskWithKey:recordCount:](self, "_didStartTaskWithKey:recordCount:", CFSTR("upload"), objc_msgSend(v5, "count"));
      -[CPLRecordTargetMapping startTrackingUpdates](self->_targetMapping, "startTrackingUpdates");
      transport = self->_transport;
      -[CPLEngineScopedTask scope](self, "scope");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      targetMapping = self->_targetMapping;
      transportScopeMapping = self->_transportScopeMapping;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke;
      v32[3] = &unk_1E60DD968;
      v32[4] = self;
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_3;
      v27 = &unk_1E60DD990;
      v28 = self;
      v31 = Current;
      v12 = v4;
      v29 = v12;
      v13 = v5;
      v30 = v13;
      -[CPLEngineTransport uploadBatchTaskForBatch:scope:targetMapping:transportScopeMapping:progressHandler:completionHandler:](transport, "uploadBatchTaskForBatch:scope:targetMapping:transportScopeMapping:progressHandler:completionHandler:", v13, v9, targetMapping, transportScopeMapping, v32, &v24);
      v14 = (CPLEngineTransportUploadBatchTask *)objc_claimAutoreleasedReturnValue();
      uploadTask = self->_uploadTask;
      self->_uploadTask = v14;

      v16 = self->_uploadTask;
      if (v16)
      {
        -[CPLEngineTransportUploadBatchTask setSharedScope:](v16, "setSharedScope:", self->_sharedScope);
        -[CPLEngineTransportUploadBatchTask setAllowsFetchCache:](self->_uploadTask, "setAllowsFetchCache:", 1);
        -[CPLEngineTransportUploadBatchTask setFetchCache:](self->_uploadTask, "setFetchCache:", v12);
        if (self->_highPriority
          || !-[CPLBeforeUploadCheckItems willUploadSomeResources](self->_checkItems, "willUploadSomeResources"))
        {
          -[CPLEngineTransportUploadBatchTask setHighPriorityBackground:](self->_uploadTask, "setHighPriorityBackground:", 1);
        }
        if (self->_shouldSetupEstimatedSize)
        {
          v17 = -[CPLBeforeUploadCheckItems countOfAssetsWithResourcesToUpload](self->_checkItems, "countOfAssetsWithResourcesToUpload");
          if (v17)
            -[CPLEngineTransportGroup setRoughCPLRecordCount:](self->_transportGroup, "setRoughCPLRecordCount:", v17);
          v18 = -[CPLBeforeUploadCheckItems estimatedUploadResourceSize](self->_checkItems, "estimatedUploadResourceSize");
          if (v18)
            -[CPLEngineTransportGroup setRoughCPLUploadEstimatedSize:](self->_transportGroup, "setRoughCPLUploadEstimatedSize:", v18);
        }
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_21238();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v20 = -[CPLEngineTransportUploadBatchTask foreground](self->_uploadTask, "foreground");
            v21 = " with background priority";
            if (v20)
              v21 = " with foreground priority";
            *(_DWORD *)buf = 138412546;
            v34 = v13;
            v35 = 2080;
            v36 = v21;
            _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEBUG, "Starting to upload %@%s", buf, 0x16u);
          }

        }
        -[CPLEngineTransportUploadBatchTask foreground](self->_uploadTask, "foreground");
        -[CPLEngineTransportUploadBatchTask hash](self->_uploadTask, "hash");
        kdebug_trace();
        -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", self->_uploadTask, self->_transportGroup);
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_21238();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v13;
            _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_ERROR, "Can't create a transport upload task for %@", buf, 0xCu);
          }

        }
        +[CPLErrors underlyingErrorWithReason:](CPLErrors, "underlyingErrorWithReason:", CFSTR("Can't create an upload task for %@"), v13, v24, v25, v26, v27, v28, v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLUploadPushedChangesTask _uploadTaskDidFinishWithError:](self, "_uploadTaskDidFinishWithError:", v23);

      }
    }
    else
    {
      -[CPLUploadPushedChangesTask _extractAndUploadOneBatch](self, "_extractAndUploadOneBatch");
    }
  }

}

- (void)_deleteGeneratedResourcesAfterError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7 || -[CPLEngineSyncTask diskPressureState](self, "diskPressureState"))
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "derivativesCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "discardCache");

  }
}

- (BOOL)_copyResourceChangeFromChange:(id)a3 toChange:(id)a4 fingerprintScheme:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  CPLUploadPushedChangesTask *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__21278;
  v31 = __Block_byref_object_dispose__21279;
  v32 = 0;
  objc_msgSend(v11, "propertiesForChangeType:", 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isForStableHash"))
  {
    objc_msgSend(v11, "cplCopyProperties:fromObject:withCopyBlock:", v13, v10, 0);
  }
  else
  {
    +[CPLFingerprintScheme fingerprintSchemeForStableHash](CPLFingerprintScheme, "fingerprintSchemeForStableHash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineSyncTask session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __93__CPLUploadPushedChangesTask__copyResourceChangeFromChange_toChange_fingerprintScheme_error___block_invoke;
    v21[3] = &unk_1E60DD9B8;
    v25 = &v33;
    v16 = v15;
    v26 = &v27;
    v22 = v16;
    v23 = self;
    v17 = v14;
    v24 = v17;
    objc_msgSend(v11, "cplCopyProperties:fromObject:withCopyBlock:", v13, v10, v21);

  }
  v18 = *((unsigned __int8 *)v34 + 24);
  if (a6 && !*((_BYTE *)v34 + 24))
  {
    *a6 = objc_retainAutorelease((id)v28[5]);
    v18 = *((unsigned __int8 *)v34 + 24);
  }
  v19 = v18 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (void)_generateDerivativesForNextRecord:(id)a3 usingDerivativesCache:(id)a4 fetchCache:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  CPLDerivativesFilter *derivativesFilter;
  id v18;
  id v19;
  OS_dispatch_queue *lock;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  dispatch_block_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  -[CPLEngineSyncTask session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldDefer");

  if (v12)
  {
    -[CPLUploadPushedChangesTask _didFinishTaskWithKey:error:cancelled:](self, "_didFinishTaskWithKey:error:cancelled:", CFSTR("derivatives"), 1, 0);
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v13;
    -[CPLUploadPushedChangesTask _uploadTaskDidFinishWithError:](self, "_uploadTaskDidFinishWithError:", v13);
    goto LABEL_6;
  }
  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
  {
    -[CPLUploadPushedChangesTask _didFinishTaskWithKey:error:cancelled:](self, "_didFinishTaskWithKey:error:cancelled:", CFSTR("derivatives"), 0, 1);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v8, "nextObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = +[CPLTransaction newTransactionWithIdentifier:description:keepPower:](CPLTransaction, "newTransactionWithIdentifier:description:keepPower:", CFSTR("cpl.generatederivatives"), CFSTR("generating derivatives"), 1);
    objc_msgSend(v14, "fingerprintScheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    derivativesFilter = self->_derivativesFilter;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __97__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache___block_invoke;
    v27[3] = &unk_1E60DDA08;
    v27[4] = self;
    v28 = v14;
    v29 = v16;
    v30 = v8;
    v31 = v9;
    v32 = v10;
    v33 = v15;
    v18 = v15;
    v19 = v16;
    objc_msgSend(v31, "generateDerivativesForChange:derivativesFilter:fingerprintScheme:completionHandler:", v28, derivativesFilter, v19, v27);

  }
  else
  {
    lock = self->_lock;
    v21 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __97__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache___block_invoke_3;
    v25[3] = &unk_1E60D6F88;
    v25[4] = self;
    v26 = v10;
    v22 = v25;
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_21285;
    block[3] = &unk_1E60D71F8;
    v35 = v22;
    v23 = lock;
    v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v23, v24);

  }
LABEL_6:

}

- (void)_generateNeededDerivativesWithFetchCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD);
  CPLEngineAcquireReschedulerTask *v16;
  CPLEngineAcquireReschedulerTask *acquireReschedulerTask;
  CPLEngineAcquireReschedulerTask *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  CPLUploadPushedChangesTask *v23;
  id v24;

  v4 = a3;
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("generating derivatives"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  -[CPLBeforeUploadCheckItems recordsNeedingGeneratedDerivatives](self->_checkItems, "recordsNeedingGeneratedDerivatives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldGenerateDerivatives");

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __71__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache___block_invoke;
      v21[3] = &unk_1E60D6EC0;
      v22 = v5;
      v23 = self;
      v24 = v4;
      v10 = (void (**)(_QWORD))MEMORY[0x1B5E08DC4](v21);
      -[CPLEngineSyncTask session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "needsToAcquireRescheduler");

      if (!v12)
      {
        v10[2](v10);
LABEL_14:

        goto LABEL_15;
      }
      -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transport");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __71__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache___block_invoke_2;
      v19[3] = &unk_1E60D7330;
      v19[4] = self;
      v15 = v10;
      v20 = v15;
      objc_msgSend(v14, "acquireReschedulerTaskWithCompletionHandler:", v19);
      v16 = (CPLEngineAcquireReschedulerTask *)objc_claimAutoreleasedReturnValue();
      acquireReschedulerTask = self->_acquireReschedulerTask;
      self->_acquireReschedulerTask = v16;

      v18 = self->_acquireReschedulerTask;
      if (!v18)
      {
        v15[2](v15);
        goto LABEL_13;
      }
      if (!self->_highPriority)
      {
        if (-[CPLBeforeUploadCheckItems willUploadSomeResources](self->_checkItems, "willUploadSomeResources"))
        {
LABEL_9:
          -[CPLEngineAcquireReschedulerTask setAllowsFetchCache:](self->_acquireReschedulerTask, "setAllowsFetchCache:", 1);
          -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", self->_acquireReschedulerTask, self->_transportGroup);
LABEL_13:

          goto LABEL_14;
        }
        v18 = self->_acquireReschedulerTask;
      }
      -[CPLEngineAcquireReschedulerTask setHighPriorityBackground:](v18, "setHighPriorityBackground:", 1);
      goto LABEL_9;
    }
  }
  -[CPLUploadPushedChangesTask _uploadBatchWithFetchCache:](self, "_uploadBatchWithFetchCache:", v4);
LABEL_15:

}

- (BOOL)_canUseOverQuotaRule
{
  void *v2;
  _BOOL4 v3;

  -[CPLEngineScopedTask scope](self, "scope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CPLScopeChange scopeWithTypeHasQuota:](CPLScopeChange, "scopeWithTypeHasQuota:", objc_msgSend(v2, "scopeType"));

  if (v3)
    return !+[CPLUploadPushedChangesTask disableOverQuotaRule](CPLUploadPushedChangesTask, "disableOverQuotaRule");
  else
    return 0;
}

- (void)_prepareUploadBatch
{
  OS_dispatch_queue *lock;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("preparing batch"));
  lock = self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_21285;
  block[3] = &unk_1E60D71F8;
  v10 = v5;
  v6 = lock;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (void)_noteSuccessfulUpdateInTransaction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CPLEngineSyncTask delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "task:noteSuccessfulUpdateInTransaction:", self, v5);

  -[CPLUploadPushedChangesTask _updateQuotaStrategyAfterSuccessInTransaction:](self, "_updateQuotaStrategyAfterSuccessInTransaction:", v5);
}

- (void)_extractAndUploadOneBatch
{
  NSObject *v4;
  OS_dispatch_queue *lock;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  _QWORD v10[8];
  _QWORD v11[3];
  char v12;
  _QWORD v13[3];
  char v14;
  uint8_t buf[8];
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;

  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("extracting batch"));
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Uploading one batch to transport", buf, 2u);
    }

  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  lock = self->_lock;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke;
  v10[3] = &unk_1E60DDAF8;
  v10[4] = self;
  v10[5] = v11;
  v10[6] = v13;
  v10[7] = a2;
  v7 = v10;
  *(_QWORD *)buf = v6;
  v16 = 3221225472;
  v17 = __cpl_dispatch_async_block_invoke_21285;
  v18 = &unk_1E60D71F8;
  v19 = v7;
  v8 = lock;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v8, v9);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

- (void)launch
{
  NSObject *v3;
  NSString *scopeIdentifier;
  unint64_t pushRepositoryPriority;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      scopeIdentifier = self->_scopeIdentifier;
      pushRepositoryPriority = self->_pushRepositoryPriority;
      *(_DWORD *)buf = 138543618;
      v11 = scopeIdentifier;
      v12 = 2048;
      v13 = pushRepositoryPriority;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Launching changes upload for %{public}@ (priority %lu)", buf, 0x16u);
    }

  }
  -[CPLEngineScopedTask store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__CPLUploadPushedChangesTask_launch__block_invoke;
  v9[3] = &unk_1E60DD838;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__CPLUploadPushedChangesTask_launch__block_invoke_3;
  v8[3] = &unk_1E60DD838;
  v7 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v9, v8);

}

- (void)cancel:(BOOL)a3
{
  OS_dispatch_queue *lock;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  _QWORD v10[5];
  objc_super v11;
  _QWORD v12[5];
  _QWORD block[4];
  id v14;

  if (a3)
  {
    lock = self->_lock;
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__CPLUploadPushedChangesTask_cancel___block_invoke;
    v12[3] = &unk_1E60D65B8;
    v6 = v12;
    v12[4] = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLUploadPushedChangesTask;
    -[CPLEngineSyncTask cancel](&v11, sel_cancel);
    lock = self->_lock;
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__CPLUploadPushedChangesTask_cancel___block_invoke_109;
    v10[3] = &unk_1E60D65B8;
    v6 = v10;
    v10[4] = self;
  }
  v7 = v6;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_21285;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = lock;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v9);

}

- (void)cancel
{
  -[CPLUploadPushedChangesTask cancel:](self, "cancel:", 0);
}

- (void)_excludeScopeFromMingling
{
  void *v3;
  void *v4;
  id v5;

  -[CPLEngineSyncTask session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "excludeScopeIdentifierFromMingling:", self->_scopeIdentifier);

  if (self->_sharedScope)
  {
    -[CPLEngineSyncTask session](self, "session");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CPLEngineScope scopeIdentifier](self->_sharedScope, "scopeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "excludeScopeIdentifierFromMingling:", v4);

  }
}

- (BOOL)_shouldNotTrustCloudCacheAfterError:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "isCPLError"))
  {
    v4 = objc_msgSend(v3, "code");
    v6 = v4 == 25 || v4 == 80;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_uploadTaskDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[6];
  _QWORD v11[6];
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("cleaning"));
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Upload finished (error: %@)", (uint8_t *)&buf, 0xCu);
    }

  }
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__21278;
  v15 = __Block_byref_object_dispose__21279;
  v8 = v4;
  v16 = v8;
  v10[5] = &buf;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke;
  v11[3] = &unk_1E60DDB58;
  v11[4] = self;
  v11[5] = &buf;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_115;
  v10[3] = &unk_1E60DDB58;
  v10[4] = self;
  v9 = (id)objc_msgSend(v7, "performWriteTransactionWithBlock:completionHandler:", v11, v10);
  _Block_object_dispose(&buf, 8);

}

- (BOOL)didUseOverQuotaStrategy
{
  return self->_isUsingOverQuotaStrategy;
}

- (id)taskIdentifier
{
  if (self->_highPriority)
    return CFSTR("engine.sync.pushtotransport.upload.highpriority");
  else
    return CFSTR("engine.sync.pushtotransport.upload");
}

- (BOOL)_willNeedToAccessScopeWithIdentifier:(id)a3 primaryScope:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSMutableDictionary *invalidTransportScopes;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  NSObject *v29;
  void *v30;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  SEL v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v6 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!-[CPLTransportScopeMapping hasConcreteScopeForScopeWithIdentifier:](self->_transportScopeMapping, "hasConcreteScopeForScopeWithIdentifier:", v9))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_invalidTransportScopes, "objectForKeyedSubscript:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a5)
      {
LABEL_5:
        v12 = objc_retainAutorelease(v11);
        v10 = 0;
        *a5 = v12;
LABEL_49:

        goto LABEL_50;
      }
LABEL_42:
      v10 = 0;
      v12 = v11;
      goto LABEL_49;
    }
    -[CPLEngineScopeStorage scopeWithIdentifier:](self->_scopes, "scopeWithIdentifier:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = a2;
    if (!v13)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v39 = v9;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "Additional requested scope %{public}@ is unknown", buf, 0xCu);
        }

      }
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 2001, CFSTR("unknown scope"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_38;
    }
    -[CPLEngineScopeStorage flagsForScope:](self->_scopes, "flagsForScope:", v13);
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "valueForFlag:", 262164))
    {
      v16 = v14;
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v39 = v9;
          v40 = 2112;
          v41 = v15;
          _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Additional requested scope %{public}@ is invalid scope: flags are %@", buf, 0x16u);
        }

      }
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 38, CFSTR("invalid flags for additional scope: %@"), v15);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v13 = v16;
      goto LABEL_38;
    }
    v35 = v14;
    -[CPLEngineScopeStorage transportScopeForScope:](self->_scopes, "transportScopeForScope:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    if (v19)
    {
      v20 = v19;
      v11 = 0;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v39 = v9;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Transport scope for additional requested scope %{public}@ has not yet been determined", buf, 0xCu);
        }

      }
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 32, CFSTR("missing transport scope"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (v6)
    {
      v13 = v35;
      if (v11 || !v12)
        goto LABEL_38;
      if (!-[CPLTransportScopeMapping shouldSetSharedScopeIdentifierForScopeWithIdentifier:](self->_transportScopeMapping, "shouldSetSharedScopeIdentifierForScopeWithIdentifier:", v9))
      {

        goto LABEL_44;
      }
      -[CPLEngineScopeStorage sharingScopeForScope:](self->_scopes, "sharingScopeForScope:", v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "scopeIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v25 = -[CPLUploadPushedChangesTask _willNeedToAccessScopeWithIdentifier:primaryScope:error:](self, "_willNeedToAccessScopeWithIdentifier:primaryScope:error:", v24, 0, &v37);
        v11 = v37;
        if (v25)
        {
          -[CPLTransportScopeMapping setSharedScopeIdentifier:forScopeWithIdentifier:](self->_transportScopeMapping, "setSharedScopeIdentifier:forScopeWithIdentifier:", v24, v9);
        }
        else
        {

          v12 = 0;
        }

      }
      else
      {
        -[CPLTransportScopeMapping setSharedScopeIdentifier:forScopeWithIdentifier:](self->_transportScopeMapping, "setSharedScopeIdentifier:forScopeWithIdentifier:", 0, v9);
        v11 = 0;
      }

    }
    v13 = v35;
LABEL_38:
    if (v11)
    {
      invalidTransportScopes = self->_invalidTransportScopes;
      if (!invalidTransportScopes)
      {
        v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v28 = self->_invalidTransportScopes;
        self->_invalidTransportScopes = v27;

        invalidTransportScopes = self->_invalidTransportScopes;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](invalidTransportScopes, "setObject:forKeyedSubscript:", v11, v9);

      if (a5)
        goto LABEL_5;
      goto LABEL_42;
    }

    if (!v12)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v9;
          _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_ERROR, "No error but no transport scope available for %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v36, self, v34, 1500, CFSTR("No error but no transport scope available for %@"), v9);

      abort();
    }
LABEL_44:
    -[CPLTransportScopeMapping setObject:forKeyedSubscript:](self->_transportScopeMapping, "setObject:forKeyedSubscript:", v12, v9);
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLTransportScopeMapping objectForKeyedSubscript:](self->_transportScopeMapping, "objectForKeyedSubscript:", v9);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v9;
        v40 = 2112;
        v41 = v30;
        _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEFAULT, "Will access %{public}@ with concrete scope %@", buf, 0x16u);

      }
    }
    v10 = 1;
    goto LABEL_49;
  }
  v10 = 1;
LABEL_50:

  return v10;
}

- (BOOL)willNeedToAccessRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!self->_transactionDuringItemsPreparation)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "%@ should only be called during initial batch preparation", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v20, 1509, CFSTR("%@ should only be called during initial batch preparation"), v21);

    abort();
  }
  v8 = v7;
  -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:](self->_targetMapping, "targetForRecordWithScopedIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v8, "scopeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CPLUploadPushedChangesTask _willNeedToAccessScopeWithIdentifier:primaryScope:error:](self, "_willNeedToAccessScopeWithIdentifier:primaryScope:error:", v10, 1, a4);

    if (!v11)
    {
      v15 = 0;
      goto LABEL_6;
    }
    -[CPLEngineScopedTask store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetForRecordWithCloudScopedIdentifier:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPLRecordTargetMapping setTarget:forRecordWithScopedIdentifier:](self->_targetMapping, "setTarget:forRecordWithScopedIdentifier:", v14, v8);
  }
  v15 = 1;
LABEL_6:

  return v15;
}

- (id)availableResourceTypesToUploadForChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_transactionDuringItemsPreparation)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "%@ should only be called during initial batch preparation", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 1526, CFSTR("%@ should only be called during initial batch preparation"), v15);

    abort();
  }
  v6 = v5;
  -[CPLEngineScopedTask store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outgoingResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceTypesToUploadForChange:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)willUploadCloudResource:(id)a3 localResource:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *preparedUploadResourceTasks;
  CPLEngineStoreTransaction *transactionDuringItemsPreparation;
  CPLEngineStoreTransaction *v18;
  CPLEngineResourceUploadTask *v19;
  void *v20;
  void *v21;
  CPLEngineResourceUploadTask *v22;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!self->_transactionDuringItemsPreparation)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v25;
        _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "%@ should only be called during initial batch preparation", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v27, 1531, CFSTR("%@ should only be called during initial batch preparation"), v28);

    abort();
  }
  v11 = v10;
  -[CPLEngineScopedTask store](self, "store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resourceStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "retainFileURLForResource:error:", v11, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (!self->_preparedUploadResourceTasks)
    {
      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      preparedUploadResourceTasks = self->_preparedUploadResourceTasks;
      self->_preparedUploadResourceTasks = v15;

      transactionDuringItemsPreparation = self->_transactionDuringItemsPreparation;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __74__CPLUploadPushedChangesTask_willUploadCloudResource_localResource_error___block_invoke;
      v29[3] = &unk_1E60DDB80;
      v29[4] = self;
      v18 = transactionDuringItemsPreparation;
      -[CPLEngineStoreTransaction addCleanupBlock:](v18, "addCleanupBlock:", v29);

    }
    v19 = [CPLEngineResourceUploadTask alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[CPLResourceTransferTask initWithResource:taskIdentifier:](v19, "initWithResource:taskIdentifier:", v11, v21);

    -[CPLEngineResourceUploadTask setCloudResource:](v22, "setCloudResource:", v9);
    -[NSMutableArray addObject:](self->_preparedUploadResourceTasks, "addObject:", v22);

  }
  return v14;
}

- (BOOL)isResourceDynamic:(id)a3
{
  return -[CPLEngineTransport isResourceDynamic:](self->_transport, "isResourceDynamic:", a3);
}

- (id)knownCloudRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CPLEngineScopedTask store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordWithScopedIdentifier:isFinal:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCloudRecordWithScopedIdentifierShared:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:](self->_targetMapping, "targetForRecordWithScopedIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Trying to know shared state for %@ but it was not requested to access", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 1571, CFSTR("Trying to know shared state for %@ but it was not requested to access"), v5);

    abort();
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "shouldUploadToOtherRecord");

  return v8;
}

- (CPLEngineTransportGroup)storedTransportGroup
{
  return self->_storedTransportGroup;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (CPLTransportScopeMapping)transportScopeMapping
{
  return self->_transportScopeMapping;
}

- (int64_t)ruleGroup
{
  return self->_ruleGroup;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (unint64_t)maxBatchSize
{
  return self->_maxBatchSize;
}

- (unint64_t)pushRepositoryPriority
{
  return self->_pushRepositoryPriority;
}

- (CPLEnginePushRepository)pushRepository
{
  return self->_pushRepository;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_storeStrong((id *)&self->_storedTransportGroup, 0);
  objc_storeStrong((id *)&self->_taskStartDate, 0);
  objc_storeStrong((id *)&self->_currentTaskKey, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_uploadTask, 0);
  objc_storeStrong((id *)&self->_acquireReschedulerTask, 0);
  objc_storeStrong((id *)&self->_fetchRecordsTask, 0);
  objc_storeStrong((id *)&self->_invalidTransportScopes, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_preparedUploadResourceTasks, 0);
  objc_storeStrong((id *)&self->_transactionDuringItemsPreparation, 0);
  objc_storeStrong((id *)&self->_checkItems, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_cloudScopedIdentifiersToUploadResourceTaskErrors, 0);
  objc_storeStrong((id *)&self->_uploadResourceTasks, 0);
  objc_storeStrong((id *)&self->_derivativesFilter, 0);
  objc_storeStrong((id *)&self->_batchToCommit, 0);
  objc_storeStrong((id *)&self->_diffedBatch, 0);
  objc_storeStrong((id *)&self->_currentStrategy, 0);
  objc_storeStrong((id *)&self->_batchStorage, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __74__CPLUploadPushedChangesTask_willUploadCloudResource_localResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(*(_QWORD *)(a1 + 32) + 240));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 192);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "notifyAttachedObjectsUploadTaskDidStart:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 240);
  *(_QWORD *)(v9 + 240) = 0;

}

void __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_2;
  v13[3] = &unk_1E60DDB30;
  v5 = *(_QWORD *)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v15 = v5;
  v14 = v3;
  v9 = v14;
  objc_msgSend(v14, "do:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "storedExtractedBatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_3;
    v10[3] = &unk_1E60DDB30;
    v8 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v10[4] = v8;
    v11 = v6;
    objc_msgSend(v9, "do:", v10);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setExtractionStrategy:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_deleteGeneratedResourcesAfterError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || (objc_msgSend(v3, "error"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:");
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskDidFinishWithError:", v6);

  }
}

uint64_t __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "_markUploadedTasksDidFinishWithError:transaction:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40), a2);
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 144);
    if (v6)
      return objc_msgSend(*(id *)(v5 + 416), "checkInBatchStorage:error:", v6, a2);
    else
      return 1;
  }
  return result;
}

uint64_t __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  CPLRejectedRecords *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  CPLRejectedRecords *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v3 = a1;
  v52 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    if ((objc_msgSend(v4, "isCPLErrorWithCode:", 18) & 1) != 0)
    {
      objc_msgSend(*(id *)(v3 + 32), "engineLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "store");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "idMapping");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40), "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CPLErrorRejectedRecordIdentifiersAndReasons"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLScopedIdentifier scopedIdentifiersFromDictionaryOfUnknownIdentifiers:](CPLScopedIdentifier, "scopedIdentifiersFromDictionaryOfUnknownIdentifiers:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v34 = v8;
        v36 = a2;
        v38 = objc_alloc_init(CPLRejectedRecords);
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v35 = v3;
        objc_msgSend(*(id *)(v3 + 40), "batch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        if (!v12)
          goto LABEL_18;
        v13 = v12;
        v14 = *(_QWORD *)v45;
        while (1)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v45 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v16, "scopedIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 0;
            objc_msgSend(v7, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v17, &v43);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", v18);
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                -[CPLRejectedRecords setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v19, v16);
                objc_msgSend(v37, "addObject:", v17);
              }
            }
            else
            {
              if (_CPLSilentLogging)
                goto LABEL_16;
              __CPLTaskOSLogDomain_21238();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v17;
                _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Failed to remap local identifier %@ to a cloud identifier after records have been rejected", buf, 0xCu);
              }
            }

LABEL_16:
            objc_msgSend(v16, "_setShouldNotTrustCloudCache:", 1);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
          if (!v13)
          {
LABEL_18:

            v8 = v34;
            v20 = (void *)objc_msgSend(v34, "mutableCopy");
            objc_msgSend(v20, "removeObjectForKey:", CFSTR("CPLErrorRejectedRecordIdentifiersAndReasons"));
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v37, CFSTR("CPLErrorRejectedRecordIdentifiers"));
            v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v3 = v35;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v35 + 48) + 8) + 40), "domain");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v35 + 48) + 8) + 40), "code"), v20);
            v24 = *(_QWORD *)(*(_QWORD *)(v35 + 48) + 8);
            v25 = *(void **)(v24 + 40);
            *(_QWORD *)(v24 + 40) = v23;

            a2 = v36;
            v26 = v38;
            goto LABEL_32;
          }
        }
      }
      v26 = 0;
LABEL_32:

      goto LABEL_33;
    }
    v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40);
  }
  else
  {
    v27 = 0;
  }
  if (objc_msgSend(*(id *)(v3 + 32), "_shouldNotTrustCloudCacheAfterError:", v27))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(*(id *)(v3 + 40), "batch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "_setShouldNotTrustCloudCache:", 1);
        }
        v29 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v29);
    }
    v26 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v26 = 0;
LABEL_34:
  v32 = objc_msgSend(*(id *)(v3 + 32), "_reenqueueExtractedBatchWithRejectedRecords:extractedBatch:error:", v26, *(_QWORD *)(v3 + 40), a2);

  return v32;
}

void *__37__CPLUploadPushedChangesTask_cancel___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *result;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];
  objc_super v8;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[34] || v2[35])
  {
    v8.receiver = *(id *)(a1 + 32);
    v8.super_class = (Class)CPLUploadPushedChangesTask;
    objc_msgSendSuper2(&v8, sel_cancel);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "cancel");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
    return (void *)objc_msgSend(v3, "cancel");
  }
  result = (void *)v2[36];
  if (result)
  {
    if (!objc_msgSend(result, "foreground"))
    {
      v6.receiver = *(id *)(a1 + 32);
      v6.super_class = (Class)CPLUploadPushedChangesTask;
      objc_msgSendSuper2(&v6, sel_cancel);
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 288);
      return (void *)objc_msgSend(v3, "cancel");
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Deferring cancellation due to upload task currently running foreground", buf, 2u);
      }

    }
    result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "cancelIfBlocked");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 328) = 1;
  }
  return result;
}

uint64_t __37__CPLUploadPushedChangesTask_cancel___block_invoke_109(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "cancel");
}

uint64_t __36__CPLUploadPushedChangesTask_launch__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__CPLUploadPushedChangesTask_launch__block_invoke_2;
  v3[3] = &unk_1E60DD6D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "do:", v3);
}

void __36__CPLUploadPushedChangesTask_launch__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_uploadTaskDidFinishWithError:", v5);

  }
  else
  {
    objc_msgSend(v4, "_extractAndUploadOneBatch");
  }

}

BOOL __36__CPLUploadPushedChangesTask_launch__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "derivativesFilter");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "checkOutBatchStorageWithPriority:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408), a2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 144);
  *(_QWORD *)(v9 + 144) = v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "hasChangesWithPriorityGreaterThanPriority:inScopeWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) != 0;
}

void __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_2;
  v8[3] = &unk_1E60DDA80;
  v4 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  v12 = *(_OWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_99;
  v7[3] = &unk_1E60DDAD0;
  v7[4] = v9;
  v7[5] = v4;
  v7[6] = v12;
  v5 = v3;
  v6 = (id)objc_msgSend(v5, "performWriteTransactionWithBlock:completionHandler:", v8, v7);

}

void __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  _QWORD *v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Looking for next batch in push repository", buf, 2u);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 386))
    {
      objc_msgSend((id)v5, "_noteSuccessfulUpdateInTransaction:", v3);
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_32;
      v5 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v5 + 160))
    {
      objc_msgSend(*(id *)(v5 + 416), "storedExtractedBatch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "batch");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) += objc_msgSend(v8, "count");

      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "countOfChangesInScopeWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
      v11 = *(_QWORD **)(a1 + 32);
      v12 = 100 * v11[38] / (unint64_t)(v11[38] + v9);
      if (v12 != v11[37])
      {
        v11[37] = v12;
        *(float *)&v10 = (float)v12 / 100.0;
        objc_msgSend(*(id *)(a1 + 32), "taskDidProgress:userInfo:", 0, v10);
        v11 = *(_QWORD **)(a1 + 32);
      }
      if (!v11[21])
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_21238();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_ERROR, "We should have a batch to commit here", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 64);
        v28 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v27, v28, v29, 1140, CFSTR("We should have a batch to commit here"));

        abort();
      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_96;
      v31[3] = &unk_1E60DDA58;
      v31[4] = v11;
      v32 = v3;
      v33 = *(id *)(a1 + 40);
      v34 = v7;
      v13 = v7;
      objc_msgSend(v32, "do:", v31);
      objc_msgSend(*(id *)(a1 + 32), "_clearUploadBatch");

      v5 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v5 + 328))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "Triggering deferred cancel", buf, 2u);
        }

        v5 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend((id)v5, "cancel");
      goto LABEL_32;
    }
    if (objc_msgSend((id)v5, "diskPressureState"))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "store");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "derivativesCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "discardCache");

      v18 = objc_msgSend(*(id *)(a1 + 32), "diskPressureState");
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "task:shouldRetryImmediatelyInTransaction:", *(_QWORD *)(a1 + 32), v3);

    if (v20)
    {
      v21 = *(_QWORD *)(a1 + 48);
LABEL_31:
      *(_BYTE *)(*(_QWORD *)(v21 + 8) + 24) = 1;
      goto LABEL_32;
    }
    if (v18 == 2)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v36 = v23;
          _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEFAULT, "System has not enough disk space to continue %@", buf, 0xCu);
        }

      }
      v21 = *(_QWORD *)(a1 + 56);
      goto LABEL_31;
    }
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 312) = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(a1 + 32), "_extractBatchWithTransaction:andStore:", v3, *(_QWORD *)(a1 + 40));
    v24 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v24 + 352))
    {
      *(_BYTE *)(v24 + 352) = 1;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_98;
      v30[3] = &unk_1E60DD6D0;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "do:", v30);
    }
  }
LABEL_32:

}

void __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  uint8_t buf[8];
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;

  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Committed", buf, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 104);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_100;
  v12[3] = &unk_1E60DDAA8;
  v12[4] = v5;
  v13 = v3;
  v14 = *(_OWORD *)(a1 + 40);
  v8 = v12;
  *(_QWORD *)buf = v7;
  v16 = 3221225472;
  v17 = __cpl_dispatch_async_block_invoke_21285;
  v18 = &unk_1E60D71F8;
  v19 = v8;
  v9 = v6;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v9, v11);

}

void __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_100(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  int v22;
  id v23;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "willRunEngineElement:", CPLEngineElementUpload);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    v7 = v3;
LABEL_6:
    v23 = v6;
    objc_msgSend(v7, "_uploadTaskDidFinishWithError:");

    return;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 32);
  if (v5)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldDefer");

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (void *)v11;
    v7 = v10;
    goto LABEL_6;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Requesting retry immediately", buf, 2u);
      }

    }
    v13 = *(void **)(a1 + 32);
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10000, CFSTR("Need to restart push-to-transport immediately"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    goto LABEL_16;
  }
  v16 = *(id **)(a1 + 32);
  if (v16[20])
  {
    v17 = objc_msgSend(v16[20], "count");
    v18 = *(void **)(a1 + 32);
    if (v17)
      objc_msgSend(v18, "_prepareUploadBatch");
    else
      objc_msgSend(v18, "_extractAndUploadOneBatch");
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB28A8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("Not enough disk space");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 640, v21);

      v15 = *(void **)(a1 + 32);
LABEL_16:
      objc_msgSend(v15, "_uploadTaskDidFinishWithError:", v14);

      return;
    }
    v22 = objc_msgSend(v16, "isCancelled");
    v10 = *(void **)(a1 + 32);
    if (v22)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(v10, "_uploadTaskDidFinishWithError:", 0);
  }
}

uint64_t __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_96(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_markUploadedTasksDidFinishWithError:transaction:error:", 0, *(_QWORD *)(a1 + 40), a2);
  if (!(_DWORD)result)
    return result;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "cloudCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applyBatch:isFinal:direction:withError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), 1, 2, a2);

    if (!v6)
      return 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "statusCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(a1 + 56), "batch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v9)
  {
    v12 = 1;
    goto LABEL_37;
  }
  v10 = v9;
  v11 = *(_QWORD *)v23;
  v12 = 1;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
      if (objc_msgSend(v14, "supportsResources")
        && objc_msgSend(v14, "hasChangeType:", 8))
      {
        if (!objc_msgSend(v7, "notifyStatusForRecordHasChanged:persist:error:", v14, 1, a2))
        {
          v12 = 0;
          goto LABEL_37;
        }
        if (objc_msgSend(v14, "isMasterChange"))
        {
          objc_msgSend(v14, "scopedIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v15);

LABEL_25:
          v12 = 1;
          goto LABEL_26;
        }
        if (!objc_msgSend(v14, "isAssetChange") || !objc_msgSend(v14, "isFullRecord"))
          goto LABEL_25;
        objc_msgSend(v14, "masterScopedIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 && (objc_msgSend(v21, "containsObject:", v17) & 1) == 0)
        {
          v18 = +[CPLRecordChange newRecordWithScopedIdentifier:](CPLMasterChange, "newRecordWithScopedIdentifier:", v17);
          v19 = objc_msgSend(v7, "notifyStatusForRecordHasChanged:persist:error:", v18, 1, a2);
          v12 = v19;
          if (v19)
            objc_msgSend(v21, "addObject:", v17);

        }
        else
        {
          v12 = 1;
        }

        if ((v12 & 1) == 0)
          goto LABEL_37;
      }
      else
      {
        if (objc_msgSend(v14, "supportsSharingScopedIdentifier"))
        {
          if (objc_msgSend(v14, "hasChangeType:", 64))
          {
            objc_msgSend(v14, "sharingScopeIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              v12 = objc_msgSend(v7, "notifyStatusForRecordHasChanged:persist:error:", v14, 1, a2);
          }
        }
        if ((v12 & 1) == 0)
          goto LABEL_37;
      }
LABEL_26:
      ++v13;
    }
    while (v10 != v13);
    v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v10 = v20;
  }
  while (v20);
LABEL_37:

  if ((v12 & 1) == 0)
    return 0;
  return objc_msgSend(*(id *)(a1 + 32), "_discardUploadedExtractedBatch:error:", *(_QWORD *)(a1 + 56), a2);
}

uint64_t __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_98(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[15];
  objc_msgSend(v4, "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "setScopeHasChangesToPullFromTransport:error:", v6, a2);

  if (!(_DWORD)v5)
    return 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 208);
  if (v8)
    return objc_msgSend(*(id *)(v7 + 120), "setScopeHasChangesToPullFromTransport:error:", v8, a2);
  else
    return 1;
}

void __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[4];
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_2;
  v6[3] = &unk_1E60DD838;
  v7 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_4;
  v5[3] = &unk_1E60DD838;
  v5[4] = v7;
  v4 = (id)objc_msgSend(v3, "performWriteTransactionWithBlock:completionHandler:", v6, v5);

}

void __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_3;
    v4[3] = &unk_1E60DDA30;
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    objc_msgSend(v5, "do:", v4);

  }
}

void __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 104);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_5;
  v11[3] = &unk_1E60D6F88;
  v12 = v3;
  v13 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_21285;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    v11 = (id)v4;
    v7 = v3;
LABEL_6:
    objc_msgSend(v7, "_uploadTaskDidFinishWithError:", v6);

    return;
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
  v3 = *(void **)(a1 + 40);
  if (v5)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldDefer");

  v10 = *(void **)(a1 + 40);
  if (v9)
  {
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v6 = objc_claimAutoreleasedReturnValue();
    v11 = (id)v6;
    v7 = v10;
    goto LABEL_6;
  }
  objc_msgSend(v10, "_checkForRecordExistence");
}

uint64_t __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  CPLRecordTargetMapping *v6;
  uint64_t v7;
  void *v8;
  CPLBeforeUploadCheckItems *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), *(id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 216);
  if (*(_BYTE *)(v4 + 353) && objc_msgSend((id)v4, "_canUseOverQuotaRule"))
    v5 |= 8uLL;
  v6 = objc_alloc_init(CPLRecordTargetMapping);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 256);
  *(_QWORD *)(v7 + 256) = v6;

  v9 = -[CPLBeforeUploadCheckItems initWithBatch:targetMapping:ruleGroups:pushRepositoryPriority:provider:]([CPLBeforeUploadCheckItems alloc], "initWithBatch:targetMapping:ruleGroups:pushRepositoryPriority:provider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256), v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 224);
  *(_QWORD *)(v10 + 224) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "scopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setSharingScopeIdentifier:", v12);

  v13 = *(_QWORD *)(a1 + 32);
  if ((v5 & 8) != 0 && !*(_QWORD *)(v13 + 408) && *(_BYTE *)(v13 + 387))
  {
    objc_msgSend(*(id *)(v13 + 224), "setShouldCheckOverQuotaChangesWithServer:", 1);
    v13 = *(_QWORD *)(a1 + 32);
  }
  v14 = objc_msgSend(*(id *)(v13 + 224), "prepareBatchBeforeUploadWithError:", a2);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 232);
  *(_QWORD *)(v15 + 232) = 0;

  if ((_DWORD)v14)
    objc_msgSend(*(id *)(a1 + 32), "_prepareTransportGroupForOneBatch");
  return v14;
}

void __71__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectEnumerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 40) + 320) = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 40), "_didStartTaskWithKey:recordCount:", CFSTR("derivatives"), objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "derivativesCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_generateDerivativesForNextRecord:usingDerivativesCache:fetchCache:", v6, v5, *(_QWORD *)(a1 + 48));

}

void __71__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 104);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache___block_invoke_3;
  v12[3] = &unk_1E60D70C8;
  v12[4] = v4;
  v13 = v3;
  v14 = v5;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_21285;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = v6;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

uint64_t __71__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 280);
  *(_QWORD *)(v2 + 280) = 0;

  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_uploadTaskDidFinishWithError:");
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __97__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(void **)(v10 + 104);
  v20[2] = __97__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache___block_invoke_2;
  v20[3] = &unk_1E60DD9E0;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[4] = v10;
  v21 = v8;
  v22 = v9;
  v23 = v7;
  v24 = v11;
  v25 = *(id *)(a1 + 48);
  v26 = *(id *)(a1 + 56);
  v27 = *(id *)(a1 + 64);
  v28 = *(id *)(a1 + 72);
  v29 = *(id *)(a1 + 80);
  v14 = v20;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_21285;
  block[3] = &unk_1E60D71F8;
  v31 = v14;
  v15 = v12;
  v16 = v7;
  v17 = v9;
  v18 = v8;
  v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v19);

}

uint64_t __97__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  CFAbsoluteTime v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  CFAbsoluteTime v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "recordsNeedingGeneratedDerivatives");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "count");
      v5 = CFAbsoluteTimeGetCurrent() - *(double *)(*(_QWORD *)(a1 + 32) + 320);
      v7 = 134218240;
      v8 = v4;
      v9 = 2048;
      v10 = v5;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Successfully generated derivatives for %lu records in %.2fs. Starting upload.", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", CFSTR("derivatives"), 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_uploadBatchWithFetchCache:", *(_QWORD *)(a1 + 40));
}

uint64_t __97__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predictor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePredictionsWithDerivativesStatistics:", *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", CFSTR("derivatives"), 1, objc_msgSend(v4, "isCPLOperationCancelledError"));
    objc_msgSend(*(id *)(a1 + 32), "_uploadTaskDidFinishWithError:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 72);
    v13 = 0;
    v9 = objc_msgSend(v5, "_copyResourceChangeFromChange:toChange:fingerprintScheme:error:", v6, v7, v8, &v13);
    v10 = v13;
    v11 = v10;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_generateDerivativesForNextRecord:usingDerivativesCache:fetchCache:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", CFSTR("derivatives"), 1, objc_msgSend(v10, "isCPLOperationCancelledError"));
      objc_msgSend(*(id *)(a1 + 32), "_uploadTaskDidFinishWithError:", v11);
    }

  }
  return objc_msgSend(*(id *)(a1 + 104), "endTransaction");
}

uint64_t __93__CPLUploadPushedChangesTask__copyResourceChangeFromChange_toChange_fingerprintScheme_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_7;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDefer"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
    v13 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("resources")))
  {
    v37 = v9;
    v38 = v8;
    objc_msgSend(v8, "resources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "cplDeepCopy");

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v21);
          objc_msgSend(v22, "identity");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stableHash");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {

          }
          else
          {
            objc_msgSend(v23, "fileURL");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = (void *)v25;
              v27 = objc_msgSend(v7, "requiresStableHashForResourceType:", objc_msgSend(v22, "resourceType"));

              if (v27)
              {
                v28 = *(void **)(a1 + 48);
                objc_msgSend(v23, "fileURL");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                obj = *(id *)(v30 + 40);
                objc_msgSend(v28, "fingerPrintForFileAtURL:error:", v29, &obj);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_storeStrong((id *)(v30 + 40), obj);
                objc_msgSend(v23, "setStableHash:", v31);

                objc_msgSend(v23, "stableHash");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v32)
                {
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
                  goto LABEL_31;
                }
                if (objc_msgSend(*(id *)(a1 + 32), "shouldDefer"))
                {
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
                  +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
                  v34 = objc_claimAutoreleasedReturnValue();
LABEL_30:
                  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                  v36 = *(void **)(v35 + 40);
                  *(_QWORD *)(v35 + 40) = v34;

LABEL_31:
                  goto LABEL_32;
                }
                if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
                {
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
                  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
                  v34 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_30;
                }
              }
            }
          }

          ++v21;
        }
        while (v19 != v21);
        v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        v19 = v33;
      }
      while (v33);
    }
LABEL_32:

    objc_msgSend(v7, "setResources:", v17);
    v13 = 1;
    v9 = v37;
    v8 = v38;
  }
  else
  {
    v13 = 0;
  }
LABEL_8:

  return v13;
}

void __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  float v15;
  _QWORD block[4];
  id v17;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_2;
  v13[3] = &unk_1E60DD940;
  v13[4] = v6;
  v14 = v5;
  v15 = a3;
  v9 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_21285;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = v7;
  v11 = v5;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

void __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v20;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "foreground");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "hash");
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateStoredTargetsFromTargetMapping:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(v6 + 104);
  v14[2] = __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_4;
  v14[3] = &unk_1E60D6F60;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[4] = v6;
  v15 = v3;
  v18 = *(_QWORD *)(a1 + 56);
  v16 = v7;
  v17 = *(id *)(a1 + 48);
  v10 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_21285;
  block[3] = &unk_1E60D71F8;
  v20 = v10;
  v11 = v8;
  v12 = v3;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v13);

}

uint64_t __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  int v19;
  double v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(double *)(*(_QWORD *)(a1 + 32) + 288);
      v19 = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ finished with error %@", (uint8_t *)&v19, 0x16u);
    }

  }
  v5 = *(void **)(a1 + 40);
  if (!v5
    && (objc_msgSend(*(id *)(a1 + 32), "_deleteGeneratedResourcesAfterError:", 0), (v5 = *(void **)(a1 + 40)) == 0)
    || (objc_msgSend(v5, "isCPLErrorWithCode:", 18) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "approximativeResourcesUploadRate");
    if (v6 > 0.0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "updateApproximativeUploadRate:");
  }
  v7 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = (void *)v7[36];
    v7[36] = 0;

    if (objc_msgSend(*(id *)(a1 + 40), "isCPLOperationCancelledError"))
    {
      v9 = 0;
      v10 = 1;
    }
    else
    {
      v9 = 1;
      v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", CFSTR("upload"), v9, v10);
    v16 = *(_QWORD **)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    objc_msgSend(v7, "_didFinishTaskWithKey:error:cancelled:", CFSTR("upload"), 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "willRunEngineElement:", CPLEngineElementSuccessfulUpload);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "resetBackoffInterval");
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_21238();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
        v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "count");
        v14 = CFSTR("none");
        v15 = *(_QWORD *)(a1 + 56);
        if (*(_QWORD *)(a1 + 48))
          v14 = *(const __CFString **)(a1 + 48);
        v19 = 134218754;
        v20 = v12;
        v21 = 2048;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Transport successfully uploaded in %.2fs (%lu resources uploaded) - cache: %{public}@: %@", (uint8_t *)&v19, 0x2Au);
      }

    }
    v16 = *(_QWORD **)(a1 + 32);
    if (v16[36])
      return objc_msgSend(v16, "_popNextBatchAndContinue");
    v18 = 0;
  }
  return objc_msgSend(v16, "_uploadTaskDidFinishWithError:", v18);
}

void __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 192);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "resource", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "itemScopedIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40)))
        {
          v10 = +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", objc_msgSend(v8, "resourceType"));

          if (v10)
          {
            objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v12) = *(_DWORD *)(a1 + 48);
            objc_msgSend(v11, "notifyAttachedObjectsUploadTask:didProgress:", v7, v12);

            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
LABEL_12:

}

uint64_t __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id obj;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[19];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = 0;
  v7 = (void *)v4[52];
  objc_msgSend(v4, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "estimatedRemainingTime");
  LODWORD(v5) = objc_msgSend(v5, "extractBatch:maximumResourceSize:error:", &obj, objc_msgSend(v7, "maximumResourceSizePerBatchForRemainingTime:"), a2);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (!(_DWORD)v5)
    return 0;
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 384))
  {
    objc_msgSend(v9, "batch");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 384) = objc_msgSend(v16, "count") != 0;

    return 1;
  }
  objc_msgSend(v9, "batch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
    return 1;
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "storeLastDateOfClearedPushRepository:forScope:error:", v13, v14, a2);

  return v15;
}

uint64_t __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_61(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
LABEL_14:
    objc_msgSend(*(id *)(a1 + 32), "_clearUploadBatch", (_QWORD)v17);
    return objc_msgSend(*(id *)(a1 + 32), "_discardUploadedExtractedBatch:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[15];
  objc_msgSend(v4, "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "setDidDropSomeRecordsForScope:error:", v6, a2);

  if ((_DWORD)v5)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 40), "quarantinedRecords");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            if ((objc_msgSend(v13, "isDelete", (_QWORD)v17) & 1) == 0)
            {
              objc_msgSend(v13, "scopedIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v7, "addQuarantinedRecordWithScopedIdentifier:recordClass:reason:error:", v14, objc_opt_class(), *(_QWORD *)(a1 + 48), a2);

              if ((v15 & 1) == 0)
              {

                return 0;
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v10)
            continue;
          break;
        }
      }

    }
    goto LABEL_14;
  }
  return 0;
}

BOOL __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_62(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 40), "cloudChangeBatchFromBatch:usingMapping:isFinal:withError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48), 1, a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 160);
  *(_QWORD *)(v4 + 160) = v3;

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 168);
  *(_QWORD *)(v7 + 168) = v6;

  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) != 0;
}

uint64_t __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_63(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "storeExtractedBatch:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

uint64_t __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearUploadBatch");
  return objc_msgSend(*(id *)(a1 + 32), "_discardUploadedExtractedBatch:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD block[4];
  id v26;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1[4] + 272), "fetchCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[4];
  v9 = (void *)a1[5];
  v10 = *(void **)(v8 + 104);
  v11 = MEMORY[0x1E0C809B0];
  v19[2] = __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_2;
  v19[3] = &unk_1E60DD8A0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[4] = v8;
  v20 = v6;
  v21 = v5;
  v12 = v9;
  v24 = a1[6];
  v22 = v12;
  v23 = v7;
  v13 = v19;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_21285;
  block[3] = &unk_1E60D71F8;
  v26 = v13;
  v14 = v10;
  v15 = v7;
  v16 = v5;
  v17 = v6;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);

}

void __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 272);
  *(_QWORD *)(v2 + 272) = 0;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateStoredTargetsFromTargetMapping:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    if (objc_msgSend(v6, "isCPLOperationCancelledError"))
    {
      v7 = 0;
      v8 = 1;
    }
    else
    {
      v7 = 1;
      v8 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", CFSTR("existence-check"), v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "_uploadTaskDidFinishWithError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v10, "_didFinishTaskWithKey:error:cancelled:", CFSTR("existence-check"), 0, 1);
      v11 = *(void **)(a1 + 32);
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_uploadTaskDidFinishWithError:");

    }
    else
    {
      objc_msgSend(v10, "_didFinishTaskWithKey:error:cancelled:", CFSTR("existence-check"), 0, 0);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "shouldCheckOverQuotaChangesWithServer"))
      {
        objc_msgSend(*(id *)(a1 + 32), "store");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_3;
        v28[3] = &unk_1E60DD838;
        v28[4] = *(_QWORD *)(a1 + 32);
        v13 = (id)objc_msgSend(v12, "performWriteTransactionWithBlock:completionHandler:", v28, &__block_literal_global_21363);

      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_21238();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_msgSend(*(id *)(a1 + 48), "count");
          v16 = objc_msgSend(*(id *)(a1 + 56), "count");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "fetchRules");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "componentsJoinedByString:", CFSTR("/"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72);
          v20 = *(const __CFString **)(a1 + 64);
          if (!v20)
            v20 = CFSTR("none");
          *(_DWORD *)buf = 134219010;
          v30 = v15;
          v31 = 2048;
          v32 = v16;
          v33 = 2114;
          v34 = v18;
          v35 = 2048;
          v36 = v19;
          v37 = 2114;
          v38 = v20;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Found %lu/%lu records on server (rules: %{public}@) in %.2fs - cache: %{public}@", buf, 0x34u);

        }
      }
      v21 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
      v22 = *(_QWORD *)(a1 + 48);
      v27 = 0;
      v23 = objc_msgSend(v21, "checkBatchWithFoundRecords:error:", v22, &v27);
      v24 = v27;
      v25 = *(void **)(a1 + 32);
      if (v23)
        objc_msgSend(v25, "_checkPrioritiesWithFetchCache:", *(_QWORD *)(a1 + 64));
      else
        objc_msgSend(v25, "_uploadTaskDidFinishWithError:", v24);

    }
  }
}

uint64_t __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_4;
  v3[3] = &unk_1E60DD6D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "do:", v3);
}

void __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && !_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Failed to note that engine checked assets on server", v4, 2u);
    }

  }
}

uint64_t __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_4(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[15];
  objc_msgSend(v3, "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "noteDidCheckAssetWithServerWhenOverQuotaForScope:error:", v5, a2);

  return v6;
}

void __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  CPLExtractedBatch *v6;
  id v7;
  void *v8;
  uint64_t v9;
  CPLExtractedBatch *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  int v21;
  id v22;
  const __CFString *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t k;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  const __CFString *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  uint64_t v57;
  int v58;
  CPLChangeBatch *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t n;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  CPLExtractedBatch *v87;
  id obj;
  void (**v89)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *context;
  void *contexta;
  void *v98;
  id v99;
  CPLExtractedBatch *v100;
  id i;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  _QWORD v111[6];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[4];
  id v133;
  id v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  char v139;
  char v140;
  _QWORD v141[4];
  id v142;
  uint64_t v143;
  id v144;
  CPLExtractedBatch *v145;
  id v146;
  uint64_t *v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  id *v151;
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t);
  void (*v154)(uint64_t);
  id v155;
  _QWORD v156[5];
  id v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t (*v162)(uint64_t, uint64_t);
  void (*v163)(uint64_t);
  id v164;
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  uint8_t v168[128];
  uint8_t buf[4];
  void *v170;
  _BYTE v171[128];
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3))
    goto LABEL_110;
  v85 = v3;
  v108 = a1;
  objc_msgSend(*(id *)(a1 + 40), "idMapping");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cloudCache");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = 0;
  v160 = &v159;
  v161 = 0x3032000000;
  v162 = __Block_byref_object_copy__21278;
  v163 = __Block_byref_object_dispose__21279;
  v164 = 0;
  +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 11, CFSTR("Resource will be uploaded in a later batch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = MEMORY[0x1E0C809B0];
  v156[1] = 3221225472;
  v156[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_19;
  v156[3] = &unk_1E60DD720;
  v5 = *(_QWORD *)(a1 + 32);
  v158 = &v159;
  v156[4] = v5;
  v82 = v4;
  v157 = v82;
  v84 = (void *)MEMORY[0x1B5E08DC4](v156);
  v150 = 0;
  v151 = (id *)&v150;
  v152 = 0x3032000000;
  v153 = __Block_byref_object_copy__21278;
  v154 = __Block_byref_object_dispose__21279;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "storedExtractedBatch");
  v155 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v6 = objc_alloc_init(CPLExtractedBatch);
    v141[0] = MEMORY[0x1E0C809B0];
    v141[1] = 3221225472;
    v141[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2;
    v141[3] = &unk_1E60DD748;
    v147 = &v150;
    v7 = v109;
    v8 = *(void **)(a1 + 48);
    v149 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    v142 = v7;
    v143 = v9;
    v144 = v8;
    v146 = v84;
    v10 = v6;
    v145 = v10;
    v148 = &v159;
    objc_msgSend(v85, "do:", v141);

  }
LABEL_4:
  objc_msgSend(v85, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    v83 = (void *)MEMORY[0x1B5E08BF0]();
    v140 = 0;
    v136 = 0;
    v137 = &v136;
    v138 = 0x2020000000;
    v139 = 0;
    v87 = objc_alloc_init(CPLExtractedBatch);
    v13 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v151[5], "batch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    v132[0] = MEMORY[0x1E0C809B0];
    v132[1] = 3221225472;
    v132[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_26;
    v132[3] = &unk_1E60DD798;
    v133 = v85;
    v134 = v84;
    v135 = &v136;
    v89 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1B5E08DC4](v132);
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    objc_msgSend(v151[5], "batch");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v91 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v171, 16);
    if (!v91)
    {
      v86 = 0;
      v98 = 0;
      goto LABEL_51;
    }
    v86 = 0;
    v98 = 0;
    v90 = *(_QWORD *)v129;
    while (1)
    {
      for (i = 0; i != v91; i = (char *)i + 1)
      {
        if (*(_QWORD *)v129 != v90)
          objc_enumerationMutation(obj);
        v105 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)i);
        context = (void *)MEMORY[0x1B5E08BF0]();
        objc_msgSend(v105, "scopedIdentifier");
        v99 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_21238();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v170 = v105;
              _os_log_impl(&dword_1B03C2000, v67, OS_LOG_TYPE_ERROR, "Cloud scoped identifier for %@ should be known here", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v15);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = *(_QWORD *)(v108 + 56);
          v70 = *(_QWORD *)(v108 + 32);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", v69, v70, v71, 402, CFSTR("Cloud scoped identifier for %@ should be known here"), v105);

          abort();
        }
        v93 = (void *)v15;
        objc_msgSend(*(id *)(*(_QWORD *)(v108 + 32) + 224), "itemWithScopedIdentifier:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(v108 + 32) + 408);
        v103 = v16;
        objc_msgSend(v16, "change");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 == 0;

        if (v19)
          goto LABEL_34;
        if (!objc_msgSend(v105, "isMasterChange"))
        {
          objc_msgSend(v103, "change");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "hasChangeType:", 2);

          if (v25)
          {
            v126 = 0u;
            v127 = 0u;
            v124 = 0u;
            v125 = 0u;
            objc_msgSend(v105, "scopedIdentifiersForMapping");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 0;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v124, v168, 16);
            if (v27)
            {
              v28 = *(_QWORD *)v125;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v125 != v28)
                    objc_enumerationMutation(v26);
                  v30 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * j);
                  if ((objc_msgSend(v110, "containsObject:", v30) & 1) == 0)
                  {
                    objc_msgSend(v109, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v30, &v140);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v31 || (objc_msgSend(v107, "hasRecordWithScopedIdentifier:", v31) & 1) == 0)
                    {
                      objc_msgSend(*(id *)(*(_QWORD *)(v108 + 32) + 416), "changeWithScopedIdentifier:", v30);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = v32;
                      if (v32)
                      {
                        objc_msgSend(v32, "_pushContext");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        v35 = objc_msgSend(v34, "priority");

                        if (v35 > v17)
                        {
                          v17 = v35;
                          v23 = CFSTR("needs related record with higher priority to be uploaded");
                        }
                      }

                    }
                  }
                }
                v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v124, v168, 16);
              }
              while (v27);
            }

          }
          else
          {
LABEL_34:
            v23 = 0;
          }
          v22 = v98;
          goto LABEL_36;
        }
        objc_msgSend(v103, "change");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "hasChangeType:", 8);

        if (!v21)
          goto LABEL_34;
        v22 = v98;
        if (!v98)
          v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v22, "addObject:", v99);
        v23 = 0;
LABEL_36:
        if (v17 <= *(_QWORD *)(*(_QWORD *)(v108 + 32) + 408))
        {
          objc_msgSend(v110, "addObject:", v99);
          -[CPLExtractedBatch addChange:fromStorage:](v87, "addChange:fromStorage:", v105, *(_QWORD *)(*(_QWORD *)(v108 + 32) + 144));
          if (objc_msgSend(v22, "count"))
          {
            if (objc_msgSend(v105, "isAssetChange"))
            {
              objc_msgSend(v103, "change");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (v36)
              {
                v37 = objc_msgSend(v105, "hasChangeType:", 2);

                if (v37)
                {
                  objc_msgSend(v105, "relatedScopedIdentifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v38)
                  {
                    v39 = v86;
                    if (!v86)
                      v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                    v86 = v39;
                    objc_msgSend(v39, "addObject:", v38);
                  }

                }
              }
            }
          }
        }
        else
        {
          ((void (**)(_QWORD, void *, void *, unint64_t, const __CFString *))v89)[2](v89, v103, v105, v17, v23);
        }
        v98 = v22;

        objc_autoreleasePoolPop(context);
      }
      v91 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v171, 16);
      if (!v91)
      {
LABEL_51:

        if (objc_msgSend(v98, "count"))
        {
          v92 = (void *)MEMORY[0x1B5E08BF0]();
          objc_storeStrong(v151 + 5, v87);
          v100 = objc_alloc_init(CPLExtractedBatch);

          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          objc_msgSend(v151[5], "batch");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v120, v167, 16);
          if (!v106)
            goto LABEL_93;
          v102 = v40;
          v104 = *(_QWORD *)v121;
          while (1)
          {
            for (k = 0; k != v106; ++k)
            {
              if (*(_QWORD *)v121 != v104)
                objc_enumerationMutation(v102);
              v42 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
              if (!objc_msgSend(v42, "isMasterChange"))
              {
                -[CPLExtractedBatch addChange:fromStorage:](v100, "addChange:fromStorage:", v42, *(_QWORD *)(*(_QWORD *)(v108 + 32) + 144));
                continue;
              }
              objc_msgSend(v42, "scopedIdentifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v98, "containsObject:", v43)
                && (objc_msgSend(v86, "containsObject:", v43) & 1) == 0)
              {
                objc_msgSend(v109, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v43, &v140);
                v44 = objc_claimAutoreleasedReturnValue();
                if (!v44)
                {
                  if (!_CPLSilentLogging)
                  {
                    __CPLTaskOSLogDomain_21238();
                    v72 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v170 = v42;
                      _os_log_impl(&dword_1B03C2000, v72, OS_LOG_TYPE_ERROR, "%@ should have a cloud scoped identifier here", buf, 0xCu);
                    }

                  }
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v44);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  v74 = *(_QWORD *)(v108 + 56);
                  v75 = *(_QWORD *)(v108 + 32);
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v74, v75, v76, 466, CFSTR("%@ should have a cloud scoped identifier here"), v42);

                  abort();
                }
                contexta = (void *)v44;
                objc_msgSend(*(id *)(*(_QWORD *)(v108 + 32) + 224), "itemWithScopedIdentifier:");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = *(_QWORD *)(v108 + 32);
                if (*(_QWORD *)(v45 + 208))
                {
                  objc_msgSend(*(id *)(v45 + 256), "targetForRecordWithScopedIdentifier:", contexta);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v46;
                  if (!v46)
                  {
                    if (!_CPLSilentLogging)
                    {
                      __CPLTaskOSLogDomain_21238();
                      v77 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v170 = v42;
                        _os_log_impl(&dword_1B03C2000, v77, OS_LOG_TYPE_ERROR, "%@ should know its target here", buf, 0xCu);
                      }

                    }
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v79 = *(_QWORD *)(v108 + 56);
                    v80 = *(_QWORD *)(v108 + 32);
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", v79, v80, v81, 479, CFSTR("%@ should know its target here"), v42);

                    abort();
                  }
                  v48 = objc_msgSend(v46, "targetState");
                  if ((unint64_t)(v48 - 2) < 2)
                  {
                    v94 = v47;
                    v49 = 3000;
                    goto LABEL_70;
                  }
                  if (v48 == 1)
                  {
                    v50 = 2000;
                  }
                  else
                  {
                    v94 = v47;
                    v49 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_70:
                    v118 = 0u;
                    v119 = 0u;
                    v116 = 0u;
                    v117 = 0u;
                    objc_msgSend(*(id *)(*(_QWORD *)(v108 + 32) + 416), "allChangesWithClass:relatedScopedIdentifier:", objc_opt_class(), v43);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v116, v166, 16);
                    if (v53)
                    {
                      v54 = *(_QWORD *)v117;
                      while (2)
                      {
                        for (m = 0; m != v53; ++m)
                        {
                          if (*(_QWORD *)v117 != v54)
                            objc_enumerationMutation(v52);
                          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * m), "_pushContext");
                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                          v57 = objc_msgSend(v56, "priority");

                          if (v57 == 2000)
                          {
                            v49 = 2000;
                            goto LABEL_82;
                          }
                          if (v49 > 0x7D0)
                            v49 = v57;
                        }
                        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v116, v166, 16);
                        if (v53)
                          continue;
                        break;
                      }
                    }
LABEL_82:

                    if (v49 == 0x7FFFFFFFFFFFFFFFLL)
                      v50 = 2000;
                    else
                      v50 = v49;
                    v47 = v94;
                  }

                  v45 = *(_QWORD *)(v108 + 32);
                  v51 = CFSTR("keep master with related asset");
                }
                else
                {
                  v50 = 2000;
                  v51 = CFSTR("master has resources to upload");
                }
                if (v50 > *(_QWORD *)(v45 + 408))
                  ((void (**)(_QWORD, void *, void *, unint64_t, const __CFString *))v89)[2](v89, v95, v42, v50, v51);

              }
            }
            v40 = v102;
            v106 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v120, v167, 16);
            if (!v106)
            {
LABEL_93:

              objc_autoreleasePoolPop(v92);
              goto LABEL_95;
            }
          }
        }
        v100 = v87;
LABEL_95:
        v58 = *((unsigned __int8 *)v137 + 24);
        if (*((_BYTE *)v137 + 24))
          objc_storeStrong(v151 + 5, v100);

        _Block_object_dispose(&v136, 8);
        objc_autoreleasePoolPop(v83);
        if (!v58)
          break;
        goto LABEL_4;
      }
    }
  }
  if (objc_msgSend((id)v160[5], "count"))
  {
    v59 = objc_alloc_init(CPLChangeBatch);
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v60 = *(id *)(*(_QWORD *)(v108 + 32) + 168);
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v165, 16);
    if (v61)
    {
      v62 = *(_QWORD *)v113;
      do
      {
        for (n = 0; n != v61; ++n)
        {
          if (*(_QWORD *)v113 != v62)
            objc_enumerationMutation(v60);
          v64 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * n);
          v65 = (void *)v160[5];
          objc_msgSend(v64, "scopedIdentifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v65) = objc_msgSend(v65, "containsObject:", v66);

          if ((v65 & 1) == 0)
            -[CPLChangeBatch addRecord:](v59, "addRecord:", v64);
        }
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v165, 16);
      }
      while (v61);
    }

    objc_storeStrong((id *)(*(_QWORD *)(v108 + 32) + 168), v59);
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_41;
    v111[3] = &unk_1E60DD7C0;
    v111[4] = *(_QWORD *)(v108 + 32);
    v111[5] = &v150;
    objc_msgSend(v85, "do:", v111);

  }
  _Block_object_dispose(&v150, 8);

  _Block_object_dispose(&v159, 8);
  v3 = v85;
LABEL_110:

}

void __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  _QWORD block[4];
  id v19;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v3, "error");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v5 = *(_QWORD **)(a1 + 32);
    if (v7)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "shouldDefer");

      v5 = *(_QWORD **)(a1 + 32);
      if (!v9)
      {
        v11 = (void *)v5[13];
        v12 = MEMORY[0x1E0C809B0];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2_44;
        v16[3] = &unk_1E60D6F88;
        v16[4] = v5;
        v17 = *(id *)(a1 + 40);
        v13 = v16;
        block[0] = v12;
        block[1] = 3221225472;
        block[2] = __cpl_dispatch_async_block_invoke_21285;
        block[3] = &unk_1E60D71F8;
        v19 = v13;
        v14 = v11;
        v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        dispatch_async(v14, v15);

        goto LABEL_8;
      }
      +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = (void *)v6;
  objc_msgSend(v5, "_uploadTaskDidFinishWithError:", v6);

LABEL_8:
}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateNeededDerivativesWithFetchCache:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_19(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;

  v9 = a2;
  v10 = a3;
  v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  if ((objc_msgSend(v11, "containsObject:", v10) & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v10);
    v16 = *(void **)(a1[4] + 200);
    if (!v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = a1[4];
      v19 = *(void **)(v18 + 200);
      *(_QWORD *)(v18 + 200) = v17;

      v16 = *(void **)(a1[4] + 200);
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", a1[5], v10);
    v15 = objc_msgSend(*(id *)(a1[4] + 416), "reinjectChange:priority:error:", v9, a4, a5);
  }

  return v15;
}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  id obj;
  id v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "batch");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = v4;
    v25 = a2;
    v6 = 0;
    v7 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "scopedIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        objc_msgSend(*(id *)(a1 + 32), "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v10, &v28);
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_21238();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v9;
              _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Cloud scoped identifier for %@ should be known here", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(_QWORD *)(a1 + 88);
          v23 = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, v24, 364, CFSTR("Cloud scoped identifier for %@ should be known here"), v9);

          abort();
        }
        v12 = (void *)v11;
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)(a1 + 64);
          v16 = objc_msgSend(v13, "pushRepositoryPriority");
          v27 = v6;
          LODWORD(v15) = (*(uint64_t (**)(uint64_t, void *, void *, uint64_t, id *))(v15 + 16))(v15, v9, v12, v16, &v27);
          v17 = v27;

          if (!(_DWORD)v15)
          {

            if (v25)
            {
              v17 = objc_retainAutorelease(v17);
              v18 = 0;
              *v25 = v17;
            }
            else
            {
              v18 = 0;
            }
            goto LABEL_21;
          }
          v6 = v17;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "addChange:fromStorage:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144));

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 56));
  v18 = 1;
  v17 = v6;
LABEL_21:

  return v18;
}

void __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_26(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v9 = a2;
  v10 = a3;
  objc_msgSend(v9, "dropChangeWithReason:", a5);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2_27;
  v15[3] = &unk_1E60DD770;
  v11 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v16 = v10;
  v17 = v9;
  v18 = v12;
  v19 = a4;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v11, "do:", v15);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_41(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_21238();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "After considering priorities, new batch to commit is %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "storeExtractedBatch:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2_27(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, void *, _QWORD, uint64_t))(v5 + 16))(v5, v4, v6, *(_QWORD *)(a1 + 56), a2);

  return v7;
}

void __85__CPLUploadPushedChangesTask__markUploadedTasksDidFinishWithError_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(a1 + 40));
}

uint64_t __76__CPLUploadPushedChangesTask__updateQuotaStrategyAfterSuccessInTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 208);
  if (v5)
  {
    result = objc_msgSend(*(id *)(v4 + 120), "setValue:forFlag:forScope:error:", 0, 2, v5, a2);
    if (!(_DWORD)result)
      return result;
    v4 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(void **)(v4 + 120);
  objc_msgSend((id)v4, "scope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "setValue:forFlag:forScope:error:", 0, 2, v8, a2);

  return v9;
}

+ (BOOL)disableOverQuotaRule
{
  char v2;
  void *v3;
  void *v4;

  if (_overrideDisableOverQuotaRule == 1)
    return _disableOverQuotaRule != 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CPLDisableOverQuotaRule"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v4, "BOOLValue");
  else
    v2 = 1;

  return v2;
}

+ (void)setDisableOverQuotaRule:(BOOL)a3
{
  _disableOverQuotaRule = a3;
  _overrideDisableOverQuotaRule = 1;
}

+ (void)resetDisabledOverQuotaRule
{
  _overrideDisableOverQuotaRule = 0;
}

@end
