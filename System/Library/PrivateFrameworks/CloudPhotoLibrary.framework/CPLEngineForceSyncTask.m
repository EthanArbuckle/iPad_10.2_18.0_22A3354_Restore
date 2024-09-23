@implementation CPLEngineForceSyncTask

- (CPLEngineForceSyncTask)initWithScopeIdentifiers:(id)a3 engineLibrary:(id)a4 filter:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  CPLEngineForceSyncTask *v14;
  CPLEngineForceSyncTask *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  uint64_t v18;
  CPLSyncSessionConfiguration *configuration;
  void *v20;
  uint64_t v21;
  CPLSyncSession *fakeSession;
  uint64_t v23;
  NSDate *creationDate;
  objc_super v26;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CPLEngineForceSyncTask;
  v14 = -[CPLForceSyncTask initWithScopeIdentifiers:](&v26, sel_initWithScopeIdentifiers_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_engineLibrary, a4);
    objc_storeStrong((id *)&v15->_filter, a5);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v16 = dispatch_queue_create("com.apple.cpl.forcesync", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v15->_currentTaskLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v11, "configuration");
    v18 = objc_claimAutoreleasedReturnValue();
    configuration = v15->_configuration;
    v15->_configuration = (CPLSyncSessionConfiguration *)v18;

    -[CPLEngineLibrary scheduler](v15->_engineLibrary, "scheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLSyncSession detachedSyncSessionWithScheduler:configuration:scopeFilter:](CPLSyncSession, "detachedSyncSessionWithScheduler:configuration:scopeFilter:", v20, v15, v12);
    v21 = objc_claimAutoreleasedReturnValue();
    fakeSession = v15->_fakeSession;
    v15->_fakeSession = (CPLSyncSession *)v21;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = objc_claimAutoreleasedReturnValue();
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v23;

  }
  return v15;
}

- (void)dealloc
{
  CPLSyncSession *fakeSession;
  objc_super v4;

  fakeSession = self->_fakeSession;
  if (fakeSession)
    -[CPLSyncSession sessionWontHappen](fakeSession, "sessionWontHappen");
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineForceSyncTask;
  -[CPLEngineForceSyncTask dealloc](&v4, sel_dealloc);
}

- (BOOL)forBackup
{
  return 0;
}

- (BOOL)forDownload
{
  return 0;
}

- (BOOL)forcingProcessedStagedScopes
{
  return 0;
}

- (CPLBackgroundActivity)taskActivity
{
  return -[CPLSyncSession detachedActivity](self->_fakeSession, "detachedActivity");
}

- (void)setTaskActivity:(id)a3
{
  -[CPLSyncSession setDetachedActivity:](self->_fakeSession, "setDetachedActivity:", a3);
}

- (void)cancelTask
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPLEngineForceSyncTask;
  -[CPLForceSyncTask cancelTask](&v4, sel_cancelTask);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "forceSyncTaskHasBeenCancelled:", self);

}

- (void)_dispatchSyncTask:(id)a3
{
  CPLEngineSyncTask *v4;
  CPLEngineSyncTask *currentTask;
  CPLEngineSyncTask *v6;

  v4 = (CPLEngineSyncTask *)a3;
  os_unfair_lock_lock(&self->_currentTaskLock);
  currentTask = self->_currentTask;
  self->_currentTask = v4;
  v6 = v4;

  -[CPLEngineSyncTask setTransportUserIdentifier:](v6, "setTransportUserIdentifier:", self->_transportUserIdentifier);
  -[CPLEngineSyncTask setForceSync:](v6, "setForceSync:", 1);
  -[CPLEngineSyncTask setForeground:](v6, "setForeground:", 1);
  -[CPLEngineSyncTask setDelegate:](v6, "setDelegate:", self);
  -[CPLEngineSyncTask launch](v6, "launch");

  os_unfair_lock_unlock(&self->_currentTaskLock);
}

- (id)_currentTask
{
  os_unfair_lock_s *p_currentTaskLock;
  CPLEngineSyncTask *v4;

  p_currentTaskLock = &self->_currentTaskLock;
  os_unfair_lock_lock(&self->_currentTaskLock);
  v4 = self->_currentTask;
  os_unfair_lock_unlock(p_currentTaskLock);
  return v4;
}

- (void)_dropCurrentTask
{
  os_unfair_lock_s *p_currentTaskLock;
  CPLEngineSyncTask *currentTask;

  p_currentTaskLock = &self->_currentTaskLock;
  os_unfair_lock_lock(&self->_currentTaskLock);
  currentTask = self->_currentTask;
  self->_currentTask = 0;

  os_unfair_lock_unlock(p_currentTaskLock);
}

- (void)_dispatchNextSyncTask
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  CPLEngineForceSyncTask *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSEnumerator nextObject](self->_syncTaskEnumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLForceSyncOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "taskIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138543618;
        v7 = self;
        v8 = 2114;
        v9 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: launching %{public}@", (uint8_t *)&v6, 0x16u);

      }
    }
    -[CPLEngineForceSyncTask _dispatchSyncTask:](self, "_dispatchSyncTask:", v3);
  }
  else
  {
    -[CPLEngineForceSyncTask _finishWithError:](self, "_finishWithError:", 0);
  }

}

- (void)_finishWithError:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  CPLSyncSession *fakeSession;

  v4 = a3;
  -[CPLEngineForceSyncTask taskDidFinishWithErrorBlock](self, "taskDidFinishWithErrorBlock");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, CPLEngineForceSyncTask *, id))v5)[2](v5, self, v4);

  self->_reallyLaunched = 0;
  -[CPLSyncSession sessionIsDone](self->_fakeSession, "sessionIsDone");
  fakeSession = self->_fakeSession;
  self->_fakeSession = 0;

  +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", CFSTR("cpl.forcesync"));
}

- (void)launchTask
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "forceSyncTaskHasBeenLaunched:", self);

}

- (void)reallyLaunch
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
  v7[2] = __38__CPLEngineForceSyncTask_reallyLaunch__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16158;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)reallyCancel
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
  v7[2] = __38__CPLEngineForceSyncTask_reallyCancel__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16158;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
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
  v15[2] = __50__CPLEngineForceSyncTask_task_didFinishWithError___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16158;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (id)_phaseDescription
{
  os_unfair_lock_s *p_currentTaskLock;
  void *v4;
  uint64_t v5;
  void *v6;

  p_currentTaskLock = &self->_currentTaskLock;
  os_unfair_lock_lock(&self->_currentTaskLock);
  -[CPLEngineSyncTask phaseDescription](self->_currentTask, "phaseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), objc_opt_class(), v4);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  os_unfair_lock_unlock(p_currentTaskLock);

  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  -[CPLEngineForceSyncTask _phaseDescription](self, "_phaseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = objc_opt_class();
  -[CPLForceSyncTask taskIdentifier](self, "taskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLForceSyncTask scopeIdentifiers](self, "scopeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v3)
    v10 = objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %@ (%@) (%@)>"), v5, v6, v8, v3);
  else
    v10 = objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %@ (%@)>"), v5, v6, v8, v13);
  v11 = (void *)v10;

  return (NSString *)v11;
}

- (BOOL)allowsLocalConflictResolutionWhenOverQuota
{
  return -[CPLSyncSessionConfiguration allowsLocalConflictResolutionWhenOverQuota](self->_configuration, "allowsLocalConflictResolutionWhenOverQuota");
}

- (int64_t)maximumComputeStatesToUploadPerBatch
{
  return -[CPLSyncSessionConfiguration maximumComputeStatesToUploadPerBatch](self->_configuration, "maximumComputeStatesToUploadPerBatch");
}

- (BOOL)isComputeStateTaskUploadEnabled
{
  return -[CPLSyncSessionConfiguration isComputeStateTaskUploadEnabled](self->_configuration, "isComputeStateTaskUploadEnabled");
}

- (CPLEngineStoreUserIdentifier)transportUserIdentifier
{
  return self->_transportUserIdentifier;
}

- (void)setTransportUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transportUserIdentifier, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (CPLScopeFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (CPLEngineLibrary)engineLibrary
{
  return self->_engineLibrary;
}

- (void)setEngineLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_engineLibrary, a3);
}

- (CPLEngineForceSyncTaskDelegate)delegate
{
  return (CPLEngineForceSyncTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)taskDidFinishWithErrorBlock
{
  return self->_taskDidFinishWithErrorBlock;
}

- (void)setTaskDidFinishWithErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)bypassForceSyncLimitations
{
  return self->_bypassForceSyncLimitations;
}

- (void)setBypassForceSyncLimitations:(BOOL)a3
{
  self->_bypassForceSyncLimitations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskDidFinishWithErrorBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_engineLibrary, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_transportUserIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncTaskEnumerator, 0);
  objc_storeStrong((id *)&self->_fakeSession, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__CPLEngineForceSyncTask_task_didFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_currentTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dropCurrentTask");
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      if (!_CPLSilentLogging)
      {
        __CPLForceSyncOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v5 = *(_QWORD *)(a1 + 32);
          v6 = *(_QWORD *)(a1 + 40);
          v7 = *(_QWORD *)(a1 + 48);
          v13 = 138543874;
          v14 = v5;
          v15 = 2114;
          v16 = v6;
          v17 = 2112;
          v18 = v7;
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed during %{public}@: %@", (uint8_t *)&v13, 0x20u);
        }

        v3 = *(_QWORD *)(a1 + 48);
      }
      objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v3);
    }
    else
    {
      v8 = *(_BYTE **)(a1 + 32);
      if (v8[45])
      {
        if (!_CPLSilentLogging)
        {
          __CPLForceSyncOSLogDomain();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_QWORD *)(a1 + 32);
            v11 = *(_QWORD *)(a1 + 40);
            v13 = 138543618;
            v14 = v10;
            v15 = 2114;
            v16 = v11;
            _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ has been cancelled during %{public}@", (uint8_t *)&v13, 0x16u);
          }

          v8 = *(_BYTE **)(a1 + 32);
        }
        +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_finishWithError:", v12);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_dispatchNextSyncTask");
      }
    }
  }

}

void __38__CPLEngineForceSyncTask_reallyCancel__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 45) = 1;
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[44])
  {
    objc_msgSend(v2, "_currentTask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    if (v3)
    {
      objc_msgSend(v3, "cancel");
    }
    else
    {
      v4 = *(void **)(a1 + 32);
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_finishWithError:", v5);

    }
  }
}

void __38__CPLEngineForceSyncTask_reallyLaunch__block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  CPLCleanupTask *v4;
  CPLTransportUpdateTask *v5;
  CPLPullScopesTask *v6;
  CPLScopeUpdateTask *v7;
  CPLProcessStagedScopesTask *v8;
  CPLPushToTransportTask *v9;
  CPLPushToTransportTask *v10;
  CPLPullFromTransportTask *v11;
  CPLMingleChangesTask *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willRunEngineElement:", CPLEngineElementStartForceSync);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 1;
  +[CPLTransaction beginTransactionWithIdentifier:description:keepPower:](CPLTransaction, "beginTransactionWithIdentifier:description:keepPower:", CFSTR("cpl.forcesync"), CFSTR("executing forced sync"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "sessionWillStart");
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[45])
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_finishWithError:", v16);
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = -[CPLEngineSyncTask initWithEngineLibrary:session:]([CPLCleanupTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v16, "addObject:", v4);

    v5 = -[CPLEngineMultiscopeSyncTask initWithEngineLibrary:session:]([CPLTransportUpdateTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v16, "addObject:", v5);

    v6 = -[CPLPullScopesTask initWithEngineLibrary:session:]([CPLPullScopesTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v16, "addObject:", v6);

    v7 = -[CPLEngineMultiscopeSyncTask initWithEngineLibrary:session:]([CPLScopeUpdateTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v16, "addObject:", v7);

    v8 = -[CPLEngineMultiscopeSyncTask initWithEngineLibrary:session:]([CPLProcessStagedScopesTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v16, "addObject:", v8);

    if ((objc_msgSend(*(id *)(a1 + 32), "forcingProcessedStagedScopes") & 1) == 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "forDownload") & 1) == 0)
      {
        v9 = -[CPLEngineMultiscopeSyncTask initWithEngineLibrary:session:]([CPLPushToTransportTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
        objc_msgSend(v16, "addObject:", v9);
        -[CPLPushToTransportTask setHighPriority:](v9, "setHighPriority:", 1);

        v10 = -[CPLEngineMultiscopeSyncTask initWithEngineLibrary:session:]([CPLPushToTransportTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
        objc_msgSend(v16, "addObject:", v10);

      }
      if ((objc_msgSend(*(id *)(a1 + 32), "forBackup") & 1) == 0)
      {
        v11 = -[CPLEngineMultiscopeSyncTask initWithEngineLibrary:session:]([CPLPullFromTransportTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
        objc_msgSend(v16, "addObject:", v11);

        v12 = -[CPLEngineMultiscopeSyncTask initWithEngineLibrary:session:]([CPLMingleChangesTask alloc], "initWithEngineLibrary:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
        objc_msgSend(v16, "addObject:", v12);

      }
    }
    objc_msgSend(v16, "objectEnumerator");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 64);
    *(_QWORD *)(v14 + 64) = v13;

    objc_msgSend(*(id *)(a1 + 32), "_dispatchNextSyncTask");
  }

}

@end
