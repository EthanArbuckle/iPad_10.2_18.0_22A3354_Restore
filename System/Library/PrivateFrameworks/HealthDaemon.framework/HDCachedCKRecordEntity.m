@implementation HDCachedCKRecordEntity

+ (id)databaseTable
{
  return CFSTR("ck_record_cache");
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCKRecordCacheEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("zone_id");
  +[HDHealthEntity defaultForeignKey](HDCachedCKRecordZoneEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("zone_id");
  v3[1] = CFSTR("record_name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertWithZoneID:(int64_t)a3 recordType:(id)a4 epoch:(int64_t)a5 recordName:(id)a6 recordData:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  HDCachedCKRecordEntity *v22;
  HDCachedCKRecordEntity *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, sqlite3_stmt *);
  void *v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  int64_t v34;
  _QWORD v35[5];

  v15 = a4;
  v16 = a6;
  v17 = a7;
  objc_msgSend(a8, "databaseForEntityClass:", a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __100__HDCachedCKRecordEntity_insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error___block_invoke;
  v35[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v35[4] = a1;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __100__HDCachedCKRecordEntity_insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error___block_invoke_2;
  v29 = &unk_1E6D007C8;
  v33 = a3;
  v19 = v15;
  v30 = v19;
  v34 = a5;
  v20 = v16;
  v31 = v20;
  v21 = v17;
  v32 = v21;
  v22 = 0;
  if (objc_msgSend(v18, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error__lookupKey, a9, v35, &v26, 0))
  {
    v23 = [HDCachedCKRecordEntity alloc];
    objc_msgSend(v18, "lastInsertRowID", v26, v27, v28, v29, v30, v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HDSQLiteEntity initWithPersistentID:](v23, "initWithPersistentID:", objc_msgSend(v24, "longLongValue"));

  }
  return v22;
}

id __100__HDCachedCKRecordEntity_insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)objc_opt_self();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v0, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?)"), v2, CFSTR("zone_id"), CFSTR("record_type"), CFSTR("epoch"), CFSTR("record_name"), CFSTR("record_data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __100__HDCachedCKRecordEntity_insertWithZoneID_recordType_epoch_recordName_recordData_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 64));
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)updateWithRecordData:(id)a3 epoch:(int64_t)a4 zoneID:(int64_t)a5 recordName:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  int64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  objc_msgSend(a7, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HDPredicateForZoneIDAndRecordName(a5, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = CFSTR("epoch");
  v24[1] = CFSTR("record_data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__HDCachedCKRecordEntity_updateWithRecordData_epoch_zoneID_recordName_transaction_error___block_invoke;
  v21[3] = &unk_1E6CECA50;
  v22 = v14;
  v23 = a4;
  v19 = v14;
  LOBYTE(a8) = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v18, v17, v16, a8, v21);

  return (char)a8;
}

void __89__HDCachedCKRecordEntity_updateWithRecordData_epoch_zoneID_recordName_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("epoch"), *(_QWORD *)(a1 + 40));
  JUMPOUT(0x1BCCAB0D8);
}

+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordData:(id)a7 recordType:(id)a8 recordName:(id)a9 profile:(id)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int64_t v39;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  objc_msgSend(a10, "database");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __144__HDCachedCKRecordEntity_insertOrUpdateWithContainerIdentifier_databaseScope_zoneName_ownerName_recordData_recordType_recordName_profile_error___block_invoke;
  v31[3] = &unk_1E6CE9140;
  v38 = a1;
  v39 = a4;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v35 = v22;
  v36 = v21;
  v37 = v20;
  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v19;
  v28 = v18;
  v29 = v17;
  LOBYTE(v22) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performWriteTransactionWithHealthDatabase:error:block:", v23, a11, v31);

  return (char)v22;
}

uint64_t __144__HDCachedCKRecordEntity_insertOrUpdateWithContainerIdentifier_databaseScope_zoneName_ownerName_recordData_recordType_recordName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v5 = a2;
  +[HDCachedCKRecordEntity _dbEntityWithContainerIdentifier:databaseScope:transaction:error:](*(_QWORD *)(a1 + 80), *(void **)(a1 + 32), *(_QWORD *)(a1 + 88), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v31 = 0;
    v7 = +[HDCachedCKDatabaseEntity previousEpochForTransaction:error:](HDCachedCKDatabaseEntity, "previousEpochForTransaction:error:", v5, &v31);
    v8 = v31;
    v9 = v8;
    if (v7 < 0)
    {
      v16 = v8;
      v10 = v16;
      if (v16)
      {
        if (a3)
        {
          v10 = objc_retainAutorelease(v16);
          v15 = 0;
          *a3 = v10;
        }
        else
        {
          _HKLogDroppedError();
          v15 = 0;
        }
        goto LABEL_32;
      }
    }
    else
    {
      +[HDCachedCKRecordEntity _recordZoneEntityWithDbEntity:zoneName:ownerName:transaction:error:](*(_QWORD *)(a1 + 80), v6, *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v27 = v9;
        objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 80));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HDPredicateForZoneIDAndRecordName(objc_msgSend(v10, "persistentID"), *(void **)(a1 + 56));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKRecordEntity, "anyInDatabase:predicate:error:", v11, v12, &v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v30;

        if (!v13 && v14)
        {
          if (a3)
          {
            v14 = objc_retainAutorelease(v14);
            v15 = 0;
            *a3 = v14;
          }
          else
          {
            _HKLogDroppedError();
            v15 = 0;
          }
          v9 = v27;
          goto LABEL_31;
        }
        v17 = v7 + 1;
        if (v13)
        {
          v18 = *(_QWORD *)(a1 + 72);
          v19 = objc_msgSend(v10, "persistentID");
          v20 = *(_QWORD *)(a1 + 56);
          v28 = v14;
          LOBYTE(v18) = +[HDCachedCKRecordEntity updateWithRecordData:epoch:zoneID:recordName:transaction:error:](HDCachedCKRecordEntity, "updateWithRecordData:epoch:zoneID:recordName:transaction:error:", v18, v17, v19, v20, v5, &v28);
          v21 = v28;

          if ((v18 & 1) == 0)
          {
            v14 = v21;
            v15 = v14 == 0;
            v9 = v27;
            if (v14)
            {
              if (a3)
                *a3 = objc_retainAutorelease(v14);
              else
                _HKLogDroppedError();
            }

            goto LABEL_31;
          }
          v9 = v27;
        }
        else
        {
          v22 = objc_msgSend(v10, "persistentID");
          v24 = *(_QWORD *)(a1 + 56);
          v23 = *(_QWORD *)(a1 + 64);
          v25 = *(_QWORD *)(a1 + 72);
          v29 = v14;
          +[HDCachedCKRecordEntity insertWithZoneID:recordType:epoch:recordName:recordData:transaction:error:](HDCachedCKRecordEntity, "insertWithZoneID:recordType:epoch:recordName:recordData:transaction:error:", v22, v23, v17, v24, v25, v5, &v29);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v29;

          v9 = v27;
          if (!v13 && v21)
          {
            if (a3)
            {
              v14 = objc_retainAutorelease(v21);
              v15 = 0;
              *a3 = v14;
LABEL_31:

              goto LABEL_32;
            }
            _HKLogDroppedError();
            v15 = 0;
LABEL_24:
            v14 = v21;
            goto LABEL_31;
          }
        }
        v15 = objc_msgSend(v6, "setCurrentEpoch:transaction:error:", v17, v5, a3);

        goto LABEL_24;
      }
    }
    v15 = 1;
LABEL_32:

    goto LABEL_33;
  }
  v15 = 1;
LABEL_33:

  return v15;
}

+ (id)_dbEntityWithContainerIdentifier:(uint64_t)a1 databaseScope:(void *)a2 transaction:(uint64_t)a3 error:(void *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a4;
  v7 = a2;
  v8 = objc_opt_self();
  HDPredicateForContainerIdentifierAndDatabaseScope((uint64_t)v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "databaseForEntityClass:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKDatabaseEntity, "anyInDatabase:predicate:error:", v10, v9, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_recordZoneEntityWithDbEntity:(void *)a3 zoneName:(void *)a4 ownerName:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  v14 = objc_opt_self();
  v15 = objc_msgSend(v13, "persistentID");

  HDPredicateForDatabaseIDAndRecordZone(v15, v12, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "databaseForEntityClass:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKRecordZoneEntity, "anyInDatabase:predicate:error:", v17, v16, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)enumerateRecordIDsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  int64_t v37;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v18 = (objc_class *)MEMORY[0x1E0C95098];
  v19 = a7;
  v20 = (void *)objc_msgSend([v18 alloc], "initWithZoneName:ownerName:", v15, v16);
  objc_msgSend(v19, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke;
  v30[3] = &unk_1E6D007F0;
  v36 = a1;
  v37 = a4;
  v31 = v14;
  v32 = v15;
  v34 = v20;
  v35 = v17;
  v33 = v16;
  v22 = v20;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  v27 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordEntity, "performReadTransactionWithHealthDatabase:error:block:", v21, a8, v30);

  return v27;
}

uint64_t __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];

  v5 = a2;
  +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(_QWORD *)(a1 + 72), *(void **)(a1 + 32), *(_QWORD *)(a1 + 80), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_2;
    v16[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v16[4] = *(_QWORD *)(a1 + 72);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_3;
    v14[3] = &unk_1E6CE9508;
    v15 = v6;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_4;
    v11[3] = &unk_1E6CF3030;
    v13 = *(id *)(a1 + 64);
    v12 = *(id *)(a1 + 56);
    v9 = objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCachedCKRecordEntityRecordData_block_invoke_fetchKey, a3, v16, v14, v11);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)_recordZoneEntityWithContainerIdentifier:(uint64_t)a3 databaseScope:(void *)a4 zoneName:(void *)a5 ownerName:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a2;
  v16 = objc_opt_self();
  +[HDCachedCKRecordEntity _dbEntityWithContainerIdentifier:databaseScope:transaction:error:](v16, v15, a3, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[HDCachedCKRecordEntity _recordZoneEntityWithDbEntity:zoneName:ownerName:transaction:error:](v16, v17, v12, v13, v14, a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

id __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("record_name"), v2, CFSTR("zone_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __134__HDCachedCKRecordEntity_enumerateRecordIDsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error_enumerationHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_alloc(MEMORY[0x1E0C95070]);
  HDSQLiteColumnWithNameAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", v7, *(_QWORD *)(a1 + 32));
  v9 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v8, a3);

  return v9;
}

+ (BOOL)enumerateRecordIDAndDataWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordType:(id)a7 recordName:(id)a8 epoch:(int64_t)a9 profile:(id)a10 error:(id *)a11 enumerationHandler:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  int64_t v45;
  int64_t v46;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a12;
  v22 = (objc_class *)MEMORY[0x1E0C95098];
  v23 = a10;
  v24 = (void *)objc_msgSend([v22 alloc], "initWithZoneName:ownerName:", v17, v18);
  objc_msgSend(v23, "database");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __168__HDCachedCKRecordEntity_enumerateRecordIDAndDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordType_recordName_epoch_profile_error_enumerationHandler___block_invoke;
  v36[3] = &unk_1E6D00840;
  v37 = v16;
  v38 = v17;
  v45 = a4;
  v46 = a9;
  v39 = v18;
  v40 = v19;
  v43 = v21;
  v44 = a1;
  v41 = v20;
  v42 = v24;
  v35 = v24;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  v31 = v16;
  LOBYTE(v21) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordEntity, "performReadTransactionWithHealthDatabase:error:block:", v25, a11, v36);

  return (char)v21;
}

uint64_t __168__HDCachedCKRecordEntity_enumerateRecordIDAndDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordType_recordName_epoch_profile_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  void *v31;
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(_QWORD *)(a1 + 88), *(void **)(a1 + 32), *(_QWORD *)(a1 + 96), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    HDPredicateForRecordsSinceEpoch(*(_QWORD *)(a1 + 104));
    v7 = objc_claimAutoreleasedReturnValue();
    HDPredicateForZoneIDAndRecordType(objc_msgSend(v6, "persistentID"), *(void **)(a1 + 56));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D29840];
    v25 = (void *)v8;
    v26 = (void *)v7;
    v33[0] = v8;
    v33[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateMatchingAllPredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 64))
    {
      HDPredicateForZoneIDAndRecordName(objc_msgSend(v6, "persistentID"), *(void **)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D29840];
      v32[0] = v11;
      v32[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateMatchingAllPredicates:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    v16 = *(void **)(a1 + 88);
    objc_msgSend(v5, "databaseForEntityClass:", v16, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("epoch"), *(_QWORD *)(a1 + 88), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v17, v11, 0, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = *MEMORY[0x1E0D29618];
    v30[1] = CFSTR("epoch");
    v30[2] = CFSTR("record_name");
    v30[3] = CFSTR("record_data");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __168__HDCachedCKRecordEntity_enumerateRecordIDAndDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordType_recordName_epoch_profile_error_enumerationHandler___block_invoke_2;
    v27[3] = &unk_1E6D00818;
    v29 = *(id *)(a1 + 80);
    v28 = *(id *)(a1 + 72);
    v22 = objc_msgSend(v20, "enumerateProperties:error:enumerationHandler:", v21, v24, v27);

  }
  else
  {
    v22 = 1;
  }

  return v22;
}

uint64_t __168__HDCachedCKRecordEntity_enumerateRecordIDAndDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordType_recordName_epoch_profile_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  HDCachedCKRecordEntity *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = -[HDSQLiteEntity initWithPersistentID:]([HDCachedCKRecordEntity alloc], "initWithPersistentID:", HDSQLiteColumnWithNameAsInt64());
  v8 = objc_alloc(MEMORY[0x1E0C95070]);
  HDSQLiteColumnWithNameAsString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordName:zoneID:", v9, *(_QWORD *)(a1 + 32));
  HDSQLiteColumnWithNameAsData();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HDSQLiteColumnWithNameAsInt64();
  v13 = (*(uint64_t (**)(uint64_t, HDCachedCKRecordEntity *, void *, void *, uint64_t, uint64_t))(v6 + 16))(v6, v7, v10, v11, v12, a4);

  return v13;
}

+ (int64_t)containsRecordsWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  int64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__144;
  v35 = __Block_byref_object_dispose__144;
  v36 = 0;
  objc_msgSend(v17, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __112__HDCachedCKRecordEntity_containsRecordsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke;
  v24[3] = &unk_1E6CE9190;
  v29 = a1;
  v19 = v14;
  v25 = v19;
  v30 = a4;
  v20 = v15;
  v26 = v20;
  v21 = v16;
  v27 = v21;
  v28 = &v31;
  LODWORD(a8) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordEntity, "performReadTransactionWithHealthDatabase:error:block:", v18, a8, v24);

  if ((_DWORD)a8)
  {
    if (v32[5])
      v22 = 1;
    else
      v22 = 2;
  }
  else
  {
    v22 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v22;
}

uint64_t __112__HDCachedCKRecordEntity_containsRecordsWithContainerIdentifier_databaseScope_zoneName_ownerName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  id v17;

  v5 = a2;
  +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 32), *(_QWORD *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 64);
    objc_msgSend(v5, "databaseForEntityClass:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDPredicateForZoneID(objc_msgSend(v6, "persistentID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "anyInDatabase:predicate:error:", v8, v9, &v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      v14 = 1;
    else
      v14 = v11 == 0;
    v15 = v14;
    if (!v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

+ (int64_t)containsRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  id v33;
  int64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__144;
  v39 = __Block_byref_object_dispose__144;
  v40 = 0;
  objc_msgSend(v19, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __122__HDCachedCKRecordEntity_containsRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
  v27[3] = &unk_1E6D00868;
  v33 = a1;
  v21 = v15;
  v28 = v21;
  v34 = a4;
  v22 = v16;
  v29 = v22;
  v23 = v17;
  v30 = v23;
  v32 = &v35;
  v24 = v18;
  v31 = v24;
  LODWORD(v16) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordEntity, "performReadTransactionWithHealthDatabase:error:block:", v20, a9, v27);

  if ((_DWORD)v16)
  {
    if (v36[5])
      v25 = 1;
    else
      v25 = 2;
  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v25;
}

uint64_t __122__HDCachedCKRecordEntity_containsRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  id v17;

  v5 = a2;
  +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(_QWORD *)(a1 + 72), *(void **)(a1 + 32), *(_QWORD *)(a1 + 80), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 72);
    objc_msgSend(v5, "databaseForEntityClass:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDPredicateForZoneIDAndRecordName(objc_msgSend(v6, "persistentID"), *(void **)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "anyInDatabase:predicate:error:", v8, v9, &v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      v14 = 1;
    else
      v14 = v11 == 0;
    v15 = v14;
    if (!v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

+ (id)recordDataWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  id v35;
  int64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__144;
  v41 = __Block_byref_object_dispose__144;
  v42 = 0;
  objc_msgSend(v19, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __118__HDCachedCKRecordEntity_recordDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
  v29[3] = &unk_1E6D00868;
  v35 = a1;
  v21 = v15;
  v30 = v21;
  v36 = a4;
  v22 = v16;
  v31 = v22;
  v23 = v17;
  v32 = v23;
  v34 = &v37;
  v24 = v18;
  v33 = v24;
  v25 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordEntity, "performReadTransactionWithHealthDatabase:error:block:", v20, a9, v29);

  if (v25)
    v26 = (void *)v38[5];
  else
    v26 = 0;
  v27 = v26;

  _Block_object_dispose(&v37, 8);
  return v27;
}

uint64_t __118__HDCachedCKRecordEntity_recordDataWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  id v17;

  v5 = a2;
  +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(_QWORD *)(a1 + 72), *(void **)(a1 + 32), *(_QWORD *)(a1 + 80), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 72);
    objc_msgSend(v5, "databaseForEntityClass:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDPredicateForZoneIDAndRecordName(objc_msgSend(v6, "persistentID"), *(void **)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "propertyValueForAnyInDatabase:property:predicate:error:", v8, CFSTR("record_data"), v9, &v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      v14 = 1;
    else
      v14 = v11 == 0;
    v15 = v14;
    if (!v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

+ (BOOL)deleteRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(a8, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __120__HDCachedCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
  v26[3] = &unk_1E6D00890;
  v31 = a1;
  v32 = a4;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performWriteTransactionWithHealthDatabase:error:block:", v19, a9, v26);

  return v24;
}

uint64_t __120__HDCachedCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;
  id v18;

  v5 = a2;
  +[HDCachedCKRecordEntity _recordZoneEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 32), *(_QWORD *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    HDPredicateForZoneIDAndRecordName(objc_msgSend(v6, "persistentID"), *(void **)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKRecordEntity, "anyInDatabase:predicate:error:", v9, v8, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;

    if (v10)
      v12 = 1;
    else
      v12 = v11 == 0;
    if (v12)
    {
      v13 = *(void **)(a1 + 64);
      objc_msgSend(v5, "databaseForEntityClass:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17.receiver = v13;
      v17.super_class = (Class)&OBJC_METACLASS___HDCachedCKRecordEntity;
      v15 = (uint64_t)objc_msgSendSuper2(&v17, sel_deleteEntitiesInDatabase_predicate_error_, v14, v8, a3);

    }
    else if (a3)
    {
      v15 = 0;
      *a3 = objc_retainAutorelease(v11);
    }
    else
    {
      _HKLogDroppedError();
      v15 = 0;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

@end
