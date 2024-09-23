@implementation CPLEngineMultiscopeSyncTask

- (CPLEngineMultiscopeSyncTask)initWithEngineLibrary:(id)a3 session:(id)a4
{
  CPLEngineMultiscopeSyncTask *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *currentTaskQueue;
  void *v11;
  void *v12;
  uint64_t v13;
  CPLEngineScopeStorage *scopes;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CPLEngineMultiscopeSyncTask;
  v4 = -[CPLEngineSyncTask initWithEngineLibrary:session:](&v16, sel_initWithEngineLibrary_session_, a3, a4);
  if (v4)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.cpl.multiscopetask", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    CPLCopyDefaultSerialQueueAttributes();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.cpl.multiscopetask.currenttask", v8);
    currentTaskQueue = v4->_currentTaskQueue;
    v4->_currentTaskQueue = (OS_dispatch_queue *)v9;

    -[CPLEngineSyncTask engineLibrary](v4, "engineLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scopes");
    v13 = objc_claimAutoreleasedReturnValue();
    scopes = v4->_scopes;
    v4->_scopes = (CPLEngineScopeStorage *)v13;

  }
  return v4;
}

- (id)_currentTask
{
  NSObject *currentTaskQueue;
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
  v9 = __Block_byref_object_copy__13591;
  v10 = __Block_byref_object_dispose__13592;
  v11 = 0;
  currentTaskQueue = self->_currentTaskQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__CPLEngineMultiscopeSyncTask__currentTask__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(currentTaskQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_setCurrentTask:(id)a3
{
  id v4;
  NSObject *currentTaskQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  currentTaskQueue = self->_currentTaskQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CPLEngineMultiscopeSyncTask__setCurrentTask___block_invoke;
  v7[3] = &unk_1E60D6F88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(currentTaskQueue, v7);

}

- (id)_currentScope
{
  void *v2;
  void *v3;

  -[CPLEngineMultiscopeSyncTask _currentTask](self, "_currentTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dispatchAsyncWithCurrentSubtask:(id)a3
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
  v11[2] = __63__CPLEngineMultiscopeSyncTask_dispatchAsyncWithCurrentSubtask___block_invoke;
  v11[3] = &unk_1E60DB970;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13582;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (BOOL)shouldStartTaskInTransaction:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isClientInSyncWithClientCache");

  return v5;
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncTask.m");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 213, CFSTR("%@ should be overridden by %@"), v17, objc_opt_class());

  abort();
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  return -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0);
}

- (id)scopeFilterInTransaction:(id)a3
{
  return 0;
}

- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4
{
  void *v5;
  CPLScopeFilter *baseScopeFilter;
  CPLScopeFilter *additionalScopeFilter;
  char v8;

  objc_msgSend(a3, "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  baseScopeFilter = self->_baseScopeFilter;
  if (baseScopeFilter && !-[CPLScopeFilter filterOnScopeIdentifier:](baseScopeFilter, "filterOnScopeIdentifier:", v5))
  {
    v8 = 0;
  }
  else
  {
    additionalScopeFilter = self->_additionalScopeFilter;
    if (additionalScopeFilter)
      v8 = -[CPLScopeFilter filterOnScopeIdentifier:](additionalScopeFilter, "filterOnScopeIdentifier:", v5);
    else
      v8 = 1;
  }

  return v8;
}

- (BOOL)shouldContinueAfterError:(id)a3 fromTask:(id)a4
{
  return 0;
}

- (BOOL)shouldSkipScopesWithMissingTransportScope
{
  return 1;
}

- (void)_launchTaskForNextScope
{
  void *v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  CPLEngineMultiscopeSyncTask *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CPLEngineSyncTask session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDefer");

  if (!v4)
  {
    if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
    {
      -[CPLEngineMultiscopeSyncTask _setCurrentTask:](self, "_setCurrentTask:", 0);
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = self;
      v16 = (id)v8;
    }
    else
    {
      -[NSMutableArray firstObject](self->_coveredScopes, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v10;
      if (v10)
      {
        objc_msgSend(v10, "scopeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_transportScopes, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray removeObjectAtIndex:](self->_coveredScopes, "removeObjectAtIndex:", 0);
        -[NSMutableDictionary removeObjectForKey:](self->_transportScopes, "removeObjectForKey:", v11);
        -[CPLEngineSyncTask session](self, "session");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CPLEngineMultiscopeSyncTask newScopedTaskWithScope:session:transportScope:clientCacheIdentifier:](self, "newScopedTaskWithScope:session:transportScope:clientCacheIdentifier:", v16, v13, v12, self->_clientCacheIdentifier);

        objc_msgSend(v14, "setForeground:", -[CPLEngineSyncTask foreground](self, "foreground"));
        objc_msgSend(v14, "setForceSync:", -[CPLEngineSyncTask forceSync](self, "forceSync"));
        -[CPLEngineSyncTask transportUserIdentifier](self, "transportUserIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTransportUserIdentifier:", v15);

        -[CPLEngineMultiscopeSyncTask _setCurrentTask:](self, "_setCurrentTask:", v14);
        objc_msgSend(v14, "setDelegate:", self);
        objc_msgSend(v14, "launch");

LABEL_13:
        return;
      }
      -[CPLEngineMultiscopeSyncTask _setCurrentTask:](self, "_setCurrentTask:", 0);
      v9 = self;
      v8 = 0;
    }
    -[CPLEngineSyncTask taskDidFinishWithError:](v9, "taskDidFinishWithError:", v8);
    goto LABEL_13;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_13504();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = (id)objc_opt_class();
      v6 = v18;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", buf, 0xCu);

    }
  }
  -[CPLEngineMultiscopeSyncTask _setCurrentTask:](self, "_setCurrentTask:", 0);
  +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineSyncTask taskDidFinishWithError:](self, "taskDidFinishWithError:", v7);

}

- (void)launch
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLEngineMultiscopeSyncTask;
  -[CPLEngineSyncTask launch](&v9, sel_launch);
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CPLEngineMultiscopeSyncTask_launch__block_invoke;
  v7[3] = &unk_1E60DD810;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = (id)objc_msgSend(v5, "performReadTransactionWithBlock:", v7);

}

- (void)setForceSync:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CPLEngineMultiscopeSyncTask_setForceSync___block_invoke;
  v4[3] = &unk_1E60DC878;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (void)setForeground:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CPLEngineMultiscopeSyncTask_setForeground___block_invoke;
  v4[3] = &unk_1E60DC878;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (void)cancel
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  objc_super v9;
  _QWORD block[4];
  id v11;

  v9.receiver = self;
  v9.super_class = (Class)CPLEngineMultiscopeSyncTask;
  -[CPLEngineSyncTask cancel](&v9, sel_cancel);
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__CPLEngineMultiscopeSyncTask_cancel__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13582;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  CPLEngineMultiscopeSyncTask *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  SEL v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke;
  v35[3] = &unk_1E60D7028;
  v35[4] = self;
  v10 = v7;
  v36 = v10;
  v38 = a2;
  v11 = v8;
  v37 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x1B5E08DC4](v35);
  objc_msgSend(v11, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("CloudPhotoLibraryErrorDomain"));

  if (!v14)
    goto LABEL_17;
  v15 = objc_msgSend(v11, "code");
  v16 = v15;
  if (v15 > 0x21 || ((1 << v15) & 0x300840000) == 0)
  {
    if (v15 != 1002)
    {
LABEL_17:
      v12[2](v12);
      goto LABEL_18;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_13504();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLEngineMultiscopeSyncTask _currentScope](self, "_currentScope");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "scopeIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v28;
        _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEFAULT, "Detected some feature has been disabled while processing %@ - will update disabled features", buf, 0xCu);

      }
    }
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "noteStoreNeedsToUpdateDisabledFeatures");
LABEL_16:

    goto LABEL_17;
  }
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "store");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scopesForTask");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");
  -[CPLEngineSyncTask session](self, "session");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v20)
  {
    objc_msgSend(v21, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, 0);

    goto LABEL_16;
  }
  if (v16 == 23)
    v23 = 4;
  else
    v23 = 5;
  objc_msgSend(v21, "requestSyncStateAtEndOfSyncSession:reschedule:", v23, 0);

  v32[0] = v9;
  v32[1] = 3221225472;
  v32[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_105;
  v32[3] = &unk_1E60DD810;
  v33 = v19;
  v34 = self;
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_108;
  v30[3] = &unk_1E60DD810;
  v30[4] = self;
  v31 = v11;
  v24 = v19;
  v25 = (id)objc_msgSend(v18, "performWriteTransactionWithBlock:completionHandler:", v32, v30);

LABEL_18:
}

- (id)phaseDescriptionLastChangeDate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  objc_super v14;

  -[CPLEngineMultiscopeSyncTask _currentTask](self, "_currentTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "phaseDescriptionLastChangeDate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("for %@ [%@]"), v7, v8);
LABEL_6:
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("for %@"), v7, v13);
    goto LABEL_6;
  }
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CPLEngineMultiscopeSyncTask;
    -[CPLEngineSyncTask phaseDescriptionLastChangeDate:](&v14, sel_phaseDescriptionLastChangeDate_, a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  v11 = v10;

  return v11;
}

- (id)phaseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  objc_super v12;

  -[CPLEngineMultiscopeSyncTask _currentTask](self, "_currentTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "phaseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("for %@ [%@]"), v5, v6);
LABEL_6:
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("for %@"), v5, v11);
    goto LABEL_6;
  }
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CPLEngineMultiscopeSyncTask;
    -[CPLEngineSyncTask phaseDescription](&v12, sel_phaseDescription);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  v9 = v8;

  return v9;
}

- (CPLEngineScopeStorage)scopes
{
  return self->_scopes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_additionalScopeFilter, 0);
  objc_storeStrong((id *)&self->_baseScopeFilter, 0);
  objc_storeStrong((id *)&self->_clientCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_transportScopes, 0);
  objc_storeStrong((id *)&self->_excludedScopes, 0);
  objc_storeStrong((id *)&self->_coveredScopes, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_currentTaskQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  NSObject *v9;
  dispatch_block_t v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  __int128 v15;
  _QWORD block[4];
  id v17;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v12[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_2;
  v12[3] = &unk_1E60D7028;
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 48);
  v7 = (id)v11;
  v15 = v11;
  v8 = v12;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13582;
  block[3] = &unk_1E60D71F8;
  v17 = v8;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v10);

}

void __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_105(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_2_106;
  v6[3] = &unk_1E60DDA30;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_13504();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "error");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Failed to mark scopes as needing update: %@", (uint8_t *)&v9, 0xCu);

      }
    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "taskDidFinishWithError:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_2_106(uint64_t a1, _QWORD *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_13504();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "%@ will need to be updated from the transport", buf, 0xCu);
          }

        }
        v13 = *(void **)(*(_QWORD *)(a1 + 40) + 144);
        v17 = v10;
        v14 = objc_msgSend(v13, "setScopeNeedsUpdateFromTransport:error:", v11, &v17);
        v7 = v17;

        if (!v14)
        {

          if (a2)
          {
            v7 = objc_retainAutorelease(v7);
            v15 = 0;
            *a2 = v7;
          }
          else
          {
            v15 = 0;
          }
          goto LABEL_19;
        }
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  v15 = 1;
LABEL_19:

  return v15;
}

uint64_t __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_currentTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_13504();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Unknown %@ called -[%@ %@]", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncTask.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, v13, 364, CFSTR("Unknown %@ called -[%@ %@]"), v14, v15, v16);

    abort();
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 && (objc_msgSend(*(id *)(a1 + 40), "shouldContinueAfterError:fromTask:", v4, *(_QWORD *)(a1 + 32)) & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "taskDidFinishWithError:", *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 40), "_launchTaskForNextScope");
}

void __37__CPLEngineMultiscopeSyncTask_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_currentTask");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "cancel");
    v1 = v2;
  }

}

void __45__CPLEngineMultiscopeSyncTask_setForeground___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  objc_super v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)CPLEngineMultiscopeSyncTask;
  objc_msgSendSuper2(&v4, sel_setForeground_, v2);
  objc_msgSend(*(id *)(a1 + 32), "_currentTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForeground:", *(unsigned __int8 *)(a1 + 40));

}

void __44__CPLEngineMultiscopeSyncTask_setForceSync___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  objc_super v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)CPLEngineMultiscopeSyncTask;
  objc_msgSendSuper2(&v4, sel_setForceSync_, v2);
  objc_msgSend(*(id *)(a1 + 32), "_currentTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForceSync:", *(unsigned __int8 *)(a1 + 40));

}

void __37__CPLEngineMultiscopeSyncTask_launch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _QWORD *v54;
  dispatch_block_t v55;
  char v56;
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  _BYTE buf[24];
  void *v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v3, "error");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskDidFinishWithError:", v6);
LABEL_36:

    goto LABEL_37;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldStartTaskInTransaction:", v3) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "clientCacheIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 120);
    *(_QWORD *)(v8 + 120) = v7;

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 96);
    *(_QWORD *)(v11 + 96) = v10;

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 112);
    *(_QWORD *)(v14 + 112) = v13;

    objc_msgSend(*(id *)(a1 + 32), "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scopeFilter");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 128);
    *(_QWORD *)(v18 + 128) = v17;

    objc_msgSend(*(id *)(a1 + 32), "scopeFilterInTransaction:", v3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 136);
    *(_QWORD *)(v21 + 136) = v20;

    v56 = objc_msgSend(*(id *)(a1 + 32), "shouldSkipScopesWithMissingTransportScope");
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "enumerateScopesForTaskInTransaction:", v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v61;
LABEL_6:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v61 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v27);
        if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
          goto LABEL_20;
        objc_msgSend(v28, "scopeIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(*(id *)(a1 + 32), "shouldProcessScope:inTransaction:", v28, v3);
        v31 = *(_QWORD *)(a1 + 32);
        if ((v30 & 1) == 0)
        {
          if (!*(_QWORD *)(v31 + 104))
            objc_msgSend(0, "addObject:", v28);
          goto LABEL_18;
        }
        objc_msgSend(*(id *)(v31 + 144), "transportScopeForScope:", v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          break;
        if ((v56 & 1) == 0)
          goto LABEL_16;
LABEL_17:

LABEL_18:
        if (v25 == ++v27)
        {
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
          if (v25)
            goto LABEL_6;
          goto LABEL_20;
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKeyedSubscript:", v32, v29);
LABEL_16:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", v28);
      goto LABEL_17;
    }
LABEL_20:

    v33 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v34 = *(_QWORD *)(a1 + 32);
    if (v33)
    {
      v35 = *(void **)(v34 + 72);
      v36 = MEMORY[0x1E0C809B0];
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_2;
      v59[3] = &unk_1E60D65B8;
      v59[4] = v34;
      v37 = v59;
LABEL_35:
      v54 = v37;
      *(_QWORD *)buf = v36;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_13582;
      v66 = &unk_1E60D71F8;
      v67 = v54;
      v6 = v35;
      v55 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v6, v55);

      goto LABEL_36;
    }
    v40 = objc_msgSend(*(id *)(v34 + 96), "count");
    v41 = *(_QWORD *)(a1 + 32);
    if (!v40)
    {
      v35 = *(void **)(v41 + 72);
      v36 = MEMORY[0x1E0C809B0];
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_2_98;
      v57[3] = &unk_1E60D65B8;
      v57[4] = v41;
      v37 = v57;
      goto LABEL_35;
    }
    if (*(_QWORD *)(v41 + 104))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_13504();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = (void *)objc_opt_class();
          v44 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
          v45 = v43;
          v46 = objc_msgSend(v44, "count");
          v47 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v43;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v46;
          *(_WORD *)&buf[22] = 2048;
          v66 = (void *)v47;
          v48 = "Launching %@ for %ld scopes (ignored %ld)";
          v49 = v42;
          v50 = 32;
LABEL_32:
          _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_DEFAULT, v48, buf, v50);

          goto LABEL_33;
        }
        goto LABEL_33;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_13504();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v51 = (void *)objc_opt_class();
        v52 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
        v45 = v51;
        v53 = objc_msgSend(v52, "count");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v53;
        v48 = "Launching %@ for %ld scopes";
        v49 = v42;
        v50 = 22;
        goto LABEL_32;
      }
LABEL_33:

      v41 = *(_QWORD *)(a1 + 32);
    }
    v35 = *(void **)(v41 + 72);
    v36 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_97;
    v58[3] = &unk_1E60D65B8;
    v58[4] = v41;
    v37 = v58;
    goto LABEL_35;
  }
  v38 = *(void **)(a1 + 32);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "taskDidFinishWithError:", v39);

LABEL_37:
}

void __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "taskDidFinishWithError:", v2);

}

uint64_t __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_97(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchTaskForNextScope");
}

uint64_t __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_2_98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", 0);
}

void __63__CPLEngineMultiscopeSyncTask_dispatchAsyncWithCurrentSubtask___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_currentTask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __47__CPLEngineMultiscopeSyncTask__setCurrentTask___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

void __43__CPLEngineMultiscopeSyncTask__currentTask__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

@end
