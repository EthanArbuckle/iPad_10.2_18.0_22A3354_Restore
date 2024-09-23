@implementation DNDSSyncEngine

+ (DNDSSyncEngine)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_33);
  return (DNDSSyncEngine *)(id)sharedInstance_shared;
}

void __32__DNDSSyncEngine_sharedInstance__block_invoke()
{
  DNDSSyncEngineMetadataStore *v0;
  void *v1;
  DNDSSyncEngineLastChanceDataStore *v2;
  void *v3;
  DNDSSyncEngineLastChanceDataStore *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  DNDSSyncEngine *v8;
  void *v9;
  DNDSSyncEngineMetadataStore *v10;

  v0 = [DNDSSyncEngineMetadataStore alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "dnds_syncEngineMetadataFileURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DNDSSyncEngineMetadataStore initWithURL:](v0, "initWithURL:", v1);

  v2 = [DNDSSyncEngineLastChanceDataStore alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "dnds_syncEngineLastChanceFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DNDSSyncEngineLastChanceDataStore initWithURL:](v2, "initWithURL:", v3);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("disableCloudSync")) ^ 1;

  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DNDSSyncEngine initWithMetadataStore:lastChanceDataStore:keybag:syncEnabled:]([DNDSSyncEngine alloc], "initWithMetadataStore:lastChanceDataStore:keybag:syncEnabled:", v10, v4, v7, v6);
  v9 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v8;

}

- (DNDSSyncEngine)initWithMetadataStore:(id)a3 lastChanceDataStore:(id)a4 keybag:(id)a5 syncEnabled:(BOOL)a6
{
  DNDSSyncEngine *v6;
  DNDSSyncEngine *v7;
  uint64_t v8;
  CKContainer *container;
  void *v10;

  v6 = -[DNDSSyncEngine initWithMetadataStore:lastChanceDataStore:syncEngine:keybag:syncEnabled:](self, "initWithMetadataStore:lastChanceDataStore:syncEngine:keybag:syncEnabled:", a3, a4, 0, a5, a6);
  v7 = v6;
  if (v6)
  {
    v6->_allowSyncEngineCreation = 1;
    if (v6->_state.featureEnabled)
    {
      objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.donotdisturbd"));
      v8 = objc_claimAutoreleasedReturnValue();
      container = v7->_container;
      v7->_container = (CKContainer *)v8;

      -[DNDSSyncEngine _updateAccountWithCurrentSyncEnabledState](v7, "_updateAccountWithCurrentSyncEnabledState");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__cloudKitAccountChanged_, *MEMORY[0x1E0C94690], 0);

    }
  }
  return v7;
}

- (DNDSSyncEngine)initWithMetadataStore:(id)a3 lastChanceDataStore:(id)a4 syncEngine:(id)a5 keybag:(id)a6 syncEnabled:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  DNDSSyncEngine *v17;
  DNDSSyncEngine *v18;
  id v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *syncEngineQueue;
  dispatch_source_t v23;
  OS_dispatch_source *accountUpdateSource;
  NSObject *v25;
  id *v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  id v35;
  id v36;
  uint8_t buf[8];
  _QWORD handler[4];
  id *v39;
  objc_super v40;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v40.receiver = self;
  v40.super_class = (Class)DNDSSyncEngine;
  v17 = -[DNDSSyncEngine init](&v40, sel_init);
  v18 = v17;
  if (v17)
  {
    v36 = v16;
    v35 = v15;
    v19 = v13;
    v17->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.donotdisturb.server.DNDSSyncEngine", v20);
    syncEngineQueue = v18->_syncEngineQueue;
    v18->_syncEngineQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_source_create(MEMORY[0x1E0C80D80], 0, 0, (dispatch_queue_t)v18->_syncEngineQueue);
    accountUpdateSource = v18->_accountUpdateSource;
    v18->_accountUpdateSource = (OS_dispatch_source *)v23;

    v25 = v18->_accountUpdateSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __90__DNDSSyncEngine_initWithMetadataStore_lastChanceDataStore_syncEngine_keybag_syncEnabled___block_invoke;
    handler[3] = &unk_1E86A5970;
    v26 = v18;
    v39 = v26;
    dispatch_source_set_event_handler(v25, handler);
    dispatch_activate((dispatch_object_t)v18->_accountUpdateSource);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v26[6];
    v26[6] = (id)v27;

    objc_storeStrong(v26 + 1, a3);
    objc_storeStrong(v26 + 8, a4);
    objc_storeStrong(v26 + 7, a3);
    *((_BYTE *)v26 + 78) = 0;
    objc_storeStrong(v26 + 2, a5);
    *((_BYTE *)v26 + 73) = 1;
    *((_BYTE *)v26 + 76) = 1;
    *((_BYTE *)v26 + 72) = a7;
    *((_BYTE *)v26 + 74) = objc_msgSend(v26[7], "accountStatus") == 1;
    *((_BYTE *)v26 + 75) = objc_msgSend(v26[7], "isEncryptionAvailable");
    v29 = *((unsigned int *)v26 + 18) | ((unint64_t)*((unsigned __int16 *)v26 + 38) << 32);
    if ((v29 & 0x10000000000) != 0 || (v29 & 0x101010101) == 0x101010101)
    {
      v30 = DNDSLogCloudSync;
      v13 = v19;
      v15 = v35;
      if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:
        objc_storeStrong(v26 + 11, a6);
        objc_msgSend(v26[11], "addObserver:", v26);
        DNDSRegisterSysdiagnoseDataProvider(v26);

        v16 = v36;
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      v31 = "Sync engine will be enabled on startup";
    }
    else
    {
      if (((_DWORD)v26[9] & 0xFF00) != 0)
      {
        v13 = v19;
      }
      else
      {
        v32 = DNDSLogCloudSync;
        v13 = v19;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Sync engine will be disabled on startup because of feature flag", buf, 2u);
        }
        LOBYTE(v29) = *((_BYTE *)v26 + 72);
      }
      v15 = v35;
      if (!(_BYTE)v29)
      {
        v33 = DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB895000, v33, OS_LOG_TYPE_DEFAULT, "Sync engine will be disabled on startup because user setting is disabled", buf, 2u);
        }
      }
      if (*((_BYTE *)v26 + 74))
        goto LABEL_18;
      v30 = DNDSLogCloudSync;
      if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v31 = "Sync engine will be disabled on startup because of missing account";
    }
    _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    goto LABEL_18;
  }
LABEL_19:

  return v18;
}

uint64_t __90__DNDSSyncEngine_initWithMetadataStore_lastChanceDataStore_syncEngine_keybag_syncEnabled___block_invoke(uint64_t a1)
{
  dispatch_source_t *v2;
  uintptr_t data;
  void *v4;

  v2 = *(dispatch_source_t **)(a1 + 32);
  data = dispatch_source_get_data(v2[5]);
  if (data - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = (void *)DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __90__DNDSSyncEngine_initWithMetadataStore_lastChanceDataStore_syncEngine_keybag_syncEnabled___block_invoke_cold_1(v4, data);
    v2 = *(dispatch_source_t **)(a1 + 32);
  }
  return -[dispatch_source_t _syncEngineQueue_updateAccountWithSyncEnabledState:](v2, "_syncEngineQueue_updateAccountWithSyncEnabledState:", data != 1);
}

- (unint64_t)cloudSyncState
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state.encryptionAvailable)
    v4 = (4 * self->_state.accountAvailable) | 2;
  else
    v4 = 4 * self->_state.accountAvailable;
  v5 = v4 | self->_state.syncEnabled;
  if (self->_state.supportedDevice)
    v6 = v5 | 8;
  else
    v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isSyncAvailable
{
  DNDSSyncEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[DNDSSyncEngine _lock_isSyncAvailable](v2, "_lock_isSyncAvailable");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSyncEnabled
{
  DNDSSyncEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[DNDSSyncEngine _lock_isSyncEnabled](v2, "_lock_isSyncEnabled");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSyncPreferenceEnabled
{
  DNDSSyncEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state.syncEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSyncPreferenceEnabled:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state.syncEnabled == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disabled";
      if (v3)
        v7 = "enabled";
      v8 = 136446210;
      v9 = v7;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Sync engine changing to %{public}s", (uint8_t *)&v8, 0xCu);
    }
    os_unfair_lock_unlock(p_lock);
    -[DNDSSyncEngine _updateAccountWithSyncEnabledState:](self, "_updateAccountWithSyncEnabledState:", v3);
  }
}

- (void)setTesting:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_state.testing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDataSource:(id)a3 forZoneName:(id)a4
{
  id v6;
  id v7;
  NSMapTable *sourcesByZoneName;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  sourcesByZoneName = self->_sourcesByZoneName;
  if (v6)
  {
    -[NSMapTable objectForKey:](sourcesByZoneName, "objectForKey:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9,
          -[NSMapTable objectForKey:](self->_sourcesByZoneName, "objectForKey:", v7),
          v11 = (id)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11 == v6))
    {
      -[NSMapTable setObject:forKey:](self->_sourcesByZoneName, "setObject:forKey:", v6, v7);
      v12 = -[DNDSSyncEngineMetadataStoring addZoneName:](self->_metadataStore, "addZoneName:", v7);
      os_unfair_lock_unlock(&self->_lock);
      if (v12)
      {
        v13 = DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138412290;
          v15 = v7;
          _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Performing initial sync for new zone: %@", (uint8_t *)&v14, 0xCu);
        }
        -[DNDSSyncEngine _initialSyncForDataSource:withZoneName:](self, "_initialSyncForDataSource:withZoneName:", v6, v7);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    -[DNDSSyncEngine _retryLastChanceRecordsForDataSource:withZoneName:](self, "_retryLastChanceRecordsForDataSource:withZoneName:", v6, v7);
  }
  else
  {
    -[NSMapTable removeObjectForKey:](sourcesByZoneName, "removeObjectForKey:", v7);
    -[DNDSSyncEngineMetadataStoring removeZoneName:](self->_metadataStore, "removeZoneName:", v7);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (-[DNDSSyncEngine _lock_isSyncEnabled](self, "_lock_isSyncEnabled"))
  {
    v8 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Adding record IDs to save: %{public}@; to delete: %{public}@",
        (uint8_t *)&v10,
        0x16u);
    }
    -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addRecordIDsToSave:recordIDsToDelete:", v6, v7);

    if (!self->_syncEngine && self->_allowSyncEngineCreation)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_FAULT))
        -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:].cold.1();
      _DNDSRequestRadar(CFSTR("RecordID change was made before sync engine availability."), 0, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSSyncEngine.m"), 329);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)addRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (-[DNDSSyncEngine _lock_isSyncEnabled](self, "_lock_isSyncEnabled"))
  {
    v8 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Adding zones to save: %{public}@; to delete: %{public}@",
        (uint8_t *)&v10,
        0x16u);
    }
    -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addRecordZonesToSave:recordZoneIDsToDelete:", v6, v7);

    if (!self->_syncEngine && self->_allowSyncEngineCreation)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_FAULT))
        -[DNDSSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:].cold.1();
      _DNDSRequestRadar(CFSTR("RecordZoneID change was made before sync engine availability."), 0, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSSyncEngine.m"), 346);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)sendChangesWithCompletionHandler:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[DNDSSyncEngine _lock_isSyncEnabled](self, "_lock_isSyncEnabled"))
  {
    -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modifyPendingChangesWithCompletionHandler:", v4);

  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__DNDSSyncEngine_sendChangesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E86A8088;
    v9 = v4;
    dispatch_async(v7, block);

  }
  os_unfair_lock_unlock(p_lock);

}

uint64_t __51__DNDSSyncEngine_sendChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchChanges:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  os_unfair_lock_s *p_lock;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[DNDSSyncEngine _lock_isSyncEnabled](self, "_lock_isSyncEnabled"))
  {
    v8 = DNDSLogCloudSync;
    v9 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Forcing sync engine fetch", buf, 2u);
      }
      -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsToFetchChanges");

    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Requesting sync engine fetch", buf, 2u);
    }
    -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchChangesWithCompletionHandler:", v6);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__DNDSSyncEngine_fetchChanges_withCompletionHandler___block_invoke;
    block[3] = &unk_1E86A8088;
    v14 = v6;
    dispatch_async(v11, block);

    v12 = v14;
  }

  os_unfair_lock_unlock(p_lock);
}

uint64_t __53__DNDSSyncEngine_fetchChanges_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sync:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v6 = a4;
  if (-[DNDSSyncEngine isSyncEnabled](self, "isSyncEnabled"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke;
    v13[3] = &unk_1E86A80D8;
    v13[4] = self;
    v14 = v6;
    v7 = v6;
    -[DNDSSyncEngine fetchChanges:withCompletionHandler:](self, "fetchChanges:withCompletionHandler:", v4, v13);
    v8 = v14;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_30;
    block[3] = &unk_1E86A8088;
    v12 = v6;
    v10 = v6;
    dispatch_async(v9, block);

    v8 = v12;
  }

}

void __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = DNDSLogCloudSync;
  v5 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v10 = v3;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Error fetching changes: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Fetched changes", buf, 2u);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_28;
    v7[3] = &unk_1E86A80B0;
    v6 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "sendChangesWithCompletionHandler:", v7);

  }
}

void __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  uint8_t v6[16];

  v3 = a2;
  v4 = DNDSLogCloudSync;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_28_cold_1();
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Sent changes", v6, 2u);
    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v5();

}

uint64_t __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleFetchedRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  DNDSSyncEngineLastChanceDataStoring *lastChanceStore;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  DNDSSyncEngineLastChanceDataStoring *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSSyncEngineMetadataStoring addRecord:](self->_store, "addRecord:", v4);
  -[DNDSSyncEngine _zoneIDForRecord:](self, "_zoneIDForRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v7 = objc_msgSend(v6, "syncEngine:wantsRecord:", self, v4);
  switch(v7)
  {
    case 0:
      v17 = (void *)DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        objc_msgSend(v4, "recordID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "recordName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v5;
        v27 = 2114;
        v28 = v20;
        _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find data source with zoneID %{public}@ for record %{public}@; sending to last-chance store",
          (uint8_t *)&v25,
          0x16u);

      }
      goto LABEL_14;
    case 2:
      v21 = (void *)DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        objc_msgSend(v4, "recordID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "recordName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v24;
        _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Record %{public}@ is from the future; saving what we can and sending to last-chance store",
          (uint8_t *)&v25,
          0xCu);

      }
      objc_msgSend(v6, "syncEngine:didFetchRecord:", self, v4);
LABEL_14:
      os_unfair_lock_lock(&self->_lock);
      -[DNDSSyncEngineLastChanceDataStoring addRecord:](self->_lastChanceStore, "addRecord:", v4);
      os_unfair_lock_unlock(&self->_lock);
      break;
    case 1:
      lastChanceStore = self->_lastChanceStore;
      objc_msgSend(v4, "recordID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSyncEngineLastChanceDataStoring recordWithID:](lastChanceStore, "recordWithID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          v12 = v11;
          objc_msgSend(v4, "recordID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "recordName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v14;
          _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Record %{public}@ overrides a previously-stored record in the last-chance store.", (uint8_t *)&v25, 0xCu);

        }
        v15 = self->_lastChanceStore;
        objc_msgSend(v4, "recordID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSSyncEngineLastChanceDataStoring removeRecordWithID:](v15, "removeRecordWithID:", v16);

      }
      objc_msgSend(v6, "syncEngine:didFetchRecord:", self, v4);
      break;
  }

}

- (void)handleDeletedRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSSyncEngineLastChanceDataStoring removeRecordWithID:](self->_lastChanceStore, "removeRecordWithID:", v4);
  -[DNDSSyncEngineMetadataStoring removeRecordWithID:](self->_store, "removeRecordWithID:", v4);
  os_unfair_lock_unlock(&self->_lock);
  v7 = DNDSLogCloudSync;
  v8 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
      -[DNDSSyncEngine handleDeletedRecordID:].cold.2((uint64_t)v4, (uint64_t)v6, v7);
    objc_msgSend(v6, "syncEngine:recordWithIDWasDeleted:", self, v4);
  }
  else if (v8)
  {
    -[DNDSSyncEngine handleDeletedRecordID:].cold.1();
  }

}

- (void)removeZoneWithID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMapTable *sourcesByZoneName;
  void *v7;
  DNDSSyncEngineMetadataStoring *metadataStore;
  void *v9;
  void *v10;
  id v11;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  sourcesByZoneName = self->_sourcesByZoneName;
  objc_msgSend(v5, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](sourcesByZoneName, "objectForKey:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[DNDSSyncEngineLastChanceDataStoring removeRecordsWithZoneID:](self->_lastChanceStore, "removeRecordsWithZoneID:", v5);
  -[DNDSSyncEngineMetadataStoring removeRecordsWithZoneID:](self->_store, "removeRecordsWithZoneID:", v5);
  metadataStore = self->_metadataStore;
  objc_msgSend(v5, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngineMetadataStoring removeZoneName:](metadataStore, "removeZoneName:", v9);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v5, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSSyncEngine _initialSyncForDataSource:withZoneName:](self, "_initialSyncForDataSource:withZoneName:", v11, v10);
}

- (void)purgeZoneWithID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  DNDSSyncEngineMetadataStoring *metadataStore;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngineMetadataStoring recordIDsWithZoneID:](self->_store, "recordIDsWithZoneID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngineLastChanceDataStoring removeRecordsWithZoneID:](self->_lastChanceStore, "removeRecordsWithZoneID:", v5);
  -[DNDSSyncEngineMetadataStoring removeRecordsWithZoneID:](self->_store, "removeRecordsWithZoneID:", v5);
  metadataStore = self->_metadataStore;
  objc_msgSend(v5, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngineMetadataStoring removeZoneName:](metadataStore, "removeZoneName:", v9);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "syncEngine:zoneWithIDWasDeleted:removingRecordIDs:", self, v5, v7);
  os_unfair_lock_lock(p_lock);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v5);
  -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addRecordZonesToSave:recordZoneIDsToDelete:", v12, 0);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v5, "zoneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSSyncEngine _initialSyncForDataSource:withZoneName:](self, "_initialSyncForDataSource:withZoneName:", v6, v13);
}

- (BOOL)hasLocalChanges
{
  os_unfair_lock_s *p_lock;
  void *v4;
  char v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPendingModifications");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)lastChanceRecordForRecordID:(id)a3
{
  return (id)-[DNDSSyncEngineLastChanceDataStoring recordWithID:](self->_lastChanceStore, "recordWithID:", a3);
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Deleted record: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSSyncEngineMetadataStoring removeRecordWithID:](self->_store, "removeRecordWithID:", v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Fetched record: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[DNDSSyncEngine handleFetchedRecord:](self, "handleFetchedRecord:", v5);

}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Saved record: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSSyncEngineMetadataStoring addRecord:](self->_store, "addRecord:", v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Updated metadata", v7, 2u);
  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSSyncEngineMetadataStoring setMetadata:](self->_store, "setMetadata:", v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
    -[DNDSSyncEngine syncEngine:failedToDeleteRecordWithID:error:].cold.2(v11);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v9, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (v13)
  {
    objc_msgSend(v13, "syncEngine:failedToDeleteRecordWithID:error:", self, v9, v10);
  }
  else
  {
    v14 = (void *)DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      -[DNDSSyncEngine syncEngine:failedToDeleteRecordWithID:error:].cold.1((uint64_t)v12, v14, v9);
  }

}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  void *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
    -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.8(v11);
  objc_msgSend(v10, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if ((v13 & 1) != 0)
  {
    v14 = objc_msgSend(v10, "code");
    if (v14 > 25)
    {
      switch(v14)
      {
        case 26:
          -[DNDSSyncEngine _zoneIDForRecord:](self, "_zoneIDForRecord:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v31;
            objc_msgSend(v15, "zoneName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v50 = v33;
            _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Zone %{public}@ not found; pushing zone to server",
              buf,
              0xCu);

          }
          if (!v15)
          {
            if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
              -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.5();
            goto LABEL_35;
          }
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v15);
          v48 = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:](self, "addRecordZonesToSave:recordZoneIDsToDelete:", v34, 0);

          objc_msgSend(v9, "recordID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v35, 0);

LABEL_25:
LABEL_34:

LABEL_35:
          goto LABEL_36;
        case 28:
          -[DNDSSyncEngine _zoneIDForRecord:](self, "_zoneIDForRecord:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            v37 = v36;
            objc_msgSend(v15, "zoneName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v50 = v38;
            _os_log_impl(&dword_1CB895000, v37, OS_LOG_TYPE_DEFAULT, "User deleted zone %{public}@; deleting zone",
              buf,
              0xCu);

          }
          if (v15)
          {
            -[DNDSSyncEngine syncEngine:zoneWithIDWasPurged:](self, "syncEngine:zoneWithIDWasPurged:", v8, v15);
          }
          else if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
          {
            -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.6();
          }
          goto LABEL_35;
        case 112:
          -[DNDSSyncEngine _zoneIDForRecord:](self, "_zoneIDForRecord:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            objc_msgSend(v15, "zoneName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v50 = v18;
            _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Missing identity for zone %{public}@; deleting and recreating zone",
              buf,
              0xCu);

          }
          if (!v15)
          {
            v40 = DNDSLogCloudSync;
            if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CB895000, v40, OS_LOG_TYPE_DEFAULT, "ZoneID is nil; ignoring record", buf, 2u);
            }
            goto LABEL_35;
          }
          os_unfair_lock_lock(&self->_lock);
          -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addRecordZonesToSave:recordZoneIDsToDelete:", 0, v21);

          -[DNDSSyncEngineMetadataStoring removeRecordsWithZoneID:](self->_store, "removeRecordsWithZoneID:", v15);
          os_unfair_lock_unlock(&self->_lock);
          objc_msgSend(v15, "zoneName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngine _initialSyncForDataSource:withZoneName:](self, "_initialSyncForDataSource:withZoneName:", v19, v22);
          goto LABEL_25;
      }
      goto LABEL_37;
    }
    if (v14 == 11)
    {
      v39 = DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v39, OS_LOG_TYPE_DEFAULT, "Record is unknown on the server; flushing metadata and resending",
          buf,
          2u);
      }
      objc_msgSend(v9, "recordID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
          -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.4();
        goto LABEL_35;
      }
      os_unfair_lock_lock(&self->_lock);
      -[DNDSSyncEngineMetadataStoring removeRecordWithID:](self->_store, "removeRecordWithID:", v15);
      os_unfair_lock_unlock(&self->_lock);
      v51 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v19, 0);
      goto LABEL_34;
    }
    if (v14 != 14)
    {
LABEL_37:
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
        -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.1();
      goto LABEL_36;
    }
    v24 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "Server record has changed; resolving conflict", buf, 2u);
    }
    os_unfair_lock_lock(&self->_lock);
    -[DNDSSyncEngine _zoneIDForRecord:](self, "_zoneIDForRecord:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v45 = v25;
      objc_msgSend(v10, "userInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B8]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "userInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B0]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[DNDSSyncEngineMetadataStoring addRecord:](self->_store, "addRecord:", v28);
        os_unfair_lock_unlock(&self->_lock);
        objc_msgSend(v26, "syncEngine:resolveConflictBetweenClientRecord:andServerRecord:", self, v30, v28);

      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
        objc_msgSend(v30, "recordID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(v30, "recordID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v42;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v43, 0);

        }
        else
        {
          v44 = (void *)DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
            -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.3(v44, v9);
        }

      }
      v25 = v45;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
        -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.2();
      os_unfair_lock_unlock(&self->_lock);
    }

  }
  else
  {
    v23 = (void *)DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.7(v23);
  }
LABEL_36:

}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  DNDSSyncEngineLastChanceDataStoring *lastChanceStore;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  DNDSSyncEngineLastChanceDataStoring *v25;
  void *v26;
  int v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138543362;
    v29 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Creating record to save: %{public}@", (uint8_t *)&v28, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v7, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    os_unfair_lock_unlock(&self->_lock);
LABEL_13:
    v11 = 0;
    goto LABEL_21;
  }
  -[DNDSSyncEngineMetadataStoring recordWithID:](self->_store, "recordWithID:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v11)
  {
    objc_msgSend(v10, "syncEngine:recordTypeForRecordID:", self, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", v12, v7);

  }
  v13 = objc_msgSend(v10, "syncEngine:prepareRecordToSave:", self, v11);
  switch(v13)
  {
    case 2:
      v14 = (void *)DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        objc_msgSend(v11, "recordID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "recordName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v17;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Record %{public}@ has changes from the future; saving healed modifications to last-chance store",
          (uint8_t *)&v28,
          0xCu);

      }
      os_unfair_lock_lock(&self->_lock);
      -[DNDSSyncEngineLastChanceDataStoring addRecord:](self->_lastChanceStore, "addRecord:", v11);
      os_unfair_lock_unlock(&self->_lock);
      break;
    case 1:
      lastChanceStore = self->_lastChanceStore;
      objc_msgSend(v11, "recordID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSyncEngineLastChanceDataStoring recordWithID:](lastChanceStore, "recordWithID:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = (void *)DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          objc_msgSend(v11, "recordID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "recordName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543362;
          v29 = v24;
          _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Record %{public}@ was overridden locally; removing record in last-chance store.",
            (uint8_t *)&v28,
            0xCu);

        }
        v25 = self->_lastChanceStore;
        objc_msgSend(v11, "recordID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSSyncEngineLastChanceDataStoring removeRecordWithID:](v25, "removeRecordWithID:", v26);

      }
      break;
    case 0:
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
        -[DNDSSyncEngine syncEngine:recordToSaveForRecordID:].cold.1();

      goto LABEL_13;
  }
LABEL_21:

  return v11;
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Record was deleted: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  -[DNDSSyncEngine handleDeletedRecordID:](self, "handleDeletedRecordID:", v6);

}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;
  void *v7;

  p_lock = &self->_lock;
  v6 = a4;
  os_unfair_lock_lock(p_lock);
  -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7 != 0;
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Zone was deleted: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  -[DNDSSyncEngine removeZoneWithID:](self, "removeZoneWithID:", v5);

}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Zone was purged: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  -[DNDSSyncEngine purgeZoneWithID:](self, "purgeZoneWithID:", v5);

}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Keybag unlocked", v5, 2u);
  }
  -[DNDSSyncEngine _updateAccountWithCurrentSyncEnabledState](self, "_updateAccountWithCurrentSyncEnabledState");
  -[DNDSSyncEngine _retryLastChanceRecords](self, "_retryLastChanceRecords");
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.DNDSSyncEngine");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  os_unfair_lock_t lock;
  void *v40;
  id obj;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[2];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v4 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowSyncEngineCreation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("allowSyncEngineCreation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_state.accountAvailable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("accountAvailable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_state.encryptionAvailable);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("encryptionAvailable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_state.featureEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("featureEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_state.supportedDevice);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("supportedDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_state.syncEnabled);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("syncEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_state.testing);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("testing"));

  -[DNDSSyncEngineLastChanceDataStoring records](self->_lastChanceStore, "records");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v6;
  if (v4)
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v15;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v54;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v54 != v42)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v16);
        v46 = (void *)MEMORY[0x1E0CB3940];
        v48 = v16;
        objc_msgSend(v17, "recordType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recordID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "recordName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recordID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "zoneID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "zoneName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recordID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "zoneID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "ownerName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("%@ %@:%@(%@)"), v18, v19, v22, v25, lock);
        v47 = objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          objc_msgSend(v43, "addObject:", v43);
          v26 = (void *)v47;
        }
        else
        {
          objc_msgSend(v17, "values");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v27, "mutableCopy");

          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v57[0] = CFSTR("DNDSModeConfigurationsRecordMainPartition");
          v57[1] = CFSTR("DNDSModeConfigurationsRecordSecondaryPartition");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v50 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
                objc_msgSend(v17, "encryptedValues");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKey:", v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                if (v36)
                {
                  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v36, 0, 0);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, v34);

                }
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
            }
            while (v31);
          }

          v26 = (void *)v47;
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v28, v47);

        }
        v16 = v48 + 1;
      }
      while (v48 + 1 != v44);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v44);
  }

  objc_msgSend(v40, "setObject:forKeyedSubscript:", v43, CFSTR("lastChanceStore"));
  os_unfair_lock_unlock(lock);

  return v40;
}

- (id)_zoneIDForRecord:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_retryLastChanceRecords
{
  os_unfair_lock_s *p_lock;
  DNDSKeybagStateProviding *keybag;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  keybag = self->_keybag;
  if (!keybag || -[DNDSKeybagStateProviding hasUnlockedSinceBoot](keybag, "hasUnlockedSinceBoot"))
  {
    os_unfair_lock_lock(p_lock);
    -[NSMapTable dictionaryRepresentation](self->_sourcesByZoneName, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngine _retryLastChanceRecordsForDataSource:withZoneName:](self, "_retryLastChanceRecordsForDataSource:withZoneName:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)_retryLastChanceRecordsForDataSource:(id)a3 withZoneName:(id)a4
{
  id v6;
  id v7;
  DNDSKeybagStateProviding *keybag;
  void *v9;
  DNDSSyncEngineLastChanceDataStoring *lastChanceStore;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  DNDSSyncEngineLastChanceDataStoring *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  keybag = self->_keybag;
  if (!keybag || -[DNDSKeybagStateProviding hasUnlockedSinceBoot](keybag, "hasUnlockedSinceBoot"))
  {
    v30 = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", v7);
    os_unfair_lock_lock(&self->_lock);
    lastChanceStore = self->_lastChanceStore;
    v29 = v9;
    objc_msgSend(v9, "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSSyncEngineLastChanceDataStoring recordsWithZoneID:](lastChanceStore, "recordsWithZoneID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v20 = objc_msgSend(v6, "syncEngine:wantsRecord:", self, v19);
          if (v20)
          {
            v21 = v20;
            objc_msgSend(v6, "syncEngine:didFetchRecord:", self, v19);
            if (v21 == 1)
              objc_msgSend(v13, "addObject:", v19);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v16);
    }

    os_unfair_lock_lock(&self->_lock);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v13;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          v27 = self->_lastChanceStore;
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "recordID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngineLastChanceDataStoring removeRecordWithID:](v27, "removeRecordWithID:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v24);
    }

    os_unfair_lock_unlock(&self->_lock);
    v7 = v30;
  }

}

- (void)_updateAccountWithCurrentSyncEnabledState
{
  os_unfair_lock_s *p_lock;
  _BOOL4 syncEnabled;
  uintptr_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  syncEnabled = self->_state.syncEnabled;
  os_unfair_lock_unlock(p_lock);
  if (syncEnabled)
    v5 = 2;
  else
    v5 = 1;
  dispatch_source_merge_data((dispatch_source_t)self->_accountUpdateSource, v5);
}

- (void)_updateAccountWithSyncEnabledState:(BOOL)a3
{
  NSObject *accountUpdateSource;
  uintptr_t v4;

  accountUpdateSource = self->_accountUpdateSource;
  if (a3)
    v4 = 2;
  else
    v4 = 1;
  dispatch_source_merge_data(accountUpdateSource, v4);
}

- (void)_syncEngineQueue_updateAccountWithSyncEnabledState:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  BOOL v7;
  BOOL featureEnabled;
  BOOL supportedDevice;
  NSObject *v10;
  const char *v11;
  DNDSKeybagStateProviding *keybag;
  CKContainer *container;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  _QWORD v19[5];
  BOOL v20;
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncEngineQueue);
  v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Updating account", buf, 2u);
  }
  -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:](self, "_migrateOldStoresWithSyncEnabledState:", v3);
  os_unfair_lock_lock(p_lock);
  v7 = -[DNDSSyncEngine _lock_isSyncPreferenceEnabled](self, "_lock_isSyncPreferenceEnabled");
  featureEnabled = self->_state.featureEnabled;
  supportedDevice = self->_state.supportedDevice;
  os_unfair_lock_unlock(p_lock);
  if (!supportedDevice)
  {
    v10 = DNDSLogCloudSync;
    if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v11 = "Ignoring account change because device is unsupported";
LABEL_9:
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    return;
  }
  if (!featureEnabled)
  {
    v10 = DNDSLogCloudSync;
    if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v11 = "Ignoring account change because feature is not enabled";
    goto LABEL_9;
  }
  keybag = self->_keybag;
  if (keybag && (-[DNDSKeybagStateProviding hasUnlockedSinceBoot](keybag, "hasUnlockedSinceBoot") & 1) == 0)
  {
    os_unfair_lock_lock(p_lock);
    v14 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Device is locked", buf, 2u);
    }
    -[DNDSSyncEngine _lock_currentUserRecordID](self, "_lock_currentUserRecordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_state.accountAvailable = v15 != 0;
    self->_state.encryptionAvailable = -[DNDSSyncEngine _lock_encryptionAvailable](self, "_lock_encryptionAvailable");
    v16 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "available";
      if (self->_state.accountAvailable)
        v18 = "available";
      else
        v18 = "unavailable";
      if (!self->_state.encryptionAvailable)
        v17 = "unavailable";
      *(_DWORD *)buf = 136315394;
      v23 = v18;
      v24 = 2080;
      v25 = v17;
      _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Initial account state is %s; encryption is %s",
        buf,
        0x16u);
    }
    os_unfair_lock_unlock(p_lock);

  }
  else
  {
    dispatch_suspend((dispatch_object_t)self->_syncEngineQueue);
    container = self->_container;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke;
    v19[3] = &unk_1E86A8128;
    v19[4] = self;
    v20 = v3;
    v21 = v7;
    -[CKContainer accountStatusWithCompletionHandler:](container, "accountStatusWithCompletionHandler:", v19);
  }
}

void __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  os_unfair_lock_s *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[6];
  char v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_cold_1();
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
  }
  else
  {
    v6 = *(os_unfair_lock_s **)(a1 + 32);
    if (a2 == 1)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_60;
      v15[3] = &unk_1E86A8100;
      v15[4] = v6;
      v15[5] = 1;
      v16 = *(_BYTE *)(a1 + 40);
      -[os_unfair_lock_s _fetchAccountStateWithCompletionHandler:](v6, "_fetchAccountStateWithCompletionHandler:", v15);
    }
    else
    {
      os_unfair_lock_lock(v6 + 6);
      objc_msgSend(*(id *)(a1 + 32), "_lock_currentUserRecordID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      switch(a2)
      {
        case 0:
          v8 = DNDSLogCloudSync;
          if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          *(_DWORD *)buf = 138412290;
          v18 = 0;
          v9 = "Sync engine will be disabled because of an error: %@";
          v10 = v8;
          v11 = 12;
          goto LABEL_20;
        case 2:
          v12 = DNDSLogCloudSync;
          if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
            goto LABEL_15;
          *(_WORD *)buf = 0;
          v13 = "Sync engine will be disabled because account is restricted";
          goto LABEL_14;
        case 3:
          v12 = DNDSLogCloudSync;
          if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
            goto LABEL_15;
          *(_WORD *)buf = 0;
          v13 = "Sync engine will be disabled because no account exists";
LABEL_14:
          _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
LABEL_15:
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = *(_BYTE *)(a1 + 40);
          if (!v7)
            goto LABEL_22;
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 74) = 0;
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 75) = 0;
          objc_msgSend(*(id *)(a1 + 32), "_lock_purgeData");
          objc_msgSend(*(id *)(a1 + 32), "_lock_destroySyncEngine");
          objc_msgSend(*(id *)(a1 + 32), "_lock_setCurrentAccountStatus:", a2);
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
          if (*(_BYTE *)(a1 + 41))
            objc_msgSend(*(id *)(a1 + 32), "_purgeDataFromDataSources");
          break;
        case 4:
          v14 = DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v9 = "Sync engine will be disabled because the account is unavailable";
            v10 = v14;
            v11 = 2;
LABEL_20:
            _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
          }
          goto LABEL_21;
        default:
LABEL_21:
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = *(_BYTE *)(a1 + 40);
LABEL_22:
          objc_msgSend(*(id *)(a1 + 32), "_lock_destroySyncEngine");
          objc_msgSend(*(id *)(a1 + 32), "_lock_setCurrentAccountStatus:", a2);
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
          break;
      }
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));

    }
  }

}

void __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_60(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;

  v7 = a2;
  v8 = a4;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_60_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleAccountFetchWithUpdatedUserRecordID:updatedAccountStatus:updatedEncryptionAvailable:updatedSyncEnabled:", v7, *(_QWORD *)(a1 + 40), a3, *(unsigned __int8 *)(a1 + 48));
  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));

}

- (void)_fetchAccountStateWithCompletionHandler:(id)a3
{
  id v4;
  CKContainer *container;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  container = self->_container;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E86A8178;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CKContainer accountInfoWithCompletionHandler:](container, "accountInfoWithCompletionHandler:", v7);

}

void __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = (objc_msgSend(v5, "deviceToDeviceEncryptionAvailability") >> 1) & 1;
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_63;
    v10[3] = &unk_1E86A8150;
    v11 = v8;
    v12 = v7;
    objc_msgSend(v9, "fetchUserRecordIDWithCompletionHandler:", v10);

  }
}

void __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_63_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "recordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)_handleAccountFetchWithUpdatedUserRecordID:(id)a3 updatedAccountStatus:(int64_t)a4 updatedEncryptionAvailable:(BOOL)a5 updatedSyncEnabled:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  unint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  BOOL syncEnabled;
  NSObject *v13;
  _BOOL4 v14;
  _BOOL8 v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  os_unfair_lock_s *p_lock;
  NSObject *v21;
  BOOL v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t v30;
  int v31;
  const char *v32;
  BOOL v34;
  BOOL featureEnabled;
  __int16 v36;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v6 = a6;
  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = (unint64_t)a3;
  os_unfair_lock_lock(&self->_lock);
  v10 = -[DNDSSyncEngine _lock_encryptionAvailable](self, "_lock_encryptionAvailable");
  -[DNDSSyncEngine _lock_currentUserRecordID](self, "_lock_currentUserRecordID");
  v11 = objc_claimAutoreleasedReturnValue();
  syncEnabled = self->_state.syncEnabled;
  featureEnabled = self->_state.featureEnabled;
  v36 = *(_WORD *)&self->_state.supportedDevice;
  v13 = DNDSLogCloudSync;
  v14 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
  v15 = v7;
  if (v7)
  {
    if (v10)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Encryption is available", buf, 2u);
      }
      v16 = 0;
      v34 = 1;
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Encryption is newly available", buf, 2u);
      }
      v34 = 1;
      v16 = 6;
    }
  }
  else if (v10)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Encryption is newly unavailable", buf, 2u);
    }
    v34 = 0;
    v16 = 7;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Encryption is not available", buf, 2u);
    }
    v16 = 0;
    v34 = 0;
  }
  if (syncEnabled && !v6)
  {
    v17 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Sync enabled state is newly disabled", buf, 2u);
    }
    v16 = 5;
LABEL_26:
    p_lock = &self->_lock;
    goto LABEL_27;
  }
  v18 = DNDSLogCloudSync;
  v19 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
  if (!syncEnabled && v6)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Sync enabled state is newly enabled", buf, 2u);
    }
    v16 = 4;
    goto LABEL_26;
  }
  p_lock = &self->_lock;
  if (v6)
  {
    if (!v19)
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Sync enabled state is unchanged from enabled";
  }
  else
  {
    if (!v19)
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Sync enabled state is unchanged from disabled";
  }
  _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
LABEL_27:
  if (v9 | v11)
  {
    if (v9)
    {
      if (v11)
      {
        v23 = objc_msgSend((id)v9, "isEqualToString:", v11);
        v24 = DNDSLogCloudSync;
        v25 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "User record ID is unchanged", buf, 2u);
          }
          v22 = 1;
        }
        else
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "User record ID has changed", buf, 2u);
          }
          v22 = 1;
          v16 = 3;
        }
      }
      else
      {
        v28 = DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v16 = 2;
          _os_log_impl(&dword_1CB895000, v28, OS_LOG_TYPE_DEFAULT, "New user record was added", buf, 2u);
          v22 = 1;
        }
        else
        {
          v22 = 1;
          v16 = 2;
        }
      }
    }
    else
    {
      v27 = DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v27, OS_LOG_TYPE_DEFAULT, "User record was removed", buf, 2u);
      }
      v22 = 0;
      v16 = 1;
    }
  }
  else
  {
    v21 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v21, OS_LOG_TYPE_DEFAULT, "User record is unchanged from nil", buf, 2u);
    }
    v22 = 0;
  }
  self->_state.syncEnabled = v6;
  self->_state.featureEnabled = featureEnabled;
  self->_state.accountAvailable = v22;
  self->_state.encryptionAvailable = v34;
  *(_WORD *)&self->_state.supportedDevice = v36;
  v29 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *(unsigned int *)&self->_state.syncEnabled | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32);
    if ((~v30 & 0x101010101) != 0)
      v31 = (v30 >> 40) & 1;
    else
      v31 = 1;
    if (v31)
      v32 = "enabled";
    else
      v32 = "disabled";
    *(_DWORD *)buf = 136315138;
    v38 = v32;
    _os_log_impl(&dword_1CB895000, v29, OS_LOG_TYPE_DEFAULT, "Sync engine resolved state: %s", buf, 0xCu);
  }
  switch(v16)
  {
    case 1uLL:
      -[DNDSSyncEngine _lock_purgeData](self, "_lock_purgeData");
      -[DNDSSyncEngine _lock_destroySyncEngine](self, "_lock_destroySyncEngine");
      -[DNDSSyncEngine _lock_setCurrentAccountStatus:](self, "_lock_setCurrentAccountStatus:", a4);
      -[DNDSSyncEngine _lock_setEncryptionAvailable:](self, "_lock_setEncryptionAvailable:", v15);
      os_unfair_lock_unlock(p_lock);
      -[DNDSSyncEngine _purgeDataFromDataSources](self, "_purgeDataFromDataSources");
      goto LABEL_72;
    case 2uLL:
      -[DNDSSyncEngine _lock_setCurrentUserRecordID:](self, "_lock_setCurrentUserRecordID:", v9);
      -[DNDSSyncEngine _lock_setCurrentAccountStatus:](self, "_lock_setCurrentAccountStatus:", a4);
      -[DNDSSyncEngine _lock_setEncryptionAvailable:](self, "_lock_setEncryptionAvailable:", v15);
      os_unfair_lock_unlock(p_lock);
      goto LABEL_70;
    case 3uLL:
    case 5uLL:
      -[DNDSSyncEngine _lock_purgeData](self, "_lock_purgeData");
      -[DNDSSyncEngine _lock_destroySyncEngine](self, "_lock_destroySyncEngine");
      -[DNDSSyncEngine _lock_setCurrentUserRecordID:](self, "_lock_setCurrentUserRecordID:", v9);
      goto LABEL_63;
    case 7uLL:
      -[DNDSSyncEngine _lock_destroySyncEngine](self, "_lock_destroySyncEngine");
      -[DNDSSyncEngine _lock_setCurrentAccountStatus:](self, "_lock_setCurrentAccountStatus:", a4);
      -[DNDSSyncEngine _lock_setEncryptionAvailable:](self, "_lock_setEncryptionAvailable:", v15);
      os_unfair_lock_unlock(p_lock);
      goto LABEL_72;
    default:
LABEL_63:
      -[DNDSSyncEngine _lock_setCurrentAccountStatus:](self, "_lock_setCurrentAccountStatus:", a4);
      -[DNDSSyncEngine _lock_setEncryptionAvailable:](self, "_lock_setEncryptionAvailable:", v15);
      os_unfair_lock_unlock(p_lock);
      if (v16 <= 6)
      {
        if (((1 << v16) & 0x54) != 0
          || ((1 << v16) & 0xA) != 0
          && (-[DNDSSyncEngine _purgeDataFromDataSources](self, "_purgeDataFromDataSources"), (v16 & 6) == 2))
        {
LABEL_70:
          -[DNDSSyncEngine _initialSyncForDataSources](self, "_initialSyncForDataSources");
        }
      }
LABEL_72:

      return;
  }
}

- (id)_lock_syncEngine
{
  DNDSKeybagStateProviding *keybag;
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  DNDSSyncEngineSynchronizing *syncEngine;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  DNDSSyncEngineSynchronizing *v15;
  DNDSSyncEngineSynchronizing *v16;
  uint8_t v18[16];
  __int16 v19;
  uint8_t v20[2];
  uint8_t buf[16];

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_allowSyncEngineCreation)
  {
    v8 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "_allowSyncEngineCreation == NO", buf, 2u);
    }
    goto LABEL_14;
  }
  keybag = self->_keybag;
  if (!keybag || (-[DNDSKeybagStateProviding hasUnlockedSinceBoot](keybag, "hasUnlockedSinceBoot") & 1) != 0)
  {
    v4 = *(unsigned int *)&self->_state.syncEnabled | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32);
    if ((v4 & 0x10000000000) == 0 && (v4 & 0x101010101) != 0x101010101)
    {
      v5 = DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 0;
        v6 = "Skipping sync engine creation because sync is disabled.";
        v7 = (uint8_t *)&v19;
LABEL_18:
        _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
        return 0;
      }
      return 0;
    }
    syncEngine = self->_syncEngine;
    if (syncEngine)
      return syncEngine;
    v10 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Sync engine will start", v18, 2u);
    }
    -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0C95160]);
    -[DNDSSyncEngineMetadataStoring metadata](self->_metadataStore, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithDatabase:dataSource:metadata:", v11, self, v13);

    objc_msgSend(v14, "setApsMachServiceName:", CFSTR("com.apple.aps.donotdisturb.sync-engine"));
    v15 = (DNDSSyncEngineSynchronizing *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95158]), "initWithConfiguration:", v14);
    v16 = self->_syncEngine;
    self->_syncEngine = v15;

LABEL_14:
    syncEngine = self->_syncEngine;
    return syncEngine;
  }
  v5 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    v6 = "Skipping sync engine creation because the device has not unlocked.";
    v7 = v20;
    goto LABEL_18;
  }
  return 0;
}

- (void)_lock_destroySyncEngine
{
  NSObject *v3;
  DNDSSyncEngineSynchronizing *syncEngine;
  uint8_t v5[16];

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_allowSyncEngineCreation && self->_syncEngine)
  {
    v3 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Destroying sync engine", v5, 2u);
    }
    syncEngine = self->_syncEngine;
    self->_syncEngine = 0;

  }
}

- (void)_lock_purgeData
{
  NSObject *v3;
  uint8_t v4[16];

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Purging sync engine data", v4, 2u);
  }
  -[DNDSSyncEngineMetadataStoring purge](self->_metadataStore, "purge");
  -[DNDSSyncEngineLastChanceDataStoring purge](self->_lastChanceStore, "purge");
}

- (id)_lock_dataSources
{
  void *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_sourcesByZoneName;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](self->_sourcesByZoneName, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)_lock_currentAccountStatus
{
  os_unfair_lock_assert_owner(&self->_lock);
  return -[DNDSSyncEngineMetadataStoring accountStatus](self->_metadataStore, "accountStatus");
}

- (void)_lock_setCurrentAccountStatus:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = -[DNDSSyncEngineMetadataStoring accountStatus](self->_metadataStore, "accountStatus");
  v6 = (void *)DNDSLogCloudSync;
  v7 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
  if (v5 == a3)
  {
    if (v7)
    {
      v8 = v6;
      CKStringFromAccountStatus();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Account status is unchanged: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      v10 = v6;
      CKStringFromAccountStatus();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Account status has changed to: %{public}@", (uint8_t *)&v12, 0xCu);

    }
    -[DNDSSyncEngineMetadataStoring setAccountStatus:](self->_metadataStore, "setAccountStatus:", a3);
  }
}

- (id)_lock_currentUserRecordID
{
  os_unfair_lock_assert_owner(&self->_lock);
  return (id)-[DNDSSyncEngineMetadataStoring userRecordID](self->_metadataStore, "userRecordID");
}

- (BOOL)_lock_encryptionAvailable
{
  os_unfair_lock_assert_owner(&self->_lock);
  return -[DNDSSyncEngineMetadataStoring isEncryptionAvailable](self->_metadataStore, "isEncryptionAvailable");
}

- (void)_lock_setEncryptionAvailable:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[DNDSSyncEngineMetadataStoring isEncryptionAvailable](self->_metadataStore, "isEncryptionAvailable") != v3)-[DNDSSyncEngineMetadataStoring setEncryptionAvailable:](self->_metadataStore, "setEncryptionAvailable:", v3);
}

- (void)_lock_setCurrentUserRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "User record ID has changed to: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[DNDSSyncEngineMetadataStoring setUserRecordID:](self->_metadataStore, "setUserRecordID:", v4);

}

- (BOOL)_lock_isSyncEnabled
{
  uint64_t v3;
  unint64_t v4;
  _BOOL8 v5;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = *(unsigned int *)&self->_state.syncEnabled;
  v4 = v3 | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32);
  if ((v4 & 0x10000000000) != 0)
    return 1;
  v5 = HIDWORD(v4) & 1;
  return (~(_DWORD)v3 & 0x1010101) == 0 && v5;
}

- (BOOL)_lock_isSyncAvailable
{
  uint64_t v3;
  unint64_t v4;
  _BOOL8 v5;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = *(unsigned int *)&self->_state.syncEnabled;
  v4 = v3 | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32);
  if ((v4 & 0x10000000000) != 0)
    return 1;
  v5 = HIDWORD(v4) & 1;
  return (~(_DWORD)v3 & 0x1010100) == 0 && v5;
}

- (BOOL)_lock_isSyncPreferenceEnabled
{
  os_unfair_lock_assert_owner(&self->_lock);
  return ((*(unsigned int *)&self->_state.syncEnabled | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32)) & 0x10000000001) != 0;
}

- (id)_lock_dataSourceForZoneID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMapTable *sourcesByZoneName;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  sourcesByZoneName = self->_sourcesByZoneName;
  objc_msgSend(v5, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](sourcesByZoneName, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lock_dataSourceForRecord:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[DNDSSyncEngine _zoneIDForRecord:](self, "_zoneIDForRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSSyncEngine _lock_dataSourceForZoneID:](self, "_lock_dataSourceForZoneID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_purgeDataFromDataSources
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  _BOOL4 syncEnabled;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Purging data from data sources", buf, 2u);
  }
  os_unfair_lock_lock(p_lock);
  syncEnabled = self->_state.syncEnabled;
  -[NSMapTable dictionaryRepresentation](self->_sourcesByZoneName, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (syncEnabled)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
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
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_sourcesByZoneName, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v21 = v12;
            _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Purging data from zone %{public}@", buf, 0xCu);
          }
          objc_msgSend(v13, "purgeRecordsForSyncEngine:", self);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v9);
    }

    v6 = v15;
  }

}

- (void)_initialSyncForDataSources
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Performing initial sync for data sources", buf, 2u);
  }
  os_unfair_lock_lock(p_lock);
  if (-[DNDSSyncEngine _lock_isSyncEnabled](self, "_lock_isSyncEnabled"))
  {
    -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }
  -[NSMapTable dictionaryRepresentation](self->_sourcesByZoneName, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v13, (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngine _initialSyncForDataSource:withZoneName:](self, "_initialSyncForDataSource:withZoneName:", v14, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

  }
}

- (void)_initialSyncForDataSource:(id)a3 withZoneName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (-[DNDSSyncEngine _lock_isSyncEnabled](self, "_lock_isSyncEnabled"))
  {
    -[DNDSSyncEngine _lock_syncEngine](self, "_lock_syncEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    if (v8)
    {
      objc_msgSend(v6, "recordIDsForSyncEngine:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        v10 = DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138543362;
          v12 = v7;
          _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Performing initial sync for zone %{public}@", (uint8_t *)&v11, 0xCu);
        }
        -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v9, 0);
      }

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_migrateOldStoresWithSyncEnabledState:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  NSObject *v41;
  void *v42;
  char v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  char v52;
  id v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  id v70;
  _QWORD v71[6];

  v71[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E98];
  BSCurrentUserDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v5;
  v71[1] = CFSTR("Library");
  v71[2] = CFSTR("DoNotDisturb");
  v71[3] = CFSTR("DB");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPathComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("LocalModeConfigurations.json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("LocalModeConfigurationsSecure.json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("LocalGlobalConfiguration.json"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("SyncedGlobalConfiguration.json"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if (v13)
  {
    v14 = DNDSLogGeneral;
    v15 = os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Erasing configurations from old local stores", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "dnds_globalConfigurationBackingStoreFileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      v18 = objc_msgSend(v16, "moveItemAtURL:toURL:error:", v10, v17, &v62);
      v19 = v62;

      if ((v18 & 1) == 0)
      {
        v20 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v19;
          _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Could not delete old synced global store: %@", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v19;
      v22 = objc_msgSend(v21, "removeItemAtURL:error:", v8, &v61);
      v23 = v61;

      if ((v22 & 1) == 0)
      {
        v24 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v23;
          _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "Could not delete old mode store: %@", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v23;
      v26 = objc_msgSend(v25, "removeItemAtURL:error:", v9, &v60);
      v27 = v60;

      if ((v26 & 1) == 0)
      {
        v28 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v27;
          _os_log_impl(&dword_1CB895000, v28, OS_LOG_TYPE_DEFAULT, "Could not delete old secure mode store: %@", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v27;
      v30 = objc_msgSend(v29, "removeItemAtURL:error:", v58, &v59);
      v31 = v59;

      if ((v30 & 1) == 0)
      {
        v32 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v31;
          _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Could not delete old global store: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Migrating configurations from old local stores", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v9);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "dnds_modeConfigurationsBackingStoreFileURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0;
      v35 = objc_msgSend(v33, "removeItemAtURL:error:", v34, &v68);
      v36 = v68;

      if ((v35 & 1) == 0 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:].cold.4();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "dnds_modeConfigurationsSecureBackingStoreFileURL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v36;
      v39 = objc_msgSend(v37, "removeItemAtURL:error:", v38, &v67);
      v40 = v67;

      if ((v39 & 1) == 0)
      {
        v41 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v40;
          _os_log_impl(&dword_1CB895000, v41, OS_LOG_TYPE_DEFAULT, "Could not delete secure mode store: %@", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v40;
      v43 = objc_msgSend(v42, "removeItemAtURL:error:", v10, &v66);
      v44 = v66;

      if ((v43 & 1) == 0)
      {
        v45 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v44;
          _os_log_impl(&dword_1CB895000, v45, OS_LOG_TYPE_DEFAULT, "Could not delete old synced global store: %@", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "dnds_modeConfigurationsBackingStoreFileURL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v44;
      v48 = objc_msgSend(v46, "moveItemAtURL:toURL:error:", v8, v47, &v65);
      v49 = v65;

      if ((v48 & 1) == 0 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:].cold.3();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "dnds_modeConfigurationsSecureBackingStoreFileURL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v49;
      v52 = objc_msgSend(v50, "moveItemAtURL:toURL:error:", v57, v51, &v64);
      v53 = v64;

      if ((v52 & 1) == 0 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:].cold.2();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "dnds_globalConfigurationBackingStoreFileURL");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v53;
      v56 = objc_msgSend(v54, "moveItemAtURL:toURL:error:", v58, v55, &v63);
      v31 = v63;

      if ((v56 & 1) == 0 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:].cold.1();
      v9 = v57;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_lastChanceStore, 0);
  objc_storeStrong((id *)&self->_metadataStore, 0);
  objc_storeStrong((id *)&self->_sourcesByZoneName, 0);
  objc_storeStrong((id *)&self->_accountUpdateSource, 0);
  objc_storeStrong((id *)&self->_syncEngineQueue, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __90__DNDSSyncEngine_initWithMetadataStore_lastChanceDataStore_syncEngine_keybag_syncEnabled___block_invoke_cold_1(void *a1, uint64_t a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "numberWithUnsignedLong:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v2, v6, "Unexpected value in sync dispatch source: %@", v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)addRecordIDsToSave:recordIDsToDelete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_2(&dword_1CB895000, v0, v1, "RecordID change was made before sync engine availability.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)addRecordZonesToSave:recordZoneIDsToDelete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_2(&dword_1CB895000, v0, v1, "RecordZoneID change was made before sync engine availability.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error sending changes: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleDeletedRecordID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not find a source for removing record with ID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleDeletedRecordID:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Removing record with ID %{public}@ from source %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)syncEngine:(uint64_t)a1 failedToDeleteRecordWithID:(void *)a2 error:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a2;
  objc_msgSend(a3, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v5, v6, "Failed to find data source with zoneID %{public}@ for record %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)syncEngine:(void *)a1 failedToDeleteRecordWithID:error:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "recordName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v3, v4, "Failed to delete record %{public}@: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)syncEngine:failedToSaveRecord:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unhandled error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)syncEngine:failedToSaveRecord:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to find data source with zoneID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)syncEngine:(void *)a1 failedToSaveRecord:(void *)a2 error:.cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v3, v5, "Both server and client record IDs are nil for record ID %{public}@", v6);

}

- (void)syncEngine:failedToSaveRecord:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Record ID is nil; ignoring unknown item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)syncEngine:failedToSaveRecord:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Zone ID is nil; ignoring record", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)syncEngine:failedToSaveRecord:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "ZoneID is nil; ignoring deleted zone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)syncEngine:(void *)a1 failedToSaveRecord:error:.cold.7(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v4, v5, "Unexpected error encountered when saving record %{public}@: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)syncEngine:(void *)a1 failedToSaveRecord:error:.cold.8(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v4, v5, "Failed to save record %{public}@: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)syncEngine:recordToSaveForRecordID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to create record to save: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not fetch account status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not fetch account state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not fetch account info ID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_63_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not fetch user record ID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_migrateOldStoresWithSyncEnabledState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not replace global store with old store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_migrateOldStoresWithSyncEnabledState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not replace secure mode store with old store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_migrateOldStoresWithSyncEnabledState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not replace mode store with old store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_migrateOldStoresWithSyncEnabledState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not delete mode store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
