@implementation HDHeadphoneAudioExposureStatisticsEntity

+ (id)databaseTable
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_headphone_audio_exposure_statistics"), CFSTR("hearing"));
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $24F0BDD9EAFDCAB4A41B293A8FAF9B4C *)columnDefinitionsWithCount__columnDefinitions;
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
  void *v10;
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE40E38]);
  v3 = objc_opt_class();
  v13 = CFSTR("start_date");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("start"), v4);
  v14[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE40E38]);
  v7 = objc_opt_class();
  v12 = CFSTR("end_date");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithEntity:name:columns:", v7, CFSTR("end"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)insertBucket:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _AllProperties();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __75__HDHeadphoneAudioExposureStatisticsEntity_insertBucket_transaction_error___block_invoke;
  v19[3] = &unk_24DC5F270;
  v12 = v8;
  v20 = v12;
  v21 = &v22;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v10, v11, a5, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)v23[5];
  v15 = v14;
  v16 = v13;
  if (v14)
  {
    if (a5)
    {
      v16 = 0;
      *a5 = objc_retainAutorelease(v14);
    }
    else
    {
      _HKLogDroppedError();
      v16 = 0;
    }
  }

  v17 = v16;
  _Block_object_dispose(&v22, 8);

  return v17;
}

void __75__HDHeadphoneAudioExposureStatisticsEntity_insertBucket_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x220738FA4](a2, CFSTR("start_date"), v5);

  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x220738FA4](a2, CFSTR("end_date"), v7);

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v8, "archivedRepresentationWithError:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  MEMORY[0x220738F98](a2, CFSTR("archived_statistics"), v10);

}

+ (BOOL)insertBuckets:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(a1, "insertBucket:transaction:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v9, a5, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

+ (id)_pruneWithNowDate:(id)a3 limit:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v10 = a3;
  v11 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__HDHeadphoneAudioExposureStatisticsEntity__pruneWithNowDate_limit_profile_error___block_invoke;
  v17[3] = &unk_24DC5F2C0;
  v13 = v10;
  v18 = v13;
  v21 = a1;
  v14 = v11;
  v22 = a4;
  v19 = v14;
  v20 = &v23;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v17);

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v24[3]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

uint64_t __82__HDHeadphoneAudioExposureStatisticsEntity__pruneWithNowDate_limit_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v5 = a2;
  HDSampleEntityPredicateForEndDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v9 = objc_msgSend(v7, "countOfObjectsWithPredicate:healthDatabase:error:", v6, v8, &v27);
  v10 = v27;

  v11 = v10;
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
    v17 = v11;
  }
  else
  {
    if (v9 < 2)
    {
      v12 = 1;
      goto LABEL_10;
    }
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v14, "_sortOrderingTerms");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v13, v6, v15, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __82__HDHeadphoneAudioExposureStatisticsEntity__pruneWithNowDate_limit_profile_error___block_invoke_2;
    v22[3] = &unk_24DC5F298;
    v18 = *(_QWORD *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 56);
    v25 = v9;
    v26 = v19;
    v23 = v13;
    v24 = v18;
    v20 = v13;
    v12 = objc_msgSend(v17, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", 0, a3, v22);

  }
LABEL_10:

  return v12;
}

uint64_t __82__HDHeadphoneAudioExposureStatisticsEntity__pruneWithNowDate_limit_profile_error___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  uint64_t v8;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 1 >= a1[6])
    return 1;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPersistentID:", a2);
  v8 = objc_msgSend(v7, "deleteFromDatabase:error:", a1[4], a5);
  if ((_DWORD)v8)
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);

  return v8;
}

+ (id)_loadBucketsFromProfile:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = (objc_class *)MEMORY[0x24BDBCEB8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__HDHeadphoneAudioExposureStatisticsEntity__loadBucketsFromProfile_error___block_invoke;
  v12[3] = &unk_24DC5F0F8;
  v9 = v8;
  v13 = v9;
  LODWORD(a1) = objc_msgSend(a1, "_enumerateBucketsForProfile:predicate:error:enumerationHandler:", v7, 0, a4, v12);

  v10 = 0;
  if ((_DWORD)a1)
    v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

uint64_t __74__HDHeadphoneAudioExposureStatisticsEntity__loadBucketsFromProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (BOOL)_replaceExistingWithBuckets:(id)a3 profile:(id)a4 error:(id *)a5
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
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__HDHeadphoneAudioExposureStatisticsEntity__replaceExistingWithBuckets_profile_error___block_invoke;
  v12[3] = &unk_24DC5F2E8;
  v13 = v8;
  v14 = a1;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v12);

  return (char)a5;
}

uint64_t __86__HDHeadphoneAudioExposureStatisticsEntity__replaceExistingWithBuckets_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "deleteEntitiesInDatabase:predicate:error:", v6, 0, a3))
    v7 = objc_msgSend(*(id *)(a1 + 40), "insertBuckets:transaction:error:", *(_QWORD *)(a1 + 32), v5, a3);
  else
    v7 = 0;

  return v7;
}

- (id)_bucketWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__HDHeadphoneAudioExposureStatisticsEntity__bucketWithProfile_error___block_invoke;
  v13[3] = &unk_24DC5F338;
  v13[4] = self;
  v15 = &v16;
  v9 = v6;
  v14 = v9;
  LODWORD(a4) = objc_msgSend(v7, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v13);

  if ((_DWORD)a4)
    v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

BOOL __69__HDHeadphoneAudioExposureStatisticsEntity__bucketWithProfile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  __int128 v14;
  _QWORD v15[5];
  __int128 v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v6 = *(void **)(a1 + 32);
  _AllProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__HDHeadphoneAudioExposureStatisticsEntity__bucketWithProfile_error___block_invoke_2;
  v15[3] = &unk_24DC5F310;
  v15[4] = *(_QWORD *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 40);
  v9 = (id)v14;
  v16 = v14;
  v17 = &v18;
  LOBYTE(a1) = objc_msgSend(v6, "getValuesForProperties:database:error:handler:", v7, v8, a3, v15);

  if ((a1 & 1) != 0)
  {
    v10 = (id)v19[5];
    v11 = v10;
    v12 = v10 == 0;
    if (v10)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __69__HDHeadphoneAudioExposureStatisticsEntity__bucketWithProfile_error___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v5 = (void *)objc_opt_class();
  v6 = a1[5];
  v7 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "_bucketFromAllPropertiesRow:profile:error:", a3, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

+ (id)_sortOrderingTerms
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE40E40], "orderingTermWithProperty:entityClass:ascending:", CFSTR("end_date"), a1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BE40E40], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), a1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_bucketFromAllPropertiesRow:(HDSQLiteRow *)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v21;
  void *v22;

  v8 = a4;
  HDSQLiteColumnWithNameAsDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsData();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDHeadphoneAudioExposureStatisticsBucket bucketForArchivedRepresentation:profile:error:](HDHeadphoneAudioExposureStatisticsBucket, "bucketForArchivedRepresentation:profile:error:", v11, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToDate:", v9);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHeadphoneAudioExposureStatisticsEntity.m"), 221, CFSTR("Statistics bucket's startDate did not match the entity's start_date."));

    }
    objc_msgSend(v12, "dateInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToDate:", v10);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHeadphoneAudioExposureStatisticsEntity.m"), 224, CFSTR("Statistics bucket's endDate did not match the entity's end_date."));

    }
    v19 = v12;
  }

  return v12;
}

+ (BOOL)_enumerateBucketsForProfile:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __107__HDHeadphoneAudioExposureStatisticsEntity__enumerateBucketsForProfile_predicate_error_enumerationHandler___block_invoke;
  v18[3] = &unk_24DC5F388;
  v19 = v11;
  v20 = v10;
  v21 = v12;
  v22 = a1;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  LOBYTE(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v13, a5, v18);

  return (char)a5;
}

uint64_t __107__HDHeadphoneAudioExposureStatisticsEntity__enumerateBucketsForProfile_predicate_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v5 = *(void **)(a1 + 56);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "_sortOrderingTerms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v6, v7, 0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _AllProperties();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __107__HDHeadphoneAudioExposureStatisticsEntity__enumerateBucketsForProfile_predicate_error_enumerationHandler___block_invoke_2;
  v13[3] = &unk_24DC5F360;
  v16 = *(_QWORD *)(a1 + 56);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v11 = objc_msgSend(v9, "enumerateProperties:error:enumerationHandler:", v10, a3, v13);

  return v11;
}

uint64_t __107__HDHeadphoneAudioExposureStatisticsEntity__enumerateBucketsForProfile_predicate_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 48), "_bucketFromAllPropertiesRow:profile:error:", a3, *(_QWORD *)(a1 + 32), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v6 = 0;

  return v6;
}

@end
