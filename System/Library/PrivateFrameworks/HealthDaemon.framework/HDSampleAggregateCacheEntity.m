@implementation HDSampleAggregateCacheEntity

+ (id)databaseTable
{
  return CFSTR("sample_aggregate_caches");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSampleAggregateCacheEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("owning_query_id");
  v3[1] = CFSTR("bucket_index");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("owning_query_id");
  +[HDHealthEntity defaultForeignKey](HDCachedQueryMetadataEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_queryMetadataForIdentifier:(uint64_t)a1 sourceEntity:(void *)a2 generationNumber:(void *)a3 persistentAnchorDate:(void *)a4 intervalComponents:(void *)a5 profile:(void *)a6 transaction:(void *)a7 error:(_QWORD *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HDCachedQueryMetadata *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;

  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = objc_opt_self();
  objc_msgSend(v19, "databaseForEntityClass:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0;
  +[HDSampleAggregateCacheEntity _owningCachedQueryEntityForQueryIdentifier:sourceEntity:database:error:](v20, v14, v15, v21, (uint64_t)&v42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v42;
  v24 = v23;
  if (!v22)
  {
    if (v23)
    {
      if (a8)
      {
        v22 = 0;
        *a8 = objc_retainAutorelease(v23);
      }
      else
      {
        _HKLogDroppedError();
        v22 = 0;
      }
    }
    else
    {
      v36 = a8;
      v26 = [HDCachedQueryMetadata alloc];
      v37 = objc_msgSend(v15, "persistentID");
      objc_msgSend(v18, "daemon");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "behavior");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "currentOSBuild");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[HDCachedQueryMetadata initWithCachingIdentifier:sourceEntityPersistentID:buildVersion:anchorDate:intervalComponents:](v26, "initWithCachingIdentifier:sourceEntityPersistentID:buildVersion:anchorDate:intervalComponents:", v14, v37, v28, v16, v17);

      v30 = (void *)v29;
      v41 = 0;
      +[HDCachedQueryMetadataEntity insertCachedQueryMetadata:profile:error:](HDCachedQueryMetadataEntity, "insertCachedQueryMetadata:profile:error:", v29, v18, &v41);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v41;
      v32 = v31;
      if (v22)
      {
        v33 = v22;
      }
      else
      {
        v34 = v31;
        if (v34)
        {
          v40 = v30;
          if (v36)
          {
            v38 = v34;
            *v36 = objc_retainAutorelease(v34);
            v34 = v38;
          }
          else
          {
            v35 = v34;
            _HKLogDroppedError();
            v34 = v35;
          }
          v30 = v40;
        }

      }
    }
  }

  return v22;
}

+ (id)_owningCachedQueryEntityForQueryIdentifier:(void *)a3 sourceEntity:(void *)a4 database:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_opt_self();
  HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource((uint64_t)v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity anyInDatabase:predicate:error:](HDCachedQueryMetadataEntity, "anyInDatabase:predicate:error:", v8, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)insertCachedData:(id)a3 forQueryIdentifier:(id)a4 sourceEntity:(id)a5 generationNumber:(int64_t)a6 persistentAnchorDate:(id)a7 intervalComponents:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  int64_t v47;
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleAggregateCacheEntity.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryIdentifier != nil"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleAggregateCacheEntity.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceEntity != nil"));

LABEL_3:
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleAggregateCacheEntity.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

    if (v19)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleAggregateCacheEntity.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentAnchorDate != nil"));

    goto LABEL_5;
  }
  if (!v19)
    goto LABEL_9;
LABEL_5:
  v48[0] = CFSTR("owning_query_id");
  v48[1] = CFSTR("bucket_index");
  v48[2] = CFSTR("data");
  v48[3] = CFSTR("generation_number");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "database");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __152__HDSampleAggregateCacheEntity_insertCachedData_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke;
  v38[3] = &unk_1E6D0AB98;
  v39 = v17;
  v40 = v18;
  v46 = a1;
  v47 = a6;
  v41 = v19;
  v42 = v20;
  v43 = v21;
  v44 = v16;
  v45 = v22;
  v24 = v22;
  v25 = v16;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  v31 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v23, a10, v38);

  return v31;
}

uint64_t __152__HDSampleAggregateCacheEntity_insertCachedData_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v22;
  id obj;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[HDSampleAggregateCacheEntity _queryMetadataForIdentifier:sourceEntity:generationNumber:persistentAnchorDate:intervalComponents:profile:transaction:error:](*(_QWORD *)(a1 + 88), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 88));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = *(id *)(a1 + 72);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      v22 = v5;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "bucketIndexForIntervalComponents:anchorDate:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v22);
          v30 = 0;
          v13 = objc_msgSend(v11, "getData:error:", &v30, a3);
          v14 = v30;
          if (!v13)
            goto LABEL_12;
          v15 = *(_QWORD *)(a1 + 80);
          v16 = *(void **)(a1 + 88);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __152__HDSampleAggregateCacheEntity_insertCachedData_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke_2;
          v25[3] = &unk_1E6CF32F8;
          v26 = v6;
          v17 = *(_QWORD *)(a1 + 96);
          v28 = v12;
          v29 = v17;
          v18 = v14;
          v27 = v18;
          objc_msgSend(v16, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v24, v15, a3, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
LABEL_12:

            v20 = 0;
            v5 = v22;
            goto LABEL_15;
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v20 = 1;
        v5 = v22;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v20 = 1;
    }
LABEL_15:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __152__HDSampleAggregateCacheEntity_insertCachedData_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("owning_query_id"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("bucket_index"), *(_QWORD *)(a1 + 48));
  MEMORY[0x1BCCAB114](a2, CFSTR("generation_number"), *(_QWORD *)(a1 + 56));
  JUMPOUT(0x1BCCAB0D8);
}

+ (BOOL)deleteCacheForBucketIndexes:(id)a3 forQueryIdentifier:(id)a4 sourceEntity:(id)a5 generationNumber:(int64_t)a6 persistentAnchorDate:(id)a7 intervalComponents:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int64_t v43;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleAggregateCacheEntity.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryIdentifier != nil"));

  }
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleAggregateCacheEntity.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceEntity != nil"));

    if (v22)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleAggregateCacheEntity.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

    goto LABEL_5;
  }
  if (!v22)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v22, "database");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __163__HDSampleAggregateCacheEntity_deleteCacheForBucketIndexes_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke;
  v35[3] = &unk_1E6CE9140;
  v36 = v18;
  v37 = v19;
  v42 = a1;
  v43 = a6;
  v38 = v20;
  v39 = v21;
  v40 = v22;
  v41 = v17;
  v24 = v17;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v23, a10, v35);

  return v30;
}

uint64_t __163__HDSampleAggregateCacheEntity_deleteCacheForBucketIndexes_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  +[HDSampleAggregateCacheEntity _queryMetadataForIdentifier:sourceEntity:generationNumber:persistentAnchorDate:intervalComponents:profile:transaction:error:](*(_QWORD *)(a1 + 80), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 80));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("bucket_index"), *(_QWORD *)(a1 + 72));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "deleteEntitiesInDatabase:predicate:error:", v7, v9, a3);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (int64_t)cachesExistForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  int64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 2;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__HDSampleAggregateCacheEntity_cachesExistForQueryIdentifier_sourceEntity_profile_error___block_invoke;
  v19[3] = &unk_1E6CF5470;
  v24 = a1;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v23 = &v25;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSampleAggregateCacheEntity, "performReadTransactionWithHealthDatabase:error:block:", v13, a6, v19);

  if ((a6 & 1) != 0)
    v17 = v26[3];
  else
    v17 = 0;

  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __89__HDSampleAggregateCacheEntity_cachesExistForQueryIdentifier_sourceEntity_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  id v22;
  id v23;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v23 = 0;
  +[HDSampleAggregateCacheEntity _owningCachedQueryEntityForQueryIdentifier:sourceEntity:database:error:](v6, v7, v8, v5, (uint64_t)&v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  v11 = v10;
  if (v9)
    v12 = 1;
  else
    v12 = v10 == 0;
  if (v12)
  {
    if (v9)
    {
      v13 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateWithProperty:equalToValue:", CFSTR("owning_query_id"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      +[HDHealthEntity anyWithPredicate:healthDatabase:error:](HDSampleAggregateCacheEntity, "anyWithPredicate:healthDatabase:error:", v15, v16, &v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v22;

      if (v17)
        v19 = 1;
      else
        v19 = v18 == 0;
      v20 = v19;
      if (v19)
      {
        if (v17)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      }
      else if (a3)
      {
        *a3 = objc_retainAutorelease(v18);
      }
      else
      {
        _HKLogDroppedError();
      }

    }
    else
    {
      v20 = 1;
    }
  }
  else if (a3)
  {
    v20 = 0;
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    _HKLogDroppedError();
    v20 = 0;
  }

  return v20;
}

+ (BOOL)enumerateCachedDataForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 startIndex:(int64_t)a6 endIndex:(int64_t)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  int64_t v33;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  if (a6 > a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSampleAggregateCacheEntity.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startIndex <= endIndex"));

  }
  objc_msgSend(v18, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke;
  v27[3] = &unk_1E6D0ABC0;
  v28 = v16;
  v29 = v17;
  v32 = a6;
  v33 = a7;
  v30 = v19;
  v31 = a1;
  v21 = v19;
  v22 = v17;
  v23 = v16;
  v24 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSampleAggregateCacheEntity, "performReadTransactionWithHealthDatabase:error:block:", v20, a8, v27);

  return v24;
}

uint64_t __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[3];
  void *v40;
  _QWORD v41[4];

  v41[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v38 = 0;
  +[HDSampleAggregateCacheEntity _owningCachedQueryEntityForQueryIdentifier:sourceEntity:database:error:](v6, v7, v8, v5, (uint64_t)&v38);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v38;
  v11 = v10;
  if (v9)
    v12 = 1;
  else
    v12 = v10 == 0;
  if (v12)
  {
    if (v9)
    {
      v13 = objc_msgSend(v9, "persistentID");
      v35 = a3;
      v14 = *(_QWORD *)(a1 + 64);
      v32 = *(_QWORD *)(a1 + 72);
      v34 = objc_alloc_init(MEMORY[0x1E0D298A0]);
      objc_msgSend(v34, "setEntityClass:", objc_opt_class());
      v15 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "predicateWithProperty:equalToValue:", CFSTR("owning_query_id"), v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v16;
      v17 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("bucket_index"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v19;
      v20 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "predicateWithProperty:lessThanValue:", CFSTR("bucket_index"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
      v23 = v5;
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setPredicate:", v25);

      objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("bucket_index"), objc_opt_class(), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setOrderingTerms:", v27);

      v5 = v23;
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v23, v34);
      v39[0] = CFSTR("data");
      v39[1] = CFSTR("bucket_index");
      v39[2] = CFSTR("generation_number");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke_2;
      v36[3] = &unk_1E6CE91B8;
      v37 = *(id *)(a1 + 48);
      v30 = objc_msgSend(v28, "enumerateProperties:error:enumerationHandler:", v29, v35, v36);

    }
    else
    {
      v30 = 1;
    }
  }
  else if (a3)
  {
    v30 = 0;
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    _HKLogDroppedError();
    v30 = 0;
  }

  return v30;
}

uint64_t __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v3 = *(id *)(a1 + 32);
  v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  HDSQLiteColumnWithNameAsData();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsInt64();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
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
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDCachedQueryMetadataEntity, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("DELETE FROM %@                                                               WHERE ROWID IN(                                                                SELECT a.ROWID FROM %@ a                                                                 INNER JOIN %@ b ON (a.%@ = b.ROWID)                                                                     WHERE a.%@ < b.%@ OR a.%@ > b.%@ OR  a.%@ > b.%@                                                              );"),
    v12,
    v13,
    v14,
    CFSTR("owning_query_id"),
    CFSTR("bucket_index"),
    0x1E6D4D858,
    CFSTR("bucket_index"),
    0x1E6D4D878,
    CFSTR("generation_number"),
    0x1E6D43838,
    0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(v9, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__HDSampleAggregateCacheEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v19[3] = &unk_1E6CE8D70;
  v19[4] = v15;
  v19[5] = &v20;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v16, a6, v19);

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v21 + 6));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __69__HDSampleAggregateCacheEntity_pruneWithProfile_nowDate_limit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", *(_QWORD *)(a1 + 32), a3, 0, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "getChangesCount");

  return v6;
}

@end
