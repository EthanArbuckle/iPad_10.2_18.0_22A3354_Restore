@implementation HDHRAFibBurdenRescindedNotificationManager

- (HDHRAFibBurdenRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HDHRAFibBurdenRescindedNotificationManager *v10;

  v6 = (void *)MEMORY[0x1E0D294B8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "hdhr_aFibBurdenProtectedLocalDomainForProfile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDHRAFibBurdenRescindedNotificationManager initWithProfile:featureStatusProvider:keyValueDomain:](self, "initWithProfile:featureStatusProvider:keyValueDomain:", v8, v7, v9);

  return v10;
}

- (HDHRAFibBurdenRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4 keyValueDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HDHRAFibBurdenRescindedNotificationManager *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  HKCreateSerialDispatchQueue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDHRAFibBurdenRescindedNotificationManager initWithProfile:featureStatusProvider:keyValueDomain:queue:](self, "initWithProfile:featureStatusProvider:keyValueDomain:queue:", v10, v9, v8, v11);

  return v12;
}

- (HDHRAFibBurdenRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4 queueOverride:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HDHRAFibBurdenRescindedNotificationManager *v13;

  v8 = (void *)MEMORY[0x1E0D294B8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "hdhr_aFibBurdenProtectedLocalDomainForProfile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDHRAFibBurdenRescindedNotificationManager initWithProfile:featureStatusProvider:keyValueDomain:queue:](self, "initWithProfile:featureStatusProvider:keyValueDomain:queue:", v11, v10, v12, v9);

  return v13;
}

- (HDHRAFibBurdenRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4 keyValueDomain:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDHRAFibBurdenRescindedNotificationManager *v14;
  HDHRAFibBurdenRescindedNotificationManager *v15;
  id WeakRetained;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDHRAFibBurdenRescindedNotificationManager;
  v14 = -[HDHRAFibBurdenRescindedNotificationManager init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_featureStatusProvider, a4);
    objc_storeStrong((id *)&v15->_queue, a6);
    objc_storeStrong((id *)&v15->_localKeyValueDomain, a5);
    -[HDHRAFibBurdenRescindedNotificationManager setUnitTesting_skipDatabaseObservation:](v15, "setUnitTesting_skipDatabaseObservation:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&v15->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v15, 0);

  }
  return v15;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProtectedDataObserver:", self);

  -[HKFeatureStatusProviding unregisterObserver:](self->_featureStatusProvider, "unregisterObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)HDHRAFibBurdenRescindedNotificationManager;
  -[HDHRAFibBurdenRescindedNotificationManager dealloc](&v5, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  HKFeatureStatusProviding *featureStatusProvider;
  OS_dispatch_queue *queue;
  id v6;
  id v7;

  featureStatusProvider = self->_featureStatusProvider;
  queue = self->_queue;
  v6 = a3;
  -[HKFeatureStatusProviding registerObserver:queue:](featureStatusProvider, "registerObserver:queue:", self, queue);
  objc_msgSend(v6, "database");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addProtectedDataObserver:queue:", self, self->_queue);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4
    && !-[HDHRAFibBurdenRescindedNotificationManager unitTesting_skipDatabaseObservation](self, "unitTesting_skipDatabaseObservation"))
  {
    -[HDHRAFibBurdenRescindedNotificationManager _queue_pullFeatureStatusAndPresentAlertIfNeeded](self, "_queue_pullFeatureStatusAndPresentAlertIfNeeded");
  }
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  HDHRAFibBurdenRescindedNotificationManager *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Feature status did change to: %@", (uint8_t *)&v7, 0x16u);
  }

  -[HDHRAFibBurdenRescindedNotificationManager _queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:](self, "_queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:", v5);
}

- (void)_queue_pullFeatureStatusAndPresentAlertIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Failed to load feature status with error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  HDKeyValueDomain *localKeyValueDomain;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  HDKeyValueDomain *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  HDKeyValueDomain *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  HDHRAFibBurdenRescindedNotificationManager *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v5, "requirementsEvaluationByContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[HDHRAFibBurdenRescindedNotificationManager _isFeatureUnavailableForNonRescindedReasonsWithRequirementsEvaluation:](self, "_isFeatureUnavailableForNonRescindedReasonsWithRequirementsEvaluation:", v7))
  {
    localKeyValueDomain = self->_localKeyValueDomain;
    v30 = 0;
    -[HDKeyValueDomain dateForKey:error:](localKeyValueDomain, "dateForKey:error:", CFSTR("HDHRAFibBurdenNotificationsDisabledNotificationShownDateKey"), &v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v30;
    if (v11)
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[HDHRAFibBurdenRescindedNotificationManager _queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:].cold.4();

      goto LABEL_9;
    }
    if (-[HDHRAFibBurdenRescindedNotificationManager _isFeatureRescindedWithRequirementsEvaluation:](self, "_isFeatureRescindedWithRequirementsEvaluation:", v7))
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = self;
        v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%@] AFib Burden is rescinded (last shown date: %@)", buf, 0x16u);
      }

      if (v10)
        goto LABEL_9;
      objc_msgSend(v7, "unsatisfiedRequirementIdentifiers");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[HDHRAFibBurdenRescindedNotificationManager _rescindedAlertTitleKeyForUnsatisfiedRequirementIdentifiers:](self, "_rescindedAlertTitleKeyForUnsatisfiedRequirementIdentifiers:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      -[HDHRAFibBurdenRescindedNotificationManager _rescindedAlertBodyKeyForUnsatisfiedRequirementIdentifiers:](self, "_rescindedAlertBodyKeyForUnsatisfiedRequirementIdentifiers:", v14);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (__CFString *)v16;
      if (!v15 || !v16)
      {
        objc_msgSend(v7, "unsatisfiedRequirementIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          -[HDHRAFibBurdenRescindedNotificationManager _queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:].cold.2();

        v17 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_BODY");
        v15 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_TITLE");
      }
      -[HDHRAFibBurdenRescindedNotificationManager _showRescindedNotificationWithTitleKey:bodyKey:](self, "_showRescindedNotificationWithTitleKey:bodyKey:", v15, v17);
      v21 = self->_localKeyValueDomain;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      -[HDKeyValueDomain setDate:forKey:error:](v21, "setDate:forKey:error:", v22, CFSTR("HDHRAFibBurdenNotificationsDisabledNotificationShownDateKey"), &v29);
      v23 = v29;

      if (v23)
      {
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[HDHRAFibBurdenRescindedNotificationManager _queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:].cold.1();

      }
    }
    else
    {
      if (!v10)
      {
LABEL_9:
        -[HDHRAFibBurdenRescindedNotificationManager _unitTesting_postNotificationRequestIfNecessary:](self, "_unitTesting_postNotificationRequestIfNecessary:", 0);
LABEL_10:

        goto LABEL_11;
      }
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = self;
        v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_1CC29C000, v25, OS_LOG_TYPE_DEFAULT, "[%@] AFib Burden is not rescinded (last shown date: %@)", buf, 0x16u);
      }

      -[HDHRAFibBurdenRescindedNotificationManager _showRescindedNotificationWithTitleKey:bodyKey:](self, "_showRescindedNotificationWithTitleKey:bodyKey:", CFSTR("AFIB_BURDEN_REENABLED_NOTIFICATION_TITLE"), CFSTR("AFIB_BURDEN_REENABLED_NOTIFICATION_BODY"));
      v26 = self->_localKeyValueDomain;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("HDHRAFibBurdenNotificationsDisabledNotificationShownDateKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      -[HDKeyValueDomain removeValuesForKeys:error:](v26, "removeValuesForKeys:error:", v27, &v28);
      v14 = v28;

      if (!v14)
      {
LABEL_33:

        goto LABEL_10;
      }
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[HDHRAFibBurdenRescindedNotificationManager _queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:].cold.3();
    }

    goto LABEL_33;
  }
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = self;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%@] AFib Burden is unavailable for non-rescinding reasons", buf, 0xCu);
  }

  -[HDHRAFibBurdenRescindedNotificationManager _unitTesting_postNotificationRequestIfNecessary:](self, "_unitTesting_postNotificationRequestIfNecessary:", 0);
LABEL_11:

}

- (void)_showRescindedNotificationWithTitleKey:(id)a3 bodyKey:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v6, "localizedUserNotificationStringForKey:arguments:", a3, MEMORY[0x1E0C9AA60]);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v10, "setTitle:", v20);
  objc_msgSend(v10, "setBody:", v9);
  objc_msgSend(v10, "setCategoryIdentifier:", CFSTR("HeartAppPlugin.AFibBurden.Rescinded"));
  objc_msgSend(v10, "setThreadIdentifier:", CFSTR("HeartAppPlugin.AFibBurden.Rescinded"));
  objc_msgSend(MEMORY[0x1E0CEC6E8], "soundWithAlertType:", 25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSound:", v11);
  objc_msgSend(v10, "setDate:", v12);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_dateByAddingDays:toDate:", 1, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExpirationDate:", v14);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", MEMORY[0x1E0C9AA70]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCreateURLForSampleType();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CB7770]);

  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E87FED98, *MEMORY[0x1E0CB7760]);
  objc_msgSend(v10, "setUserInfo:", v15);
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", CFSTR("HeartAppPlugin.AFibBurden.Rescinded"), v10, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRAFibBurdenRescindedNotificationManager _sendNotificationRequest:](self, "_sendNotificationRequest:", v19);

}

- (void)_sendNotificationRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke;
  v6[3] = &unk_1E87EFB30;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = (id)objc_opt_class();
    v3 = v9;
    _os_log_impl(&dword_1CC29C000, v2, OS_LOG_TYPE_DEFAULT, "[%@] About to show AFib Burden rescind notification", buf, 0xCu);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_unitTesting_postNotificationRequestIfNecessary:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "notificationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke_211;
    v7[3] = &unk_1E87EFB60;
    v6 = *(_QWORD *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "postNotificationWithRequest:completion:", v6, v7);

  }
}

void __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke_211(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke_211_cold_1(a1, (uint64_t)v4, v5);

  }
}

- (BOOL)_unitTesting_postNotificationRequestIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v4 = a3;
  -[HDHRAFibBurdenRescindedNotificationManager unitTesting_postNotificationHandler](self, "unitTesting_postNotificationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HDHRAFibBurdenRescindedNotificationManager unitTesting_postNotificationHandler](self, "unitTesting_postNotificationHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);

  }
  return v5 != 0;
}

- (id)_rescindedRequirementIdentifiers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0CB4FC0];
  v8[0] = *MEMORY[0x1E0CB4F50];
  v8[1] = v3;
  v4 = *MEMORY[0x1E0CB4F30];
  v8[2] = *MEMORY[0x1E0CB4F38];
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_rescindedAlertTitleKeyForUnsatisfiedRequirementIdentifiers:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB4F30]) & 1) != 0)
  {
    v4 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_WATCH_UNSUPPORTED_REGION_ALERT_TITLE");
  }
  else if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB4F38]) & 1) != 0)
  {
    v4 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_UNSUPPORTED_REGION_ALERT_TITLE");
  }
  else if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB4F50]) & 1) != 0)
  {
    v4 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_REMOTELY_DISABLED_ALERT_TITLE");
  }
  else if (objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB4FC0]))
  {
    v4 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_SEED_EXPIRED_ALERT_TITLE");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (id)_rescindedAlertBodyKeyForUnsatisfiedRequirementIdentifiers:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB4F30]) & 1) != 0)
  {
    v4 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_WATCH_UNSUPPORTED_REGION_ALERT_BODY");
  }
  else if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB4F38]) & 1) != 0)
  {
    v4 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_UNSUPPORTED_REGION_ALERT_BODY");
  }
  else if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB4F50]) & 1) != 0)
  {
    v4 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_REMOTELY_DISABLED_ALERT_BODY");
  }
  else if (objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB4FC0]))
  {
    v4 = CFSTR("AFIB_BURDEN_RESCINDED_NOTIFICATION_SEED_EXPIRED_ALERT_BODY");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (BOOL)_isFeatureRescindedWithRequirementsEvaluation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  HDHRAFibBurdenRescindedNotificationManager *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDHRAFibBurdenRescindedNotificationManager _rescindedRequirementIdentifiers](self, "_rescindedRequirementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsatisfiedRequirementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking feature status for rescinding reasons: %{public}@", buf, 0x16u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "unsatisfiedRequirementIdentifiers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  return v10;
}

- (BOOL)_isFeatureUnavailableForNonRescindedReasonsWithRequirementsEvaluation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  HDHRAFibBurdenRescindedNotificationManager *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDHRAFibBurdenRescindedNotificationManager _rescindedRequirementIdentifiers](self, "_rescindedRequirementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsatisfiedRequirementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking feature status for non-rescinding reasons: %{public}@", buf, 0x16u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "unsatisfiedRequirementIdentifiers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)))
        {
          LOBYTE(v10) = 1;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  return v10;
}

- (id)unitTesting_postNotificationHandler
{
  return self->_unitTesting_postNotificationHandler;
}

- (void)setUnitTesting_postNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)unitTesting_skipDatabaseObservation
{
  return self->_unitTesting_skipDatabaseObservation;
}

- (void)setUnitTesting_skipDatabaseObservation:(BOOL)a3
{
  self->_unitTesting_skipDatabaseObservation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_postNotificationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Failed to save last shown date with error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CC29C000, v0, OS_LOG_TYPE_FAULT, "[%@] Computing notification for unsupported reasons: %@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Failed to reset last shown date with error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Could not load alert's last shown date with error: %@");
  OUTLINED_FUNCTION_2();
}

void __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke_211_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_1CC29C000, a3, OS_LOG_TYPE_ERROR, "[%@] error requesting notification: %@)", (uint8_t *)&v6, 0x16u);

}

@end
