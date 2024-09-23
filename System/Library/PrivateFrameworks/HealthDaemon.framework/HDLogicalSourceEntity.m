@implementation HDLogicalSourceEntity

+ (id)databaseTable
{
  return CFSTR("logical_sources");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDLogicalSourceEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)bundleIDForLogicalSourceID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a4;
  objc_msgSend(v8, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__39;
  v20 = __Block_byref_object_dispose__39;
  v21 = 0;
  v14[4] = a3;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v15[4] = a1;
  v13[4] = &v16;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke_3;
  v13[3] = &unk_1E6CE8540;
  if (objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &bundleIDForLogicalSourceID_transaction_error__lookupKey, a5, v15, v14, v13))v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;
  _Block_object_dispose(&v16, 8);

  return v11;
}

id __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("bundle_id"), v2, *MEMORY[0x1E0D29618]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __70__HDLogicalSourceEntity_bundleIDForLogicalSourceID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (id)logicalSourceIDForBundleIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
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
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__39;
  v24 = __Block_byref_object_dispose__39;
  v25 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke_2;
  v17[3] = &unk_1E6CE9508;
  v12 = v8;
  v18 = v12;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke_3;
  v16[3] = &unk_1E6CE8540;
  v16[4] = &v20;
  if (objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &logicalSourceIDForBundleIdentifier_transaction_error__lookupKey, a5, v19, v17, v16))v13 = (void *)v21[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v20, 8);
  return v14;
}

id __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *MEMORY[0x1E0D29618];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), v2, v3, CFSTR("bundle_id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke_2()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __78__HDLogicalSourceEntity_logicalSourceIDForBundleIdentifier_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

+ (id)ownerBundleIDForLogicalSourceID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a4;
  objc_msgSend(v8, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__39;
  v20 = __Block_byref_object_dispose__39;
  v21 = 0;
  v14[4] = a3;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v15[4] = a1;
  v13[4] = &v16;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke_3;
  v13[3] = &unk_1E6CE8540;
  if (objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &ownerBundleIDForLogicalSourceID_transaction_error__lookupKey, a5, v15, v14, v13))v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;
  _Block_object_dispose(&v16, 8);

  return v11;
}

id __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("owner_bundle_id"), v2, *MEMORY[0x1E0D29618]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __75__HDLogicalSourceEntity_ownerBundleIDForLogicalSourceID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (id)lookUpOrCreateLogicalSourceWithBundleIdentifier:(id)a3 owningAppBundleIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDLogicalSourceEntity.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

  }
  if (objc_msgSend(MEMORY[0x1E0CB6C18], "_isPlaceholderBundleIdentifier:", v11))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 3, CFSTR("Invalid bundle identifier '%@'"), v11);
    v14 = 0;
  }
  else
  {
    objc_msgSend(v13, "databaseForEntityClass:", a1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__39;
    v45 = __Block_byref_object_dispose__39;
    v46 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke;
    v38[3] = &unk_1E6CEF160;
    v39 = v12;
    v40 = a1;
    v35[0] = v15;
    v35[1] = 3221225472;
    v35[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_2;
    v35[3] = &unk_1E6CE7750;
    v16 = v11;
    v36 = v16;
    v17 = v39;
    v37 = v17;
    v34[0] = v15;
    v34[1] = 3221225472;
    v34[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_3;
    v34[3] = &unk_1E6CE8540;
    v34[4] = &v41;
    if ((objc_msgSend(v29, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error__key, a6, v38, v35, v34) & 1) != 0)
    {
      if (v42[5])
      {
        +[HDSQLiteEntity entityWithPersistentID:](HDLogicalSourceEntity, "entityWithPersistentID:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "databaseForEntityClass:", a1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v15;
        v33[1] = 3221225472;
        v33[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_224;
        v33[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v33[4] = a1;
        v30[0] = v15;
        v30[1] = 3221225472;
        v30[2] = __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_2_227;
        v30[3] = &unk_1E6CE7750;
        v31 = v16;
        v32 = v17;
        v21 = objc_msgSend(v20, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error__insertKey, a6, v33, v30, 0);

        if ((v21 & 1) != 0)
        {
          objc_msgSend(v13, "unprotectedDatabase");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lastInsertRowID");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v42[5];
          v42[5] = v23;

          +[HDSQLiteEntity entityWithPersistentID:](HDLogicalSourceEntity, "entityWithPersistentID:", v42[5]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          _HKInitializeLogging();
          v25 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
          {
            if (a6)
              v26 = *a6;
            else
              v26 = 0;
            *(_DWORD *)buf = 138543362;
            v48 = v26;
            _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_INFO, "Unable to insert logical source : %{public}@", buf, 0xCu);
          }
          v14 = 0;
        }

      }
    }
    else
    {
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
        if (a6)
          v19 = *a6;
        else
          v19 = 0;
        *(_DWORD *)buf = 138543362;
        v48 = v19;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "Unable to look up logical source: %{public}@", buf, 0xCu);
      }
      v14 = 0;
    }

    _Block_object_dispose(&v41, 8);
  }

  return v14;
}

id __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v1 = CFSTR(" = ");
  v2 = *(void **)(a1 + 40);
  if (!*(_QWORD *)(a1 + 32))
    v1 = CFSTR(" IS ");
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *MEMORY[0x1E0D29618];
  v5 = v1;
  objc_msgSend(v2, "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? AND %@ %@ ?"), v4, v6, CFSTR("bundle_id"), CFSTR("owner_bundle_id"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  if (*(_QWORD *)(a1 + 40))
    return HDSQLiteBindStringToStatement();
  else
    return sqlite3_bind_null(a2, 2);
}

uint64_t __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

id __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_224(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@) VALUES (?, ?)"), v2, CFSTR("bundle_id"), CFSTR("owner_bundle_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __117__HDLogicalSourceEntity_lookUpOrCreateLogicalSourceWithBundleIdentifier_owningAppBundleIdentifier_transaction_error___block_invoke_2_227(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  if (*(_QWORD *)(a1 + 40))
    return HDSQLiteBindStringToStatement();
  else
    return sqlite3_bind_null(a2, 2);
}

+ (BOOL)deleteLogicalSourceEntitiesIfNecessaryWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__HDLogicalSourceEntity_deleteLogicalSourceEntitiesIfNecessaryWithTransaction_error___block_invoke;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a1;
  LOBYTE(a4) = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteLogicalSourceEntitiesIfNecessaryWithTransaction_error__lookupKey, a4, v8, 0, 0);

  return (char)a4;
}

id __85__HDLogicalSourceEntity_deleteLogicalSourceEntitiesIfNecessaryWithTransaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D29618];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ NOT IN (SELECT DISTINCT(%@) FROM %@)"), v2, v3, CFSTR("logical_source_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
