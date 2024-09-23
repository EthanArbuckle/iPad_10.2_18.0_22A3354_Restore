@implementation HDObjectAuthorizationEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("object_authorizations");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_69;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("object");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:", objc_opt_class(), CFSTR("uuid"), 2);
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uniquedColumns
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("object");
  v3[1] = CFSTR("source");
  v3[2] = CFSTR("sync_provenance");
  v3[3] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (BOOL)setObjectAuthorizationRecords:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  int64_t v22;
  int64_t v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  int64_t v27;
  int64_t v28;
  char v29;

  v11 = a3;
  v12 = a6;
  v13 = (void *)objc_opt_self();
  objc_msgSend(v12, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke;
  v24[3] = &unk_1E6D00130;
  v25 = v11;
  v26 = v13;
  v27 = a4;
  v28 = a5;
  v29 = 0;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke_216;
  v19[3] = &unk_1E6D00158;
  v22 = a5;
  v23 = a4;
  v20 = v25;
  v21 = v12;
  v16 = v12;
  v17 = v25;
  LOBYTE(a7) = objc_msgSend(v13, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v14, a7, v24, v19);

  return (char)a7;
}

uint64_t __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  CFAbsoluteTime Current;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  _QWORD *v24;
  id obj;
  _QWORD v26[6];
  __int128 v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  _QWORD v36[9];

  v36[7] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v36[0] = CFSTR("object");
  v36[1] = CFSTR("source");
  v36[2] = CFSTR("status");
  v36[3] = CFSTR("sync_provenance");
  v36[4] = CFSTR("sync_identity");
  v36[5] = CFSTR("modification_date");
  v36[6] = CFSTR("session");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 32);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v8)
  {
    v10 = v8;
    v24 = a3;
    v11 = *(_QWORD *)v30;
    *(_QWORD *)&v9 = 138543362;
    v23 = v9;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v14 = *(void **)(a1 + 40);
        objc_msgSend(v5, "protectedDatabase", v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke_2;
        v26[3] = &unk_1E6D00108;
        v26[4] = v13;
        *(CFAbsoluteTime *)&v26[5] = Current;
        v27 = *(_OWORD *)(a1 + 48);
        objc_msgSend(v14, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v15, v6, &v28, v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v28;

        if (!v16)
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            v34 = v17;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Failed to insert or update object authorization: %{public}@", buf, 0xCu);
          }
          v19 = v17;
          v20 = v19;
          if (v19)
          {
            if (v24)
              *v24 = objc_retainAutorelease(v19);
            else
              _HKLogDroppedError();
          }

          if (!*(_BYTE *)(a1 + 64))
          {

            v21 = 0;
            goto LABEL_18;
          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v10)
        continue;
      break;
    }
  }
  v21 = 1;
LABEL_18:

  return v21;
}

void __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  if (v4 == 0.0)
    v5 = *(double *)(a1 + 40);
  else
    v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "objectUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("object"), v6);

  objc_msgSend(*(id *)(a1 + 32), "sourceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("source"), v7);

  MEMORY[0x1BCCAB114](a2, CFSTR("status"), objc_msgSend(*(id *)(a1 + 32), "status"));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), *(_QWORD *)(a1 + 48));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_identity"), *(_QWORD *)(a1 + 56));
  MEMORY[0x1BCCAB0F0](a2, CFSTR("modification_date"), v5);
  objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("session"), v8);

}

uint64_t __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke_216(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HDObjectAuthorizationJournalEntry *v5;
  void *v6;
  uint64_t v7;

  v5 = objc_alloc_init(HDObjectAuthorizationJournalEntry);
  -[HDObjectAuthorizationJournalEntry setRecords:](v5, "setRecords:", *(_QWORD *)(a1 + 32));
  -[HDObjectAuthorizationJournalEntry setSyncIdentity:](v5, "setSyncIdentity:", *(_QWORD *)(a1 + 48));
  -[HDObjectAuthorizationJournalEntry setSyncProvenance:](v5, "setSyncProvenance:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "addJournalEntry:error:", v5, a3);

  return v7;
}

+ (BOOL)resetObjectAuthorizationRecordsForSource:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__HDObjectAuthorizationEntity_resetObjectAuthorizationRecordsForSource_profile_error___block_invoke;
  v14[3] = &unk_1E6CE9280;
  v15 = v8;
  v16 = v9;
  v17 = a1;
  v11 = v9;
  v12 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v10, a5, v14);

  return (char)a5;
}

uint64_t __86__HDObjectAuthorizationEntity_resetObjectAuthorizationRecordsForSource_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sourceUUIDWithProfile:error:", *(_QWORD *)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 48), "disambiguatedDatabaseTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), v8, CFSTR("source"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "protectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__HDObjectAuthorizationEntity_resetObjectAuthorizationRecordsForSource_profile_error___block_invoke_2;
    v13[3] = &unk_1E6CE9508;
    v14 = v6;
    v11 = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a3, v13, 0);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __86__HDObjectAuthorizationEntity_resetObjectAuthorizationRecordsForSource_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)resetAllObjectAuthorizationRecordsForProfile:(id)a3 error:(id *)a4
{
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HDObjectAuthorizationEntity_resetAllObjectAuthorizationRecordsForProfile_error___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  v8[4] = a1;
  LOBYTE(a4) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v6, a4, v8);

  return (char)a4;
}

uint64_t __82__HDObjectAuthorizationEntity_resetAllObjectAuthorizationRecordsForProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "disambiguatedDatabaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("DELETE FROM %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", v8, a3, 0, 0);
  return v10;
}

+ (BOOL)resetAuthorizationForObjects:(id)a3 profile:(id)a4 error:(id *)a5
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
  v12[2] = __74__HDObjectAuthorizationEntity_resetAuthorizationForObjects_profile_error___block_invoke;
  v12[3] = &unk_1E6CEF660;
  v13 = v8;
  v14 = a1;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v12);

  return (char)a5;
}

uint64_t __74__HDObjectAuthorizationEntity_resetAuthorizationForObjects_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  objc_msgSend(v6, "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (?)"), v8, CFSTR("object"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HDObjectAuthorizationEntity_resetAuthorizationForObjects_profile_error___block_invoke_2;
  v13[3] = &unk_1E6CE9508;
  v14 = *(id *)(a1 + 32);
  v11 = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a3, v13, 0);

  return v11;
}

uint64_t __74__HDObjectAuthorizationEntity_resetAuthorizationForObjects_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValuesToStatement();
}

BOOL __90__HDObjectAuthorizationEntity__insertCodableObjectAuthorizations_syncStore_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "syncIdentityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteIdentityForIdentity:shouldCreate:transaction:error:", a1[5], 1, v6, a3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v11)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      v14 = *a3;
      v15 = 138543362;
      v16 = v14;
      _os_log_fault_impl(&dword_1B7802000, v12, OS_LOG_TYPE_FAULT, "HDObjectAuthorizationSyncEntity ConcreteSyncIdentity from received codable is nil %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v11 != 0;
}

+ (id)authorizationStatusForSamplesOfType:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v13 = authorizationStatusForSamplesOfType_sourceEntity_profile_error__onceToken;
  v14 = a5;
  if (v13 != -1)
    dispatch_once(&authorizationStatusForSamplesOfType_sourceEntity_profile_error__onceToken, block);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v14, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_2;
  v24[3] = &unk_1E6CEB3F8;
  v25 = v11;
  v26 = v10;
  v27 = v15;
  v17 = v15;
  v18 = v10;
  v19 = v11;
  v20 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v16, a6, v24);

  if (v20)
    v21 = v17;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

void __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@                                                     FROM %@ as oa                                                     INNER JOIN %@ obj ON oa.%@ = obj.%@                                                     INNER JOIN %@ spl ON obj.%@ = spl.%@                                                     WHERE oa.%@ = ? AND spl.%@ = ?"), CFSTR("object"), CFSTR("source"), CFSTR("status"), CFSTR("modification_date"), v6, v2, CFSTR("object"), CFSTR("uuid"), v3, CFSTR("data_id"), CFSTR("data_id"), CFSTR("source"), CFSTR("data_type"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)authorizationStatusForSamplesOfType_sourceEntity_profile_error__selectSQL;
  authorizationStatusForSamplesOfType_sourceEntity_profile_error__selectSQL = v4;

}

uint64_t __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDForProperty:database:", CFSTR("uuid"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = authorizationStatusForSamplesOfType_sourceEntity_profile_error__selectSQL;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_3;
  v17[3] = &unk_1E6CE7750;
  v18 = v8;
  v19 = *(id *)(a1 + 40);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_4;
  v15[3] = &unk_1E6CE8CF8;
  v16 = *(id *)(a1 + 48);
  v12 = v8;
  v13 = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", v10, a3, v17, v15);

  return v13;
}

uint64_t __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "code"));
}

uint64_t __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0CB6970]);
  MEMORY[0x1BCCAB1E0](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjectUUID:", v5);

  MEMORY[0x1BCCAB1E0](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceUUID:", v6);

  objc_msgSend(v4, "setStatus:", HDSQLiteColumnAsInt64());
  MEMORY[0x1BCCAB1A4](a2, 3);
  objc_msgSend(v4, "setModificationDate:");
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  return 1;
}

+ (id)authorizationRecordsForSamples:(id)a3 sourceEntity:(id)a4 sessionIdentifier:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  void *v28;
  id v29;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  _QWORD block[5];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v15 = qword_1ED5524C0;
  v16 = a6;
  if (v15 != -1)
    dispatch_once(&qword_1ED5524C0, block);
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = objc_msgSend(v12, "persistentID");
  v19 = &_MergedGlobals_1;
  if (v13)
    v19 = &qword_1ED5524B8;
  v20 = (id)*v19;
  objc_msgSend(v16, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_2;
  v32[3] = &unk_1E6D00180;
  v33 = v12;
  v34 = v11;
  v35 = v13;
  v36 = v20;
  v37 = v17;
  v38 = v18;
  v22 = v17;
  v23 = v20;
  v24 = v13;
  v25 = v11;
  v26 = v12;
  v27 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v21, a7, v32);

  if (v27)
    v28 = v22;
  else
    v28 = 0;
  v29 = v28;

  return v29;
}

void __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  +[HDObjectAuthorizationEntity _selectSQLIncludeSession:](*(_QWORD *)(a1 + 32), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v2;

  +[HDObjectAuthorizationEntity _selectSQLIncludeSession:](*(_QWORD *)(a1 + 32), 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED5524B8;
  qword_1ED5524B8 = v4;

}

+ (id)_selectSQLIncludeSession:(uint64_t)a1
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_self();
  v4 = CFSTR("IS");
  if (a2)
    v4 = CFSTR("=");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = v4;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataProvenanceEntity, "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D29618];
  objc_msgSend(v3, "disambiguatedDatabaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("SELECT %@, %@, dp.%@                                            FROM %@ AS o                                            INNER JOIN %@ dp ON o.%@ = dp.%@                                            LEFT JOIN %@ oa ON o.%@ = oa.%@ AND oa.%@ = ? AND oa.%@ %@ ?                                            WHERE o.%@ = ?"), CFSTR("status"), CFSTR("modification_date"), CFSTR("source_id"), v7, v8, CFSTR("provenance"), v9, v10, CFSTR("uuid"), CFSTR("object"), CFSTR("source"), CFSTR("session"), v6, CFSTR("uuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id obj;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(void **)(a1 + 32);
  v24 = v4;
  objc_msgSend(v4, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDForProperty:database:", CFSTR("uuid"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 40);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v11 = MEMORY[0x1E0C809B0];
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
        v14 = objc_alloc_init(MEMORY[0x1E0CB6970]);
        objc_msgSend(v14, "setSourceUUID:", v7);
        objc_msgSend(v13, "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObjectUUID:", v15);

        objc_msgSend(v14, "setSessionUUID:", *(_QWORD *)(a1 + 48));
        objc_msgSend(v14, "setStatus:", 0);
        objc_msgSend(v24, "protectedDatabase");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 56);
        v28[0] = v11;
        v28[1] = 3221225472;
        v28[2] = __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_3;
        v28[3] = &unk_1E6CE7C30;
        v29 = v7;
        v30 = *(id *)(a1 + 48);
        v31 = v13;
        v25[0] = v11;
        v25[1] = 3221225472;
        v25[2] = __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_4;
        v25[3] = &unk_1E6CF2D68;
        v18 = *(_QWORD *)(a1 + 72);
        v26 = v14;
        v27 = v18;
        v19 = v14;
        LODWORD(v13) = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v17, a3, v28, v25);

        objc_msgSend(*(id *)(a1 + 64), "addObject:", v19);
        if (!(_DWORD)v13)
        {
          v20 = 0;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v9)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_11:

  return v20;
}

void __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_3(uint64_t a1)
{
  id v2;

  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  objc_msgSend(*(id *)(a1 + 48), "UUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = HDSQLiteColumnAsInt64();
  if ((MEMORY[0x1BCCAB204](a2, 0) & 1) == 0)
  {
    v5 = HDSQLiteColumnAsInt64();
    goto LABEL_5;
  }
  if (v4 == *(_QWORD *)(a1 + 40))
  {
    v5 = 2;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", v5);
  }
  MEMORY[0x1BCCAB1A4](a2, 1);
  objc_msgSend(*(id *)(a1 + 32), "setModificationDate:");
  return 1;
}

+ (id)authorizationRecordsBySourceForSampleWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0C99E08];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke;
  v18[3] = &unk_1E6CE9280;
  v20 = v11;
  v21 = a1;
  v19 = v8;
  v13 = v11;
  v14 = v8;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v18);

  if ((_DWORD)a5)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

uint64_t __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(void **)(a1 + 48);
  v7 = a2;
  objc_msgSend(v6, "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ from %@ AS oa WHERE oa.%@ = ?"), CFSTR("source"), CFSTR("modification_date"), CFSTR("status"), v8, CFSTR("object"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke_2;
  v17[3] = &unk_1E6CE9508;
  v18 = *(id *)(a1 + 32);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke_3;
  v14[3] = &unk_1E6CE8D20;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a3, v17, v14);

  return v12;
}

uint64_t __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0CB6970]);
  objc_msgSend(v4, "setObjectUUID:", *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB1E0](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceUUID:", v5);

  MEMORY[0x1BCCAB1A4](a2, 1);
  objc_msgSend(v4, "setModificationDate:");
  objc_msgSend(v4, "setStatus:", HDSQLiteColumnAsInt64());
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "sourceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  return 1;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
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
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_dateBySubtractingDays:fromDate:", *MEMORY[0x1E0CB4BE8], v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v13 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithProperty:lessThanValue:", CFSTR("modification_date"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29880], "isNotNullPredicateWithProperty:", CFSTR("session"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_msgSend(v9, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__HDObjectAuthorizationEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v22[3] = &unk_1E6CEC9E0;
  v19 = v17;
  v24 = &v26;
  v25 = a5;
  v23 = v19;
  LODWORD(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDObjectAuthorizationEntity, "performWriteTransactionWithHealthDatabase:error:block:", v18, a6, v22);

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v27 + 6));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v20;
}

uint64_t __68__HDObjectAuthorizationEntity_pruneWithProfile_nowDate_limit_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDObjectAuthorizationEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v5, a1[4], a1[6], 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deleteAllEntitiesWithError:", a3);
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v5, "getChangesCount");

  return v7;
}

@end
