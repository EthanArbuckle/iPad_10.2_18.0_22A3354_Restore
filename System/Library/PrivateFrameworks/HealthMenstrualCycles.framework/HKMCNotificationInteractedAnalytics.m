@implementation HKMCNotificationInteractedAnalytics

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

  +[HKMCNotificationInteractedMetric eventName](HKMCNotificationInteractedMetric, "eventName");
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

+ (void)submitMetricForCategory:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  HKMCNotificationInteractedMetric *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "shouldSubmit") & 1) != 0)
  {
    v8 = -[HKMCNotificationInteractedMetric initWithCategory:action:]([HKMCNotificationInteractedMetric alloc], "initWithCategory:action:", v6, v7);
    +[HKMCNotificationInteractedMetric eventName](HKMCNotificationInteractedMetric, "eventName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMCNotificationInteractedMetric eventPayload](v8, "eventPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3030];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    v12 = v11;
    v13 = (void *)objc_opt_class();
    v14 = v13;
    HKSensitiveLogItem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v13;
    v23 = 2114;
    v24 = v15;
    _os_log_impl(&dword_218A9C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", (uint8_t *)&v21, 0x16u);

LABEL_6:
    goto LABEL_7;
  }
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v16;
    v17 = (void *)objc_opt_class();
    v18 = (void *)MEMORY[0x24BDD16E0];
    v12 = v17;
    objc_msgSend(v18, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v17;
    v23 = 2114;
    v24 = v19;
    v25 = 2114;
    v26 = v20;
    _os_log_impl(&dword_218A9C000, &v8->super, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", (uint8_t *)&v21, 0x20u);

    goto LABEL_6;
  }
LABEL_8:

}

@end
