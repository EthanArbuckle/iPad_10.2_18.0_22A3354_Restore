@implementation HDDeletedSampleEntity

+ (int64_t)protectionClass
{
  return +[HDDataEntity protectionClass](HDSampleEntity, "protectionClass");
}

+ (int64_t)nextSyncAnchorWithStartAnchor:(int64_t)a3 predicate:(id)a4 session:(id)a5 healthDatabase:(id)a6 error:(id *)a7
{
  return +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDSampleEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a3, a4, a5, a6, a7);
}

+ (BOOL)enumerateEntitiesForSyncWithProperties:(id)a3 predicate:(id)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 limit:(unint64_t)a7 lastSyncAnchor:(int64_t *)a8 healthDatabase:(id)a9 error:(id *)a10 block:(id)a11
{
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0D29888];
  v15 = *MEMORY[0x1E0D29618];
  v16 = a11;
  v17 = a9;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v14, "orderingTermWithProperty:entityClass:ascending:", v15, objc_opt_class(), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 0;
  LOBYTE(v15) = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:distinct:healthDatabase:error:block:](HDSampleEntity, "enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:distinct:healthDatabase:error:block:", v20, v19, 0, v18, a6.start, a6.end, v22, a7, a8, v24, v17, a10, v16);

  return v15;
}

+ (id)_externalSyncMetadataForRow:
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_self();
  HDSQLiteColumnWithNameAsString();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNumber();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB65B8], "_metadataWithSyncIdentifier:syncVersion:", v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addDeletedSamples:", a3);
  return a3 != 0;
}

+ (id)insertDeletedObject:(id)a3 dataType:(id)a4 provenanceIdentifier:(id)a5 deletionDate:(id)a6 persistStartAndEndDates:(BOOL)a7 startTimestamp:(double)a8 endTimestamp:(double)a9 inDatabase:(id)a10 error:(id *)a11
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  double v34;
  double v35;
  BOOL v36;
  objc_super v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a10;
  objc_msgSend(v20, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDeletedSampleEntity.m"), 75, CFSTR("You can not insert a HKDeletedObject with metadata. Deleted objects don't insert related objects."));

  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__181;
  v42 = __Block_byref_object_dispose__181;
  v37.receiver = a1;
  v37.super_class = (Class)&OBJC_METACLASS___HDDeletedSampleEntity;
  objc_msgSendSuper2(&v37, sel_insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error_, v20, v22, v23, v24, a11);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v39[5];
  if (v26)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __157__HDDeletedSampleEntity_insertDeletedObject_dataType_provenanceIdentifier_deletionDate_persistStartAndEndDates_startTimestamp_endTimestamp_inDatabase_error___block_invoke_2;
    v31[3] = &unk_1E6D0CEE8;
    v33 = &v38;
    v32 = v21;
    v36 = a7;
    v34 = a8;
    v35 = a9;
    v27 = objc_msgSend(v24, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDeletedObject_dataType_provenanceIdentifier_deletionDate_persistStartAndEndDates_startTimestamp_endTimestamp_inDatabase_error__insertKey, a11, &__block_literal_global_217, v31, 0);

    if ((v27 & 1) != 0)
      v26 = (void *)v39[5];
    else
      v26 = 0;
  }
  v28 = v26;
  _Block_object_dispose(&v38, 8);

  return v28;
}

id __157__HDDeletedSampleEntity_insertDeletedObject_dataType_provenanceIdentifier_deletionDate_persistStartAndEndDates_startTimestamp_endTimestamp_inDatabase_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)"), v1, CFSTR("data_id"), CFSTR("data_type"), CFSTR("start_date"), CFSTR("end_date"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __157__HDDeletedSampleEntity_insertDeletedObject_dataType_provenanceIdentifier_deletionDate_persistStartAndEndDates_startTimestamp_endTimestamp_inDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "longLongValue"));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "code"));
  if (*(_BYTE *)(a1 + 64))
    sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  else
    sqlite3_bind_null(a2, 3);
  if (*(_BYTE *)(a1 + 64))
    return sqlite3_bind_double(a2, 4, *(double *)(a1 + 56));
  else
    return sqlite3_bind_null(a2, 4);
}

+ (BOOL)enumerateDeletedSamplesWithTypes:(id)a3 profile:(id)a4 restrictedSourceEntities:(id)a5 limit:(unint64_t)a6 anchor:(int64_t)a7 error:(id *)a8 handler:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  char v34;
  void *v36;
  id *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a5;
  v18 = a9;
  if (v18)
  {
    v37 = a8;
    v19 = (void *)MEMORY[0x1E0D29840];
    HDSampleEntityPredicateForDataTypes(a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v20;
    HDDataEntityPredicateForType(2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateMatchingAllPredicates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v24 = (void *)MEMORY[0x1E0D29890];
      HDDataEntityPredicateForSourceEntitySet(7, v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "compoundPredicateWithPredicate:otherPredicate:", v23, v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v26;
    }
    if (a7 >= 1)
    {
      v27 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "predicateWithProperty:greaterThanValue:", CFSTR("data_id"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v29, v23);
      v30 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v30;
    }
    v31 = objc_alloc_init(MEMORY[0x1E0D298A0]);
    objc_msgSend(v31, "setEntityClass:", objc_opt_class());
    objc_msgSend(v31, "setLimitCount:", a6);
    objc_msgSend(v31, "setPredicate:", v23);
    objc_msgSend(v16, "database");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __118__HDDeletedSampleEntity_enumerateDeletedSamplesWithTypes_profile_restrictedSourceEntities_limit_anchor_error_handler___block_invoke;
    v38[3] = &unk_1E6CF2DE0;
    v41 = a1;
    v39 = v31;
    v40 = v18;
    v33 = v31;
    v34 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v32, v37, v38);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDeletedSampleEntity.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    v34 = 1;
  }

  return v34;
}

uint64_t __118__HDDeletedSampleEntity_enumerateDeletedSamplesWithTypes_profile_restrictedSourceEntities_limit_anchor_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D29898];
  v6 = a2;
  v7 = [v5 alloc];
  objc_msgSend(v6, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithDatabase:descriptor:", v8, *(_QWORD *)(a1 + 32));
  v15[0] = CFSTR("data_id");
  v15[1] = CFSTR("uuid");
  v15[2] = CFSTR("external_sync_ids.sid");
  v15[3] = CFSTR("external_sync_ids.version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118__HDDeletedSampleEntity_enumerateDeletedSamplesWithTypes_profile_restrictedSourceEntities_limit_anchor_error_handler___block_invoke_2;
  v13[3] = &unk_1E6CE84F0;
  v14 = *(id *)(a1 + 40);
  v11 = objc_msgSend(v9, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v10, a3, v13);

  return v11;
}

uint64_t __118__HDDeletedSampleEntity_enumerateDeletedSamplesWithTypes_profile_restrictedSourceEntities_limit_anchor_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;

  HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1E0](a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeletedSampleEntity _externalSyncMetadataForRow:]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB65B8], "_deletedObjectWithUUID:metadata:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return 1;
}

+ (Class)_entityClassForDeletion
{
  return (Class)objc_opt_class();
}

+ (id)databaseTable
{
  return +[HDSampleEntity databaseTable](HDSampleEntity, "databaseTable");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  return +[HDSampleEntity columnDefinitionsWithCount:](HDSampleEntity, "columnDefinitionsWithCount:", a3);
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDDeletedSampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDDeletedSampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "deletedSamples");
}

+ (BOOL)insertCodableDeletedSamples:(id)a3 provenance:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke;
  v23[3] = &unk_1E6CE7C58;
  v27 = a1;
  v24 = v12;
  v25 = v11;
  v26 = v10;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_221;
  v19[3] = &unk_1E6CF9FB8;
  v20 = v26;
  v21 = v25;
  v22 = v24;
  v15 = v24;
  v16 = v25;
  v17 = v26;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v13, a6, v23, v19);

  return (char)a6;
}

uint64_t __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v16;
  id obj;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void *v49;
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  objc_msgSend(v16, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataProvenanceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provenanceEntityForProvenance:error:", *(_QWORD *)(a1 + 40), a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_2;
    v49 = &unk_1E6CF9188;
    v50 = *(id *)(a1 + 32);
    v51 = *(id *)(a1 + 48);
    if (HKWithAutoreleasePool())
    {
      v19 = objc_alloc_init(MEMORY[0x1E0CB65B0]);
      v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__181;
      v44 = __Block_byref_object_dispose__181;
      v45 = 0;
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0;
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = *(id *)(a1 + 48);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v56, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v29 != v7)
              objc_enumerationMutation(obj);
            if (*((_BYTE *)v33 + 24))
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_transactionInterruptedError");
              v14 = (id)objc_claimAutoreleasedReturnValue();
              v12 = v14;
              if (v14)
              {
                if (a3)
                  *a3 = objc_retainAutorelease(v14);
                else
                  _HKLogDroppedError();
              }

              v13 = 0;
              goto LABEL_25;
            }
            v22 = v18;
            v23 = v21;
            v24 = v20;
            v25 = v19;
            v26 = *(id *)(a1 + 32);
            v27 = *(id *)(a1 + 40);
            HKWithAutoreleasePool();

          }
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v56, 16);
          if (v6)
            continue;
          break;
        }
      }

      if (v37[3] >= 1)
      {
        _HKInitializeLogging();
        v9 = (id)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v37[3];
          v11 = objc_msgSend(*(id *)(a1 + 48), "count");
          *(_DWORD *)buf = 134218240;
          v53 = v10;
          v54 = 2048;
          v55 = v11;
          _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "Encountered %ld constraint violations while inserting %ld deleted objects", buf, 0x16u);
        }

      }
      if (v41[5])
      {
        objc_msgSend(*(id *)(a1 + 32), "dataManager");
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:transaction:anchor:", v12, v19, 0, v16, v41[5]);
        v13 = 1;
LABEL_25:

      }
      else
      {
        v13 = 1;
      }
      _Block_object_dispose(&v32, 8);
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  HDDataDeletionConfiguration *v4;
  void *v5;
  uint64_t v6;

  v4 = objc_alloc_init(HDDataDeletionConfiguration);
  -[HDDataDeletionConfiguration setGenerateDeletedObjects:](v4, "setGenerateDeletedObjects:", 0);
  -[HDDataDeletionConfiguration setFailIfNotFound:](v4, "setFailIfNotFound:", 0);
  -[HDDataDeletionConfiguration setNotifyObservers:](v4, "setNotifyObservers:", 0);
  objc_msgSend(*(id *)(a1 + 32), "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deleteObjectsWithUUIDCollection:configuration:error:", *(_QWORD *)(a1 + 40), v4, a2);

  return v6;
}

uint64_t __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_3(uint64_t a1)
{
  id v2;
  double *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  void *v33;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (double *)*((id *)v2 + 4);
  v4 = (void *)*((_QWORD *)v2 + 1);
  if ((_HKValidDataTypeCode() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v3[1]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v3;
      objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", *((_QWORD *)v3 + 5));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB65B8], "_deletedObjectWithUUID:metadata:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *((_BYTE *)v2 + 40) & 6;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "persistentID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *((double *)v2 + 3);
      v12 = *((double *)v2 + 2);
      v13 = *(_QWORD *)(a1 + 56);
      v48 = 0;
      v42 = v8;
      v43 = (void *)v6;
      v44 = v7;
      +[HDDeletedSampleEntity insertDeletedObject:dataType:provenanceIdentifier:deletionDate:persistStartAndEndDates:startTimestamp:endTimestamp:inDatabase:error:](HDDeletedSampleEntity, "insertDeletedObject:dataType:provenanceIdentifier:deletionDate:persistStartAndEndDates:startTimestamp:endTimestamp:inDatabase:error:", v8, v6, v10, v7, v9 == 6, v13, v11, v12, &v48);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v48;

      if (!v14)
      {
        if (objc_msgSend(v15, "hd_isConstraintViolation"))
        {
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          v29 = v43;
          v18 = v45;
        }
        else if (objc_msgSend(v15, "hk_isTransactionInterruptedError"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
          _HKInitializeLogging();
          v32 = *MEMORY[0x1E0CB5370];
          v29 = v43;
          v18 = v45;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v50 = v8;
            v51 = 2114;
            v52 = v15;
            _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_INFO, "Transaction interrupted inserting deleted object %{public}@: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          _HKInitializeLogging();
          v35 = *MEMORY[0x1E0CB5370];
          v29 = v43;
          v18 = v45;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v50 = v8;
            v51 = 2114;
            v52 = v15;
            _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "Failed to insert deleted object %{public}@: %{public}@", buf, 0x16u);
          }
        }
        goto LABEL_29;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), v14);
      if (v9 == 6)
        objc_msgSend(*(id *)(a1 + 64), "insertIntervalWithStartTime:endTime:", *((double *)v2 + 3), *((double *)v2 + 2));
      objc_msgSend(MEMORY[0x1E0C99D80], "hk_dictionaryWithCodableMetadata:", *((_QWORD *)v3 + 3));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = v45;
      if (v16)
      {
        v41 = v14;
        v19 = *MEMORY[0x1E0CB55D0];
        objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB55D0]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v27 = v15;
          v29 = v43;
LABEL_24:
          v14 = v41;
LABEL_28:

          v15 = v27;
LABEL_29:

          goto LABEL_30;
        }
        v21 = *((_QWORD *)v3 + 2);
        if ((objc_msgSend(v3, "hasExternalSyncObjectCode") & 1) != 0)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", v19);
          v22 = v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB55D8]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *(_QWORD *)(a1 + 72);
          v39 = *(_QWORD *)(a1 + 56);
          v25 = objc_msgSend(v41, "longLongValue");
          objc_msgSend(*(id *)(a1 + 80), "sourceID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v15;
          LOBYTE(v38) = 1;
          LOBYTE(v25) = +[HDDataExternalSyncIdentifierEntity insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:](HDDataExternalSyncIdentifierEntity, "insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:", v40, v39, v25, objc_msgSend(v26, "longLongValue"), v22, v23, v24, v38, &v47);
          v27 = v47;

          if ((v25 & 1) == 0)
          {
            _HKInitializeLogging();
            v28 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v50 = v23;
              v51 = 2114;
              v52 = v24;
              v53 = 2114;
              v54 = v27;
              _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "Failed to insert external sync identifier (%{public}@, version %{public}@): %{public}@", buf, 0x20u);
            }
          }

          v29 = v43;
          v7 = v44;
          v8 = v42;
          v3 = v46;
          goto LABEL_24;
        }
        _HKInitializeLogging();
        v33 = (void *)*MEMORY[0x1E0CB5370];
        v14 = v41;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v36 = v33;
          objc_msgSend(v45, "UUIDString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v50 = v37;
          _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "HDCodableDeletedSample (%{public}@) with external sync metadata does not contain an external sync object code", buf, 0xCu);

          v14 = v41;
        }
      }
      v27 = v15;
      v29 = v43;
      v8 = v42;
      goto LABEL_28;
    }
    _HKInitializeLogging();
    v30 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v50 = v4;
      v31 = "unable to look up sample type %ld when inserting codable deleted samples.";
      goto LABEL_17;
    }
  }
  else
  {
    _HKInitializeLogging();
    v30 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v50 = v4;
      v31 = "invalid data type code %ld when inserting codable deleted samples.";
LABEL_17:
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
    }
  }
LABEL_30:

  return 1;
}

uint64_t __78__HDDeletedSampleEntity_insertCodableDeletedSamples_provenance_profile_error___block_invoke_221(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _HDDeletedSampleInsertionJournalEntry *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSArray *samples;
  uint64_t v11;
  HDDataOriginProvenance *provenance;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v5 = [_HDDeletedSampleInsertionJournalEntry alloc];
  v6 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v6;
  if (v5)
  {
    v16.receiver = v5;
    v16.super_class = (Class)_HDDeletedSampleInsertionJournalEntry;
    v5 = (_HDDeletedSampleInsertionJournalEntry *)objc_msgSendSuper2(&v16, sel_init);
    if (v5)
    {
      v9 = objc_msgSend(v7, "copy");
      samples = v5->_samples;
      v5->_samples = (NSArray *)v9;

      v11 = objc_msgSend(v8, "copy");
      provenance = v5->_provenance;
      v5->_provenance = (HDDataOriginProvenance *)v11;

    }
  }

  objc_msgSend(*(id *)(a1 + 48), "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "addJournalEntry:error:", v5, a3);

  return v14;
}

@end
