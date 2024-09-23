@implementation HDHRAFibBurdenControlServer

- (HDHRAFibBurdenControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 scheduler:(id)a7 notificationManager:(id)a8
{
  id v15;
  id v16;
  HDHRAFibBurdenControlServer *v17;
  HDHRAFibBurdenControlServer *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)HDHRAFibBurdenControlServer;
  v17 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v20, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_scheduler, a7);
    objc_storeStrong((id *)&v18->_notificationManager, a8);
  }

  return v18;
}

- (void)remote_triggerAnalysis
{
  -[HKHRAFibBurdenSevenDayAnalysisScheduling _forceAnalysis](self->_scheduler, "_forceAnalysis");
}

- (void)remote_determineIfAnalysisCanRunWithFeatureStatus:(id)a3 completion:(id)a4
{
  void *v6;
  HKHRAFibBurdenSevenDayAnalysisScheduling *scheduler;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  scheduler = self->_scheduler;
  v8 = a4;
  objc_msgSend(v6, "numberWithBool:", -[HKHRAFibBurdenSevenDayAnalysisScheduling _shouldAllowFeatureStatus:](scheduler, "_shouldAllowFeatureStatus:", a3));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v8, v9, 0);

}

- (void)remote_addTachogramClassificationForSampleUUID:(id)a3 hasAFib:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _BOOL8 v29;
  id v30;
  _BOOL8 v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v6 = a4;
  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0D29578];
  v10 = (void *)MEMORY[0x1E0CB6B50];
  v11 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend(v10, "heartbeatSeriesType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x1E0D29230];
  v38[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v9, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v12, v13, v14, v15, 0, &v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v36;

  if (v16)
  {
    if (v17)
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[HDHRAFibBurdenControlServer remote_addTachogramClassificationForSampleUUID:hasAFib:completion:].cold.1((uint64_t)self, (uint64_t)v17, v18);

    }
    v19 = objc_alloc(MEMORY[0x1E0D2FC08]);
    v20 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v16, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithStartDate:endDate:", v21, v22);
    objc_msgSend(v16, "_timeZone");
    v32 = v17;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v19, "initWithSampleUUID:classification:sampleDateInterval:sampleTimeZone:", v8, v6, v23, v24);

    -[HDStandardTaskServer profile](self, "profile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "database");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v25;
    v35 = 0;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __97__HDHRAFibBurdenControlServer_remote_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke;
    v33[3] = &unk_1E87F0580;
    v28 = v25;
    v29 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDHRSampleClassificationEntity, "performWriteTransactionWithHealthDatabase:error:block:", v27, &v35, v33);
    v30 = v35;

    v31 = v29;
    v17 = v32;
    v11[2](v11, v31, v30);

    v11 = (void (**)(id, _QWORD, id))v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("No sample found for given UUID %@"), v8);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v28);
  }

}

BOOL __97__HDHRAFibBurdenControlServer_remote_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _BOOL8 v4;

  +[HDHRSampleClassificationEntity insertSampleClassification:transaction:error:](HDHRSampleClassificationEntity, "insertSampleClassification:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)remote_queryAllTachogramClassificationsWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = (void (**)(id, void *, id))a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__HDHRAFibBurdenControlServer_remote_queryAllTachogramClassificationsWithCompletion___block_invoke;
  v11[3] = &unk_1E87F05A8;
  v11[4] = &v13;
  v7 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDHRSampleClassificationEntity, "performReadTransactionWithHealthDatabase:error:block:", v6, &v12, v11);
  v8 = v12;

  if (v7)
  {
    v9 = objc_alloc(MEMORY[0x1E0D2FC10]);
    v10 = (void *)objc_msgSend(v9, "initWithClassifications:dayIndex:majorityTimeZone:", v14[5], 0, 0);
  }
  else
  {
    v10 = 0;
  }
  v4[2](v4, v10, v8);
  if (v7)

  _Block_object_dispose(&v13, 8);
}

BOOL __85__HDHRAFibBurdenControlServer_remote_queryAllTachogramClassificationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDHRSampleClassificationEntity allSampleClassificationsWithTransaction:error:](HDHRSampleClassificationEntity, "allSampleClassificationsWithTransaction:error:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (void)remote_queryTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__HDHRAFibBurdenControlServer_remote_queryTachogramClassificationForSampleUUID_completion___block_invoke;
  v14[3] = &unk_1E87F0428;
  v16 = &v18;
  v10 = v6;
  v15 = v10;
  v11 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDHRSampleClassificationEntity, "performReadTransactionWithHealthDatabase:error:block:", v9, &v17, v14);
  v12 = v17;

  if (v11)
    v13 = v19[5];
  else
    v13 = 0;
  v7[2](v7, v13, v12);

  _Block_object_dispose(&v18, 8);
}

BOOL __91__HDHRAFibBurdenControlServer_remote_queryTachogramClassificationForSampleUUID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDHRSampleClassificationEntity sampleClassificationWithSampleUUID:transaction:error:](HDHRSampleClassificationEntity, "sampleClassificationWithSampleUUID:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_deleteAllTachogramClassificationsWithCompletion:(id)a3
{
  void (**v4)(id, _BOOL8, id);
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  id v9;

  v4 = (void (**)(id, _BOOL8, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDHRSampleClassificationEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, &v9, &__block_literal_global_13);
  v8 = v9;

  v4[2](v4, v7, v8);
}

BOOL __86__HDHRAFibBurdenControlServer_remote_deleteAllTachogramClassificationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDHRSampleClassificationEntity deleteAllClassificationsWithTransaction:error:](HDHRSampleClassificationEntity, "deleteAllClassificationsWithTransaction:error:", a2, a3);
}

- (void)remote_deleteTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8, id);
  void *v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _BOOL8, id))a4;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  v15 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__HDHRAFibBurdenControlServer_remote_deleteTachogramClassificationForSampleUUID_completion___block_invoke;
  v13[3] = &unk_1E87F0580;
  v10 = v6;
  v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDHRSampleClassificationEntity, "performWriteTransactionWithHealthDatabase:error:block:", v9, &v15, v13);
  v12 = v15;

  v7[2](v7, v11, v12);
}

BOOL __92__HDHRAFibBurdenControlServer_remote_deleteTachogramClassificationForSampleUUID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDHRSampleClassificationEntity deleteClassificationWithSampleUUID:transaction:error:](HDHRSampleClassificationEntity, "deleteClassificationWithSampleUUID:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)remote_determineMajorityTimeZoneForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5
{
  HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *v8;
  void *v9;
  id v10;
  HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *v28;
  void (**v29)(id, id, id);
  id obj;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29 = (void (**)(id, id, id))a5;
  v8 = [HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB6360]);
  v11 = -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer initWithProfile:calendarCache:](v8, "initWithProfile:calendarCache:", v9, v10);

  v39 = 0;
  v28 = v11;
  -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer determineJulianDayToMajorityTimeZoneForRange:error:](v11, "determineJulianDayToMajorityTimeZoneForRange:error:", a3, a4 - a3 + 1, &v39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v39;
  v34 = v12;
  objc_msgSend(v12, "hk_sortedKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v14, "setTimeStyle:", 0);
  v32 = v14;
  objc_msgSend(v14, "setDateStyle:", 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v34, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "hk_noonWithDayIndex:calendar:", objc_msgSend(v19, "integerValue"), v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v32, "stringFromDate:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "abbreviationForDate:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("Day index: %@, Date: %@, Majority Time Zone: %@ (%@)"), v19, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "addObject:", v26);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v16);
  }

  v29[2](v29, v33, v27);
}

- (void)remote_queryEligibleTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, void *, id);
  id v9;
  HKHRAFibBurdenTachogramClassificationsRetriever *v10;
  void *v11;
  HKHRAFibBurdenTachogramClassificationsRetriever *v12;
  HKHRAFibBurdenTachogramClassifierFactory *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;

  v8 = (void (**)(id, void *, id))a5;
  v9 = objc_alloc_init(MEMORY[0x1E0CB6360]);
  v10 = [HKHRAFibBurdenTachogramClassificationsRetriever alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKHRAFibBurdenTachogramClassificationsRetriever initWithProfile:calendarCache:](v10, "initWithProfile:calendarCache:", v11, v9);

  v13 = objc_alloc_init(HKHRAFibBurdenTachogramClassifierFactory);
  -[HKHRAFibBurdenTachogramClassifierFactory createTachogramClassifier](v13, "createTachogramClassifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  -[HKHRAFibBurdenTachogramClassificationsRetriever tachogramClassificationsDayIndexRange:tachogramClassifier:error:](v12, "tachogramClassificationsDayIndexRange:tachogramClassifier:error:", a3, a4 - a3 + 1, v14, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;

  if (v15)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __101__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke;
    v23 = &unk_1E87F0650;
    v24 = v9;
    objc_msgSend(v15, "hk_map:", &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0D2FC18]);
    v19 = (void *)objc_msgSend(v18, "initWithClassificationCollections:", v17, v20, v21, v22, v23);

  }
  else
  {
    v19 = 0;
  }
  v8[2](v8, v19, v16);

}

id __101__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampleClassification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "sampleDateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "sampleTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendarForTimeZone:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v3, "hk_map:", &__block_literal_global_210);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FC10]), "initWithClassifications:dayIndex:majorityTimeZone:", v13, v12, 0);

  return v14;
}

uint64_t __101__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sampleClassification");
}

- (void)remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  HKHRAFibBurdenTachogramClassificationsRetriever *v8;
  void *v9;
  HKHRAFibBurdenTachogramClassificationsRetriever *v10;
  HKHRAFibBurdenTachogramClassifierFactory *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v6 = (void (**)(id, void *, id))a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB6360]);
  v8 = [HKHRAFibBurdenTachogramClassificationsRetriever alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKHRAFibBurdenTachogramClassificationsRetriever initWithProfile:calendarCache:](v8, "initWithProfile:calendarCache:", v9, v7);

  v11 = objc_alloc_init(HKHRAFibBurdenTachogramClassifierFactory);
  -[HKHRAFibBurdenTachogramClassifierFactory createTachogramClassifier](v11, "createTachogramClassifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  -[HKHRAFibBurdenTachogramClassificationsRetriever tachogramClassificationsForLastSixWeeksOfWeekday:tachogramClassifier:error:](v10, "tachogramClassificationsForLastSixWeeksOfWeekday:tachogramClassifier:error:", a3, v12, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;

  if (v13)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __102__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke;
    v21 = &unk_1E87F0650;
    v22 = v7;
    objc_msgSend(v13, "hk_map:", &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0D2FC18]);
    v17 = (void *)objc_msgSend(v16, "initWithClassificationCollections:", v15, v18, v19, v20, v21);

  }
  else
  {
    v17 = 0;
  }
  v6[2](v6, v17, v14);

}

id __102__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampleClassification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "sampleDateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "sampleTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendarForTimeZone:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v3, "hk_map:", &__block_literal_global_213);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FC10]), "initWithClassifications:dayIndex:majorityTimeZone:", v13, v12, 0);

  return v14;
}

uint64_t __102__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sampleClassification");
}

- (void)remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, id);
  id v7;
  HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *v8;
  void *v9;
  HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *v10;
  HKHRAFibBurdenTachogramClassificationsRetriever *v11;
  void *v12;
  HKHRAFibBurdenTachogramClassificationsRetriever *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  HKHRAFibBurdenTachogramClassifierFactory *v22;
  void *v23;
  void *v24;
  HKHRAFibBurdenTachogramClassifierFactory *v25;
  void *v26;
  void *v27;
  HKHRAFibBurdenTachogramClassificationsRetriever *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;

  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB6360]);
  v8 = [HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer initWithProfile:calendarCache:](v8, "initWithProfile:calendarCache:", v9, v7);

  v11 = [HKHRAFibBurdenTachogramClassificationsRetriever alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKHRAFibBurdenTachogramClassificationsRetriever initWithProfile:calendarCache:](v11, "initWithProfile:calendarCache:", v12, v7);

  objc_msgSend(v7, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startOfDayForDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "hk_dayIndexWithCalendar:", v17);

  v33 = 0;
  -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer determineJulianDayToMajorityTimeZoneForRange:error:](v10, "determineJulianDayToMajorityTimeZoneForRange:error:", v18 - 42, 42, &v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v33;
  if (v20)
  {
    v21 = v20;
    v6[2](v6, 0, v20);
  }
  else
  {
    v22 = objc_alloc_init(HKHRAFibBurdenTachogramClassifierFactory);
    -[HKHRAFibBurdenTachogramClassifierFactory createTachogramClassifier](v22, "createTachogramClassifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    -[HKHRAFibBurdenTachogramClassificationsRetriever tachogramClassificationsForLastSixWeeksOfHoursFrom:to:julianDayToMajorityTimeZone:tachogramClassifier:error:](v13, "tachogramClassificationsForLastSixWeeksOfHoursFrom:to:julianDayToMajorityTimeZone:tachogramClassifier:error:", 4 * a3, 4 * a3 + 4, v19, v23, &v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v32;

    if (v24)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __110__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke;
      v29[3] = &unk_1E87F06B8;
      v30 = v7;
      v31 = v19;
      objc_msgSend(v24, "hk_map:", v29);
      v28 = v13;
      v25 = v22;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FC18]), "initWithClassificationCollections:", v26);

      v22 = v25;
      v13 = v28;

    }
    else
    {
      v27 = 0;
    }
    ((void (**)(id, void *, id))v6)[2](v6, v27, v21);

  }
}

id __110__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampleClassification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "sampleDateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "sampleTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendarForTimeZone:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "abbreviation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  objc_msgSend(v3, "hk_map:", &__block_literal_global_214);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FC10]), "initWithClassifications:dayIndex:majorityTimeZone:", v15, v12, v14);

  return v16;
}

uint64_t __110__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sampleClassification");
}

- (void)remote_addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(id)a5 chanceOfWrite:(id)a6 minutesBetweenSamples:(id)a7 startingHour:(id)a8 endingHour:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD, void *);
  void *v21;
  const __CFString *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  id v31;

  v31 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = (void (**)(id, _QWORD, void *))a10;
  if (a4 < a3)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = CFSTR("End day index must be greater than or equal to start day index");
    goto LABEL_25;
  }
  if (!v31)
  {
    v24 = 0.5;
    if (v16)
      goto LABEL_7;
LABEL_14:
    v26 = 1.0;
    if (v17)
      goto LABEL_10;
    goto LABEL_15;
  }
  objc_msgSend(v31, "doubleValue");
  if (v23 < 0.0 || (v24 = v23, v23 > 1.0))
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = CFSTR("Chance of AFib must be between 0 and 1");
    goto LABEL_25;
  }
  if (!v16)
    goto LABEL_14;
LABEL_7:
  objc_msgSend(v16, "doubleValue");
  if (v25 < 0.0 || (v26 = v25, v25 > 1.0))
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = CFSTR("Chance of write must be between 0 and 1");
    goto LABEL_25;
  }
  if (v17)
  {
LABEL_10:
    v27 = objc_msgSend(v17, "integerValue");
    if (v18)
      goto LABEL_11;
    goto LABEL_16;
  }
LABEL_15:
  v27 = 15;
  if (v18)
  {
LABEL_11:
    v28 = objc_msgSend(v18, "integerValue");
    if (v28 >= 0x19)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = CFSTR("Starting hour must be between 0 and 24");
      goto LABEL_25;
    }
    goto LABEL_17;
  }
LABEL_16:
  v28 = 0;
LABEL_17:
  if (v19)
  {
    v29 = objc_msgSend(v19, "integerValue");
    if (v29 >= 0x18)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = CFSTR("Ending hour must be between 0 and 24");
      goto LABEL_25;
    }
  }
  else
  {
    v29 = 23;
  }
  if (v29 >= v28)
  {
    -[HDHRAFibBurdenControlServer _addTachogramsForStartDayIndex:endDayIndex:chanceOfAFib:chanceOfWrite:minutesBetweenSamples:startingHour:endingHour:completion:](self, "_addTachogramsForStartDayIndex:endDayIndex:chanceOfAFib:chanceOfWrite:minutesBetweenSamples:startingHour:endingHour:completion:", a3, a4, v27, v28, v24, v26);
    goto LABEL_26;
  }
  v21 = (void *)MEMORY[0x1E0CB35C8];
  v22 = CFSTR("Ending hour must be on or after starting hour");
LABEL_25:
  objc_msgSend(v21, "hk_error:description:", 3, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, 0, v30);

LABEL_26:
}

- (void)_addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(double)a5 chanceOfWrite:(double)a6 minutesBetweenSamples:(int64_t)a7 startingHour:(int64_t)a8 endingHour:(int64_t)a9 completion:(id)a10
{
  void (**v18)(id, uint64_t, id);
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[12];
  id v25;

  v18 = (void (**)(id, uint64_t, id))a10;
  -[HDStandardTaskServer profile](self, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29498], "contextForWritingProtectedData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __158__HDHRAFibBurdenControlServer__addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke;
  v24[3] = &unk_1E87F06E0;
  v24[6] = a4;
  v24[7] = a8;
  v24[8] = a7;
  *(double *)&v24[9] = a6;
  *(double *)&v24[10] = a5;
  v24[4] = self;
  v24[5] = a3;
  v24[11] = a9;
  v22 = objc_msgSend(v20, "performTransactionWithContext:error:block:inaccessibilityHandler:", v21, &v25, v24, 0);
  v23 = v25;

  v18[2](v18, v22, v23);
}

uint64_t __158__HDHRAFibBurdenControlServer__addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_alloc_init(MEMORY[0x1E0CB6360]);
  v7 = *MEMORY[0x1E0CB7240];
  v34[0] = *MEMORY[0x1E0CB72C0];
  v34[1] = v7;
  v35[0] = &unk_1E87FF7E8;
  v35[1] = &unk_1E87FF800;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 <= *(_QWORD *)(a1 + 48))
  {
    v25 = a3;
    v26 = v6;
    v27 = v5;
    v10 = 0;
    while (2)
    {
      v28 = v9;
      objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithDayIndex:calendar:", v9, v8, v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHour:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v8, "dateFromComponents:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v12;
      do
      {
        objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 64, *(_QWORD *)(a1 + 64), v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (arc4random_uniform(0x64u) >= (uint64_t)(*(double *)(a1 + 72) * 100.0))
        {
          v15 = v13;
        }
        else
        {
          if (arc4random_uniform(0x64u) >= (uint64_t)(*(double *)(a1 + 80) * 100.0))
            objc_msgSend(MEMORY[0x1E0CB67C0], "_nonAFibSeriesSampleWithStartDate:device:metadata:", v13, v29, v30);
          else
            objc_msgSend(MEMORY[0x1E0CB67C0], "_aFibSeriesSampleWithStartDate:device:metadata:", v13, v29, v30);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "profile");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dataManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v10;
          v19 = objc_msgSend(v17, "insertDataObjects:error:", v18, &v32);
          v20 = v32;
          v21 = v10;
          v10 = v20;

          if ((v19 & 1) == 0)
          {
            v23 = v10;
            v10 = v23;
            if (v23)
            {
              if (v25)
                *v25 = objc_retainAutorelease(v23);
              else
                _HKLogDroppedError();
            }

            v11 = 0;
            goto LABEL_21;
          }

          v12 = v31;
        }

        v22 = objc_msgSend(v8, "component:fromDate:", 16, v14);
        if (v22 != objc_msgSend(v12, "day"))
          break;
        v13 = v14;
      }
      while (objc_msgSend(v8, "component:fromDate:", 32, v14) <= *(_QWORD *)(a1 + 88));

      v9 = v28 + 1;
      if (v28 < *(_QWORD *)(a1 + 48))
        continue;
      break;
    }
    v11 = 1;
LABEL_21:
    v6 = v26;
    v5 = v27;
  }
  else
  {
    v10 = 0;
    v11 = 1;
  }

  return v11;
}

- (void)remote_performAnalysisForWeekContainingDayIndex:(int64_t)a3 completion:(id)a4
{
  objc_class *v6;
  void (**v7)(id, void *, id);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HKHRAFibBurdenSevenDayAnalysisManager *v12;
  void *v13;
  HKHRStubbedAFibBurdenSevenDayAnalysisModeDeterminer *v14;
  void *v15;
  HKHRStubbedAFibBurdenSevenDayAnalysisModeDeterminer *v16;
  HKHRAFibBurdenAnalyzer *v17;
  void *v18;
  HKHRAFibBurdenAnalyzer *v19;
  id v20;
  HKHRAFibBurdenSevenDayAnalysisManager *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = (objc_class *)MEMORY[0x1E0CB6360];
  v7 = (void (**)(id, void *, id))a4;
  v8 = objc_alloc_init(v6);
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v8, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_dateOnDayIndex:atHour:calendar:", a3 + 7, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [HKHRAFibBurdenSevenDayAnalysisManager alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [HKHRStubbedAFibBurdenSevenDayAnalysisModeDeterminer alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer initWithProfile:calendarCache:](v14, "initWithProfile:calendarCache:", v15, v8);
  v17 = [HKHRAFibBurdenAnalyzer alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKHRAFibBurdenAnalyzer initWithProfile:](v17, "initWithProfile:", v18);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __90__HDHRAFibBurdenControlServer_remote_performAnalysisForWeekContainingDayIndex_completion___block_invoke;
  v28[3] = &unk_1E87F0708;
  v29 = v11;
  v20 = v11;
  v21 = -[HKHRAFibBurdenSevenDayAnalysisManager initWithProfile:modeDeterminer:analyzer:calendarCache:dateGenerator:](v12, "initWithProfile:modeDeterminer:analyzer:calendarCache:dateGenerator:", v13, v16, v19, v8, v28);

  v22 = objc_alloc(MEMORY[0x1E0CB6728]);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6718]), "initWithOnboardingState:onboardingCompletion:featureSettings:", 1, 0, 0);
  v24 = (void *)objc_msgSend(v22, "initWithOnboardingRecord:requirementsEvaluationByContext:", v23, MEMORY[0x1E0C9AA70]);

  v27 = 0;
  -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:](v21, "analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:", v24, 0, 0, &v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v27;
  v7[2](v7, v25, v26);

}

id __90__HDHRAFibBurdenControlServer_remote_performAnalysisForWeekContainingDayIndex_completion___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)remote_injectBurdenValues:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  HDHRAFibBurdenControlServer *v43;
  id v44;
  void *v45;
  id obj;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v43 = self;
  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v44 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v6;
  v8 = HKHRAFibBurdenPreviousWeekDayIndexRange();
  v10 = v9;

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v45 = v5;
  objc_msgSend(v5, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v54;
    v47 = *MEMORY[0x1E0CB5A78];
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v54 != v49)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v13, "burdenPercentage", v43);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v8, 0, v48);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v8 + v10, 0, v48);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "burdenPercentage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "integerValue");

          v19 = 100;
          if (v18 < 100)
            v19 = v18;
          if (v19 <= 2)
            v20 = 2;
          else
            v20 = v19;
          v21 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "quantityWithUnit:doubleValue:", v22, (double)v20 / 100.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "timeZone");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped();
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (void *)MEMORY[0x1E0CB6A40];
          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v47);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
          v28 = v11;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v27, v23, v15, v16, v29, v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v28;
          objc_msgSend(v28, "addObject:", v30);

        }
        v8 -= 7;
        v10 = 7;
      }
      v10 = 7;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v50);
  }

  -[HDStandardTaskServer profile](v43, "profile");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "deviceManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  objc_msgSend(v32, "currentDeviceEntityWithError:", &v52);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v52;

  if (v33)
  {
    -[HDStandardTaskServer profile](v43, "profile");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dataProvenanceManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "defaultLocalDataProvenanceWithDeviceEntity:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDStandardTaskServer profile](v43, "profile");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dataManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v34;
    v40 = objc_msgSend(v39, "insertDataObjects:withProvenance:creationDate:error:", v11, v37, &v51, CFAbsoluteTimeGetCurrent());
    v41 = v51;

    v42 = v44;
    (*((void (**)(id, uint64_t, id))v44 + 2))(v44, v40, v41);

    v34 = v41;
  }
  else
  {
    v42 = v44;
    (*((void (**)(id, _QWORD, id))v44 + 2))(v44, 0, v34);
  }

}

- (void)remote_sendNotificationWithMode:(id)a3 completion:(id)a4
{
  -[HDHRAFibBurdenNotificationManaging _sendNotificationWithMode:completion:](self->_notificationManager, "_sendNotificationWithMode:completion:", a3, a4);
}

- (void)remote_fetchSevenDayAnalysisBreadcrumbsWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *v5;
  void *v6;
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void (**)(id, void *, id))a3;
  v5 = [HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager initWithProfile:](v5, "initWithProfile:", v6);

  v10 = 0;
  -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager fetchBreadcrumbsWithError:](v7, "fetchBreadcrumbsWithError:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  v4[2](v4, v8, v9);

}

- (id)_clientRemoteObjectProxy
{
  void *v2;
  void *v3;
  void *v4;

  -[HDStandardTaskServer client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HDHRAFibBurdenNotificationManager *v20;
  HDHRAFibBurdenNotificationManager *v21;
  HDHRAFibBurdenNotificationManager *v22;
  HDHRAFibBurdenControlServer *v23;
  HDHRAFibBurdenNotificationManager *v24;
  void *v25;
  HDHRAFibBurdenControlServer *v26;
  void *v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", *MEMORY[0x1E0D2FB48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("No profile extension found for %@"), objc_opt_class());
    v21 = (HDHRAFibBurdenNotificationManager *)(id)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      if (a7)
      {
        v22 = objc_retainAutorelease(v21);
        v23 = 0;
        *a7 = v22;
        v20 = v22;
        goto LABEL_11;
      }
      _HKLogDroppedError();
    }
    v23 = 0;
    v20 = v22;
    goto LABEL_11;
  }
  objc_msgSend(v16, "aFibBurdenComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "notificationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    v24 = [HDHRAFibBurdenNotificationManager alloc];
    objc_msgSend(v13, "profile");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDHRAFibBurdenNotificationManager initWithProfile:](v24, "initWithProfile:", v25);

  }
  v26 = [HDHRAFibBurdenControlServer alloc];
  objc_msgSend(v16, "aFibBurdenComponents");
  v22 = (HDHRAFibBurdenNotificationManager *)objc_claimAutoreleasedReturnValue();
  -[HDHRAFibBurdenNotificationManager sevenDayAnalysisScheduler](v22, "sevenDayAnalysisScheduler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HDHRAFibBurdenControlServer initWithUUID:configuration:client:delegate:scheduler:notificationManager:](v26, "initWithUUID:configuration:client:delegate:scheduler:notificationManager:", v11, v12, v13, v14, v27, v20);

LABEL_11:
  return v23;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0D2FA50];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

- (void)remote_addTachogramClassificationForSampleUUID:(uint64_t)a1 hasAFib:(uint64_t)a2 completion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "[%@] Error while inserting tachogram classification: %@", (uint8_t *)&v3, 0x16u);
}

@end
