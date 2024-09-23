@implementation HKMCScheduledAnalysisAnalytics

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

  +[HKMCScheduledAnalysisMetric eventName](HKMCScheduledAnalysisMetric, "eventName");
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

+ (void)submitMetricWithDateComponents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HKMCScheduledAnalysisMetric *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(a1, "shouldSubmit") & 1) != 0)
  {
    v5 = (uint64_t)(ceil((double)objc_msgSend(v4, "minute") / 15.0) * 15.0);
    v6 = objc_msgSend(v4, "hour");
    if (v5 == 60)
      v7 = v6 + 1;
    else
      v7 = v6;
    if (v5 == 60)
      v8 = 0;
    else
      v8 = v5;
    if (v7 == 24)
      v9 = 0;
    else
      v9 = 100 * v7;
    v10 = -[HKMCScheduledAnalysisMetric initWithTimeSuccessful:]([HKMCScheduledAnalysisMetric alloc], "initWithTimeSuccessful:", v9 + v8);
    +[HKMCScheduledAnalysisMetric eventName](HKMCScheduledAnalysisMetric, "eventName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMCScheduledAnalysisMetric eventPayload](v10, "eventPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (void *)objc_opt_class();
      v16 = v15;
      HKSensitiveLogItem();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_218A9C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", (uint8_t *)&v20, 0x16u);

    }
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v18;
    v20 = 138543362;
    v21 = (id)objc_opt_class();
    v19 = v21;
    _os_log_impl(&dword_218A9C000, &v10->super, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric.", (uint8_t *)&v20, 0xCu);

LABEL_15:
  }

}

@end
