@implementation HDDeviceContextStoreManager

- (HDDeviceContextStoreManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (HDDeviceContextStoreManager)new
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (HDDeviceContextStoreManager)initWithProfile:(id)a3
{
  id v4;
  HDDeviceContextStoreManager *v5;
  HDDeviceContextStoreManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDeviceContextStoreManager;
  v5 = -[HDDeviceContextStoreManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)numberOfDeviceContextsPerDeviceType:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HDDeviceContextStoreManager fetchAllEntriesWithError:](self, "fetchAllEntriesWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      obj = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "type"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "type"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v17);

        }
        v7 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    v18 = v5;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)enumerateAllEntriesWithError:(id *)a3 handler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  -[HDDeviceContextStoreManager profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HDDeviceContextStoreManager_enumerateAllEntriesWithError_handler___block_invoke;
  v11[3] = &unk_1E6CF1650;
  v12 = v6;
  v9 = v6;
  LOBYTE(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDeviceContextEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a3, v11);

  return (char)a3;
}

BOOL __68__HDDeviceContextStoreManager_enumerateAllEntriesWithError_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 v5;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HDDeviceContextStoreManager_enumerateAllEntriesWithError_handler___block_invoke_2;
  v7[3] = &unk_1E6CF4D60;
  v8 = *(id *)(a1 + 32);
  v5 = +[HDDeviceContextEntity enumerateDeviceContextWithTransaction:error:enumerationHandler:](HDDeviceContextEntity, "enumerateDeviceContextWithTransaction:error:enumerationHandler:", a2, a3, v7);

  return v5;
}

uint64_t __68__HDDeviceContextStoreManager_enumerateAllEntriesWithError_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchAllEntriesWithError:(id *)a3
{
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__71;
  v12 = __Block_byref_object_dispose__71;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HDDeviceContextStoreManager_fetchAllEntriesWithError___block_invoke;
  v7[3] = &unk_1E6CF4D88;
  v7[4] = &v8;
  if (-[HDDeviceContextStoreManager enumerateAllEntriesWithError:handler:](self, "enumerateAllEntriesWithError:handler:", a3, v7))
  {
    v5 = (id)v9[5];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __56__HDDeviceContextStoreManager_fetchAllEntriesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

- (id)lookupOrCreateLocalDeviceContextWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__71;
  v14 = __Block_byref_object_dispose__71;
  v15 = 0;
  -[HDDeviceContextStoreManager profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__HDDeviceContextStoreManager_lookupOrCreateLocalDeviceContextWithError___block_invoke;
  v9[3] = &unk_1E6CEF700;
  v9[4] = self;
  v9[5] = &v10;
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDeviceContextEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a3, v9);

  if ((a3 & 1) != 0)
    v7 = (id)v11[5];
  else
    v7 = 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

BOOL __73__HDDeviceContextStoreManager_lookupOrCreateLocalDeviceContextWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceContextEntity lookupOrCreateDeviceContextForLocalSyncIdentityWithProfile:transaction:error:](HDDeviceContextEntity, "lookupOrCreateDeviceContextForLocalSyncIdentityWithProfile:transaction:error:", v7, v6, a3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)updateSoftwareVersionForCurrentSyncIdentityWithError:(id *)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[HDDeviceContextStoreManager profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HDDeviceContextStoreManager_updateSoftwareVersionForCurrentSyncIdentityWithError___block_invoke;
  v8[3] = &unk_1E6CEBC00;
  v8[4] = self;
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDeviceContextEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a3, v8);

  return (char)a3;
}

BOOL __84__HDDeviceContextStoreManager_updateSoftwareVersionForCurrentSyncIdentityWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceContextEntity deviceContextForLocalSyncIdentityWithProfile:transaction:error:](HDDeviceContextEntity, "deviceContextForLocalSyncIdentityWithProfile:transaction:error:", v6, v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = +[HDDeviceContextEntity updateSoftwareVersionForDeviceContext:transaction:error:](HDDeviceContextEntity, "updateSoftwareVersionForDeviceContext:transaction:error:", v7, v5, a3);
  else
    v8 = 0;

  return v8;
}

- (BOOL)insertOrUpdateDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  id v16;

  v7 = a3;
  v8 = a4;
  v16 = 0;
  +[HDDeviceContextEntity lookupDeviceContext:transaction:error:](HDDeviceContextEntity, "lookupDeviceContext:transaction:error:", v7, v8, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
    v12 = 1;
  else
    v12 = v10 == 0;
  if (v12)
  {
    if (v9)
    {
      v13 = +[HDDeviceContextEntity updateDeviceContext:transaction:error:](HDDeviceContextEntity, "updateDeviceContext:transaction:error:", v7, v8, a5);
    }
    else
    {
      +[HDDeviceContextEntity insertDeviceContext:transaction:error:](HDDeviceContextEntity, "insertDeviceContext:transaction:error:", v7, v8, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v14 != 0;

    }
  }
  else if (a5)
  {
    v13 = 0;
    *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    _HKLogDroppedError();
    v13 = 0;
  }

  return v13;
}

- (BOOL)deleteDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;

  v8 = a4;
  v9 = a3;
  -[HDDeviceContextStoreManager profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncIdentityManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v12, 0, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "persistentID");
    -[HDDeviceContextStoreManager profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[HDDeviceContextEntity deleteDeviceContextWithSyncIdentity:profile:error:](HDDeviceContextEntity, "deleteDeviceContextWithSyncIdentity:profile:error:", v15, v16, a5);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)ingestRemoteDeviceContexts:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  NSObject *v44;
  id v45;
  void *v47;
  void *v48;
  id v49;
  id v50;
  char v51;
  id v52;
  HDDeviceContextStoreManager *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE buf[24];
  char v63;
  _QWORD v64[5];
  id v65;
  _BYTE *v66;
  __int128 *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v54 = self;
  -[HDDeviceContextStoreManager profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncIdentityManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentSyncIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __76__HDDeviceContextStoreManager_ingestRemoteDeviceContexts_transaction_error___block_invoke;
  v55[3] = &unk_1E6CF4DB0;
  v56 = v12;
  v49 = v12;
  objc_msgSend(v8, "hk_filter:", v55);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  v16 = v7;
  v48 = v16;
  if (!v54)
  {

    v51 = 0;
    goto LABEL_44;
  }
  *(_QWORD *)&v58 = 0;
  *((_QWORD *)&v58 + 1) = &v58;
  *(_QWORD *)&v59 = 0x3032000000;
  *((_QWORD *)&v59 + 1) = __Block_byref_object_copy__71;
  *(_QWORD *)&v60 = __Block_byref_object_dispose__71;
  *((_QWORD *)&v60 + 1) = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v63 = 1;
  v64[0] = v13;
  v64[1] = 3221225472;
  v64[2] = __79__HDDeviceContextStoreManager__insertOrUpdateDeviceContexts_transaction_error___block_invoke;
  v64[3] = &unk_1E6CF4DD8;
  v66 = buf;
  v64[4] = v54;
  v17 = v16;
  v65 = v17;
  v67 = &v58;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v64);
  v50 = v15;
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v18 = 1;
  }
  else
  {
    v19 = *(id *)(*((_QWORD *)&v58 + 1) + 40);
    v20 = v19;
    if (v19)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

    v18 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v58, 8);

  if (!v18)
  {
    v51 = 0;
    goto LABEL_43;
  }
  v21 = v15;
  v52 = v17;
  -[HDDeviceContextStoreManager profile](v54, "profile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "deviceContextManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fetchAllEntriesWithError:", a5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
    v51 = 0;
    goto LABEL_42;
  }
  -[HDDeviceContextStoreManager profile](v54, "profile");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "syncIdentityManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "currentSyncIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v28 = v47;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (!v29)
  {
    v51 = 1;
    goto LABEL_41;
  }
  v30 = *(_QWORD *)v59;
  v51 = 1;
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v59 != v30)
        objc_enumerationMutation(v28);
      v32 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v32, "syncIdentity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqual:", v27);

      if ((v34 & 1) == 0 && (objc_msgSend(v21, "containsObject:", v32) & 1) == 0)
      {
        v57 = 0;
        v35 = -[HDDeviceContextStoreManager deleteDeviceContext:transaction:error:](v54, "deleteDeviceContext:transaction:error:", v32, v52, &v57);
        v36 = v57;
        _HKInitializeLogging();
        v37 = *MEMORY[0x1E0CB5370];
        v38 = *MEMORY[0x1E0CB5370];
        if (v35)
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = v37;
            objc_msgSend(v32, "description");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v40;
            _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "Successfully deleted local context record %@", buf, 0xCu);

          }
          -[HDDeviceContextStoreManager profile](v54, "profile");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "deviceKeyValueStoreManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "deleteProtectedKVEntriesForDeviceContext:error:", v32, a5);

          if ((v43 & 1) == 0)
          {
            _HKInitializeLogging();
            v44 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v54;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v36;
              _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete protected device key value pairs for record: %{public}@", buf, 0x16u);
            }
            v45 = v36;
            if (v45)
            {
              if (a5)
              {
LABEL_31:
                *a5 = objc_retainAutorelease(v45);
                goto LABEL_33;
              }
LABEL_32:
              _HKLogDroppedError();
            }
            goto LABEL_33;
          }
        }
        else
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v54;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v36;
            _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete local context record: %{public}@", buf, 0x16u);
          }
          v45 = v36;
          if (v45)
          {
            if (a5)
              goto LABEL_31;
            goto LABEL_32;
          }
LABEL_33:

          v51 = 0;
        }

        continue;
      }
    }
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  }
  while (v29);
LABEL_41:

LABEL_42:
LABEL_43:
  v15 = v50;
LABEL_44:

  return v51 & 1;
}

uint64_t __76__HDDeviceContextStoreManager_ingestRemoteDeviceContexts_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "syncIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

void __79__HDDeviceContextStoreManager__insertOrUpdateDeviceContexts_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id obj;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceContextManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v5, "insertOrUpdateDeviceContext:transaction:error:", v3, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v3;
      v17 = 2114;
      v18 = v11;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert %{public}@ error: %{public}@", buf, 0x20u);
    }
  }

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

@end
