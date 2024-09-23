@implementation CPLPushToTransportScopeTask

- (CPLPushToTransportScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12;
  id v13;
  CPLPushToTransportScopeTask *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *lock;
  void *v18;
  uint64_t v19;
  CPLEngineTransport *transport;
  void *v21;
  void *v22;
  uint64_t v23;
  CPLEnginePushRepository *pushRepository;
  void *v25;
  void *v26;
  uint64_t v27;
  CPLEngineScopeStorage *scopes;
  uint64_t v29;
  CPLEngineScheduler *scheduler;
  uint64_t v31;
  NSString *scopeIdentifier;
  objc_super v34;

  v12 = a3;
  v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)CPLPushToTransportScopeTask;
  v14 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](&v34, sel_initWithEngineLibrary_session_clientCacheIdentifier_scope_transportScope_, v12, a4, a5, v13, a7);
  if (v14)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.cpl.pushtotransport", v15);
    lock = v14->_lock;
    v14->_lock = (OS_dispatch_queue *)v16;

    v14->_currentSubtaskLock._os_unfair_lock_opaque = 0;
    -[CPLEngineSyncTask engineLibrary](v14, "engineLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transport");
    v19 = objc_claimAutoreleasedReturnValue();
    transport = v14->_transport;
    v14->_transport = (CPLEngineTransport *)v19;

    -[CPLEngineSyncTask engineLibrary](v14, "engineLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "store");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pushRepository");
    v23 = objc_claimAutoreleasedReturnValue();
    pushRepository = v14->_pushRepository;
    v14->_pushRepository = (CPLEnginePushRepository *)v23;

    -[CPLEngineSyncTask engineLibrary](v14, "engineLibrary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "store");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scopes");
    v27 = objc_claimAutoreleasedReturnValue();
    scopes = v14->_scopes;
    v14->_scopes = (CPLEngineScopeStorage *)v27;

    objc_msgSend(v12, "scheduler");
    v29 = objc_claimAutoreleasedReturnValue();
    scheduler = v14->_scheduler;
    v14->_scheduler = (CPLEngineScheduler *)v29;

    v14->_taskItem = -1;
    objc_msgSend(v13, "scopeIdentifier");
    v31 = objc_claimAutoreleasedReturnValue();
    scopeIdentifier = v14->_scopeIdentifier;
    v14->_scopeIdentifier = (NSString *)v31;

  }
  return v14;
}

- (CPLUploadPushedChangesTask)currentSubtask
{
  os_unfair_lock_s *p_currentSubtaskLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLPushToTransportScopeTask *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9931;
  v15 = __Block_byref_object_dispose__9932;
  v16 = 0;
  p_currentSubtaskLock = &self->_currentSubtaskLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __45__CPLPushToTransportScopeTask_currentSubtask__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_currentSubtaskLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_currentSubtaskLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLUploadPushedChangesTask *)v4;
}

- (void)_launchSubTask:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPLPushToTransportScopeTask *v11;
  id v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __46__CPLPushToTransportScopeTask__launchSubTask___block_invoke;
  v10 = &unk_1E60D6F88;
  v11 = self;
  v5 = v4;
  v12 = v5;
  v6 = v8;
  os_unfair_lock_lock(&self->_currentSubtaskLock);
  v9((uint64_t)v6);
  os_unfair_lock_unlock(&self->_currentSubtaskLock);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("launching subtask %@"), objc_opt_class());
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", v7);

  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
    -[CPLUploadPushedChangesTask cancel](self->_currentSubtask, "cancel");

}

- (void)_discardCurrentSubtask
{
  os_unfair_lock_s *p_currentSubtaskLock;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  CPLPushToTransportScopeTask *v7;

  p_currentSubtaskLock = &self->_currentSubtaskLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __53__CPLPushToTransportScopeTask__discardCurrentSubtask__block_invoke;
  v6 = &unk_1E60D65B8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_currentSubtaskLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_currentSubtaskLock);

}

- (id)scopesForTask
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (self->_sharedScope)
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLPushToTransportScopeTask;
    -[CPLEngineScopedTask scopesForTask](&v7, sel_scopesForTask);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObject:", self->_sharedScope);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CPLPushToTransportScopeTask;
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
  char v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  CPLEngineScope *sharedScope;
  void *v14;
  id v15;
  objc_super v17;
  uint8_t buf[4];
  CPLEngineScope *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CPLPushToTransportScopeTask;
  v4 = -[CPLEngineScopedTask checkScopeIsValidInTransaction:](&v17, sel_checkScopeIsValidInTransaction_, a3);
  if (v4)
  {
    if (self->_sharedScope)
    {
      -[CPLEngineScopedTask store](self, "store");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scopes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "validLocalScopeIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsIndex:", -[CPLEngineScope localIndex](self->_sharedScope, "localIndex"));

      if ((v8 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_9885();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            sharedScope = self->_sharedScope;
            v14 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v19 = sharedScope;
            v20 = 2112;
            v21 = v14;
            v15 = v14;
            _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Scope %@ is invalid, stopping %@ now", buf, 0x16u);

          }
          goto LABEL_12;
        }
LABEL_13:
        -[CPLPushToTransportScopeTask cancel](self, "cancel");
        LOBYTE(v4) = 0;
        return v4;
      }
    }
    -[CPLEngineScopedTask store](self, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cleanupTasks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasCleanupTasks");

    if (v11)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Can't upload records until cleanup tasks have been done", buf, 2u);
        }
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    LOBYTE(v4) = 1;
  }
  return v4;
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
      __CPLTaskOSLogDomain_9885();
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPushToTransportTask.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 279, CFSTR("%@ called too many times"), v15);

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
      __CPLTaskOSLogDomain_9885();
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPushToTransportTask.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 286, CFSTR("%@ called without any started task"), v19);

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

- (BOOL)_shouldUploadBatchesWithDropReason:(id *)a3 shouldQuarantineRecords:(BOOL *)a4 inTransaction:(id)a5
{
  BOOL *v5;
  CPLEngineScopeStorage *scopes;
  void *v8;

  v5 = a4;
  scopes = self->_scopes;
  -[CPLEngineScopedTask scope](self, "scope", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = !-[CPLEngineScopeStorage shouldDropAllUploadsForScope:dropReason:shouldQuarantineRecords:](scopes, "shouldDropAllUploadsForScope:dropReason:shouldQuarantineRecords:", v8, a3, v5);

  return (char)v5;
}

- (void)_prepareTransportGroupForOneBatch
{
  CPLEngineTransportGroup *storedTransportGroup;
  CPLEngineTransportGroup *v4;
  CPLEngineTransportGroup *transportGroup;

  storedTransportGroup = self->_storedTransportGroup;
  if (storedTransportGroup)
  {
    v4 = storedTransportGroup;
  }
  else
  {
    -[CPLEngineTransport createGroupForChangeUpload](self->_transport, "createGroupForChangeUpload");
    v4 = (CPLEngineTransportGroup *)objc_claimAutoreleasedReturnValue();
  }
  transportGroup = self->_transportGroup;
  self->_transportGroup = v4;

}

- (void)_noteSuccessfulUpdateInTransaction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_wasBusy)
  {
    -[CPLEngineScopedTask scope](self, "scope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_9885();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "It seems like %@ is not busy any more", buf, 0xCu);
      }

    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__CPLPushToTransportScopeTask__noteSuccessfulUpdateInTransaction___block_invoke;
    v8[3] = &unk_1E60DDA30;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v4, "do:", v8);

  }
}

- (void)_uploadChangesWithPriority:(unint64_t)a3 maxBatchSize:(unint64_t)a4
{
  OS_dispatch_queue *lock;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  dispatch_block_t v10;
  _QWORD v11[7];
  _QWORD block[4];
  id v13;

  if (!a4)
    a4 = +[CPLBatchExtractionStrategy maximumRecordCountPerBatch](CPLBatchExtractionStrategy, "maximumRecordCountPerBatch");
  lock = self->_lock;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CPLPushToTransportScopeTask__uploadChangesWithPriority_maxBatchSize___block_invoke;
  v11[3] = &unk_1E60DD0C0;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a3;
  v8 = v11;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9881;
  block[3] = &unk_1E60D71F8;
  v13 = v8;
  v9 = lock;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v10);

}

- (void)_resetPriority
{
  void *v3;
  id v4;
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[4];
  _QWORD v8[3];
  char v9;

  -[CPLEngineScopedTask store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__CPLPushToTransportScopeTask__resetPriority__block_invoke;
  v6[3] = &unk_1E60DDAD0;
  v6[4] = self;
  v6[5] = v8;
  v6[6] = v7;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CPLPushToTransportScopeTask__resetPriority__block_invoke_3;
  v5[3] = &unk_1E60DDAD0;
  v5[4] = self;
  v5[5] = v8;
  v5[6] = v7;
  v4 = (id)objc_msgSend(v3, "performWriteTransactionWithBlock:completionHandler:", v6, v5);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v8, 8);

}

- (void)_updateContributors:(id)a3
{
  id v4;
  CPLEngineTransport *transport;
  CPLEngineScope *sharedScope;
  CPLTransportScopeMapping *transportScopeMapping;
  id v8;
  CPLEngineTransportUpdateContributorsTask *v9;
  CPLEngineTransportUpdateContributorsTask *updateContributorsTask;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  CPLPushToTransportScopeTask *v15;
  id v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("updating contributors"));
  -[CPLPushToTransportScopeTask _prepareTransportGroupForOneBatch](self, "_prepareTransportGroupForOneBatch");
  -[CPLPushToTransportScopeTask _didStartTaskWithKey:recordCount:](self, "_didStartTaskWithKey:recordCount:", CFSTR("update-contributors"), objc_msgSend(v4, "count"));
  transport = self->_transport;
  sharedScope = self->_sharedScope;
  transportScopeMapping = self->_transportScopeMapping;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __51__CPLPushToTransportScopeTask__updateContributors___block_invoke;
  v14 = &unk_1E60DD6F8;
  v15 = self;
  v8 = v4;
  v16 = v8;
  -[CPLEngineTransport updateContributorsTaskWithSharedScope:contributorsUpdates:transportScopeMapping:completionHandler:](transport, "updateContributorsTaskWithSharedScope:contributorsUpdates:transportScopeMapping:completionHandler:", sharedScope, v8, transportScopeMapping, &v11);
  v9 = (CPLEngineTransportUpdateContributorsTask *)objc_claimAutoreleasedReturnValue();
  updateContributorsTask = self->_updateContributorsTask;
  self->_updateContributorsTask = v9;

  if (self->_highPriority)
    -[CPLEngineTransportUpdateContributorsTask setHighPriorityBackground:](self->_updateContributorsTask, "setHighPriorityBackground:", 1, v11, v12, v13, v14, v15);
  -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", self->_updateContributorsTask, self->_transportGroup, v11, v12, v13, v14, v15);

}

- (void)_acknowledgeContributorUpdatesAndContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[8];
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  _QWORD v17[3];
  char v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__9931;
  v19[4] = __Block_byref_object_dispose__9932;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v16[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke;
  v11[3] = &unk_1E60D9DB8;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  v13 = v19;
  v14 = v17;
  v15 = v16;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_4;
  v10[3] = &unk_1E60D9E08;
  v10[4] = self;
  v10[5] = v19;
  v10[6] = v17;
  v10[7] = v16;
  v9 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v11, v10);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

- (id)_contributorsUpdatesInTransaction:(id)a3
{
  BOOL v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  CPLEnginePushRepository *pushRepository;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  NSObject *v15;
  CPLPushToTransportScopeTask *v16;
  id v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v17 = 0;
  v4 = -[CPLPushToTransportScopeTask _shouldUploadBatchesWithDropReason:shouldQuarantineRecords:inTransaction:](self, "_shouldUploadBatchesWithDropReason:shouldQuarantineRecords:inTransaction:", &v17, &v18, a3);
  v5 = v17;
  if (v4)
  {
    -[CPLEngineScopedTask scope](self, "scope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopeIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();

    -[CPLEnginePushRepository contributorsUpdatesForScopeWithIdentifier:maxCount:](self->_pushRepository, "contributorsUpdatesForScopeWithIdentifier:maxCount:", v7, +[CPLBatchExtractionStrategy maximumRecordCountPerBatch](CPLBatchExtractionStrategy, "maximumRecordCountPerBatch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {
      pushRepository = self->_pushRepository;
      v14 = MEMORY[0x1E0C809B0];
      v7 = v7;
      v15 = v7;
      v16 = self;
      -[CPLPushToTransportScopeTask taskIdentifier](self, "taskIdentifier", v14, 3221225472, __65__CPLPushToTransportScopeTask__contributorsUpdatesInTransaction___block_invoke, &unk_1E60D9E30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEnginePushRepository addPushObserver:withIdentifier:](pushRepository, "addPushObserver:withIdentifier:", &v14, v10);

    }
  }
  else
  {
    if (_CPLSilentLogging)
    {
      v8 = 0;
      goto LABEL_9;
    }
    __CPLTaskOSLogDomain_9885();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLEngineScopedTask scope](self, "scope");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scopeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Won't try to update contributors because %{public}@ is read-only: %@", buf, 0x16u);

    }
    v8 = 0;
  }

LABEL_9:
  return v8;
}

- (void)_launch
{
  OS_dispatch_queue *lock;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("launching"));
  lock = self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9881;
  block[3] = &unk_1E60D71F8;
  v10 = v5;
  v6 = lock;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (void)launch
{
  objc_super v3;

  -[CPLPushToTransportScopeTask hash](self, "hash");
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)CPLPushToTransportScopeTask;
  -[CPLEngineSyncTask launch](&v3, sel_launch);
  -[CPLPushToTransportScopeTask _launch](self, "_launch");
}

- (void)cancel:(BOOL)a3
{
  OS_dispatch_queue *lock;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  _QWORD v10[5];
  BOOL v11;
  objc_super v12;
  _QWORD block[4];
  id v14;

  v12.receiver = self;
  v12.super_class = (Class)CPLPushToTransportScopeTask;
  -[CPLEngineSyncTask cancel](&v12, sel_cancel);
  lock = self->_lock;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__CPLPushToTransportScopeTask_cancel___block_invoke;
  v10[3] = &unk_1E60DC878;
  v10[4] = self;
  v11 = a3;
  v7 = v10;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9881;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = lock;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v9);

}

- (void)cancel
{
  -[CPLPushToTransportScopeTask cancel:](self, "cancel:", 0);
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

- (void)_includeScopeInMingling
{
  void *v3;
  void *v4;
  id v5;

  -[CPLEngineSyncTask session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "includeScopeIdentifierInMingling:", self->_scopeIdentifier);

  if (self->_sharedScope)
  {
    -[CPLEngineSyncTask session](self, "session");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CPLEngineScope scopeIdentifier](self->_sharedScope, "scopeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "includeScopeIdentifierInMingling:", v4);

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

- (void)_updateQuotaStrategyAfterSuccessInTransaction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__CPLPushToTransportScopeTask__updateQuotaStrategyAfterSuccessInTransaction___block_invoke;
  v3[3] = &unk_1E60DD6D0;
  v3[4] = self;
  objc_msgSend(a3, "do:", v3);
}

- (void)_pushTaskDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[7];
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", CFSTR("cleaning"));
  -[CPLPushToTransportScopeTask hash](self, "hash");
  kdebug_trace();
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_9885();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Push to transport finished (error: %@)", (uint8_t *)&buf, 0xCu);
    }

  }
  -[CPLEngineScopedTask store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9931;
  v19 = __Block_byref_object_dispose__9932;
  v20 = v4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke;
  v11[3] = &unk_1E60DD280;
  v11[4] = self;
  v8 = v20;
  v12 = v8;
  v13 = v14;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_2_88;
  v10[3] = &unk_1E60DDAD0;
  v10[4] = self;
  v10[5] = &buf;
  v10[6] = v14;
  v9 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v11, v10);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&buf, 8);

}

- (id)phaseDescriptionLastChangeDate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  -[CPLPushToTransportScopeTask currentSubtask](self, "currentSubtask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phaseDescriptionLastChangeDate:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLPushToTransportScopeTask;
    -[CPLEngineSyncTask phaseDescriptionLastChangeDate:](&v11, sel_phaseDescriptionLastChangeDate_, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)phaseDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[CPLPushToTransportScopeTask currentSubtask](self, "currentSubtask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phaseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CPLPushToTransportScopeTask;
    -[CPLEngineSyncTask phaseDescription](&v9, sel_phaseDescription);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)taskIdentifier
{
  if (self->_highPriority)
    return CFSTR("engine.sync.pushtotransport.highpriority");
  else
    return CFSTR("engine.sync.pushtotransport");
}

- (void)_uploadTask:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *lock;
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
  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9881;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = lock;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("finishing subtask %@"), objc_opt_class());
  -[CPLEngineSyncTask setPhaseDescription:](self, "setPhaseDescription:", v8);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPushToTransportTask.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 888, CFSTR("Received completion for unknown %@"), v11);

    abort();
  }
  -[CPLPushToTransportScopeTask _uploadTask:didFinishWithError:](self, "_uploadTask:didFinishWithError:", v11, v7);

}

- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5
{
  -[CPLEngineSyncTask taskDidProgress:userInfo:](self, "taskDidProgress:userInfo:", a5);
}

- (BOOL)task:(id)a3 checkScopeIsValidInTransaction:(id)a4
{
  return -[CPLPushToTransportScopeTask checkScopeIsValidInTransaction:](self, "checkScopeIsValidInTransaction:", a4);
}

- (BOOL)task:(id)a3 shouldRetryImmediatelyInTransaction:(id)a4
{
  CPLEnginePushRepository *pushRepository;
  NSString *scopeIdentifier;
  id v7;
  unint64_t v8;
  unint64_t v9;

  if (self->_retryImmediately)
    return 1;
  pushRepository = self->_pushRepository;
  scopeIdentifier = self->_scopeIdentifier;
  v7 = a3;
  v8 = -[CPLEnginePushRepository minimumPriorityForChangesInScopeWithIdentifier:](pushRepository, "minimumPriorityForChangesInScopeWithIdentifier:", scopeIdentifier);
  v9 = objc_msgSend(v7, "pushRepositoryPriority");

  return v8 < v9;
}

- (void)task:(id)a3 noteSuccessfulUpdateInTransaction:(id)a4
{
  -[CPLPushToTransportScopeTask _noteSuccessfulUpdateInTransaction:](self, "_noteSuccessfulUpdateInTransaction:", a4);
}

- (BOOL)task:(id)a3 shouldUploadBatchesWithDropReason:(id *)a4 shouldQuarantineRecords:(BOOL *)a5 inTransaction:(id)a6
{
  return -[CPLPushToTransportScopeTask _shouldUploadBatchesWithDropReason:shouldQuarantineRecords:inTransaction:](self, "_shouldUploadBatchesWithDropReason:shouldQuarantineRecords:inTransaction:", a4, a5, a6);
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSubtask, 0);
  objc_storeStrong((id *)&self->_taskStartDate, 0);
  objc_storeStrong((id *)&self->_currentTaskKey, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_storedTransportGroup, 0);
  objc_storeStrong((id *)&self->_updateContributorsTask, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[9];
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  uint64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[3];
  char v39;

  objc_msgSend(a1[4], "_discardCurrentSubtask");
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v35 = objc_msgSend(a1[5], "maxBatchSize");
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v33 = objc_msgSend(a1[5], "pushRepositoryPriority");
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_2;
  v29[3] = &unk_1E60DC8A0;
  v29[4] = a1[4];
  v29[5] = v30;
  v3 = (void *)MEMORY[0x1B5E08DC4](v29);
  v28[0] = v2;
  v28[1] = 3221225472;
  v28[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_3;
  v28[3] = &unk_1E60D7240;
  v28[4] = v38;
  v4 = (void *)MEMORY[0x1B5E08DC4](v28);
  v27[0] = v2;
  v27[1] = 3221225472;
  v27[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_4;
  v27[3] = &unk_1E60D9EB8;
  v27[4] = a1[4];
  v27[5] = v32;
  v27[6] = v34;
  v27[7] = v38;
  v27[8] = v36;
  v5 = (void *)MEMORY[0x1B5E08DC4](v27);
  objc_msgSend(a1[4], "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v18[1] = 3221225472;
  v18[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_98;
  v18[3] = &unk_1E60D9EE8;
  v18[4] = a1[4];
  v19 = a1[6];
  v7 = v5;
  v21 = v7;
  v24 = v34;
  v8 = v3;
  v22 = v8;
  v9 = v4;
  v23 = v9;
  v20 = a1[5];
  v25 = v32;
  v26 = v38;
  v11[0] = v2;
  v11[1] = 3221225472;
  v11[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_2_101;
  v11[3] = &unk_1E60D9F10;
  v11[4] = a1[4];
  v13 = v36;
  v14 = v38;
  v15 = v32;
  v16 = v34;
  v17 = v30;
  v12 = a1[6];
  v10 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v18, v11);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
}

void __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_excludeScopeFromMingling");
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "highPriority"))
    v3 = 7;
  else
    v3 = 8;
  objc_msgSend(v2, "requestSyncStateAtEndOfSyncSession:reschedule:", v3, 0);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

uint64_t __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

BOOL __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_4(_QWORD *a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1[4] + 144), "minimumPriorityForChangesInScopeWithIdentifier:", *(_QWORD *)(a1[4] + 120));
  v3 = v2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v2 < v5)
  {
    *(_QWORD *)(v4 + 24) = v2;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v2 < +[CPLRecordPushContext minimumPriorityForLocalConflictResolution](CPLRecordPushContext, "minimumPriorityForLocalConflictResolution");
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_9885();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1[4] + 120);
        if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
          v8 = CFSTR(" after resetting priority");
        else
          v8 = &stru_1E60DF6B8;
        v10 = 138543618;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Changes have been pushed by client for %{public}@ - restarting uploads%@", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  return v3 < v5;
}

void __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3))
    goto LABEL_46;
  if (objc_msgSend(*(id *)(a1 + 40), "isCPLErrorWithCode:", 1012))
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) == 0)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      if (v4 <= +[CPLBatchExtractionStrategy minimumRecordCountPerBatch](CPLBatchExtractionStrategy, "minimumRecordCountPerBatch"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_9885();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
            v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
            *(_DWORD *)buf = 138543618;
            v30 = v16;
            v31 = 2048;
            v32 = v17;
            _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Upload for %{public}@ failed because server finds that a batch size of %lu records is still too large. Will still continue synchronizing other scopes", buf, 0x16u);
          }

        }
        v9 = *(_QWORD *)(a1 + 64);
      }
      else
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) >> 1;
        if (v5 < +[CPLBatchExtractionStrategy minimumRecordCountPerBatch](CPLBatchExtractionStrategy, "minimumRecordCountPerBatch"))v5 = +[CPLBatchExtractionStrategy minimumRecordCountPerBatch](CPLBatchExtractionStrategy, "minimumRecordCountPerBatch");
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_9885();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
            objc_msgSend(*(id *)(a1 + 32), "scope");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v30 = v7;
            v31 = 2112;
            v32 = v8;
            v33 = 2048;
            v34 = v5;
            _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Server finds %lu is too large to handle changes for %@, setting maximum batch size to %lu temporarily and retrying", buf, 0x20u);

          }
        }
        v9 = *(_QWORD *)(a1 + 72);
      }
      (*(void (**)(void))(v9 + 16))();
    }
    goto LABEL_46;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCPLErrorWithCode:", 30))
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) != 0)
      goto LABEL_45;
    if (objc_msgSend(*(id *)(a1 + 48), "didUseOverQuotaStrategy"))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "forceSync"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_9885();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
            *(_DWORD *)buf = 138543362;
            v30 = v11;
            v12 = "Upload for %{public}@ failed because the scope is over quota. Will stop forced sync";
            v13 = v10;
            v14 = OS_LOG_TYPE_DEFAULT;
LABEL_32:
            _os_log_impl(&dword_1B03C2000, v13, v14, v12, buf, 0xCu);
            goto LABEL_33;
          }
          goto LABEL_33;
        }
        goto LABEL_45;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
          *(_DWORD *)buf = 138543362;
          v30 = v20;
          _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "Upload for %{public}@ failed because the scope is over quota. Will still continue synchronizing other scopes", buf, 0xCu);
        }

      }
      v21 = *(_QWORD *)(a1 + 64);
    }
    else
    {
      if (+[CPLPushToTransportTask dontAutoRetry](CPLPushToTransportTask, "dontAutoRetry"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_9885();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
            *(_DWORD *)buf = 138543362;
            v30 = v18;
            v12 = "Upload for %{public}@ failed because the scope is over quota";
            v13 = v10;
            v14 = OS_LOG_TYPE_ERROR;
            goto LABEL_32;
          }
LABEL_33:

        }
LABEL_45:
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_100;
        v26[3] = &unk_1E60DDA30;
        v24 = *(id *)(a1 + 40);
        v25 = *(_QWORD *)(a1 + 32);
        v27 = v24;
        v28 = v25;
        objc_msgSend(v3, "do:", v26);

        goto LABEL_46;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
          *(_DWORD *)buf = 138543362;
          v30 = v23;
          _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEFAULT, "Upload for %{public}@ failed because the scope is over quota. Retrying with over-quota strategy", buf, 0xCu);
        }

      }
      v21 = *(_QWORD *)(a1 + 72);
    }
    (*(void (**)(void))(v21 + 16))();
    goto LABEL_45;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "minimumPriorityForChangesInScopeWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
    }
  }
LABEL_46:

}

void __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_2_101(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v9, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_pushTaskDidFinishWithError:", v5);

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v6 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pushTaskDidFinishWithError:", v7);

  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetPriority");
  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_uploadChangesWithPriority:maxBatchSize:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      v8 = 0;
    else
      v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_pushTaskDidFinishWithError:", v8);
  }

}

uint64_t __62__CPLPushToTransportScopeTask__uploadTask_didFinishWithError___block_invoke_100(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CPLErrorIsCausedBySharedSync"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0
    || (v7 = *(_QWORD *)(a1 + 40), (v8 = *(_QWORD *)(v7 + 160)) == 0)
    || (result = objc_msgSend(*(id *)(v7 + 128), "setValue:forFlag:forScope:error:", 1, 2, v8, a2), (_DWORD)result))
  {
    v10 = *(_QWORD **)(a1 + 40);
    v11 = (void *)v10[16];
    objc_msgSend(v10, "scope");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "setValue:forFlag:forScope:error:", 1, 2, v12, a2);

    return v13;
  }
  return result;
}

void __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  char v7;
  id *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[6];
  _QWORD v33[5];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[18];
  objc_msgSend(v4, "taskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removePushObserverWithIdentifier:", v6);

  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "hasChangesInScopeWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  v8 = *(id **)(a1 + 32);
  if ((v7 & 1) != 0)
  {
    if ((objc_msgSend(v8[18], "hasChangesWithPriorityLowerThanPriority:inScopeWithIdentifier:", +[CPLRecordPushContext minimumPriorityForLocalConflictResolution](CPLRecordPushContext, "minimumPriorityForLocalConflictResolution"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120)) & 1) == 0)
    {
      if (_CPLSilentLogging)
      {
LABEL_16:
        objc_msgSend(*(id *)(a1 + 32), "_includeScopeInMingling");
        goto LABEL_17;
      }
      __CPLTaskOSLogDomain_9885();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        goto LABEL_16;
      }
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      *(_DWORD *)buf = 138543362;
      v35 = v17;
      v15 = "Push repository for %{public}@ only contains changes allowing local conflict resolution. Will allow mingling.";
LABEL_14:
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      goto LABEL_15;
    }
    if (*(_QWORD *)(a1 + 40))
      goto LABEL_17;
    objc_msgSend(*(id *)(a1 + 32), "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "allowsLocalConflictResolutionWhenOverQuota") & 1) != 0)
    {
      v10 = *(_QWORD **)(a1 + 32);
      v11 = (void *)v10[16];
      objc_msgSend(v10, "scope");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "valueForFlag:forScope:", 2, v12);

      if (!(_DWORD)v11)
        goto LABEL_17;
      if (_CPLSilentLogging)
        goto LABEL_16;
      __CPLTaskOSLogDomain_9885();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      *(_DWORD *)buf = 138543362;
      v35 = v14;
      v15 = "Push repository for %{public}@ contains changes but we are allowing local conflict resolution when over-quot"
            "a. Will allow mingling.";
      goto LABEL_14;
    }

  }
  else
  {
    objc_msgSend(v8, "_updateQuotaStrategyAfterSuccessInTransaction:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_includeScopeInMingling");
    v16 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v16 + 208) != -1)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_2;
      v33[3] = &unk_1E60DD6D0;
      v33[4] = v16;
      objc_msgSend(v3, "do:", v33);
    }
  }
LABEL_17:
  if (objc_msgSend(*(id *)(a1 + 40), "isCPLErrorWithCode:", 35))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CPLErrorScopeBusy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v20 = objc_msgSend(v19, "integerValue");
    else
      v20 = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "forceSync"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
          +[CPLScopeChange descriptionForBusyState:](CPLScopeChange, "descriptionForBusyState:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v22;
          v36 = 2112;
          v37 = v23;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Upload for %{public}@ failed because the scope is busy (%@). Will stop forced sync", buf, 0x16u);

        }
LABEL_34:

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLForKey:", CFSTR("CPLFailSyncSessionOnScopeBusy"));

      if ((v25 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_9885();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
            +[CPLScopeChange descriptionForBusyState:](CPLScopeChange, "descriptionForBusyState:", v20);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v27;
            v36 = 2112;
            v37 = v28;
            _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEFAULT, "Upload for %{public}@ failed because the scope is busy (%@). Will still continue synchronizing other scopes", buf, 0x16u);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "_excludeScopeFromMingling");
        objc_msgSend(*(id *)(a1 + 40), "userInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CPLErrorRetryAfterDate"));
        v21 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "session");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "highPriority"))
          v31 = 7;
        else
          v31 = 8;
        objc_msgSend(v30, "requestSyncStateAtEndOfSyncSession:reschedule:proposedRescheduleDate:", v31, v21 != 0, v21);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_34;
      }
    }
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_87;
    v32[3] = &unk_1E60D9E90;
    v32[4] = *(_QWORD *)(a1 + 32);
    v32[5] = v20;
    objc_msgSend(v3, "do:", v32);

  }
}

void __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_2_88(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || (objc_msgSend(v3, "error"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v4 = 0;
    else
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", v4);
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskDidFinishWithError:", v7);

  }
}

uint64_t __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[16];
  objc_msgSend(v4, "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "setScope:hasCompletedPushToTransportTask:error:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), a2);

  return v7;
}

uint64_t __59__CPLPushToTransportScopeTask__pushTaskDidFinishWithError___block_invoke_87(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)v4[16];
  objc_msgSend(v4, "scope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "storeBusyState:forScope:error:", v5, v7, a2);

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v9 + 160);
  if (v10)
    return objc_msgSend(*(id *)(v9 + 128), "storeBusyState:forScope:error:", *(_QWORD *)(a1 + 40), v10, a2);
  else
    return v8;
}

uint64_t __77__CPLPushToTransportScopeTask__updateQuotaStrategyAfterSuccessInTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t result;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 160))
  {
    v5 = objc_msgSend(*(id *)(v4 + 128), "valueForFlag:forScope:", 2);
    v4 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v6 = objc_msgSend(*(id *)(v4 + 128), "setValue:forFlag:forScope:error:", 0, 2, *(_QWORD *)(v4 + 160), a2);
      result = 0;
      if (!v6)
        return result;
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  v8 = *(void **)(v4 + 128);
  objc_msgSend((id)v4, "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "valueForFlag:forScope:", 2, v9);

  if (!(_DWORD)v8)
    return 1;
  v10 = *(_QWORD **)(a1 + 32);
  v11 = (void *)v10[16];
  objc_msgSend(v10, "scope");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "setValue:forFlag:forScope:error:", 0, 2, v12, a2);

  return v13;
}

void __38__CPLPushToTransportScopeTask_cancel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "currentSubtask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "cancel:", *(unsigned __int8 *)(a1 + 40));
  else
    objc_msgSend(v2, "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "cancel");

}

void __38__CPLPushToTransportScopeTask__launch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[8];
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[4];
  _QWORD v16[3];
  char v17;
  _QWORD v18[5];
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__9931;
  v18[4] = __Block_byref_object_dispose__9932;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke_2;
  v9[3] = &unk_1E60D9E58;
  v9[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v10 = v5;
  v6 = v2;
  v11 = v6;
  v12 = v18;
  v13 = v16;
  v14 = v15;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke_2_77;
  v8[3] = &unk_1E60D9E08;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v18;
  v8[6] = v16;
  v8[7] = v15;
  v7 = (id)objc_msgSend(v5, "performWriteTransactionWithBlock:completionHandler:", v9, v8);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

}

void __38__CPLPushToTransportScopeTask__launch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CPLTransportScopeMapping *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _QWORD v64[5];
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  NSObject *v69;
  __int16 v70;
  NSObject *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "pushToTransportTaskForScope:", v4);
    v5 = *(_QWORD **)(a1 + 32);
    v6 = (void *)v5[16];
    objc_msgSend(v5, "scope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uploadTransportGroupForScope:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 192);
    *(_QWORD *)(v9 + 192) = v8;

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "hasFinishedInitialSyncForScope:", v4) & 1) == 0)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) |= 1uLL;
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "hasFinishedAFullSyncForScope:", v4) & 1) == 0)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) |= 2uLL;
    if (objc_msgSend(*(id *)(a1 + 40), "hasPendingResetSync"))
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) |= 4uLL;
    v11 = [CPLTransportScopeMapping alloc];
    objc_msgSend(*(id *)(a1 + 48), "transport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CPLTransportScopeMapping initWithTranslator:](v11, "initWithTranslator:", v12);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 176);
    *(_QWORD *)(v14 + 176) = v13;

    objc_msgSend(*(id *)(a1 + 32), "transportScope");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    objc_msgSend(v4, "scopeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    objc_msgSend(v4, "scopeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "transportScope");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_9885();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 32), "transportScope");
            v50 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v4;
            v68 = 2112;
            v69 = v50;
            _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_ERROR, "Failed to create concrete scope of %@ from %@", buf, 0x16u);

          }
        }
        +[CPLErrors unknownError](CPLErrors, "unknownError");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setError:", v22);
LABEL_55:

        goto LABEL_56;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "scopes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sharingScopeForScope:", v4);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 160);
    *(_QWORD *)(v24 + 160) = v23;

    v26 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v26 + 160))
      goto LABEL_27;
    objc_msgSend(v22, "flagsForScope:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "valueForFlag:", 36) && (objc_msgSend(v27, "valueForFlag:", 64) & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
          *(_DWORD *)buf = 138412290;
          v67 = v29;
          _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEFAULT, "%@ is deleted - ignoring it", buf, 0xCu);
        }

      }
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(void **)(v30 + 160);
      *(_QWORD *)(v30 + 160) = 0;

    }
    v26 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v26 + 160))
    {
      v63 = v21;
      objc_msgSend(*(id *)(v26 + 128), "transportScopeForScope:");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v33 = *(_QWORD *)(a1 + 32);
        v34 = *(void **)(v33 + 176);
        objc_msgSend(*(id *)(v33 + 160), "scopeIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, v35);

        v36 = *(_QWORD *)(a1 + 32);
        v62 = *(void **)(v36 + 176);
        objc_msgSend(*(id *)(v36 + 160), "scopeIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "scopeIdentifier");
        v38 = v22;
        v39 = v3;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setSharedScopeIdentifier:forScopeWithIdentifier:", v37, v40);

        v3 = v39;
        v22 = v38;

      }
      v41 = *(_QWORD *)(a1 + 32);
      v42 = *(void **)(v41 + 176);
      objc_msgSend(*(id *)(v41 + 160), "scopeIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 && !v44)
      {
        v21 = v63;
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_9885();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
            *(_DWORD *)buf = 138412546;
            v67 = v46;
            v68 = 2112;
            v69 = v32;
            _os_log_impl(&dword_1B03C2000, v45, OS_LOG_TYPE_ERROR, "Failed to create concrete scope of %@ from %@", buf, 0x16u);
          }

        }
        +[CPLErrors unknownError](CPLErrors, "unknownError");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setError:", v47);

        goto LABEL_55;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
          *(_DWORD *)buf = 138413058;
          v67 = v4;
          v68 = 2112;
          v69 = v52;
          v70 = 2112;
          v71 = v63;
          v72 = 2112;
          v73 = v44;
          _os_log_impl(&dword_1B03C2000, v51, OS_LOG_TYPE_DEFAULT, "Will upload to %@/%@ concrete scopes: %@/%@", buf, 0x2Au);
        }

      }
      v21 = v63;
    }
    else
    {
LABEL_27:
      if (_CPLSilentLogging)
        goto LABEL_42;
      __CPLTaskOSLogDomain_9885();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v4;
        v68 = 2112;
        v69 = v21;
        _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_DEFAULT, "Will upload to %@ concrete scope: %@", buf, 0x16u);
      }
    }

    v26 = *(_QWORD *)(a1 + 32);
LABEL_42:
    v53 = objc_msgSend(*(id *)(v26 + 128), "busyStateForScope:", v4);
    v54 = v53;
    v55 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v55 + 160) && !v53)
      v54 = objc_msgSend(*(id *)(v55 + 128), "busyStateForScope:");
    if (v54)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          +[CPLScopeChange descriptionForBusyState:](CPLScopeChange, "descriptionForBusyState:", v54);
          v57 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v67 = v4;
          v68 = 2112;
          v69 = v57;
          _os_log_impl(&dword_1B03C2000, v56, OS_LOG_TYPE_DEFAULT, "Previous push-to-transport attempt for %@ failed because the scope was busy (%@)", buf, 0x16u);

        }
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 241) = 1;
    }
    v58 = *(_QWORD **)(a1 + 32);
    if (v58[20])
    {
      objc_msgSend(v58, "_contributorsUpdatesInTransaction:", v3);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v61 = *(void **)(v60 + 40);
      *(_QWORD *)(v60 + 40) = v59;

    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    {
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke_75;
      v64[3] = &unk_1E60D9D68;
      v64[4] = *(_QWORD *)(a1 + 32);
      v65 = *(_OWORD *)(a1 + 64);
      objc_msgSend(v3, "do:", v64);
    }
    goto LABEL_55;
  }
LABEL_56:

}

void __38__CPLPushToTransportScopeTask__launch__block_invoke_2_77(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v6 = *(_OWORD *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 32);
  v11[1] = 3221225472;
  v11[2] = __38__CPLPushToTransportScopeTask__launch__block_invoke_3;
  v11[3] = &unk_1E60D9DE0;
  v12 = v3;
  v14 = v6;
  v7 = v11;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9881;
  block[3] = &unk_1E60D71F8;
  v16 = v7;
  v8 = v4;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __38__CPLPushToTransportScopeTask__launch__block_invoke_3(uint64_t a1)
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
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    v13 = (id)v4;
    v7 = v3;
LABEL_6:
    objc_msgSend(v7, "_pushTaskDidFinishWithError:", v6);

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

  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v6 = objc_claimAutoreleasedReturnValue();
    v13 = (id)v6;
    v7 = v10;
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateContributors:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "_resetPriority");
  }
  else
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v12 = *(void **)(a1 + 40);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v12, "taskDidFinishWithError:", 0);
    else
      objc_msgSend(v12, "_uploadChangesWithPriority:maxBatchSize:", v11, 0);
  }
}

uint64_t __38__CPLPushToTransportScopeTask__launch__block_invoke_75(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1[4] + 144), "hasChangesWithPriorityLowerThanPriority:inScopeWithIdentifier:", +[CPLRecordPushContext minimumPriorityForLocalConflictResolution](CPLRecordPushContext, "minimumPriorityForLocalConflictResolution"), *(_QWORD *)(a1[4] + 120)))
  {
    result = objc_msgSend(*(id *)(a1[4] + 144), "resetPriorityForScopeWithIdentifier:maxCount:hasMore:error:", *(_QWORD *)(a1[4] + 120), 10000, *(_QWORD *)(a1[5] + 8) + 24, a2);
    if (!(_DWORD)result)
      return result;
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 144), "minimumPriorityForChangesInScopeWithIdentifier:", *(_QWORD *)(a1[4] + 120));
  }
  return 1;
}

void __65__CPLPushToTransportScopeTask__contributorsUpdatesInTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  objc_msgSend(v3, "updateSharingContributorUserIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "scopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scopeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Client pushed contributors updates while uploading records - will retry immediately", v9, 2u);
        }

      }
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 243) = 1;
    }
  }
  else
  {

  }
}

void __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  __int128 v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    v3 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_2;
    v11[3] = &unk_1E60DD918;
    v4 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 48);
    v12 = v5;
    v14 = v6;
    v7 = v8;
    v13 = v7;
    objc_msgSend(v7, "do:", v11);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    {
      v9[0] = v3;
      v9[1] = 3221225472;
      v9[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_3;
      v9[3] = &unk_1E60D9D68;
      v9[4] = *(_QWORD *)(a1 + 32);
      v10 = *(_OWORD *)(a1 + 56);
      objc_msgSend(v7, "do:", v9);
    }

  }
}

void __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v6 = *(_OWORD *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 32);
  v11[1] = 3221225472;
  v11[2] = __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_5;
  v11[3] = &unk_1E60D9DE0;
  v12 = v3;
  v14 = v6;
  v7 = v11;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9881;
  block[3] = &unk_1E60D71F8;
  v16 = v7;
  v8 = v4;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_5(uint64_t a1)
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
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    v13 = (id)v4;
    v7 = v3;
LABEL_6:
    objc_msgSend(v7, "_pushTaskDidFinishWithError:", v6);

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

  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v6 = objc_claimAutoreleasedReturnValue();
    v13 = (id)v6;
    v7 = v10;
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateContributors:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "_resetPriority");
  }
  else
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v12 = *(void **)(a1 + 40);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v12, "taskDidFinishWithError:", 0);
    else
      objc_msgSend(v12, "_uploadChangesWithPriority:maxBatchSize:", v11, 0);
  }
}

uint64_t __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "acknowledgeContributorsUpdates:error:", *(_QWORD *)(a1 + 40), a2);
  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_contributorsUpdatesInTransaction:", *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  return v3;
}

uint64_t __73__CPLPushToTransportScopeTask__acknowledgeContributorUpdatesAndContinue___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1[4] + 144), "resetPriorityForScopeWithIdentifier:maxCount:hasMore:error:", *(_QWORD *)(a1[4] + 120), 10000, *(_QWORD *)(a1[5] + 8) + 24, a2);
  if ((_DWORD)v3 && !*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 144), "minimumPriorityForChangesInScopeWithIdentifier:", *(_QWORD *)(a1[4] + 120));
  return v3;
}

void __51__CPLPushToTransportScopeTask__updateContributors___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __51__CPLPushToTransportScopeTask__updateContributors___block_invoke_2;
  v12[3] = &unk_1E60D6EC0;
  v12[4] = v4;
  v13 = v3;
  v14 = v5;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9881;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = v6;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __51__CPLPushToTransportScopeTask__updateContributors___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 184);
  *(_QWORD *)(v2 + 184) = 0;

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if (objc_msgSend(v4, "isCPLOperationCancelledError"))
    {
      v5 = 0;
      v6 = 1;
    }
    else
    {
      v5 = 1;
      v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", CFSTR("update-contributors"), v5, v6);
    v7 = *(id *)(a1 + 40);
    if (objc_msgSend(v7, "isCPLErrorWithCode:", 18))
    {
      objc_msgSend(v7, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CPLErrorRejectedRecordIdentifiersAndReasons"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_9885();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v9;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Failed to update contributors: %{public}@", (uint8_t *)&buf, 0xCu);
        }

      }
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__9931;
      v24 = __Block_byref_object_dispose__9932;
      v25 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __51__CPLPushToTransportScopeTask__updateContributors___block_invoke_59;
      v16[3] = &unk_1E60D9D90;
      v16[4] = &v17;
      v16[5] = &buf;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
      objc_msgSend(*(id *)(a1 + 40), "cplUnderlyingError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
        v12 = *(void **)(a1 + 40);
      v13 = v12;

      if (*((_BYTE *)v18 + 24))
      {
        +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 255, CFSTR("Server does not support contributors updates yet"));
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
          +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 150, CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
        else
          +[CPLErrors cplErrorWithCode:underlyingError:description:](CPLErrors, "cplErrorWithCode:underlyingError:description:", 150, v13, CFSTR("Server rejected contributors updates with no particular reason"));
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v14;

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v17, 8);

    }
    else
    {
      v15 = v7;
    }
    objc_msgSend(*(id *)(a1 + 32), "_pushTaskDidFinishWithError:", v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", CFSTR("update-contributors"), 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "resetBackoffInterval");
    objc_msgSend(*(id *)(a1 + 32), "_acknowledgeContributorUpdatesAndContinue:", *(_QWORD *)(a1 + 48));
  }
}

void __51__CPLPushToTransportScopeTask__updateContributors___block_invoke_59(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "hasPrefix:", CFSTR("Cannot create or modify field"));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __45__CPLPushToTransportScopeTask__resetPriority__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__CPLPushToTransportScopeTask__resetPriority__block_invoke_2;
    v4[3] = &unk_1E60D9D68;
    v5 = *(_OWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "do:", v4);
  }

}

void __45__CPLPushToTransportScopeTask__resetPriority__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v14, "error");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v5;
    objc_msgSend(v4, "_pushTaskDidFinishWithError:", v5);

    goto LABEL_6;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v4 = *(void **)(a1 + 32);
  if (v6)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldDefer");

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_pushTaskDidFinishWithError:", v11);

  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetPriority");
  }
  else
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v13 = *(void **)(a1 + 32);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v13, "taskDidFinishWithError:", 0);
    else
      objc_msgSend(v13, "_uploadChangesWithPriority:maxBatchSize:", v12, 0);
  }
LABEL_6:

}

uint64_t __45__CPLPushToTransportScopeTask__resetPriority__block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1[4] + 144), "resetPriorityForScopeWithIdentifier:maxCount:hasMore:error:", *(_QWORD *)(a1[4] + 120), 10000, *(_QWORD *)(a1[5] + 8) + 24, a2);
  if ((_DWORD)v3 && !*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 144), "minimumPriorityForChangesInScopeWithIdentifier:", *(_QWORD *)(a1[4] + 120));
  return v3;
}

void __71__CPLPushToTransportScopeTask__uploadChangesWithPriority_maxBatchSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CPLUploadPushedChangesTask *v13;
  CPLUploadPushedChangesTask *v14;

  v13 = [CPLUploadPushedChangesTask alloc];
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientCacheIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transportScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[24];
  v9 = v7[20];
  v10 = v7[22];
  v11 = v7[21];
  LOBYTE(v12) = objc_msgSend(v7, "highPriority");
  v14 = -[CPLUploadPushedChangesTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:storedTransportGroup:sharedScope:transportScopeMapping:ruleGroup:highPriority:maxBatchSize:pushRepositoryPriority:pushRepository:](v13, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:storedTransportGroup:sharedScope:transportScopeMapping:ruleGroup:highPriority:maxBatchSize:pushRepositoryPriority:pushRepository:", v2, v3, v4, v5, v6, v8, v9, v10, v11, v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));

  objc_msgSend(*(id *)(a1 + 32), "_launchSubTask:", v14);
}

uint64_t __66__CPLPushToTransportScopeTask__noteSuccessfulUpdateInTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "storeBusyState:forScope:error:", 0, *(_QWORD *)(a1 + 40), a2);
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 160);
    if (v6)
    {
      result = objc_msgSend(*(id *)(v5 + 128), "storeBusyState:forScope:error:", 0, v6, a2);
      if (!(_DWORD)result)
        return result;
      v5 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v5 + 241) = 0;
    return 1;
  }
  return result;
}

void __53__CPLPushToTransportScopeTask__discardCurrentSubtask__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 248);
  *(_QWORD *)(v1 + 248) = 0;

}

uint64_t __46__CPLPushToTransportScopeTask__launchSubTask___block_invoke(uint64_t a1)
{
  void *v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setForeground:", objc_msgSend(*(id *)(a1 + 32), "foreground"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setForceSync:", objc_msgSend(*(id *)(a1 + 32), "forceSync"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setDelegate:");
  objc_msgSend(*(id *)(a1 + 32), "transportUserIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setTransportUserIdentifier:", v2);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "launch");
}

void __45__CPLPushToTransportScopeTask_currentSubtask__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 248));
}

@end
