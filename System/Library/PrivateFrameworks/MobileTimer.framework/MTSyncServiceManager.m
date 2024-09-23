@implementation MTSyncServiceManager

- (MTSyncServiceManager)initWithSyncService:(id)a3 syncStatusProvider:(id)a4 syncDataModel:(id)a5 syncMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  MTSyncServiceManager *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[MTSyncChangeStore persistentStoreForDataModel:](MTSyncChangeStore, "persistentStoreForDataModel:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MTSyncServiceManager initWithSyncService:syncStatusProvider:syncDataModel:syncMetrics:syncChangeStore:](self, "initWithSyncService:syncStatusProvider:syncDataModel:syncMetrics:syncChangeStore:", v13, v12, v11, v10, v14);

  return v15;
}

- (MTSyncServiceManager)initWithSyncService:(id)a3 syncStatusProvider:(id)a4 syncDataModel:(id)a5 syncMetrics:(id)a6 syncChangeStore:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MTSyncServiceManager *v18;
  uint64_t v19;
  NAScheduler *serializer;
  MTSyncChangeQueue *v21;
  MTSyncChangeQueue *syncChangeQueue;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MTSyncServiceManager;
  v18 = -[MTSyncServiceManager init](&v24, sel_init);
  if (v18)
  {
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTSyncServiceManager.serialqueue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v19 = objc_claimAutoreleasedReturnValue();
    serializer = v18->_serializer;
    v18->_serializer = (NAScheduler *)v19;

    objc_storeStrong((id *)&v18->_syncService, a3);
    objc_msgSend(v13, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_syncStatusProvider, a4);
    -[MTSyncStatusProvider setSyncStatusProviderDelegate:](v18->_syncStatusProvider, "setSyncStatusProviderDelegate:", v18);
    objc_storeWeak((id *)&v18->_syncDataModel, v15);
    v21 = -[MTSyncChangeQueue initWithChangeStore:]([MTSyncChangeQueue alloc], "initWithChangeStore:", v17);
    syncChangeQueue = v18->_syncChangeQueue;
    v18->_syncChangeQueue = v21;

    -[MTSyncChangeQueue loadChanges](v18->_syncChangeQueue, "loadChanges");
    objc_storeStrong((id *)&v18->_syncMetrics, a6);
  }

  return v18;
}

- (void)startSyncService
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MTSyncServiceManager_startSyncService__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

uint64_t __40__MTSyncServiceManager_startSyncService__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    if (objc_msgSend(*(id *)(v1 + 24), "syncStatus") == 3)
    {
      MTLogForCategory(6);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(v2 + 32);
        v7 = 138543362;
        v8 = v4;
        _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sync currently disabled, not starting, and removing any pending changes.", (uint8_t *)&v7, 0xCu);
      }

      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 40), "removePendingChanges");
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(v2 + 32) + 8) = 1;
      MTLogForCategory(6);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(v2 + 32);
        v7 = 138543362;
        v8 = v6;
        _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming sync service", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 16), "resume:", 0);
      return objc_msgSend(*(id *)(v2 + 32), "checkForPendingChanges");
    }
  }
  return result;
}

- (void)stopSyncService
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__MTSyncServiceManager_stopSyncService__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

uint64_t __39__MTSyncServiceManager_stopSyncService__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    MTLogForCategory(6);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping sync service", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "suspend");
    MTLogForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(v1 + 32);
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing pending changes", (uint8_t *)&v6, 0xCu);
    }

    result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 40), "removePendingChanges");
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 8) = 0;
  }
  return result;
}

- (void)checkForPendingChanges
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  int v7;
  MTSyncServiceManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[MTSyncChangeQueue hasPendingChanges](self->_syncChangeQueue, "hasPendingChanges");
  MTLogForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ still has changes", (uint8_t *)&v7, 0xCu);
    }

    v6 = -[MTSyncServiceManager requestSync:](self, "requestSync:", 0);
  }
  else
  {
    if (v5)
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no pending changes", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)syncChange:(id)a3
{
  id v4;
  NAScheduler *serializer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__MTSyncServiceManager_syncChange___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

void __35__MTSyncServiceManager_syncChange___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
  MTLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ syncing %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "enqueueChange:", *(_QWORD *)(a1 + 40));
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "requestSync:", 0);
  }
  else
  {
    if (v4)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring sync because we're not started", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (id)pendingChanges
{
  return -[MTSyncChangeQueue pendingChanges](self->_syncChangeQueue, "pendingChanges");
}

- (void)applyChange:(id)a3
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  MTSyncServiceManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[MTSyncChangeQueue resolveChange:](self->_syncChangeQueue, "resolveChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = 138543618;
      v8 = self;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ applying change %{public}@", (uint8_t *)&v7, 0x16u);
    }

    -[MTSyncServiceManager syncDataModel](self, "syncDataModel");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject applyChange:](v5, "applyChange:", v4);
  }
  else if (v6)
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ nothing to apply", (uint8_t *)&v7, 0xCu);
  }

}

- (void)resetDataStore
{
  NSObject *v3;
  void *v4;
  int v5;
  MTSyncServiceManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting data store", (uint8_t *)&v5, 0xCu);
  }

  -[MTSyncChangeQueue removePendingChanges](self->_syncChangeQueue, "removePendingChanges");
  -[MTSyncServiceManager syncDataModel](self, "syncDataModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetDataStore");

}

- (void)pendingChangesSent:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTSyncServiceManager *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2048;
    v9 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully sent %lu changes", (uint8_t *)&v6, 0x16u);
  }

  -[MTSyncChangeQueue dequeueChanges:](self->_syncChangeQueue, "dequeueChanges:", v4);
  -[MTSyncServiceManager checkForPendingChanges](self, "checkForPendingChanges");

}

- (id)requestSync:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  MTSyncServiceManager *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    MTLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ incremental sync requested", buf, 0xCu);
    }

  }
  -[MTSyncService requestSync:](self->_syncService, "requestSync:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__MTSyncServiceManager_requestSync___block_invoke;
  v8[3] = &unk_1E39CC2D8;
  v8[4] = self;
  objc_msgSend(v6, "addCompletionBlock:", v8);
  return v6;
}

uint64_t __36__MTSyncServiceManager_requestSync___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (a2)
    return objc_msgSend(v2, "logSyncFailedWithError:", a2);
  else
    return objc_msgSend(v2, "logSyncCompleted");
}

- (void)syncStatusProvider:(id)a3 didChangeSyncStatus:(unint64_t)a4
{
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  MTSyncServiceManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a4 == 3)
  {
    if (v7)
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sync is disabled.", (uint8_t *)&v8, 0xCu);
    }

    -[MTSyncServiceManager stopSyncService](self, "stopSyncService");
  }
  else
  {
    if (v7)
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sync isn't disabled.", (uint8_t *)&v8, 0xCu);
    }

    -[MTSyncServiceManager startSyncService](self, "startSyncService");
  }
}

- (void)printDiagnostics
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MTSyncServiceManager syncService](self, "syncService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = (uint64_t)v6;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Sync Service: %@", (uint8_t *)&v14, 0xCu);

  }
  MTLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[MTSyncServiceManager syncStatusProvider](self, "syncStatusProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "syncStatus");
    v14 = 134217984;
    v15 = v9;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "Sync Status: %lu", (uint8_t *)&v14, 0xCu);

  }
  MTLogForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MTSyncServiceManager syncChangeQueue](self, "syncChangeQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pendingChanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = 134217984;
    v15 = v13;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "Pending Changes: %lu", (uint8_t *)&v14, 0xCu);

  }
}

- (id)gatherDiagnostics
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("Sync Service");
  -[MTSyncServiceManager syncService](self, "syncService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v15[1] = CFSTR("Sync Status");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[MTSyncServiceManager syncStatusProvider](self, "syncStatusProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "syncStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v15[2] = CFSTR("Pending Changes");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[MTSyncServiceManager syncChangeQueue](self, "syncChangeQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingChanges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (MTSyncService)syncService
{
  return self->_syncService;
}

- (void)setSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_syncService, a3);
}

- (MTSyncStatusProvider)syncStatusProvider
{
  return self->_syncStatusProvider;
}

- (void)setSyncStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatusProvider, a3);
}

- (MTSyncDataModel)syncDataModel
{
  return (MTSyncDataModel *)objc_loadWeakRetained((id *)&self->_syncDataModel);
}

- (void)setSyncDataModel:(id)a3
{
  objc_storeWeak((id *)&self->_syncDataModel, a3);
}

- (MTSyncChangeQueue)syncChangeQueue
{
  return self->_syncChangeQueue;
}

- (void)setSyncChangeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncChangeQueue, a3);
}

- (MTMetrics)syncMetrics
{
  return self->_syncMetrics;
}

- (void)setSyncMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_syncMetrics, a3);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_syncMetrics, 0);
  objc_storeStrong((id *)&self->_syncChangeQueue, 0);
  objc_destroyWeak((id *)&self->_syncDataModel);
  objc_storeStrong((id *)&self->_syncStatusProvider, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
}

@end
