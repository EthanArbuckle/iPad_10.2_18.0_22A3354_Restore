@implementation HDDeviceKeyValueStorageEntryEntity

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDDeviceKeyValueStorageEntryEntityColumnDefinitions;
}

+ (id)fetchEntriesForKeys:(id)a3 domain:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__148;
  v29 = __Block_byref_object_dispose__148;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v12, "databaseForEntityClass:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForKeys:domain:", v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_propertiesForEntity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__HDDeviceKeyValueStorageEntryEntity_fetchEntriesForKeys_domain_transaction_error___block_invoke;
  v21[3] = &unk_1E6D014D0;
  v17 = v12;
  v22 = v17;
  v23 = &v25;
  v24 = a1;
  LODWORD(a6) = objc_msgSend(v15, "enumerateProperties:error:enumerationHandler:", v16, a6, v21);

  if ((_DWORD)a6)
    v18 = (void *)v26[5];
  else
    v18 = 0;
  v19 = v18;

  _Block_object_dispose(&v25, 8);
  return v19;
}

BOOL __83__HDDeviceKeyValueStorageEntryEntity_fetchEntriesForKeys_domain_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  HDDeviceKeyValueStorageEntry *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDDeviceKeyValueStorageEntry *v14;

  +[HDSyncIdentityEntity concreteIdentityForPersistentID:transaction:error:](HDSyncIdentityEntity, "concreteIdentityForPersistentID:transaction:error:", HDSQLiteColumnWithNameAsInt64(), *(_QWORD *)(a1 + 32), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    v7 = objc_msgSend(v6, "isEqual:", objc_opt_class()) ^ 1;
    v8 = [HDDeviceKeyValueStorageEntry alloc];
    HDSQLiteColumnWithNameAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:syncIdentity:category:](v8, "initWithDomain:key:value:modificationDate:syncIdentity:category:", v9, v10, v11, v12, v13, v7);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v14);
  }

  return v5 != 0;
}

+ (BOOL)enumerateAllEntriesForSyncIdentity:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "databaseForEntityClass:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncIdentityEntity concreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "concreteIdentityForIdentity:transaction:error:", v12, v11, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke;
    v24[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v24[4] = a1;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke_2;
    v22[3] = &unk_1E6CE9508;
    v23 = v14;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke_3;
    v18[3] = &unk_1E6D014F8;
    v21 = a1;
    v19 = v23;
    v20 = v10;
    v16 = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler__lookupKey, a5, v24, v22, v18);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("domain"), CFSTR("key"), CFSTR("value"), CFSTR("date_modified"), CFSTR("sync_identity_id"), v2, CFSTR("sync_identity_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 1, objc_msgSend(v3, "persistentID"));

}

uint64_t __110__HDDeviceKeyValueStorageEntryEntity_enumerateAllEntriesForSyncIdentity_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  HDDeviceKeyValueStorageEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HDDeviceKeyValueStorageEntry *v10;

  v2 = (void *)objc_opt_class();
  v3 = objc_msgSend(v2, "isEqual:", objc_opt_class()) ^ 1;
  v4 = [HDDeviceKeyValueStorageEntry alloc];
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsData();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:syncIdentity:category:](v4, "initWithDomain:key:value:modificationDate:syncIdentity:category:", v5, v6, v7, v8, v9, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return 1;
}

+ (id)fetchEntryForKey:(id)a3 domain:(id)a4 syncEntityIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  int64_t v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__148;
  v36 = __Block_byref_object_dispose__148;
  v37 = 0;
  objc_msgSend(v14, "databaseForEntityClass:", a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = a1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke_2;
  v27[3] = &unk_1E6CF0080;
  v17 = v13;
  v28 = v17;
  v18 = v12;
  v29 = v18;
  v30 = a5;
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke_3;
  v23[3] = &unk_1E6D01520;
  v19 = v14;
  v24 = v19;
  v25 = &v32;
  v26 = a1;
  if (objc_msgSend(v15, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &fetchEntryForKey_domain_syncEntityIdentity_transaction_error__lookupKey, a7, v31, v27, v23))v20 = (void *)v33[5];
  else
    v20 = 0;
  v21 = v20;

  _Block_object_dispose(&v32, 8);
  return v21;
}

id __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ?"), CFSTR("domain"), CFSTR("key"), CFSTR("value"), CFSTR("date_modified"), CFSTR("sync_identity_id"), v2, CFSTR("domain"), CFSTR("key"), CFSTR("sync_identity_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 48));
}

BOOL __99__HDDeviceKeyValueStorageEntryEntity_fetchEntryForKey_domain_syncEntityIdentity_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  HDDeviceKeyValueStorageEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  +[HDSyncIdentityEntity concreteIdentityForPersistentID:transaction:error:](HDSyncIdentityEntity, "concreteIdentityForPersistentID:transaction:error:", HDSQLiteColumnWithNameAsInt64(), *(_QWORD *)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [HDDeviceKeyValueStorageEntry alloc];
    HDSQLiteColumnWithNameAsString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsData();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_class();
    v12 = -[HDDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:syncIdentity:category:](v5, "initWithDomain:key:value:modificationDate:syncIdentity:category:", v6, v7, v8, v9, v10, objc_msgSend(v11, "isEqual:", objc_opt_class()) ^ 1);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  return v4 != 0;
}

+ (BOOL)replaceEntriesForOldSyncIdentity:(int64_t)a3 withNewSyncIdentity:(int64_t)a4 deviceContextID:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  _QWORD v21[7];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v22[0] = CFSTR("sync_identity_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

  v16 = (void *)objc_opt_class();
  if (objc_msgSend(v16, "isEqual:", objc_opt_class()))
    objc_msgSend(v15, "addObject:", CFSTR("device_record_id"));
  objc_msgSend(v12, "databaseForEntityClass:", a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForSyncEntityIdentity:domain:keys:", a3, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __125__HDDeviceKeyValueStorageEntryEntity_replaceEntriesForOldSyncIdentity_withNewSyncIdentity_deviceContextID_transaction_error___block_invoke;
  v21[3] = &__block_descriptor_56_e34_v16__0__HDSQLiteStatementBinder__8l;
  v21[4] = a1;
  v21[5] = a4;
  v21[6] = a5;
  v19 = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v15, v18, v17, a7, v21);

  return v19;
}

uint64_t __125__HDDeviceKeyValueStorageEntryEntity_replaceEntriesForOldSyncIdentity_withNewSyncIdentity_deviceContextID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "binderHandlerForBinder:syncEntityIdentity:deviceContext:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (int)setData:(id)a3 forKey:(id)a4 domain:(id)a5 deviceContextID:(int64_t)a6 syncEntityIdentity:(int64_t)a7 modificationDate:(id)a8 transaction:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  int64_t v48;
  int64_t v49;
  id v50;
  id v51;
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  if (v16)
  {
    v50 = 0;
    objc_msgSend(a1, "fetchEntryForKey:domain:syncEntityIdentity:transaction:error:", v17, v18, a7, v20, &v50);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v50;
    if (v21 || !v22)
    {
      v38 = v22;
      if (v21)
      {
        v36 = v19;
        objc_msgSend(v21, "value");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqual:", v16);

        if (v27)
        {
          _HKInitializeLogging();
          v28 = *MEMORY[0x1E0CB5370];
          v24 = 2;
          v19 = v36;
          v23 = v38;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v21;
            _os_log_debug_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEBUG, "Value unchanged for entry %@, skipping.", buf, 0xCu);
          }
          goto LABEL_15;
        }
        v52[0] = CFSTR("value");
        v52[1] = CFSTR("date_modified");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_predicateForSyncEntityIdentity:domain:keys:", a7, v18, v33);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "databaseForEntityClass:", a1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __130__HDDeviceKeyValueStorageEntryEntity_setData_forKey_domain_deviceContextID_syncEntityIdentity_modificationDate_transaction_error___block_invoke_223;
        v39[3] = &unk_1E6CE89A8;
        v40 = v16;
        v41 = v36;
        v24 = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v35, v30, v31, a10, v39);

        v19 = v36;
      }
      else
      {
        objc_msgSend(v20, "databaseForEntityClass:", a1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_propertiesForEntity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __130__HDDeviceKeyValueStorageEntryEntity_setData_forKey_domain_deviceContextID_syncEntityIdentity_modificationDate_transaction_error___block_invoke;
        v42[3] = &unk_1E6D01568;
        v47 = a1;
        v43 = v17;
        v44 = v18;
        v45 = v16;
        v48 = a7;
        v49 = a6;
        v46 = v19;
        objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v37, v34, a10, v42);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = v29 != 0;
      }
      v23 = v38;
    }
    else
    {
      v23 = v22;
      if (a10)
      {
        v24 = 0;
        *a10 = objc_retainAutorelease(v22);
      }
      else
      {
        _HKLogDroppedError();
        v24 = 0;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v55[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(a1, "removeEntitesForKeys:domain:syncEntityIdentity:transaction:error:", v25, v18, a7, v20, a10);

LABEL_16:
  return v24;
}

uint64_t __130__HDDeviceKeyValueStorageEntryEntity_setData_forKey_domain_deviceContextID_syncEntityIdentity_modificationDate_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 64), "binderHandlerForBinder:key:domain:object:syncEntityIdentity:deviceContext:modificationDate:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
}

void __130__HDDeviceKeyValueStorageEntryEntity_setData_forKey_domain_deviceContextID_syncEntityIdentity_modificationDate_transaction_error___block_invoke_223(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB0D8](a2, CFSTR("value"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  JUMPOUT(0x1BCCAB0F0);
}

+ (BOOL)removeEntitesForKeys:(id)a3 domain:(id)a4 syncEntityIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a4;
  v13 = a3;
  objc_msgSend(a6, "databaseForEntityClass:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForSyncEntityIdentity:domain:keys:", a5, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a7) = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v14, v15, a7);
  return (char)a7;
}

+ (id)_propertiesForEntity
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sync_identity_id");
  v3[1] = CFSTR("domain");
  v3[2] = CFSTR("key");
  v3[3] = CFSTR("value");
  v3[4] = CFSTR("date_modified");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_predicateForKeys:(id)a3 domain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_predicateForAnyKeys:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("domain"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0D29840];
    v13[0] = v7;
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateMatchingAllPredicates:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v8;
  }

  return v11;
}

+ (id)_predicateForAnyKeys:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("key"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_predicateForSyncEntityIdentity:(int64_t)a3 domain:(id)a4 keys:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithProperty:equalToValue:", CFSTR("sync_identity_id"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithArray:", v14);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("domain"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  if (v9)
  {
    objc_msgSend(a1, "_predicateForAnyKeys:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("secure_kv_device_storage");
}

+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 key:(id)a4 domain:(id)a5 object:(id)a6 syncEntityIdentity:(int64_t)a7 deviceContext:(int64_t)a8 modificationDate:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;

  v14 = a9;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  MEMORY[0x1BCCAB114](a3, CFSTR("sync_identity_id"), a7);
  MEMORY[0x1BCCAB144](a3, CFSTR("domain"), v16);

  MEMORY[0x1BCCAB144](a3, CFSTR("key"), v17);
  MEMORY[0x1BCCAB0D8](a3, CFSTR("value"), v15);

  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  JUMPOUT(0x1BCCAB0F0);
}

+ (void)binderHandlerForBinder:(HDSQLiteStatementBinder *)a3 syncEntityIdentity:(int64_t)a4 deviceContext:(int64_t)a5
{
  JUMPOUT(0x1BCCAB114);
}

@end
