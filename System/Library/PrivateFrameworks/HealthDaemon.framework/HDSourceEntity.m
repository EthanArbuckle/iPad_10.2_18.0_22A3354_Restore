@implementation HDSourceEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)propertyForSyncAnchor
{
  return CFSTR("sync_anchor");
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("provenance");
}

+ (id)sourceForLocalDeviceWithDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  HDSourceEntityPredicateForLocalDeviceSource();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSourceEntity _firstSourceWithPredicate:database:error:]((uint64_t)a1, v7, v6, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_firstSourceWithPredicate:(void *)a3 database:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD block[5];

  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HDSourceEntity__firstSourceWithPredicate_database_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v8;
  if (qword_1ED552220 != -1)
    dispatch_once(&qword_1ED552220, block);
  objc_msgSend(v8, "firstInDatabase:predicate:orderingTerms:error:", v6, v7, _MergedGlobals_200, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)sourceWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HDSourceEntity *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__45;
  v21 = __Block_byref_object_dispose__45;
  v22 = 0;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__HDSourceEntity_sourceWithProfile_error___block_invoke;
  v13[3] = &unk_1E6CEB640;
  v9 = v6;
  v14 = v9;
  v15 = self;
  v16 = &v17;
  LODWORD(a4) = objc_msgSend(v7, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v13);

  if ((_DWORD)a4)
    v10 = (void *)v18[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __42__HDSourceEntity_sourceWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  +[HDSourceEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDSourceEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v5, v6, 1, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  objc_msgSend(v7, "orderedProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__HDSourceEntity_sourceWithProfile_error___block_invoke_2;
  v14[3] = &unk_1E6CEFFE0;
  v15 = v7;
  v16 = *(_OWORD *)(a1 + 40);
  v11 = v7;
  v12 = objc_msgSend(v9, "getValuesForProperties:database:error:handler:", v10, v8, a3, v14);

  return v12;
}

void __42__HDSourceEntity_sourceWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 40), "persistentID");
  v15 = 0;
  objc_msgSend(v5, "objectForPersistentID:row:error:", v6, a3, &v15);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v8;
      v14 = v13;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to instantiate source: %{public}@", buf, 0x16u);

    }
  }

}

+ (id)firstSourceWithPredicate:(id)a3 database:(id)a4 error:(id *)a5
{
  return +[HDSourceEntity _firstSourceWithPredicate:database:error:]((uint64_t)a1, a3, a4, (uint64_t)a5);
}

- (id)sourceUUIDWithHealthDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("uuid"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HDUUIDForSQLiteValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)databaseTable
{
  return CFSTR("sources");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSourceEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("logical_source_id");
  +[HDHealthEntity defaultForeignKey](HDLogicalSourceEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v19 = CFSTR("logical_source_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("logical_source_id"), v4);
  v20[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D29860]);
  v7 = objc_opt_class();
  v18 = CFSTR("provenance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithEntity:name:columns:", v7, CFSTR("provenance"), v8);
  v20[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D29860]);
  v11 = objc_opt_class();
  v17 = CFSTR("local_device");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = 1"), CFSTR("local_device"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithEntity:name:columns:unique:predicateString:", v11, CFSTR("local_device"), v12, 0, v13);
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("logical_sources.bundle_id")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("logical_sources.owner_bundle_id")))
  {
    v5 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v6, objc_opt_class(), 0, CFSTR("logical_source_id"), *MEMORY[0x1E0D29618]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDSourceEntity;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDSourceEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDSourceEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)insertSourceWithUUID:(id)a3 logicalSourceID:(int64_t)a4 name:(id)a5 options:(unint64_t)a6 isCurrentDevice:(BOOL)a7 productType:(id)a8 deleted:(BOOL)a9 modificationDate:(id)a10 provenance:(int64_t)a11 syncIdentity:(int64_t)a12 transaction:(id)a13 error:(id *)a14
{
  id v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  HDSourceEntity *v28;
  HDSourceEntity *v29;
  void *v30;
  void *v32;
  void *v35;
  _QWORD v36[4];
  id v37;
  __CFString *v38;
  __CFString *v39;
  id v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  int64_t v44;
  BOOL v45;
  BOOL v46;
  _QWORD v47[6];

  v17 = a3;
  v18 = (__CFString *)a5;
  v19 = (__CFString *)a8;
  v20 = a10;
  v21 = a13;
  v22 = objc_opt_self();
  if (v17)
  {
    if (!a9)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error_, v22, CFSTR("HDSourceEntity.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UUID != nil"));

  if (a9)
  {
LABEL_3:

    a6 = 0;
    v19 = &stru_1E6D11BB8;
    v18 = &stru_1E6D11BB8;
  }
LABEL_4:
  v35 = v21;
  objc_msgSend(v21, "databaseForEntityClass:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __164__HDSourceEntity__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error___block_invoke;
  v47[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v47[4] = v22;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __164__HDSourceEntity__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error___block_invoke_2;
  v36[3] = &unk_1E6CEFEF8;
  v24 = v17;
  v37 = v24;
  v41 = a4;
  v25 = v18;
  v38 = v25;
  v42 = a6;
  v45 = a7;
  v26 = v19;
  v39 = v26;
  v46 = a9;
  v27 = v20;
  v40 = v27;
  v43 = a11;
  v44 = a12;
  v28 = 0;
  if (objc_msgSend(v23, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error__insertKey, a14, v47, v36, 0))
  {
    notify_post((const char *)*MEMORY[0x1E0CB77D8]);
    v29 = [HDSourceEntity alloc];
    objc_msgSend(v23, "lastInsertRowID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HDSQLiteEntity initWithPersistentID:](v29, "initWithPersistentID:", objc_msgSend(v30, "longLongValue"));

  }
  return v28;
}

id __164__HDSourceEntity__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(%@) + 1 FROM %@), 1), ?)"), v3, CFSTR("uuid"), CFSTR("logical_source_id"), CFSTR("name"), CFSTR("source_options"), CFSTR("local_device"), CFSTR("product_type"), CFSTR("deleted"), CFSTR("mod_date"), CFSTR("provenance"), CFSTR("sync_anchor"), CFSTR("sync_identity"), CFSTR("sync_anchor"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __164__HDSourceEntity__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 64));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 72));
  sqlite3_bind_int(a2, 5, *(unsigned __int8 *)(a1 + 96));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int(a2, 7, *(unsigned __int8 *)(a1 + 97));
  if (*(_QWORD *)(a1 + 56))
  {
    HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindFoundationValueToStatement();

  }
  sqlite3_bind_int64(a2, 9, *(_QWORD *)(a1 + 80));
  return sqlite3_bind_int64(a2, 10, *(_QWORD *)(a1 + 88));
}

+ (id)sourceForLogicalSourceID:(id)a3 localDeviceBundleIdentifier:(BOOL)a4 localOnly:(BOOL)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  BOOL v23;
  BOOL v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v12 = a3;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__45;
  v30 = __Block_byref_object_dispose__45;
  v31 = 0;
  objc_msgSend(v13, "databaseForEntityClass:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke_2;
  v21[3] = &unk_1E6CEFF20;
  v23 = a5;
  v24 = a4;
  v16 = v12;
  v22 = v16;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke_3;
  v20[3] = &unk_1E6CE8540;
  v20[4] = &v26;
  if (objc_msgSend(v14, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error__lookupKey, a7, v25, v21, v20))v17 = (void *)v27[5];
  else
    v17 = 0;
  v18 = v17;

  _Block_object_dispose(&v26, 8);
  return v18;
}

id __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT ROWID FROM %@ WHERE ((%@ = ? AND ? = 0) OR (%@ = 1 AND ? = 1)) AND (%@ = ? OR 0 = ?) ORDER BY %@ ASC"), v2, CFSTR("logical_source_id"), CFSTR("local_device"), CFSTR("provenance"), CFSTR("provenance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3;
  sqlite3_int64 v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 41);
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int64(a2, 2, v4);
  sqlite3_bind_int64(a2, 3, v4);
  sqlite3_bind_int64(a2, 4, 0);
  return sqlite3_bind_int64(a2, 5, v3);
}

uint64_t __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke_3(uint64_t a1)
{
  HDSourceEntity *v2;
  uint64_t v3;
  void *v4;

  v2 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

+ (id)firstSourceWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_self();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__45;
  v23 = __Block_byref_object_dispose__45;
  v24 = 0;
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__HDSourceEntity__firstSourceWithPredicate_profile_error___block_invoke;
  v15[3] = &unk_1E6CEC940;
  v17 = &v19;
  v18 = v9;
  v11 = v7;
  v16 = v11;
  LODWORD(a5) = objc_msgSend(v9, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v15);

  if ((_DWORD)a5)
    v12 = (void *)v20[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

+ (id)sourcesWithPredicate:(id)a3 includeDeleted:(BOOL)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_opt_self();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__45;
  v26 = __Block_byref_object_dispose__45;
  v27 = 0;
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__HDSourceEntity__sourcesWithPredicate_includeDeleted_profile_error___block_invoke;
  v17[3] = &unk_1E6CEFF98;
  v19 = &v22;
  v20 = v11;
  v13 = v9;
  v18 = v13;
  v21 = a4;
  LODWORD(a6) = objc_msgSend(v11, "performReadTransactionWithHealthDatabase:error:block:", v12, a6, v17);

  if ((_DWORD)a6)
    v14 = (void *)v23[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v22, 8);
  return v15;
}

+ (id)sourcesWithPredicate:(id)a3 includeDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a1, "sourcesWithPredicate:orderingTerms:includeDeleted:database:error:", a3, 0, a4, a5, a6);
}

+ (id)sourcesWithPredicate:(id)a3 orderingTerms:(id)a4 includeDeleted:(BOOL)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!a5)
  {
    _HDSourceEntityPredicateForNotDeletedWithPredicate(v12);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v15;
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v14, v12, 0, v13, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("logical_sources.bundle_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__HDSourceEntity_sourcesWithPredicate_orderingTerms_includeDeleted_database_error___block_invoke;
  v24[3] = &unk_1E6CEC918;
  v25 = v16;
  v26 = a1;
  v19 = v16;
  v20 = objc_msgSend(v17, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v18, a7, v24);

  if (v20)
    v21 = v19;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

uint64_t __83__HDSourceEntity_sourcesWithPredicate_orderingTerms_includeDeleted_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithPersistentID:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

+ (BOOL)enumerateBundleIdentifiersForSourcesWithPredicate:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a4;
  _HDSourceEntityPredicateForNotDeletedWithPredicate(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v13, "setEntityClass:", a1);
  objc_msgSend(v13, "setPredicate:", v12);
  objc_msgSend(v13, "setReturnsDistinctEntities:", 1);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v11, v13);

  v20[0] = CFSTR("logical_sources.bundle_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__HDSourceEntity_enumerateBundleIdentifiersForSourcesWithPredicate_database_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E6CE91B8;
  v19 = v10;
  v16 = v10;
  LOBYTE(a5) = objc_msgSend(v14, "enumerateProperties:error:enumerationHandler:", v15, a5, v18);

  return (char)a5;
}

uint64_t __102__HDSourceEntity_enumerateBundleIdentifiersForSourcesWithPredicate_database_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v3 = *(id *)(a1 + 32);
  v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __102__HDSourceEntity_enumerateBundleIdentifiersForSourcesWithPredicate_database_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v3 = 1;

  return v3;
}

+ (BOOL)enumerateBundleIdentifiersForSourcesForUUIDData:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD *v25;
  id v26;
  _QWORD v27[4];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__45;
  v32 = __Block_byref_object_dispose__45;
  v33 = 0;
  objc_msgSend(v11, "databaseForEntityClass:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E6CEFF70;
  v23 = &v34;
  v14 = v13;
  v26 = a1;
  v21 = v14;
  v24 = &v28;
  v15 = v12;
  v22 = v15;
  v25 = v27;
  objc_msgSend(v10, "hk_enumerateUUIDBytesUsingBlock:", v20);
  v16 = *((unsigned __int8 *)v35 + 24);
  if (!*((_BYTE *)v35 + 24))
  {
    v17 = (id)v29[5];
    v18 = v17;
    if (v17)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

  }
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v16 != 0;
}

void __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__45;
  v21 = __Block_byref_object_dispose__45;
  v22 = 0;
  v6 = (void *)a1[4];
  v16 = 0;
  v14[4] = a2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_2;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v15[4] = a1[9];
  v13[4] = &v17;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_3;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_4;
  v13[3] = &unk_1E6CE8540;
  v7 = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_SourceEntityLogicalSourceOwnerBundleIdentifier_block_invoke_lookupKey, &v16, v15, v14, v13);
  v8 = v16;
  v9 = v16;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (v18[5])
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      _HKInitializeLogging();
      v10 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v24 = v11;
        v25 = 1042;
        v26 = 16;
        v27 = 2098;
        v28 = a2;
        v12 = v11;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: failed to find source for UUID %{public, uuid}.16P", buf, 0x1Cu);

      }
    }
    ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v8);
    *a3 = 1;
  }
  _Block_object_dispose(&v17, 8);

}

id __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D29618];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ JOIN %@ ON %@.%@ = %@.%@ WHERE %@.%@ = ? AND %@.%@ = 0"), CFSTR("logical_sources.bundle_id"), v3, v4, v5, CFSTR("logical_source_id"), v6, v7, v8, CFSTR("uuid"), v9, CFSTR("deleted"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_blob(a2, 1, *(const void **)(a1 + 32), 16, 0);
}

uint64_t __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_4(uint64_t a1, uint64_t a2)
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

BOOL __69__HDSourceEntity__sourcesWithPredicate_includeDeleted_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourcesWithPredicate:orderingTerms:includeDeleted:database:error:", v6, 0, v7, v8, a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

BOOL __58__HDSourceEntity__firstSourceWithPredicate_profile_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  id v13;
  id v15;

  objc_msgSend(a2, "databaseForEntityClass:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[6];
  v7 = (void *)a1[4];
  v15 = 0;
  +[HDSourceEntity _firstSourceWithPredicate:database:error:](v6, v7, v5, (uint64_t)&v15);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v12 = 1;
  }
  else
  {
    v13 = v9;
    v12 = v13 == 0;
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

  }
  return v12;
}

void __59__HDSourceEntity__firstSourceWithPredicate_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29618], *(_QWORD *)(a1 + 32), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_200;
  _MergedGlobals_200 = v2;

}

- (id)codableSourceWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HDSourceEntity *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__45;
  v19 = __Block_byref_object_dispose__45;
  v20 = 0;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HDSourceEntity_codableSourceWithProfile_error___block_invoke;
  v11[3] = &unk_1E6CF0008;
  v8 = v6;
  v13 = self;
  v14 = &v15;
  v12 = v8;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, a4, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __49__HDSourceEntity_codableSourceWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  +[HDSourceEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDSourceEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v5, v6, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "codableSourceWithEncoder:transaction:profile:error:", v7, v6, *(_QWORD *)(a1 + 32), a3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return 1;
}

- (id)codableSourceWithEncoder:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  HDSourceEntity *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v11, "purpose"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceEntity.m"), 550, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[entityEncoder purpose] == HDEntityEncodingPurposeCodableObjectCreation"));

  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__45;
  v41 = __Block_byref_object_dispose__45;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_msgSend(v11, "orderedProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __69__HDSourceEntity_codableSourceWithEncoder_transaction_profile_error___block_invoke;
  v28[3] = &unk_1E6CF0030;
  v31 = &v33;
  v32 = &v37;
  v17 = v11;
  v29 = v17;
  v30 = self;
  v18 = -[HDHealthEntity getValuesForProperties:healthDatabase:error:handler:](self, "getValuesForProperties:healthDatabase:error:handler:", v14, v16, a6, v28);

  objc_msgSend(v13, "syncIdentityManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identityForEntityID:transaction:error:", v34[3], v12, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)v38[5];
    objc_msgSend(v20, "identity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "codableSyncIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSyncIdentity:", v23);

    if (v18)
      v24 = (void *)v38[5];
    else
      v24 = 0;
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v25;
}

void __69__HDSourceEntity_codableSourceWithEncoder_transaction_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(*(id *)(a1 + 40), "persistentID"), a3, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)sourceUUIDWithProfile:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("uuid"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HDUUIDForSQLiteValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)setName:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v15[0] = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[HDSourceEntity _updateValues:forProperties:profile:didUpdate:error:]((uint64_t)self, v11, v12, v9, 0, (uint64_t)a5);
  return (char)a5;
}

- (uint64_t)_updateValues:(void *)a3 forProperties:(void *)a4 profile:(uint64_t)a5 didUpdate:(uint64_t)a6 error:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  if (a1)
  {
    v14 = objc_msgSend(v11, "count");
    if (v14 != objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateValues_forProperties_profile_didUpdate_error_, a1, CFSTR("HDSourceEntity.m"), 633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values.count == properties.count"));

    }
    if (objc_msgSend(v12, "count"))
    {
      v39 = a5;
      v40 = a6;
      objc_msgSend(v13, "syncIdentityManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentSyncIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "entity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v17, "persistentID");

      v18 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = COALESCE((SELECT MAX(%@) + 1 FROM %@), 1), %@ = ?, %@ = ?"), v19, CFSTR("sync_anchor"), CFSTR("sync_anchor"), v20, CFSTR("mod_date"), CFSTR("sync_identity"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v22 = v12;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v51;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v51 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(v21, "appendFormat:", CFSTR(", %@ = ?"), *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v26++));
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v24);
      }

      objc_msgSend(v21, "appendFormat:", CFSTR(" WHERE %@ = ? AND (0"), *MEMORY[0x1E0D29618]);
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v27 = v22;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v47;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v47 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(v21, "appendFormat:", CFSTR(" OR %@ != ?"), *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v31++));
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        }
        while (v29);
      }

      objc_msgSend(v21, "appendString:", CFSTR(")"));
      v32 = (void *)objc_opt_class();
      objc_msgSend(v13, "database");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __70__HDSourceEntity__updateValues_forProperties_profile_didUpdate_error___block_invoke;
      v41[3] = &unk_1E6CE9208;
      v41[4] = a1;
      v42 = v21;
      v44 = v38;
      v43 = v11;
      v45 = v39;
      v34 = v21;
      v35 = objc_msgSend(v32, "performWriteTransactionWithHealthDatabase:error:block:", v33, v40, v41);

    }
    else
    {
      v35 = 1;
    }
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (BOOL)setOptions:(unint64_t)a3 profile:(id)a4 didUpdate:(BOOL *)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  objc_msgSend(v10, "numberWithUnsignedLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("source_options");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[HDSourceEntity _updateValues:forProperties:profile:didUpdate:error:]((uint64_t)self, v13, v14, v11, (uint64_t)a5, (uint64_t)a6);

  return (char)a6;
}

- (BOOL)adoptAsLocalSourceWithLogicalSourceID:(id)a3 UUID:(id)a4 name:(id)a5 productType:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void *)objc_opt_class();
  objc_msgSend(v18, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __92__HDSourceEntity_adoptAsLocalSourceWithLogicalSourceID_UUID_name_productType_profile_error___block_invoke;
  v27[3] = &unk_1E6CF0058;
  v27[4] = self;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  LOBYTE(a8) = objc_msgSend(v19, "performWriteTransactionWithHealthDatabase:error:block:", v20, a8, v27);

  return (char)a8;
}

uint64_t __92__HDSourceEntity_adoptAsLocalSourceWithLogicalSourceID_UUID_name_productType_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("UPDATE %@ SET %@=0"), v7, CFSTR("local_device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v9, "executeUncachedSQL:error:", v8, a3);
  if ((_DWORD)v6)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v18[0] = *(_QWORD *)(a1 + 40);
    v18[1] = v11;
    v18[2] = &unk_1E6DFAC88;
    v18[3] = v12;
    v18[4] = *(_QWORD *)(a1 + 64);
    v18[5] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("logical_source_id");
    v17[1] = CFSTR("uuid");
    v17[2] = CFSTR("provenance");
    v17[3] = CFSTR("name");
    v17[4] = CFSTR("product_type");
    v17[5] = CFSTR("local_device");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HDSourceEntity _updateValues:forProperties:profile:didUpdate:error:](v10, v13, v14, *(void **)(a1 + 72), 0, a3);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __70__HDSourceEntity__updateValues_forProperties_profile_didUpdate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a2, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HDSourceEntity__updateValues_forProperties_profile_didUpdate_error___block_invoke_2;
  v11[3] = &unk_1E6CF0080;
  v14 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v9 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", v6, a3, v11, 0);
  if ((_DWORD)v9 && *(_QWORD *)(a1 + 64))
    **(_BYTE **)(a1 + 64) = (int)objc_msgSend(v5, "getChangesCount") > 0;

  return v9;
}

uint64_t __70__HDSourceEntity__updateValues_forProperties_profile_didUpdate_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double Current;
  int v5;

  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 48));
  v5 = HDSQLiteBindFoundationValuesToStatement();
  sqlite3_bind_int64(a2, v5, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  return HDSQLiteBindFoundationValuesToStatement();
}

- (id)sourceBundleIdentifierInDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
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
  v16 = __Block_byref_object_copy__45;
  v17 = __Block_byref_object_dispose__45;
  v18 = 0;
  v11[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke;
  v12[3] = &unk_1E6CEB2F8;
  v12[4] = self;
  v10[4] = &v13;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke_2;
  v11[3] = &unk_1E6CE9508;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke_3;
  v10[3] = &unk_1E6CE8540;
  if (objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &sourceBundleIdentifierInDatabase_error__lookupKey, a4, v12, v11, v10))v7 = (void *)v14[5];
  else
    v7 = 0;
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

id __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLogicalSourceEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D29618];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ JOIN %@ ON %@.%@ = %@.%@ WHERE %@.%@ = ?"), CFSTR("logical_sources.bundle_id"), v1, v2, v3, CFSTR("logical_source_id"), v4, v5, v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

- (BOOL)deleteSourceWithTombstoneLogicalSourceID:(int64_t)a3 syncIdentity:(int64_t)a4 database:(id)a5 transaction:(id)a6 error:(id *)a7
{
  int v7;
  _QWORD v9[7];
  _QWORD v10[5];

  v9[6] = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke;
  v10[3] = &unk_1E6CEB2F8;
  v10[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke_2;
  v9[3] = &unk_1E6CE8518;
  v9[4] = self;
  v9[5] = a3;
  v7 = objc_msgSend(a5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error__updateKey, a7, v10, v9, &__block_literal_global_50);
  if (v7)
    notify_post((const char *)*MEMORY[0x1E0CB77D8]);
  return v7;
}

id __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = '', %@ = 0, %@ = 0, %@ = '', %@ = 1, %@ = (SELECT MAX(%@) + 1 FROM %@) WHERE %@ = ? AND %@ == 0"), v1, CFSTR("mod_date"), CFSTR("provenance"), CFSTR("logical_source_id"), CFSTR("sync_identity"), CFSTR("name"), CFSTR("source_options"), CFSTR("local_device"), CFSTR("product_type"), CFSTR("deleted"), CFSTR("sync_anchor"), CFSTR("sync_anchor"), v2, *MEMORY[0x1E0D29618], CFSTR("deleted"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double Current;

  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  sqlite3_bind_int64(a2, 2, 0);
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 48));
  return sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke_3()
{
  return 0;
}

- (id)unitTest_logicalSourceEntityWithHealthDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__45;
  v15 = __Block_byref_object_dispose__45;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HDSourceEntity_unitTest_logicalSourceEntityWithHealthDatabase_error___block_invoke;
  v10[3] = &unk_1E6CEF700;
  v10[4] = self;
  v10[5] = &v11;
  if (+[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v6, a4, v10))
  {
    v7 = (void *)v12[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

BOOL __71__HDSourceEntity_unitTest_logicalSourceEntityWithHealthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "foreignKeyEntity:forProperty:transaction:error:", objc_opt_class(), CFSTR("logical_source_id"), v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

@end
