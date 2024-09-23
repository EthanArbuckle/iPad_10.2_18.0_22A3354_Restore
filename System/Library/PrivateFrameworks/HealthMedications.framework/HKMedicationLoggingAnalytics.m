@implementation HKMedicationLoggingAnalytics

+ (BOOL)shouldSubmit
{
  int v3;

  v3 = objc_msgSend(a1, "_isMetricEnabled");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "_isAllowed");
  return v3;
}

+ (BOOL)_isMetricEnabled
{
  void *v2;
  char IsEventUsed;

  +[HKMedicationLogMetric eventName](HKMedicationLogMetric, "eventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

+ (void)submitLogMetricWithHealthStore:(id)a3 actions:(int64_t)a4 provenance:(int64_t)a5 context:(int64_t)a6 medicationIdentifiers:(id)a7 loggingMultipleMeds:(BOOL)a8 hoursAgoLoggedForMax:(id)a9 hoursAgoLoggedForMin:(id)a10 hoursFromScheduledTimeLoggedMax:(id)a11 hoursFromScheduledTimeLoggedMin:(id)a12 hoursFromScheduledToTakenOrSkippedMax:(id)a13 hoursFromScheduledToTakenOrSkippedMin:(id)a14 isPartiallyLoggingScheduledMeds:(id)a15 dataSource:(id)a16
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD block[4];
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  int64_t v61;
  int64_t v62;
  int64_t v63;
  BOOL v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v46 = v20;
  v47 = v19;
  v44 = v22;
  v45 = v21;
  if ((objc_msgSend(a1, "shouldSubmit") & 1) != 0)
  {
    HKMedicationsSharedAnalyticsQueue();
    v42 = v24;
    v27 = v23;
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __357__HKMedicationLoggingAnalytics_submitLogMetricWithHealthStore_actions_provenance_context_medicationIdentifiers_loggingMultipleMeds_hoursAgoLoggedForMax_hoursAgoLoggedForMin_hoursFromScheduledTimeLoggedMax_hoursFromScheduledTimeLoggedMin_hoursFromScheduledToTakenOrSkippedMax_hoursFromScheduledToTakenOrSkippedMin_isPartiallyLoggingScheduledMeds_dataSource___block_invoke;
    block[3] = &unk_1E6CD5BF0;
    v50 = v48;
    v51 = v18;
    v60 = a1;
    v61 = a6;
    v62 = a4;
    v63 = a5;
    v64 = a8;
    v52 = v19;
    v53 = v20;
    v54 = v21;
    v55 = v22;
    v56 = v27;
    v57 = v42;
    v58 = v25;
    v59 = v26;
    dispatch_async(v28, block);

    v23 = v27;
    v24 = v42;

    v29 = v50;
    v30 = v48;
    v31 = v18;
LABEL_6:

    goto LABEL_7;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);

  v30 = v48;
  v31 = v18;
  if (v33)
  {
    HKLogMedication();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v34 = (void *)objc_opt_class();
      v35 = (void *)MEMORY[0x1E0CB37E8];
      v43 = v34;
      objc_msgSend(v35, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v66 = v34;
      v30 = v48;
      v67 = 2114;
      v68 = v36;
      v69 = 2114;
      v70 = v37;
      _os_log_impl(&dword_1B77D4000, v29, OS_LOG_TYPE_INFO, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", buf, 0x20u);

      v31 = v18;
    }
    goto LABEL_6;
  }
LABEL_7:

}

void __357__HKMedicationLoggingAnalytics_submitLogMetricWithHealthStore_actions_provenance_context_medicationIdentifiers_loggingMultipleMeds_hoursAgoLoggedForMax_hoursAgoLoggedForMin_hoursFromScheduledTimeLoggedMax_hoursFromScheduledTimeLoggedMin_hoursFromScheduledToTakenOrSkippedMax_hoursFromScheduledToTakenOrSkippedMin_isPartiallyLoggingScheduledMeds_dataSource___block_invoke(uint64_t a1)
{
  HKMedicationScheduleControl *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  char v16;

  v2 = -[HKMedicationScheduleControl initWithHealthStore:]([HKMedicationScheduleControl alloc], "initWithHealthStore:", *(_QWORD *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __357__HKMedicationLoggingAnalytics_submitLogMetricWithHealthStore_actions_provenance_context_medicationIdentifiers_loggingMultipleMeds_hoursAgoLoggedForMax_hoursAgoLoggedForMin_hoursFromScheduledTimeLoggedMax_hoursFromScheduledTimeLoggedMin_hoursFromScheduledToTakenOrSkippedMax_hoursFromScheduledToTakenOrSkippedMin_isPartiallyLoggingScheduledMeds_dataSource___block_invoke_2;
  v4[3] = &unk_1E6CD5BC8;
  v13 = *(_QWORD *)(a1 + 112);
  v14 = *(_OWORD *)(a1 + 120);
  v15 = *(_QWORD *)(a1 + 136);
  v16 = *(_BYTE *)(a1 + 144);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  v10 = *(id *)(a1 + 88);
  v11 = *(id *)(a1 + 96);
  v12 = *(id *)(a1 + 104);
  -[HKMedicationScheduleControl fetchSchedulesWithMedicationIdentifiers:completion:](v2, "fetchSchedulesWithMedicationIdentifiers:completion:", v3, v4);

}

void __357__HKMedicationLoggingAnalytics_submitLogMetricWithHealthStore_actions_provenance_context_medicationIdentifiers_loggingMultipleMeds_hoursAgoLoggedForMax_hoursAgoLoggedForMin_hoursFromScheduledTimeLoggedMax_hoursFromScheduledTimeLoggedMin_hoursFromScheduledToTakenOrSkippedMax_hoursFromScheduledToTakenOrSkippedMin_isPartiallyLoggingScheduledMeds_dataSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  HKMedicationLogMetric *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(a1 + 96), "_unitTesting_detailedLoggingContextForLoggingContext:schedules:", *(_QWORD *)(a1 + 104), a2);
  v4 = -[HKMedicationLogMetric initWithActions:provenance:context:loggingMultipleMeds:hoursAgoLoggedForMax:hoursAgoLoggedForMin:hoursFromScheduledTimeLoggedMax:hoursFromScheduledTimeLoggedMin:hoursFromScheduledToTakenOrSkippedMax:hoursFromScheduledToTakenOrSkippedMin:isPartiallyLoggingScheduledMeds:dataSource:]([HKMedicationLogMetric alloc], "initWithActions:provenance:context:loggingMultipleMeds:hoursAgoLoggedForMax:hoursAgoLoggedForMin:hoursFromScheduledTimeLoggedMax:hoursFromScheduledTimeLoggedMin:hoursFromScheduledToTakenOrSkippedMax:hoursFromScheduledToTakenOrSkippedMin:isPartiallyLoggingScheduledMeds:dataSource:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), v3, *(unsigned __int8 *)(a1 + 128), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  +[HKMedicationLogMetric eventName](HKMedicationLogMetric, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationLogMetric eventPayload](v4, "eventPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  _HKInitializeLogging();
  HKLogMedication();
  v7 = objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

  if ((_DWORD)v6)
  {
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      HKSensitiveLogItem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HKStringFromMedicationLoggingContext(v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1B77D4000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Submitted metric %{public}@ with context: %{public}@", buf, 0x20u);

    }
  }

}

+ (int64_t)_unitTesting_detailedLoggingContextForLoggingContext:(int64_t)a3 schedules:(id)a4
{
  if (a3 == 1)
    return objc_msgSend(a1, "_detailedScheduleLoggingContextForScheduleType:", objc_msgSend(a1, "_extractCommonScheduleTypeForMedicationSchedules:", a4));
  else
    return a3;
}

+ (int64_t)_detailedScheduleLoggingContextForScheduleType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 1;
  else
    return qword_1B77F19E8[a3 - 1];
}

+ (int64_t)_extractCommonScheduleTypeForMedicationSchedules:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "scheduleType", (_QWORD)v11);
        if (v6)
        {
          if (v6 != v9)
            goto LABEL_13;
        }
        else
        {
          v6 = v9;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
LABEL_13:
    v6 = 0;
  }

  return v6;
}

@end
