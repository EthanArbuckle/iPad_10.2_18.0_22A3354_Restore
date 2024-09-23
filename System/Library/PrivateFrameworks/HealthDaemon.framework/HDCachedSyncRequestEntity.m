@implementation HDCachedSyncRequestEntity

+ (id)databaseTable
{
  return CFSTR("cached_sync_requests");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 16;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCachedSyncRequestEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (BOOL)insertSyncRequest:(id)a3 reason:(id)a4 date:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(a6, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke;
  v20[3] = &unk_1E6CE7C58;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = a1;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  LOBYTE(a7) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedSyncRequestEntity, "performWriteTransactionWithHealthDatabase:error:block:", v15, a7, v20);

  return (char)a7;
}

uint64_t __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke_2;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v12[4] = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke_3;
  v8[3] = &unk_1E6CE7C30;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v6 = objc_msgSend(v5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCachedSyncRequestEntityCreationDate_block_invoke_lookupKey, a3, v12, v8, 0);

  return v6;
}

id __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), v2, CFSTR("context_sync_pull"), CFSTR("context_sync_push"), CFSTR("state_sync"), CFSTR("changes_sync_pull"), CFSTR("changes_sync_push"), CFSTR("changes_sync_fast"), CFSTR("medical_id"), CFSTR("summary_sharing_pull"), CFSTR("summary_sharing_push"), CFSTR("allow_cellular"), CFSTR("qos"), CFSTR("request_state"), CFSTR("identifier"), CFSTR("reason"), CFSTR("creation_date"),
    0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(*(id *)(a1 + 32), "contextSyncRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "contextSyncRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 1, objc_msgSend(v5, "pull"));

  }
  else
  {
    sqlite3_bind_int64(a2, 1, 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "contextSyncRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "contextSyncRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 2, objc_msgSend(v7, "push"));

  }
  else
  {
    sqlite3_bind_int64(a2, 2, 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "stateSyncRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 3, v8 != 0);

  objc_msgSend(*(id *)(a1 + 32), "changesSyncRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "changesSyncRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 4, objc_msgSend(v10, "pull"));

  }
  else
  {
    sqlite3_bind_int64(a2, 4, 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "changesSyncRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "changesSyncRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 5, objc_msgSend(v12, "push"));

  }
  else
  {
    sqlite3_bind_int64(a2, 5, 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "changesSyncRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "changesSyncRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 6, objc_msgSend(v14, "lite"));

  }
  else
  {
    sqlite3_bind_int64(a2, 6, 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "medicalIDSyncRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 7, v15 != 0);

  objc_msgSend(*(id *)(a1 + 32), "summarySharingSyncRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "summarySharingSyncRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 8, objc_msgSend(v17, "pull"));

  }
  else
  {
    sqlite3_bind_int64(a2, 8, 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "summarySharingSyncRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "summarySharingSyncRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 9, objc_msgSend(v19, "push"));

  }
  else
  {
    sqlite3_bind_int64(a2, 9, 0);
  }

  sqlite3_bind_int64(a2, 10, objc_msgSend(*(id *)(a1 + 32), "allowCellular"));
  sqlite3_bind_int64(a2, 11, objc_msgSend(*(id *)(a1 + 32), "qualityOfService"));
  sqlite3_bind_int64(a2, 12, 0);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)markPendingRequestsAsInProgress:(id)a3 error:(id *)a4
{
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HDCachedSyncRequestEntity_markPendingRequestsAsInProgress_error___block_invoke;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a1;
  LOBYTE(a4) = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &markPendingRequestsAsInProgress_error__lookupKey, a4, v8, &__block_literal_global_0, 0);

  return (char)a4;
}

id __67__HDCachedSyncRequestEntity_markPendingRequestsAsInProgress_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ?"), v2, CFSTR("request_state"), CFSTR("request_state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __67__HDCachedSyncRequestEntity_markPendingRequestsAsInProgress_error___block_invoke_2(int a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 1);
  return sqlite3_bind_int64(a2, 2, 0);
}

+ (BOOL)markInProgressRequestsAsPending:(id)a3 error:(id *)a4
{
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  v8[4] = a1;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedSyncRequestEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a4, v8);

  return (char)a4;
}

uint64_t __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke_2;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCachedSyncRequestEntityCreationDate_block_invoke_2_lookupKey, a3, v8, &__block_literal_global_233, 0);

  return v6;
}

id __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ?"), v2, CFSTR("request_state"), CFSTR("request_state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke_3(int a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 0);
  return sqlite3_bind_int64(a2, 2, 1);
}

+ (BOOL)fetchCoalescedSyncRequest:(id *)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  os_log_t *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0CB6430], "emptySyncRequest");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__HDCachedSyncRequestEntity_fetchCoalescedSyncRequest_transaction_error___block_invoke;
  v17[3] = &unk_1E6CE7D00;
  v19 = &v21;
  v20 = a1;
  v10 = v9;
  v18 = v10;
  v11 = +[HDCachedSyncRequestEntity _enumerateOverAllSyncRequests:error:enumerationHandler:]((uint64_t)a1, v8, (uint64_t)a5, v17);
  _HKInitializeLogging();
  v12 = (os_log_t *)MEMORY[0x1E0CB52C0];
  v13 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)v22[5];
    *(_DWORD *)buf = 138543362;
    v28 = v14;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "Coalesced sync request: \n%{public}@", buf, 0xCu);
  }
  _HKInitializeLogging();
  v15 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v10;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "List of Requests: %{public}@", buf, 0xCu);
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v22[5]);

  _Block_object_dispose(&v21, 8);
  return v11;
}

uint64_t __73__HDCachedSyncRequestEntity_fetchCoalescedSyncRequest_transaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  +[HDCachedSyncRequestEntity _extractRequest:]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestByMergingRequest:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  HDSQLiteColumnWithNameAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v7)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  return 1;
}

+ (id)_extractRequest:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  objc_opt_self();
  v0 = HDSQLiteColumnWithNameAsInt64();
  v1 = HDSQLiteColumnWithNameAsInt64();
  v21 = HDSQLiteColumnWithNameAsInt64();
  v2 = HDSQLiteColumnWithNameAsInt64();
  v3 = HDSQLiteColumnWithNameAsInt64();
  v24 = HDSQLiteColumnWithNameAsInt64();
  v23 = HDSQLiteColumnWithNameAsInt64();
  v22 = HDSQLiteColumnWithNameAsInt64();
  v4 = HDSQLiteColumnWithNameAsInt64();
  v5 = HDSQLiteColumnWithNameAsInt64();
  v6 = HDSQLiteColumnWithNameAsInt64();
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  if (v0 | v1)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", v0 != 0, v1 != 0, v21 != 0);
  else
    v10 = 0;
  v11 = v5;
  if (v2 | v3)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6508]), "initWithPush:pull:", v2 != 0, v3 != 0);
  else
    v12 = 0;
  v13 = v6;
  if (v4 | v22)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CA0]), "initWithPush:pull:", v4 != 0, v22 != 0);
  else
    v14 = 0;
  v15 = objc_alloc(MEMORY[0x1E0CB6430]);
  if (v24)
    v16 = objc_alloc_init(MEMORY[0x1E0CB6C58]);
  else
    v16 = 0;
  if (!v23)
  {
    LOBYTE(v20) = v11 != 0;
    v18 = (void *)objc_msgSend(v15, "initWithIdentifier:changesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v9, v10, v12, v16, 0, v14, v20, v13);
    if (!v24)
      goto LABEL_16;
    goto LABEL_15;
  }
  v17 = objc_alloc_init(MEMORY[0x1E0CB6850]);
  LOBYTE(v20) = v11 != 0;
  v18 = (void *)objc_msgSend(v15, "initWithIdentifier:changesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v9, v10, v12, v16, v17, v14, v20, v13);

  if (v24)
LABEL_15:

LABEL_16:
  return v18;
}

+ (uint64_t)_enumerateOverAllSyncRequests:(uint64_t)a3 error:(void *)a4 enumerationHandler:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];

  v6 = a4;
  v7 = a2;
  v8 = objc_opt_self();
  objc_msgSend(v7, "databaseForEntityClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__HDCachedSyncRequestEntity__enumerateOverAllSyncRequests_error_enumerationHandler___block_invoke;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v12[4] = v8;
  v10 = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateOverAllSyncRequests_error_enumerationHandler__lookupKey, a3, v12, 0, v6);

  return v10;
}

+ (id)fetchAllSyncRequests:(id)a3 error:(id *)a4
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
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__HDCachedSyncRequestEntity_fetchAllSyncRequests_error___block_invoke;
  v10[3] = &unk_1E6CE7D28;
  v10[4] = &v11;
  v10[5] = a1;
  if (+[HDCachedSyncRequestEntity _enumerateOverAllSyncRequests:error:enumerationHandler:]((uint64_t)a1, v6, (uint64_t)a4, v10))v7 = (void *)v12[5];
  else
    v7 = 0;
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __56__HDCachedSyncRequestEntity_fetchAllSyncRequests_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  +[HDCachedSyncRequestEntity _extractRequest:]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

+ (id)fetchAllInProgressSyncRequests:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
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
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntityClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = a1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v12[4] = a1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke_3;
  v11[3] = &unk_1E6CE7D28;
  v11[4] = &v13;
  if (objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &fetchAllInProgressSyncRequests_error__lookupKey, a4, v12, &__block_literal_global_241, v11))v8 = (void *)v14[5];
  else
    v8 = 0;
  v9 = v8;

  _Block_object_dispose(&v13, 8);
  return v9;
}

id __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("context_sync_pull"), CFSTR("context_sync_push"), CFSTR("state_sync"), CFSTR("changes_sync_pull"), CFSTR("changes_sync_push"), CFSTR("changes_sync_fast"), CFSTR("medical_id"), CFSTR("summary_sharing_pull"), CFSTR("summary_sharing_push"), CFSTR("allow_cellular"), CFSTR("qos"), CFSTR("identifier"), CFSTR("reason"), CFSTR("creation_date"), v2, CFSTR("request_state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke_2(int a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int(a2, 1, 1);
}

uint64_t __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  +[HDCachedSyncRequestEntity _extractRequest:]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

+ (BOOL)clearInProgressSyncRequests:(id)a3 error:(id *)a4
{
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  v8[4] = a1;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedSyncRequestEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a4, v8);

  return (char)a4;
}

uint64_t __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke_2;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCachedSyncRequestEntityCreationDate_block_invoke_3_lookupKey, a3, v8, &__block_literal_global_244, 0);

  return v6;
}

id __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), v2, CFSTR("request_state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke_3(int a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int(a2, 1, 1);
}

id __84__HDCachedSyncRequestEntity__enumerateOverAllSyncRequests_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@"), CFSTR("context_sync_pull"), CFSTR("context_sync_push"), CFSTR("state_sync"), CFSTR("changes_sync_pull"), CFSTR("changes_sync_push"), CFSTR("changes_sync_fast"), CFSTR("medical_id"), CFSTR("summary_sharing_pull"), CFSTR("summary_sharing_push"), CFSTR("allow_cellular"), CFSTR("qos"), CFSTR("identifier"), CFSTR("reason"), CFSTR("creation_date"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
