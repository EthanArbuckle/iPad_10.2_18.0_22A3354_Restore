@implementation HDCloudSyncStoreEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)databaseTable
{
  return CFSTR("cloud_sync_stores");
}

+ (BOOL)rebaseRequiredByDate:(id)a3 intervals:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  objc_msgSend(a5, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke;
  v16[3] = &unk_1E6CE9280;
  v18 = v11;
  v19 = a1;
  v17 = v10;
  v13 = v11;
  v14 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v16);

  return (char)a6;
}

uint64_t __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v14[4] = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_3;
  v9[3] = &unk_1E6D0E7D0;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 48);
  v6 = v5;
  v7 = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCloudSyncStoreEmptyZonesKey_block_invoke_lookupKey, a3, v14, 0, v9);

  return v7;
}

id __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *MEMORY[0x1E0D29618];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@ FROM %@"), v2, CFSTR("rebase_deadline"), CFSTR("shard_type"), CFSTR("shard_start_date"), CFSTR("shard_end_date"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  int v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[5];

  v6 = HDSQLiteColumnAsInt64();
  if ((MEMORY[0x1BCCAB204](a2, 1) & 1) != 0
    || (v7 = 1,
        v8 = MEMORY[0x1BCCAB1A4](a2, 1),
        objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate"),
        v8 > v9))
  {
    if ((MEMORY[0x1BCCAB204](a2, 2) & 1) != 0)
    {
LABEL_4:
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_4;
      v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v10 = *(void **)(a1 + 48);
      v18[4] = *(_QWORD *)(a1 + 56);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_5;
      v15[3] = &unk_1E6CE82D8;
      v16 = *(id *)(a1 + 32);
      v17 = v6;
      v7 = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCloudSyncStoreEmptyZonesKey_block_invoke_2_updateKey, a3, v18, v15, 0);

      return v7;
    }
    v12 = HDSQLiteColumnAsInt64();
    v7 = 1;
    if (v12 && v12 != 2)
    {
      if (v12 == 1 && *(_QWORD *)(a1 + 40))
      {
        v13 = (MEMORY[0x1BCCAB204](a2, 3) & 1) != 0 ? -1.79769313e308 : MEMORY[0x1BCCAB1A4](a2, 3);
        v14 = (MEMORY[0x1BCCAB204](a2, 4) & 1) != 0 ? 1.79769313e308 : MEMORY[0x1BCCAB1A4](a2, 4);
        if (!objc_msgSend(*(id *)(a1 + 40), "hasOverlapWithStartTime:endTime:", v13, v14))
          return 1;
      }
      goto LABEL_4;
    }
  }
  return v7;
}

id __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ?"), v2, CFSTR("rebase_deadline"), *MEMORY[0x1E0D29618], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (id)storeIdentifiersForOwnerIdentifier:(id)a3 containerIdentifier:(id)a4 syncIdentity:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__191;
  v35 = __Block_byref_object_dispose__191;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke;
  v24[3] = &unk_1E6D0C9A0;
  v30 = a1;
  v17 = v15;
  v25 = v17;
  v18 = v14;
  v26 = v18;
  v19 = v12;
  v27 = v19;
  v20 = v13;
  v28 = v20;
  v29 = &v31;
  LODWORD(a7) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v16, a7, v24);

  if ((_DWORD)a7)
    v21 = (void *)v32[5];
  else
    v21 = 0;
  v22 = v21;

  _Block_object_dispose(&v31, 8);
  return v22;
}

uint64_t __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v5 = *(_QWORD *)(a1 + 72);
  v6 = a2;
  objc_msgSend(v6, "databaseForEntityClass:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncIdentityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v21 = 0;
  objc_msgSend(v8, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v9, 0, v6, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v21;
  if (v11)
  {
    if (a3)
    {
      v12 = 0;
      *a3 = objc_retainAutorelease(v11);
    }
    else
    {
      _HKLogDroppedError();
      v12 = 0;
    }
  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_2;
    v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v20[4] = *(_QWORD *)(a1 + 72);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_3;
    v16[3] = &unk_1E6CE7C30;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v19 = v10;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_4;
    v15[3] = &unk_1E6CE8540;
    v15[4] = *(_QWORD *)(a1 + 64);
    v12 = objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCloudSyncStoreEmptyZonesKey_block_invoke_3_lookupKey, a3, v20, v16, v15);

  }
  return v12;
}

id __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSyncStoreEntity, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ INNER JOIN %@ ON %@ = %@ WHERE %@ = ? AND %@ = ? AND %@ = ? ORDER BY %@ ASC"), CFSTR("uuid"), v2, v3, CFSTR("sync_store"), *MEMORY[0x1E0D29618], CFSTR("owner_id"), CFSTR("container_id"), CFSTR("sync_identity"), CFSTR("uuid"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;

  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  objc_msgSend(*(id *)(a1 + 48), "entity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 3, objc_msgSend(v4, "persistentID"));

}

uint64_t __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

+ (id)_persistedStateProperties
{
  _QWORD v1[13];

  v1[12] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("sync_store");
  v1[1] = CFSTR("server_change_token");
  v1[2] = CFSTR("baseline_epoch");
  v1[3] = CFSTR("rebase_deadline");
  v1[4] = CFSTR("last_sync");
  v1[5] = CFSTR("empty_zones");
  v1[6] = CFSTR("last_check");
  v1[7] = CFSTR("owner_id");
  v1[8] = CFSTR("container_id");
  v1[9] = CFSTR("sync_identity");
  v1[10] = CFSTR("has_gap");
  v1[11] = CFSTR("sync_protocol_version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)persistedStateForStoreUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__191;
  v23 = __Block_byref_object_dispose__191;
  v24 = 0;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HDCloudSyncStoreEntity_persistedStateForStoreUUID_profile_error___block_invoke;
  v15[3] = &unk_1E6CEC940;
  v17 = &v19;
  v18 = a1;
  v11 = v8;
  v16 = v11;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v15);

  if ((_DWORD)a5)
    v12 = (void *)v20[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __67__HDCloudSyncStoreEntity_persistedStateForStoreUUID_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)a1[6];
  v6 = a1[4];
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistedStateForStoreUUID:database:error:", v6, v7, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
}

+ (id)persistedStoreUUIDsForProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__191;
  v16 = __Block_byref_object_dispose__191;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke;
  v11[3] = &unk_1E6CF3A30;
  v11[4] = &v12;
  v11[5] = a1;
  LOBYTE(a4) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v7, a4, v11);

  if ((a4 & 1) == 0)
  {
    v8 = (void *)v13[5];
    v13[5] = 0;

  }
  v9 = (void *)objc_msgSend((id)v13[5], "copy");
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v6 = *(_QWORD *)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke_3;
  v9[3] = &unk_1E6CE8540;
  v9[4] = v6;
  v7 = objc_msgSend(v5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCloudSyncStoreEmptyZonesKey_block_invoke_4_lookupKey, a3, v10, 0, v9);

  return v7;
}

id __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSyncStoreEntity, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ cloud_stores INNER JOIN %@ sync_stores ON cloud_stores.%@ = sync_stores.%@"), CFSTR("uuid"), v2, v3, CFSTR("sync_store"), *MEMORY[0x1E0D29618], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke_3(uint64_t a1)
{
  void *v2;

  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v2);

  return 1;
}

+ (id)persistedMostRecentLastSyncDateForProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
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
  v14 = __Block_byref_object_copy__191;
  v15 = __Block_byref_object_dispose__191;
  v16 = 0;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke;
  v10[3] = &unk_1E6CF3A30;
  v10[4] = &v11;
  v10[5] = a1;
  LODWORD(a4) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v7, a4, v10);

  if ((_DWORD)a4)
    v8 = (void *)objc_msgSend((id)v12[5], "copy");
  else
    v8 = 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  objc_msgSend(a2, "unprotectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v6 = *(_QWORD *)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke_3;
  v9[3] = &unk_1E6CE8540;
  v9[4] = v6;
  v7 = objc_msgSend(v5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCloudSyncStoreEmptyZonesKey_block_invoke_5_lookupKey, a3, v10, 0, v9);

  return v7;
}

id __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT MAX(%@) as %@ FROM %@"), CFSTR("last_sync"), CFSTR("last_sync"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsDate();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

+ (id)persistedStateForStoreUUID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  _HDCloudSyncStorePersistableState *v29;
  _HDCloudSyncStorePersistableState *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _HDCloudSyncStorePersistableState *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[15];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  _QWORD v106[5];

  v106[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDCloudSyncStoreEntity.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storeUUID != nil"));

  }
  v100 = 0;
  v101 = &v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__191;
  v104 = __Block_byref_object_dispose__191;
  v105 = 0;
  v96 = 0;
  v97 = &v96;
  v98 = 0x2020000000;
  v99 = 0;
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__191;
  v94 = __Block_byref_object_dispose__191;
  v95 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__191;
  v88 = __Block_byref_object_dispose__191;
  v89 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__191;
  v82 = __Block_byref_object_dispose__191;
  v83 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__191;
  v76 = __Block_byref_object_dispose__191;
  v77 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__191;
  v70 = __Block_byref_object_dispose__191;
  v71 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__191;
  v64 = __Block_byref_object_dispose__191;
  v65 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = -1;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 6;
  +[HDSyncStoreEntity existingSyncStoreEntityWithUUID:database:error:](HDSyncStoreEntity, "existingSyncStoreEntityWithUUID:database:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithProperty:equalToValue:", CFSTR("sync_store"), v14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "queryWithDatabase:predicate:", v10, v45);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCloudSyncStoreEntity _persistedStateProperties]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __68__HDCloudSyncStoreEntity_persistedStateForStoreUUID_database_error___block_invoke;
    v47[3] = &unk_1E6D0E7F8;
    v47[4] = &v100;
    v47[5] = &v96;
    v47[6] = &v90;
    v47[7] = &v84;
    v47[8] = &v78;
    v47[9] = &v72;
    v47[10] = &v66;
    v47[11] = &v60;
    v47[12] = &v56;
    v47[13] = &v52;
    v47[14] = &v48;
    LOBYTE(v13) = objc_msgSend(v15, "enumerateProperties:error:enumerationHandler:", v16, a5, v47);

    if ((v13 & 1) == 0)
    {
      v19 = 0;
LABEL_21:

      goto LABEL_22;
    }
    if (v101[5])
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3710]);
      v18 = (void *)objc_msgSend(v17, "initForReadingFromData:error:", v101[5], 0);
      objc_msgSend(v18, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeToken"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "finishDecoding");

    }
    else
    {
      v44 = 0;
    }
    if (v79[5])
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3710]);
      v21 = (void *)objc_msgSend(v20, "initForReadingFromData:error:", v79[5], 0);
      v22 = (void *)MEMORY[0x1E0C99E60];
      v106[0] = objc_opt_class();
      v106[1] = objc_opt_class();
      v106[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "decodeObjectOfClasses:forKey:", v24, CFSTR("emptyZones"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "finishDecoding");
    }
    else
    {
      v43 = 0;
    }
    v25 = v57[3];
    v46 = 0;
    +[HDSyncIdentityEntity concreteIdentityForPersistentID:database:error:](HDSyncIdentityEntity, "concreteIdentityForPersistentID:database:error:", v25, v10, &v46);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v46;
    v28 = v27;
    if (v27)
    {
      v29 = (_HDCloudSyncStorePersistableState *)v27;
      v30 = v29;
      if (a5)
      {
        v19 = 0;
        *a5 = objc_retainAutorelease(v29);
      }
      else
      {
        _HKLogDroppedError();
        v19 = 0;
      }
    }
    else
    {
      v42 = v15;
      v41 = [_HDCloudSyncStorePersistableState alloc];
      v39 = v91[5];
      v40 = v97[3];
      v31 = v85[5];
      v32 = v73[5];
      v33 = v67[5];
      v34 = v61[5];
      objc_msgSend(v26, "identity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = *((_DWORD *)v49 + 6);
      v30 = -[_HDCloudSyncStorePersistableState initWithServerChangeToken:baselineEpoch:rebaseDeadline:lastSyncDate:emptyZones:lastCheckDate:ownerIdentifier:containerIdentifier:syncIdentity:syncProtocolVersion:](v41, "initWithServerChangeToken:baselineEpoch:rebaseDeadline:lastSyncDate:emptyZones:lastCheckDate:ownerIdentifier:containerIdentifier:syncIdentity:syncProtocolVersion:", v44, v40, v39, v31, v43, v32, v33, v34, v35, v38);

      v15 = v42;
      if (!*((_BYTE *)v53 + 24))
      {
        v19 = v30;
        goto LABEL_20;
      }
      -[_HDCloudSyncStorePersistableState stateWithGapEncountered:](v30, "stateWithGapEncountered:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v42;
    }

LABEL_20:
    goto LABEL_21;
  }
  v19 = 0;
LABEL_22:

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);

  return v19;
}

uint64_t __68__HDCloudSyncStoreEntity_persistedStateForStoreUUID_database_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  HDSQLiteColumnWithNameAsData();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[4] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  HDSQLiteColumnWithNameAsDate();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  HDSQLiteColumnWithNameAsData();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[8] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  HDSQLiteColumnWithNameAsDate();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1[9] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  HDSQLiteColumnWithNameAsString();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1[10] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  HDSQLiteColumnWithNameAsString();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1[11] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  *(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  *(_BYTE *)(*(_QWORD *)(a1[13] + 8) + 24) = HDSQLiteColumnWithNameAsBoolean();
  *(_DWORD *)(*(_QWORD *)(a1[14] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  return 1;
}

+ (BOOL)persistState:(id)a3 storeUUID:(id)a4 shouldReplace:(BOOL)a5 healthDatabase:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  id v37;
  BOOL v38;
  _QWORD v39[3];
  char v40;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDCloudSyncStoreEntity.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid != nil"));

  }
  objc_msgSend(v13, "serverChangeToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v13, "serverChangeToken");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v18, CFSTR("changeToken"));

    objc_msgSend(v17, "encodedData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "emptyZoneDateByZoneID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v13, "emptyZoneDateByZoneID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v21, CFSTR("emptyZones"));

    objc_msgSend(v20, "encodedData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke;
  v30[3] = &unk_1E6D0E870;
  v37 = a1;
  v22 = v14;
  v31 = v22;
  v23 = v13;
  v32 = v23;
  v24 = v15;
  v33 = v24;
  v36 = v39;
  v25 = v16;
  v34 = v25;
  v26 = v19;
  v35 = v26;
  v38 = a5;
  v27 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v24, a7, v30);

  _Block_object_dispose(v39, 8);
  return v27;
}

uint64_t __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  HDCloudSyncStoreEntity *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  HDCloudSyncStoreEntity *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[8];
  _QWORD v54[4];
  id v55;
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncStoreEntity existingSyncStoreEntityWithUUID:database:error:](HDSyncStoreEntity, "existingSyncStoreEntityWithUUID:database:error:", *(_QWORD *)(a1 + 32), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v5;
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__191;
    v75 = __Block_byref_object_dispose__191;
    v76 = 0;
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__191;
    v69 = __Block_byref_object_dispose__191;
    v70 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = -1;
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    v10 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_2;
    v56[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v56[4] = *(_QWORD *)(a1 + 80);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_3;
    v54[3] = &unk_1E6CE9508;
    v44 = v7;
    v55 = v44;
    v53[0] = v10;
    v53[1] = 3221225472;
    v53[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_4;
    v53[3] = &unk_1E6D0E820;
    v53[4] = &v71;
    v53[5] = &v65;
    v53[6] = &v61;
    v53[7] = &v57;
    if ((objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDCloudSyncStoreEmptyZonesKey_block_invoke_6_lookupKey, a3, v56, v54, v53) & 1) == 0)
    {
      v18 = 0;
      v5 = v9;
LABEL_49:

      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(&v65, 8);

      _Block_object_dispose(&v71, 8);
      goto LABEL_50;
    }
    objc_msgSend(*(id *)(a1 + 40), "syncIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 48), "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "syncIdentityManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "syncIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      objc_msgSend(v13, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v14, 1, v9, &v52);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v52;

      if (v15)
      {
        v16 = v15;
        v17 = v16;
        if (a3)
          *a3 = objc_retainAutorelease(v16);
        else
          _HKLogDroppedError();

        goto LABEL_20;
      }
      v22 = v62[3];
      if (v22 == -1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      }
      else
      {
        objc_msgSend(v43, "entity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "persistentID");

        if (v22 != v24)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Sync identity must not be changed after creation."));
          v17 = 0;
LABEL_20:
          v18 = 0;
          v25 = v43;
LABEL_47:

          goto LABEL_48;
        }
      }
    }
    else
    {
      v43 = 0;
    }
    if (v72[5])
    {
      v19 = (void *)v66[5];
      objc_msgSend(*(id *)(a1 + 40), "ownerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 != v20)
      {
        objc_msgSend(*(id *)(a1 + 40), "ownerIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
LABEL_31:
          v19 = v20;
          goto LABEL_32;
        }
        v21 = (void *)v66[5];
        objc_msgSend(*(id *)(a1 + 40), "ownerIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v21, "isEqualToString:", v42))
        {
LABEL_30:

          goto LABEL_31;
        }
      }
      v26 = (void *)v72[5];
      objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 == v27)
      {

        if (v19 != v20)
        {

          v19 = v20;
        }

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
        {

          if (v19 == v20)
          {
LABEL_32:

LABEL_33:
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Owner and container identifiers must not be changed after creation."));
            v18 = 0;
            v25 = v43;
LABEL_48:

            goto LABEL_49;
          }
          goto LABEL_30;
        }
        v39 = (void *)v72[5];
        objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", v28);

        if (v19 == v20)
        {

        }
        else
        {

        }
        if ((v40 & 1) == 0)
          goto LABEL_33;
      }
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_5;
    aBlock[3] = &unk_1E6D0E848;
    v29 = v44;
    v47 = v29;
    v48 = *(id *)(a1 + 56);
    v49 = *(id *)(a1 + 40);
    v50 = *(id *)(a1 + 64);
    v25 = v43;
    v51 = v25;
    v30 = _Block_copy(aBlock);
    if (*((_BYTE *)v58 + 24))
    {
      if (!*(_BYTE *)(a1 + 88) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        v18 = 1;
        goto LABEL_46;
      }
      v31 = -[HDSQLiteEntity initWithPersistentID:]([HDCloudSyncStoreEntity alloc], "initWithPersistentID:", objc_msgSend(v29, "persistentID"));
      +[HDCloudSyncStoreEntity _persistedStateProperties]();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](v31, "updateProperties:database:error:bindingHandler:", v32, v6, a3, v30);
LABEL_45:

LABEL_46:
      v17 = v47;
      goto LABEL_47;
    }
    v33 = v25;
    v34 = *(void **)(a1 + 80);
    v35 = *(unsigned __int8 *)(a1 + 88);
    +[HDCloudSyncStoreEntity _persistedStateProperties]();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v34, "insertOrReplaceEntity:database:properties:error:bindingHandler:", v35 != 0, v6, v36, &v45, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (HDCloudSyncStoreEntity *)v45;

    if (!v32)
    {
      if ((-[HDCloudSyncStoreEntity hd_isConstraintViolation](v31, "hd_isConstraintViolation") & 1) == 0)
      {
        v38 = v31;
        v31 = v38;
        if (v38)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v38);
          else
            _HKLogDroppedError();
        }

        v32 = 0;
        v18 = 0;
        goto LABEL_44;
      }
      v32 = 0;
    }
    v18 = 1;
LABEL_44:
    v25 = v33;
    goto LABEL_45;
  }
  v18 = 0;
LABEL_50:

  return v18;
}

id __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("container_id"), CFSTR("owner_id"), CFSTR("sync_identity"), v2, CFSTR("sync_store"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_4(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  MEMORY[0x1BCCAB1D4](a2, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if ((MEMORY[0x1BCCAB204](a2, 2) & 1) == 0 && HDSQLiteColumnAsInt64())
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return 0;
}

void __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  MEMORY[0x1BCCAB114](a2, CFSTR("sync_store"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  MEMORY[0x1BCCAB0D8](a2, CFSTR("server_change_token"), *(_QWORD *)(a1 + 40));
  MEMORY[0x1BCCAB114](a2, CFSTR("baseline_epoch"), objc_msgSend(*(id *)(a1 + 48), "baselineEpoch"));
  objc_msgSend(*(id *)(a1 + 48), "rebaseDeadline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("rebase_deadline"), v4);

  objc_msgSend(*(id *)(a1 + 48), "lastSyncDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("last_sync"), v5);

  MEMORY[0x1BCCAB0D8](a2, CFSTR("empty_zones"), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "lastCheckDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("last_check"), v6);

  objc_msgSend(*(id *)(a1 + 48), "ownerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("owner_id"), v7);

  objc_msgSend(*(id *)(a1 + 48), "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("container_id"), v8);

  objc_msgSend(*(id *)(a1 + 64), "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_identity"), objc_msgSend(v9, "persistentID"));

  MEMORY[0x1BCCAB0CC](a2, CFSTR("has_gap"), objc_msgSend(*(id *)(a1 + 48), "hasEncounteredGapInCurrentEpoch"));
  objc_msgSend(*(id *)(a1 + 48), "syncProtocolVersion");
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)resetLastSyncDateExcludingStores:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  objc_msgSend(a4, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke;
  v12[3] = &unk_1E6CEF660;
  v13 = v8;
  v14 = a1;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v12);

  return (char)a5;
}

uint64_t __73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_228);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "disambiguatedDatabaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D29618];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSyncStoreEntity, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = NULL WHERE %@ NOT IN (SELECT %@ FROM %@ WHERE %@ IN (%@))"), v9, CFSTR("last_sync"), CFSTR("sync_store"), v10, v11, CFSTR("uuid"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke_3;
  v15[3] = &unk_1E6CE9508;
  v16 = *(id *)(a1 + 32);
  v13 = objc_msgSend(v5, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v12, a3, v15, 0);

  return v13;
}

const __CFString *__73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke_2()
{
  return CFSTR("?");
}

void __73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    v5 = 1;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "storeIdentifier", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteBindFoundationValueToStatement();

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 += v6;
    }
    while (v3);
  }

}

- (id)storeUUIDInTransaction:(id)a3 error:(id *)a4
{
  id v5;
  HDSyncStoreEntity *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = -[HDSQLiteEntity initWithPersistentID:]([HDSyncStoreEntity alloc], "initWithPersistentID:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSQLiteEntity UUIDForProperty:database:](v6, "UUIDForProperty:database:", CFSTR("uuid"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)enumerateShardsForOwnerIdentifier:(id)a3 containerIdentifier:(id)a4 syncIdentity:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id (*v62)(uint64_t);
  void *v63;
  id v64;
  id v65[2];

  if (a5)
  {
    v14 = a3;
    v15 = a4;
    v16 = a7;
    v17 = a9;
    v18 = a6;
    v19 = a5;
    v20 = (void *)objc_opt_self();
    objc_msgSend(v18, "syncIdentityManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v65[0] = 0;
    objc_msgSend(v21, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v19, 0, v16, v65);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v65[0];
    if (v23)
    {
      if (a8)
      {
        v24 = 0;
        *a8 = objc_retainAutorelease(v23);
      }
      else
      {
        _HKLogDroppedError();
        v24 = 0;
      }
    }
    else
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = *MEMORY[0x1E0D29618];
      objc_msgSend(v20, "disambiguatedDatabaseTable");
      v47 = v17;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ IS NOT NULL"), v40, CFSTR("shard_start_date"), CFSTR("shard_end_date"), CFSTR("shard_type"), v41, CFSTR("owner_id"), CFSTR("container_id"), CFSTR("sync_identity"), CFSTR("shard_type"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "databaseForEntityClass:", v20);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = MEMORY[0x1E0C809B0];
      v60 = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke;
      v63 = &unk_1E6CEB2F8;
      v64 = v42;
      v53 = MEMORY[0x1E0C809B0];
      v54 = 3221225472;
      v55 = __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke_2;
      v56 = &unk_1E6CE7C30;
      v57 = v14;
      v58 = v15;
      v59 = v22;
      v48 = v44;
      v49 = 3221225472;
      v50 = __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke_3;
      v51 = &unk_1E6CE82B0;
      v52 = v47;
      v45 = v42;
      v24 = objc_msgSend(v43, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler__lookupKey, a8, &v60, &v53, &v48);

      v17 = v47;
    }

  }
  else
  {
    v25 = a3;
    v26 = a4;
    v27 = a9;
    v28 = a7;
    v29 = (void *)objc_opt_self();
    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = *MEMORY[0x1E0D29618];
    objc_msgSend(v29, "disambiguatedDatabaseTable");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ IS NOT NULL"), v31, CFSTR("shard_start_date"), CFSTR("shard_end_date"), CFSTR("shard_type"), v32, CFSTR("owner_id"), CFSTR("container_id"), CFSTR("shard_type"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "databaseForEntityClass:", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = MEMORY[0x1E0C809B0];
    v61 = 3221225472;
    v62 = __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke;
    v63 = &unk_1E6CEB2F8;
    v64 = v33;
    v52 = v27;
    v53 = MEMORY[0x1E0C809B0];
    v54 = 3221225472;
    v55 = __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke_2;
    v56 = &unk_1E6CE7750;
    v57 = v25;
    v58 = v26;
    v48 = MEMORY[0x1E0C809B0];
    v49 = 3221225472;
    v50 = __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke_3;
    v51 = &unk_1E6CE82B0;
    v35 = v27;
    v36 = v26;
    v37 = v25;
    v38 = v33;
    v24 = objc_msgSend(v34, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler__lookupKey, a8, &v60, &v53, &v48);

  }
  return v24;
}

- (BOOL)updateShardStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  HDCloudSyncStoreEntity *v21;
  int64_t v22;
  _QWORD v23[5];

  v12 = a3;
  v13 = a4;
  objc_msgSend(a6, "databaseForEntity:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__HDCloudSyncStoreEntity_updateShardStartDate_endDate_type_transaction_error___block_invoke;
  v23[3] = &unk_1E6CEB2F8;
  v23[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__HDCloudSyncStoreEntity_updateShardStartDate_endDate_type_transaction_error___block_invoke_2;
  v18[3] = &unk_1E6CE9118;
  v19 = v12;
  v20 = v13;
  v21 = self;
  v22 = a5;
  v15 = v13;
  v16 = v12;
  LOBYTE(a7) = objc_msgSend(v14, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateShardStartDate_endDate_type_transaction_error__updateKey, a7, v23, v18, 0);

  return (char)a7;
}

id __78__HDCloudSyncStoreEntity_updateShardStartDate_endDate_type_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ?, %@ = ?, %@ = ? WHERE %@ = ?"), v1, CFSTR("shard_start_date"), CFSTR("shard_end_date"), CFSTR("shard_type"), *MEMORY[0x1E0D29618]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __78__HDCloudSyncStoreEntity_updateShardStartDate_endDate_type_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  double v5;
  void *v6;
  double v7;

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(a2, 1, v5);
  }
  else
  {
    sqlite3_bind_null(a2, 1);
  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(a2, 2, v7);
  }
  else
  {
    sqlite3_bind_null(a2, 2);
  }
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 56));
  return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 48), "persistentID"));
}

- (BOOL)fetchShardPropertiesInTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v8 = a5;
  objc_msgSend(a3, "databaseForEntity:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke;
  v15[3] = &unk_1E6CEB2F8;
  v15[4] = self;
  v13 = v8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke_2;
  v14[3] = &unk_1E6CE9508;
  v14[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke_3;
  v12[3] = &unk_1E6CE82B0;
  v10 = v8;
  LOBYTE(a4) = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &fetchShardPropertiesInTransaction_error_handler__lookupKey, a4, v15, v14, v12);

  return (char)a4;
}

id __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ IS NOT NULL"), CFSTR("shard_type"), CFSTR("shard_start_date"), CFSTR("shard_end_date"), v1, *MEMORY[0x1E0D29618], CFSTR("shard_type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB198](a2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB198](a2, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v6;
}

- (BOOL)updateSyncIdentity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  HDCloudSyncStoreEntity *v14;
  _QWORD v15[5];

  v8 = a3;
  objc_msgSend(a4, "databaseForEntity:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__HDCloudSyncStoreEntity_updateSyncIdentity_transaction_error___block_invoke;
  v15[3] = &unk_1E6CEB2F8;
  v15[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__HDCloudSyncStoreEntity_updateSyncIdentity_transaction_error___block_invoke_2;
  v12[3] = &unk_1E6CE7750;
  v13 = v8;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateSyncIdentity_transaction_error__lookupKey, a5, v15, v12, 0);

  return (char)a5;
}

id __63__HDCloudSyncStoreEntity_updateSyncIdentity_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ?"), v1, CFSTR("sync_identity"), *MEMORY[0x1E0D29618]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __63__HDCloudSyncStoreEntity_updateSyncIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 1, objc_msgSend(v4, "persistentID"));

  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 15;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_96;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("sync_store");
  +[HDHealthEntity defaultForeignKey](HDSyncStoreEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke_2(id *a1, sqlite3_stmt *a2)
{
  id v4;

  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(a1[6], "entity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 3, objc_msgSend(v4, "persistentID"));

}

uint64_t __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDCloudSyncStoreEntity *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = -[HDSQLiteEntity initWithPersistentID:]([HDCloudSyncStoreEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  MEMORY[0x1BCCAB198](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB198](a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnAsInt64();
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v7;
}

id __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  return sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDCloudSyncStoreEntity *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = -[HDSQLiteEntity initWithPersistentID:]([HDCloudSyncStoreEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  MEMORY[0x1BCCAB198](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB198](a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnAsInt64();
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v7;
}

@end
