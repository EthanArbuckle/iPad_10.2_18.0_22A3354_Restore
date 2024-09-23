@implementation DNDSModeAssertionManager

- (DNDSModeAssertionManager)initWithBackingStoreURL:(id)a3 clientDetailsProvider:(id)a4
{
  id v6;
  id v7;
  DNDSJSONBackingStore *v8;
  DNDSModeAssertionManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:]([DNDSJSONBackingStore alloc], "initWithRecordClass:fileURL:versionNumber:", objc_opt_class(), v7, 8);

  v9 = -[DNDSModeAssertionManager initWithBackingStore:clientDetailsProvider:](self, "initWithBackingStore:clientDetailsProvider:", v8, v6);
  return v9;
}

- (DNDSModeAssertionManager)initWithBackingStore:(id)a3 clientDetailsProvider:(id)a4
{
  id v7;
  id v8;
  DNDSModeAssertionManager *v9;
  DNDSModeAssertionManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSModeAssertionManager;
  v9 = -[DNDSModeAssertionManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStore, a3);
    -[DNDSBackingStore setDelegate:](v10->_backingStore, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_clientDetailsProvider, a4);
    v10->_storeLock._os_unfair_lock_opaque = 0;
    -[DNDSModeAssertionManager _loadDataFromBackingStore](v10, "_loadDataFromBackingStore");
    DNDSRegisterSysdiagnoseDataProvider(v10);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSModeAssertionManager;
  -[DNDSModeAssertionManager dealloc](&v3, sel_dealloc);
}

- (id)modeAssertionsMatchingPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__DNDSModeAssertionManager_modeAssertionsMatchingPredicate___block_invoke;
  v12[3] = &unk_1E86A6CE8;
  v14 = &v15;
  v5 = v4;
  v13 = v5;
  v11 = 0;
  -[DNDSModeAssertionManager updateModeAssertionsWithContextHandler:error:](self, "updateModeAssertionsWithContextHandler:error:", v12, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_ERROR))
      -[DNDSModeAssertionManager modeAssertionsMatchingPredicate:].cold.1();
    v8 = (void *)v16[5];
    v16[5] = MEMORY[0x1E0C9AA60];

  }
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __60__DNDSModeAssertionManager_modeAssertionsMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "modeAssertionsMatchingPredicate:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

- (id)modeAssertionInvalidationsMatchingPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__DNDSModeAssertionManager_modeAssertionInvalidationsMatchingPredicate___block_invoke;
  v12[3] = &unk_1E86A6CE8;
  v14 = &v15;
  v5 = v4;
  v13 = v5;
  v11 = 0;
  -[DNDSModeAssertionManager updateModeAssertionsWithContextHandler:error:](self, "updateModeAssertionsWithContextHandler:error:", v12, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_ERROR))
      -[DNDSModeAssertionManager modeAssertionInvalidationsMatchingPredicate:].cold.1();
    v8 = (void *)v16[5];
    v16[5] = MEMORY[0x1E0C9AA60];

  }
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __72__DNDSModeAssertionManager_modeAssertionInvalidationsMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "modeAssertionInvalidationsMatchingPredicate:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

- (id)updateModeAssertionsWithContextHandler:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, DNDSModeAssertionManagerUpdateContext *);
  NSObject *v7;
  os_unfair_lock_s *p_storeLock;
  void *v9;
  DNDSModeAssertionManagerUpdateContext *v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  DNDSModeAssertionStore *v16;
  DNDSModeAssertionStore *store;
  id v19;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, DNDSModeAssertionManagerUpdateContext *))a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v7 = _os_activity_create(&dword_1CB895000, "com.apple.donotdisturb.ModeAssertionManager.updateModeAssertions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  v9 = (void *)MEMORY[0x1D17A0B90]();
  v10 = -[DNDSModeAssertionManagerUpdateContext initWithStore:clientDetailsProvider:]([DNDSModeAssertionManagerUpdateContext alloc], "initWithStore:clientDetailsProvider:", self->_store, self->_clientDetailsProvider);
  v11 = v6[2](v6, v10);
  v12 = DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v22 = v11;
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Executed handler; return=%{BOOL}d", buf, 8u);
  }
  if (v11)
  {
    -[DNDSModeAssertionManagerUpdateContext store](v10, "store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DNDSModeAssertionStore isEqual:](self->_store, "isEqual:", v13))
    {
      v14 = 0;
    }
    else
    {
      v16 = (DNDSModeAssertionStore *)objc_msgSend(v13, "copy");
      store = self->_store;
      self->_store = v16;

      v19 = 0;
      -[DNDSModeAssertionManager _saveDataToBackingStoreWithError:](self, "_saveDataToBackingStoreWithError:", &v19);
      v14 = v19;
      -[DNDSModeAssertionManager _resolveTransactionForModeAssertionStore](self, "_resolveTransactionForModeAssertionStore");
    }
    -[DNDSModeAssertionManagerUpdateContext updateResult](v10, "updateResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[DNDSModeAssertionUpdateResult emptyResult](DNDSModeAssertionUpdateResult, "emptyResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }

  objc_autoreleasePoolPop(v9);
  os_unfair_lock_unlock(p_storeLock);
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);
  os_activity_scope_leave(&state);

  return v15;
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  return +[DNDSModeAssertionStore upgradeDictionaryRepresentation:fromVersionNumber:toVersionNumber:](DNDSModeAssertionStore, "upgradeDictionaryRepresentation:fromVersionNumber:toVersionNumber:", a4, a5, a6);
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.server.ModeAssertionManager");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  os_unfair_lock_s *p_storeLock;
  void *v6;

  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  -[DNDSModeAssertionStore sysdiagnoseDictionaryRepresentation](self->_store, "sysdiagnoseDictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_storeLock);
  return v6;
}

- (id)clientDetailsForClientIdentifier:(id)a3
{
  return -[DNDSClientDetailsProvider clientDetailsForIdentifier:](self->_clientDetailsProvider, "clientDetailsForIdentifier:", a3);
}

- (void)_loadDataFromBackingStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to load assertion database, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

BOOL __53__DNDSModeAssertionManager__loadDataFromBackingStore__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "invalidationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4 > 3024000.0;

  return v5;
}

BOOL __53__DNDSModeAssertionManager__loadDataFromBackingStore__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "requestDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4 > 3024000.0;

  return v5;
}

- (void)_resolveTransactionForModeAssertionStore
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  OS_os_transaction *v8;
  OS_os_transaction *nonPersistentAssertionTransaction;
  _QWORD v10[5];
  _QWORD v11[5];

  -[DNDSModeAssertionStore assertions](self->_store, "assertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__DNDSModeAssertionManager__resolveTransactionForModeAssertionStore__block_invoke;
  v11[3] = &unk_1E86A5BB0;
  v11[4] = self;
  objc_msgSend(v3, "bs_filter:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionStore invalidations](self->_store, "invalidations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __68__DNDSModeAssertionManager__resolveTransactionForModeAssertionStore__block_invoke_2;
  v10[3] = &unk_1E86A6770;
  v10[4] = self;
  objc_msgSend(v6, "bs_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count") && !objc_msgSend(v7, "count"))
  {
    nonPersistentAssertionTransaction = self->_nonPersistentAssertionTransaction;
    self->_nonPersistentAssertionTransaction = 0;
    goto LABEL_6;
  }
  if (!self->_nonPersistentAssertionTransaction)
  {
    v8 = (OS_os_transaction *)os_transaction_create();
    nonPersistentAssertionTransaction = self->_nonPersistentAssertionTransaction;
    self->_nonPersistentAssertionTransaction = v8;
LABEL_6:

  }
}

uint64_t __68__DNDSModeAssertionManager__resolveTransactionForModeAssertionStore__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "clientDetailsForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isPersistentAssertionClient") & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isUserInteractionClient") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.private.dndtool"));
  }

  return v6;
}

uint64_t __68__DNDSModeAssertionManager__resolveTransactionForModeAssertionStore__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "clientDetailsForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isPersistentAssertionClient") & 1) != 0)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v6, "isUserInteractionClient") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.private.dndtool"));
  }

  return v7;
}

- (BOOL)_saveDataToBackingStoreWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DNDSBackingStore *backingStore;
  uint64_t v14;
  id v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[DNDSModeAssertionStore mutableCopy](self->_store, "mutableCopy");
  objc_msgSend(v5, "assertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke;
  v25[3] = &unk_1E86A5BB0;
  v25[4] = self;
  objc_msgSend(v6, "bs_filter:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAssertions:", v8);
  objc_msgSend(v5, "invalidations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke_2;
  v24[3] = &unk_1E86A6770;
  v24[4] = self;
  objc_msgSend(v9, "bs_filter:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInvalidations:", v10);
  objc_msgSend(v5, "invalidationRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke_3;
  v23[3] = &unk_1E86A6818;
  v23[4] = self;
  objc_msgSend(v11, "bs_filter:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInvalidationRequests:", v12);
  backingStore = self->_backingStore;
  v22 = 0;
  v14 = -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v5, &v22);
  v15 = v22;
  if (v14)
  {
    if (v14 == 1)
    {
      v20 = DNDSLogAssertionManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v15;
        v17 = "Failed to write store, but error can be ignored; error=%{public}@";
        v18 = v20;
        v19 = 12;
        goto LABEL_11;
      }
    }
    else if (v14 == 2)
    {
      v16 = DNDSLogAssertionManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "Wrote out store to file";
        v18 = v16;
        v19 = 2;
LABEL_11:
        _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_ERROR))
      -[DNDSModeAssertionManager _saveDataToBackingStoreWithError:].cold.1();
    _DNDSRequestRadar(CFSTR("Failed to write store"), v15, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModeAssertionManager.m"), 290);
  }
  if (a3 && v15)
    *a3 = objc_retainAutorelease(v15);

  return v14 == 2;
}

uint64_t __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(a2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientDetailsForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isPersistentAssertionClient");
  return v6;
}

uint64_t __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(a2, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientDetailsForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isPersistentAssertionClient");
  return v7;
}

uint64_t __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v3, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientDetailsForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v7, "isPersistentAssertionClient");

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonPersistentAssertionTransaction, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)modeAssertionsMatchingPredicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unable to find assertions, will return default: error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)modeAssertionInvalidationsMatchingPredicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unable to find assertion invalidations, will return default: error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_saveDataToBackingStoreWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to write store, will request radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

@end
