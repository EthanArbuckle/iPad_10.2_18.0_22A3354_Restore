@implementation HKMobilityWalkingSteadinessAnalyticsManager

- (HKMobilityWalkingSteadinessAnalyticsManager)init
{
  HKMobilityWalkingSteadinessAnalyticsManager *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsManager;
  v2 = -[HKMobilityWalkingSteadinessAnalyticsManager init](&v6, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)submitNotificationEventWithDataSource:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__HKMobilityWalkingSteadinessAnalyticsManager_submitNotificationEventWithDataSource_resultHandler___block_invoke;
  block[3] = &unk_1E9C36950;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __99__HKMobilityWalkingSteadinessAnalyticsManager_submitNotificationEventWithDataSource_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_submitNotificationEventWithDataSource:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (void)submitNotificationInteractionEventWithDataSource:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__HKMobilityWalkingSteadinessAnalyticsManager_submitNotificationInteractionEventWithDataSource_resultHandler___block_invoke;
  block[3] = &unk_1E9C36950;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __110__HKMobilityWalkingSteadinessAnalyticsManager_submitNotificationInteractionEventWithDataSource_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_submitNotificationInteractionEventWithDataSource:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (void)submitOnboardingEventWithDataSource:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__HKMobilityWalkingSteadinessAnalyticsManager_submitOnboardingEventWithDataSource_resultHandler___block_invoke;
  block[3] = &unk_1E9C36950;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __97__HKMobilityWalkingSteadinessAnalyticsManager_submitOnboardingEventWithDataSource_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_submitOnboardingEventWithDataSource:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (id)_queue_submitNotificationEventWithDataSource:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL4 v6;
  void *v7;
  HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *v8;
  BOOL v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *v16;
  id v17;
  id v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[HKMobilityWalkingSteadinessAnalyticsManager _isImproveHealthAndActivityAllowed](self, "_isImproveHealthAndActivityAllowed");
  v6 = +[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric requiresImproveHealthAndActivityAllowed](HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric, "requiresImproveHealthAndActivityAllowed");
  if (v5 || !v6)
  {
    v8 = -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric initWithImproveHealthAndActivityAllowed:]([HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric alloc], "initWithImproveHealthAndActivityAllowed:", v5);
    v18 = 0;
    v9 = -[HKMobilityWalkingSteadinessAnalyticsManager _collectDiagnosticFieldsForNotificationMetric:dataSource:error:](self, "_collectDiagnosticFieldsForNotificationMetric:dataSource:error:", v8, v4, &v18);
    v10 = v18;
    v11 = v10;
    if (v9)
    {
      v17 = v10;
      v12 = -[HKMobilityWalkingSteadinessAnalyticsManager _collectSensitiveFieldsForNotificationMetric:dataSource:error:](self, "_collectSensitiveFieldsForNotificationMetric:dataSource:error:", v8, v4, &v17);
      v13 = v17;

      if (v12)
      {
        -[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric eventName](v8, "eventName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v8;
        AnalyticsSendEventLazy();

        +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 0, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 1, v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v13;
    }
    else
    {
      +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 1, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __92__HKMobilityWalkingSteadinessAnalyticsManager__queue_submitNotificationEventWithDataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventPayload");
}

- (id)_queue_submitNotificationInteractionEventWithDataSource:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL4 v6;
  void *v7;
  HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *v8;
  BOOL v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *v16;
  id v17;
  id v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[HKMobilityWalkingSteadinessAnalyticsManager _isImproveHealthAndActivityAllowed](self, "_isImproveHealthAndActivityAllowed");
  v6 = +[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric requiresImproveHealthAndActivityAllowed](HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric, "requiresImproveHealthAndActivityAllowed");
  if (v5 || !v6)
  {
    v8 = -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric initWithImproveHealthAndActivityAllowed:]([HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric alloc], "initWithImproveHealthAndActivityAllowed:", v5);
    v18 = 0;
    v9 = -[HKMobilityWalkingSteadinessAnalyticsManager _collectDiagnosticFieldsForNotificationInteractionMetric:dataSource:error:](self, "_collectDiagnosticFieldsForNotificationInteractionMetric:dataSource:error:", v8, v4, &v18);
    v10 = v18;
    v11 = v10;
    if (v9)
    {
      v17 = v10;
      v12 = -[HKMobilityWalkingSteadinessAnalyticsManager _collectSensitiveFieldsForNotificationInteractionMetric:dataSource:error:](self, "_collectSensitiveFieldsForNotificationInteractionMetric:dataSource:error:", v8, v4, &v17);
      v13 = v17;

      if (v12)
      {
        -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric eventName](v8, "eventName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v8;
        AnalyticsSendEventLazy();

        +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 0, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 1, v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v13;
    }
    else
    {
      +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 1, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __103__HKMobilityWalkingSteadinessAnalyticsManager__queue_submitNotificationInteractionEventWithDataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventPayload");
}

- (id)_queue_submitOnboardingEventWithDataSource:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL4 v6;
  void *v7;
  HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *v8;
  BOOL v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *v16;
  id v17;
  id v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[HKMobilityWalkingSteadinessAnalyticsManager _isImproveHealthAndActivityAllowed](self, "_isImproveHealthAndActivityAllowed");
  v6 = +[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric requiresImproveHealthAndActivityAllowed](HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric, "requiresImproveHealthAndActivityAllowed");
  if (v5 || !v6)
  {
    v8 = -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric initWithImproveHealthAndActivityAllowed:]([HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric alloc], "initWithImproveHealthAndActivityAllowed:", v5);
    v18 = 0;
    v9 = -[HKMobilityWalkingSteadinessAnalyticsManager _collectDiagnosticFieldsForOnboardingMetric:dataSource:error:](self, "_collectDiagnosticFieldsForOnboardingMetric:dataSource:error:", v8, v4, &v18);
    v10 = v18;
    v11 = v10;
    if (v9)
    {
      v17 = v10;
      v12 = -[HKMobilityWalkingSteadinessAnalyticsManager _collectSensitiveFieldsForOnboardingMetric:dataSource:error:](self, "_collectSensitiveFieldsForOnboardingMetric:dataSource:error:", v8, v4, &v17);
      v13 = v17;

      if (v12)
      {
        -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric eventName](v8, "eventName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v8;
        AnalyticsSendEventLazy();

        +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 0, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 1, v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v13;
    }
    else
    {
      +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 1, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[HKMobilityAnalyticsResult resultWithStatus:error:](HKMobilityAnalyticsResult, "resultWithStatus:error:", 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __90__HKMobilityWalkingSteadinessAnalyticsManager__queue_submitOnboardingEventWithDataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventPayload");
}

- (BOOL)_collectDiagnosticFieldsForNotificationMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)_collectSensitiveFieldsForNotificationMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isImproveHealthAndActivityAllowed") & 1) != 0)
  {
    v34 = 0;
    objc_msgSend(v8, "notificationClassificationWithError:", &v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v34;
    objc_msgSend(v7, "setNotificationClassification:", v9);

    v11 = v10;
    if (v11)
      goto LABEL_7;
    v33 = 0;
    objc_msgSend(v8, "notificationTypeWithError:", &v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v33;
    objc_msgSend(v7, "setNotificationType:", v12);

    v11 = v13;
    if (v11)
      goto LABEL_7;
    v32 = 0;
    objc_msgSend(v8, "ageWithError:", &v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v32;
    objc_msgSend(v7, "setAge:", v14);

    v11 = v15;
    if (v11)
      goto LABEL_7;
    v31 = 0;
    objc_msgSend(v8, "biologicalSexWithError:", &v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v31;
    objc_msgSend(v7, "setBiologicalSex:", v16);

    v11 = v17;
    if (v11
      || (v30 = 0,
          objc_msgSend(v8, "daysSinceLastNotificationWithError:", &v30),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = v30,
          objc_msgSend(v7, "setDaysSinceLastNotification:", v18),
          v18,
          (v11 = v19) != 0))
    {
LABEL_7:
      v20 = v11;
      if (!a5)
      {
        _HKLogDroppedError();
        v22 = 0;
        goto LABEL_14;
      }
      v21 = objc_retainAutorelease(v11);
      v22 = 0;
    }
    else
    {
      v29 = 0;
      objc_msgSend(v8, "areHealthNotificationsAuthorizedWithError:", &v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v29;
      objc_msgSend(v7, "setAreHealthNotificationsAuthorized:", v27);

      v20 = v28;
      v22 = v20 == 0;
      if (!v20)
        goto LABEL_14;
      if (!a5)
      {
        _HKLogDroppedError();
        goto LABEL_14;
      }
      v21 = objc_retainAutorelease(v20);
    }
    *a5 = v21;
LABEL_14:

    goto LABEL_15;
  }
  _HKInitializeLogging();
  v23 = (void *)*MEMORY[0x1E0CB5328];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    *(_DWORD *)buf = 138543362;
    v36 = (id)objc_opt_class();
    v25 = v36;
    _os_log_impl(&dword_1D7804000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping collecting metrics due to IH&A not allowed", buf, 0xCu);

  }
  v22 = 1;
LABEL_15:

  return v22;
}

- (BOOL)_collectDiagnosticFieldsForNotificationInteractionMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)_collectSensitiveFieldsForNotificationInteractionMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isImproveHealthAndActivityAllowed") & 1) != 0)
  {
    v31 = 0;
    objc_msgSend(v8, "notificationClassificationWithError:", &v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v31;
    objc_msgSend(v7, "setNotificationClassification:", v9);

    v11 = v10;
    if (v11)
      goto LABEL_6;
    v30 = 0;
    objc_msgSend(v8, "notificationTypeWithError:", &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    objc_msgSend(v7, "setNotificationType:", v12);

    v11 = v13;
    if (v11)
      goto LABEL_6;
    v29 = 0;
    objc_msgSend(v8, "ageWithError:", &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v29;
    objc_msgSend(v7, "setAge:", v14);

    v11 = v15;
    if (v11
      || (v28 = 0,
          objc_msgSend(v8, "biologicalSexWithError:", &v28),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = v28,
          objc_msgSend(v7, "setBiologicalSex:", v16),
          v16,
          (v11 = v17) != 0))
    {
LABEL_6:
      v18 = v11;
      if (!a5)
      {
        _HKLogDroppedError();
        v20 = 0;
        goto LABEL_13;
      }
      v19 = objc_retainAutorelease(v11);
      v20 = 0;
    }
    else
    {
      v27 = 0;
      objc_msgSend(v8, "notificationInteractionTypeWithError:", &v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v27;
      objc_msgSend(v7, "setNotificationInteractionType:", v25);

      v18 = v26;
      v20 = v18 == 0;
      if (!v18)
        goto LABEL_13;
      if (!a5)
      {
        _HKLogDroppedError();
        goto LABEL_13;
      }
      v19 = objc_retainAutorelease(v18);
    }
    *a5 = v19;
LABEL_13:

    goto LABEL_14;
  }
  _HKInitializeLogging();
  v21 = (void *)*MEMORY[0x1E0CB5328];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    *(_DWORD *)buf = 138543362;
    v33 = (id)objc_opt_class();
    v23 = v33;
    _os_log_impl(&dword_1D7804000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping collecting metrics due to IH&A not allowed", buf, 0xCu);

  }
  v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)_collectDiagnosticFieldsForOnboardingMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v7 = a3;
  v8 = a4;
  v40 = 0;
  objc_msgSend(v8, "stepWithError:", &v40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v40;
  objc_msgSend(v7, "setStep:", v9);

  v11 = v10;
  if (v11)
    goto LABEL_9;
  v39 = 0;
  objc_msgSend(v8, "featureVersionWithError:", &v39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v39;
  objc_msgSend(v7, "setFeatureVersion:", v12);

  v11 = v13;
  if (v11)
    goto LABEL_9;
  v38 = 0;
  objc_msgSend(v8, "provenanceWithError:", &v38);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v38;
  objc_msgSend(v7, "setProvenance:", v14);

  v11 = v15;
  if (v11)
    goto LABEL_9;
  v37 = 0;
  objc_msgSend(v8, "activeWatchProductTypeWithError:", &v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v37;
  objc_msgSend(v7, "setActiveWatchProductType:", v16);

  v11 = v17;
  if (v11)
    goto LABEL_9;
  v36 = 0;
  objc_msgSend(v8, "hasDefaultHeightWithError:", &v36);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v36;
  objc_msgSend(v7, "setHasDefaultHeight:", v18);

  v11 = v19;
  if (v11)
    goto LABEL_9;
  v35 = 0;
  objc_msgSend(v8, "hasDefaultWeightWithError:", &v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v35;
  objc_msgSend(v7, "setHasDefaultWeight:", v20);

  v11 = v21;
  if (v11)
    goto LABEL_9;
  v34 = 0;
  objc_msgSend(v8, "acceptDefaultHeightWithError:", &v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v34;
  objc_msgSend(v7, "setAcceptDefaultHeight:", v22);

  v11 = v23;
  if (v11
    || (v33 = 0,
        objc_msgSend(v8, "acceptDefaultWeightWithError:", &v33),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = v33,
        objc_msgSend(v7, "setAcceptDefaultWeight:", v24),
        v24,
        (v11 = v25) != 0))
  {
LABEL_9:
    v26 = v11;
    if (!a5)
    {
      _HKLogDroppedError();
      v28 = 0;
      goto LABEL_13;
    }
    v27 = objc_retainAutorelease(v11);
    v28 = 0;
  }
  else
  {
    v32 = 0;
    objc_msgSend(v8, "acceptDefaultNotificationsWithError:", &v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v32;
    objc_msgSend(v7, "setAcceptDefaultNotifications:", v30);

    v26 = v31;
    v28 = v26 == 0;
    if (!v26)
      goto LABEL_13;
    if (!a5)
    {
      _HKLogDroppedError();
      goto LABEL_13;
    }
    v27 = objc_retainAutorelease(v26);
  }
  *a5 = v27;
LABEL_13:

  return v28;
}

- (BOOL)_collectSensitiveFieldsForOnboardingMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isImproveHealthAndActivityAllowed") & 1) != 0)
  {
    v22 = 0;
    objc_msgSend(v8, "ageWithError:", &v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v22;
    objc_msgSend(v7, "setAge:", v9);

    v11 = v10;
    if (v11)
    {
      v12 = v11;
      if (!a5)
      {
        _HKLogDroppedError();
        v14 = 0;
        goto LABEL_14;
      }
      v13 = objc_retainAutorelease(v11);
      v14 = 0;
    }
    else
    {
      v21 = 0;
      objc_msgSend(v8, "biologicalSexWithError:", &v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      objc_msgSend(v7, "setBiologicalSex:", v18);

      v12 = v19;
      v14 = v12 == 0;
      if (!v12)
      {
LABEL_14:

        goto LABEL_15;
      }
      if (!a5)
      {
        _HKLogDroppedError();
        goto LABEL_14;
      }
      v13 = objc_retainAutorelease(v12);
    }
    *a5 = v13;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB5328];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    *(_DWORD *)buf = 138543362;
    v24 = (id)objc_opt_class();
    v17 = v24;
    _os_log_impl(&dword_1D7804000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping collecting metrics due to IH&A not allowed", buf, 0xCu);

  }
  v14 = 1;
LABEL_15:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
