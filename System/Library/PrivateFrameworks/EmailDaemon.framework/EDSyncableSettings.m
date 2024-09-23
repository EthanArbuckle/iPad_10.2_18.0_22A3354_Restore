@implementation EDSyncableSettings

void __46__EDSyncableSettings__setChangeAction_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = _Block_copy(v3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

}

- (void)setProxyChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

uint64_t __77__EDSyncableSettings__mergeTrackingSettings_cloudKey_isLocalChange_newValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "synchronize");
}

- (EDSyncableSettings)init
{
  void *v3;
  void *v4;
  EDSyncableSettings *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A38]), "_initWithStoreIdentifier:usingEndToEndEncryption:", CFSTR("com.apple.mail"), 1);
  v5 = -[EDSyncableSettings initWithDefaults:store:](self, "initWithDefaults:store:", v3, v4);

  return v5;
}

- (EDSyncableSettings)initWithDefaults:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  EDSyncableSettings *v9;
  id v10;
  void *v11;
  uint64_t v12;
  EFLocked *changeActionsByKey;
  uint64_t v14;
  EFAssertableScheduler *scheduler;
  EFCancelationToken *v16;
  EFCancelationToken *cancelable;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)EDSyncableSettings;
  v9 = -[EDSyncableSettings init](&v19, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithObject:", v11);
    changeActionsByKey = v9->_changeActionsByKey;
    v9->_changeActionsByKey = (EFLocked *)v12;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("EDSyncableSettings"), 17);
    v14 = objc_claimAutoreleasedReturnValue();
    scheduler = v9->_scheduler;
    v9->_scheduler = (EFAssertableScheduler *)v14;

    objc_storeStrong((id *)&v9->_defaults, a3);
    objc_storeStrong((id *)&v9->_store, a4);
    v16 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    cancelable = v9->_cancelable;
    v9->_cancelable = v16;

  }
  return v9;
}

void ___ef_log_EDSyncableSettings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDSyncableSettings");
  v1 = (void *)_ef_log_EDSyncableSettings_log;
  _ef_log_EDSyncableSettings_log = (uint64_t)v0;

}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  void *v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "threadDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = (id *)(a1 + 32);
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _ef_log_EDSyncableSettings();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_3_cold_1((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);

    }
    else
    {
      v18 = WeakRetained[2];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_43;
      v19[3] = &unk_1E949E918;
      objc_copyWeak(&v22, v4);
      v20 = *v8;
      v21 = v3;
      objc_msgSend(v18, "performSyncBlock:", v19);

      objc_destroyWeak(&v22);
    }
  }

}

void __42__EDSyncableSettings__changeActionForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)beginSyncing
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "failed to synchronize store", a5, a6, a7, a8, 0);
}

- (id)_registerDefaultsObservers
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  id v10[2];
  id location;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EE90]), "initWithLabel:", CFSTR("EDSyncableSettings-Defaults"));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a1);
  -[EDSyncableSettings syncableSettingsMap](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__EDSyncableSettings__registerDefaultsObservers__block_invoke;
  v8[3] = &unk_1E94A1EC8;
  objc_copyWeak(v10, &location);
  v10[1] = sel__registerDefaultsObservers;
  v8[4] = a1;
  v4 = v2;
  v9 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

  v5 = v9;
  v6 = v4;

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v6;
}

- (id)syncableSettingsMap
{
  id v1;
  _QWORD v3[4];
  id v4;
  id location;

  if (!val)
    return 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__EDSyncableSettings_syncableSettingsMap__block_invoke;
  v3[3] = &unk_1E949C258;
  objc_copyWeak(&v4, &location);
  if (syncableSettingsMap_onceToken != -1)
    dispatch_once(&syncableSettingsMap_onceToken, v3);
  v1 = (id)syncableSettingsMap_syncableSettingsMap;
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (void)_mergeLocalChangeForKey:(void *)a3 value:
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "assertIsExecuting:", 1);
    -[EDSyncableSettings _changeActionForKey:]((_QWORD *)a1, v8);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, 1);

  }
}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D1ED90] + 16))())
    {

      v10 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "threadDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(a1 + 32));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

  }
}

uint64_t __48__EDSyncableSettings__registerDefaultsObservers__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_mergeTrackingSettings:(void *)a3 cloudKey:(int)a4 isLocalChange:(void *)a5 newValue:
{
  id v9;
  id v10;
  id v11;
  char v12;
  NSObject *v13;
  __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (!a1)
    goto LABEL_20;
  v12 = objc_msgSend(*(id *)(a1 + 24), "integerForKey:", v9);
  if (v11 || a4)
  {
    v14 = CFSTR("cloud to device");
    if (a4)
      v14 = CFSTR("device to cloud");
    v13 = v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = objc_msgSend(v11, "integerValue");
      _ef_log_EDSyncableSettings();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((v15 & 1) != 0)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v13;
          _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "syncing tracking protection setting from %{public}@", buf, 0xCu);
        }

        if (a4)
        {
          v21 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v22, v10);

          v23 = *(void **)(a1 + 16);
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __77__EDSyncableSettings__mergeTrackingSettings_cloudKey_isLocalChange_newValue___block_invoke;
          v24[3] = &unk_1E949AEB8;
          v24[4] = a1;
          objc_msgSend(v23, "performBlock:", v24);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 24), "setInteger:forKey:", v15, v9);
        }
        goto LABEL_17;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[EDSyncableSettings _mergeTrackingSettings:cloudKey:isLocalChange:newValue:].cold.1();

    }
    else
    {
      _ef_log_EDSyncableSettings();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[EDSyncableSettings _mergeTrackingSettings:cloudKey:isLocalChange:newValue:].cold.2();

    }
  }
  else
  {
    _ef_log_EDSyncableSettings();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "skipping syncing tracking protection setting from cloud to device with no new value", buf, 2u);
    }
  }
  LOBYTE(v15) = v12;
LABEL_17:

  objc_msgSend((id)a1, "proxyChangeHandler");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    (*(void (**)(uint64_t, BOOL))(v19 + 16))(v19, (v15 & 4) == 0);

LABEL_20:
}

- (id)proxyChangeHandler
{
  return self->_proxyChangeHandler;
}

- (_QWORD)_changeActionForKey:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *(*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__35;
    v14 = __Block_byref_object_dispose__35;
    v15 = 0;
    v5 = (void *)a1[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__EDSyncableSettings__changeActionForKey___block_invoke;
    v7[3] = &unk_1E94A1EF0;
    v9 = &v10;
    v8 = v3;
    objc_msgSend(v5, "performWhileLocked:", v7);
    a1 = _Block_copy((const void *)v11[5]);

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

void __48__EDSyncableSettings__registerDefaultsObservers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cloudKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mergeType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = MEMORY[0x1E0C809B0];
  if (v9 == 1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__EDSyncableSettings__registerDefaultsObservers__block_invoke_2;
    aBlock[3] = &unk_1E94A1E78;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    v11 = _Block_copy(aBlock);
    objc_destroyWeak(&v21);
    if (!v11)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("EDSyncableSettings.m"), 118, CFSTR("No merge block found for default %@"), v5);

      v11 = 0;
    }
  }
  else
  {
    if (v9 != 2)
      goto LABEL_6;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("customMergeBlock"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_6;
  }
  v15 = a1 + 32;
  v13 = *(void **)(a1 + 32);
  v14 = *(void **)(v15 + 8);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __48__EDSyncableSettings__registerDefaultsObservers__block_invoke_3;
  v18[3] = &unk_1E94A1EA0;
  v16 = v11;
  v19 = v16;
  objc_msgSend(v13, "observeChangesForKey:cloudKey:conflictResolver:", v5, v7, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addCancelable:", v17);

}

- (id)observeChangesForKey:(id)a3 cloudKey:(id)a4 conflictResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSUserDefaults *defaults;
  id v20;
  void *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id location;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke;
  aBlock[3] = &unk_1E94A1F40;
  v12 = v8;
  v33 = v12;
  v23 = v10;
  v35 = v23;
  v13 = v9;
  v34 = v13;
  v14 = _Block_copy(aBlock);
  -[EDSyncableSettings _setChangeAction:forKey:]((uint64_t)self, v14, v12);
  -[EDSyncableSettings _setChangeAction:forKey:]((uint64_t)self, v14, v13);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v15 = (void *)MEMORY[0x1E0D1EE90];
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_2;
  v27[3] = &unk_1E949E918;
  objc_copyWeak(&v30, &location);
  v16 = v12;
  v28 = v16;
  v17 = v13;
  v29 = v17;
  objc_msgSend(v15, "tokenWithLabel:cancelationBlock:", v16, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  defaults = self->_defaults;
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_3;
  v24[3] = &unk_1E94A1F68;
  objc_copyWeak(&v26, &location);
  v20 = v16;
  v25 = v20;
  -[NSUserDefaults ef_observeKeyPath:options:usingBlock:](defaults, "ef_observeKeyPath:options:usingBlock:", v20, 5, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addCancelable:", v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v18;
}

- (void)_setChangeAction:(void *)a3 forKey:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__EDSyncableSettings__setChangeAction_forKey___block_invoke;
    v9[3] = &unk_1E94A1F18;
    v10 = v5;
    v11 = v8;
    objc_msgSend(v7, "performWhileLocked:", v9);

  }
}

void __41__EDSyncableSettings_syncableSettingsMap__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *, int, void *);
  void *v8;
  id v9;
  _QWORD v10[3];
  _QWORD v11[3];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0D1E048];
  v10[0] = CFSTR("cloudKey");
  v10[1] = CFSTR("mergeType");
  v11[0] = CFSTR("tp");
  v11[1] = &unk_1E94E4C10;
  v10[2] = CFSTR("customMergeBlock");
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __41__EDSyncableSettings_syncableSettingsMap__block_invoke_37;
  v8 = &unk_1E94A1E78;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v1 = _Block_copy(&v5);
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3, v5, v6, v7, v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)syncableSettingsMap_syncableSettingsMap;
  syncableSettingsMap_syncableSettingsMap = v3;

  objc_destroyWeak(&v9);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[EFCancelationToken cancel](self->_cancelable, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)EDSyncableSettings;
  -[EDSyncableSettings dealloc](&v4, sel_dealloc);
}

void __48__EDSyncableSettings__registerDefaultsObservers__block_invoke_2(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a3;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  -[EDSyncableSettings _mergeIntegerSetting:cloudKey:isLocalChange:newValue:]((uint64_t)WeakRetained, v11, v10, a4, v9);

}

- (void)_mergeIntegerSetting:(void *)a3 cloudKey:(int)a4 isLocalChange:(void *)a5 newValue:
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    v12 = CFSTR("cloud to device");
    if (a4)
      v12 = CFSTR("device to cloud");
    v13 = v12;
    if (v11 || a4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v15 = objc_msgSend(v11, "integerValue");
        _ef_log_EDSyncableSettings();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v25 = v9;
          v26 = 2114;
          v27 = v13;
          _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "syncing setting %{public}@ from %{public}@", buf, 0x16u);
        }

        if (a4)
        {
          v17 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v18, v10);

          v19 = *(void **)(a1 + 16);
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __75__EDSyncableSettings__mergeIntegerSetting_cloudKey_isLocalChange_newValue___block_invoke;
          v23[3] = &unk_1E949AEB8;
          v23[4] = a1;
          objc_msgSend(v19, "performBlock:", v23);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 24), "setInteger:forKey:", v15, v9);
        }
      }
      else if (v11)
      {
        _ef_log_EDSyncableSettings();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[EDSyncableSettings _mergeIntegerSetting:cloudKey:isLocalChange:newValue:].cold.1();

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v10);
        v21 = *(void **)(a1 + 16);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __75__EDSyncableSettings__mergeIntegerSetting_cloudKey_isLocalChange_newValue___block_invoke_2;
        v22[3] = &unk_1E949AEB8;
        v22[4] = a1;
        objc_msgSend(v21, "performBlock:", v22);
      }
    }
    else
    {
      _ef_log_EDSyncableSettings();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v9;
        _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ was remove remotely", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v9);
    }

  }
}

void __41__EDSyncableSettings_syncableSettingsMap__block_invoke_37(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a3;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  -[EDSyncableSettings _mergeTrackingSettings:cloudKey:isLocalChange:newValue:]((uint64_t)WeakRetained, v11, v10, a4, v9);

}

- (void)_storeChangedExternally:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  EFAssertableScheduler *scheduler;
  NSObject *v19;
  _QWORD v20[5];
  NSObject *v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3358]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 2)
  {
    _ef_log_EDSyncableSettings();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[EDSyncableSettings _storeChangedExternally:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3360]);
    v8 = objc_claimAutoreleasedReturnValue();
    _ef_log_EDSyncableSettings();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v23 = v7;
      v24 = 2114;
      v25 = v8;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "received external KVS change event: %ld, changed keys=%{public}@", buf, 0x16u);
    }

    if (v7 > 3 || v7 == 2)
    {
      _ef_log_EDSyncableSettings();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[EDSyncableSettings _storeChangedExternally:].cold.2();

    }
    else
    {
      scheduler = self->_scheduler;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __46__EDSyncableSettings__storeChangedExternally___block_invoke;
      v20[3] = &unk_1E949B6D0;
      v20[4] = self;
      v8 = v8;
      v21 = v8;
      -[EFAssertableScheduler performSyncBlock:](scheduler, "performSyncBlock:", v20);

    }
  }

}

void __46__EDSyncableSettings__storeChangedExternally___block_invoke(uint64_t a1)
{
  -[EDSyncableSettings _mergeExternalChangedKeys:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_mergeExternalChangedKeys:(uint64_t)a1
{
  id v3;
  void (**v4)(void *, uint64_t, void *, char *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _QWORD aBlock[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "assertIsExecuting:", 1);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__EDSyncableSettings__mergeExternalChangedKeys___block_invoke;
    aBlock[3] = &unk_1E949C150;
    aBlock[4] = a1;
    v4 = (void (**)(void *, uint64_t, void *, char *))_Block_copy(aBlock);
    if (objc_msgSend(v3, "count"))
    {
      v16 = 0;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v13;
LABEL_5:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v9, v10, &v16);

          if (v16)
            break;
          if (v6 == ++v8)
          {
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
            if (v6)
              goto LABEL_5;
            break;
          }
        }
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v4);

    }
  }

}

void __48__EDSyncableSettings__mergeExternalChangedKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EDSyncableSettings _changeActionForKey:](*(_QWORD **)(a1 + 32), a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v7, 0);

}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_2(void **a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  -[EDSyncableSettings _setChangeAction:forKey:]((uint64_t)WeakRetained, 0, a1[4]);
  -[EDSyncableSettings _setChangeAction:forKey:]((uint64_t)WeakRetained, 0, a1[5]);

}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_43(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSyncableSettings _mergeLocalChangeForKey:value:]((uint64_t)WeakRetained, v2, v3);

}

uint64_t __75__EDSyncableSettings__mergeIntegerSetting_cloudKey_isLocalChange_newValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "synchronize");
}

uint64_t __75__EDSyncableSettings__mergeIntegerSetting_cloudKey_isLocalChange_newValue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "synchronize");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proxyChangeHandler, 0);
  objc_storeStrong((id *)&self->_changeActionsByKey, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
}

- (void)_mergeIntegerSetting:cloudKey:isLocalChange:newValue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1D2F2C000, v1, OS_LOG_TYPE_ERROR, "Unexpected object set when syncing %{public}@ from %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_mergeTrackingSettings:cloudKey:isLocalChange:newValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, v0, v1, "skipping syncing tracking protection setting from %{public}@ (not set by user)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_mergeTrackingSettings:cloudKey:isLocalChange:newValue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, v0, v1, "skipping syncing tracking protection setting from %{public}@ (unknown value type)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_storeChangedExternally:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "kvstorage reported quota exceeded", a5, a6, a7, a8, 0);
}

- (void)_storeChangedExternally:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, v0, v1, "unhandled change reason: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__EDSyncableSettings_observeChangesForKey_cloudKey_conflictResolver___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "stopping re-entrancy for changes to local key %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
