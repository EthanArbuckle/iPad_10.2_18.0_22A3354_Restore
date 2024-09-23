@implementation HDDeviceContextEntity

+ (id)databaseTable
{
  return CFSTR("device_context");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDDeviceContextEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (BOOL)enumerateDeviceContextWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__16;
  v26 = __Block_byref_object_dispose__16;
  v27 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__HDDeviceContextEntity_enumerateDeviceContextWithTransaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6CEAC10;
  v21 = a1;
  v11 = v8;
  v18 = v11;
  v20 = &v22;
  v12 = v9;
  v19 = v12;
  v13 = +[HDSQLiteEntity enumerateEntitiesInDatabase:predicate:error:enumerationHandler:](HDDeviceContextEntity, "enumerateEntitiesInDatabase:predicate:error:enumerationHandler:", v10, 0, a4, v17);
  v14 = (id)v23[5];
  v15 = v14;
  if (v14)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v14);
    else
      _HKLogDroppedError();
  }

  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __88__HDDeviceContextEntity_enumerateDeviceContextWithTransaction_error_enumerationHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  id obj;

  v3 = (void *)a1[4];
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  +[HDDeviceContextEntity _contextForEntity:transaction:error:](v4, a2, v3, (uint64_t)&obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    v7 = a1[5];
    v8 = *(_QWORD *)(a1[6] + 8);
    v11 = *(id *)(v8 + 40);
    v9 = (*(uint64_t (**)(void))(v7 + 16))();
    objc_storeStrong((id *)(v8 + 40), v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_contextForEntity:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__16;
  v20 = __Block_byref_object_dispose__16;
  v21 = 0;
  +[HDDeviceContextEntity _propertiesForEntity]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unprotectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__HDDeviceContextEntity__contextForEntity_transaction_error___block_invoke;
  v13[3] = &unk_1E6CEAC78;
  v10 = v7;
  v14 = v10;
  v15 = &v16;
  LOBYTE(a4) = objc_msgSend(v6, "getValuesForProperties:database:error:handler:", v8, v9, a4, v13);

  if ((a4 & 1) != 0)
    v11 = (id)v17[5];
  else
    v11 = 0;

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (id)insertDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "syncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "insertOrLookupConcreteIdentityForIdentity:transaction:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "unprotectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDeviceContextEntity _propertiesForEntity]();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__HDDeviceContextEntity_insertDeviceContext_transaction_error___block_invoke;
    v17[3] = &unk_1E6CE89A8;
    v18 = v11;
    v19 = v8;
    objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v12, v13, a5, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, CFSTR("Failed to create/lookup concrete sync identity while inserting device context"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v16)
    {
      if (a5)
      {
        v13 = objc_retainAutorelease(v16);
        v14 = 0;
        *a5 = v13;
      }
      else
      {
        _HKLogDroppedError();
        v14 = 0;
      }
      v12 = v13;
    }
    else
    {
      v12 = 0;
      v14 = 0;
    }
  }

  return v14;
}

+ (id)_propertiesForEntity
{
  _QWORD v1[7];

  v1[6] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("sync_identity_id");
  v1[1] = CFSTR("device_type");
  v1[2] = CFSTR("currentOS_name");
  v1[3] = CFSTR("currentOS_version");
  v1[4] = CFSTR("product_type_name");
  v1[5] = CFSTR("date_modified");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __63__HDDeviceContextEntity_insertDeviceContext_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double Current;

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_identity_id"), objc_msgSend(v4, "persistentID"));

  MEMORY[0x1BCCAB114](a2, CFSTR("device_type"), objc_msgSend(*(id *)(a1 + 40), "type"));
  objc_msgSend(*(id *)(a1 + 40), "currentOSName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("currentOS_name"), v5);

  v6 = *(void **)(a1 + 40);
  if (v6)
    objc_msgSend(v6, "currentOSVersion");
  HKNSOperatingSystemVersionString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("currentOS_version"), v7);

  objc_msgSend(*(id *)(a1 + 40), "productTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("product_type_name"), v8);

  Current = CFAbsoluteTimeGetCurrent();
  return MEMORY[0x1BCCAB0F0](a2, CFSTR("date_modified"), Current);
}

+ (BOOL)deleteDeviceContextWithSyncIdentity:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[HDDeviceContextEntity _predicateForSyncEntityIdentity:]((uint64_t)a1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDDeviceContextEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v9, v10, a5);
  return (char)a5;
}

+ (id)_predicateForSyncEntityIdentity:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("sync_identity_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)deviceContextForLocalSyncIdentityWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  +[HDDeviceContextEntity _deviceContextWithSyncIdentity:transaction:error:]((uint64_t)a1, objc_msgSend(a3, "currentSyncIdentityPersistentID"), v8, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_deviceContextWithSyncIdentity:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void *)objc_opt_self();
  objc_msgSend(v7, "deviceContextEntityWithSyncIdentity:transaction:error:", a2, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[HDDeviceContextEntity _contextForEntity:transaction:error:]((uint64_t)v7, v8, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)lookupOrCreateDeviceContextForLocalSyncIdentityWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(a3, "syncIdentityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentSyncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lookupOrCreateDeviceContextForSyncIdentity:WithTransaction:error:", v10, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)lookupOrCreateDeviceContextForSyncIdentity:(id)a3 WithTransaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HDDeviceContext *v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceContextEntity _deviceContextWithSyncIdentity:transaction:error:]((uint64_t)a1, objc_msgSend(v10, "persistentID"), v9, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[HDDeviceContext localProductTypeEnumWithError:](HDDeviceContext, "localProductTypeEnumWithError:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = [HDDeviceContext alloc];
      v16 = (int)objc_msgSend(v14, "intValue");
      objc_msgSend(v8, "identity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HDDeviceContext initForLocalDeviceWithType:syncIdentity:](v15, "initForLocalDeviceWithType:syncIdentity:", v16, v17);

      +[HDDeviceContextEntity insertDeviceContext:transaction:error:](HDDeviceContextEntity, "insertDeviceContext:transaction:error:", v12, v9, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_8;
    }
    else
    {
      v12 = 0;
    }
    v12 = v12;
    v13 = v12;
LABEL_8:

    goto LABEL_9;
  }
  v12 = v11;
  v13 = v12;
LABEL_9:

  return v13;
}

+ (id)lookupDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v8 = a4;
  objc_msgSend(a3, "syncIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  +[HDSyncIdentityEntity concreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "concreteIdentityForIdentity:transaction:error:", v9, v8, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDeviceContextEntity _deviceContextWithSyncIdentity:transaction:error:]((uint64_t)a1, objc_msgSend(v11, "persistentID"), v8, (uint64_t)a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)updateSoftwareVersionForDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "syncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncIdentityEntity concreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "concreteIdentityForIdentity:transaction:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "entity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDeviceContextEntity _predicateForSyncEntityIdentity:]((uint64_t)a1, objc_msgSend(v12, "persistentID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = CFSTR("currentOS_version");
    v23[1] = CFSTR("product_type_name");
    v23[2] = CFSTR("date_modified");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "databaseForEntityClass:", a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v14, v13, v15, a5, &__block_literal_global_18);

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "syncIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("No HDConcreteSyncIdentity found with sync identity %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_error:description:", 11, v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v21);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }

  return v16;
}

uint64_t __81__HDDeviceContextEntity_updateSoftwareVersionForDeviceContext_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  double Current;

  objc_msgSend(MEMORY[0x1E0CB6F18], "currentOSVersionStruct");
  HKNSOperatingSystemVersionString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("currentOS_version"), v3);

  objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("product_type_name"), v4);

  Current = CFAbsoluteTimeGetCurrent();
  return MEMORY[0x1BCCAB0F0](a2, CFSTR("date_modified"), Current);
}

+ (BOOL)updateDeviceContext:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "syncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncIdentityEntity concreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "concreteIdentityForIdentity:transaction:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "entity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDeviceContextEntity _predicateForSyncEntityIdentity:]((uint64_t)a1, objc_msgSend(v12, "persistentID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDDeviceContextEntity _propertiesForEntity]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "databaseForEntityClass:", a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__HDDeviceContextEntity_updateDeviceContext_transaction_error___block_invoke;
    v18[3] = &unk_1E6CE89A8;
    v19 = v11;
    v20 = v8;
    v16 = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v14, v13, v15, a5, v18);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __63__HDDeviceContextEntity_updateDeviceContext_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double Current;

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_identity_id"), objc_msgSend(v4, "persistentID"));

  MEMORY[0x1BCCAB114](a2, CFSTR("device_type"), objc_msgSend(*(id *)(a1 + 40), "type"));
  objc_msgSend(*(id *)(a1 + 40), "currentOSName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("currentOS_name"), v5);

  v6 = *(void **)(a1 + 40);
  if (v6)
    objc_msgSend(v6, "currentOSVersion");
  HKNSOperatingSystemVersionString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("currentOS_version"), v7);

  objc_msgSend(*(id *)(a1 + 40), "productTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("product_type_name"), v8);

  Current = CFAbsoluteTimeGetCurrent();
  return MEMORY[0x1BCCAB0F0](a2, CFSTR("date_modified"), Current);
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("sync_identity_id");
  +[HDHealthEntity defaultForeignKey](HDSyncIdentityEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __61__HDDeviceContextEntity__contextForEntity_transaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  HDDeviceContext *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  uint64_t v20;

  v19 = 0uLL;
  v20 = 0;
  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKNSOperatingSystemVersionFromString();

  v3 = HDSQLiteColumnWithNameAsInt64();
  v4 = *(_QWORD *)(a1 + 32);
  v18 = 0;
  +[HDSyncIdentityEntity concreteIdentityForPersistentID:transaction:error:](HDSyncIdentityEntity, "concreteIdentityForPersistentID:transaction:error:", v3, v4, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (v5)
  {
    v7 = [HDDeviceContext alloc];
    v8 = HDSQLiteColumnWithNameAsInt64();
    HDSQLiteColumnWithNameAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v19;
    v17 = v20;
    v13 = -[HDDeviceContext initWithType:productTypeName:currentOSName:currentOSVersion:modificationDate:syncIdentity:](v7, "initWithType:productTypeName:currentOSName:currentOSVersion:modificationDate:syncIdentity:", v8, v9, v10, &v16, v11, v12);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

+ (id)deviceContextEntityWithSyncIdentity:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(v8, "databaseForEntityClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDDeviceContextEntity _predicateForSyncEntityIdentity:]((uint64_t)a1, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
