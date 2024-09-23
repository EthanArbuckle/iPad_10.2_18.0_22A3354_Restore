@implementation HDHRSampleClassificationEntity

+ (id)sampleClassificationWithSampleUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke_2;
  v17[3] = &unk_1E87EF520;
  v12 = v8;
  v18 = v12;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke_3;
  v16[3] = &unk_1E87EF548;
  v16[4] = &v20;
  LODWORD(a5) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &sampleClassificationWithSampleUUID_transaction_error__lookupKey, a5, v19, v17, v16);

  if ((_DWORD)a5)
    v13 = (void *)v21[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v20, 8);
  return v14;
}

id __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("sample_uuid"), CFSTR("classification"), CFSTR("sample_start_date"), CFSTR("sample_duration"), CFSTR("sample_time_zone"), v1, CFSTR("sample_uuid"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend(*(id *)(a1 + 32), "getUUIDBytes:", v4);
  return sqlite3_bind_blob(a2, 1, v4, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __87__HDHRSampleClassificationEntity_sampleClassificationWithSampleUUID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  _SampleClassificationFromRow(a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 0;
}

+ (id)allSampleClassificationsWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v6, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  HDHRSampleClassificationEntityPropertiesForModel();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HDHRSampleClassificationEntity_allSampleClassificationsWithTransaction_error___block_invoke;
  v14[3] = &unk_1E87EF570;
  v15 = v8;
  v16 = a1;
  v10 = v8;
  LODWORD(a4) = objc_msgSend(v7, "enumerateProperties:error:enumerationHandler:", v9, a4, v14);

  if ((_DWORD)a4)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

uint64_t __80__HDHRSampleClassificationEntity_allSampleClassificationsWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  _SampleClassificationFromRow(a3, (uint64_t)&v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      __80__HDHRSampleClassificationEntity_allSampleClassificationsWithTransaction_error___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

  return 1;
}

+ (id)insertSampleClassification:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "sampleUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "classification");
  objc_msgSend(v9, "sampleDateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sampleDateInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "duration");
  v16 = v15;
  objc_msgSend(v9, "sampleTimeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_insertEntityWithSampleUUID:classification:sampleStartDate:sampleDuration:sampleTimeZone:transaction:error:", v10, v11, v13, v17, v8, a5, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)deleteAllClassificationsWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "truePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v8, "deleteAllEntitiesWithError:", a4);
  return (char)a4;
}

+ (BOOL)deleteClassificationWithSampleUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:value:comparisonType:", CFSTR("sample_uuid"), a3, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v12, "deleteAllEntitiesWithError:", a5);
  return (char)a5;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, void *, uint64_t);
  void *v24;
  id v25;
  uint64_t *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_dateBySubtractingDays:fromDate:", 44, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D29838];
  _HDSQLiteValueForDate();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithProperty:value:comparisonType:", CFSTR("sample_start_date"), v15, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_msgSend(v10, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __71__HDHRSampleClassificationEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v24 = &unk_1E87EF598;
  v27 = a1;
  v18 = v16;
  v28 = a5;
  v25 = v18;
  v26 = &v29;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v17, a6, &v21);

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v30 + 6), v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(&v29, 8);
  return v19;
}

uint64_t __71__HDHRSampleClassificationEntity_pruneWithProfile_nowDate_limit_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "databaseForEntityClass:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v6, "setEntityClass:", objc_opt_class());
  objc_msgSend(v6, "setPredicate:", a1[4]);
  objc_msgSend(v6, "setLimitCount:", a1[7]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v5, v6);
  v8 = objc_msgSend(v7, "deleteAllEntitiesWithError:", a3);
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v5, "getChangesCount");

  return v8;
}

+ (id)databaseTable
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_sample_classifications"), CFSTR("heart"));
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $24F0BDD9EAFDCAB4A41B293A8FAF9B4C *)columnDefinitionsWithCount__columnDefinitions;
}

+ (id)foreignKeys
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("sample_uuid");
  v2 = objc_alloc(MEMORY[0x1E0D29858]);
  v3 = (void *)objc_msgSend(v2, "initWithEntityClass:property:deletionAction:", objc_opt_class(), *MEMORY[0x1E0D29260], 2);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)_insertEntityWithSampleUUID:(id)a3 classification:(int64_t)a4 sampleStartDate:(id)a5 sampleDuration:(double)a6 sampleTimeZone:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  int64_t v30;
  double v31;

  v16 = a3;
  v17 = a5;
  v18 = a7;
  objc_msgSend(a8, "databaseForEntityClass:", a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HDHRSampleClassificationEntityPropertiesForModel();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __141__HDHRSampleClassificationEntity__insertEntityWithSampleUUID_classification_sampleStartDate_sampleDuration_sampleTimeZone_transaction_error___block_invoke;
  v26[3] = &unk_1E87EF650;
  v27 = v16;
  v28 = v17;
  v31 = a6;
  v29 = v18;
  v30 = a4;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v19, v20, a9, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __141__HDHRSampleClassificationEntity__insertEntityWithSampleUUID_classification_sampleStartDate_sampleDuration_sampleTimeZone_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  MEMORY[0x1D17A84EC](a2, CFSTR("sample_uuid"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1D17A84D4](a2, CFSTR("classification"), *(_QWORD *)(a1 + 56));
  MEMORY[0x1D17A84BC](a2, CFSTR("sample_start_date"), *(_QWORD *)(a1 + 40));
  MEMORY[0x1D17A84C8](a2, CFSTR("sample_duration"), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1D17A84E0](a2, CFSTR("sample_time_zone"), v4);

}

void __80__HDHRSampleClassificationEntity_allSampleClassificationsWithTransaction_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpectedly unable to load sample classification: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
