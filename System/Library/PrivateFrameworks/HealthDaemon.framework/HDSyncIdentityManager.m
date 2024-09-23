@implementation HDSyncIdentityManager

- (HDSyncIdentityManager)initWithProfile:(id)a3
{
  id v4;
  HDSyncIdentityManager *v5;
  HDSyncIdentityManager *v6;
  id v7;
  id v8;
  HDDatabaseValueCache *v9;
  HDDatabaseValueCache *entityByIdentityCache;
  HDDatabaseValueCache *v11;
  HDDatabaseValueCache *identityByEntityPersistentIDCache;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSyncIdentityManager;
  v5 = -[HDSyncIdentityManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = v7;
    objc_msgSend(v4, "registerProfileInitializedObserver:queue:", v6, 0);

    v9 = -[HDDatabaseValueCache initWithName:cacheScope:]([HDDatabaseValueCache alloc], "initWithName:cacheScope:", CFSTR("sync-identity-to-concrete-sync-identity"), 1);
    entityByIdentityCache = v6->_entityByIdentityCache;
    v6->_entityByIdentityCache = v9;

    v11 = -[HDDatabaseValueCache initWithName:cacheScope:]([HDDatabaseValueCache alloc], "initWithName:cacheScope:", CFSTR("entity-to-concrete-sync-identity"), 1);
    identityByEntityPersistentIDCache = v6->_identityByEntityPersistentIDCache;
    v6->_identityByEntityPersistentIDCache = v11;

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HDConcreteSyncIdentity)currentSyncIdentity
{
  os_unfair_lock_s *p_lock;
  HDConcreteSyncIdentity *v5;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_currentSyncIdentity;
  os_unfair_lock_unlock(p_lock);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSyncIdentityManager.m"), 71, CFSTR("Attempt to call %@ prior to first transaction."), v8);

  }
  return v5;
}

- (HDConcreteSyncIdentity)legacySyncIdentity
{
  os_unfair_lock_s *p_lock;
  HDConcreteSyncIdentity *v5;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_legacySyncIdentity;
  os_unfair_lock_unlock(p_lock);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSyncIdentityManager.m"), 80, CFSTR("Attempt to call %@ prior to first transaction."), v8);

  }
  return v5;
}

- (id)concreteIdentityForIdentity:(id)a3 shouldCreate:(BOOL)a4 transaction:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  HDDatabaseValueCache *entityByIdentityCache;
  id v15;
  void *v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  BOOL v21;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = v12;
  if (v8 && (objc_msgSend(v12, "isWriteTransaction") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSyncIdentityManager.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction.isWriteTransaction"));

  }
  entityByIdentityCache = self->_entityByIdentityCache;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__HDSyncIdentityManager_concreteIdentityForIdentity_shouldCreate_transaction_error___block_invoke;
  v19[3] = &unk_1E6D0C7F8;
  v20 = v11;
  v21 = v8;
  v15 = v11;
  -[HDDatabaseValueCache fetchObjectForKey:transaction:error:faultHandler:](entityByIdentityCache, "fetchObjectForKey:transaction:error:faultHandler:", v15, v13, a6, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __84__HDSyncIdentityManager_concreteIdentityForIdentity_shouldCreate_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a2;
  +[HDSyncIdentityEntity concreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "concreteIdentityForIdentity:transaction:error:", *(_QWORD *)(a1 + 32), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 || !*(_BYTE *)(a1 + 40))
  {
    v8 = v6;
  }
  else
  {
    +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "insertOrLookupConcreteIdentityForIdentity:transaction:error:", *(_QWORD *)(a1 + 32), v5, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)identityForEntityID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  HDDatabaseValueCache *identityByEntityPersistentIDCache;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  identityByEntityPersistentIDCache = self->_identityByEntityPersistentIDCache;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__HDSyncIdentityManager_identityForEntityID_transaction_error___block_invoke;
  v13[3] = &__block_descriptor_40_e59___HDConcreteSyncIdentity_24__0__HDDatabaseTransaction_8__16l;
  v13[4] = a3;
  -[HDDatabaseValueCache fetchObjectForKey:transaction:error:faultHandler:](identityByEntityPersistentIDCache, "fetchObjectForKey:transaction:error:faultHandler:", v10, v9, a5, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __63__HDSyncIdentityManager_identityForEntityID_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  HDSyncIdentityEntity *v6;
  void *v7;

  v5 = a2;
  v6 = -[HDSQLiteEntity initWithPersistentID:]([HDSyncIdentityEntity alloc], "initWithPersistentID:", *(_QWORD *)(a1 + 32));
  -[HDSyncIdentityEntity concreteIdentityWithTransaction:error:](v6, "concreteIdentityWithTransaction:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)enumerateConcreteIdentitiesError:(id *)a3 enumerationHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  -[HDSyncIdentityManager profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__HDSyncIdentityManager_enumerateConcreteIdentitiesError_enumerationHandler___block_invoke;
  v11[3] = &unk_1E6CEE458;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  LOBYTE(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a3, v11);

  return (char)a3;
}

BOOL __77__HDSyncIdentityManager_enumerateConcreteIdentitiesError_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__HDSyncIdentityManager_enumerateConcreteIdentitiesError_enumerationHandler___block_invoke_2;
  v10[3] = &unk_1E6D0C840;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v5;
  v8 = +[HDSyncIdentityEntity enumerateConcreteIdentitiesWithTransaction:error:enumerationHandler:](HDSyncIdentityEntity, "enumerateConcreteIdentitiesWithTransaction:error:enumerationHandler:", v7, a3, v10);

  return v8;
}

uint64_t __77__HDSyncIdentityManager_enumerateConcreteIdentitiesError_enumerationHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = *(void **)(a1[4] + 40);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v5, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v6, "persistentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:transaction:", v5, v7, a1[5]);

  v8 = *(void **)(a1[4] + 32);
  objc_msgSend(v5, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:transaction:", v5, v9, a1[5]);

  v10 = (*(uint64_t (**)(void))(a1[6] + 16))();
  return v10;
}

- (BOOL)updateIsChild:(BOOL)a3 concreteIdentity:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HDSyncIdentityManager *v15;
  BOOL v16;

  v8 = a4;
  -[HDSyncIdentityManager profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__HDSyncIdentityManager_updateIsChild_concreteIdentity_error___block_invoke;
  v13[3] = &unk_1E6D0C868;
  v16 = a3;
  v14 = v8;
  v15 = self;
  v11 = v8;
  LOBYTE(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v13);

  return (char)a5;
}

BOOL __62__HDSyncIdentityManager_updateIsChild_concreteIdentity_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v20;

  v5 = a2;
  v6 = *(unsigned __int8 *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v20 = 0;
  +[HDSyncIdentityEntity updateIsChild:concreteIdentity:transaction:error:](HDSyncIdentityEntity, "updateIsChild:concreteIdentity:transaction:error:", v6, v7, v5, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  v10 = v9;
  if (v8)
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v13, "persistentID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:transaction:", v8, v14, v5);

    v15 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(v8, "identity");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:transaction:", v8, v16, v5);
  }
  else
  {
    v17 = (void *)*MEMORY[0x1E0CB5370];
    v16 = v9;
    v18 = v17;
    if (v16)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedErrorWithReason();
    }

  }
  return v8 != 0;
}

- (id)childIdentitiesForCurrentSyncIdentityWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__177;
  v17 = __Block_byref_object_dispose__177;
  v18 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  -[HDSyncIdentityManager profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__HDSyncIdentityManager_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke;
  v12[3] = &unk_1E6CEE6D0;
  v12[4] = &v13;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v12);

  if ((_DWORD)a4)
    v9 = (void *)v14[5];
  else
    v9 = 0;
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __84__HDSyncIdentityManager_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v14;

  v14 = 0;
  +[HDSyncIdentityEntity childIdentitiesForCurrentSyncIdentityWithTransaction:error:](HDSyncIdentityEntity, "childIdentitiesForCurrentSyncIdentityWithTransaction:error:", a2, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else if (a3)
  {
    *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    _HKLogDroppedError();
  }

  return v9;
}

- (id)childIdentitiesForCurrentSyncIdentityWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__177;
  v15 = __Block_byref_object_dispose__177;
  v16 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  -[HDSyncIdentityManager profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HDSyncIdentityManager_childIdentitiesForCurrentSyncIdentityWithError___block_invoke;
  v10[3] = &unk_1E6CEE6D0;
  v10[4] = &v11;
  LODWORD(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v6, a3, v10);

  if ((_DWORD)a3)
    v7 = (void *)v12[5];
  else
    v7 = 0;
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __72__HDSyncIdentityManager_childIdentitiesForCurrentSyncIdentityWithError___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v14;

  v14 = 0;
  +[HDSyncIdentityEntity childIdentitiesForCurrentSyncIdentityWithTransaction:error:](HDSyncIdentityEntity, "childIdentitiesForCurrentSyncIdentityWithTransaction:error:", a2, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else if (a3)
  {
    *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    _HKLogDroppedError();
  }

  return v9;
}

+ (void)unitTest_resetCachedHardwareIdentifier
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_225);
  v2 = (void *)qword_1ED552538;
  qword_1ED552538 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_225);
}

- (BOOL)rollCurrentSyncIdentityWithReason:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  HDProfile **p_profile;
  id WeakRetained;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  HDSyncIdentityManager *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)-[HDConcreteSyncIdentity copy](self->_currentSyncIdentity, "copy");
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__177;
  v22 = __Block_byref_object_dispose__177;
  v23 = 0;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: sync identity rollover required: %{public}@", buf, 0x16u);
  }
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__HDSyncIdentityManager_rollCurrentSyncIdentityWithReason_error___block_invoke;
  v17[3] = &unk_1E6CE8D70;
  v17[4] = self;
  v17[5] = &v18;
  v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a4, v17);

  if (v12)
  {
    v13 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v13, "deviceKeyValueStoreManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "replaceOldSyncIdentity:newSyncIdentity:error:", v7, v19[5], a4);

  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v15;
}

BOOL __65__HDSyncIdentityManager_rollCurrentSyncIdentityWithReason_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  HDKeyValueDomain *v6;
  id WeakRetained;
  HDKeyValueDomain *v8;
  void *v9;
  void *v10;
  HDSyncIdentity *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HDSyncIdentity *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = [HDKeyValueDomain alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v8 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v6, "initWithCategory:domainName:profile:", 0, CFSTR("sync-identity"), WeakRetained);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HDKeyValueDomain setString:forKey:error:](v8, "setString:forKey:error:", v10, CFSTR("instance-discriminator"), a3))
  {
    v11 = [HDSyncIdentity alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hardwareIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "identity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "databaseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](v11, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v13, v15, v10);

    +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "insertOrLookupConcreteIdentityForIdentity:transaction:error:", v16, v5, a3);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(_QWORD *)(*(_QWORD *)(v20 + 8) + 40);
    v22 = v21 != 0;
    if (v21)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __65__HDSyncIdentityManager_rollCurrentSyncIdentityWithReason_error___block_invoke_224;
      v28[3] = &unk_1E6CED168;
      v28[4] = *(_QWORD *)(a1 + 32);
      v28[5] = v20;
      objc_msgSend(v5, "onCommit:orRollback:", v28, 0);
    }
    else
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v27 = *a3;
        *(_DWORD *)buf = 138543362;
        v30 = v27;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Failed to create rolled current sync identity: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v26 = *a3;
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "Failed to save new instance discriminator in key-value domain: %{public}@", buf, 0xCu);
    }
    v22 = 0;
  }

  return v22;
}

void __65__HDSyncIdentityManager_rollCurrentSyncIdentityWithReason_error___block_invoke_224(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)profileDidInitialize:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HDSyncIdentityManager_profileDidInitialize___block_invoke;
  v7[3] = &unk_1E6CE7950;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performInFirstUnprotectedWriteTransaction:", v7);

}

uint64_t __46__HDSyncIdentityManager_profileDidInitialize___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  HDKeyValueDomain *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v18;
  BOOL v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  os_log_t *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  const __CFString *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  BOOL v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  HDSyncIdentity *v81;
  void *v82;
  HDKeyValueDomain *v83;
  int v84;
  const __CFString *v85;
  _QWORD v86[5];
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  id v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  uint64_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[HDSyncIdentity legacySyncIdentity](HDSyncIdentity, "legacySyncIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "insertOrLookupConcreteIdentityForIdentity:transaction:error:", v6, v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 0, CFSTR("sync-identity"), *(_QWORD *)(a1 + 40));
    v92 = 0;
    -[HDKeyValueDomain dataForKey:error:](v8, "dataForKey:error:", CFSTR("database-identifier"), &v92);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v92;
    v11 = v10;
    if (v9)
      v12 = 1;
    else
      v12 = v10 == 0;
    if (!v12)
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v40 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v97 = v40;
        v98 = 2114;
        v99 = v11;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch fetch raw database identifier: %{public}@", buf, 0x16u);
        if (a3)
          goto LABEL_14;
      }
      else if (a3)
      {
LABEL_14:
        v11 = objc_retainAutorelease(v11);
        v15 = 0;
        *a3 = v11;
LABEL_85:

        goto LABEL_86;
      }
      _HKLogDroppedError();
      v15 = 0;
      goto LABEL_85;
    }
    if (v9)
      objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v9);
    else
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v13;
    if (v9)
      v19 = v13 == 0;
    else
      v19 = 1;
    v20 = v19;
    v84 = v20;
    if (!v13)
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v66 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v97 = v66;
        _os_log_fault_impl(&dword_1B7802000, v21, OS_LOG_TYPE_FAULT, "%{public}@: Failed to decode existing database identifier data; creating a fresh database identifier. This wil"
          "l roll sync identity.",
          buf,
          0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v91 = 0;
    -[HDKeyValueDomain stringForKey:error:](v8, "stringForKey:error:", CFSTR("instance-discriminator"), &v91);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v91;
    v11 = v23;
    v85 = (const __CFString *)v22;
    if (!v22 && v23)
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v65 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v97 = v65;
        v98 = 2114;
        v99 = v11;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch fetch instance discriminator: %{public}@", buf, 0x16u);
      }
      v25 = 0;
      if (a3)
      {
        v11 = objc_retainAutorelease(v11);
        v15 = 0;
        *a3 = v11;
      }
      else
      {
        _HKLogDroppedError();
        v15 = 0;
      }
      goto LABEL_84;
    }
    v81 = [HDSyncIdentity alloc];
    v79 = a1;
    objc_msgSend(*(id *)(a1 + 40), "daemon");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_self();
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_225);
    v83 = v8;
    v80 = v26;
    if (qword_1ED552538)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_225);
      v28 = (id)qword_1ED552538;
    }
    else
    {
      v76 = v27;
      v29 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      objc_msgSend(v26, "localContentURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0;
      v72 = v29;
      LOBYTE(v29) = objc_msgSend(v29, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v30, 1, 0, &v93);
      v73 = v93;
      if ((v29 & 1) == 0)
      {
        _HKInitializeLogging();
        v31 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v97 = v27;
          v98 = 2114;
          v99 = v73;
          _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create local content directory: %{public}@", buf, 0x16u);
        }
      }
      v71 = v30;
      objc_msgSend(v30, "URLByAppendingPathComponent:isDirectory:", CFSTR("SyncIdentityHardwareIdentifier.uuid"), 0);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = objc_opt_self();
      v95 = 0;
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v32, &v95);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v32;

      v35 = v95;
      v36 = v35;
      if (v34)
      {
        v94 = 0;
        v74 = v34;
        objc_msgSend(v34, "readDataUpToLength:error:", 16, &v94);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v94;

        if (v37)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          _HKInitializeLogging();
          v41 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v97 = v33;
            v98 = 2114;
            v99 = v69;
            _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read from existing hardware identifier file: %{public}@", buf, 0x16u);
          }
          v38 = 0;
        }

        v34 = v74;
        v36 = v69;
      }
      else if ((objc_msgSend(v35, "hk_isCocoaNoSuchFileError") & 1) != 0)
      {
        v38 = 0;
      }
      else
      {
        _HKInitializeLogging();
        v42 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v97 = v33;
          v98 = 2114;
          v99 = v36;
          _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open existing hardware identifier file for reading: %{public}@", buf, 0x16u);
        }
        v38 = 0;
        v34 = 0;
      }

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKey:", CFSTR("SyncIdentityHardwareIdentifier"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v44 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v44, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v38;
      if (v45 && objc_msgSend(v38, "isEqual:", v45))
      {
        v46 = v45;
        objc_storeStrong((id *)&qword_1ED552538, v45);
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_225);
        v28 = (id)qword_1ED552538;
      }
      else
      {
        v46 = v45;
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)qword_1ED552538;
        qword_1ED552538 = v47;

        _HKInitializeLogging();
        v49 = (os_log_t *)MEMORY[0x1E0CB5370];
        v50 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          v97 = v76;
          v98 = 2112;
          v99 = v75;
          v100 = 2112;
          v101 = v45;
          v102 = 2112;
          v103 = qword_1ED552538;
          _os_log_impl(&dword_1B7802000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: File identifier (%@) and defaults identifier (%@) do not match. Generating fresh hardware identifier: %@", buf, 0x2Au);
        }
        objc_msgSend((id)qword_1ED552538, "hk_dataForUUIDBytes");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKey:", v51, CFSTR("SyncIdentityHardwareIdentifier"));

        if ((objc_msgSend(v51, "writeToURL:atomically:", v77, 1) & 1) == 0)
        {
          _HKInitializeLogging();
          v53 = *v49;
          if (os_log_type_enabled(*v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v97 = v76;
            _os_log_error_impl(&dword_1B7802000, v53, OS_LOG_TYPE_ERROR, "%{public}@: Failed to write hardware identifier to file", buf, 0xCu);
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_225);
        v28 = (id)qword_1ED552538;

      }
    }
    v25 = (__CFString *)v85;

    if (v85)
      v54 = v85;
    else
      v54 = &stru_1E6D11BB8;
    v55 = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](v81, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v28, v18, v54);

    v90 = v11;
    v82 = (void *)v55;
    +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "insertOrLookupConcreteIdentityForIdentity:transaction:error:", v55, v5, &v90);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v90;

    if (v56)
    {
      if (!v84)
      {
LABEL_71:
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __46__HDSyncIdentityManager_profileDidInitialize___block_invoke_229;
        v86[3] = &unk_1E6CE7FB8;
        v86[4] = *(_QWORD *)(v79 + 32);
        v87 = v56;
        v88 = v7;
        objc_msgSend(v5, "onCommit:orRollback:", v86, 0);

        v15 = 1;
        v11 = v57;
        v8 = v83;
LABEL_83:

LABEL_84:
        goto LABEL_85;
      }
      v78 = v18;
      objc_msgSend(v18, "hk_dataForUUIDBytes");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "entity");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v57;
      v60 = -[HDKeyValueDomain setData:forKey:syncIdentity:error:](v83, "setData:forKey:syncIdentity:error:", v58, CFSTR("database-identifier"), objc_msgSend(v59, "persistentID"), &v89);
      v61 = v89;

      if (v60)
      {
        v57 = v61;
        v18 = v78;
        v25 = (__CFString *)v85;
        goto LABEL_71;
      }
      _HKInitializeLogging();
      v63 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v68 = *(_QWORD *)(v79 + 32);
        *(_DWORD *)buf = 138543618;
        v97 = v68;
        v98 = 2114;
        v99 = v61;
        _os_log_error_impl(&dword_1B7802000, v63, OS_LOG_TYPE_ERROR, "%{public}@: Failed to store updated database identifier: %{public}@", buf, 0x16u);
      }
      v11 = v61;
      v8 = v83;
      v18 = v78;
      v25 = (__CFString *)v85;
      if (!v11)
      {
LABEL_82:

        v15 = 0;
        goto LABEL_83;
      }
    }
    else
    {
      _HKInitializeLogging();
      v62 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v67 = *(_QWORD *)(v79 + 32);
        *(_DWORD *)buf = 138543618;
        v97 = v67;
        v98 = 2114;
        v99 = v57;
        _os_log_error_impl(&dword_1B7802000, v62, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create or read current sync identity: %{public}@", buf, 0x16u);
      }
      v11 = v57;
      v8 = v83;
      if (!v11)
        goto LABEL_82;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();
    goto LABEL_82;
  }
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v39 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v97 = v39;
    v98 = 2114;
    v99 = 0;
    _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create or read legacy sync identity: %{public}@", buf, 0x16u);
  }
  v11 = 0;
  v15 = 0;
LABEL_86:

  return v15;
}

void __46__HDSyncIdentityManager_profileDidInitialize___block_invoke_229(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 48));
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_identityByEntityPersistentIDCache, 0);
  objc_storeStrong((id *)&self->_entityByIdentityCache, 0);
  objc_storeStrong((id *)&self->_legacySyncIdentity, 0);
  objc_storeStrong((id *)&self->_currentSyncIdentity, 0);
}

@end
