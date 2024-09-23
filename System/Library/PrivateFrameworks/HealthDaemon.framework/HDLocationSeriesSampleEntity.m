@implementation HDLocationSeriesSampleEntity

+ (BOOL)participatesInInsertion
{
  return 1;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  objc_opt_self();
  +[HDSQLiteEntity entityWithPersistentID:](HDSeriesSampleEntity, "entityWithPersistentID:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "HFDKeyWithDatabase:error:", v14, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {

    goto LABEL_7;
  }
  v17 = +[HDLocationSeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDLocationSeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", objc_msgSend(v16, "longLongValue"), v14, a7);

  if (!v17)
  {
LABEL_7:
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v11, "_codableWorkoutRoute");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18
    && !+[HDLocationSeriesSampleEntity _insertCodableSeriesDataFromObject:persistentID:database:error:]((uint64_t)a1, v11, v13, v14, a7))
  {
    v19 = 0;
  }
  else
  {
    v19 = v13;
  }
  v20 = v19;
LABEL_10:

  return v20;
}

+ (uint64_t)_insertCodableSeriesDataFromObject:(void *)a3 persistentID:(void *)a4 database:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  int v18;
  BOOL v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL (*v39)(uint64_t, uint64_t);
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v30 = a4;
  v26 = v8;
  v27 = v9;
  objc_opt_self();
  objc_msgSend(v8, "_codableWorkoutRoute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v10;
  +[HDSQLiteEntity entityWithPersistentID:](HDLocationSeriesSampleEntity, "entityWithPersistentID:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "HFDKeyWithDatabase:error:", v30, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v10, "locationDatas", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      v15 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v37 = v14;
          v38 = 3221225472;
          v39 = __95__HDLocationSeriesSampleEntity__insertCodableSeriesDataFromObject_persistentID_database_error___block_invoke;
          v40 = &unk_1E6CFD690;
          v41 = v17;
          v42 = v30;
          v43 = v11;
          v18 = HKWithAutoreleasePool();

          if (!v18)
          {

            goto LABEL_14;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v13)
          continue;
        break;
      }
    }

    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v31[4] = &v33;
    v32 = 0;
    v31[0] = v14;
    v31[1] = 3221225472;
    v31[2] = __95__HDLocationSeriesSampleEntity__insertCodableSeriesDataFromObject_persistentID_database_error___block_invoke_2;
    v31[3] = &unk_1E6CFD6B8;
    v19 = +[HDLocationSeriesDataEntity getRangeAndCountForSeriesIdentifier:database:error:handler:](HDLocationSeriesDataEntity, "getRangeAndCountForSeriesIdentifier:database:error:handler:", objc_msgSend(v11, "longLongValue"), v30, &v32, v31);
    v20 = v32;
    v21 = v20;
    if (v19 || (objc_msgSend(v20, "hk_isHealthKitErrorWithCode:", 1100) & 1) != 0)
    {
      v22 = objc_msgSend(v29, "updateSampleCount:withDatabase:error:", v34[3], v30, a5);
    }
    else
    {
      v23 = v21;
      v24 = v23;
      if (v23)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v23);
        else
          _HKLogDroppedError();
      }

      v22 = 0;
    }

    _Block_object_dispose(&v33, 8);
  }
  else
  {
LABEL_14:
    v22 = 0;
  }

  return v22;
}

BOOL __95__HDLocationSeriesSampleEntity__insertCodableSeriesDataFromObject_persistentID_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  id v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BOOL8 v30;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  int v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;

  v4 = *(id *)(a1 + 32);
  objc_msgSend(v4, "timestamp");
  v33 = v5;
  objc_msgSend(v4, "latitude");
  v32 = v6;
  objc_msgSend(v4, "longitude");
  v8 = v7;
  objc_msgSend(v4, "horizontalAccuracy");
  v10 = v9;
  objc_msgSend(v4, "altitude");
  v12 = v11;
  objc_msgSend(v4, "verticalAccuracy");
  v14 = v13;
  objc_msgSend(v4, "speed");
  v16 = v15;
  objc_msgSend(v4, "course");
  v18 = v17;
  v19 = -1.0;
  if (objc_msgSend(v4, "hasSpeedAccuracy"))
  {
    objc_msgSend(v4, "speedAccuracy");
    v19 = v20;
  }
  v21 = -1.0;
  if (objc_msgSend(v4, "hasCourseAccuracy"))
  {
    objc_msgSend(v4, "courseAccuracy");
    v21 = v22;
  }
  if (objc_msgSend(v4, "hasSignalEnvironmentType"))
    v23 = objc_msgSend(v4, "signalEnvironmentType");
  else
    v23 = 0;
  v24 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  v25 = *MEMORY[0x1E0C9E518];
  v34 = 0;
  v35 = v32;
  v36 = v8;
  v37 = v10;
  v38 = v12;
  v39 = v14;
  v40 = v16;
  v41 = v19;
  v42 = v18;
  v43 = v21;
  v44 = v33;
  v45 = 0;
  v46 = 0xBFF0000000000000;
  v47 = 0;
  v49 = 0;
  v48 = 0;
  v50 = 0x7FFFFFFF00000000;
  v51 = v25;
  v52 = 0;
  v53 = v23;
  v55 = 0;
  v54 = 0;
  v26 = (void *)objc_msgSend(v24, "initWithClientLocation:", &v34);

  v27 = *(_QWORD *)(a1 + 40);
  v28 = objc_msgSend(*(id *)(a1 + 48), "longLongValue");
  objc_msgSend(v26, "timestamp");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "timeIntervalSinceReferenceDate");
  v30 = +[HDLocationSeriesDataEntity insertOrReplaceEntity:database:identifier:timestamp:location:error:](HDLocationSeriesDataEntity, "insertOrReplaceEntity:database:identifier:timestamp:location:error:", 1, v27, v28, v26, a2);

  return v30;
}

+ (BOOL)insertLocationData:(id)a3 seriesIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  SEL v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__HDLocationSeriesSampleEntity_insertLocationData_seriesIdentifier_profile_error___block_invoke;
  v24[3] = &unk_1E6CFD6E0;
  v27 = a1;
  v25 = v12;
  v28 = a2;
  v26 = v11;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __82__HDLocationSeriesSampleEntity_insertLocationData_seriesIdentifier_profile_error___block_invoke_2;
  v20[3] = &unk_1E6CFD708;
  v16 = v25;
  v21 = v16;
  v17 = v26;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v14, a6, v24, v20);

  return (char)a6;
}

uint64_t __82__HDLocationSeriesSampleEntity_insertLocationData_seriesIdentifier_profile_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v11;

  objc_msgSend(a2, "databaseForEntityClass:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDLocationSeriesSampleEntity, "anyInDatabase:predicate:error:", v5, v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (!v7)
  {
    if (v8)
    {
      v8 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[7], CFSTR("Unable to find location series %@ during data insert."), a1[4]);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_9:

        v9 = 0;
        goto LABEL_10;
      }
    }
    if (a3)
    {
      v8 = objc_retainAutorelease(v8);
      *a3 = v8;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_9;
  }
  v9 = objc_msgSend(v7, "_insertLocationData:database:error:", a1[5], v5, a3);
LABEL_10:

  return v9;
}

+ (BOOL)isBackedByTable
{
  return 0;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)privateSubEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)createTableSQL
{
  return 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDLocationSeriesSampleEntityEncoder *v15;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDLocationSeriesSampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v11, v12, a5, v13, v14);

  return v15;
}

uint64_t __95__HDLocationSeriesSampleEntity__insertCodableSeriesDataFromObject_persistentID_database_error___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v11 = a3;
  v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "databaseForEntityClass:", a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "anyInDatabase:predicate:error:", v13, v15, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[HDLocationSeriesSampleEntity _insertCodableSeriesDataFromObject:persistentID:database:error:]((uint64_t)a1, v11, v17, v13, a7))v18 = v17;
      else
        v18 = 0;
      v19 = v18;

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __82__HDLocationSeriesSampleEntity_insertLocationData_seriesIdentifier_profile_error___block_invoke_2(void **a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;

  v5 = -[_HDLocationInsertionJournalEntry initWithSeriesPersistentID:locationData:]([_HDLocationInsertionJournalEntry alloc], a1[4], a1[5]);
  objc_msgSend(a1[6], "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "addJournalEntry:error:", v5, a3);

  return v7;
}

- (BOOL)_insertLocationData:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v23 = v9;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDLocationSeriesSampleEntity.mm"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDLocationSeriesSampleEntity.mm"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

LABEL_3:
  if (-[HDSeriesSampleEntity canAddDatumInDatabase:error:](self, "canAddDatumInDatabase:error:", v11, a5))
  {
    -[HDSeriesSampleEntity HFDKeyWithDatabase:error:](self, "HFDKeyWithDatabase:error:", v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      obj = v9;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v17 = objc_msgSend(v12, "longLongValue");
            objc_msgSend(v16, "timestamp");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "timeIntervalSinceReferenceDate");
            LOBYTE(v16) = +[HDLocationSeriesDataEntity insertOrReplaceEntity:database:identifier:timestamp:location:error:](HDLocationSeriesDataEntity, "insertOrReplaceEntity:database:identifier:timestamp:location:error:", 1, v11, v17, v16, a5);

            if ((v16 & 1) == 0)
            {
              v19 = 0;
              goto LABEL_16;
            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v13)
            continue;
          break;
        }
      }
      v19 = 1;
LABEL_16:

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Unable to add data to a frozen series."));
    v19 = 0;
  }

  return v19;
}

+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v7 = a4;
  v37 = 0;
  +[HDWorkoutBuilderAssociatedSeriesEntity allBuilderAssociatedSeriesWithProfile:error:](HDWorkoutBuilderAssociatedSeriesEntity, "allBuilderAssociatedSeriesWithProfile:error:", v7, &v37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v37;
  if (v8)
  {
    HDSeriesSamplePredicateForSamplesToAutoFreezeExcludingSamples(v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v28, "protectedDatabase", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v9;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __97__HDLocationSeriesSampleEntity_performPostFirstJournalMergeCleanupWithTransaction_profile_error___block_invoke;
    v34[3] = &unk_1E6CFD730;
    v27 = v10;
    v35 = v27;
    v12 = objc_msgSend(a1, "enumerateEntitiesInDatabase:predicate:error:enumerationHandler:", v11, v26, &v36, v34);
    v13 = v36;

    if ((v12 & 1) != 0)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v14 = v27;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v31;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
            v29 = v13;
            objc_msgSend(v18, "freezeWithTransaction:profile:error:", v28, v7, &v29);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v29;

            v13 = v20;
            if (!v19)
            {
              _HKInitializeLogging();
              v21 = (id)*MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = objc_msgSend(v18, "persistentID");
                *(_DWORD *)buf = 134218242;
                v39 = v22;
                v40 = 2114;
                v41 = v20;
                _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "Failed to freeze workout route %lld during post-journal-merge cleanup: %{public}@", buf, 0x16u);
              }

            }
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        }
        while (v15);
      }

    }
    else
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v39 = (uint64_t)v13;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Failed to enumerate workout routes requiring auto-freeze during post-journal-merge cleanup: %{public}@", buf, 0xCu);
      }
    }

    v9 = v13;
  }
  else
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = (uint64_t)v9;
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "Failed to determine builder-associated series during post-journal-merge cleanup: %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

uint64_t __97__HDLocationSeriesSampleEntity_performPostFirstJournalMergeCleanupWithTransaction_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (BOOL)enumerateLocationDataInDatabase:(id)a3 HFDKey:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  HDSeriesSamplePredicateForSeriesIdentifier(objc_msgSend(v11, "longLongValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v10, v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = objc_msgSend(v14, "enumerateLocationDataInDatabase:error:handler:", v10, a5, v12);
  else
    v15 = 1;

  return v15;
}

- (BOOL)enumerateLocationDataInDatabase:(id)a3 error:(id *)a4 handler:(id)a5
{
  return -[HDLocationSeriesSampleEntity enumerateLocationDataInDatabase:startDate:endDate:error:handler:](self, a3, 0, 0, (uint64_t)a4, a5);
}

- (BOOL)enumerateLocationDataInDatabase:(void *)a3 startDate:(void *)a4 endDate:(uint64_t)a5 error:(void *)a6 handler:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _BOOL8 v16;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (a1)
  {
    objc_msgSend(a1, "HFDKeyWithDatabase:error:", v11, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = +[HDLocationSeriesSampleEntity _rawEnumerateLocationDataInDatabase:HFDKey:startDate:endDate:error:handler:](HDLocationSeriesSampleEntity, "_rawEnumerateLocationDataInDatabase:HFDKey:startDate:endDate:error:handler:", v11, v15, v12, v13, a5, v14);
    else
      v16 = 0;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)enumerateLocationDataInTransaction:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(a3, "databaseForEntity:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[HDLocationSeriesSampleEntity enumerateLocationDataInDatabase:startDate:endDate:error:handler:](self, v15, v12, v13, (uint64_t)a6, v14);

  return (char)a6;
}

+ (BOOL)enumerateLocationDataWithTransaction:(id)a3 HFDKey:(id)a4 startDate:(id)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDSeriesSamplePredicateForSeriesIdentifier(objc_msgSend(v12, "longLongValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v15, v16, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "HFDKeyWithDatabase:error:", v15, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = +[HDLocationSeriesSampleEntity _rawEnumerateLocationDataInDatabase:HFDKey:startDate:endDate:error:handler:](HDLocationSeriesSampleEntity, "_rawEnumerateLocationDataInDatabase:HFDKey:startDate:endDate:error:handler:", v15, v18, v13, 0, a6, v14);
    else
      v19 = 0;

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

+ (BOOL)_rawEnumerateLocationDataInDatabase:(id)a3 HFDKey:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7 handler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v20[4];
  id v21;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = objc_msgSend(a4, "longLongValue");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __107__HDLocationSeriesSampleEntity__rawEnumerateLocationDataInDatabase_HFDKey_startDate_endDate_error_handler___block_invoke;
  v20[3] = &unk_1E6CFD758;
  v18 = v16;
  v21 = v18;
  LOBYTE(a7) = +[HDLocationSeriesDataEntity enumerateSeries:database:startDate:endDate:error:handler:](HDLocationSeriesDataEntity, "enumerateSeries:database:startDate:endDate:error:handler:", v17, v13, v14, v15, a7, v20);

  return (char)a7;
}

uint64_t __107__HDLocationSeriesSampleEntity__rawEnumerateLocationDataInDatabase_HFDKey_startDate_endDate_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)copyLocationDataFromSeriesIdentifier:(id)a3 toSeriesIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6
{
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  BOOL v22;
  id v23;
  SEL v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v27 = a3;
  v28 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDLocationSeriesSampleEntity, "anyInDatabase:predicate:error:", v11, v12, &v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v32;

  if (v13)
  {
    v31 = v14;
    objc_msgSend(v13, "HFDKeyWithDatabase:error:", v11, &v31);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v31;

    if (v15)
    {
      HDDataEntityPredicateForDataUUID();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = a2;
      v30 = 0;
      +[HDDataEntity anyInDatabase:predicate:error:](HDLocationSeriesSampleEntity, "anyInDatabase:predicate:error:", v11, v17, &v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v30;

      v26 = v18;
      if (v18)
      {
        v29 = v19;
        objc_msgSend(v18, "HFDKeyWithDatabase:error:", v11, &v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v29;

        if (v20)
        {
          v22 = +[HDLocationSeriesDataEntity copySeriesDataWithIdentifier:toSeriesIdentifier:database:error:](HDLocationSeriesDataEntity, "copySeriesDataWithIdentifier:toSeriesIdentifier:database:error:", objc_msgSend(v15, "longLongValue"), objc_msgSend(v20, "longLongValue"), v11, a6);
LABEL_24:

          goto LABEL_25;
        }
        v19 = v21;
      }
      if (v19)
      {
        v23 = v19;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), v25, CFSTR("Unable to find destination location series %@ during data copy."), v28);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          v22 = 1;
LABEL_23:

          v20 = 0;
          v21 = v23;
          goto LABEL_24;
        }
      }
      if (a6)
      {
        v23 = objc_retainAutorelease(v23);
        v22 = 0;
        *a6 = v23;
      }
      else
      {
        _HKLogDroppedError();
        v22 = 0;
      }
      goto LABEL_23;
    }
    v14 = v16;
  }
  if (v14)
  {
    v15 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Unable to find source location series %@ during data copy."), v27);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = 0;
      v22 = 1;
      goto LABEL_25;
    }
  }
  if (a6)
  {
    v15 = objc_retainAutorelease(v15);
    v22 = 0;
    *a6 = v15;
  }
  else
  {
    _HKLogDroppedError();
    v22 = 0;
  }
  v16 = v15;
LABEL_25:

  return v22;
}

- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4
{
  id v6;
  objc_super v8;

  v6 = a3;
  -[HDLocationSeriesSampleEntity willDeleteFromDatabase:](self, "willDeleteFromDatabase:", v6);
  v8.receiver = self;
  v8.super_class = (Class)HDLocationSeriesSampleEntity;
  LOBYTE(a4) = -[HDSQLiteEntity deleteFromDatabase:error:](&v8, sel_deleteFromDatabase_error_, v6, a4);

  return (char)a4;
}

- (void)willDeleteFromDatabase:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  int64_t v12;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0;
  -[HDSeriesSampleEntity HFDKeyWithDatabase:error:](self, "HFDKeyWithDatabase:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    v9 = v6;
    +[HDLocationSeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDLocationSeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", objc_msgSend(v5, "longLongValue"), v4, &v9);
    v7 = v6;
    v6 = v9;
  }
  else
  {
    _HKInitializeLogging();
    v7 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[HDSQLiteEntity persistentID](self, "persistentID");
      *(_DWORD *)buf = 134218242;
      v12 = v8;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Failed to find HFD Key when deleting object with persistent id %lld: %{public}@", buf, 0x16u);
    }
  }

}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  objc_msgSend(a3, "locationSeries");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "addLocationSeries:", v5);

  return v5 != 0;
}

- (id)freezeWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  char v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  id v61;
  const char *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  NSObject *v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  NSObject *v69;
  uint32_t v70;
  id v71;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  _QWORD v84[6];
  _QWORD v85[7];
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  double *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double *v95;
  uint64_t v96;
  CFAbsoluteTime Current;
  _QWORD v98[5];
  id v99;
  const __CFString *v100;
  _QWORD v101[2];
  _BYTE buf[24];
  uint64_t (*v103)(uint64_t, uint64_t);
  _BYTE v104[20];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v83 = a4;
  v94 = 0;
  v95 = (double *)&v94;
  v96 = 0x2020000000;
  Current = 0.0;
  Current = CFAbsoluteTimeGetCurrent();
  v90 = 0;
  v91 = (double *)&v90;
  v93 = 0;
  v9 = *((_QWORD *)v95 + 3);
  v92 = 0x2020000000;
  v93 = v9;
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v89 = 0;
  objc_msgSend(v8, "databaseForEntity:", self);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSeriesSampleEntity HFDKeyWithDatabase:error:](self, "HFDKeyWithDatabase:error:", v82, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke;
    v85[3] = &unk_1E6CFD780;
    v85[4] = &v94;
    v85[5] = &v90;
    v85[6] = &v86;
    if ((+[HDLocationSeriesSampleEntity _getRangeAndCountForKey:transaction:error:handler:]((uint64_t)HDLocationSeriesSampleEntity, v10, v8, a5, v85) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v83;
      v13 = (void *)objc_opt_self();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v103 = __Block_byref_object_copy__125;
      *(_QWORD *)v104 = __Block_byref_object_dispose__125;
      *(_QWORD *)&v104[8] = 0;
      objc_msgSend(v13, "entityEnumeratorWithProfile:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HDDataEntityPredicateForRowID((uint64_t)v11, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPredicate:", v15);

      objc_msgSend(v14, "setIgnoreEntityClassAdditionalPredicateForEnumeration:", 1);
      v99 = 0;
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = __79__HDLocationSeriesSampleEntity__routeSampleWithID_canBeUnfrozen_profile_error___block_invoke;
      v98[3] = &unk_1E6CFD7F0;
      v98[4] = buf;
      objc_msgSend(v14, "enumerateWithError:handler:", &v99, v98);
      v16 = v99;
      v17 = v16;
      v18 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v81 = v18;
      if (v18)
      {
        v19 = v18;
        goto LABEL_15;
      }
      if (v16)
      {
        v17 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Could not find series with ID %@"), v11);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
LABEL_14:

          v18 = 0;
LABEL_15:

          _Block_object_dispose(buf, 8);
          if (!v18)
          {
            v43 = v81;
            _HKInitializeLogging();
            v44 = *MEMORY[0x1E0CB5380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
            {
              v45 = *a5;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v45;
              _os_log_impl(&dword_1B7802000, v44, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@: Failed getting unfrozen route sample, error:%@", buf, 0x16u);
            }
            v25 = 0;
            goto LABEL_62;
          }
          objc_msgSend(v81, "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = (void *)objc_msgSend(v26, "copy");

          v74 = objc_msgSend(v10, "longLongValue");
          objc_msgSend(v81, "metadata");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "sourceRevision");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "source");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "_sourceID");
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "longLongValue");
          v29 = v95[3];
          v30 = v91[3];
          v31 = v87[3];
          v78 = v81;
          v80 = v12;
          v32 = v8;
          v79 = v32;
          if (self)
          {
            objc_msgSend(v32, "databaseForEntity:", self);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDSQLiteEntity valueForProperty:database:](self, "valueForProperty:database:", CFSTR("provenance"), v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v80, "dataProvenanceManager");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "originProvenanceForPersistentID:transaction:error:", v34, v79, a5);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "_setUUID:");
                objc_msgSend(v78, "_setStartTimestamp:", v29);
                objc_msgSend(v78, "_setEndTimestamp:", v30);
                objc_msgSend(v78, "_setCount:", v31);
                objc_msgSend(v78, "_setMetadata:", 0);
                objc_msgSend(v80, "dataManager");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)buf = v78;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "_creationDate");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "timeIntervalSinceReferenceDate");
                v40 = objc_msgSend(v37, "insertDataObjects:withProvenance:creationDate:error:", v38, v36, a5);

                if ((v40 & 1) != 0)
                {
                  v41 = v73;
                  v42 = v73;
                }
                else
                {
                  v42 = 0;
                  v41 = v73;
                }

              }
              else
              {
                v42 = 0;
              }

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("Unable to get %@ for %@ with persistentID %lld"), CFSTR("provenance"), objc_opt_class(), -[HDSQLiteEntity persistentID](self, "persistentID"));
              v42 = 0;
            }

          }
          else
          {
            v42 = 0;
          }

          if (!v42)
          {
            _HKInitializeLogging();
            v58 = *MEMORY[0x1E0CB5380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
            {
              v59 = *a5;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v59;
              _os_log_impl(&dword_1B7802000, v58, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@: Frozen series uuid is nil, error:%@", buf, 0x16u);
            }
            v25 = 0;
            goto LABEL_61;
          }
          HDDataEntityPredicateForDataUUID();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDDataEntity anyInDatabase:predicate:error:](HDLocationSeriesSampleEntity, "anyInDatabase:predicate:error:", v82, v46, a5);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            if ((objc_msgSend(v47, "updateSampleCount:withDatabase:error:", v87[3], v82, a5) & 1) != 0)
            {
              v101[0] = CFSTR("start_date");
              v101[1] = CFSTR("end_date");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v84[0] = MEMORY[0x1E0C809B0];
              v84[1] = 3221225472;
              v84[2] = __68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke_218;
              v84[3] = &unk_1E6CFD7A8;
              v84[4] = &v94;
              v84[5] = &v90;
              v49 = objc_msgSend(v47, "updateProperties:database:error:bindingHandler:", v48, v82, a5, v84);

              if ((v49 & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v47, "persistentID"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = +[HDSeriesSampleEntity replaceObjectID:replacementObjectID:deleteOriginalSeriesData:insertDeletedObject:profile:transaction:error:](HDLocationSeriesSampleEntity, "replaceObjectID:replacementObjectID:deleteOriginalSeriesData:insertDeletedObject:profile:transaction:error:", v50, v51, 0, 0, v80, v79, a5);

                if (v52)
                {
                  if (v77)
                  {
                    objc_msgSend(v80, "metadataManager");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v47, "persistentID"));
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v55 = objc_msgSend(v53, "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:error:", v77, v54, v76, objc_msgSend(v78, "_externalSyncObjectCode"), 0, a5);

                    if ((v55 & 1) == 0)
                    {
                      _HKInitializeLogging();
                      v67 = *MEMORY[0x1E0CB5380];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                      {
                        v68 = (uint64_t (*)(uint64_t, uint64_t))*a5;
                        *(_DWORD *)buf = 138543874;
                        *(_QWORD *)&buf[4] = self;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v77;
                        *(_WORD *)&buf[22] = 2112;
                        v103 = v68;
                        v62 = "[routes] %{public}@: Adding metadata failed, metadata:%@ error:%@";
                        v69 = v67;
                        v70 = 32;
LABEL_58:
                        _os_log_impl(&dword_1B7802000, v69, OS_LOG_TYPE_DEFAULT, v62, buf, v70);
                        goto LABEL_59;
                      }
                      goto LABEL_59;
                    }
                  }
                  v100 = CFSTR("frozen");
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = objc_msgSend(v47, "updateProperties:database:error:bindingHandler:", v56, v82, a5, &__block_literal_global_148);

                  if ((v57 & 1) != 0)
                  {
                    if ((+[HDLocationSeriesSampleEntity _updateFrozenEntityToMatchReplacedUnfrozenEntity:unfrozenSeriesUUID:unfrozenSeriesHFDKey:database:error:]((uint64_t)HDLocationSeriesSampleEntity, v47, v75, v74, v82, (uint64_t)a5) & 1) != 0)
                    {
                      v25 = v47;
LABEL_60:

LABEL_61:
                      v43 = v81;
LABEL_62:

                      goto LABEL_63;
                    }
                    _HKInitializeLogging();
                    v60 = *MEMORY[0x1E0CB5380];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                    {
                      v71 = *a5;
                      *(_DWORD *)buf = 138543618;
                      *(_QWORD *)&buf[4] = self;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v71;
                      v62 = "[routes] %{public}@: Update the new entity so it has the same UUID and hfd_key as the replac"
                            "ed entity failed, error:%@";
                      goto LABEL_57;
                    }
LABEL_59:
                    v25 = 0;
                    goto LABEL_60;
                  }
                  _HKInitializeLogging();
                  v60 = *MEMORY[0x1E0CB5380];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                    goto LABEL_59;
                  v66 = *a5;
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = self;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v66;
                  v62 = "[routes] %{public}@: Marking series as frozen failed, error:%@";
                }
                else
                {
                  _HKInitializeLogging();
                  v60 = *MEMORY[0x1E0CB5380];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                    goto LABEL_59;
                  v65 = *a5;
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = self;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v65;
                  v62 = "[routes] %{public}@: Replacing old entity with new entity failed, error:%@";
                }
              }
              else
              {
                _HKInitializeLogging();
                v60 = *MEMORY[0x1E0CB5380];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                  goto LABEL_59;
                v64 = *a5;
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v64;
                v62 = "[routes] %{public}@: Updating properties for frozen entity failed, error:%@";
              }
            }
            else
            {
              _HKInitializeLogging();
              v60 = *MEMORY[0x1E0CB5380];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                goto LABEL_59;
              v63 = *a5;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v63;
              v62 = "[routes] %{public}@: Updating sample count for Frozen entity failed, error:%@";
            }
          }
          else
          {
            _HKInitializeLogging();
            v60 = *MEMORY[0x1E0CB5380];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
              goto LABEL_59;
            v61 = *a5;
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v61;
            v62 = "[routes] %{public}@: Frozen series entity is nil, error:%@";
          }
LABEL_57:
          v69 = v60;
          v70 = 22;
          goto LABEL_58;
        }
      }
      if (a5)
      {
        v17 = objc_retainAutorelease(v17);
        *a5 = v17;
      }
      else
      {
        _HKLogDroppedError();
      }
      goto LABEL_14;
    }
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v21 = *((_QWORD *)v95 + 3);
      v22 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v91 + 3);
      v23 = v87[3];
      v24 = *a5;
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2048;
      v103 = v22;
      *(_WORD *)v104 = 2048;
      *(_QWORD *)&v104[2] = v23;
      *(_WORD *)&v104[10] = 2112;
      *(_QWORD *)&v104[12] = v24;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@: Failed getting range and count for location series during freeze. start:%f, end:%f, count:%lld, error:%@", buf, 0x34u);
    }
  }
  v25 = 0;
LABEL_63:

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v94, 8);

  return v25;
}

_QWORD *__68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke(_QWORD *result, uint64_t a2, double a3, double a4)
{
  *(double *)(*(_QWORD *)(result[4] + 8) + 24) = a3;
  *(double *)(*(_QWORD *)(result[5] + 8) + 24) = a4;
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = a2;
  return result;
}

+ (uint64_t)_getRangeAndCountForKey:(void *)a3 transaction:(_QWORD *)a4 error:(void *)a5 handler:
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, double, double);
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  CFAbsoluteTime Current;
  uint64_t v16;
  id v17;
  void *v18;
  id v20;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  objc_opt_self();
  v11 = objc_msgSend(v8, "longLongValue");
  objc_msgSend(v9, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v13 = +[HDLocationSeriesDataEntity getRangeAndCountForSeriesIdentifier:database:error:handler:](HDLocationSeriesDataEntity, "getRangeAndCountForSeriesIdentifier:database:error:handler:", v11, v12, &v20, v10);
  v14 = v20;

  if (v13)
    goto LABEL_4;
  if ((objc_msgSend(v14, "hk_isHealthKitErrorWithCode:", 1100) & 1) != 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v10[2](v10, 0, Current, Current);
LABEL_4:
    v16 = 1;
    goto LABEL_10;
  }
  v17 = v14;
  v18 = v17;
  if (v17)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError();
  }

  v16 = 0;
LABEL_10:

  return v16;
}

void __68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke_218(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB0F0](a2, CFSTR("start_date"), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  JUMPOUT(0x1BCCAB0F0);
}

void __68__HDLocationSeriesSampleEntity_freezeWithTransaction_profile_error___block_invoke_220()
{
  JUMPOUT(0x1BCCAB0CCLL);
}

+ (uint64_t)_updateFrozenEntityToMatchReplacedUnfrozenEntity:(void *)a3 unfrozenSeriesUUID:(uint64_t)a4 unfrozenSeriesHFDKey:(void *)a5 database:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  char v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a5;
  objc_opt_self();
  v24[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __136__HDLocationSeriesSampleEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke;
  v21[3] = &unk_1E6CFD818;
  v15 = v11;
  v22 = v15;
  v16 = objc_msgSend(v10, "updateProperties:database:error:bindingHandler:", v13, v12, a6, v21);

  if ((v16 & 1) != 0)
  {
    v23 = CFSTR("hfd_key");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __136__HDLocationSeriesSampleEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke_2;
    v20[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
    v20[4] = a4;
    v18 = objc_msgSend(v10, "updateProperties:database:error:bindingHandler:", v17, v12, a6, v20);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __79__HDLocationSeriesSampleEntity__routeSampleWithID_canBeUnfrozen_profile_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

void __136__HDLocationSeriesSampleEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke()
{
  JUMPOUT(0x1BCCAB168);
}

void __136__HDLocationSeriesSampleEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke_2()
{
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v8;
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
  id v20;
  id v21;
  id *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v25 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v24 = v8;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLocationSeriesSampleEntity, "disambiguatedDatabaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLocationSeriesSampleEntity, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLocationSeriesSampleEntity, "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a4;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDLocationSeriesSampleEntity, "disambiguatedDatabaseTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SELECT %@.%@, %@, %@, %@, %@, %@ FROM %@ LEFT JOIN %@ ON %@.%@ = %@.%@ LEFT JOIN %@ ON %@.%@ = %@.%@"), v10, CFSTR("data_id"), CFSTR("count"), CFSTR("hfd_key"), CFSTR("start_date"), CFSTR("end_date"), CFSTR("uuid"), v11, v12, v13, CFSTR("data_id"), v14, CFSTR("data_id"), v15, v16, CFSTR("data_id"),
    v17,
    CFSTR("data_id"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke;
  v26[3] = &unk_1E6CFD868;
  v20 = v18;
  v27 = v20;
  v29 = a1;
  v21 = v24;
  v28 = v21;
  LOBYTE(v11) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v19, v23, v26);

  return (char)v11;
}

uint64_t __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_2;
  v11[3] = &unk_1E6CFD840;
  v14 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v12 = v8;
  v13 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a3, 0, v11);

  return v9;
}

uint64_t __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_2(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v44;
  _QWORD v45[7];
  id v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNumber();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v8 = v7;
  HDSQLiteColumnWithNameAsDouble();
  v10 = v9;
  HDSQLiteColumnWithNameAsUUID();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = (double *)&v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = (double *)&v47;
  v49 = 0x2020000000;
  v50 = 0;
  v12 = a1[6];
  v13 = (void *)a1[4];
  v46 = 0;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_3;
  v45[3] = &unk_1E6CFD780;
  v45[4] = &v55;
  v45[5] = &v51;
  v45[6] = &v47;
  v14 = +[HDLocationSeriesSampleEntity _getRangeAndCountForKey:transaction:error:handler:](v12, v6, v13, &v46, v45);
  v15 = v46;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v33 = a1[5];
    v32 = (void *)a1[6];
    v34 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "localizedDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("Could not access location series data (%@)"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "createValidationError:rowId:", v36, v5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v37);

    v38 = v16;
    v29 = v38;
    if (v38)
    {
      if (a3)
      {
        v29 = objc_retainAutorelease(v38);
        *a3 = v29;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_18;
  }
  v17 = v56[3];
  if (!v17)
  {
    v40 = a1[5];
    v39 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing HFD samples history, entity's count is %@"), v44);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "createValidationError:rowId:", v29, v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v31);
    goto LABEL_16;
  }
  if (v17 != objc_msgSend(v44, "longValue"))
  {
    v19 = a1[5];
    v18 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFD samples count mismatch: count in HFD=%lld, count in SQLite=%@"), v56[3], v44);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createValidationError:rowId:", v20, v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v21);

  }
  v22 = v8 - v52[3];
  if (v22 < 0.0)
    v22 = -v22;
  if (v22 > 2.22044605e-16)
    goto LABEL_11;
  v23 = v10 - v48[3];
  if (v23 < 0.0)
    v23 = -v23;
  if (v23 > 2.22044605e-16)
  {
LABEL_11:
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v52[3]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v48[3]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Series date interval mismatch start_date=%@ end_date=%@ hfd_start_date=%@ hfd_end_date=%@"), v25, v26, v27, v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    v30 = a1[5];
    objc_msgSend((id)a1[6], "createValidationError:rowId:", v29, v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);
LABEL_16:

LABEL_18:
  }
  if (!v11)
  {
    v41 = a1[5];
    objc_msgSend((id)a1[6], "createValidationError:rowId:", CFSTR("UUID not set"), v5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v42);

  }
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return 1;
}

_QWORD *__87__HDLocationSeriesSampleEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_3(_QWORD *result, uint64_t a2, double a3, double a4)
{
  *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = a2;
  *(double *)(*(_QWORD *)(result[5] + 8) + 24) = a3;
  *(double *)(*(_QWORD *)(result[6] + 8) + 24) = a4;
  return result;
}

@end
