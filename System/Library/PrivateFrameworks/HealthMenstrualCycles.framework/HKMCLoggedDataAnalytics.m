@implementation HKMCLoggedDataAnalytics

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

  +[HKMCLoggedDataMetric eventName](HKMCLoggedDataMetric, "eventName");
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

+ (void)submitMetricForMethod:(id)a3 loggedDayIndex:(int64_t)a4 currentDayIndex:(int64_t)a5
{
  id v8;
  HKMCLoggedDataMetric *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if ((objc_msgSend(a1, "shouldSubmit") & 1) != 0)
  {
    v9 = -[HKMCLoggedDataMetric initWithMethod:]([HKMCLoggedDataMetric alloc], "initWithMethod:", v8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5 - a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMCLoggedDataMetric setDayIndexLoggingOffset:](v9, "setDayIndexLoggingOffset:", v10);

    +[HKMCLoggedDataMetric eventName](HKMCLoggedDataMetric, "eventName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMCLoggedDataMetric eventPayload](v9, "eventPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3030];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    v14 = v13;
    v15 = (void *)objc_opt_class();
    v16 = v15;
    HKSensitiveLogItem();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v15;
    v25 = 2114;
    v26 = v17;
    _os_log_impl(&dword_218A9C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", (uint8_t *)&v23, 0x16u);

LABEL_6:
    goto LABEL_7;
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v18;
    v19 = (void *)objc_opt_class();
    v20 = (void *)MEMORY[0x24BDD16E0];
    v14 = v19;
    objc_msgSend(v20, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v19;
    v25 = 2114;
    v26 = v21;
    v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_218A9C000, &v9->super, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", (uint8_t *)&v23, 0x20u);

    goto LABEL_6;
  }
LABEL_8:

}

@end
