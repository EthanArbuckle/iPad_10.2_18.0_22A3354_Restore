@implementation CPLPushToTransportTask

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  _BOOL4 highPriority;
  void *v4;
  void *v5;
  void *v6;

  highPriority = self->_highPriority;
  -[CPLEngineMultiscopeSyncTask scopes](self, "scopes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (highPriority)
    objc_msgSend(v4, "enumeratorForScopesNeedingToPushHighPriorityChangesToTransport");
  else
    objc_msgSend(v4, "enumeratorForScopesNeedingToPushChangesToTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)scopeFilterInTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CPLEngineSyncTask session](self, "session", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopeIdentifiersExcludedFromPushToTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CPLEngineMultiscopeSyncTask scopes](self, "scopes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filterForExcludedScopeIdentifiers:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CPLPushToTransportScopeTask *v14;
  void *v15;
  CPLPushToTransportScopeTask *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CPLPushToTransportScopeTask alloc];
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPLPushToTransportScopeTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](v14, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:", v15, v12, v10, v13, v11);

  -[CPLPushToTransportScopeTask setHighPriority:](v16, "setHighPriority:", self->_highPriority);
  return v16;
}

- (BOOL)shouldSkipScopesWithMissingTransportScope
{
  return 0;
}

- (void)cancel:(BOOL)a3
{
  _QWORD v3[5];
  char v4;

  if (a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __33__CPLPushToTransportTask_cancel___block_invoke;
    v3[3] = &unk_1E60D9D18;
    v3[4] = self;
    v4 = 1;
    -[CPLEngineMultiscopeSyncTask dispatchAsyncWithCurrentSubtask:](self, "dispatchAsyncWithCurrentSubtask:", v3);
  }
  else
  {
    -[CPLEngineMultiscopeSyncTask cancel](self, "cancel");
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CPLPushToTransportTask_task_didFinishWithError___block_invoke;
  v7[3] = &unk_1E60D9D40;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[CPLEngineMultiscopeSyncTask dispatchAsyncWithCurrentSubtask:](self, "dispatchAsyncWithCurrentSubtask:", v7);

}

- (void)taskDidFinishWithError:(id)a3
{
  _BOOL4 highPriority;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  objc_super v10;

  highPriority = self->_highPriority;
  v5 = a3;
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = &CPLEngineElementEndOfUpload;
  if (highPriority)
    v9 = &CPLEngineElementEndOfUploadHighPriority;
  objc_msgSend(v7, "willRunEngineElement:", *v9);

  v10.receiver = self;
  v10.super_class = (Class)CPLPushToTransportTask;
  -[CPLEngineSyncTask taskDidFinishWithError:](&v10, sel_taskDidFinishWithError_, v5);

}

- (id)taskIdentifier
{
  if (self->_highPriority)
    return CFSTR("engine.sync.pushtotransport.highpriority");
  else
    return CFSTR("engine.sync.pushtotransport");
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

void __50__CPLPushToTransportTask_task_didFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  objc_super v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 152))
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)CPLPushToTransportTask;
  objc_msgSendSuper2(&v8, sel_task_didFinishWithError_, v3, v6);

}

uint64_t __33__CPLPushToTransportTask_cancel___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 1;
  if (a2)
    return objc_msgSend(a2, "cancel:", *(unsigned __int8 *)(a1 + 40));
  else
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

+ (BOOL)dontAutoRetry
{
  void *v3;
  char v4;

  if (_dontAutoRetry)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("CPLDontAutoRetryPushToTransport"));

  return v4;
}

+ (void)setDontAutoRetry:(BOOL)a3
{
  _dontAutoRetry = a3;
}

@end
