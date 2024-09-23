@implementation HDCloudSyncOwnerIdentifierManager

- (HDCloudSyncOwnerIdentifierManager)initWithCloudSyncManager:(id)a3
{
  id v4;
  HDCloudSyncOwnerIdentifierManager *v5;
  HDCloudSyncOwnerIdentifierManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *lock_deviceIDsByContainerIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *lock_cachedOwnerIdentifiersByContainerIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *lock_containersByIdentifier;
  uint64_t v13;
  OS_dispatch_queue *writeQueue;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncOwnerIdentifierManager;
  v5 = -[HDCloudSyncOwnerIdentifierManager init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cloudSyncManager, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_deviceIDsByContainerIdentifier = v6->_lock_deviceIDsByContainerIdentifier;
    v6->_lock_deviceIDsByContainerIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_cachedOwnerIdentifiersByContainerIdentifier = v6->_lock_cachedOwnerIdentifiersByContainerIdentifier;
    v6->_lock_cachedOwnerIdentifiersByContainerIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_containersByIdentifier = v6->_lock_containersByIdentifier;
    v6->_lock_containersByIdentifier = v11;

    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    writeQueue = v6->_writeQueue;
    v6->_writeQueue = (OS_dispatch_queue *)v13;

  }
  return v6;
}

uint64_t __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  id v29;
  id v30;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    objc_msgSend(WeakRetained, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HDCloudSyncKeyValueDomainWithProfile(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v8, "dataForKey:error:", CFSTR("HDCloudSyncDatabaseIdentifier"), &v30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v30;
    v11 = v10;
    if (v9)
      v12 = 1;
    else
      v12 = v10 == 0;
    if (v12)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
          v16 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 129, CFSTR("Unable to get cloudSyncDatabaseIdentifier from databaseIdentifierData %@"), v9);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v16 = v17;
          if (v17)
            v18 = objc_retainAutorelease(v17);

        }
        goto LABEL_16;
      }
      v16 = 0;
    }
    else
    {
      v16 = objc_retainAutorelease(v10);
    }
    v14 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v16 = 0;
  v14 = 0;
LABEL_17:
  v19 = v16;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v14;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {

    HDCloudSyncKeyValueDomainWithProfile(*(void **)(a1 + 40));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v22, "stringForKey:error:", CFSTR("OwnerDifferentiator"), &v29);
    v23 = objc_claimAutoreleasedReturnValue();
    v19 = v29;
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      v26 = 1;
    else
      v26 = v19 == 0;
    v27 = v26;
    if (!v26)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

    goto LABEL_33;
  }
  if (v19)
  {
    if (a3)
    {
      v19 = objc_retainAutorelease(v19);
      v27 = 0;
      *a3 = v19;
    }
    else
    {
      _HKLogDroppedError();
      v27 = 0;
    }
LABEL_33:

    return v27;
  }
  return 1;
}

void __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__13;
  v26 = __Block_byref_object_dispose__13;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13;
  v20 = __Block_byref_object_dispose__13;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke_3;
  v11[3] = &unk_1E6CEA138;
  v13 = &v22;
  v10 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  v14 = &v16;
  v5 = objc_msgSend(v2, "performTransactionWithContext:error:block:inaccessibilityHandler:", v3, &v15, v11, 0);
  v6 = v15;

  if (v5)
  {
    v7 = 0;
    v8 = v23[5];
    v9 = v17[5];
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v7 = v6;
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v8, v9, v7);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

}

uint64_t __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  id v33;
  id v34;
  _BYTE buf[12];
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    objc_msgSend(WeakRetained, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HDCloudSyncKeyValueDomainWithProfile(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    +[HDKeyValueEntity retrieveDatabaseIdentifierFromProfile:error:](HDUnprotectedKeyValueEntity, "retrieveDatabaseIdentifierFromProfile:error:", v7, &v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v34;
    v11 = v10;
    if (v9)
      v12 = 1;
    else
      v12 = v10 == 0;
    if (!v12)
    {
      if (a3)
      {
        v11 = objc_retainAutorelease(v10);
        v14 = 0;
        *a3 = v11;
LABEL_31:

        goto LABEL_32;
      }
      _HKLogDroppedError();
LABEL_30:
      v14 = 0;
      goto LABEL_31;
    }
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v9);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 129, CFSTR("Unable to get databaseIdentifier from databaseIdentifierData %@"), v9);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v14);
          else
            _HKLogDroppedError();
        }

LABEL_29:
        goto LABEL_30;
      }
      v14 = (id)v13;
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v5;
        v36 = 2114;
        v37 = v14;
        v38 = 2114;
        v39 = CFSTR("HDCloudSyncDatabaseIdentifier");
        v16 = "%{public}@: Copy database UUID %{public}@ to %{public}@";
        v17 = v15;
        v18 = 32;
LABEL_15:
        _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v5;
        v36 = 2114;
        v37 = v14;
        v16 = "%{public}@: No database UUID present yet; healthd has not yet launched while the device is unlocked on thi"
              "s device. Create a cloud sync database identifier: %{public}@";
        v17 = v19;
        v18 = 22;
        goto LABEL_15;
      }
    }
    objc_msgSend(v14, "hk_dataForUUIDBytes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v11;
    v21 = objc_msgSend(v8, "setData:forKey:error:", v20, CFSTR("HDCloudSyncDatabaseIdentifier"), buf);
    v22 = *(id *)buf;

    if ((v21 & 1) != 0)
    {
      v11 = v22;
      goto LABEL_31;
    }
    v11 = v22;
    if (v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    goto LABEL_29;
  }
  v14 = 0;
LABEL_32:
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v14;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    return 0;
  HDCloudSyncKeyValueDomainWithProfile(*(void **)(a1 + 40));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v25, "stringForKey:error:", CFSTR("OwnerDifferentiator"), &v33);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v33;
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v26;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    v30 = 1;
  else
    v30 = v27 == 0;
  v31 = v30;
  if (!v30)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v27);
    else
      _HKLogDroppedError();
  }

  return v31;
}

- (void)fetchOwnerIdentifierForContainer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  uint64_t v19;
  NSObject *writeQueue;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  HDCloudSyncOwnerIdentifierManager *v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  HDCloudSyncOwnerIdentifierManager *v30;
  uint64_t *v31;
  _QWORD v32[5];
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __81__HDCloudSyncOwnerIdentifierManager_fetchOwnerIdentifierForContainer_completion___block_invoke;
  v24 = &unk_1E6CEA1B0;
  v26 = v6;
  v27 = v7;
  v25 = self;
  v9 = v6;
  v10 = v7;
  v11 = &v21;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cloudSyncManager);
    objc_msgSend(WeakRetained, "profile", v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__13;
    v47 = __Block_byref_object_dispose__13;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__13;
    v41 = __Block_byref_object_dispose__13;
    v42 = 0;
    objc_msgSend(v13, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDatabaseTransactionContext contextForReading](HDDatabaseTransactionContext, "contextForReading");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke;
    v32[3] = &unk_1E6CEA138;
    v34 = &v43;
    v32[4] = self;
    v16 = v13;
    v33 = v16;
    v35 = &v37;
    v17 = objc_msgSend(v14, "performTransactionWithContext:error:block:inaccessibilityHandler:", v15, &v36, v32, 0);
    v18 = v36;

    if ((v17 & 1) != 0)
    {
      v19 = v44[5];
      if (v19)
      {
        ((void (*)(uint64_t *, uint64_t, uint64_t, _QWORD))v23)(v11, v19, v38[5], 0);
      }
      else
      {
        writeQueue = self->_writeQueue;
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __77__HDCloudSyncOwnerIdentifierManager__fetchDatabaseIdentifiersWithCompletion___block_invoke_2;
        block[3] = &unk_1E6CEA160;
        v29 = v16;
        v30 = self;
        v31 = v11;
        dispatch_async(writeQueue, block);

      }
    }
    else
    {
      ((void (*)(uint64_t *, _QWORD, _QWORD, id))v23)(v11, 0, 0, v18);
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);

  }
}

void __81__HDCloudSyncOwnerIdentifierManager_fetchOwnerIdentifierForContainer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[2];
  void (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v19 = __81__HDCloudSyncOwnerIdentifierManager_fetchOwnerIdentifierForContainer_completion___block_invoke_2;
    v20 = &unk_1E6CEA188;
    v23 = *(id *)(a1 + 48);
    v21 = v5;
    v22 = v6;
    v10 = v8;
    v11 = v18;
    if (v9)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v9 + 16));
      v12 = *(void **)(v9 + 32);
      objc_msgSend(v10, "containerIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = *(_QWORD *)(v9 + 24);
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 16));
      if (v14)
      {
        ((void (*)(_QWORD *, void *, _QWORD))v19)(v11, v14, 0);
      }
      else
      {
        v24[0] = v7;
        v24[1] = 3221225472;
        v24[2] = __75__HDCloudSyncOwnerIdentifierManager__fetchDeviceIDForContainer_completion___block_invoke;
        v24[3] = &unk_1E6CEA228;
        v16 = v10;
        v25 = v16;
        v17 = v11;
        v26 = v9;
        v27 = v17;
        v28 = v15;
        objc_msgSend(v16, "fetchCurrentDeviceIDWithCompletionHandler:", v24);

      }
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __81__HDCloudSyncOwnerIdentifierManager_fetchOwnerIdentifierForContainer_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[HDCloudSyncOwnerIdentifier _initWithDatabaseIdentifer:deviceIdentifier:ownerDifferentiator:]([HDCloudSyncOwnerIdentifier alloc], "_initWithDatabaseIdentifer:deviceIdentifier:ownerDifferentiator:", a1[4], v4, a1[5]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)cacheOwnerIdentifiersForContainers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *lock_cachedOwnerIdentifiersByContainerIdentifier;
  void *v14;
  void *v15;
  char v16;
  int64_t lock_fetchEpoch;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[6];
  id v28;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v37;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v8);
        lock_cachedOwnerIdentifiersByContainerIdentifier = self->_lock_cachedOwnerIdentifiersByContainerIdentifier;
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v12), "containerIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](lock_cachedOwnerIdentifiersByContainerIdentifier, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = 1;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  lock_fetchEpoch = self->_lock_fetchEpoch;
  os_unfair_lock_unlock(&self->_lock);
  if ((v16 & 1) != 0)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0D298C8]);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __83__HDCloudSyncOwnerIdentifierManager_cacheOwnerIdentifiersForContainers_completion___block_invoke;
    v34[3] = &unk_1E6CEA1D8;
    v26 = v7;
    v35 = v7;
    objc_msgSend(v18, "setDidFinish:", v34);
    objc_msgSend(v18, "beginTask");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = v8;
    v19 = v8;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23);
          objc_msgSend(v18, "beginTask", v25);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __83__HDCloudSyncOwnerIdentifierManager_cacheOwnerIdentifiersForContainers_completion___block_invoke_2;
          v27[3] = &unk_1E6CEA200;
          v29 = lock_fetchEpoch;
          v27[4] = self;
          v27[5] = v24;
          v28 = v18;
          -[HDCloudSyncOwnerIdentifierManager fetchOwnerIdentifierForContainer:completion:](self, "fetchOwnerIdentifierForContainer:completion:", v24, v27);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v21);
    }

    objc_msgSend(v18, "finishTask");
    v8 = v25;
    v7 = v26;
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __83__HDCloudSyncOwnerIdentifierManager_cacheOwnerIdentifiersForContainers_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    objc_msgSend(a4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);

  }
}

void __83__HDCloudSyncOwnerIdentifierManager_cacheOwnerIdentifiersForContainers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v6 = *(_QWORD *)(a1 + 32);
  if (v12 && *(_QWORD *)(a1 + 56) == *(_QWORD *)(v6 + 24))
  {
    v7 = *(void **)(v6 + 40);
    objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v8);

    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v9, "containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(a1 + 48), "finishTask");
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 16));
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 128, CFSTR("Epoch mismatch; owner identifier has changed since fetch began."));
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 48), "failTaskWithError:", v5);
  }

}

- (id)cachedOwnerIdentifierForContainer:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v6;
  NSMutableDictionary *lock_cachedOwnerIdentifiersByContainerIdentifier;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  lock_cachedOwnerIdentifiersByContainerIdentifier = self->_lock_cachedOwnerIdentifiersByContainerIdentifier;
  objc_msgSend(v6, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](lock_cachedOwnerIdentifiersByContainerIdentifier, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (!lock_cachedOwnerIdentifiersByContainerIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOwnerIdentifierManager.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hasFetched"));

    if (v9)
      return v9;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOwnerIdentifierManager.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    return v9;
  }
  if (!v9)
    goto LABEL_5;
  return v9;
}

void __75__HDCloudSyncOwnerIdentifierManager__fetchDeviceIDForContainer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    v8 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 56) == *(_QWORD *)(v8 + 24))
    {
      v9 = *(void **)(v8 + 32);
      objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v10);
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 128, CFSTR("Epoch mismatch; account information has changed since fetch began."));
      v7 = 0;
      v10 = v6;
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve device identifier for %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)discardCachedIdentifiers
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_deviceIDsByContainerIdentifier;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_deviceIDsByContainerIdentifier = self->_lock_deviceIDsByContainerIdentifier;
  ++self->_lock_fetchEpoch;
  -[NSMutableDictionary removeAllObjects](lock_deviceIDsByContainerIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_lock_cachedOwnerIdentifiersByContainerIdentifier, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)rollOwnerDifferentiatorForReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  HDCloudSyncOwnerIdentifierManager *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cloudSyncManager);
  objc_msgSend(WeakRetained, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "analyticsSubmissionCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudSync_reportOwnershipChangeForProfile:reason:", v9, v6);

  _HKInitializeLogging();
  v12 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: ownership change required: %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_removeObjectsForKeysWithPrefix:", CFSTR("HDLastLongTimeWithoutSuccessfulCloudSyncReportDate"));

  HDCloudSyncKeyValueDomainWithProfile(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v17 = objc_msgSend(v14, "setString:forKey:error:", v16, CFSTR("OwnerDifferentiator"), &v21);
  v18 = v21;

  if (v17)
  {
    -[HDCloudSyncOwnerIdentifierManager discardCachedIdentifiers](self, "discardCachedIdentifiers");
    if (self)
    {
      v19 = v7;
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary allValues](self->_lock_containersByIdentifier, "allValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      -[HDCloudSyncOwnerIdentifierManager cacheOwnerIdentifiersForContainers:completion:](self, "cacheOwnerIdentifiersForContainers:completion:", v20, v19);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v18);
  }

}

- (void)rollOwnerDifferentiatorAfterCloudSyncDisableWithCompletion:(id)a3
{
  -[HDCloudSyncOwnerIdentifierManager rollOwnerDifferentiatorForReason:completion:](self, "rollOwnerDifferentiatorForReason:completion:", CFSTR("Cloud Sync disabled"), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_lock_containersByIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_cachedOwnerIdentifiersByContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_deviceIDsByContainerIdentifier, 0);
  objc_destroyWeak((id *)&self->_cloudSyncManager);
}

@end
