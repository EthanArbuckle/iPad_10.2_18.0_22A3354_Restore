@implementation HDSeriesSampleEntity

+ (uint64_t)_insertionEra
{
  objc_opt_self();
  if (_MergedGlobals_205 != -1)
    dispatch_once(&_MergedGlobals_205, &__block_literal_global_93);
  return qword_1ED5522E8;
}

+ (id)objectInsertionFilterForProfile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDSeriesSampleEntity;
  objc_msgSendSuper2(&v11, sel_objectInsertionFilterForProfile_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HDSeriesSampleEntity_objectInsertionFilterForProfile___block_invoke;
  aBlock[3] = &unk_1E6CF7B68;
  v10 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);

  return v7;
}

uint64_t __56__HDSeriesSampleEntity_objectInsertionFilterForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "_isFrozen"))
      v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    else
      v5 = 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v11 = a3;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__HDSeriesSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v18[3] = &unk_1E6CF7B90;
  v19 = v12;
  v20 = v11;
  v21 = a1;
  v13 = v11;
  v14 = v12;
  if (objc_msgSend(a5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO data_series (data_id, frozen, count, insertion_era, hfd_key, series_location) VALUES (?, ?, ?, ?, (COALESCE((SELECT MAX(hfd_key) + 1 FROM data_series), 1)), 2)"), a7, v18, 0))v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

- (BOOL)updateSampleCount:(int64_t)a3 withDatabase:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v12[0] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HDSeriesSampleEntity_updateSampleCount_withDatabase_error___block_invoke;
  v11[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v11[4] = a3;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v9, v8, a5, v11);

  return (char)a5;
}

void __61__HDSeriesSampleEntity_updateSampleCount_withDatabase_error___block_invoke()
{
  JUMPOUT(0x1BCCAB114);
}

- (BOOL)canAddDatumInDatabase:(id)a3 error:(id *)a4
{
  char v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HDSeriesSampleEntity_canAddDatumInDatabase_error___block_invoke;
  v7[3] = &unk_1E6CEA6E8;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HDSeriesSampleEntity_canAddDatumInDatabase_error___block_invoke_2;
  v6[3] = &unk_1E6CEA698;
  objc_msgSend(a3, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT frozen FROM data_series WHERE data_id = ?"), a4, v7, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __52__HDSeriesSampleEntity_canAddDatumInDatabase_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __52__HDSeriesSampleEntity_canAddDatumInDatabase_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x1BCCAB174](a2, 0) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

+ (id)databaseTable
{
  return CFSTR("data_series");
}

+ (BOOL)migrateDataFromDataStore:(const void *)a3 to:(void *)a4 database:(id)a5 recoveryAnalytics:(id)a6 error:(id *)a7
{
  return 1;
}

+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5
{
  return 1;
}

void __37__HDSeriesSampleEntity__insertionEra__block_invoke()
{
  qword_1ED5522E8 = (uint64_t)CFAbsoluteTimeGetCurrent();
}

+ (void)updateInsertionEra
{
  ++qword_1ED5522E8;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  unsigned __int8 v3;
  int v5;
  unint64_t *v6;

  if ((v3 & 1) == 0)
  {
    v6 = a3;
    a3 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_0, 0, &dword_1B7802000);
      a3 = v6;
    }
  }
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDSeriesSampleEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__89;
  v37 = __Block_byref_object_dispose__89;
  v13 = v10;
  v38 = v13;
  objc_msgSend(v12, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__HDSeriesSampleEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke;
  v27[3] = &unk_1E6CF7AF0;
  v32 = a1;
  v28 = v13;
  v29 = v12;
  v22[0] = v15;
  v30 = v11;
  v31 = &v33;
  v22[1] = 3221225472;
  v22[2] = __74__HDSeriesSampleEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke_210;
  v22[3] = &unk_1E6CF7B18;
  v16 = v28;
  v23 = v16;
  v17 = v30;
  v24 = v17;
  v26 = a1;
  v18 = v29;
  v25 = v18;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v14, a6, v27, v22);

  if ((_DWORD)a6)
    v19 = (void *)v34[5];
  else
    v19 = 0;
  v20 = v19;

  _Block_object_dispose(&v33, 8);
  return v20;
}

uint64_t __74__HDSeriesSampleEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 64);
  HDDataEntityPredicateForDataUUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyInDatabase:predicate:error:", v6, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "freezeWithTransaction:profile:error:", v5, *(_QWORD *)(a1 + 40), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "persistentID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 48);
      if (!v12 || !objc_msgSend(v12, "count"))
      {
        v22 = 0;
        goto LABEL_11;
      }
      objc_msgSend(*(id *)(a1 + 64), "seriesSampleWithID:profile:error:", v11, *(_QWORD *)(a1 + 40), a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
      {
        v22 = 0;
        goto LABEL_24;
      }
      objc_msgSend(v13, "_setMetadata:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v14, "sourceRevision");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "source");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_sourceID");
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = *(void **)(a1 + 64);
      v19 = *(_QWORD *)(a1 + 40);
      v42 = 0;
      v43 = 0;
      v40 = (void *)v17;
      v20 = objc_msgSend(v18, "shouldInsertObject:sourceID:profile:transaction:objectToReplace:objectID:error:", v14, v17, v19, v5, &v43, &v42, a3);
      v21 = v43;
      v38 = v21;
      v39 = v42;
      if (v20 == 1)
      {
        if ((objc_msgSend(*(id *)(a1 + 64), "deleteSeriesWithID:deleteSeriesData:insertDeletedObject:profile:transaction:error:", v11, 1, 0, *(_QWORD *)(a1 + 40), v5, a3) & 1) != 0)
        {
          objc_msgSend(v21, "UUID");
          v34 = objc_claimAutoreleasedReturnValue();
          v23 = 0;
          v22 = 0;
          v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v25 = *(void **)(v35 + 40);
          *(_QWORD *)(v35 + 40) = v34;
          v24 = 1;
          goto LABEL_19;
        }
      }
      else if (v20 != 2)
      {
        v22 = v39;
        objc_msgSend(*(id *)(a1 + 40), "metadataManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v37, "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:error:", *(_QWORD *)(a1 + 48), v11, v17, objc_msgSend(v14, "_externalSyncObjectCode"), 0, a3);
        v24 = 0;
        v25 = v37;
LABEL_19:

        goto LABEL_21;
      }
      v23 = 0;
      v22 = 0;
      v24 = 0;
LABEL_21:

      if ((v23 & 1) == 0)
      {
LABEL_25:

        goto LABEL_26;
      }
      if (v22
        && (objc_msgSend(*(id *)(a1 + 64), "replaceObjectID:replacementObjectID:deleteOriginalSeriesData:insertDeletedObject:profile:transaction:error:", v22, v11, 1, 1, *(_QWORD *)(a1 + 40), v5, a3) & 1) == 0)
      {
LABEL_24:
        v24 = 0;
        goto LABEL_25;
      }
LABEL_11:
      v26 = *(void **)(a1 + 64);
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(a1 + 40);
      v41 = 0;
      objc_msgSend(v26, "objectWithUUID:encodingOptions:profile:error:", v27, 0, v28, &v41);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v41;
      if (v29)
      {
        objc_msgSend(*(id *)(a1 + 40), "dataManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "shouldNotifyForDataObjects:provenance:database:anchor:", v32, 0, v6, v11);

      }
      else
      {
        _HKInitializeLogging();
        v33 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v30;
          _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Failed to look up series after freezing: %{public}@", buf, 0xCu);
        }
      }

      v24 = 1;
      goto LABEL_25;
    }
  }
  v24 = 0;
LABEL_26:

  return v24;
}

uint64_t __74__HDSeriesSampleEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke_210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _HDSeriesFreezeJournalEntry *v5;
  void *v6;
  uint64_t v7;

  v5 = -[_HDSeriesFreezeJournalEntry initWithSeriesUUID:metadata:class:]([_HDSeriesFreezeJournalEntry alloc], "initWithSeriesUUID:metadata:class:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_opt_class());
  objc_msgSend(*(id *)(a1 + 48), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "addJournalEntry:error:", v5, a3);

  return v7;
}

+ (BOOL)deleteSeriesWithID:(id)a3 deleteSeriesData:(BOOL)a4 insertDeletedObject:(BOOL)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v13;
  id v14;
  id v15;
  HDDataEntityDeletionContext *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__89;
  v27 = __Block_byref_object_dispose__89;
  v28 = 0;
  v16 = -[HDDataEntityDeletionContext initWithProfile:transaction:]([HDDataEntityDeletionContext alloc], "initWithProfile:transaction:", v14, v15);
  -[HDDataEntityDeletionContext setInsertDeletedObjects:](v16, "setInsertDeletedObjects:", v11);
  -[HDDataEntityDeletionContext setCallWillDeleteWithProfileTransaction:](v16, "setCallWillDeleteWithProfileTransaction:", v12);
  HDDataEntityPredicateForRowID((uint64_t)v13, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __106__HDSeriesSampleEntity_deleteSeriesWithID_deleteSeriesData_insertDeletedObject_profile_transaction_error___block_invoke;
  v22[3] = &unk_1E6CF7B40;
  v22[4] = &v29;
  v22[5] = &v23;
  +[HDSampleEntity deleteSamplesWithPredicate:limit:deletionContext:completionHandler:](HDSampleEntity, "deleteSamplesWithPredicate:limit:deletionContext:completionHandler:", v17, 0, v16, v22);

  v18 = (id)v24[5];
  v19 = v18;
  if (v18)
  {
    if (a8)
      *a8 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
  }

  v20 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __106__HDSeriesSampleEntity_deleteSeriesWithID_deleteSeriesData_insertDeletedObject_profile_transaction_error___block_invoke(uint64_t a1, char a2, int a3, int a4, int a5, int a6, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (id)seriesSampleWithID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v14;

  v8 = a3;
  v14 = 0;
  objc_msgSend(a1, "objectWithID:encodingOptions:profile:error:", v8, 0, a4, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  v11 = v10;
  if (!v9)
  {
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Could not find series with ID %@"), v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    if (a5)
    {
      v11 = objc_retainAutorelease(v11);
      *a5 = v11;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_9;
  }
  v12 = v9;
LABEL_10:

  return v9;
}

+ (BOOL)replaceObjectID:(id)a3 replacementObjectID:(id)a4 deleteOriginalSeriesData:(BOOL)a5 insertDeletedObject:(BOOL)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  char v18;

  v11 = a6;
  v12 = a5;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (+[HDAssociationEntity copyAssociationsFromChildID:toObjectID:profile:error:](HDAssociationEntity, "copyAssociationsFromChildID:toObjectID:profile:error:", v15, a4, v16, a9))
  {
    v18 = objc_msgSend(a1, "deleteSeriesWithID:deleteSeriesData:insertDeletedObject:profile:transaction:error:", v15, v12, v11, v16, v17, a9);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)freezeWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)additionalPredicateForEnumeration
{
  return (id)objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("frozen"), &unk_1E6DFC3F8, 2);
}

uint64_t __86__HDSeriesSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int(a2, 2, objc_msgSend(*(id *)(a1 + 40), "_isFrozen"));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 40), "count"));
  v4 = +[HDSeriesSampleEntity _insertionEra]();
  return sqlite3_bind_int64(a2, 4, v4);
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)HFDKeyWithDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v16[0] = CFSTR("hfd_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HDSeriesSampleEntity_HFDKeyWithDatabase_error___block_invoke;
  v11[3] = &unk_1E6CF7BB8;
  v11[4] = &v12;
  v8 = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v6, a4, v11);

  if (!v8)
    goto LABEL_5;
  if (!v13[3])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Unable to get %@ for %@ with persistentID %lld"), CFSTR("hfd_key"), objc_opt_class(), -[HDSQLiteEntity persistentID](self, "persistentID"));
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __49__HDSeriesSampleEntity_HFDKeyWithDatabase_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
