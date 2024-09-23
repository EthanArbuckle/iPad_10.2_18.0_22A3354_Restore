@implementation HDUserCharacteristicsManager

- (id)userCharacteristicForType:(id)a3 error:(id *)a4
{
  return -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:]((uint64_t)self, a3, 0, (uint64_t)a4);
}

- (id)_userCharacteristicForType:(uint64_t)a3 entity:(uint64_t)a4 error:
{
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;

  if (a1)
  {
    v6 = (id *)(a1 + 8);
    v7 = a2;
    WeakRetained = objc_loadWeakRetained(v6);
    +[HDProtectedKeyValueEntity userCharacteristicForType:profile:entity:error:](HDProtectedKeyValueEntity, "userCharacteristicForType:profile:entity:error:", v7, WeakRetained, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4 && self->_needsUpdateAfterUnlock)
    -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfile]((uint64_t)self);
}

- (void)addProfileObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDUserCharacteristicsProfileObserver registerObserver:](self->_observers, "registerObserver:", v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HDUserCharacteristicsManager_addProfileObserver___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __51__HDUserCharacteristicsManager_addProfileObserver___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = v2;
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v4 + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__HDUserCharacteristicsManager_addProfileObserver___block_invoke_2;
    v7[3] = &unk_1E6CEEC80;
    v7[4] = v4;
    v8 = v2;
    objc_msgSend(v6, "notifyObserver:handler:", v5, v7);

  }
}

uint64_t __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void (**v8)(void *, _QWORD, void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id obj;
  _QWORD aBlock[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v5 = a2;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__37;
  v29 = __Block_byref_object_dispose__37;
  v30 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_2;
  aBlock[3] = &unk_1E6CEEB08;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v23 = &v31;
  v24 = &v25;
  aBlock[4] = v6;
  v22 = v7;
  v8 = (void (**)(void *, _QWORD, void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, *MEMORY[0x1E0CA5598], v9, &__block_literal_global_44);

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, *MEMORY[0x1E0CA5588], v10, &__block_literal_global_248_0);

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB7118]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, *MEMORY[0x1E0CA55B0], v11, &__block_literal_global_251);

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB7128]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, *MEMORY[0x1E0CA55A8], v12, &__block_literal_global_253_0);

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49E0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, *MEMORY[0x1E0CA55A0], v13, &__block_literal_global_254);

  v14 = *(void **)(a1 + 32);
  v15 = (id *)(v26 + 5);
  obj = (id)v26[5];
  -[HDUserCharacteristicsManager _getCardioFitnessMedicationsStatusWithError:](v14, &obj);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v15, obj);
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v16, *MEMORY[0x1E0CA5590]);
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    *((_BYTE *)v32 + 24) = 0;
    if (!a3)
      goto LABEL_7;
  }
  v17 = (void *)v26[5];
  if (v17)
    *a3 = objc_retainAutorelease(v17);
LABEL_7:
  v18 = *((unsigned __int8 *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

void __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id obj;

  v7 = a2;
  v8 = a4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v10 + 40);
    objc_msgSend(v9, "userCharacteristicForType:error:", a3, &obj);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v10 + 40), obj);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_10:

      goto LABEL_11;
    }
    if (v11)
    {
      if (v8)
      {
        v8[2](v8, v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_7;
      }
      else
      {
        v12 = v11;
      }
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v12, v7);

      goto LABEL_10;
    }
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v7);
    goto LABEL_10;
  }
LABEL_11:

}

id __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "integerValue") == 3)
  {

    v2 = &unk_1E6DFAC10;
  }
  return v2;
}

uint64_t __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(a2, "integerValue") == 2)
    v3 = 6;
  else
    v3 = 0;
  return objc_msgSend(v2, "numberWithInteger:", v3);
}

uint64_t __73__HDUserCharacteristicsManager__queue_alertObserversDidUpdateUserProfile__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userCharacteristicsManager:didUpdateUserProfile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (HDUserCharacteristicsManager)initWithProfile:(id)a3
{
  id v5;
  HDUserCharacteristicsManager *v6;
  HDUserCharacteristicsManager *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  int AppBooleanValue;
  uint64_t v11;
  NSNumber *hasWatchOnAccount;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HDUserCharacteristicsProfileObserver *observers;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v24;
  Boolean keyExistsAndHasValidFormat;
  objc_super v26;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDUserCharacteristicsManager.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

  }
  v26.receiver = self;
  v26.super_class = (Class)HDUserCharacteristicsManager;
  v6 = -[HDUserCharacteristicsManager init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v7->_needsUpdateAfterUnlock = 1;
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x1E0CB5100], (CFStringRef)*MEMORY[0x1E0CB7758], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AppBooleanValue != 0);
      v11 = objc_claimAutoreleasedReturnValue();
      hasWatchOnAccount = v7->_hasWatchOnAccount;
      v7->_hasWatchOnAccount = (NSNumber *)v11;
    }
    else
    {
      hasWatchOnAccount = v7->_hasWatchOnAccount;
      v7->_hasWatchOnAccount = 0;
    }

    v13 = objc_alloc(MEMORY[0x1E0CB6988]);
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "initWithName:loggingCategory:", v15, v16);
    observers = v7->_observers;
    v7->_observers = (HDUserCharacteristicsProfileObserver *)v17;

    objc_msgSend(v5, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "behavior");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_shouldUpdateQuantityCharacteristics = objc_msgSend(v20, "supportsComputedUserCharacteristicCaching");

    WeakRetained = objc_loadWeakRetained((id *)&v7->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v7, v7->_queue);

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeProtectedDataObserver:", self);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  QuantityCharacteristicTypes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        v12 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v12, "dataManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_relatedQuantityType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObserver:forDataType:", self, v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  v15 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v15, "dataManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49B8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_relatedCategoryType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObserver:forDataType:", self, v18);

  if (self)
  {
    if (notify_is_valid_token(self->_significantTimeChangeNotificationToken))
      notify_cancel(self->_significantTimeChangeNotificationToken);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObserver:name:object:", self, *MEMORY[0x1E0C99690], 0);

  }
  v20 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v20, "daemon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "behavior");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isAppleWatch");

  if ((v23 & 1) == 0)
  {
    v24 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v24, "nanoSyncManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObserver:", self);

    v26 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v26, "cloudSyncManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeObserver:", self);

  }
  v28.receiver = self;
  v28.super_class = (Class)HDUserCharacteristicsManager;
  -[HDUserCharacteristicsManager dealloc](&v28, sel_dealloc);
}

- (id)modificationDateForCharacteristicWithType:(id)a3 error:(id *)a4
{
  HDProfile **p_profile;
  id v6;
  id WeakRetained;
  void *v8;

  p_profile = &self->_profile;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  +[HDProtectedKeyValueEntity modificationDateForCharacteristicWithType:profile:error:](HDProtectedKeyValueEntity, "modificationDateForCharacteristicWithType:profile:error:", v6, WeakRetained, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)setUserCharacteristic:(id)a3 forType:(id)a4 error:(id *)a5
{
  return -[HDUserCharacteristicsManager _setUserCharacteristic:forType:shouldInsertSample:updateProfileAndSync:error:](self, "_setUserCharacteristic:forType:shouldInsertSample:updateProfileAndSync:error:", a3, a4, 1, 1, a5);
}

- (BOOL)_setUserCharacteristic:(id)a3 forType:(id)a4 shouldInsertSample:(BOOL)a5 updateProfileAndSync:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id WeakRetained;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  HDUserCharacteristicsManager *v29;
  id v30;
  BOOL v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  HDUserCharacteristicsManager *v35;
  BOOL v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v13;
    _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "Setting user characteristic for type %@", buf, 0xCu);
  }
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke;
  aBlock[3] = &unk_1E6CEEA68;
  v33 = v12;
  v16 = v13;
  v34 = v16;
  v35 = self;
  v36 = a5;
  v17 = v12;
  v18 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_2;
  v27[3] = &unk_1E6CEEA90;
  v31 = a6;
  v28 = v16;
  v29 = self;
  v30 = v18;
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_4;
  v25[3] = &unk_1E6CEEAB8;
  v26 = v30;
  v21 = v30;
  v22 = v16;
  v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDProtectedKeyValueEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v20, a7, v27, v25);

  return v23;
}

uint64_t __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  v7 = +[HDProtectedKeyValueEntity setUserCharacteristic:forType:profile:error:](HDProtectedKeyValueEntity, "setUserCharacteristic:forType:profile:error:", v4, v5, WeakRetained, a2);

  if (!v7)
    return 0;
  if (!*(_BYTE *)(a1 + 56))
    return 1;
  objc_msgSend(*(id *)(a1 + 40), "_relatedSampleForInsertionWithCharacteristicValue:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(v9, "dataProvenanceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultLocalDataProvenance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
      objc_msgSend(v12, "dataManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "insertDataObjects:withProvenance:creationDate:error:", v14, v11, a2, 2.22507386e-308);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a2, 100, CFSTR("Failed to get local device data provenance"));
      v15 = 0;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

uint64_t __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  if (*(_BYTE *)(a1 + 56))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_3;
    v10[3] = &unk_1E6CE8080;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v12 = v8;
    objc_msgSend(a2, "onCommit:orRollback:", v10, 0);

  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a3, a3, a4);
}

void __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  int v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "code");
  v4 = (unint64_t)(v2 - 64) <= 0x27 && ((1 << (v2 - 64)) & 0x8000700003) != 0 || v2 == 218;
  -[HDUserCharacteristicsManager _userCharacteristicsDidChangeShouldUpdateUserProfile:shouldSync:](*(_QWORD *)(a1 + 40), v4, 1);
}

- (void)_userCharacteristicsDidChangeShouldUpdateUserProfile:(int)a3 shouldSync:
{
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  if (a1)
  {
    if (a2)
    {
      v5 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __96__HDUserCharacteristicsManager__userCharacteristicsDidChangeShouldUpdateUserProfile_shouldSync___block_invoke;
      block[3] = &unk_1E6CE80E8;
      block[4] = a1;
      dispatch_async(v5, block);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a3)
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("HDUserCharacteristicsShouldSyncNotification"), a1);
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("HDUserCharacteristicsDidChangeNotification"), a1);
    notify_post((const char *)*MEMORY[0x1E0CB77F0]);

  }
}

uint64_t __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)restingCaloriesFromTotalCalories:(double)a3 timeInterval:(double)a4 authorizedToRead:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;
  double v10;
  BOOL v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v22;
  id v23;

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB7118], a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    -[HDUserCharacteristicsManager userCharacteristicForType:error:](self, "userCharacteristicForType:error:", v7, &v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v23;

    v10 = 0.0;
    if (v9)
      v11 = 1;
    else
      v11 = v8 == 0;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("kg"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValueForUnit:", v12);
      v10 = v13;

    }
    v22 = v9;
    -[HDUserCharacteristicsManager _getCardioFitnessMedicationsStatusWithError:](self, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;

    v16 = 0;
    if (v14 && !v15)
      v16 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v16 = 0;
    v10 = 0.0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5608]), "initWithAge:gender:height:weight:condition:betaBlockerUse:", 0, 0, v16, 0.0, 0.0, v10);
  objc_msgSend(MEMORY[0x1E0CA5678], "computeRestingCaloriesAtRate:user:duration:", 1, v17, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19 / 1000.0;

  return v20;
}

- (id)_getCardioFitnessMedicationsStatusWithError:(void *)a1
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v10;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB7120]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(a1, "userCharacteristicForType:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
    v7 = 1;
  else
    v7 = v6 == 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "integerValue") != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a2)
  {
    v8 = 0;
    *a2 = objc_retainAutorelease(v6);
  }
  else
  {
    _HKLogDroppedError();
    v8 = 0;
  }

  return v8;
}

uint64_t __96__HDUserCharacteristicsManager__userCharacteristicsDidChangeShouldUpdateUserProfile_shouldSync___block_invoke(uint64_t a1)
{
  return -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfile](*(_QWORD *)(a1 + 32));
}

- (void)_queue_updateCharacteristicsAndUserProfile
{
  id v2;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfileWithDate:](a1, v2);

  }
}

- (void)_queue_updateCharacteristicsAndUserProfileWithDate:(uint64_t)a1
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  HDMutableDatabaseTransactionContext *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  CFIndex AppIntegerValue;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  HDMutableDatabaseTransactionContext *v40;
  id v41;
  __int128 *v42;
  id v43;
  _BOOL4 v44;
  id v45;
  void *v46;
  _BOOL4 v47;
  id v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _BOOL4 v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  NSObject *v62;
  id v63;
  void *v64;
  void *v65;
  int v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  __CFString *v81;
  void *v82;
  void *v83;
  os_log_t *v84;
  NSObject *v85;
  char v86;
  NSObject *v87;
  id v88;
  void *v89;
  id v90;
  const __CFString *v91;
  id v92;
  HDMutableDatabaseTransactionContext *v93;
  id v94;
  void *v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id *v101;
  id v102;
  id v103;
  id *v104;
  uint64_t v105;
  char v106;
  id v107;
  uint8_t v108[4];
  void *v109;
  __int128 keyExistsAndHasValidFormat;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  id v114;
  __int128 buf;
  void *v116;
  void *v117;
  id v118;
  id v119;
  __int128 *v120;
  id v121;
  __int128 *p_keyExistsAndHasValidFormat;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a2;
    v96 = a1;
    v4 = (id *)(a1 + 8);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    -[HDMutableDatabaseTransactionContext setCacheScope:](v7, "setCacheScope:", 1);
    v8 = -[HDDatabaseTransactionContext copyForWritingProtectedData](v7, "copyForWritingProtectedData");

    v9 = (void *)MEMORY[0x1E0C99D48];
    v10 = v3;
    objc_msgSend(v9, "hk_gregorianCalendarWithLocalTimeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startOfDayForDate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 1, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startOfDayForDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _HKActivityCacheDateComponentsFromDate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)_HKCacheIndexFromDateComponents());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v97 = 0;
    *((_QWORD *)&v97 + 1) = &v97;
    *(_QWORD *)&v98 = 0x2020000000;
    BYTE8(v98) = 0;
    v103 = 0;
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v116 = __84__HDUserCharacteristicsManager__queue_updateActivityMoveModeCharacteristicWithDate___block_invoke;
    v117 = &unk_1E6CEB640;
    v118 = (id)a1;
    v17 = v16;
    v119 = v17;
    v120 = &v97;
    LODWORD(v14) = objc_msgSend(v6, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, &v103, &buf, 0);
    v18 = v103;
    v19 = v18;
    if ((_DWORD)v14)
    {
      if (*(_BYTE *)(*((_QWORD *)&v97 + 1) + 24))
        -[HDUserCharacteristicsManager _userCharacteristicsDidChangeShouldUpdateUserProfile:shouldSync:](a1, 0, 1);
      *(_BYTE *)(a1 + 56) = 0;
    }
    else if (objc_msgSend(v18, "hk_isDatabaseAccessibilityError"))
    {
      *(_BYTE *)(a1 + 56) = 1;
    }
    else
    {
      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(keyExistsAndHasValidFormat) = 138543362;
        *(_QWORD *)((char *)&keyExistsAndHasValidFormat + 4) = v19;
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Error updating user activity move mode characteristic: %{public}@", (uint8_t *)&keyExistsAndHasValidFormat, 0xCu);
      }
    }

    _Block_object_dispose(&v97, 8);
    v21 = objc_loadWeakRetained(v4);
    v22 = objc_msgSend(v21, "profileType");

    if (v22 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49B8]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v97 = 0;
      -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:](a1, v23, 0, (uint64_t)&v97);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)v97;

      if (v24 || !v25)
      {
        if (v24)
          v27 = objc_msgSend(v24, "integerValue");
        else
          v27 = 1;
        LOBYTE(keyExistsAndHasValidFormat) = 0;
        v28 = (const __CFString *)*MEMORY[0x1E0CB4658];
        v29 = (const __CFString *)*MEMORY[0x1E0CB7758];
        AppIntegerValue = CFPreferencesGetAppIntegerValue((CFStringRef)*MEMORY[0x1E0CB4658], (CFStringRef)*MEMORY[0x1E0CB7758], (Boolean *)&keyExistsAndHasValidFormat);
        if (!(_BYTE)keyExistsAndHasValidFormat || AppIntegerValue != v27)
        {
          CFPreferencesSetAppValue(v28, (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27), v29);
          _HKInitializeLogging();
          v31 = (void *)*MEMORY[0x1E0CB52C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
          {
            v32 = v31;
            HKActivityMoveModeToString();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v33;
            _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "Activity Move Mode defaults value changed to %{public}@! Posting notification!", (uint8_t *)&buf, 0xCu);

          }
          notify_post((const char *)*MEMORY[0x1E0CB4660]);
        }
      }
      else
      {
        _HKInitializeLogging();
        v26 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v25;
          _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "Error reading activity move mode characteristic for defaults update: %@", (uint8_t *)&buf, 0xCu);
        }
        if (objc_msgSend(v25, "hk_isDatabaseAccessibilityError"))
          *(_BYTE *)(a1 + 56) = 1;
      }

    }
    if (*(_BYTE *)(a1 + 32))
    {
      v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v36 = objc_loadWeakRetained(v4);
      objc_msgSend(v36, "database");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      QuantityCharacteristicTypes();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&keyExistsAndHasValidFormat = 0;
      *((_QWORD *)&keyExistsAndHasValidFormat + 1) = &keyExistsAndHasValidFormat;
      v111 = 0x2020000000;
      LOBYTE(v112) = 0;
      v39 = a1;
      v40 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      -[HDMutableDatabaseTransactionContext setCacheScope:](v40, "setCacheScope:", 1);
      v107 = 0;
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v116 = __68__HDUserCharacteristicsManager__queue_updateQuantityCharacteristics__block_invoke;
      v117 = &unk_1E6CEEC30;
      v41 = v38;
      v118 = v41;
      v119 = (id)a1;
      v42 = (__int128 *)v34;
      v120 = v42;
      v43 = v35;
      v121 = v43;
      p_keyExistsAndHasValidFormat = &keyExistsAndHasValidFormat;
      v44 = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDSampleEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v37, v40, &v107, &buf);
      v45 = v107;
      v46 = v45;
      v103 = 0;
      v104 = &v103;
      v105 = 0x2020000000;
      v106 = 0;
      if (!v44)
        goto LABEL_84;
      if (!*(_BYTE *)(*((_QWORD *)&keyExistsAndHasValidFormat + 1) + 24))
        goto LABEL_32;
      v102 = v45;
      *(_QWORD *)&v97 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v97 + 1) = 3221225472;
      *(_QWORD *)&v98 = __68__HDUserCharacteristicsManager__queue_updateQuantityCharacteristics__block_invoke_2;
      *((_QWORD *)&v98 + 1) = &unk_1E6CEEC30;
      *(_QWORD *)&v99 = v41;
      *((_QWORD *)&v99 + 1) = v42;
      *(_QWORD *)&v100 = a1;
      *((_QWORD *)&v100 + 1) = v43;
      v101 = &v103;
      v47 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:context:error:block:](HDProtectedKeyValueEntity, "performWriteTransactionWithHealthDatabase:context:error:block:", v37, v40, &v102, &v97);
      v48 = v102;

      if (*((_BYTE *)v104 + 24))
        -[HDUserCharacteristicsManager _userCharacteristicsDidChangeShouldUpdateUserProfile:shouldSync:](a1, 1, 1);

      v46 = v48;
      v39 = a1;
      if (v47)
      {
LABEL_32:
        *(_BYTE *)(v39 + 56) = 0;
      }
      else
      {
LABEL_84:
        if (objc_msgSend(v46, "hk_isDatabaseAccessibilityError"))
        {
          *(_BYTE *)(a1 + 56) = 1;
        }
        else
        {
          _HKInitializeLogging();
          v49 = *MEMORY[0x1E0CB52C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v108 = 138543362;
            v109 = v46;
            _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "Error updating user characteristics quantity: %{public}@", v108, 0xCu);
          }
        }
      }
      _Block_object_dispose(&v103, 8);

      _Block_object_dispose(&keyExistsAndHasValidFormat, 8);
    }
    v50 = objc_loadWeakRetained(v4);
    v51 = objc_msgSend(v50, "profileType");

    if (v51 != 1)
    {
      *(_BYTE *)(a1 + 56) = 0;
      return;
    }
    objc_msgSend(MEMORY[0x1E0CA5678], "userProfile");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
      v52 = v95;
    else
      v52 = (void *)MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    -[HDMutableDatabaseTransactionContext setCacheScope:](v93, "setCacheScope:", 1);
    v54 = objc_loadWeakRetained(v4);
    objc_msgSend(v54, "database");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0;
    *(_QWORD *)&keyExistsAndHasValidFormat = MEMORY[0x1E0C809B0];
    *((_QWORD *)&keyExistsAndHasValidFormat + 1) = 3221225472;
    v111 = (uint64_t)__56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke;
    v112 = &unk_1E6CE7950;
    v113 = a1;
    v94 = v53;
    v114 = v94;
    v56 = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDProtectedKeyValueEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v55, v93, &v103, &keyExistsAndHasValidFormat);
    v92 = v103;

    if (v56)
    {
      *(_BYTE *)(a1 + 56) = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v57;

      v59 = objc_msgSend(v94, "copy");
      v60 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v59;

      if ((objc_msgSend(v95, "isEqualToDictionary:", v94) & 1) != 0)
      {
        v61 = v92;
      }
      else
      {
        v63 = objc_loadWeakRetained(v4);
        objc_msgSend(v63, "daemon");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "behavior");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "isAppleInternalInstall");

        if (v66)
        {
          if (v95)
          {
            v67 = v95;
            v68 = v94;
            v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v70 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v67, "allKeys");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "addObjectsFromArray:", v71);

            objc_msgSend(v68, "allKeys");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "addObjectsFromArray:", v72);

            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            v73 = v70;
            v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v97, &buf, 16);
            if (v74)
            {
              v75 = *(_QWORD *)v98;
              do
              {
                for (i = 0; i != v74; ++i)
                {
                  if (*(_QWORD *)v98 != v75)
                    objc_enumerationMutation(v73);
                  v77 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i);
                  objc_msgSend(v67, "objectForKeyedSubscript:", v77);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "objectForKeyedSubscript:", v77);
                  v79 = objc_claimAutoreleasedReturnValue();
                  v80 = (void *)v79;
                  if (v78 != (void *)v79 && (!v79 || (objc_msgSend(v78, "isEqual:", v79) & 1) == 0))
                    objc_msgSend(v69, "addObject:", v77);

                }
                v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v97, &buf, 16);
              }
              while (v74);
            }

          }
          else
          {
            objc_msgSend(v94, "allKeys");
            v69 = (id)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend(v69, "count"))
          {
            v82 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v69, "componentsJoinedByString:", CFSTR(", "));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "stringWithFormat:", CFSTR("(%@)"), v83);
            v81 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v81 = 0;
          }

        }
        else
        {
          v81 = 0;
        }
        _HKInitializeLogging();
        v84 = (os_log_t *)MEMORY[0x1E0CB52C0];
        v85 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEBUG))
        {
          v91 = &stru_1E6D11BB8;
          if (v81)
            v91 = v81;
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v91;
          _os_log_debug_impl(&dword_1B7802000, v85, OS_LOG_TYPE_DEBUG, "Updating changed user profile keys %{public}@", (uint8_t *)&buf, 0xCu);
        }
        *(_QWORD *)&v97 = v92;
        v86 = objc_msgSend(MEMORY[0x1E0CA5678], "setUserProfile:error:", v94, &v97);
        v61 = (id)v97;

        if ((v86 & 1) == 0)
        {
          _HKInitializeLogging();
          v87 = *v84;
          if (os_log_type_enabled(*v84, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v61;
            _os_log_error_impl(&dword_1B7802000, v87, OS_LOG_TYPE_ERROR, "Error setting CoreMotion user profile: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      v88 = *(id *)(v96 + 48);
      v89 = *(void **)(v96 + 24);
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v116 = __73__HDUserCharacteristicsManager__queue_alertObserversDidUpdateUserProfile__block_invoke;
      v117 = &unk_1E6CEEC80;
      v118 = (id)v96;
      v119 = v88;
      v90 = v88;
      objc_msgSend(v89, "notifyObservers:", &buf);

      goto LABEL_76;
    }
    if (objc_msgSend(v92, "hk_isDatabaseAccessibilityError"))
    {
      *(_BYTE *)(a1 + 56) = 1;
    }
    else
    {
      _HKInitializeLogging();
      v62 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        v61 = v92;
        *(_QWORD *)((char *)&buf + 4) = v92;
        _os_log_error_impl(&dword_1B7802000, v62, OS_LOG_TYPE_ERROR, "Error updating user characteristics values: %{public}@", (uint8_t *)&buf, 0xCu);
        goto LABEL_76;
      }
    }
    v61 = v92;
LABEL_76:

  }
}

uint64_t __84__HDUserCharacteristicsManager__queue_updateActivityMoveModeCharacteristicWithDate___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_relatedCategoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = (void *)a1[5];
  v31 = 0;
  if (v7)
  {
    -[HDUserCharacteristicsManager _mostRecentSampleOfType:beforeDate:error:](v7, v6, v8, (uint64_t)&v31);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v31;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = v10;
  v12 = v11;
  if (v9 || !v11)
  {
    v14 = a1[4];
    v30 = 0;
    -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:](v14, v5, 0, (uint64_t)&v30);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v30;
    v17 = v16;
    if (v15)
      v18 = 1;
    else
      v18 = v16 == 0;
    if (!v18)
    {
      if (a3)
      {
        v13 = 0;
        *a3 = objc_retainAutorelease(v16);
      }
      else
      {
        _HKLogDroppedError();
        v13 = 0;
      }
      goto LABEL_35;
    }
    if (!(v9 | v15))
    {
      v13 = 1;
LABEL_35:

      goto LABEL_36;
    }
    v19 = objc_msgSend((id)v15, "integerValue");
    if (v9)
    {
      v20 = objc_msgSend((id)v9, "value");
    }
    else
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "Resetting activity move mode characteristic if needed", buf, 2u);
      }
      v20 = 1;
    }
    if (v19 == v20)
    {
      v22 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        HKActivityMoveModeToString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v27;
        _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "Updating activity move mode characteristic to %{public}@", buf, 0xCu);

      }
      v25 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      LOBYTE(v25) = objc_msgSend(v25, "_setUserCharacteristic:forType:shouldInsertSample:updateProfileAndSync:error:", v28, v5, 0, 0, &v29);
      v22 = v29;

      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v25;
      if ((v25 & 1) == 0)
      {
        v22 = v22;
        if (v22)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v22);
          else
            _HKLogDroppedError();
        }

        v13 = 0;
        goto LABEL_34;
      }
    }
    v13 = 1;
LABEL_34:

    goto LABEL_35;
  }
  if (a3)
  {
    v13 = 0;
    *a3 = objc_retainAutorelease(v11);
  }
  else
  {
    _HKLogDroppedError();
    v13 = 0;
  }
LABEL_36:

  return v13;
}

- (void)_queue_updateFitnessModeDefaultAndNotifyIfNecessary
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  const __CFString *v15;
  int AppBooleanValue;
  CFIndex AppIntegerValue;
  CFIndex v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  const char *v22;
  os_log_t *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  const __CFString *v27;
  _BOOL4 v28;
  NSObject *v29;
  const __CFString *v30;
  CFIndex v31;
  NSObject *v32;
  id WeakRetained;
  Boolean v34;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  CFIndex v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (id *)(a1 + 8);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "daemon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "behavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isAppleWatch"))
    {

    }
    else
    {
      v5 = objc_loadWeakRetained(v2);
      objc_msgSend(v5, "daemon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "behavior");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isiPad");

      if ((v8 & 1) == 0)
      {
        v9 = objc_loadWeakRetained(v2);
        objc_msgSend(v9, "nanoSyncManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pairedDevicesSnapshot");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allDeviceInfos");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (objc_msgSend(*(id *)(a1 + 64), "BOOLValue"))
          v14 = *(_BYTE *)(a1 + 72) != 0;
        else
          v14 = 0;
        v15 = (const __CFString *)*MEMORY[0x1E0CB7758];
        AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("HDUserCharacteristicsForceStandalonePhoneFitnessMode"), (CFStringRef)*MEMORY[0x1E0CB7758], 0);
        AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("HDUserCharacteristicsForceFitnessMode"), v15, 0);
        v18 = AppIntegerValue;
        v19 = 2;
        if (v14)
          v19 = 3;
        if (v13)
          v20 = 0;
        else
          v20 = !v14;
        if (v13)
          v19 = 1;
        if (AppBooleanValue)
          v21 = 1;
        else
          v21 = v20;
        if (AppIntegerValue)
          v22 = (const char *)AppIntegerValue;
        else
          v22 = (const char *)v19;
        _HKInitializeLogging();
        v23 = (os_log_t *)MEMORY[0x1E0CB52C0];
        v24 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
        {
          v25 = *(_QWORD *)(a1 + 64);
          v26 = *(unsigned __int8 *)(a1 + 72);
          *(_DWORD *)buf = 136316930;
          v37 = "-[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary]";
          v38 = 1024;
          v39 = v13 != 0;
          v40 = 2112;
          v41 = v25;
          v42 = 1024;
          v43 = v26;
          v44 = 1024;
          v45 = AppBooleanValue != 0;
          v46 = 2048;
          v47 = v18;
          v48 = 1024;
          v49 = v21;
          v50 = 2048;
          v51 = v22;
          _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%s - hasPairedWatch %d hasWatchOnAccount %@ isCloudSyncEnabled %d isStandalonePhoneFitnessModeForced %d fitnessModeForcedValue %ld isStandalonePhoneFitnessMode %d fitnessMode %lu", buf, 0x42u);
        }
        keyExistsAndHasValidFormat = 0;
        v27 = (const __CFString *)*MEMORY[0x1E0CB5238];
        v28 = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x1E0CB5238], v15, &keyExistsAndHasValidFormat) == 0;
        if (!keyExistsAndHasValidFormat || ((v21 ^ v28) & 1) == 0)
        {
          CFPreferencesSetAppValue(v27, (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21), v15);
          _HKInitializeLogging();
          v29 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v37) = v21;
            _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "Standalone phone fitness mode default value changed to %d. Posting notification!", buf, 8u);
          }
          notify_post((const char *)*MEMORY[0x1E0CB5F68]);
        }
        v34 = 0;
        v30 = (const __CFString *)*MEMORY[0x1E0CB50F0];
        v31 = CFPreferencesGetAppIntegerValue((CFStringRef)*MEMORY[0x1E0CB50F0], v15, &v34);
        if (!v34 || (const char *)v31 != v22)
        {
          CFPreferencesSetAppValue(v30, (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22), v15);
          _HKInitializeLogging();
          v32 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v37 = v22;
            _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "Fitness mode default value changed to %lu. Posting notification!", buf, 0xCu);
          }
          notify_post((const char *)*MEMORY[0x1E0CB50F8]);
        }
      }
    }
  }
}

- (void)_queue_updateHasWatchOnAccount
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[6];
  _QWORD v29[5];
  NSObject *v30;
  uint64_t *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t v37[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[4];

  v47[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "daemon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "behavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppleWatch");

    if ((v5 & 1) == 0)
    {
      v6 = (const __CFString *)*MEMORY[0x1E0CB7758];
      v7 = (void *)CFPreferencesCopyAppValue(CFSTR("HasWatchOnAccountLastFetchDate"), (CFStringRef)*MEMORY[0x1E0CB7758]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateByAddingTimeInterval:", -28800.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v7, "hk_isAfterDate:", v9);
      if (*(_QWORD *)(a1 + 64) && v10)
      {
        _HKInitializeLogging();
        v11 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[HDUserCharacteristicsManager _queue_updateHasWatchOnAccount]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v7;
          _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%s not updating has watch on account; last fetch %{public}@",
            buf,
            0x16u);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "primaryAuthKitAccount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "aa_altDSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0D00130]);
          v16 = objc_alloc_init(MEMORY[0x1E0D001E0]);
          objc_msgSend(v13, "aa_altDSID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setAltDSID:", v17);

          v47[0] = CFSTR("watchOS");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setOperatingSystems:", v18);

          v33 = 0;
          v34 = &v33;
          v35 = 0x2020000000;
          v36 = 1;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v44 = __Block_byref_object_copy__37;
          v45 = __Block_byref_object_dispose__37;
          v46 = (id)MEMORY[0x1E0C9AAA0];
          v19 = dispatch_semaphore_create(0);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __62__HDUserCharacteristicsManager__queue_updateHasWatchOnAccount__block_invoke;
          v29[3] = &unk_1E6CEEAE0;
          v29[4] = a1;
          v31 = &v33;
          v32 = buf;
          v20 = v19;
          v30 = v20;
          objc_msgSend(v15, "deviceListWithContext:completion:", v16, v29);
          v21 = dispatch_time(0, 10000000000);
          if (dispatch_semaphore_wait(v20, v21))
          {
            _HKInitializeLogging();
            v22 = *MEMORY[0x1E0CB52C0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v37 = 138543362;
              v38 = (const char *)a1;
              _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch device list; semaphore timed out",
                v37,
                0xCu);
            }
          }
          else if (*((_BYTE *)v34 + 24))
          {
            _HKInitializeLogging();
            v23 = *MEMORY[0x1E0CB52C0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
            {
              v24 = *(_QWORD *)(a1 + 64);
              v25 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v37 = 136315650;
              v38 = "-[HDUserCharacteristicsManager _queue_updateHasWatchOnAccount]";
              v39 = 2114;
              v40 = v24;
              v41 = 2114;
              v42 = v25;
              _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "%s fetched has watch on account; %{public}@ -> %{public}@",
                v37,
                0x20u);
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            CFPreferencesSetAppValue(CFSTR("HasWatchOnAccountLastFetchDate"), v26, v6);

            v27 = *(NSObject **)(a1 + 16);
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __62__HDUserCharacteristicsManager__queue_updateHasWatchOnAccount__block_invoke_241;
            v28[3] = &unk_1E6CED168;
            v28[4] = a1;
            v28[5] = buf;
            dispatch_async(v27, v28);
          }

          _Block_object_dispose(buf, 8);
          _Block_object_dispose(&v33, 8);

        }
      }

    }
  }
}

void __62__HDUserCharacteristicsManager__queue_updateHasWatchOnAccount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 && v6)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = v8;
      objc_msgSend(v7, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch device list: %{public}@", (uint8_t *)&v17, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "deviceList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "count") != 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __62__HDUserCharacteristicsManager__queue_updateHasWatchOnAccount__block_invoke_241(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
    if (v4 == objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "BOOLValue"))
      return;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 64), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x1E0CB5100], *(CFPropertyListRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (CFStringRef)*MEMORY[0x1E0CB7758]);
  -[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary](*(_QWORD *)(a1 + 32));
}

id __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_246(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0C99D48];
  v3 = a2;
  objc_msgSend(v2, "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:toDate:options:", 4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "year"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_2_249(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB6CD0];
  v3 = a2;
  objc_msgSend(v2, "gramUnitWithMetricPrefix:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  if (v6 <= 2.22044605e-16)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

id __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_3_252(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB6CD0];
  v3 = a2;
  objc_msgSend(v2, "meterUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  if (v6 <= 2.22044605e-16)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

uint64_t __68__HDUserCharacteristicsManager__queue_updateQuantityCharacteristics__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  _QWORD *v21;
  char v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 32);
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v25)
  {
    v22 = 1;
    goto LABEL_32;
  }
  v21 = a3;
  v24 = *(_QWORD *)v30;
  v22 = 1;
  do
  {
    v5 = 0;
    do
    {
      if (*(_QWORD *)v30 != v24)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v5);
      objc_msgSend(v6, "_relatedQuantityType", v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v28 = 0;
      if (v8)
      {
        -[HDUserCharacteristicsManager _mostRecentSampleOfType:beforeDate:error:](v8, v7, 0, (uint64_t)&v28);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v28;
      }
      else
      {
        v10 = 0;
        v9 = 0;
      }
      v11 = v10;
      objc_msgSend(v9, "quantity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v6);
      }
      else if (v11)
      {
        v22 = 0;
        *v21 = objc_retainAutorelease(v11);
        v18 = 2;
        goto LABEL_25;
      }
      v13 = *(_QWORD *)(a1 + 40);
      v26 = 0;
      v27 = 0;
      -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:](v13, v6, (uint64_t)&v27, (uint64_t)&v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v27;
      v16 = v26;
      v17 = v16;
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v15, v6);
      }
      else if (v16)
      {
        if (v21)
        {
          v22 = 0;
          *v21 = objc_retainAutorelease(v16);
        }
        else
        {
          _HKLogDroppedError();
          v22 = 0;
        }
        v18 = 2;
        goto LABEL_24;
      }
      if (v12 == v14 || v14 && (objc_msgSend(v12, "isEqual:", v14) & 1) != 0)
      {
        v18 = 0;
      }
      else
      {
        v18 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      }
LABEL_24:

LABEL_25:
      if (v18)
        goto LABEL_32;
      ++v5;
    }
    while (v25 != v5);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v25 = v19;
  }
  while (v19);
LABEL_32:

  return v22 & 1;
}

uint64_t __68__HDUserCharacteristicsManager__queue_updateQuantityCharacteristics__block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  id v25;
  void *v26;
  _QWORD *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = *(id *)(a1 + 32);
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v31)
  {
    v28 = a3;
    v30 = *(_QWORD *)v37;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v30)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v5);
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "quantity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v34 = 0;
      v35 = 0;
      -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:](v8, v6, (uint64_t)&v35, (uint64_t)&v34);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v35;
      v11 = v34;
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "persistentID");
      v14 = objc_msgSend(v10, "persistentID");
      if (!v11)
      {
        v15 = v14;
        if (v13 != v14)
          break;
      }
      if (v11)
        goto LABEL_22;
      v17 = v32;
      if (v32 != v9)
      {
        if (!v9 || (objc_msgSend(v32, "isEqual:", v9) & 1) == 0)
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x1E0CB52C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v41 = (uint64_t)v6;
            _os_log_debug_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEBUG, "Updating quantity characteristic for %@", buf, 0xCu);
          }
          v19 = *(void **)(a1 + 48);
          objc_msgSend(v7, "quantity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          v21 = objc_msgSend(v19, "_setUserCharacteristic:forType:shouldInsertSample:updateProfileAndSync:error:", v20, v6, 0, 0, &v33);
          v11 = v33;

          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          if (*(_BYTE *)(v22 + 24))
            v23 = 1;
          else
            v23 = v21;
          *(_BYTE *)(v22 + 24) = v23;
          if ((v21 & 1) == 0)
          {
            v25 = v11;
            v26 = v25;
            if (v25)
            {
              if (v28)
                *v28 = objc_retainAutorelease(v25);
              else
                _HKLogDroppedError();
            }

            v24 = 0;
            goto LABEL_31;
          }
          goto LABEL_22;
        }
        v11 = 0;
      }
LABEL_23:

      if (v31 == ++v5)
      {
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v31)
          goto LABEL_3;
        goto LABEL_25;
      }
    }
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v41 = v13;
      v42 = 2048;
      v43 = v15;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "Not updating quantity characteristic: kv row changed from %lld to %lld", buf, 0x16u);
    }
    v11 = 0;
LABEL_22:
    v17 = v32;
    goto LABEL_23;
  }
LABEL_25:
  v24 = 1;
LABEL_31:

  return v24;
}

- (id)_mostRecentSampleOfType:(void *)a3 beforeDate:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;

  v7 = a2;
  v8 = a3;
  if (v8)
  {
    HDSampleEntityPredicateForStartDate(3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  +[HDSampleEntity mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:](HDSampleEntity, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v7, WeakRetained, 0, v9, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *queue;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  OS_dispatch_queue *v17;
  _HKDelayedOperation *v18;
  _HKDelayedOperation *updateOperation;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id handler[4];
  id v49[2];
  id location;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v6 = objc_msgSend(v5, "canPerformCloudSyncWithError:", &v47);
  v7 = v47;
  self->_isCloudSyncEnabled = v6;

  objc_initWeak(&location, self);
  v8 = (void *)objc_opt_class();
  queue = self->_queue;
  handler[0] = (id)MEMORY[0x1E0C809B0];
  handler[1] = (id)3221225472;
  handler[2] = __67__HDUserCharacteristicsManager__registerForTimeChangeNotifications__block_invoke;
  handler[3] = &unk_1E6CEEC58;
  v49[1] = v8;
  objc_copyWeak(v49, &location);
  notify_register_dispatch("SignificantTimeChangeNotification", &self->_significantTimeChangeNotificationToken, queue, handler);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_didReceiveDayChangeNotification_, *MEMORY[0x1E0C99690], 0);

  objc_destroyWeak(v49);
  objc_destroyWeak(&location);
  v11 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v11, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAppleWatch");

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_didReceiveAuthKitDeviceListChangeNotification_, *MEMORY[0x1E0D00000], 0);

  }
  objc_initWeak(handler, self);
  v16 = objc_alloc(MEMORY[0x1E0CB6F80]);
  v17 = self->_queue;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __54__HDUserCharacteristicsManager_profileDidBecomeReady___block_invoke;
  v45[3] = &unk_1E6CECE78;
  objc_copyWeak(&v46, handler);
  v18 = (_HKDelayedOperation *)objc_msgSend(v16, "initWithMode:queue:delay:block:", 0, v17, v45, 3.0);
  updateOperation = self->_updateOperation;
  self->_updateOperation = v18;

  v20 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v20, "dataManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v22, "daemon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "behavior");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isAppleWatch");

  if ((v25 & 1) == 0)
  {
    objc_msgSend(v20, "nanoSyncManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:", self);

    objc_msgSend(v20, "cloudSyncManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:queue:", self, self->_queue);

  }
  if (self->_shouldUpdateQuantityCharacteristics)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    QuantityCharacteristicTypes();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v42;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v31), "_relatedQuantityType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObserver:forDataType:", self, v32);

          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v29);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49B8]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_relatedCategoryType");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:forDataType:", self, v34);

  objc_msgSend(v20, "database");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addProtectedDataObserver:queue:", self, self->_queue);

  if (!_HDIsUnitTesting)
  {
    v36 = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HDUserCharacteristicsManager_profileDidBecomeReady___block_invoke_2;
    block[3] = &unk_1E6CED848;
    v39 = v20;
    objc_copyWeak(&v40, handler);
    dispatch_async(v36, block);
    objc_destroyWeak(&v40);

  }
  objc_destroyWeak(&v46);
  objc_destroyWeak(handler);

}

void __54__HDUserCharacteristicsManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfile]((uint64_t)WeakRetained);

}

void __54__HDUserCharacteristicsManager_profileDidBecomeReady___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProtectedDataAvailable");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfile]((uint64_t)WeakRetained);

  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDUserCharacteristicsManager_samplesAdded_anchor___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__HDUserCharacteristicsManager_samplesAdded_anchor___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    return objc_msgSend(*(id *)(v1 + 80), "execute");
  return result;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HDUserCharacteristicsManager_samplesOfTypesWereRemoved_anchor___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__HDUserCharacteristicsManager_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    return objc_msgSend(*(id *)(v1 + 80), "execute");
  return result;
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  NSDictionary *lastUserProfile;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_needsUpdateAfterUnlock)
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("Needs update after unlock: %s\n"), v5);
  HKDiagnosticStringFromDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Profile last updated: %@\n"), v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAppleInternalInstall");

  if (v10)
  {
    lastUserProfile = self->_lastUserProfile;
    if (!lastUserProfile)
      lastUserProfile = (NSDictionary *)&stru_1E6D11BB8;
    objc_msgSend(v4, "appendFormat:", CFSTR("Last user profile: %@"), lastUserProfile);
  }
  return v4;
}

- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  HDUserCharacteristicsManager *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__HDUserCharacteristicsManager_nanoSyncManager_pairedDevicesChanged___block_invoke;
  v8[3] = &unk_1E6CE8080;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __69__HDUserCharacteristicsManager_nanoSyncManager_pairedDevicesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "allDeviceInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    -[HDUserCharacteristicsManager _queue_updateHasWatchOnAccount](*(_QWORD *)(a1 + 40));
  -[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary](*(_QWORD *)(a1 + 40));
}

- (void)cloudSyncManager:(id)a3 didUpdateSyncEnabled:(BOOL)a4
{
  if (self->_isCloudSyncEnabled != a4)
  {
    self->_isCloudSyncEnabled = a4;
    -[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary]((uint64_t)self);
  }
}

- (void)didReceiveDayChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HDUserCharacteristicsManager_didReceiveDayChangeNotification___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__HDUserCharacteristicsManager_didReceiveDayChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    return objc_msgSend(*(id *)(v1 + 80), "execute");
  return result;
}

void __67__HDUserCharacteristicsManager__registerForTimeChangeNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *WeakRetained;
  id *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating age gating due to significant time change.", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[10], "execute");

}

- (void)didReceiveAuthKitDeviceListChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HDUserCharacteristicsManager_didReceiveAuthKitDeviceListChangeNotification___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __78__HDUserCharacteristicsManager_didReceiveAuthKitDeviceListChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  -[HDUserCharacteristicsManager _queue_updateHasWatchOnAccount](*(_QWORD *)(a1 + 32));
}

uint64_t __51__HDUserCharacteristicsManager_addProfileObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userCharacteristicsManager:didUpdateUserProfile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)removeProfileObserver:(id)a3
{
  -[HDUserCharacteristicsProfileObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)unitTest_updateCharacteristicsAndUserProfileWithDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__HDUserCharacteristicsManager_unitTest_updateCharacteristicsAndUserProfileWithDate_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __96__HDUserCharacteristicsManager_unitTest_updateCharacteristicsAndUserProfileWithDate_completion___block_invoke(uint64_t a1)
{
  -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfileWithDate:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_hasWatchOnAccount, 0);
  objc_storeStrong((id *)&self->_lastUserProfile, 0);
  objc_storeStrong((id *)&self->_userProfileLastUpdated, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
