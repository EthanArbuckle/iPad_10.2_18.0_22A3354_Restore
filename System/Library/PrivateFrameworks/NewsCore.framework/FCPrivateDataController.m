@implementation FCPrivateDataController

- (void)assertReadyForUse
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self || !self->_preparedForUse)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-prepareForUse should be called before reading any data"));
      v4 = 136315906;
      v5 = "-[FCPrivateDataController(Setup) assertReadyForUse]";
      v6 = 2080;
      v7 = "FCPrivateDataController.m";
      v8 = 1024;
      v9 = 981;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);

      if (self)
      {
LABEL_5:
        if (self->_preparedForUse)
          return;
      }
    }
    else if (self)
    {
      goto LABEL_5;
    }
    -[FCPrivateDataController _possiblySimulateCrashWithMessage:](self, "_possiblySimulateCrashWithMessage:", CFSTR("should never access userInfo data before calling prepareForUse"));
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCPrivateDataController observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already an observer"), v4);
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCPrivateDataController addObserver:]";
      v11 = 2080;
      v12 = "FCPrivateDataController.m";
      v13 = 1024;
      v14 = 314;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    -[FCPrivateDataController observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCPrivateDataController addObserver:]";
    v11 = 2080;
    v12 = "FCPrivateDataController.m";
    v13 = 1024;
    v14 = 310;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_8:
}

- (NSHashTable)observers
{
  return self->_observers;
}

uint64_t __51__FCPrivateDataController_forceSyncWithCompletion___block_invoke(uint64_t a1)
{
  -[FCPrivateDataController _markAsDirtyAndNotifyObservers:](*(_QWORD *)(a1 + 32), 0);
  return objc_msgSend(*(id *)(a1 + 32), "syncWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __46__FCPrivateDataController_syncWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__FCPrivateDataController_syncWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E463AB90;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v2 = _Block_copy(aBlock);
  -[FCPrivateDataController _syncWithCondition:completion:](*(id **)(a1 + 32), v2, *(void **)(a1 + 40));

}

- (void)syncWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__FCPrivateDataController_syncWithCompletion___block_invoke;
  v6[3] = &unk_1E463B790;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  FCPerformBlockOnMainThread(v6);

}

- (void)_syncWithCondition:(void *)a3 completion:
{
  unsigned int (**v5)(_QWORD);
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  _QWORD v10[5];
  unsigned int (**v11)(_QWORD);
  id v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (objc_msgSend(a1, "isSyncingEnabled") && v5[2](v5))
    {
      v7 = a1[7];
      v8 = objc_msgSend(a1, "isWaitingForFirstSync");
      if ((v8 & objc_msgSend((id)objc_opt_class(), "requiresHighPriorityFirstSync")) != 0)
        v9 = 25;
      else
        v9 = 17;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __57__FCPrivateDataController__syncWithCondition_completion___block_invoke;
      v10[3] = &unk_1E463F978;
      v10[4] = a1;
      v11 = v5;
      v12 = v6;
      objc_msgSend(v7, "withQualityOfService:enqueueBlockForMainThread:", v9, v10);

    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
    }
  }

}

- (FCPrivateDataController)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCPrivateDataController *v12;
  FCPrivateDataController *v13;
  uint64_t v14;
  NSHashTable *stateObservers;
  uint64_t v16;
  NSHashTable *observers;
  uint64_t v18;
  FCAsyncSerialQueue *syncQueue;
  uint64_t v20;
  NSString *storeDirectory;
  FCKeyValueStoreClassRegistry *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  FCKeyValueStore *v27;
  void *v28;
  NSString *v29;
  uint64_t v30;
  FCKeyValueStore *localStore;
  void *v32;
  void *v33;
  FCCommandQueue *v34;
  FCCommandQueue *v35;
  uint64_t v36;
  FCCommandQueue *commandQueue;
  uint64_t v38;
  objc_super v40;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v40.receiver = self;
  v40.super_class = (Class)FCPrivateDataController;
  v12 = -[FCPrivateDataController init](&v40, sel_init);
  v13 = v12;
  if (v12)
  {
    if (v9 && v11)
    {
      objc_storeStrong((id *)&v12->_context, a3);
      objc_storeStrong((id *)&v13->_pushNotificationCenter, a4);
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v14 = objc_claimAutoreleasedReturnValue();
      stateObservers = v13->_stateObservers;
      v13->_stateObservers = (NSHashTable *)v14;

      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v16 = objc_claimAutoreleasedReturnValue();
      observers = v13->_observers;
      v13->_observers = (NSHashTable *)v16;

      v18 = objc_opt_new();
      syncQueue = v13->_syncQueue;
      v13->_syncQueue = (FCAsyncSerialQueue *)v18;

      v20 = objc_msgSend(v11, "copy");
      storeDirectory = v13->_storeDirectory;
      v13->_storeDirectory = (NSString *)v20;

      v22 = objc_alloc_init(FCKeyValueStoreClassRegistry);
      -[FCKeyValueStoreClassRegistry registerClass:](v22, "registerClass:", objc_opt_class());
      objc_msgSend((id)objc_opt_class(), "populateLocalStoreClassRegistry:", v22);
      -[FCPrivateDataController localStoreMigrator](v13, "localStoreMigrator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appActivityMonitor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backgroundTaskable");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCKeyValueStoreSavePolicy appBackgroundPolicyWithActivityMonitor:backgroundTaskable:](FCKeyValueStoreSavePolicy, "appBackgroundPolicyWithActivityMonitor:backgroundTaskable:", v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = [FCKeyValueStore alloc];
      objc_msgSend((id)objc_opt_class(), "localStoreFilename");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v13->_storeDirectory;
      v30 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:migrator:savePolicy:](v27, "initWithName:directory:version:options:classRegistry:migrator:savePolicy:", v28, v29, objc_msgSend((id)objc_opt_class(), "localStoreVersion"), 2, v22, v23, v26);
      localStore = v13->_localStore;
      v13->_localStore = (FCKeyValueStore *)v30;

      objc_msgSend((id)objc_opt_class(), "configureKeyValueStoreForJSONHandling:", v13->_localStore);
      objc_msgSend(v9, "appActivityMonitor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObserver:", v13);

      objc_msgSend((id)objc_opt_class(), "commandStoreFileName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = [FCCommandQueue alloc];
      if (v33)
      {
        v35 = v13->_storeDirectory;
        v36 = -[FCCommandQueue initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:](v34, "initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:", v9, v35, v33, objc_msgSend((id)objc_opt_class(), "commandQueueUrgency"), 1, v13);
        commandQueue = v13->_commandQueue;
        v13->_commandQueue = (FCCommandQueue *)v36;

      }
      else
      {
        v38 = -[FCCommandQueue initWithContext:urgency:suspended:delegate:](v34, "initWithContext:urgency:suspended:delegate:", v9, objc_msgSend((id)objc_opt_class(), "commandQueueUrgency"), 1, v13);
        v35 = v13->_commandQueue;
        v13->_commandQueue = (FCCommandQueue *)v38;
      }

    }
    else
    {
      v22 = (FCKeyValueStoreClassRegistry *)v12;
      v13 = 0;
    }

  }
  return v13;
}

- (id)localStoreMigrator
{
  return 0;
}

- (int64_t)qualityOfServiceForNextCommandInCommandQueue:(id)a3
{
  int v3;

  if (self)
  {
    v3 = objc_msgSend((id)self, "isWaitingForFirstSync", a3);
    if ((v3 & objc_msgSend((id)objc_opt_class(), "requiresHighPriorityFirstSync")) != 0)
      return 25;
    else
      return 17;
  }
  return self;
}

+ (BOOL)isLocalStoreKeyInternal:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "internalLocalStoreKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)internalLocalStoreKeys
{
  if (qword_1ED0F7F38 != -1)
    dispatch_once(&qword_1ED0F7F38, &__block_literal_global_44_0);
  return (id)_MergedGlobals_153;
}

void __49__FCPrivateDataController_internalLocalStoreKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("sync-state"), CFSTR("sync-enabled"), CFSTR("ubiquity-identity-token"), CFSTR("change-token"), CFSTR("last-sync-date"), CFSTR("last-push-date"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_153;
  _MergedGlobals_153 = v0;

}

- (void)performFirstSyncWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__FCPrivateDataController_performFirstSyncWithCompletion___block_invoke;
  v6[3] = &unk_1E463F9C8;
  v7 = v4;
  v5 = v4;
  -[FCPrivateDataController performFirstSyncWithCallbackQueue:completion:](self, "performFirstSyncWithCallbackQueue:completion:", MEMORY[0x1E0C80D38], v6);

}

- (void)performFirstSyncWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCPrivateDataController isWaitingForFirstSync](self, "isWaitingForFirstSync"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ was asked to perform first sync; isWaitingForFirstSync=%{public}@",
      buf,
      0x16u);

  }
  if (-[FCPrivateDataController isWaitingForFirstSync](self, "isWaitingForFirstSync"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke;
    v13[3] = &unk_1E463DB98;
    v13[4] = self;
    v15 = v7;
    v14 = v6;
    FCPerformBlockOnMainThread(v13);

  }
  else if (v7)
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

uint64_t __58__FCPrivateDataController_performFirstSyncWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)saveWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCPrivateDataController localStore](self, "localStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveWithCompletionHandler:", v4);

}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  if (-[FCPrivateDataController isSyncingEnabled](self, "isSyncingEnabled"))
    -[FCPrivateDataController _markAsDirtyIfZonesChangedExternally]((uint64_t)self);
}

- (void)prepareForUse
{
  FCCommandQueue *commandQueue;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  FCPushNotificationCenter *pushNotificationCenter;
  FCPushNotificationCenter *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  char *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  _BOOL4 v39;
  const __CFString *v40;
  void *v41;
  char v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  os_log_t log;
  NSObject *loga;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  char *v61;
  __int16 v62;
  _BYTE v63[18];
  __int16 v64;
  const __CFString *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    v42 = objc_msgSend(0, "isSyncingEnabled");
    commandQueue = 0;
    if ((v42 & 1) == 0)
      goto LABEL_30;
    goto LABEL_7;
  }
  if (self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-prepareForUse should only be called once"));
    *(_DWORD *)buf = 136315906;
    v59 = "-[FCPrivateDataController(Setup) prepareForUse]";
    v60 = 2080;
    v61 = "FCPrivateDataController.m";
    v62 = 1024;
    *(_DWORD *)v63 = 906;
    *(_WORD *)&v63[4] = 2114;
    *(_QWORD *)&v63[6] = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (-[FCPrivateDataController isSyncingEnabled](self, "isSyncingEnabled"))
  {
    commandQueue = self->_commandQueue;
LABEL_7:
    -[FCCommandQueue resume](commandQueue, "resume");
    -[FCPrivateDataController localStore](self, "localStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sync-state"));
    v5 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject version](v5, "version") != 2)
    {
      if (self)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0D62790]);
        -[NSObject setVersion:](v6, "setVersion:", 2);
      }
      else
      {
        v6 = 0;
      }

      -[FCPrivateDataController localStore](self, "localStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("sync-state"));

      v5 = v6;
    }
    -[NSObject zoneStates](v5, "zoneStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fc_dictionaryWithKeyBlock:", &__block_literal_global_252);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject recordStates](v5, "recordStates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fc_dictionaryWithKeyBlock:", &__block_literal_global_254);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "backingRecordZoneIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_3;
    v56[3] = &unk_1E463FB78;
    v56[4] = self;
    v14 = v9;
    v57 = v14;
    objc_msgSend(v12, "fc_arrayByTransformingWithBlock:", v56);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "backingRecordIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v13;
    v54[1] = 3221225472;
    v54[2] = __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_4;
    v54[3] = &unk_1E463FBA0;
    v54[4] = self;
    v17 = v11;
    v55 = v17;
    objc_msgSend(v16, "fc_arrayByTransformingWithBlock:", v54);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingObjectsFromArray:toArray:", v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_storeStrong((id *)&self->_syncManagers, v19);

    self->_waitingForFirstSync = -[NSArray fc_containsObjectPassingTest:](self->_syncManagers, "fc_containsObjectPassingTest:", &__block_literal_global_258);
    if (objc_msgSend((id)objc_opt_class(), "requiresPushNotificationSupport"))
    {
      v43 = v18;
      v44 = v17;
      v46 = v14;
      log = v5;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v45 = v15;
      v20 = v15;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v51;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v51 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD **)(*((_QWORD *)&v50 + 1) + 8 * v24);
            if (self)
              pushNotificationCenter = self->_pushNotificationCenter;
            else
              pushNotificationCenter = 0;
            v27 = pushNotificationCenter;
            if (v25)
              v28 = (void *)v25[2];
            else
              v28 = 0;
            v29 = v28;
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_6;
            v49[3] = &unk_1E463AB18;
            v49[4] = v25;
            -[FCPushNotificationCenter addObserver:forChangesToRecordZoneID:usingBlock:]((uint64_t)v27, v25, v29, v49);

            ++v24;
          }
          while (v22 != v24);
          v30 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
          v22 = v30;
        }
        while (v30);
      }

      v14 = v46;
      v5 = log;
      v17 = v44;
    }
    -[FCPrivateDataController _markAsDirtyIfZonesChangedExternally]((uint64_t)self);

  }
LABEL_30:
  -[FCPrivateDataController loadLocalCachesFromStore](self, "loadLocalCachesFromStore", v43, v44, v45, v46);
  v31 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    loga = v31;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (char *)objc_claimAutoreleasedReturnValue();
    -[FCPrivateDataController localStore](self, "localStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");
    if (-[FCPrivateDataController isSyncingEnabled](self, "isSyncingEnabled"))
      v37 = CFSTR("YES");
    else
      v37 = CFSTR("NO");
    if (-[FCPrivateDataController isWaitingForFirstSync](self, "isWaitingForFirstSync"))
      v38 = CFSTR("YES");
    else
      v38 = CFSTR("NO");
    v39 = -[FCPrivateDataController isDirty](self, "isDirty");
    *(_DWORD *)buf = 138544386;
    if (v39)
      v40 = CFSTR("YES");
    else
      v40 = CFSTR("NO");
    v59 = v33;
    v60 = 2048;
    v61 = (char *)v36;
    v62 = 2114;
    *(_QWORD *)v63 = v37;
    *(_WORD *)&v63[8] = 2114;
    *(_QWORD *)&v63[10] = v38;
    v64 = 2114;
    v65 = v40;
    _os_log_impl(&dword_1A1B90000, loga, OS_LOG_TYPE_DEFAULT, "%{public}@ prepared for use with %lu store entries, isSyncingEnabled=%{public}@, waitingForFirstSync=%{public}@, dirty=%{public}@", buf, 0x34u);

  }
  if (self)
    self->_preparedForUse = 1;
}

- (BOOL)isSyncingEnabled
{
  return self->_syncingEnabled;
}

- (BOOL)isDirty
{
  NSArray *syncManagers;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    syncManagers = self->_syncManagers;
  else
    syncManagers = 0;
  return -[NSArray fc_containsObjectPassingTest:](syncManagers, "fc_containsObjectPassingTest:", &__block_literal_global_40);
}

- (BOOL)isWaitingForFirstSync
{
  return self->_waitingForFirstSync;
}

- (void)disableSyncing
{
  void *v3;
  void *v4;
  FCCommandQueue *commandQueue;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
  {
    if (self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("migration actions should be called before -prepareForUse"));
      v10 = 136315906;
      v11 = "-[FCPrivateDataController(Setup) disableSyncing]";
      v12 = 2080;
      v13 = "FCPrivateDataController.m";
      v14 = 1024;
      v15 = 867;
      v16 = 2114;
      v17 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    }
    -[FCPrivateDataController setSyncingEnabled:](self, "setSyncingEnabled:", 0);
    -[FCPrivateDataController localStore](self, "localStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("sync-state"));

    -[FCPrivateDataController localStore](self, "localStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCloudBackupEnabled:", 1);

    commandQueue = self->_commandQueue;
  }
  else
  {
    objc_msgSend(0, "setSyncingEnabled:", 0);
    objc_msgSend(0, "localStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("sync-state"));

    objc_msgSend(0, "localStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCloudBackupEnabled:", 1);

    commandQueue = 0;
  }
  -[FCCommandQueue clear](commandQueue, "clear");
  if (-[FCPrivateDataController isSyncingEnabled](self, "isSyncingEnabled"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("syncing should be disabled"));
      v10 = 136315906;
      v11 = "-[FCPrivateDataController(Setup) disableSyncing]";
      v12 = 2080;
      v13 = "FCPrivateDataController.m";
      v14 = 1024;
      v15 = 874;
      v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    }
  }
}

- (FCKeyValueStore)localStore
{
  return self->_localStore;
}

- (void)setSyncingEnabled:(BOOL)a3
{
  self->_syncingEnabled = a3;
}

- (void)_markAsDirtyAndNotifyObservers:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "markAsDirty", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    if (a2)
      -[FCPrivateDataController _notifyObservers](a1);
  }
}

- (void)markAsDirty
{
  -[FCPrivateDataController _markAsDirtyAndNotifyObservers:]((uint64_t)self, 1);
}

- (void)_notifyObservers
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(a1 + 64);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "privateDataControllerDidBecomeDirty:", a1, (_QWORD)v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)forceSyncWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__FCPrivateDataController_forceSyncWithCompletion___block_invoke;
  v6[3] = &unk_1E463B790;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  FCPerformBlockOnMainThread(v6);

}

- (void)addStateObserver:(id)a3
{
  id v4;
  NSHashTable *stateObservers;
  NSHashTable *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      stateObservers = self->_stateObservers;
    else
      stateObservers = 0;
    if (-[NSHashTable containsObject:](stateObservers, "containsObject:", v4)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already an observer"), v4);
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCPrivateDataController addStateObserver:]";
      v11 = 2080;
      v12 = "FCPrivateDataController.m";
      v13 = 1024;
      v14 = 284;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (self)
        goto LABEL_7;
    }
    else if (self)
    {
LABEL_7:
      v6 = self->_stateObservers;
LABEL_8:
      -[NSHashTable addObject:](v6, "addObject:", v4);
      goto LABEL_11;
    }
    v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "stateObserver != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCPrivateDataController addStateObserver:]";
    v11 = 2080;
    v12 = "FCPrivateDataController.m";
    v13 = 1024;
    v14 = 280;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:

}

- (FCPrivateDataController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCPrivateDataController;
  return -[FCPrivateDataController init](&v3, sel_init);
}

- (void)dealloc
{
  FCPrivateDataController *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (FCPrivateDataController *)self->_pushNotificationCenter;
  -[FCPushNotificationCenter removeRecordZoneObserver:]((uint64_t)self, v2);
  v3.receiver = v2;
  v3.super_class = (Class)FCPrivateDataController;
  -[FCPrivateDataController dealloc](&v3, sel_dealloc);
}

void __57__FCPrivateDataController__syncWithCondition_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  void (**v8)(_QWORD);

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__FCPrivateDataController__syncWithCondition_completion___block_invoke_2;
    v6[3] = &unk_1E463F950;
    v6[4] = v4;
    v7 = *(id *)(a1 + 48);
    v8 = v3;
    -[FCPrivateDataController _serialSyncWithCompletion:](v4, v6);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
    v3[2](v3);
  }

}

void __57__FCPrivateDataController__syncWithCondition_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(*(id *)(a1 + 32), "handleSyncCompletion");
  if ((objc_msgSend(*(id *)(a1 + 32), "isDirty") & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = *(_QWORD **)(a1 + 32);
    if (v6)
      v6 = (_QWORD *)v6[8];
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "privateDataControllerDidBecomeClean:", *(_QWORD *)(a1 + 32), (_QWORD)v14);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_serialSyncWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v4 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch changes when command queue is empty", buf, 0xCu);

    }
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke;
    v10[3] = &unk_1E463FAD0;
    v10[4] = a1;
    v12 = v8;
    v11 = v3;
    objc_msgSend(v9, "flushWithCompletionHandler:", v10);

  }
}

uint64_t __46__FCPrivateDataController_syncWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDirty");
}

- (void)syncWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke;
  v10[3] = &unk_1E463DB98;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  FCPerformBlockOnMainThread(v10);

}

void __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD aBlock[5];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_2;
  aBlock[3] = &unk_1E463AB90;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = *(id **)(a1 + 32);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_3;
  v5[3] = &unk_1E463D8B8;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  -[FCPrivateDataController _syncWithCondition:completion:](v4, v3, v5);

}

uint64_t __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDirty");
}

void __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_4;
    block[3] = &unk_1E463F9A0;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __60__FCPrivateDataController_syncWithCallbackQueue_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD aBlock[5];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_2;
  aBlock[3] = &unk_1E463AB90;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = *(id **)(a1 + 32);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_3;
  v5[3] = &unk_1E463D8B8;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  -[FCPrivateDataController _syncWithCondition:completion:](v4, v3, v5);

}

uint64_t __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDirty");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "isWaitingForFirstSync");
  return result;
}

void __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_4;
    block[3] = &unk_1E463F9A0;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __72__FCPrivateDataController_performFirstSyncWithCallbackQueue_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)removeStateObserver:(id)a3
{
  id v4;
  NSHashTable *stateObservers;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      stateObservers = self->_stateObservers;
    else
      stateObservers = 0;
    -[NSHashTable removeObject:](stateObservers, "removeObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "stateObserver != nil");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPrivateDataController removeStateObserver:]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 293;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (BOOL)isBackedByAnyRecordZoneIDsInSet:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "backingRecordZoneIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "intersectsSet:", v4);
  return (char)v5;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCPrivateDataController observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCPrivateDataController removeObserver:]";
    v8 = 2080;
    v9 = "FCPrivateDataController.m";
    v10 = 1024;
    v11 = 323;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (void)addCommandToCommandQueue:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  char *v8;
  FCCommandQueue *commandQueue;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if ((!self || !self->_commandQueue) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't enqueue a command without a command queue"));
    v11 = 136315906;
    v12 = "-[FCPrivateDataController addCommandToCommandQueue:]";
    v13 = 2080;
    v14 = "FCPrivateDataController.m";
    v15 = 1024;
    v16 = 334;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

  }
  if (-[FCPrivateDataController isSyncingEnabled](self, "isSyncingEnabled"))
  {
    v5 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ adding command to command queue", (uint8_t *)&v11, 0xCu);

    }
    if (self)
    {
      ++self->_changeCount;
      commandQueue = self->_commandQueue;
    }
    else
    {
      commandQueue = 0;
    }
    -[FCCommandQueue addCommand:](commandQueue, "addCommand:", v4);
  }

}

uint64_t __34__FCPrivateDataController_isDirty__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDirty");
}

- (NSDate)modificationDate
{
  void *v2;
  void *v3;

  -[FCPrivateDataController localStore](self, "localStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

+ (BOOL)requiresPushNotificationSupport
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController requiresPushNotificationSupport]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 368;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController requiresPushNotificationSupport]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)requiresBatchedSync
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController requiresBatchedSync]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 373;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController requiresBatchedSync]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)requiresHighPriorityFirstSync
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController requiresHighPriorityFirstSync]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 378;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController requiresHighPriorityFirstSync]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)backingRecordZoneIDs
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController backingRecordZoneIDs]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 383;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController backingRecordZoneIDs]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)backingRecordIDs
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController backingRecordIDs]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 388;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController backingRecordIDs]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)localStoreFilename
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController localStoreFilename]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 393;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController localStoreFilename]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (unint64_t)localStoreVersion
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController localStoreVersion]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 398;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController localStoreVersion]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)commandStoreFileName
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController commandStoreFileName]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 424;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController commandStoreFileName]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (int64_t)commandQueueUrgency
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController commandQueueUrgency]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 429;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController commandQueueUrgency]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v13 = "+[FCPrivateDataController commandsToMergeLocalDataToCloud:privateDataDirectory:]";
    v14 = 2080;
    v15 = "FCPrivateDataController.m";
    v16 = 1024;
    v17 = 434;
    v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController commandsToMergeLocalDataToCloud:privateDataDirectory:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCPrivateDataController handleSyncWithChangedRecords:deletedRecordNames:]";
    v14 = 2080;
    v15 = "FCPrivateDataController.m";
    v16 = 1024;
    v17 = 444;
    v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCPrivateDataController handleSyncWithChangedRecords:deletedRecordNames:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCPrivateDataController allKnownRecordNamesWithinRecordZoneWithID:]";
    v11 = 2080;
    v12 = "FCPrivateDataController.m";
    v13 = 1024;
    v14 = 449;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCPrivateDataController allKnownRecordNamesWithinRecordZoneWithID:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)loadLocalCachesFromStore
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPrivateDataController loadLocalCachesFromStore]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 454;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCPrivateDataController loadLocalCachesFromStore]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)desiredKeys
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPrivateDataController desiredKeys]";
    v9 = 2080;
    v10 = "FCPrivateDataController.m";
    v11 = 1024;
    v12 = 459;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCPrivateDataController desiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return 0;
}

- (id)recordsForRestoringZoneName:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canHelpPruneZoneName:(id)a3
{
  return 0;
}

- (id)pruneRecords:(id)a3 forZoneName:(id)a4
{
  return a3;
}

- (double)softMaxRecordAgeWhenMigratingZoneName:(id)a3
{
  return 0.0;
}

- (unint64_t)softMaxRecordCountWhenMigratingZoneName:(id)a3
{
  return 0;
}

- (void)zoneSyncManager:(id)a3 stateDidChange:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  id v22;
  FCPrivateDataController *v23;
  void *v24;
  void *v25;
  void *v26;
  FCPrivateDataController *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v27 = self;
  -[FCPrivateDataController localStore](self, "localStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sync-state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = v7;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v7);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = v9;
  objc_msgSend(v9, "zoneStates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
        objc_msgSend(v15, "zoneName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          v17 = (void *)v6[2];
        else
          v17 = 0;
        v18 = v17;
        objc_msgSend(v18, "zoneName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v16, "isEqualToString:", v19);

        if ((v20 & 1) == 0)
          objc_msgSend(v29, "addObject:", v15);
        ++v14;
      }
      while (v12 != v14);
      v21 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v12 = v21;
    }
    while (v21);
  }

  if (v26)
  {
    v22 = (id)objc_msgSend(v26, "copy");
    v23 = v27;
    v24 = v28;
  }
  else
  {
    v23 = v27;
    if (v27)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0D62790]);
      objc_msgSend(v22, "setVersion:", 2);
    }
    else
    {
      v22 = 0;
    }
    v24 = v28;
  }
  objc_msgSend(v22, "setZoneStates:", v29);
  -[FCPrivateDataController localStore](v23, "localStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v22, CFSTR("sync-state"));

}

- (void)recordSyncManager:(id)a3 stateDidChange:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  id v26;
  void *v27;
  FCPrivateDataController *v28;
  void *v29;
  void *v30;
  FCPrivateDataController *v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v31 = self;
  -[FCPrivateDataController localStore](self, "localStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sync-state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v7;
  objc_msgSend(v37, "addObject:", v7);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = v9;
  objc_msgSend(v9, "recordStates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    v33 = *(_QWORD *)v39;
    v34 = v6;
    do
    {
      v13 = 0;
      v35 = v11;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
        objc_msgSend(v14, "recordName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          v16 = (void *)v6[1];
        else
          v16 = 0;
        v17 = v16;
        objc_msgSend(v17, "recordName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v18) & 1) == 0)
        {

LABEL_14:
          objc_msgSend(v37, "addObject:", v14);
          goto LABEL_15;
        }
        objc_msgSend(v14, "recordZoneName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          v20 = (void *)v6[1];
        else
          v20 = 0;
        v21 = v20;
        objc_msgSend(v21, "zoneID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "zoneName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v19, "isEqualToString:", v23);

        v12 = v33;
        v6 = v34;
        v11 = v35;
        if ((v24 & 1) == 0)
          goto LABEL_14;
LABEL_15:
        ++v13;
      }
      while (v11 != v13);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v11 = v25;
    }
    while (v25);
  }

  if (v30)
  {
    v26 = (id)objc_msgSend(v30, "copy");
    v28 = v31;
    v27 = v32;
  }
  else
  {
    v28 = v31;
    if (v31)
    {
      v26 = objc_alloc_init(MEMORY[0x1E0D62790]);
      objc_msgSend(v26, "setVersion:", 2);
    }
    else
    {
      v26 = 0;
    }
    v27 = v32;
  }
  objc_msgSend(v26, "setRecordStates:", v37);
  -[FCPrivateDataController localStore](v28, "localStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v26, CFSTR("sync-state"));

}

- (void)_markAsDirtyIfZonesChangedExternally
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news"));

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend((id)objc_opt_class(), "backingRecordZoneIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v30 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "zoneName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            FCZoneLastModifiedExternallySharedPreferenceKey((uint64_t)v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            NewsCoreUserDefaults();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v5, "laterDate:", v14);
              v15 = objc_claimAutoreleasedReturnValue();

              v5 = (void *)v15;
            }

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v8);
      }

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = *(id *)(a1 + 40);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = 0;
        v20 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
            objc_msgSend(v22, "lastCleanDate", (_QWORD)v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "fc_isEarlierThan:", v5);

            if (v24)
            {
              objc_msgSend(v22, "markAsDirty");
              v19 = 1;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v18);

        if ((v19 & 1) != 0)
          -[FCPrivateDataController _notifyObservers](a1);
      }
      else
      {

      }
    }
  }
}

void __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[5];
  id v39;
  uint64_t v40;
  _QWORD v41[7];
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if ((a2 & 1) != 0)
  {
    v4 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v7;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ flushed command queue, fetching changes", buf, 0xCu);

    }
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_52;
    aBlock[3] = &unk_1E463FA80;
    v10 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v40 = v9;
    v39 = v10;
    v11 = _Block_copy(aBlock);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = *(_QWORD **)(a1 + 32);
    if (v12)
      v12 = (_QWORD *)v12[5];
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v18, "isDirty"))
          {
            objc_msgSend(*(id *)(a1 + 32), "context");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "internalPrivateDataContext");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = *(_QWORD *)(a1 + 32);
            v30 = objc_msgSend(v18, "isAwaitingFirstSync");
            if (v29)
            {
              if ((v30 & objc_msgSend((id)objc_opt_class(), "requiresHighPriorityFirstSync")) != 0)
                v31 = 25;
              else
                v31 = 17;
            }
            else
            {
              v31 = 0;
            }
            v32[0] = v8;
            v32[1] = 3221225472;
            v32[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_59;
            v32[3] = &unk_1E463FAA8;
            v32[4] = v18;
            v33 = v11;
            objc_msgSend(v18, "fetchChangesWithContext:qualityOfService:completionHandler:", v28, v31, v32);

            goto LABEL_25;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v15)
          continue;
        break;
      }
    }

    v19 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v22;
      _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ finished fetching changes", buf, 0xCu);

    }
    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
      *(_BYTE *)(v23 + 8) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_25:

    v26 = v39;
  }
  else
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_2;
    v41[3] = &unk_1E463FA10;
    v25 = *(void **)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 48);
    v41[4] = *(_QWORD *)(a1 + 32);
    v41[6] = v24;
    v26 = v25;
    v41[5] = v26;
    __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_2(v41);
  }

}

void __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
    v3 = *(_QWORD *)(v2 + 48);
  else
    v3 = 0;
  v4 = (void *)FCPrivateDataLog;
  if (v3 == a1[6])
  {
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_ERROR))
    {
      v10 = v4;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "%{public}@ sync failed because something went wrong when flushing the command queue", (uint8_t *)&v13, 0xCu);

    }
    v5 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notAvailableError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, 2, v6);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v4;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ something changed while flushing the command queue, trying again", (uint8_t *)&v13, 0xCu);

      v2 = a1[4];
    }
    -[FCPrivateDataController _serialSyncWithCompletion:](v2, a1[5]);
  }
}

void __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_52(_QWORD *a1, void *a2, void *a3, void *a4, char a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v21;
    v41 = 2048;
    v42 = objc_msgSend(v14, "count");
    v43 = 2048;
    v44 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched changes with %lu changed records and %lu deleted records", buf, 0x20u);

  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[2] = __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_53;
  v29[3] = &unk_1E463FA58;
  v22 = a1[4];
  v23 = (void *)a1[5];
  v30 = v17;
  v31 = v22;
  v29[1] = 3221225472;
  v37 = a1[6];
  v38 = a5;
  v32 = v15;
  v33 = v13;
  v34 = v14;
  v35 = v16;
  v36 = v23;
  v24 = v16;
  v25 = v14;
  v26 = v13;
  v27 = v15;
  v28 = v17;
  FCPerformBlockOnMainThread(v29);

}

uint64_t __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_53(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id *v10;
  id v11;
  id *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id *v37;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE buf[12];
  __int16 v52;
  char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), 2);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 48);
  else
    v4 = 0;
  if (v4 == *(_QWORD *)(a1 + 88))
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(*(id *)(a1 + 48), "fc_arrayByTransformingWithBlock:", &__block_literal_global_57_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 96))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v8 = *(void **)(a1 + 40);
      v9 = *(id *)(a1 + 56);
      if (v8)
      {
        objc_opt_class();
        if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = (id *)v9;
          v11 = v10[2];
          objc_msgSend(v8, "allKnownRecordNamesWithinRecordZoneWithID:", v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = (id *)v9;
            v13 = v12[1];
            objc_msgSend(v13, "recordName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "-[FCPrivateDataController _allKnownRecordIDsForSyncManager:]";
              v52 = 2080;
              v53 = "FCPrivateDataController.m";
              v54 = 1024;
              v55 = 820;
              v56 = 2114;
              v57 = v39;
              _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
            v12 = 0;
            v8 = (void *)MEMORY[0x1E0C9AA60];
          }

          v10 = 0;
        }

      }
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v46 != v17)
              objc_enumerationMutation(v8);
            objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
          }
          v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v16);
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v19 = *(id *)(a1 + 64);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "recordID", (_QWORD)v41);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "recordName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "removeObject:", v25);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        }
        while (v21);
      }

      v26 = (void *)FCPrivateDataLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v29;
        v52 = 2048;
        v53 = (char *)v30;
        _os_log_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ needs to reset local data, so deleting %lu records", buf, 0x16u);

      }
    }
    v31 = *(void **)(a1 + 40);
    v32 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v7, "allObjects", (_QWORD)v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleSyncWithChangedRecords:deletedRecordNames:", v32, v33);

    if (*(_BYTE *)(a1 + 96))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "isWaitingForFirstSync") & 1) == 0)
      {
        v34 = *(void **)(a1 + 40);
        if (v34)
        {
          v35 = *(id *)(a1 + 56);
          objc_opt_class();
          if (v35)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v36 = v35;
            else
              v36 = 0;
          }
          else
          {
            v36 = 0;
          }
          v37 = v36;

          if (v37)
          {
            v38 = v37[2];
            objc_msgSend(v34, "handleSyncDidResetLocalDataForRecordZoneWithID:", v38);

          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "-[FCPrivateDataController _handleSyncDidResetLocalDataForSyncManager:]";
            v52 = 2080;
            v53 = "FCPrivateDataController.m";
            v54 = 1024;
            v55 = 834;
            v56 = 2114;
            v57 = v40;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
        }
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    v3 = *(_QWORD *)(a1 + 40);
  }
  return -[FCPrivateDataController _serialSyncWithCompletion:](v3, *(_QWORD *)(a1 + 80));
}

uint64_t __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_2_55(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordName");
}

uint64_t __53__FCPrivateDataController__serialSyncWithCompletion___block_invoke_59(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40)
                                                                                                + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_syncManagers, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);
  objc_storeStrong((id *)&self->_pushNotificationCenter, 0);
}

- (void)enableSyncing
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self && self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("migration actions should be called before -prepareForUse"));
    v6 = 136315906;
    v7 = "-[FCPrivateDataController(Setup) enableSyncing]";
    v8 = 2080;
    v9 = "FCPrivateDataController.m";
    v10 = 1024;
    v11 = 852;
    v12 = 2114;
    v13 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

  }
  -[FCPrivateDataController setSyncingEnabled:](self, "setSyncingEnabled:", 1);
  -[FCPrivateDataController localStore](self, "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCloudBackupEnabled:", 0);

  if (!-[FCPrivateDataController isSyncingEnabled](self, "isSyncingEnabled")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("syncing should be enabled"));
    v6 = 136315906;
    v7 = "-[FCPrivateDataController(Setup) enableSyncing]";
    v8 = 2080;
    v9 = "FCPrivateDataController.m";
    v10 = 1024;
    v11 = 861;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

  }
}

- (void)createLocalStore
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self && self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("migration actions should be called before -prepareForUse"));
    v6 = 136315906;
    v7 = "-[FCPrivateDataController(Setup) createLocalStore]";
    v8 = 2080;
    v9 = "FCPrivateDataController.m";
    v10 = 1024;
    v11 = 880;
    v12 = 2114;
    v13 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

  }
  -[FCPrivateDataController setSyncingEnabled:](self, "setSyncingEnabled:", 0);
  -[FCPrivateDataController localStore](self, "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCloudBackupEnabled:", 1);

  if (-[FCPrivateDataController isSyncingEnabled](self, "isSyncingEnabled"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("syncing should be disabled"));
      v6 = 136315906;
      v7 = "-[FCPrivateDataController(Setup) createLocalStore]";
      v8 = 2080;
      v9 = "FCPrivateDataController.m";
      v10 = 1024;
      v11 = 885;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

    }
  }
}

- (void)mergeLocalStoreWithCloudWithPrivateDataDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FCCommandQueue *commandQueue;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self && self->_preparedForUse && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("migration actions should be called before -prepareForUse"));
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPrivateDataController(Setup) mergeLocalStoreWithCloudWithPrivateDataDirectory:]";
    v27 = 2080;
    v28 = "FCPrivateDataController.m";
    v29 = 1024;
    v30 = 890;
    v31 = 2114;
    v32 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_opt_class();
  -[FCPrivateDataController localStore](self, "localStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commandsToMergeLocalDataToCloud:privateDataDirectory:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ adding merge commands to command queue", buf, 0xCu);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          if (self)
            commandQueue = self->_commandQueue;
          else
            commandQueue = 0;
          -[FCCommandQueue addCommand:](commandQueue, "addCommand:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16++), (_QWORD)v20);
        }
        while (v14 != v16);
        v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v14 = v18;
      }
      while (v18);
    }

  }
}

uint64_t __47__FCPrivateDataController_Setup__prepareForUse__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneName");
}

id __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0C95070];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C95098]);
  objc_msgSend(v3, "recordZoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v7, *MEMORY[0x1E0C94730]);
  v9 = (void *)objc_msgSend(v4, "initWithRecordName:zoneID:", v5, v8);

  return v9;
}

id *__47__FCPrivateDataController_Setup__prepareForUse__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  FCPrivateZoneSyncManager *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;

  v3 = a2;
  v4 = [FCPrivateZoneSyncManager alloc];
  objc_msgSend((id)objc_opt_class(), "desiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "requiresBatchedSync");
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v3, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCPrivateZoneSyncManager initWithRecordZoneID:desiredKeys:requiresBatchedSync:currentState:]((id *)&v4->super.isa, v3, v5, v6, v9);

  if (v10)
    objc_storeWeak(v10 + 3, *(id *)(a1 + 32));
  return v10;
}

id *__47__FCPrivateDataController_Setup__prepareForUse__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  FCPrivateRecordSyncManager *v4;
  void *v5;
  void *v6;
  id *v7;

  v3 = a2;
  v4 = [FCPrivateRecordSyncManager alloc];
  objc_msgSend((id)objc_opt_class(), "desiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCPrivateRecordSyncManager initWithRecordID:desiredKeys:currentState:]((id *)&v4->super.isa, v3, v5, v6);

  if (v7)
    objc_storeWeak(v7 + 2, *(id *)(a1 + 32));
  return v7;
}

uint64_t __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAwaitingFirstSync");
}

uint64_t __47__FCPrivateDataController_Setup__prepareForUse__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "markAsDirty");
  return objc_msgSend(*(id *)(a1 + 32), "notifyObservers");
}

- (void)_possiblySimulateCrashWithMessage:(id)a3
{
  id v3;
  void *v4;
  Class v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "BOOLForKey:", CFSTR("disable_simulated_crashes_for_encryption")))
    {

    }
    else
    {
      v5 = NSClassFromString(CFSTR("XCTest"));

      if (!v5)
      {
        v6 = FCPrivateDataLog;
        if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_FAULT))
        {
          v7 = 138543362;
          v8 = v3;
          _os_log_fault_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_FAULT, "triggering simulated crash with message %{public}@", (uint8_t *)&v7, 0xCu);
        }
      }
    }
  }

}

- (id)jsonEncodableObject
{
  void *v2;
  void *v3;

  -[FCPrivateDataController localStore](self, "localStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonEncodableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
