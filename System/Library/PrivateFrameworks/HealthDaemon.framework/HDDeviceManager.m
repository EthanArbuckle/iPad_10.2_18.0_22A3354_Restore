@implementation HDDeviceManager

- (id)currentDeviceEntityWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__150;
  v15 = __Block_byref_object_dispose__150;
  v16 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__HDDeviceManager_currentDeviceEntityWithError___block_invoke;
  v10[3] = &unk_1E6CEF700;
  v10[4] = self;
  v10[5] = &v11;
  LODWORD(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDeviceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a3, v10);

  if ((_DWORD)a3)
    v7 = (void *)v12[5];
  else
    v7 = 0;
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)deviceEntityForDevice:(id)a3 error:(id *)a4
{
  id v7;
  id WeakRetained;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  if (v7)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__150;
    v22 = __Block_byref_object_dispose__150;
    v23 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__HDDeviceManager_deviceEntityForDevice_error___block_invoke;
    v15[3] = &unk_1E6CE8DD8;
    v17 = &v18;
    v15[4] = self;
    v16 = v7;
    v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDeviceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v9, a4, v15);

    if (v10)
      v11 = (void *)v19[5];
    else
      v11 = 0;
    v13 = v11;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("device"), objc_opt_class(), a2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    v13 = 0;
  }

  return v13;
}

BOOL __47__HDDeviceManager_deviceEntityForDevice_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v6 = (void *)a1[5];
  v7 = *(void **)(a1[4] + 24);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__HDDeviceManager_deviceEntityForDevice_error___block_invoke_2;
  v15[3] = &unk_1E6D01878;
  v8 = v6;
  v9 = a1[4];
  v16 = v8;
  v17 = v9;
  objc_msgSend(v7, "fetchObjectForKey:transaction:error:faultHandler:", v8, a2, a3, v15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
  return v13;
}

- (id)deviceEntityForNoDeviceWithError:(id *)a3
{
  id v5;
  void *v6;
  HDDeviceEntity *v7;
  id WeakRetained;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (self && (v5 = objc_getProperty(self, a2, 32, 1)) != 0)
  {
    v6 = v5;
    v7 = -[HDSQLiteEntity initWithPersistentID:]([HDDeviceEntity alloc], "initWithPersistentID:", objc_msgSend(v5, "longLongValue"));

    return v7;
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__150;
    v19 = __Block_byref_object_dispose__150;
    v20 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__HDDeviceManager_deviceEntityForNoDeviceWithError___block_invoke;
    v14[3] = &unk_1E6CEF700;
    v14[4] = self;
    v14[5] = &v15;
    v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDeviceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v10, a3, v14);

    if (v11)
      v12 = (void *)v16[5];
    else
      v12 = 0;
    v13 = v12;
    _Block_object_dispose(&v15, 8);

    return v13;
  }
}

- (id)deviceForPersistentID:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  id Property;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  if (v7
    && (!self ? (Property = 0) : (Property = objc_getProperty(self, v6, 32, 1)),
        (objc_msgSend(v7, "isEqual:", Property) & 1) == 0))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__150;
    v23 = __Block_byref_object_dispose__150;
    v24 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__HDDeviceManager_deviceForPersistentID_error___block_invoke;
    v16[3] = &unk_1E6CE8DD8;
    v18 = &v19;
    v16[4] = self;
    v11 = v7;
    v17 = v11;
    +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDeviceEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, a4, v16);

    v12 = (void *)v20[5];
    -[HDDeviceManager _noneDevice](self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "isEqual:", v13);

    if ((_DWORD)v12)
    {
      if (self)
      {
        objc_setProperty_atomic_copy(self, v14, v11, 32);
        self = 0;
      }
    }
    else
    {
      self = (HDDeviceManager *)(id)v20[5];
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    self = 0;
  }

  return self;
}

uint64_t __47__HDDeviceManager_deviceForPersistentID_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v6 = (void *)a1[5];
  v7 = *(void **)(a1[4] + 16);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__HDDeviceManager_deviceForPersistentID_error___block_invoke_2;
  v14[3] = &unk_1E6D01850;
  v8 = v6;
  v9 = a1[4];
  v15 = v8;
  v16 = v9;
  objc_msgSend(v7, "fetchObjectForKey:transaction:error:faultHandler:", v8, a2, a3, v14);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return 1;
}

- (id)_noneDevice
{
  if (a1)
  {
    if (qword_1ED552500 != -1)
      dispatch_once(&qword_1ED552500, &__block_literal_global_180);
    a1 = (id)_MergedGlobals_222;
  }
  return a1;
}

id __47__HDDeviceManager_deviceForPersistentID_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  +[HDSQLiteEntity entityWithPersistentID:](HDDeviceEntity, "entityWithPersistentID:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceInHealthDatabase:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __47__HDDeviceManager_deviceEntityForDevice_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v7 = objc_msgSend(WeakRetained, "currentSyncIdentityPersistentID");
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceEntity deviceEntityWithDevice:syncIdentity:healthDatabase:error:](HDDeviceEntity, "deviceEntityWithDevice:syncIdentity:healthDatabase:error:", v5, v7, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HDDeviceManager)initWithProfile:(id)a3
{
  id v5;
  HDDeviceManager *v6;
  HDDeviceManager *v7;
  HDDatabaseValueCache *v8;
  void *v9;
  uint64_t v10;
  HDDatabaseValueCache *devicesByPersistentID;
  HDDatabaseValueCache *v12;
  void *v13;
  uint64_t v14;
  HDDatabaseValueCache *deviceEntitiesByDevice;
  void *v17;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDeviceManager.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)HDDeviceManager;
  v6 = -[HDDeviceManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    v8 = [HDDatabaseValueCache alloc];
    -[HDDeviceManager hk_classNameWithTag:](v7, "hk_classNameWithTag:", CFSTR("devices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HDDatabaseValueCache initWithName:](v8, "initWithName:", v9);
    devicesByPersistentID = v7->_devicesByPersistentID;
    v7->_devicesByPersistentID = (HDDatabaseValueCache *)v10;

    v12 = [HDDatabaseValueCache alloc];
    -[HDDeviceManager hk_classNameWithTag:](v7, "hk_classNameWithTag:", CFSTR("entities"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDDatabaseValueCache initWithName:](v12, "initWithName:", v13);
    deviceEntitiesByDevice = v7->_deviceEntitiesByDevice;
    v7->_deviceEntitiesByDevice = (HDDatabaseValueCache *)v14;

  }
  return v7;
}

- (HDDeviceManager)init
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

void *__52__HDDeviceManager_deviceEntityForNoDeviceWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *result;
  const char *v14;
  void *v15;
  void *v16;

  -[HDDeviceManager _noneDevice](*(id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v7 = objc_msgSend(WeakRetained, "currentSyncIdentityPersistentID");
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceEntity deviceEntityWithDevice:syncIdentity:healthDatabase:error:](HDDeviceEntity, "deviceEntityWithDevice:syncIdentity:healthDatabase:error:", v5, v7, v9, a3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(result, "persistentID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 32);
    if (v16)
      objc_setProperty_atomic_copy(v16, v14, v15, 32);

    return (void *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0);
  }
  return result;
}

BOOL __48__HDDeviceManager_currentDeviceEntityWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v7 = objc_msgSend(WeakRetained, "currentSyncIdentityPersistentID");
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceEntity deviceEntityWithDevice:syncIdentity:healthDatabase:error:](HDDeviceEntity, "deviceEntityWithDevice:syncIdentity:healthDatabase:error:", v5, v7, v9, a3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (id)deviceEntitiesForDevice:(id)a3 error:(id *)a4
{
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v12;

  v7 = a3;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[HDDeviceEntity deviceEntitiesWithDevice:healthDatabase:error:](HDDeviceEntity, "deviceEntitiesWithDevice:healthDatabase:error:", v7, v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("device"), objc_opt_class(), a2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v12)
    {
      if (a4)
      {
        v9 = objc_retainAutorelease(v12);
        v10 = 0;
        *a4 = v9;
      }
      else
      {
        _HKLogDroppedError();
        v10 = 0;
      }
      WeakRetained = v9;
    }
    else
    {
      WeakRetained = 0;
      v10 = 0;
    }
  }

  return v10;
}

- (id)deviceEntitiesWithProperty:(id)a3 matchingValues:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  id v14;
  void *v15;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (!objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB4C00]);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[HDDeviceEntity deviceEntitiesWithProperty:matchingValues:healthDatabase:error:](HDDeviceEntity, "deviceEntitiesWithProperty:matchingValues:healthDatabase:error:", v9, v11, v14, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("property"), objc_opt_class(), a2);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (v17)
    {
      if (a5)
      {
        v14 = objc_retainAutorelease(v17);
        v15 = 0;
        *a5 = v14;
      }
      else
      {
        _HKLogDroppedError();
        v15 = 0;
      }
      WeakRetained = v14;
    }
    else
    {
      WeakRetained = 0;
      v15 = 0;
    }
  }

  return v15;
}

- (id)devicesWithProperty:(id)a3 matchingValues:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__150;
  v25 = __Block_byref_object_dispose__150;
  v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__HDDeviceManager_devicesWithProperty_matchingValues_error___block_invoke;
  v17[3] = &unk_1E6D018A0;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v20 = &v21;
  LODWORD(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDeviceEntity, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v17);

  if ((_DWORD)a5)
    v14 = (void *)v22[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v21, 8);
  return v15;
}

BOOL __60__HDDeviceManager_devicesWithProperty_matchingValues_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "deviceEntitiesWithProperty:matchingValues:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(WeakRetained, "database");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deviceInHealthDatabase:error:", v12, a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v5 != 0;
}

void __30__HDDeviceManager__noneDevice__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB65C0]), "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", CFSTR("__NONE__"), 0);
  v1 = (void *)_MergedGlobals_222;
  _MergedGlobals_222 = v0;

}

- (id)allDevicesWithError:(id *)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *, _QWORD *);
  void *v14;
  HDDeviceManager *v15;
  id v16;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __39__HDDeviceManager_allDevicesWithError___block_invoke;
  v14 = &unk_1E6CE7950;
  v15 = self;
  v8 = v5;
  v16 = v8;
  LODWORD(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDeviceEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, a3, &v11);

  if ((_DWORD)a3)
  {
    objc_msgSend(v8, "allObjects", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __39__HDDeviceManager_allDevicesWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v25;
  id v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _BYTE v37[128];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "databaseForEntityClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v38[0] = *MEMORY[0x1E0D29618];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity queryWithDatabase:predicate:](HDDeviceEntity, "queryWithDatabase:predicate:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __39__HDDeviceManager_allDevicesWithError___block_invoke_2;
  v34[3] = &unk_1E6CE9FC0;
  v9 = v6;
  v35 = v9;
  v10 = objc_msgSend(v8, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v7, &v36, v34);
  v11 = v36;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v27 = v7;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v14)
    {
      v15 = v14;
      v25 = v5;
      v26 = v4;
      v16 = *(_QWORD *)v31;
      while (2)
      {
        v17 = 0;
        v18 = v12;
        do
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17);
          v20 = *(void **)(a1 + 32);
          v29 = v18;
          objc_msgSend(v20, "deviceForPersistentID:error:", v19, &v29);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v29;

          if (v21)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);
          }
          else if (v12)
          {
            if (a3)
            {
              v12 = objc_retainAutorelease(v12);
              v22 = 0;
              *a3 = v12;
            }
            else
            {
              _HKLogDroppedError();
              v22 = 0;
            }
            goto LABEL_23;
          }

          ++v17;
          v18 = v12;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        if (v15)
          continue;
        break;
      }
      v22 = 1;
LABEL_23:
      v5 = v25;
      v4 = v26;
    }
    else
    {
      v22 = 1;
    }
    v7 = v27;
  }
  else
  {
    v23 = v11;
    v13 = v23;
    if (v23)
    {
      if (a3)
      {
        v13 = objc_retainAutorelease(v23);
        v22 = 0;
        *a3 = v13;
      }
      else
      {
        _HKLogDroppedError();
        v22 = 0;
      }
      v12 = v13;
    }
    else
    {
      v12 = 0;
      v22 = 0;
    }
  }

  return v22;
}

uint64_t __39__HDDeviceManager_allDevicesWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

- (BOOL)deleteDevice:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__HDDeviceManager_deleteDevice_error___block_invoke;
  v11[3] = &unk_1E6CEBC00;
  v12 = v6;
  v9 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDeviceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v8, a4, v11);

  return (char)a4;
}

uint64_t __38__HDDeviceManager_deleteDevice_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  +[HDDeviceEntity deviceEntityWithDevice:transaction:error:](HDDeviceEntity, "deviceEntityWithDevice:transaction:error:", *(_QWORD *)(a1 + 32), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "deleteFromDatabase:error:", v7, a3);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noneDeviceID, 0);
  objc_storeStrong((id *)&self->_deviceEntitiesByDevice, 0);
  objc_storeStrong((id *)&self->_devicesByPersistentID, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
