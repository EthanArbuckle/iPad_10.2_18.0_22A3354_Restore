@implementation HDMedicationDoseEventDailyAnalytics

- (HDMedicationDoseEventDailyAnalytics)initWithProfile:(id)a3 calendar:(id)a4 currentDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDMedicationDoseEventDailyAnalytics *v11;
  HDMedicationDoseEventDailyAnalytics *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDMedicationDoseEventDailyAnalytics;
  v11 = -[HDMedicationDoseEventDailyAnalytics init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_calendar, a4);
    objc_storeStrong((id *)&v12->_currentDate, a5);
  }

  return v12;
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
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HDMedicationDoseEventDailyAnalytics *v16;
  id v17;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0D294D8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__HDMedicationDoseEventDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke;
  v14[3] = &unk_1E6E00240;
  v15 = v5;
  v16 = self;
  v9 = v5;
  LODWORD(v5) = objc_msgSend(v6, "performReadTransactionWithHealthDatabase:error:block:", v8, &v17, v14);
  v10 = v17;

  if ((_DWORD)v5)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

uint64_t __88__HDMedicationDoseEventDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_weeksSinceFirstLoggedMedPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hk_addEntriesFromNonNilDictionary:", v2);

  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HDMedicationDoseEventDailyAnalytics *v16;
  id v17;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0D294D8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__HDMedicationDoseEventDailyAnalytics_makeIHAGatedEventPayloadWithDataSource_error___block_invoke;
  v14[3] = &unk_1E6E00240;
  v15 = v5;
  v16 = self;
  v9 = v5;
  LODWORD(v5) = objc_msgSend(v6, "performReadTransactionWithHealthDatabase:error:block:", v8, &v17, v14);
  v10 = v17;

  if ((_DWORD)v5)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

uint64_t __84__HDMedicationDoseEventDailyAnalytics_makeIHAGatedEventPayloadWithDataSource_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "_hasLoggedMedsInPastPayloadWithTransaction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_addEntriesFromNonNilDictionary:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v8);
  return 1;
}

- (id)_hasLoggedMedsInPastPayloadWithTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[2];
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -1, self->_currentDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_doseEventCountLoggedSinceDate:transaction:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
LABEL_5:
    -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -7, self->_currentDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_doseEventCountLoggedSinceDate:transaction:", v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "integerValue") >= 1)
      {
        v14 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasLoggedMedsInPastWeek"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("hasLoggedMedsInPastMonth"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("hasLoggedMedsInPast6Months"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("hasLoggedMedsInPastYear"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("hasMedsHistory"));
        v15 = v5;
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasLoggedMedsInPastWeek"));
    }
    -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -30, self->_currentDate);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_doseEventCountLoggedSinceDate:transaction:", v16, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if (objc_msgSend(v17, "integerValue") >= 1)
      {
        v19 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasLoggedMedsInPastMonth"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("hasLoggedMedsInPast6Months"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("hasLoggedMedsInPastYear"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("hasMedsHistory"));
        v20 = v5;
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasLoggedMedsInPastMonth"));
    }
    -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -180, self->_currentDate);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_doseEventCountLoggedSinceDate:transaction:", v21, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "integerValue") >= 1)
      {
        v23 = (void *)v21;
        v24 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasLoggedMedsInPast6Months"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("hasLoggedMedsInPastYear"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("hasMedsHistory"));
        v25 = v5;
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasLoggedMedsInPast6Months"));
    }
    v50 = v18;
    -[NSCalendar hk_dateByAddingDays:toDate:](self->_calendar, "hk_dateByAddingDays:toDate:", -365, self->_currentDate);
    v51 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_doseEventCountLoggedSinceDate:transaction:", v51, v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v26;
    v53 = (void *)v21;
    if (v26)
    {
      if (objc_msgSend(v26, "integerValue") >= 1)
      {
        v27 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasLoggedMedsInPastYear"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("hasMedsHistory"));
        v28 = v5;
        v29 = (void *)v51;
LABEL_26:

        v23 = v53;
        goto LABEL_27;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasLoggedMedsInPastYear"));
    }
    v45 = v16;
    objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForDataTypes();
    v32 = objc_claimAutoreleasedReturnValue();

    HDMedicationDoseEventEntityPredicateForStatuses();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0D29840];
    v48 = (void *)v33;
    v49 = (void *)v32;
    v56[0] = v32;
    v56[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "predicateMatchingAllPredicates:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)objc_opt_class();
    objc_msgSend(v4, "protectedDatabase");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v47 = (void *)v36;
    objc_msgSend(v37, "anyInDatabase:predicate:error:", v38, v36, &v55);
    v39 = objc_claimAutoreleasedReturnValue();
    v44 = v55;

    v46 = (void *)v39;
    if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("hasMedsHistory"));
      v41 = v44;
      v16 = v45;
      v18 = v50;
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v40 = objc_claimAutoreleasedReturnValue();
      v18 = v50;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = v44;
        -[HDMedicationDoseEventDailyAnalytics _hasLoggedMedsInPastPayloadWithTransaction:].cold.1();
        v16 = v45;
      }
      else
      {
        v41 = v44;
        v16 = v45;
      }
    }

    v42 = v5;
    v29 = (void *)v51;
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "integerValue") < 1)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasLoggedMedsInPast24hrs"));
    goto LABEL_5;
  }
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasLoggedMedsInPast24hrs"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasLoggedMedsInPastWeek"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasLoggedMedsInPastMonth"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasLoggedMedsInPast6Months"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasLoggedMedsInPastYear"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasMedsHistory"));
  v10 = v5;
LABEL_30:

  return v5;
}

- (id)_weeksSinceFirstLoggedMedPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSCalendar *calendar;
  void *v12;
  NSObject *v13;
  void *v14;
  id v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSCalendar startOfDayForDate:](self->_calendar, "startOfDayForDate:", self->_currentDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationDoseEventEntityPredicateForStatuses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v16 = 0;
  objc_msgSend(v7, "oldestSampleWithType:profile:encodingOptions:predicate:error:", v6, WeakRetained, 0, v5, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (v9)
  {
    calendar = self->_calendar;
    objc_msgSend(v9, "_creationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar startOfDayForDate:](calendar, "startOfDayForDate:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    HKMedicationAnalyticsWeeksBetweenDates();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("weeksSinceFirstLoggedMed"));

  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HDMedicationDoseEventDailyAnalytics _weeksSinceFirstLoggedMedPayload].cold.1();
  }

  return v3;
}

- (id)_hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[3];
  uint8_t buf[4];
  HDMedicationDoseEventDailyAnalytics *v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 16, -1, self->_currentDate, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar startOfDayForDate:](self->_calendar, "startOfDayForDate:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar startOfDayForDate:](self->_calendar, "startOfDayForDate:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v38 = (void *)v9;
  v39 = (void *)v7;
  objc_msgSend((id)objc_opt_class(), "_predicateForDoseEventsBetweenDate:andDate:", v7, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  HDMedicationDoseEventEntityPredicateForLogOrigin();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D29840];
  v40 = (void *)v11;
  v41 = (void *)v10;
  v47[0] = v10;
  v47[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateMatchingAllPredicates:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_class();
  v16 = *MEMORY[0x1E0D29260];
  objc_msgSend(v4, "databaseForEntityClass:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v37 = (void *)v14;
  objc_msgSend(v15, "countValueForProperty:predicate:database:error:", v16, v14, v17, &v43);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v43;

  if (!v18)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[HDMedicationDoseEventDailyAnalytics _hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:].cold.1();
    v29 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v18, "integerValue") <= 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v20 = objc_claimAutoreleasedReturnValue();
    v32 = v37;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v46 = self;
      _os_log_impl(&dword_1B815E000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] No scheduled dose events found for yesterday", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v36 = v5;
  HDMedicationDoseEventEntityPredicateForStatuses();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v4;
  v22 = (void *)MEMORY[0x1E0D29840];
  v44[0] = v41;
  v44[1] = v40;
  v44[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22;
  v4 = v21;
  objc_msgSend(v24, "predicateMatchingAllPredicates:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "databaseForEntityClass:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v15, "countValueForProperty:predicate:database:error:", v16, v25, v26, &v42);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v42;

  if (!v27)
  {
    v33 = v25;
    _HKInitializeLogging();
    HKLogMedication();
    v34 = objc_claimAutoreleasedReturnValue();
    v5 = v36;
    v32 = v37;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[HDMedicationDoseEventDailyAnalytics _hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:].cold.1();

LABEL_14:
    v29 = 0;
    v31 = v38;
    v30 = v39;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v18, "integerValue") == objc_msgSend(v27, "integerValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v36;
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v28, CFSTR("hasLoggedAllScheduledMedsInPreviousDay"));

  v29 = v36;
LABEL_8:
  v31 = v38;
  v30 = v39;
  v32 = v37;
LABEL_15:

  return v29;
}

+ (id)_doseEventCountLoggedSinceDate:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_predicateForDoseEventsLoggedSinceDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "_countOfDoseEventsWithPredicate:transaction:error:", v8, v7, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = a1;
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_1B815E000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Error when determining if logged medications since date: %{public}@, continuing daily analytics submission: %{public}@", buf, 0x20u);
    }

  }
  return v9;
}

+ (id)_countOfDoseEventsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  v10 = *MEMORY[0x1E0D29260];
  objc_msgSend(v7, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "countDistinctForProperty:predicate:database:error:", v10, v8, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_predicateForDoseEventsLoggedSinceDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB68B0];
  v4 = a3;
  objc_msgSend(v3, "medicationDoseEventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataTypes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HDDataEntityPredicateForCreationDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HDMedicationDoseEventEntityPredicateForStatuses();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D29840];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_predicateForDoseEventsBetweenDate:(id)a3 andDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB68B0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "medicationDoseEventType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataTypes();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForStartDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForStartDate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D29840];
  v17[0] = v10;
  v17[1] = v11;
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateMatchingAllPredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_hasLoggedMedsInPastPayloadWithTransaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error when determining if user has any dose events in the database, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_weeksSinceFirstLoggedMedPayload
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error loading oldest logged dose event, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error loading scheduled logged dose event count for yesterday, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
