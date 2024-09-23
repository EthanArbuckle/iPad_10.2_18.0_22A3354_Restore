@implementation HDDeviceKeyValueStoreManager

- (HDDeviceKeyValueStoreManager)initWithProfile:(id)a3
{
  id v4;
  HDDeviceKeyValueStoreManager *v5;
  id v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  HKObserverSet *observers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDeviceKeyValueStoreManager;
  v5 = -[HDDeviceKeyValueStoreManager init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB6988]);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithName:loggingCategory:", v8, *MEMORY[0x1E0CB5370]);
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v9;

    objc_storeWeak((id *)&v5->_profile, v4);
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (id)fetchEntriesForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 error:(id *)a6
{
  return -[HDDeviceKeyValueStoreManager _fetchEntriesForDomain:key:protectionCategory:latest:error:](self, a3, a4, a5, 0, (uint64_t)a6);
}

- (id)_fetchEntriesForDomain:(void *)a3 key:(uint64_t)a4 protectionCategory:(char)a5 latest:(uint64_t)a6 error:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  BOOL (*v24)(uint64_t, void *, _QWORD *);
  void *v25;
  id v26;
  id v27;
  uint64_t *v28;
  void *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  if (a1)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__110;
    v36 = __Block_byref_object_dispose__110;
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v12)
    {
      v38[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v14 = (void *)objc_opt_class();
    objc_msgSend(a1, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke;
    v25 = &unk_1E6CFB158;
    v29 = v14;
    v17 = v13;
    v26 = v17;
    v31 = a5;
    v30 = a4;
    v27 = v11;
    v28 = &v32;
    v18 = objc_msgSend(v14, "performReadTransactionWithHealthDatabase:error:block:", v16, a6, &v22);

    if (v18 && objc_msgSend((id)v33[5], "count", v22, v23, v24, v25, v26))
      v19 = (void *)v33[5];
    else
      v19 = 0;
    v20 = v19;

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)mostRecentEntryForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[HDDeviceKeyValueStoreManager _fetchEntriesForDomain:key:protectionCategory:latest:error:](self, a3, a4, a5, 1, (uint64_t)a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Multiple storage groups retrived while fetching the most recent entry."));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    goto LABEL_10;
  }
  if (objc_msgSend(v8, "count") != 1)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

- (BOOL)enumerateAllEntriesForSyncIdentity:(id)a3 protectionCategory:(int64_t)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  void *v20;

  v9 = a3;
  v10 = a6;
  v11 = (void *)objc_opt_class();
  -[HDDeviceKeyValueStoreManager profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__HDDeviceKeyValueStoreManager_enumerateAllEntriesForSyncIdentity_protectionCategory_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6CFAF70;
  v19 = v10;
  v20 = v11;
  v18 = v9;
  v14 = v10;
  v15 = v9;
  LOBYTE(a5) = objc_msgSend(v11, "performReadTransactionWithHealthDatabase:error:block:", v13, a5, v17);

  return (char)a5;
}

uint64_t __111__HDDeviceKeyValueStoreManager_enumerateAllEntriesForSyncIdentity_protectionCategory_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "enumerateAllEntriesForSyncIdentity:transaction:error:enumerationHandler:", *(_QWORD *)(a1 + 32), a2, a3, *(_QWORD *)(a1 + 40));
}

- (id)fetchEntryForKey:(id)a3 domain:(id)a4 syncIdentity:(id)a5 category:(int64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__110;
  v33 = __Block_byref_object_dispose__110;
  v34 = 0;
  v14 = (void *)objc_opt_class();
  -[HDDeviceKeyValueStoreManager profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__HDDeviceKeyValueStoreManager_fetchEntryForKey_domain_syncIdentity_category_error___block_invoke;
  v23[3] = &unk_1E6CFAF98;
  v23[4] = self;
  v17 = v13;
  v24 = v17;
  v27 = &v29;
  v28 = v14;
  v18 = v11;
  v25 = v18;
  v19 = v12;
  v26 = v19;
  LODWORD(a7) = objc_msgSend(v14, "performReadTransactionWithHealthDatabase:error:block:", v16, a7, v23);

  if ((_DWORD)a7)
    v20 = (void *)v30[5];
  else
    v20 = 0;
  v21 = v20;

  _Block_object_dispose(&v29, 8);
  return v21;
}

uint64_t __84__HDDeviceKeyValueStoreManager_fetchEntryForKey_domain_syncIdentity_category_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v21;
  id v22;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncIdentityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v22 = 0;
  objc_msgSend(v7, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v8, 0, v5, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;

  if (v9)
  {
    v11 = *(void **)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v9, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v10;
    objc_msgSend(v11, "fetchEntryForKey:domain:syncEntityIdentity:transaction:error:", v12, v13, objc_msgSend(v14, "persistentID"), v5, &v21);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v21;

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v15;

    if (v16)
    {
      if (a3)
      {
        v10 = objc_retainAutorelease(v16);
        v19 = 0;
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
        v19 = 0;
        v10 = v16;
      }
    }
    else
    {
      v10 = 0;
      v19 = 1;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)setDate:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    v15 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 0, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
LABEL_5:
    v16 = -[HDDeviceKeyValueStoreManager setData:forKey:domainName:protectionCategory:error:](self, "setData:forKey:domainName:protectionCategory:error:", v15, v13, v14, a6, a7);

    goto LABEL_6;
  }
  v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)setNumber:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    v15 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 0, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
LABEL_5:
    v16 = -[HDDeviceKeyValueStoreManager setData:forKey:domainName:protectionCategory:error:](self, "setData:forKey:domainName:protectionCategory:error:", v15, v13, v14, a6, a7);

    goto LABEL_6;
  }
  v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)setString:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    v15 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 0, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
LABEL_5:
    v16 = -[HDDeviceKeyValueStoreManager setData:forKey:domainName:protectionCategory:error:](self, "setData:forKey:domainName:protectionCategory:error:", v15, v13, v14, a6, a7);

    goto LABEL_6;
  }
  v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  HDDeviceContext *v19;
  unsigned int v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  int64_t v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  +[HDDeviceContext localProductTypeEnumWithError:](HDDeviceContext, "localProductTypeEnumWithError:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v25 = a6;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__110;
    v31 = __Block_byref_object_dispose__110;
    v32 = 0;
    -[HDDeviceKeyValueStoreManager profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __83__HDDeviceKeyValueStoreManager_setData_forKey_domainName_protectionCategory_error___block_invoke;
    v26[3] = &unk_1E6CEF700;
    v26[4] = self;
    v26[5] = &v27;
    v18 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v17, a7, v26);

    if (v18)
    {
      v19 = [HDDeviceContext alloc];
      v20 = objc_msgSend(v15, "unsignedIntValue");
      v21 = -[HDDeviceContext initForLocalDeviceWithType:syncIdentity:](v19, "initForLocalDeviceWithType:syncIdentity:", v20, v28[5]);
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[HDDeviceKeyValueStoreManager _journalOrSetData:forKey:domainName:protectionCategory:deviceContext:modificationDate:error:](self, v12, v13, v14, v25, v21, v22, (uint64_t)a7);

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
    _Block_object_dispose(&v27, 8);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

BOOL __83__HDDeviceKeyValueStoreManager_setData_forKey_domainName_protectionCategory_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncIdentityManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSyncIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)_journalOrSetData:(void *)a3 forKey:(void *)a4 domainName:(uint64_t)a5 protectionCategory:(void *)a6 deviceContext:(void *)a7 modificationDate:(uint64_t)a8 error:
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HDInsertOrUpdateDeviceKeyValueEntryOperation *v20;
  void *v21;
  uint64_t v22;

  if (result)
  {
    v14 = result;
    v15 = a7;
    v16 = a6;
    v17 = a4;
    v18 = a3;
    v19 = a2;
    v20 = -[HDInsertOrUpdateDeviceKeyValueEntryOperation initWithCategory:key:value:domain:deviceContext:modificationDate:]([HDInsertOrUpdateDeviceKeyValueEntryOperation alloc], "initWithCategory:key:value:domain:deviceContext:modificationDate:", a5, v18, v19, v17, v16, v15);

    objc_msgSend(v14, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HDJournalableOperation performOrJournalWithProfile:error:](v20, "performOrJournalWithProfile:error:", v21, a8);

    return (void *)v22;
  }
  return result;
}

- (BOOL)deleteProtectedKVEntriesForDeviceContext:(id)a3 error:(id *)a4
{
  id v6;
  HDDeleteAllDeviceContextKeyValueEntriesOperation *v7;
  void *v8;
  HDDeleteAllDeviceContextKeyValueEntriesOperation *v9;
  void *v10;

  v6 = a3;
  v7 = [HDDeleteAllDeviceContextKeyValueEntriesOperation alloc];
  objc_msgSend(v6, "syncIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HDDeleteAllDeviceContextKeyValueEntriesOperation initWithSyncIdentity:](v7, "initWithSyncIdentity:", v8);
  -[HDDeviceKeyValueStoreManager profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HDJournalableOperation performOrJournalWithProfile:error:](v9, "performOrJournalWithProfile:error:", v10, a4);

  return (char)a4;
}

- (BOOL)replaceOldSyncIdentity:(id)a3 newSyncIdentity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HDRollSyncIdentityDeviceKeyValueEntriesOperation *v10;
  void *v11;
  void *v12;
  HDRollSyncIdentityDeviceKeyValueEntriesOperation *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  v10 = [HDRollSyncIdentityDeviceKeyValueEntriesOperation alloc];
  objc_msgSend(v9, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HDRollSyncIdentityDeviceKeyValueEntriesOperation initWithOldSyncIdentity:newSyncIdentity:](v10, "initWithOldSyncIdentity:newSyncIdentity:", v11, v12);
  -[HDDeviceKeyValueStoreManager profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[HDJournalableOperation performOrJournalWithProfile:error:](v13, "performOrJournalWithProfile:error:", v14, a5);

  return (char)a5;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKObserverSet registerObserver:](self->_observers, "registerObserver:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)insertOrUpdateData:(id)a3 forKey:(id)a4 transaction:(id)a5 domainName:(id)a6 protectionCategory:(int64_t)a7 deviceContext:(id)a8 modificationDate:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  HDDeviceKeyValueStorageEntry *v38;
  void *v39;
  HDDeviceKeyValueStorageEntry *v40;
  HDDeviceKeyValueStorageGroup *v41;
  void *v42;
  HDDeviceKeyValueStorageGroup *v43;
  HKObserverSet *observers;
  HDDeviceKeyValueStorageGroup *v45;
  BOOL v46;
  void *v48;
  HDDeviceKeyValueStoreManager *v49;
  int64_t v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  HDDeviceKeyValueStorageGroup *v55;
  id v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v51 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v53 = a9;
  v50 = a7;
  v19 = (void *)objc_opt_class();
  -[HDDeviceKeyValueStoreManager profile](self, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "syncIdentityManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "syncIdentity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v22, 1, v16, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    goto LABEL_7;
  v49 = self;
  -[HDDeviceKeyValueStoreManager profile](self, "profile");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "deviceContextManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "insertOrUpdateDeviceContext:transaction:error:", v18, v16, a10);

  if (v26)
  {
    objc_msgSend(v23, "entity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDeviceContextEntity deviceContextEntityWithSyncIdentity:transaction:error:](HDDeviceContextEntity, "deviceContextEntityWithSyncIdentity:transaction:error:", objc_msgSend(v27, "persistentID"), v16, a10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v48 = v28;
      v29 = objc_msgSend(v28, "persistentID");
      objc_msgSend(v23, "entity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "persistentID");
      v33 = v51;
      v32 = v52;
      v34 = v17;
      v35 = v17;
      v36 = v53;
      v37 = objc_msgSend(v19, "setData:forKey:domain:deviceContextID:syncEntityIdentity:modificationDate:transaction:error:", v52, v51, v35, v29, v31, v53, v16, a10);

      if (v37 == 1)
      {
        v38 = [HDDeviceKeyValueStorageEntry alloc];
        objc_msgSend(v23, "identity");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[HDDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:syncIdentity:category:](v38, "initWithDomain:key:value:modificationDate:syncIdentity:category:", v34, v51, v52, v53, v39, v50);

        v41 = [HDDeviceKeyValueStorageGroup alloc];
        v57[0] = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[HDDeviceKeyValueStorageGroup initWithDeviceContext:storageEntries:](v41, "initWithDeviceContext:storageEntries:", v18, v42);

        observers = v49->_observers;
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __137__HDDeviceKeyValueStoreManager_insertOrUpdateData_forKey_transaction_domainName_protectionCategory_deviceContext_modificationDate_error___block_invoke;
        v54[3] = &unk_1E6CFAFC0;
        v55 = v43;
        v56 = v34;
        v45 = v43;
        -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v54);

        v36 = v53;
      }
      v46 = v37 != 0;
      v28 = v48;
    }
    else
    {
      v46 = 0;
      v33 = v51;
      v32 = v52;
      v34 = v17;
      v36 = v53;
    }

  }
  else
  {
LABEL_7:
    v46 = 0;
    v33 = v51;
    v32 = v52;
    v34 = v17;
    v36 = v53;
  }

  return v46;
}

void __137__HDDeviceKeyValueStoreManager_insertOrUpdateData_forKey_transaction_domainName_protectionCategory_deviceContext_modificationDate_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceKeyValueStoreDidUpdateForStorageGroup:domain:", v5, *(_QWORD *)(a1 + 40), v6, v7);

}

- (BOOL)updateKeyValuePairsForRemoteEntries:(id)a3 deviceContexts:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  HDDeviceKeyValueStoreManager *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  HDDeviceKeyValueStoreManager *v20;
  HDDeviceKeyValueStoreManager *v21;
  void *v22;
  void (*v23)(uint64_t);
  id v24;
  uint64_t aBlock;
  uint64_t v27;
  void *v28;
  void *v29;
  HDDeviceKeyValueStoreManager *v30;
  HDDeviceKeyValueStoreManager *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  objc_msgSend(a4, "hk_mapToDictionary:", &__block_literal_global_117);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (!self)
  {

LABEL_8:
    v18 = 0;
    goto LABEL_10;
  }
  v33 = 0;
  v34 = (uint64_t)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__110;
  v37 = __Block_byref_object_dispose__110;
  v13 = MEMORY[0x1E0C809B0];
  v38 = 0;
  aBlock = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __83__HDDeviceKeyValueStoreManager__updateRemoteEntries_deviceContextByIdentity_error___block_invoke;
  v29 = &unk_1E6CFB0C8;
  v30 = self;
  v14 = (HDDeviceKeyValueStoreManager *)v11;
  v31 = v14;
  v32 = &v33;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &aBlock);
  v15 = *(void **)(v34 + 40);
  if (v15)
  {
    v16 = v15;
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();

    _Block_object_dispose(&v33, 8);
    goto LABEL_8;
  }

  _Block_object_dispose(&v33, 8);
  v19 = v10;
  v20 = v14;
  aBlock = v13;
  v27 = 3221225472;
  v28 = __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke;
  v29 = &unk_1E6CFB078;
  v21 = v20;
  v30 = v21;
  v31 = self;
  v22 = _Block_copy(&aBlock);
  v33 = v13;
  v34 = 3221225472;
  v35 = (uint64_t)__83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_207;
  v36 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CFB0A0;
  v38 = v22;
  v23 = (void (*)(uint64_t))v19;
  v37 = v23;
  v24 = v22;
  v18 = HKWithAutoreleasePool();

LABEL_10:
  return v18;
}

void __89__HDDeviceKeyValueStoreManager_updateKeyValuePairsForRemoteEntries_deviceContexts_error___block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "syncIdentity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v5, v7, v6);

}

BOOL __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke(uint64_t a1, _QWORD *a2, int a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v7 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__110;
  v35 = __Block_byref_object_dispose__110;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_2;
  v20 = &unk_1E6CFB050;
  v9 = *(_QWORD *)(a1 + 40);
  v24 = &v27;
  v25 = &v31;
  v21 = v9;
  v26 = a3 ^ 1u;
  v10 = v7;
  v22 = v10;
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v17);

  v11 = *((unsigned __int8 *)v28 + 24);
  if (!*((_BYTE *)v28 + 24))
  {
    v12 = (void *)v32[5];
    if (v12)
    {
      v13 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Error deleting local kv pairs"), v17, v18, v19, v20, v21, v22);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v32[5];
      v32[5] = v14;

      v13 = (id)v32[5];
      if (!v13)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    if (a2)
    {
      v13 = objc_retainAutorelease(v13);
      *a2 = v13;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_8;
  }
LABEL_9:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v11 != 0;
}

void __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceKeyValueStoreManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = *(id *)(v7 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_3;
  v11[3] = &unk_1E6CFB028;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v14 = *(id *)(a1 + 48);
  v15 = v3;
  v10 = v3;
  LOBYTE(v6) = objc_msgSend(v5, "enumerateAllEntriesForSyncIdentity:protectionCategory:error:enumerationHandler:", v10, v6, &v16, v11);
  objc_storeStrong((id *)(v7 + 40), v16);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

uint64_t __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_3(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v5, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "protectionCategory");
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    LOBYTE(v9) = objc_msgSend(v6, "setData:forKey:domainName:protectionCategory:deviceContext:modificationDate:error:", 0, v7, v8, v9, v10, v11, &v17);
    v12 = v17;

    if ((v9 & 1) == 0)
    {
      v13 = v12;
      if (v13)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v13);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v19 = v16;
        v20 = 2114;
        v21 = v5;
        v22 = 2114;
        v23 = v13;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Error deleting key value entry (%{public}@) %{public}@", buf, 0x20u);
      }
    }

  }
  return 1;
}

uint64_t __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_207(uint64_t a1)
{
  int v2;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return v2 & (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__HDDeviceKeyValueStoreManager__updateRemoteEntries_deviceContextByIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "syncIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncIdentityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSyncIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v3, "syncIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v3, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v3, "protectionCategory");
      objc_msgSend(v3, "modificationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v19 + 40);
      LOBYTE(v13) = objc_msgSend(v13, "setData:forKey:domainName:protectionCategory:deviceContext:modificationDate:error:", v14, v15, v16, v17, v12, v18, &obj);
      objc_storeStrong((id *)(v19 + 40), obj);

      if ((v13 & 1) != 0)
        goto LABEL_7;
      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB5370];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2114;
      v33 = v22;
      v23 = "%{public}@: Error updating local key value entry from remote entry %{public}@";
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Found no corresponding device context for remote key value pair"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB5370];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        goto LABEL_8;
      }
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v31 = v27;
      v32 = 2114;
      v33 = v28;
      v23 = "%{public}@: %{public}@";
    }
    _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
    goto LABEL_7;
  }
LABEL_8:

}

BOOL __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v23 = 0;
  objc_msgSend(v6, "fetchEntriesForKeys:domain:transaction:error:", v7, v8, v5, &v23);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  if (v10)
  {
    if (a3)
    {
      v11 = 0;
      *a3 = objc_retainAutorelease(v10);
    }
    else
    {
      _HKLogDroppedError();
      v11 = 0;
    }
  }
  else if (v9 && objc_msgSend(v9, "count"))
  {
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v9, "hk_firstSortedObjectWithComparison:", &__block_literal_global_214_2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v24[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithArray:", v14);

      v9 = (id)v15;
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke_3;
    v19[3] = &unk_1E6CFB130;
    v9 = v9;
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 48);
    v20 = v9;
    v21 = v17;
    v22 = v16;
    v11 = +[HDDeviceContextEntity enumerateDeviceContextWithTransaction:error:enumerationHandler:](HDDeviceContextEntity, "enumerateDeviceContextWithTransaction:error:enumerationHandler:", v5, a3, v19);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HDDeviceKeyValueStorageEntry *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HDDeviceKeyValueStorageEntry *v18;
  void *v19;
  HDDeviceKeyValueStorageGroup *v20;
  uint64_t v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22 = a1;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v3, "syncIdentity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "syncIdentity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
        {
          v12 = [HDDeviceKeyValueStorageEntry alloc];
          objc_msgSend(v8, "domain");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "modificationDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "syncIdentity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[HDDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:syncIdentity:category:](v12, "initWithDomain:key:value:modificationDate:syncIdentity:category:", v13, v14, v15, v16, v17, *(_QWORD *)(v22 + 48));
          objc_msgSend(v23, "addObject:", v18);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v23, "count"))
  {
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(v22 + 40) + 8) + 40);
    v20 = -[HDDeviceKeyValueStorageGroup initWithDeviceContext:storageEntries:]([HDDeviceKeyValueStorageGroup alloc], "initWithDeviceContext:storageEntries:", v3, v23);
    objc_msgSend(v19, "addObject:", v20);

  }
  return 1;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 deviceContext:(id)a7 modificationDate:(id)a8 error:(id *)a9
{
  return -[HDDeviceKeyValueStoreManager _journalOrSetData:forKey:domainName:protectionCategory:deviceContext:modificationDate:error:](self, a3, a4, a5, a6, a7, a8, (uint64_t)a9);
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
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
