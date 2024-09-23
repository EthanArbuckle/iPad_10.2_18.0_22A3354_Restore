@implementation HDCachedCKRecordZoneEntity

+ (id)databaseTable
{
  return CFSTR("ck_record_zone_cache");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCKRecordZoneCacheEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("database_id");
  +[HDHealthEntity defaultForeignKey](HDCachedCKDatabaseEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("database_id");
  v3[1] = CFSTR("zone_name");
  v3[2] = CFSTR("owner_name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertWithDatabaseID:(int64_t)a3 zoneName:(id)a4 ownerName:(id)a5 serverChangeToken:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HDCachedCKRecordZoneEntity *v19;
  void *v20;
  id v21;
  int v22;
  HDCachedCKRecordZoneEntity *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  int64_t v30;
  _QWORD v31[5];

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v19 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v17, "databaseForEntityClass:", a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = a3;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __106__HDCachedCKRecordZoneEntity_insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = a1;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __106__HDCachedCKRecordZoneEntity_insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error___block_invoke_2;
  v26[3] = &unk_1E6CE9118;
  v27 = v14;
  v28 = v15;
  v21 = v18;
  v29 = v21;
  v22 = objc_msgSend(v20, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error__lookupKey, a8, v31, v26, 0);
  v19 = 0;
  if (v22)
  {
    v23 = [HDCachedCKRecordZoneEntity alloc];
    objc_msgSend(v20, "lastInsertRowID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDSQLiteEntity initWithPersistentID:](v23, "initWithPersistentID:", objc_msgSend(v24, "longLongValue"));

  }
LABEL_8:

  return v19;
}

id __106__HDCachedCKRecordZoneEntity_insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)objc_opt_self();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v0, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?)"), v2, CFSTR("database_id"), CFSTR("zone_name"), CFSTR("owner_name"), CFSTR("server_change_token"), CFSTR("needs_fetch"), CFSTR("zone_state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __106__HDCachedCKRecordZoneEntity_insertWithDatabaseID_zoneName_ownerName_serverChangeToken_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 6, 0);
}

+ (BOOL)updateServerChangeToken:(id)a3 databaseID:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v14)
  {
    v18 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
LABEL_5:
    objc_msgSend(v17, "databaseForEntityClass:", a1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HDPredicateForDatabaseIDAndRecordZone(a4, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = CFSTR("server_change_token");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __102__HDCachedCKRecordZoneEntity_updateServerChangeToken_databaseID_zoneName_ownerName_transaction_error___block_invoke;
    v25[3] = &unk_1E6CE84C8;
    v26 = v18;
    v23 = v18;
    v19 = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v22, v21, v20, a8, v25);

    goto LABEL_6;
  }
  v19 = 0;
LABEL_6:

  return v19;
}

void __102__HDCachedCKRecordZoneEntity_updateServerChangeToken_databaseID_zoneName_ownerName_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0D8);
}

+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 userRecordName:(id)a7 serverChangeToken:(id)a8 fetchComplete:(id)a9 profile:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int64_t v39;
  id v40;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  objc_msgSend(a10, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __162__HDCachedCKRecordZoneEntity_insertOrUpdateWithContainerIdentifier_databaseScope_zoneName_ownerName_userRecordName_serverChangeToken_fetchComplete_profile_error___block_invoke;
  v32[3] = &unk_1E6CE9140;
  v33 = v16;
  v34 = v19;
  v35 = v17;
  v36 = v18;
  v39 = a4;
  v40 = a1;
  v37 = v20;
  v38 = v21;
  v23 = v21;
  v24 = v20;
  v25 = v18;
  v26 = v17;
  v27 = v19;
  v28 = v16;
  v29 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performWriteTransactionWithHealthDatabase:error:block:", v22, a11, v32);

  return v29;
}

BOOL __162__HDCachedCKRecordZoneEntity_insertOrUpdateWithContainerIdentifier_databaseScope_zoneName_ownerName_userRecordName_serverChangeToken_fetchComplete_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v22;
  id v23;

  v5 = a2;
  +[HDCachedCKDatabaseEntity entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:](HDCachedCKDatabaseEntity, "entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), v5, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    HDPredicateForDatabaseIDAndRecordZone(objc_msgSend(v6, "persistentID"), *(void **)(a1 + 48), *(void **)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 88));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKRecordZoneEntity, "anyInDatabase:predicate:error:", v9, v8, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v23;

    if (v10)
      v12 = 1;
    else
      v12 = v11 == 0;
    if (!v12)
    {
      if (a3)
      {
        v14 = v11;
LABEL_13:
        v11 = objc_retainAutorelease(v14);
        v10 = 0;
        v13 = 0;
        *a3 = v11;
LABEL_25:

        goto LABEL_26;
      }
      _HKLogDroppedError();
      v10 = 0;
LABEL_19:
      v13 = 0;
      goto LABEL_25;
    }
    if (v10)
    {
      if (!+[HDCachedCKRecordZoneEntity updateServerChangeToken:databaseID:zoneName:ownerName:transaction:error:](HDCachedCKRecordZoneEntity, "updateServerChangeToken:databaseID:zoneName:ownerName:transaction:error:", *(_QWORD *)(a1 + 64), objc_msgSend(v7, "persistentID"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5, a3))goto LABEL_19;
    }
    else
    {
      v15 = objc_msgSend(v7, "persistentID");
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 64);
      v22 = v11;
      +[HDCachedCKRecordZoneEntity insertWithDatabaseID:zoneName:ownerName:serverChangeToken:transaction:error:](HDCachedCKRecordZoneEntity, "insertWithDatabaseID:zoneName:ownerName:serverChangeToken:transaction:error:", v15, v16, v17, v18, v5, &v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v22;

      if (!v10 && v19)
      {
        if (!a3)
        {
          _HKLogDroppedError();
          v10 = 0;
          v13 = 0;
          v11 = v19;
          goto LABEL_25;
        }
        v14 = v19;
        goto LABEL_13;
      }
      v11 = v19;
    }
    v20 = *(void **)(a1 + 72);
    if (v20)
      v13 = +[HDCachedCKRecordZoneEntity setRequiresFetch:containerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](HDCachedCKRecordZoneEntity, "setRequiresFetch:containerIdentifier:databaseScope:zoneName:ownerName:transaction:error:", objc_msgSend(v20, "BOOLValue") ^ 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5, a3);
    else
      v13 = 1;
    goto LABEL_25;
  }
  v13 = 0;
LABEL_26:

  return v13;
}

+ (BOOL)insertIfDoesNotExistWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 userRecordName:(id)a7 serverChangeToken:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  int64_t v35;
  id v36;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  objc_msgSend(a9, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __154__HDCachedCKRecordZoneEntity_insertIfDoesNotExistWithContainerIdentifier_databaseScope_zoneName_ownerName_userRecordName_serverChangeToken_profile_error___block_invoke;
  v29[3] = &unk_1E6CE9168;
  v30 = v16;
  v31 = v19;
  v32 = v17;
  v33 = v18;
  v35 = a4;
  v36 = a1;
  v34 = v20;
  v22 = v20;
  v23 = v18;
  v24 = v17;
  v25 = v19;
  v26 = v16;
  v27 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performWriteTransactionWithHealthDatabase:error:block:", v21, a10, v29);

  return v27;
}

uint64_t __154__HDCachedCKRecordZoneEntity_insertIfDoesNotExistWithContainerIdentifier_databaseScope_zoneName_ownerName_userRecordName_serverChangeToken_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v21;
  id v22;

  v5 = a2;
  +[HDCachedCKDatabaseEntity entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:](HDCachedCKDatabaseEntity, "entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), v5, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    HDPredicateForDatabaseIDAndRecordZone(objc_msgSend(v6, "persistentID"), *(void **)(a1 + 48), *(void **)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 80));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKRecordZoneEntity, "anyInDatabase:predicate:error:", v9, v8, &v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;

    if (v10)
      v12 = 1;
    else
      v12 = v11 == 0;
    if (!v12)
    {
      if (!a3)
      {
        _HKLogDroppedError();
        v13 = 0;
        v10 = 0;
        goto LABEL_20;
      }
      v14 = v11;
      goto LABEL_12;
    }
    if (v10)
    {
      v13 = 1;
LABEL_20:

      goto LABEL_21;
    }
    v15 = objc_msgSend(v7, "persistentID");
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 64);
    v21 = v11;
    +[HDCachedCKRecordZoneEntity insertWithDatabaseID:zoneName:ownerName:serverChangeToken:transaction:error:](HDCachedCKRecordZoneEntity, "insertWithDatabaseID:zoneName:ownerName:serverChangeToken:transaction:error:", v15, v16, v17, v18, v5, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;

    v13 = 1;
    if (!v10 && v19)
    {
      if (a3)
      {
        v14 = v19;
LABEL_12:
        v11 = objc_retainAutorelease(v14);
        v13 = 0;
        v10 = 0;
        *a3 = v11;
        goto LABEL_20;
      }
      _HKLogDroppedError();
      v13 = 0;
      v10 = 0;
    }
    v11 = v19;
    goto LABEL_20;
  }
  v13 = 0;
LABEL_21:

  return v13;
}

+ (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  int64_t v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__8;
  v36 = __Block_byref_object_dispose__8;
  v37 = 0;
  objc_msgSend(v17, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __117__HDCachedCKRecordZoneEntity_serverChangeTokenForContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke;
  v25[3] = &unk_1E6CE9190;
  v19 = v14;
  v26 = v19;
  v30 = a4;
  v31 = a1;
  v20 = v15;
  v27 = v20;
  v21 = v16;
  v28 = v21;
  v29 = &v32;
  LODWORD(a8) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performReadTransactionWithHealthDatabase:error:block:", v18, a8, v25);

  if ((_DWORD)a8)
    v22 = (void *)v33[5];
  else
    v22 = 0;
  v23 = v22;

  _Block_object_dispose(&v32, 8);
  return v23;
}

uint64_t __117__HDCachedCKRecordZoneEntity_serverChangeTokenForContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;
  id v24;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 64);
  v24 = 0;
  +[HDCachedCKDatabaseEntity entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:](HDCachedCKDatabaseEntity, "entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:", v6, v7, 0, v5, 0, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    if (v8)
    {
      v12 = *(void **)(a1 + 72);
      objc_msgSend(v5, "databaseForEntityClass:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HDPredicateForDatabaseIDAndRecordZone(objc_msgSend(v8, "persistentID"), *(void **)(a1 + 40), *(void **)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v12, "propertyValueForAnyInDatabase:property:predicate:error:", v13, CFSTR("server_change_token"), v14, &v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v23;

      if (v15)
        v17 = 1;
      else
        v17 = v16 == 0;
      v18 = v17;
      if (v17)
      {
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, a3);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

        }
      }
      else if (a3)
      {
        *a3 = objc_retainAutorelease(v16);
      }
      else
      {
        _HKLogDroppedError();
      }

    }
    else
    {
      v18 = 1;
    }
  }
  else if (a3)
  {
    v18 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    _HKLogDroppedError();
    v18 = 0;
  }

  return v18;
}

+ (BOOL)enumerateCKRecordZoneIDsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 profile:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  int64_t v21;
  id v22;

  v12 = a3;
  v13 = a7;
  objc_msgSend(a5, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __125__HDCachedCKRecordZoneEntity_enumerateCKRecordZoneIDsWithContainerIdentifier_databaseScope_profile_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E6CE91E0;
  v21 = a4;
  v22 = a1;
  v19 = v12;
  v20 = v13;
  v15 = v13;
  v16 = v12;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKDatabaseEntity, "performReadTransactionWithHealthDatabase:error:block:", v14, a6, v18);

  return (char)a6;
}

uint64_t __125__HDCachedCKRecordZoneEntity_enumerateCKRecordZoneIDsWithContainerIdentifier_databaseScope_profile_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v21 = 0;
  +[HDCachedCKDatabaseEntity entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:](HDCachedCKDatabaseEntity, "entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:", v6, v7, 0, v5, 0, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    if (v8)
    {
      v12 = *(void **)(a1 + 56);
      objc_msgSend(v5, "databaseForEntityClass:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HDPredicateForDatabaseID(objc_msgSend(v8, "persistentID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queryWithDatabase:predicate:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = CFSTR("zone_name");
      v22[1] = CFSTR("owner_name");
      v22[2] = CFSTR("needs_fetch");
      v22[3] = CFSTR("zone_state");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __125__HDCachedCKRecordZoneEntity_enumerateCKRecordZoneIDsWithContainerIdentifier_databaseScope_profile_error_enumerationHandler___block_invoke_2;
      v19[3] = &unk_1E6CE91B8;
      v20 = *(id *)(a1 + 40);
      v17 = objc_msgSend(v15, "enumerateProperties:error:enumerationHandler:", v16, a3, v19);

    }
    else
    {
      v17 = 1;
    }
  }
  else if (a3)
  {
    v17 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    _HKLogDroppedError();
    v17 = 0;
  }

  return v17;
}

uint64_t __125__HDCachedCKRecordZoneEntity_enumerateCKRecordZoneIDsWithContainerIdentifier_databaseScope_profile_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsBoolean();
  HDSQLiteColumnWithNameAsInt64();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v2, v3);
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v5;
}

+ (BOOL)deleteZoneWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  int64_t v26;
  id v27;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  objc_msgSend(a7, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __111__HDCachedCKRecordZoneEntity_deleteZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke;
  v22[3] = &unk_1E6CE9208;
  v23 = v14;
  v24 = v15;
  v25 = v16;
  v26 = a4;
  v27 = a1;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  LOBYTE(a8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performWriteTransactionWithHealthDatabase:error:block:", v17, a8, v22);

  return (char)a8;
}

uint64_t __111__HDCachedCKRecordZoneEntity_deleteZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  v23 = 0;
  +[HDCachedCKDatabaseEntity entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:](HDCachedCKDatabaseEntity, "entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:", v6, v7, 0, v5, 0, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    if (v8)
    {
      HDPredicateForDatabaseIDAndRecordZone(objc_msgSend(v8, "persistentID"), *(void **)(a1 + 40), *(void **)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKRecordZoneEntity, "anyInDatabase:predicate:error:", v13, v12, &v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v22;

      if (v14)
        v16 = 1;
      else
        v16 = v15 == 0;
      if (v16)
      {
        v17 = *(void **)(a1 + 64);
        objc_msgSend(v5, "databaseForEntityClass:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21.receiver = v17;
        v21.super_class = (Class)&OBJC_METACLASS___HDCachedCKRecordZoneEntity;
        v19 = (uint64_t)objc_msgSendSuper2(&v21, sel_deleteEntitiesInDatabase_predicate_error_, v18, v12, a3);

      }
      else if (a3)
      {
        v19 = 0;
        *a3 = objc_retainAutorelease(v15);
      }
      else
      {
        _HKLogDroppedError();
        v19 = 0;
      }

    }
    else
    {
      v19 = 1;
    }
  }
  else if (a3)
  {
    v19 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    _HKLogDroppedError();
    v19 = 0;
  }

  return v19;
}

+ (int64_t)requiresFetchForZoneWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  int v24;
  int64_t v25;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  id v37[2];

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v37[0] = 0;
  +[HDCachedCKDatabaseEntity entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:](HDCachedCKDatabaseEntity, "entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:", v14, a4, 0, v17, 0, v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v37[0];
  v20 = v19;
  if (v18)
    v21 = 1;
  else
    v21 = v19 == 0;
  if (v21)
  {
    if (v18)
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      objc_msgSend(v17, "databaseForEntityClass:", a1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke;
      v32[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v32[4] = a1;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_2;
      v28[3] = &unk_1E6CE7C30;
      v29 = v18;
      v30 = v15;
      v31 = v16;
      v27[0] = v23;
      v27[1] = 3221225472;
      v27[2] = __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_3;
      v27[3] = &unk_1E6CE8540;
      v27[4] = &v33;
      v24 = objc_msgSend(v22, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error__fetchKey, a8, v32, v28, v27);

      if (v24)
      {
        if (*((_BYTE *)v34 + 24))
          v25 = 1;
        else
          v25 = 2;
      }
      else
      {
        v25 = 0;
      }

      _Block_object_dispose(&v33, 8);
    }
    else
    {
      v25 = 1;
    }
  }
  else if (a8)
  {
    v25 = 0;
    *a8 = objc_retainAutorelease(v19);
  }
  else
  {
    _HKLogDroppedError();
    v25 = 0;
  }

  return v25;
}

id __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ?"), CFSTR("needs_fetch"), v2, CFSTR("database_id"), CFSTR("zone_name"), CFSTR("owner_name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __125__HDCachedCKRecordZoneEntity_requiresFetchForZoneWithContainerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MEMORY[0x1BCCAB174](a2, 0);
  return 1;
}

+ (BOOL)setRequiresFetch:(BOOL)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 zoneName:(id)a6 ownerName:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  char v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v31 = 0;
  +[HDCachedCKDatabaseEntity entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:](HDCachedCKDatabaseEntity, "entityForContainerIdentifier:databaseScope:userRecordName:transaction:shouldCreate:error:", a4, a5, 0, v17, 0, &v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v31;
  v20 = v19;
  if (v18)
    v21 = 1;
  else
    v21 = v19 == 0;
  if (!v21)
  {
    if (a9)
    {
      v23 = 0;
      *a9 = objc_retainAutorelease(v19);
      goto LABEL_13;
    }
    _HKLogDroppedError();
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a9, 118, CFSTR("No such database."));
    goto LABEL_12;
  }
  objc_msgSend(v17, "databaseForEntityClass:", a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __118__HDCachedCKRecordZoneEntity_setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke;
  v30[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v30[4] = a1;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __118__HDCachedCKRecordZoneEntity_setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_2;
  v25[3] = &unk_1E6CE9230;
  v29 = a3;
  v26 = v18;
  v27 = v15;
  v28 = v16;
  v23 = objc_msgSend(v22, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error__updateKey, a9, v30, v25, 0);

LABEL_13:
  return v23;
}

id __118__HDCachedCKRecordZoneEntity_setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ?"), v2, CFSTR("needs_fetch"), CFSTR("database_id"), CFSTR("zone_name"), CFSTR("owner_name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __118__HDCachedCKRecordZoneEntity_setRequiresFetch_containerIdentifier_databaseScope_zoneName_ownerName_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(unsigned __int8 *)(a1 + 56));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)setZoneEntityState:(int64_t)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 zoneName:(id)a6 ownerName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  id v29;
  int64_t v30;

  v15 = a4;
  v16 = a6;
  v17 = a7;
  objc_msgSend(a8, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke;
  v24[3] = &unk_1E6CE9258;
  v29 = a1;
  v30 = a3;
  v25 = v15;
  v26 = v16;
  v27 = v17;
  v28 = a5;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performWriteTransactionWithHealthDatabase:error:block:", v18, a9, v24);

  return v22;
}

uint64_t __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;

  v5 = a2;
  HDPredicateForContainerIdentifierAndDatabaseScope(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKDatabaseEntity, "anyInDatabase:predicate:error:", v7, v6, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;

  if (v8)
    v10 = 1;
  else
    v10 = v9 == 0;
  if (!v10)
  {
    if (a3)
    {
      v13 = 0;
      *a3 = objc_retainAutorelease(v9);
      goto LABEL_13;
    }
    _HKLogDroppedError();
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 118, CFSTR("No such database."));
    goto LABEL_12;
  }
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke_2;
  v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v12 = *(_QWORD *)(a1 + 72);
  v20[4] = *(_QWORD *)(a1 + 64);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke_3;
  v15[3] = &unk_1E6CE9118;
  v19 = v12;
  v16 = v8;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v13 = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCachedCKRecordZoneEntityZoneState_block_invoke_updateKey, a3, v20, v15, 0);

LABEL_13:
  return v13;
}

id __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ?"), v2, CFSTR("zone_state"), CFSTR("database_id"), CFSTR("zone_name"), CFSTR("owner_name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __116__HDCachedCKRecordZoneEntity_setZoneEntityState_containerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 56));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

@end
