@implementation HDCachedSecureCKRecordEntity

+ (id)databaseTable
{
  return CFSTR("ck_record_cache_secure");
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCachedSecureCKRecordEntityColumnDefinitions;
}

+ (id)insertWithRecordID:(int64_t)a3 recordData:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  int v13;
  HDCachedSecureCKRecordEntity *v14;
  HDCachedSecureCKRecordEntity *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  int64_t v20;
  _QWORD v21[5];

  v10 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = a3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__HDCachedSecureCKRecordEntity_insertWithRecordID_recordData_transaction_error___block_invoke;
  v21[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v21[4] = a1;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HDCachedSecureCKRecordEntity_insertWithRecordID_recordData_transaction_error___block_invoke_2;
  v18[3] = &unk_1E6CE82D8;
  v12 = v10;
  v19 = v12;
  v13 = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertWithRecordID_recordData_transaction_error__lookupKey, a6, v21, v18, 0);
  v14 = 0;
  if (v13)
  {
    v15 = [HDCachedSecureCKRecordEntity alloc];
    objc_msgSend(v11, "lastInsertRowID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDSQLiteEntity initWithPersistentID:](v15, "initWithPersistentID:", objc_msgSend(v16, "longLongValue"));

  }
  return v14;
}

id __80__HDCachedSecureCKRecordEntity_insertWithRecordID_recordData_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)objc_opt_self();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v0, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@) VALUES (?, ?)"), v2, CFSTR("record_id"), CFSTR("record_data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __80__HDCachedSecureCKRecordEntity_insertWithRecordID_recordData_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)updateWithRecordData:(id)a3 recordID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDPredicateForRecordID(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("record_data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__HDCachedSecureCKRecordEntity_updateWithRecordData_recordID_transaction_error___block_invoke;
  v16[3] = &unk_1E6CE84C8;
  v17 = v10;
  v14 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v13, v12, v11, a6, v16);

  return (char)a6;
}

void __80__HDCachedSecureCKRecordEntity_updateWithRecordData_recordID_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0D8);
}

+ (BOOL)insertOrUpdateWithRecordID:(int64_t)a3 recordData:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  int64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__HDCachedSecureCKRecordEntity_insertOrUpdateWithRecordID_recordData_profile_error___block_invoke;
  v21[3] = &unk_1E6CF5F78;
  v23 = a1;
  v24 = a3;
  v22 = v10;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __84__HDCachedSecureCKRecordEntity_insertOrUpdateWithRecordID_recordData_profile_error___block_invoke_2;
  v17[3] = &unk_1E6CE92A8;
  v19 = v11;
  v20 = a3;
  v18 = v22;
  v14 = v11;
  v15 = v22;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDCachedSecureCKRecordEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v12, a6, v21, v17);

  return (char)a6;
}

BOOL __84__HDCachedSecureCKRecordEntity_insertOrUpdateWithRecordID_recordData_profile_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = (void *)a1[5];
  objc_msgSend(v5, "databaseForEntityClass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDPredicateForRecordID(a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v6, "anyInDatabase:predicate:error:", v7, v8, &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;

  if (v9)
    v11 = 1;
  else
    v11 = v10 == 0;
  if (!v11)
  {
    if (!a3)
    {
      _HKLogDroppedError();
      v14 = 0;
      v9 = 0;
      goto LABEL_18;
    }
    v16 = v10;
    goto LABEL_10;
  }
  if (!v9)
  {
    v17 = a1[6];
    v18 = a1[4];
    v22 = v10;
    +[HDCachedSecureCKRecordEntity insertWithRecordID:recordData:transaction:error:](HDCachedSecureCKRecordEntity, "insertWithRecordID:recordData:transaction:error:", v17, v18, v5, &v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v22;

    v14 = 1;
    if (!v9 && v19)
    {
      if (a3)
      {
        v16 = v19;
LABEL_10:
        v10 = objc_retainAutorelease(v16);
        v14 = 0;
        v9 = 0;
        *a3 = v10;
        goto LABEL_18;
      }
      _HKLogDroppedError();
      v14 = 0;
      v9 = 0;
    }
    v10 = v19;
    goto LABEL_18;
  }
  v12 = a1[4];
  v13 = a1[6];
  v21 = v10;
  v14 = +[HDCachedSecureCKRecordEntity updateWithRecordData:recordID:transaction:error:](HDCachedSecureCKRecordEntity, "updateWithRecordData:recordID:transaction:error:", v12, v13, v5, &v21);
  v15 = v21;

  v10 = v15;
LABEL_18:

  return v14;
}

uint64_t __84__HDCachedSecureCKRecordEntity_insertOrUpdateWithRecordID_recordData_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HDCachedSecureCKRecordJournalEntry *v5;
  void *v6;
  uint64_t v7;

  v5 = objc_alloc_init(HDCachedSecureCKRecordJournalEntry);
  -[HDCachedSecureCKRecordJournalEntry setRecordID:](v5, "setRecordID:", *(_QWORD *)(a1 + 48));
  -[HDCachedSecureCKRecordJournalEntry setRecordData:](v5, "setRecordData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "addJournalEntry:error:", v5, a3);

  return v7;
}

+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordData:(id)a7 recordName:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  id v24;

  v16 = a7;
  v17 = a9;
  v24 = 0;
  +[HDCachedSecureCKRecordEntity _unprotectedRecordEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:]((uint64_t)a1, a3, a4, a5, a6, a8, v17, (uint64_t)&v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;
  v20 = v19;
  if (v18)
    v21 = 1;
  else
    v21 = v19 == 0;
  if (v21)
  {
    if (v18)
      v22 = +[HDCachedSecureCKRecordEntity insertOrUpdateWithRecordID:recordData:profile:error:](HDCachedSecureCKRecordEntity, "insertOrUpdateWithRecordID:recordData:profile:error:", objc_msgSend(v18, "persistentID"), v16, v17, a10);
    else
      v22 = 1;
  }
  else if (a10)
  {
    v22 = 0;
    *a10 = objc_retainAutorelease(v19);
  }
  else
  {
    _HKLogDroppedError();
    v22 = 0;
  }

  return v22;
}

+ (id)_unprotectedRecordEntityWithContainerIdentifier:(uint64_t)a3 databaseScope:(void *)a4 zoneName:(void *)a5 ownerName:(void *)a6 recordName:(void *)a7 profile:(uint64_t)a8 error:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v14 = a2;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_opt_self();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__159;
  v38 = __Block_byref_object_dispose__159;
  v39 = 0;
  objc_msgSend(v18, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __138__HDCachedSecureCKRecordEntity__unprotectedRecordEntityWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
  v27[3] = &unk_1E6CFF660;
  v20 = v14;
  v28 = v20;
  v33 = a3;
  v21 = v15;
  v29 = v21;
  v22 = v16;
  v30 = v22;
  v32 = &v34;
  v23 = v17;
  v31 = v23;
  LODWORD(a8) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordEntity, "performReadTransactionWithHealthDatabase:error:block:", v19, a8, v27);

  if ((_DWORD)a8)
    v24 = (void *)v35[5];
  else
    v24 = 0;
  v25 = v24;

  _Block_object_dispose(&v34, 8);
  return v25;
}

+ (id)protectedRecordDataForUnprotectedEntity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__159;
  v24 = __Block_byref_object_dispose__159;
  v25 = 0;
  objc_msgSend(v9, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke_2;
  v17[3] = &unk_1E6CE9508;
  v12 = v8;
  v18 = v12;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke_3;
  v16[3] = &unk_1E6CE8540;
  v16[4] = &v20;
  LODWORD(a5) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &protectedRecordDataForUnprotectedEntity_transaction_error__lookupKey, a5, v19, v17, v16);

  if ((_DWORD)a5)
    v13 = (void *)v21[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v20, 8);
  return v14;
}

id __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@=?"), CFSTR("record_data"), v2, CFSTR("record_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __90__HDCachedSecureCKRecordEntity_protectedRecordDataForUnprotectedEntity_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB18C](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)deleteRecordWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 zoneName:(id)a5 ownerName:(id)a6 recordName:(id)a7 profile:(id)a8 error:(id *)a9
{
  id v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v15 = a8;
  v29 = 0;
  +[HDCachedSecureCKRecordEntity _unprotectedRecordEntityWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:]((uint64_t)a1, a3, a4, a5, a6, a7, v15, (uint64_t)&v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;
  v18 = v17;
  if (v16 || !v17)
  {
    if (v16)
    {
      objc_msgSend(v15, "database");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __126__HDCachedSecureCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke;
      v26[3] = &unk_1E6CEF660;
      v28 = a1;
      v27 = v16;
      v23[0] = v21;
      v23[1] = 3221225472;
      v23[2] = __126__HDCachedSecureCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke_2;
      v23[3] = &unk_1E6CECEC8;
      v24 = v27;
      v25 = v15;
      v19 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v20, a9, v26, v23);

    }
    else
    {
      v19 = 1;
    }
  }
  else if (a9)
  {
    v19 = 0;
    *a9 = objc_retainAutorelease(v17);
  }
  else
  {
    _HKLogDroppedError();
    v19 = 0;
  }

  return v19;
}

uint64_t __126__HDCachedSecureCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  HDPredicateForRecordID(objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "deleteEntitiesInDatabase:predicate:error:", v5, v7, a3);

  return v8;
}

uint64_t __126__HDCachedSecureCKRecordEntity_deleteRecordWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HDCachedSecureDeleteCKRecordJournalEntry *v5;
  void *v6;
  uint64_t v7;

  v5 = objc_alloc_init(HDCachedSecureDeleteCKRecordJournalEntry);
  -[HDCachedSecureDeleteCKRecordJournalEntry setRecordID:](v5, "setRecordID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  objc_msgSend(*(id *)(a1 + 40), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "addJournalEntry:error:", v5, a3);

  return v7;
}

+ (BOOL)synchronizeRecordsWithProfile:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v6, a4, &__block_literal_global_190, 0);

  return (char)a4;
}

uint64_t __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v27;
  id v28;
  id obj;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_2;
  v30[3] = &unk_1E6D03778;
  v7 = v4;
  v31 = v7;
  v8 = v5;
  v32 = v8;
  v9 = v30;
  v10 = v7;
  v11 = (void *)objc_opt_self();
  objc_msgSend(v10, "databaseForEntityClass:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "queryWithDatabase:predicate:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&v37 = CFSTR("record_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v6;
  v35[1] = 3221225472;
  v35[2] = __93__HDCachedSecureCKRecordEntity__enumerateAllRecordIDsInTransaction_error_enumerationHandler___block_invoke;
  v35[3] = &unk_1E6CE91B8;
  v36 = v9;
  v15 = v9;
  LODWORD(v6) = objc_msgSend(v13, "enumerateProperties:error:enumerationHandler:", v14, a3, v35);

  if ((_DWORD)v6)
  {
    if (objc_msgSend(v8, "count"))
    {
      v16 = v8;
      v17 = v10;
      v18 = objc_opt_self();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      obj = v16;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v35, 16);
      if (v19)
      {
        v20 = v19;
        v27 = v10;
        v28 = v8;
        v21 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v38 != v21)
              objc_enumerationMutation(obj);
            v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v17, "protectedDatabase");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v33[4] = v23;
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __67__HDCachedSecureCKRecordEntity__deleteRecordIds_transaction_error___block_invoke;
            v34[3] = &__block_descriptor_40_e15___NSString_8__0l;
            v34[4] = v18;
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __67__HDCachedSecureCKRecordEntity__deleteRecordIds_transaction_error___block_invoke_2;
            v33[3] = &unk_1E6CE9508;
            LODWORD(v23) = objc_msgSend(v24, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_deleteRecordIds_transaction_error__lookupKey, a3, v34, v33, 0);

            if (!(_DWORD)v23)
            {
              v25 = 0;
              goto LABEL_14;
            }
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v35, 16);
          if (v20)
            continue;
          break;
        }
        v25 = 1;
LABEL_14:
        v10 = v27;
        v8 = v28;
      }
      else
      {
        v25 = 1;
      }

    }
    else
    {
      v25 = 1;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

uint64_t __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = &v13;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_4;
  v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v12[4] = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_5;
  v11[3] = &unk_1E6CE8540;
  v7 = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCachedSecureCKRecordJournalEntryRecordDataKey_block_invoke_lookupKey, a3, &__block_literal_global_245_2, v12, v11);

  if (!*((_BYTE *)v14 + 24))
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  _Block_object_dispose(&v13, 8);
  return v7;
}

id __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDCachedCKRecordEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1"), v1, *MEMORY[0x1E0D29618]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __68__HDCachedSecureCKRecordEntity_synchronizeRecordsWithProfile_error___block_invoke_5(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t __93__HDCachedSecureCKRecordEntity__enumerateAllRecordIDsInTransaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  HDSQLiteColumnWithNameAsInt64();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __67__HDCachedSecureCKRecordEntity__deleteRecordIds_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), v2, CFSTR("record_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __67__HDCachedSecureCKRecordEntity__deleteRecordIds_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
}

uint64_t __138__HDCachedSecureCKRecordEntity__unprotectedRecordEntityWithContainerIdentifier_databaseScope_zoneName_ownerName_recordName_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;

  v5 = a2;
  HDPredicateForContainerIdentifierAndDatabaseScope(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKDatabaseEntity, "anyInDatabase:predicate:error:", v7, v6, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;

  if (v8)
    v10 = 1;
  else
    v10 = v9 == 0;
  if (v10)
  {
    if (v8)
    {
      HDPredicateForDatabaseIDAndRecordZone(objc_msgSend(v8, "persistentID"), *(void **)(a1 + 40), *(void **)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v9;
      +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKRecordZoneEntity, "anyInDatabase:predicate:error:", v12, v11, &v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v27;

      if (v13)
      {
        v24 = v14;
        v25 = v11;
        objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HDPredicateForZoneIDAndRecordName(objc_msgSend(v13, "persistentID"), *(void **)(a1 + 56));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedCKRecordEntity, "anyInDatabase:predicate:error:", v15, v16, &v26);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v26;
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v17;

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          v21 = 1;
        else
          v21 = v18 == 0;
        v22 = v21;
        if (!v21)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v18);
          else
            _HKLogDroppedError();
        }

        v14 = v24;
        v11 = v25;
      }
      else
      {
        v22 = 1;
      }

      v9 = v14;
    }
    else
    {
      v22 = 1;
    }
  }
  else if (a3)
  {
    v9 = objc_retainAutorelease(v9);
    v22 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    v22 = 0;
  }

  return v22;
}

@end
