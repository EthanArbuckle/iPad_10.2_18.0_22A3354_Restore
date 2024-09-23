@implementation HDCachedCKDatabaseEntity

+ (id)databaseTable
{
  return CFSTR("ck_database_cache");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCKDatabaseCacheEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("container_id");
  v3[1] = CFSTR("database_scope");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HDCachedCKDatabaseEntity *v19;
  void *v20;
  id v21;
  int v22;
  HDCachedCKDatabaseEntity *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  int64_t v30;
  _QWORD v31[5];

  v14 = a3;
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
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __123__HDCachedCKDatabaseEntity_insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = a1;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __123__HDCachedCKDatabaseEntity_insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error___block_invoke_2;
  v26[3] = &unk_1E6CE9118;
  v27 = v14;
  v30 = a4;
  v21 = v18;
  v28 = v21;
  v29 = v15;
  v22 = objc_msgSend(v20, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error__lookupKey, a8, v31, v26, 0);
  v19 = 0;
  if (v22)
  {
    v23 = [HDCachedCKDatabaseEntity alloc];
    objc_msgSend(v20, "lastInsertRowID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDSQLiteEntity initWithPersistentID:](v23, "initWithPersistentID:", objc_msgSend(v24, "longLongValue"));

  }
LABEL_8:

  return v19;
}

id __123__HDCachedCKDatabaseEntity_insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)objc_opt_self();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v0, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?)"), v2, CFSTR("container_id"), CFSTR("database_scope"), CFSTR("server_change_token"), CFSTR("account_user_record_name"), CFSTR("epoch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __123__HDCachedCKDatabaseEntity_insertWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 5, 0);
}

+ (BOOL)updateServerChangeToken:(id)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!v12)
  {
    v15 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
LABEL_5:
    objc_msgSend(v14, "databaseForEntityClass:", a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDPredicateForContainerIdentifierAndDatabaseScope((uint64_t)v13, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = CFSTR("server_change_token");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __104__HDCachedCKDatabaseEntity_updateServerChangeToken_containerIdentifier_databaseScope_transaction_error___block_invoke;
    v22[3] = &unk_1E6CE84C8;
    v23 = v15;
    v20 = v15;
    v16 = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v19, v18, v17, a7, v22);

    goto LABEL_6;
  }
  v16 = 0;
LABEL_6:

  return v16;
}

void __104__HDCachedCKDatabaseEntity_updateServerChangeToken_containerIdentifier_databaseScope_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0D8);
}

+ (id)entityForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 transaction:(id)a6 shouldCreate:(BOOL)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  int64_t v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__165;
  v37 = __Block_byref_object_dispose__165;
  v38 = 0;
  objc_msgSend(v16, "databaseForEntityClass:", a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke;
  v32[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v32[4] = a1;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke_2;
  v29[3] = &unk_1E6CE82D8;
  v19 = v14;
  v30 = v19;
  v31 = a4;
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke_3;
  v28[3] = &unk_1E6CE8540;
  v28[4] = &v33;
  v20 = objc_msgSend(v17, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error__lookupKey, a8, v32, v29, v28);

  if ((v20 & 1) == 0)
  {
LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  v21 = (void *)v34[5];
  if (v21 || !a7)
  {
    v22 = v21;
    goto LABEL_7;
  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("User record name must not be nil"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      if (a8)
        *a8 = objc_retainAutorelease(v24);
      else
        _HKLogDroppedError();
    }

    goto LABEL_13;
  }
  objc_msgSend(a1, "insertWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:transaction:error:", v19, a4, v15, 0, v16, a8);
  v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v23 = v22;
LABEL_14:

  _Block_object_dispose(&v33, 8);
  return v23;
}

id __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *MEMORY[0x1E0D29618];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ?"), v2, v3, CFSTR("container_id"), CFSTR("database_scope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __117__HDCachedCKDatabaseEntity_entityForContainerIdentifier_databaseScope_userRecordName_transaction_shouldCreate_error___block_invoke_3(uint64_t a1)
{
  HDCachedCKDatabaseEntity *v2;
  uint64_t v3;
  void *v4;

  v2 = -[HDSQLiteEntity initWithPersistentID:]([HDCachedCKDatabaseEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

+ (BOOL)deleteDatabasesNotMatchingUserRecordName:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a4;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ != ?"), v11, CFSTR("account_user_record_name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__HDCachedCKDatabaseEntity_deleteDatabasesNotMatchingUserRecordName_profile_error___block_invoke;
  v17[3] = &unk_1E6CE7950;
  v18 = v12;
  v19 = v8;
  v14 = v8;
  v15 = v12;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKDatabaseEntity, "performWriteTransactionWithHealthDatabase:error:block:", v13, a5, v17);

  return (char)a5;
}

uint64_t __83__HDCachedCKDatabaseEntity_deleteDatabasesNotMatchingUserRecordName_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a2, "unprotectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__HDCachedCKDatabaseEntity_deleteDatabasesNotMatchingUserRecordName_profile_error___block_invoke_2;
  v9[3] = &unk_1E6CE9508;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v5, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v6, a3, v9, 0);

  return v7;
}

uint64_t __83__HDCachedCKDatabaseEntity_deleteDatabasesNotMatchingUserRecordName_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)insertOrUpdateWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 profile:(id)a7 error:(id *)a8
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
  id v26;
  int64_t v27;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  objc_msgSend(a7, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __127__HDCachedCKDatabaseEntity_insertOrUpdateWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_profile_error___block_invoke;
  v22[3] = &unk_1E6CE9208;
  v26 = a1;
  v27 = a4;
  v23 = v14;
  v24 = v15;
  v25 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  LOBYTE(a8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKDatabaseEntity, "performWriteTransactionWithHealthDatabase:error:block:", v17, a8, v22);

  return (char)a8;
}

BOOL __127__HDCachedCKDatabaseEntity_insertOrUpdateWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_profile_error___block_invoke(uint64_t *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v20;
  id v21;

  v5 = a2;
  v6 = (void *)a1[7];
  objc_msgSend(v5, "databaseForEntityClass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDPredicateForContainerIdentifierAndDatabaseScope(a1[4], a1[8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v6, "anyInDatabase:predicate:error:", v7, v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;

  if (v9)
    v11 = 1;
  else
    v11 = v10 == 0;
  if (!v11)
  {
    if (!a3)
    {
      _HKLogDroppedError();
      v12 = 0;
      v9 = 0;
      goto LABEL_18;
    }
    v13 = v10;
    goto LABEL_10;
  }
  if (!v9)
  {
    v14 = a1[8];
    v15 = a1[4];
    v16 = a1[5];
    v17 = a1[6];
    v20 = v10;
    +[HDCachedCKDatabaseEntity insertWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:transaction:error:](HDCachedCKDatabaseEntity, "insertWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:transaction:error:", v15, v14, v16, v17, v5, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;

    v12 = 1;
    if (!v9 && v18)
    {
      if (a3)
      {
        v13 = v18;
LABEL_10:
        v10 = objc_retainAutorelease(v13);
        v12 = 0;
        v9 = 0;
        *a3 = v10;
        goto LABEL_18;
      }
      _HKLogDroppedError();
      v12 = 0;
      v9 = 0;
    }
    v10 = v18;
    goto LABEL_18;
  }
  v12 = +[HDCachedCKDatabaseEntity updateServerChangeToken:containerIdentifier:databaseScope:transaction:error:](HDCachedCKDatabaseEntity, "updateServerChangeToken:containerIdentifier:databaseScope:transaction:error:", a1[6], a1[4], a1[8], v5, a3);
LABEL_18:

  return v12;
}

+ (BOOL)insertIfDoesNotExistWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 userRecordName:(id)a5 serverChangeToken:(id)a6 profile:(id)a7 error:(id *)a8
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
  id v26;
  int64_t v27;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  objc_msgSend(a7, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __133__HDCachedCKDatabaseEntity_insertIfDoesNotExistWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_profile_error___block_invoke;
  v22[3] = &unk_1E6CE9208;
  v26 = a1;
  v27 = a4;
  v23 = v14;
  v24 = v15;
  v25 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  LOBYTE(a8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKDatabaseEntity, "performWriteTransactionWithHealthDatabase:error:block:", v17, a8, v22);

  return (char)a8;
}

uint64_t __133__HDCachedCKDatabaseEntity_insertIfDoesNotExistWithContainerIdentifier_databaseScope_userRecordName_serverChangeToken_profile_error___block_invoke(uint64_t *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v20;
  id v21;

  v5 = a2;
  v6 = (void *)a1[7];
  objc_msgSend(v5, "databaseForEntityClass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDPredicateForContainerIdentifierAndDatabaseScope(a1[4], a1[8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v6, "anyInDatabase:predicate:error:", v7, v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;

  if (v9)
    v11 = 1;
  else
    v11 = v10 == 0;
  if (!v11)
  {
    if (!a3)
    {
      _HKLogDroppedError();
      v12 = 0;
      v9 = 0;
      goto LABEL_18;
    }
    v13 = v10;
    goto LABEL_10;
  }
  if (!v9)
  {
    v14 = a1[8];
    v15 = a1[4];
    v16 = a1[5];
    v17 = a1[6];
    v20 = v10;
    +[HDCachedCKDatabaseEntity insertWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:transaction:error:](HDCachedCKDatabaseEntity, "insertWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:transaction:error:", v15, v14, v16, v17, v5, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;

    v12 = 1;
    if (!v9 && v18)
    {
      if (a3)
      {
        v13 = v18;
LABEL_10:
        v10 = objc_retainAutorelease(v13);
        v12 = 0;
        v9 = 0;
        *a3 = v10;
        goto LABEL_18;
      }
      _HKLogDroppedError();
      v12 = 0;
      v9 = 0;
    }
    v10 = v18;
    goto LABEL_18;
  }
  v12 = 1;
LABEL_18:

  return v12;
}

+ (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a5;
  HDPredicateForContainerIdentifierAndDatabaseScope((uint64_t)a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "propertyValueForAnyWithProperty:predicate:healthDatabase:error:", CFSTR("server_change_token"), v11, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)setCurrentEpoch:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  _QWORD v10[6];

  objc_msgSend(a4, "unprotectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__HDCachedCKDatabaseEntity_setCurrentEpoch_transaction_error___block_invoke_2;
  v10[3] = &unk_1E6CE82D8;
  v10[4] = self;
  v10[5] = a3;
  LOBYTE(a5) = objc_msgSend(v8, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &setCurrentEpoch_transaction_error__lookupKey, a5, &__block_literal_global_202, v10, 0);

  return (char)a5;
}

id __62__HDCachedCKDatabaseEntity_setCurrentEpoch_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDCachedCKDatabaseEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ?"), v1, CFSTR("epoch"), *MEMORY[0x1E0D29618]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __62__HDCachedCKDatabaseEntity_setCurrentEpoch_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

+ (int64_t)previousEpochForTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int64_t v14;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -1;
  objc_msgSend(v6, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v16[4] = &v19;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__HDCachedCKDatabaseEntity_previousEpochForTransaction_error___block_invoke;
  v17[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v17[4] = a1;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__HDCachedCKDatabaseEntity_previousEpochForTransaction_error___block_invoke_2;
  v16[3] = &unk_1E6CE8540;
  v8 = objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &previousEpochForTransaction_error__lookupKey, &v18, v17, 0, v16);
  v9 = v18;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      v11 = v9;
      v12 = v11;
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to retrieve previous epoch from cache."));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v13;
      if (v13)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v13);
        else
          _HKLogDroppedError();
      }

    }
  }
  v14 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v14;
}

id __62__HDCachedCKDatabaseEntity_previousEpochForTransaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT MAX(%@) as %@ FROM %@"), CFSTR("epoch"), CFSTR("epoch"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __62__HDCachedCKDatabaseEntity_previousEpochForTransaction_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  return 0;
}

@end
