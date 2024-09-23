@implementation HKMedicationNotificationAnalytics

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

  +[HKMedicationNotificationMetric eventName](HKMedicationNotificationMetric, "eventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

+ (void)submitNotificationSentMetricWithHealthNotificationsAuthorizedStatus:(BOOL)a3 dataSource:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "submitMetricForType:areHealthNotificationsAuthorizedStatus:interactionType:dataSource:", 1, v8, 0, v7);

}

+ (void)submitNotificationInterationMetricForType:(int64_t)a3 withHealthNotificationsAuthorizedStatus:(id)a4 dataSource:(id)a5
{
  objc_msgSend(a1, "submitMetricForType:areHealthNotificationsAuthorizedStatus:interactionType:dataSource:", 2, a4, a3, a5);
}

+ (void)submitMetricForType:(int64_t)a3 areHealthNotificationsAuthorizedStatus:(id)a4 interactionType:(int64_t)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD block[4];
  NSObject *v22;
  id v23;
  int64_t v24;
  int64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if ((objc_msgSend(a1, "shouldSubmit") & 1) != 0)
  {
    HKMedicationsSharedAnalyticsQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __123__HKMedicationNotificationAnalytics_submitMetricForType_areHealthNotificationsAuthorizedStatus_interactionType_dataSource___block_invoke;
    block[3] = &unk_1E6CD50E8;
    v24 = a3;
    v22 = v10;
    v23 = v11;
    v25 = a5;
    v26 = a1;
    dispatch_async(v12, block);

    v13 = v22;
LABEL_6:

    goto LABEL_7;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

  if (v15)
  {
    HKLogMedication();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_opt_class();
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = v16;
      objc_msgSend(v17, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v16;
      v29 = 2114;
      v30 = v19;
      v31 = 2114;
      v32 = v20;
      _os_log_impl(&dword_1B77D4000, v13, OS_LOG_TYPE_INFO, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", buf, 0x20u);

    }
    goto LABEL_6;
  }
LABEL_7:

}

void __123__HKMedicationNotificationAnalytics_submitMetricForType_areHealthNotificationsAuthorizedStatus_interactionType_dataSource___block_invoke(_QWORD *a1)
{
  HKMedicationNotificationMetric *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = -[HKMedicationNotificationMetric initWithType:areHealthNotificationsAuthorized:dataSource:]([HKMedicationNotificationMetric alloc], "initWithType:areHealthNotificationsAuthorized:dataSource:", a1[6], a1[4], a1[5]);
  -[HKMedicationNotificationMetric setInteractionType:](v2, "setInteractionType:", a1[7]);
  +[HKMedicationNotificationMetric eventName](HKMedicationNotificationMetric, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationNotificationMetric eventPayload](v2, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if ((_DWORD)v4)
  {
    HKLogMedication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      HKSensitiveLogItem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1B77D4000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Submitted metric %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }

}

@end
