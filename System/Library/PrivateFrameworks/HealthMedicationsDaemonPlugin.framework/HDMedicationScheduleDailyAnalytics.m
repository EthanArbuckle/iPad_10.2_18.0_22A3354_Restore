@implementation HDMedicationScheduleDailyAnalytics

- (HDMedicationScheduleDailyAnalytics)initWithProfile:(id)a3
{
  id v4;
  HDMedicationScheduleDailyAnalytics *v5;
  HDMedicationScheduleDailyAnalytics *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMedicationScheduleDailyAnalytics;
  v5 = -[HDMedicationScheduleDailyAnalytics init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDMedicationScheduleDailyAnalytics _makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:](self, "_makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_addEntriesFromNonNilDictionary:", v7);

  return v5;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDMedicationScheduleDailyAnalytics _makeMedicationCountPayloadForSchedulesWithProfile:](self, "_makeMedicationCountPayloadForSchedulesWithProfile:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_addEntriesFromNonNilDictionary:", v7);

  v8 = objc_loadWeakRetained((id *)&self->_profile);
  -[HDMedicationScheduleDailyAnalytics _makeMedicationPayloadForNewScheduleTypesWithProfile:](self, "_makeMedicationPayloadForNewScheduleTypesWithProfile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_addEntriesFromNonNilDictionary:", v9);

  return v5;
}

- (id)_makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "_medicationCountForUnavailableSchedulesWithProfile:error:", v4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "integerValue") > 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("hasUnavailableMedSchedules"));
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HDMedicationScheduleDailyAnalytics _makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:].cold.1();
  }

  objc_msgSend(v5, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    v10 = v5;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)_makeMedicationCountPayloadForSchedulesWithProfile:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "_medicationCountForSchedulesWithProfile:error:", v3, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "integerValue") > 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("hasMedsScheduled"));

    HDMedicationDailyAnalyticsBucketForCount(v5);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("numberOfMedsScheduled"));
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HDMedicationScheduleDailyAnalytics _makeMedicationCountPayloadForSchedulesWithProfile:].cold.2();
  }

  v16 = v6;
  objc_msgSend((id)objc_opt_class(), "_medicationCountForUnavailableSchedulesWithProfile:error:", v3, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (v9)
  {
    HDMedicationDailyAnalyticsBucketForCount(v9);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("numberOfUnavailableMedSchedules"));
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HDMedicationScheduleDailyAnalytics _makeMedicationCountPayloadForSchedulesWithProfile:].cold.1();
  }

  objc_msgSend(v4, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
    v13 = v4;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (id)_makeMedicationPayloadForNewScheduleTypesWithProfile:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  NSObject *v15;
  double v16;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v47 = 0;
  +[HDMedicationScheduleDailyAnalytics _allActiveMedicationSchedulesWithProfile:error:](HDMedicationScheduleDailyAnalytics, "_allActiveMedicationSchedulesWithProfile:error:", v5, &v47);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v47;
  if (v7)
  {
    v9 = -[HDMedicationScheduleDailyAnalytics _countOfSchedulesInList:matchingScheduleType:](self, "_countOfSchedulesInList:matchingScheduleType:", v7, 2);
    v44 = v8;
    v10 = -[HDMedicationScheduleDailyAnalytics _countOfSchedulesInList:matchingScheduleType:](self, "_countOfSchedulesInList:matchingScheduleType:", v7, 7);
    v11 = -[HDMedicationScheduleDailyAnalytics _countOfSchedulesInList:matchingScheduleType:](self, "_countOfSchedulesInList:matchingScheduleType:", v7, 8);
    v12 = -[HDMedicationScheduleDailyAnalytics _countOfSchedulesInList:matchingScheduleType:](self, "_countOfSchedulesInList:matchingScheduleType:", v7, 3);
    v39 = -[HDMedicationScheduleDailyAnalytics _countOfSchedulesInList:matchingScheduleType:](self, "_countOfSchedulesInList:matchingScheduleType:", v7, 1);
    v40 = -[HDMedicationScheduleDailyAnalytics _countOfSchedulesInList:matchingScheduleType:](self, "_countOfSchedulesInList:matchingScheduleType:", v7, 4);
    v41 = -[HDMedicationScheduleDailyAnalytics _countOfSchedulesInList:matchingScheduleType:](self, "_countOfSchedulesInList:matchingScheduleType:", v7, 5);
    objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", &__block_literal_global_16);
    v43 = (int)v13;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __91__HDMedicationScheduleDailyAnalytics__makeMedicationPayloadForNewScheduleTypesWithProfile___block_invoke_2;
    v45[3] = &unk_1E6E016A0;
    v46 = v14;
    v15 = v14;
    objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", v45);
    v42 = (int)v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("numMedsWithEveryDaySchedule"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v11 + v10));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("numMedsWithCyclicalSchedule"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("numMedsWithDailyCyclicalSchedule"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("numMedsWithWeeklyCyclicalSchedule"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("numMedsWithDayOfWeekSchedule"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("numMedsWithEveryFewDaysSchedule"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("numMedsWithAsNeededSchedule"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("numMedsWithDifferentDosesDayOfWeekSchedule"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("numMedsWithScheduledEndDate"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("numMedsWithScheduleEnded"));

    v8 = v44;
    v37 = v6;

  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[HDMedicationScheduleDailyAnalytics _makeMedicationPayloadForNewScheduleTypesWithProfile:].cold.1();
    v37 = 0;
  }

  return v37;
}

double __91__HDMedicationScheduleDailyAnalytics__makeMedicationPayloadForNewScheduleTypesWithProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;

  objc_msgSend(a2, "endDateTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 1.0;
  else
    v3 = 0.0;

  return v3;
}

double __91__HDMedicationScheduleDailyAnalytics__makeMedicationPayloadForNewScheduleTypesWithProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;

  v3 = a2;
  objc_msgSend(v3, "endDateTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "endDateTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (double)objc_msgSend(v5, "hk_isBeforeDate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (int)_countOfSchedulesInList:(id)a3 matchingScheduleType:(int64_t)a4
{
  double v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__HDMedicationScheduleDailyAnalytics__countOfSchedulesInList_matchingScheduleType___block_invoke;
  v6[3] = &__block_descriptor_40_e30_d16__0__HKMedicationSchedule_8l;
  v6[4] = a4;
  objc_msgSend(a3, "hk_sumUsingEvaluationBlock:", v6);
  return (int)v4;
}

double __83__HDMedicationScheduleDailyAnalytics__countOfSchedulesInList_matchingScheduleType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a2, "scheduleType");
  result = 0.0;
  if (v3 == *(_QWORD *)(a1 + 32))
    return 1.0;
  return result;
}

- (id)_makeMedicationPayloadForConfigurationsWithProfile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "seahorse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hasPregnancyModeEnabled"));

  return v3;
}

+ (id)_medicationCountForSchedulesWithProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  objc_msgSend(v5, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__HDMedicationScheduleDailyAnalytics__medicationCountForSchedulesWithProfile_error___block_invoke;
  v11[3] = &unk_1E6E016E8;
  v11[4] = &v12;
  v11[5] = v6;
  LODWORD(a4) = objc_msgSend(v6, "performReadTransactionWithHealthDatabase:error:block:", v7, a4, v11);

  if ((_DWORD)a4)
    v8 = (void *)v13[5];
  else
    v8 = 0;
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

BOOL __84__HDMedicationScheduleDailyAnalytics__medicationCountForSchedulesWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;

  v5 = (void *)MEMORY[0x1E0D29838];
  v6 = a2;
  objc_msgSend(v5, "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v6, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "countDistinctForProperty:predicate:database:error:", CFSTR("medication_uuid"), v7, v9, a3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
  return v13;
}

+ (id)_medicationCountForUnavailableSchedulesWithProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  objc_msgSend(v5, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__HDMedicationScheduleDailyAnalytics__medicationCountForUnavailableSchedulesWithProfile_error___block_invoke;
  v11[3] = &unk_1E6E016E8;
  v11[4] = &v12;
  v11[5] = v6;
  LODWORD(a4) = objc_msgSend(v6, "performReadTransactionWithHealthDatabase:error:block:", v7, a4, v11);

  if ((_DWORD)a4)
    v8 = (void *)v13[5];
  else
    v8 = 0;
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

BOOL __95__HDMedicationScheduleDailyAnalytics__medicationCountForUnavailableSchedulesWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;

  v5 = (void *)MEMORY[0x1E0D29840];
  v6 = a2;
  +[HDMedicationScheduleEntity availableSchedulePredicate](HDMedicationScheduleEntity, "availableSchedulePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "negatedPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v6, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "countDistinctForProperty:predicate:database:error:", CFSTR("medication_uuid"), v10, v12, a3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
  return v16;
}

+ (id)_allActiveMedicationSchedulesWithProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__HDMedicationScheduleDailyAnalytics__allActiveMedicationSchedulesWithProfile_error___block_invoke;
  v10[3] = &unk_1E6E01710;
  v10[4] = &v11;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationScheduleEntity, "performReadTransactionWithHealthDatabase:error:block:", v6, a4, v10);

  if ((_DWORD)a4)
    v7 = (void *)v12[5];
  else
    v7 = 0;
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __85__HDMedicationScheduleDailyAnalytics__allActiveMedicationSchedulesWithProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDMedicationScheduleEntity allActiveMedicationSchedulesWithTransaction:error:](HDMedicationScheduleEntity, "allActiveMedicationSchedulesWithTransaction:error:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error loading a count of unavailable scheduled medications with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_makeMedicationCountPayloadForSchedulesWithProfile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error loading a count of unavailable scheduled medications, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_makeMedicationCountPayloadForSchedulesWithProfile:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error loading a count of scheduled medications, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_makeMedicationPayloadForNewScheduleTypesWithProfile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "%{public}@ Fetching all non-deleted schedules failed with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
