@implementation HDMCOvulationConfirmationStateManager

- (HDMCOvulationConfirmationStateManager)initWithProfile:(id)a3 settingsManager:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDMCOvulationConfirmationStateManager *v11;
  HDMCOvulationConfirmationStateManager *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  HDKeyValueDomain *keyValueDomain;
  HKCalendarCache *v17;
  HKCalendarCache *calendarCache;
  id v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDMCOvulationConfirmationStateManager;
  v11 = -[HDMCOvulationConfirmationStateManager init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_settingsManager, a4);
    objc_storeStrong((id *)&v12->_queue, a5);
    v13 = (void *)MEMORY[0x24BE40AD0];
    WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(v13, "hdmc_menstrualCyclesOvulationConfirmationNotificationStateSyncedUnprotectedDomainWithProfile:", WeakRetained);
    v15 = objc_claimAutoreleasedReturnValue();
    keyValueDomain = v12->_keyValueDomain;
    v12->_keyValueDomain = (HDKeyValueDomain *)v15;

    v17 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x24BDD3968]);
    calendarCache = v12->_calendarCache;
    v12->_calendarCache = v17;

    -[HKMCSettingsManager addObserver:queue:](v12->_settingsManager, "addObserver:queue:", v12, v10);
    v19 = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(v19, "featureSettingsManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerObserver:featureIdentifier:queue:", v12, *MEMORY[0x24BDD2E40], v10);

  }
  return v12;
}

- (id)eventsToScheduleForAnalysis:(id)a3 settingsManager:(id)a4 scheduler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  HDKeyValueDomain *keyValueDomain;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  HKCalendarCache *calendarCache;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  id *v32;
  void *v33;
  id v34;
  id v35;
  id *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  HDKeyValueDomain *v46;
  _BOOL4 v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v55;
  id *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  keyValueDomain = self->_keyValueDomain;
  v65 = 0;
  -[HDKeyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:](keyValueDomain, "hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:", &v65);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v65;
  v16 = v15;
  if (v14)
  {
    v62 = v12;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "hk_morningIndexWithCalendar:", v18);

    calendarCache = self->_calendarCache;
    v64 = v16;
    -[HDMCOvulationConfirmationStateManager _daysWithWristTemperatureSamplesInDayIndexRange:calendarCache:error:](self, "_daysWithWristTemperatureSamplesInDayIndexRange:calendarCache:error:", v19 - 45, 45, calendarCache, &v64);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v64;

    v61 = v21;
    if (!v21)
    {
      v35 = v22;
      v24 = v35;
      if (v35)
      {
        if (a6)
        {
          v24 = objc_retainAutorelease(v35);
          v36 = a6;
          a6 = 0;
          v33 = 0;
          *v36 = v24;
          v34 = v24;
LABEL_38:

          v12 = v62;
          goto LABEL_39;
        }
        _HKLogDroppedError();
      }
      else
      {
        a6 = 0;
      }
      v33 = 0;
      v34 = v24;
      goto LABEL_38;
    }
    v56 = a6;
    objc_msgSend(v11, "fertileWindowNotificationTimeOfDay");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "computeNewStateFromAnalysis:currentDate:fertileWindowNotificationTimeOfDay:fertilityNotificationsEnabled:daysWithWristTemp45DaysBeforeOvulationConfirmed:", v10, v17, v23, objc_msgSend(v11, "fertileWindowNotificationsEnabled"), objc_msgSend(v21, "integerValue"));
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "scheduledNotificationFireDayIndex");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v11;
    if (v25)
    {
      v58 = v10;
      objc_msgSend(v24, "scheduledNotificationFireDayIndex");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:", objc_msgSend(v26, "integerValue"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v62, "eventWithIdentifier:dueDateComponents:eventOptions:", *MEMORY[0x24BE46A48], v27, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "currentDueDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "hk_isAfterDate:", v17);

      if (v30)
      {
        a6 = v28;
      }
      else
      {
        _HKInitializeLogging();
        v37 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          v39 = (void *)objc_opt_class();
          v55 = v39;
          HKSensitiveLogItem();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v39;
          v69 = 2114;
          v70 = v40;
          _os_log_impl(&dword_21961B000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %{public}@", buf, 0x16u);

        }
        a6 = 0;
      }
      v11 = v60;

      v10 = v58;
    }
    else
    {
      a6 = 0;
    }
    if (objc_msgSend(v24, "isEqual:", v14, v55))
    {
      _HKInitializeLogging();
      v41 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v42 = v41;
        v43 = (void *)objc_opt_class();
        v44 = v43;
        HKSensitiveLogItem();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v43;
        v69 = 2114;
        v70 = v45;
        _os_log_impl(&dword_21961B000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] State unchanged: %{public}@", buf, 0x16u);

        v11 = v60;
      }
      v34 = v22;
      if (a6)
      {
LABEL_22:
        v66 = a6;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
    }
    else
    {
      v46 = self->_keyValueDomain;
      v63 = v22;
      v47 = -[HDKeyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:error:](v46, "hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:error:", v24, &v63);
      v34 = v63;

      if (!v47)
      {
        v53 = v34;
        v34 = v53;
        v11 = v60;
        if (v53)
        {
          if (v56)
            *v56 = objc_retainAutorelease(v53);
          else
            _HKLogDroppedError();
        }

        v33 = 0;
        goto LABEL_38;
      }
      _HKInitializeLogging();
      v48 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v49 = v48;
        v50 = (void *)objc_opt_class();
        v57 = v50;
        HKSensitiveLogItem();
        v59 = v10;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        HKSensitiveLogItem();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = v50;
        v69 = 2114;
        v70 = v51;
        v71 = 2114;
        v72 = v52;
        _os_log_impl(&dword_21961B000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully transitioned old state: %{public}@ -> new state: %{public}@", buf, 0x20u);

        v10 = v59;
      }
      -[HDMCOvulationConfirmationStateManager _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("OvulationConfirmationNotificationSetValuesWithState - State Change"));
      v11 = v60;
      if (a6)
        goto LABEL_22;
    }
    v33 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_38;
  }
  v31 = v15;
  v17 = v31;
  if (!v31)
  {
    a6 = 0;
LABEL_32:
    v33 = 0;
    v34 = v17;
    goto LABEL_39;
  }
  if (!a6)
  {
    _HKLogDroppedError();
    goto LABEL_32;
  }
  v17 = objc_retainAutorelease(v31);
  v32 = a6;
  a6 = 0;
  v33 = 0;
  *v32 = v17;
  v34 = v17;
LABEL_39:

  return v33;
}

- (id)scheduledNotificationFertileWindowEndDayIndexWithEvent:(id)a3 error:(id *)a4
{
  void *v7;
  int v8;
  HDKeyValueDomain *keyValueDomain;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  void *v18;
  id v19;
  id v20;

  objc_msgSend(a3, "hdmc_categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE46A48]);

  if (!v8)
    return &unk_24DB30330;
  keyValueDomain = self->_keyValueDomain;
  v20 = 0;
  -[HDKeyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:](keyValueDomain, "hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:", &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v10, "scheduledNotificationFertileWindowEndDayIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v14 = v13;
      v15 = v14;
    }
    else
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCOvulationConfirmationStateManager scheduledNotificationFertileWindowEndDayIndexWithEvent:error:].cold.1(v18);
      objc_msgSend(MEMORY[0x24BDD1540], "hk_errorForNilArgument:class:selector:", CFSTR("scheduledNotificationFertileWindowEndDayIndex"), objc_opt_class(), a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v19);
        else
          _HKLogDroppedError();
      }

      v15 = 0;
    }
    goto LABEL_18;
  }
  v17 = v11;
  v14 = v17;
  if (!v17)
    goto LABEL_15;
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_15:
    v15 = 0;
    goto LABEL_18;
  }
  v14 = objc_retainAutorelease(v17);
  v15 = 0;
  *a4 = v14;
LABEL_18:

  return v15;
}

- (id)scheduledNotificationDaysShiftedFromCalendarMethodWithEvent:(id)a3 error:(id *)a4
{
  void *v7;
  int v8;
  HDKeyValueDomain *keyValueDomain;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  void *v18;
  id v19;
  id v20;

  objc_msgSend(a3, "hdmc_categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE46A48]);

  if (!v8)
    return 0;
  keyValueDomain = self->_keyValueDomain;
  v20 = 0;
  -[HDKeyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:](keyValueDomain, "hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:", &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v10, "scheduledNotificationDaysShiftedForFertileWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v14 = v13;
      v15 = v14;
    }
    else
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCOvulationConfirmationStateManager scheduledNotificationFertileWindowEndDayIndexWithEvent:error:].cold.1(v18);
      objc_msgSend(MEMORY[0x24BDD1540], "hk_errorForNilArgument:class:selector:", CFSTR("scheduledNotificationFertileWindowEndDayIndex"), objc_opt_class(), a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v19);
        else
          _HKLogDroppedError();
      }

      v15 = 0;
    }
    goto LABEL_18;
  }
  v17 = v11;
  v14 = v17;
  if (!v17)
    goto LABEL_15;
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_15:
    v15 = 0;
    goto LABEL_18;
  }
  v14 = objc_retainAutorelease(v17);
  v15 = 0;
  *a4 = v14;
LABEL_18:

  return v15;
}

- (BOOL)transitionToFiredNotificationStateWithRequest:(id)a3 settingsManager:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HDKeyValueDomain *keyValueDomain;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  void *v22;
  HDKeyValueDomain *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id *v33;
  void *v34;
  id WeakRetained;
  _BOOL4 v36;
  id v37;
  void *v38;
  id v39;
  id v40;

  v9 = a4;
  objc_msgSend(a3, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "categoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE46A48];
  v13 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE46A48]);

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "hk_dayIndexWithCalendar:", v15);

    keyValueDomain = self->_keyValueDomain;
    v40 = 0;
    -[HDKeyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:](keyValueDomain, "hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:", &v40);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v40;
    v20 = v19;
    if (!v18 && v19)
    {
      if (a5)
      {
        v20 = objc_retainAutorelease(v19);
        v21 = 0;
        *a5 = v20;
      }
      else
      {
        _HKLogDroppedError();
        v21 = 0;
      }
      goto LABEL_27;
    }
    objc_msgSend(v18, "computeFiredStateWithCurrentDayIndex:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v33 = a5;
      v23 = self->_keyValueDomain;
      v38 = v22;
      v39 = v20;
      v36 = -[HDKeyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:error:](v23, "hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:error:", v22, &v39);
      v37 = v39;

      v34 = (void *)MEMORY[0x24BE46BB8];
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "notificationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "areHealthNotificationsAuthorized");
      objc_msgSend(v18, "scheduledNotificationDaysShiftedForFertileWindow");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v18, "scheduledNotificationFertileWindowEndDayIndex");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerValue") - v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scheduledNotificationDaysWithWristTemp45DaysBeforeOvulationConfirmed");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "submitMetricForCategory:areHealthNotificationsAuthorized:numberOfDaysShiftedForFertileWindow:numberOfDaysOffsetFromFertileWindowEnd:numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:internalLiveOnCycleFactorOverrideEnabled:", v12, v25, v26, v29, v30, objc_msgSend(v9, "internalCycleFactorsOverrideEnabled"));

      if (v36)
      {
        -[HDMCOvulationConfirmationStateManager _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("OvulationConfirmationNotificationSetValuesWithState - Fired"));
        v21 = 1;
        v20 = v37;
        v22 = v38;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      _HKInitializeLogging();
      v22 = v38;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCOvulationConfirmationStateManager transitionToFiredNotificationStateWithRequest:settingsManager:error:].cold.1();
      v20 = v37;
      if (v20)
      {
        if (v33)
          *v33 = objc_retainAutorelease(v20);
        else
          _HKLogDroppedError();
      }

    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCOvulationConfirmationStateManager transitionToFiredNotificationStateWithRequest:settingsManager:error:].cold.1();
      objc_msgSend(MEMORY[0x24BDD1540], "hk_errorForNilArgument:class:selector:", CFSTR("firedState"), objc_opt_class(), a2);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v31);
        else
          _HKLogDroppedError();
      }

    }
    v21 = 0;
    goto LABEL_26;
  }
  v21 = 1;
LABEL_28:

  return v21;
}

- (void)_queue_clearStateIfNecessary
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error clearing key value domain of ovulation confirmation notification state: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (id)_daysWithWristTemperatureSamplesInDayIndexRange:(id)a3 calendarCache:(id)a4 error:(id *)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  HDMCDaySummaryEnumerator *v10;
  id WeakRetained;
  HDMCDaySummaryEnumerator *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a4;
  v10 = [HDMCDaySummaryEnumerator alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(v19) = 1;
  v12 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v10, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", WeakRetained, v9, var0, var1, 1, 0, v19);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v20[4] = &v22;
  v21 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __109__HDMCOvulationConfirmationStateManager__daysWithWristTemperatureSamplesInDayIndexRange_calendarCache_error___block_invoke;
  v20[3] = &unk_24DB21EC8;
  LOBYTE(WeakRetained) = -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v12, "enumerateWithError:handler:", &v21, v20);
  v13 = v21;
  v14 = v13;
  if ((WeakRetained & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23[3]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v13;
    v17 = v16;
    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    v15 = 0;
  }
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __109__HDMCOvulationConfirmationStateManager__daysWithWristTemperatureSamplesInDayIndexRange_calendarCache_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "wristTemperature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD3A00]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3998]), "initWithPush:pull:lite:", 1, 0, 1);
  v9 = (void *)objc_msgSend(v7, "initWithChangesSyncRequest:", v8);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_24DB21FF8;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v6, "syncWithRequest:reason:completion:", v9, v10, v11);

}

void __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v11 = v9;
      _os_log_impl(&dword_21961B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDMCOvulationConfirmationStateManager _queue_clearStateIfNecessary](self, "_queue_clearStateIfNecessary");
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDMCOvulationConfirmationStateManager _queue_clearStateIfNecessary](self, "_queue_clearStateIfNecessary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)scheduledNotificationFertileWindowEndDayIndexWithEvent:(void *)a1 error:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[40];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = (id)OUTLINED_FUNCTION_9_1();
  NSStringFromHDMCOvulationConfirmationNotificationState(2);
  objc_claimAutoreleasedReturnValue();
  v5 = OUTLINED_FUNCTION_8_0();
  NSStringFromHDMCOvulationConfirmationNotificationState(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1(&dword_21961B000, v1, v7, "[%{public}@] Expected ovulation confirmation state:%{public}@ but received: %{public}@", v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)transitionToFiredNotificationStateWithRequest:settingsManager:error:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving fired state from scheduled state: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 40);
  v10 = 138543874;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  v14 = 2114;
  v15 = a3;
  v8 = v6;
  OUTLINED_FUNCTION_5_1(&dword_21961B000, v5, v9, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", (uint8_t *)&v10);

}

@end
