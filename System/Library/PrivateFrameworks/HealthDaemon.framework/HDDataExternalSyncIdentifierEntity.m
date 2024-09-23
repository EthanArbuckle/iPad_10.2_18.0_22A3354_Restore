@implementation HDDataExternalSyncIdentifierEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("external_sync_ids");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_70;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("object_id");
  +[HDDataEntity defaultForeignKey](HDDataEntity, "defaultForeignKey");
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
  void *v6;
  _QWORD v8[4];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v8[0] = CFSTR("source_id");
  v8[1] = CFSTR("object_code");
  v8[2] = CFSTR("sid");
  v8[3] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("source_object_code_sid_deleted"), v4);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)populateSyncInfoForLocalSourceID:(int64_t)a3 externalSyncObjectCode:(int64_t)a4 syncIdentifier:(id)a5 deleted:(BOOL)a6 database:(id)a7 objectIDOut:(id *)a8 errorOut:(id *)a9
{
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v15 = a5;
  v16 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataExternalSyncIdentifierEntity.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__142;
  v31 = __Block_byref_object_dispose__142;
  v32 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __147__HDDataExternalSyncIdentifierEntity_populateSyncInfoForLocalSourceID_externalSyncObjectCode_syncIdentifier_deleted_database_objectIDOut_errorOut___block_invoke;
  v23[3] = &unk_1E6CE8518;
  v25 = a3;
  v26 = a4;
  v18 = v15;
  v24 = v18;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __147__HDDataExternalSyncIdentifierEntity_populateSyncInfoForLocalSourceID_externalSyncObjectCode_syncIdentifier_deleted_database_objectIDOut_errorOut___block_invoke_2;
  v22[3] = &unk_1E6CE8540;
  v22[4] = &v27;
  v19 = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT object_id FROM external_sync_ids WHERE source_id = ? AND object_code = ? AND sid = ? AND NOT deleted"), a9, v23, v22);
  *a8 = objc_retainAutorelease((id)v28[5]);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __147__HDDataExternalSyncIdentifierEntity_populateSyncInfoForLocalSourceID_externalSyncObjectCode_syncIdentifier_deleted_database_objectIDOut_errorOut___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 48));
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __147__HDDataExternalSyncIdentifierEntity_populateSyncInfoForLocalSourceID_externalSyncObjectCode_syncIdentifier_deleted_database_objectIDOut_errorOut___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

+ (BOOL)populateSyncInfoForObjectID:(int64_t)a3 database:(id)a4 localSourceIDOut:(int64_t *)a5 externalSyncObjectCodeOut:(int64_t *)a6 syncIdentifierOut:(id *)a7 syncVersionOut:(id *)a8 deletedOut:(BOOL *)a9 errorOut:(id *)a10
{
  id v17;
  char v18;
  void *v20;
  _QWORD v21[9];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v17 = a4;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataExternalSyncIdentifierEntity.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__142;
  v37 = __Block_byref_object_dispose__142;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__142;
  v31 = __Block_byref_object_dispose__142;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v21[8] = &v23;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __171__HDDataExternalSyncIdentifierEntity_populateSyncInfoForObjectID_database_localSourceIDOut_externalSyncObjectCodeOut_syncIdentifierOut_syncVersionOut_deletedOut_errorOut___block_invoke;
  v22[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v22[4] = a3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __171__HDDataExternalSyncIdentifierEntity_populateSyncInfoForObjectID_database_localSourceIDOut_externalSyncObjectCodeOut_syncIdentifierOut_syncVersionOut_deletedOut_errorOut___block_invoke_2;
  v21[3] = &unk_1E6D00330;
  v21[4] = &v43;
  v21[5] = &v39;
  v21[6] = &v33;
  v21[7] = &v27;
  v18 = objc_msgSend(v17, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT source_id, object_code, sid, version, deleted FROM external_sync_ids WHERE object_id = ?"), a10, v22, v21);
  if (a5)
    *a5 = v44[3];
  if (a6)
    *a6 = v40[3];
  if (a9)
    *a9 = *((_BYTE *)v24 + 24);
  *a7 = objc_retainAutorelease((id)v34[5]);
  *a8 = objc_retainAutorelease((id)v28[5]);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v18;
}

uint64_t __171__HDDataExternalSyncIdentifierEntity_populateSyncInfoForObjectID_database_localSourceIDOut_externalSyncObjectCodeOut_syncIdentifierOut_syncVersionOut_deletedOut_errorOut___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __171__HDDataExternalSyncIdentifierEntity_populateSyncInfoForObjectID_database_localSourceIDOut_externalSyncObjectCodeOut_syncIdentifierOut_syncVersionOut_deletedOut_errorOut___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1D4](a2, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  MEMORY[0x1BCCAB1C8](a2, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = MEMORY[0x1BCCAB174](a2, 4);
  return 0;
}

+ (BOOL)insertSyncIdentifierWithProfile:(id)a3 database:(id)a4 objectID:(int64_t)a5 localSourceID:(int64_t)a6 externalSyncObjectCode:(int64_t)a7 syncIdentifier:(id)a8 syncVersion:(id)a9 deleted:(BOOL)a10 errorOut:(id *)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  BOOL v34;

  v27 = a3;
  v18 = a4;
  v19 = a8;
  v20 = a9;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataExternalSyncIdentifierEntity.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncIdentifier != nil"));

  }
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDataExternalSyncIdentifierEntity.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncVersion != nil"));

  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __169__HDDataExternalSyncIdentifierEntity_insertSyncIdentifierWithProfile_database_objectID_localSourceID_externalSyncObjectCode_syncIdentifier_syncVersion_deleted_errorOut___block_invoke;
  v28[3] = &unk_1E6D00358;
  v31 = a5;
  v32 = a6;
  v33 = a7;
  v29 = v19;
  v30 = v20;
  v34 = a10;
  v21 = v20;
  v22 = v19;
  v23 = objc_msgSend(v18, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO external_sync_ids (object_id, source_id, object_code, sid, version, deleted) VALUES (?, ?, ?, ?, ?, ?)"), a11, v28, 0);

  return v23;
}

uint64_t __169__HDDataExternalSyncIdentifierEntity_insertSyncIdentifierWithProfile_database_objectID_localSourceID_externalSyncObjectCode_syncIdentifier_syncVersion_deleted_errorOut___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 56));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 64));
  HDSQLiteBindStringToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int(a2, 6, *(unsigned __int8 *)(a1 + 72));
}

+ (BOOL)enumerateValuesWithProfile:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v16[0] = CFSTR("object_id");
  v16[1] = CFSTR("source_id");
  v16[2] = CFSTR("object_code");
  v16[3] = CFSTR("sid");
  v16[4] = CFSTR("version");
  v16[5] = CFSTR("deleted");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v16, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__HDDataExternalSyncIdentifierEntity_enumerateValuesWithProfile_error_handler___block_invoke;
  v14[3] = &unk_1E6CE84F0;
  v15 = v7;
  v12 = v7;
  LOBYTE(a4) = +[HDHealthEntity enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:](HDDataExternalSyncIdentifierEntity, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v10, 0, v11, a4, v14);

  return (char)a4;
}

uint64_t __79__HDDataExternalSyncIdentifierEntity_enumerateValuesWithProfile_error_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNumber();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsBoolean();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return 1;
}

@end
