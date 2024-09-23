@implementation HKMCNotificationSentAnalytics

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
  char v3;
  void *v4;

  +[HKMCNotificationSentMetric eventName](HKMCNotificationSentMetric, "eventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((AnalyticsIsEventUsed() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "hkmc_menstrualCyclesDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hkmc_analyticsDebugModeEnabled");

  }
  return v3;
}

+ (void)submitMetricForCategory:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4 numberOfDaysShiftedForFertileWindow:(id)a5 numberOfDaysOffsetFromFertileWindowEnd:(id)a6 numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:(id)a7 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  HKMCNotificationSentMetric *v18;
  void *v19;
  HKMCNotificationSentMetric *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v8 = a8;
  v12 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if ((objc_msgSend(a1, "shouldSubmit") & 1) != 0)
  {
    v18 = [HKMCNotificationSentMetric alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HKMCNotificationSentMetric initWithCategory:areHealthNotificationsAuthorized:](v18, "initWithCategory:areHealthNotificationsAuthorized:", v14, v19);

    -[HKMCNotificationSentMetric setNumberOfDaysShiftedForFertileWindow:](v20, "setNumberOfDaysShiftedForFertileWindow:", v15);
    -[HKMCNotificationSentMetric setNumberOfDaysOffsetFromFertileWindowEnd:](v20, "setNumberOfDaysOffsetFromFertileWindowEnd:", v16);
    -[HKMCNotificationSentMetric setNumberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:](v20, "setNumberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:", v17);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMCNotificationSentMetric setInternalLiveOnCycleFactorOverrideEnabled:](v20, "setInternalLiveOnCycleFactorOverrideEnabled:", v21);

    +[HKMCNotificationSentMetric eventName](HKMCNotificationSentMetric, "eventName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMCNotificationSentMetric eventPayload](v20, "eventPayload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (void *)objc_opt_class();
      v27 = v26;
      HKSensitiveLogItem();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v26;
      v38 = 2114;
      v39 = v28;
      _os_log_impl(&dword_218A9C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", buf, 0x16u);

    }
  }
  else
  {
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      v31 = (void *)objc_opt_class();
      v32 = (void *)MEMORY[0x24BDD16E0];
      v33 = v31;
      objc_msgSend(v32, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v31;
      v38 = 2114;
      v39 = v34;
      v40 = 2114;
      v41 = v35;
      _os_log_impl(&dword_218A9C000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", buf, 0x20u);

    }
  }

}

+ (void)submitMetricForCategory:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a5
{
  +[HKMCNotificationSentAnalytics submitMetricForCategory:areHealthNotificationsAuthorized:numberOfDaysShiftedForFertileWindow:numberOfDaysOffsetFromFertileWindowEnd:numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:internalLiveOnCycleFactorOverrideEnabled:](HKMCNotificationSentAnalytics, "submitMetricForCategory:areHealthNotificationsAuthorized:numberOfDaysShiftedForFertileWindow:numberOfDaysOffsetFromFertileWindowEnd:numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:internalLiveOnCycleFactorOverrideEnabled:", a3, a4, 0, 0, 0, a5);
}

@end
