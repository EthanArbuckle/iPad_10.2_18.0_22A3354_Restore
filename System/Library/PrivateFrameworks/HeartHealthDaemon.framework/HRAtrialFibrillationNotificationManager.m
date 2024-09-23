@implementation HRAtrialFibrillationNotificationManager

- (HRAtrialFibrillationNotificationManager)initWithProfile:(id)a3 availabilityManager:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  HRAtrialFibrillationNotificationManager *v10;

  v6 = (objc_class *)MEMORY[0x1E0CB6730];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFeatureAvailabilityProviding:healthDataSource:", v7, v8);

  v10 = -[HRAtrialFibrillationNotificationManager initWithProfile:featureStatusManager:](self, "initWithProfile:featureStatusManager:", v8, v9);
  return v10;
}

- (HRAtrialFibrillationNotificationManager)initWithProfile:(id)a3 featureStatusManager:(id)a4
{
  id v6;
  id v7;
  HRAtrialFibrillationNotificationManager *v8;
  HRAtrialFibrillationNotificationManager *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  UNUserNotificationCenter *userNotificationCenter;
  uint64_t v15;
  NSMutableArray *fakingNotificationTokens;
  void *v17;
  id WeakRetained;
  uint64_t v19;
  HDKeyValueDomain *localKeyValueDomain;
  void *v21;
  id v22;
  uint64_t v23;
  HDKeyValueDomain *syncedKeyValueDomain;
  UNUserNotificationCenter *v25;
  HRAtrialFibrillationNotificationManager *v26;
  HRAtrialFibrillationAnalyticsCollector *v27;
  id v28;
  uint64_t v29;
  HRAtrialFibrillationAnalyticsCollector *analyticsCollector;
  id v31;
  void *v32;
  _QWORD v34[4];
  HRAtrialFibrillationNotificationManager *v35;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HRAtrialFibrillationNotificationManager;
  v8 = -[HRAtrialFibrillationNotificationManager init](&v36, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_statusManager, a4);
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x1E0CEC7A0]);
    v13 = objc_msgSend(v12, "initWithBundleIdentifier:", *MEMORY[0x1E0D2FB50]);
    userNotificationCenter = v9->_userNotificationCenter;
    v9->_userNotificationCenter = (UNUserNotificationCenter *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    fakingNotificationTokens = v9->_fakingNotificationTokens;
    v9->_fakingNotificationTokens = (NSMutableArray *)v15;

    v17 = (void *)MEMORY[0x1E0D294B8];
    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(v17, "hdhr_heartRhythmProtectedLocalDomainForProfile:", WeakRetained);
    v19 = objc_claimAutoreleasedReturnValue();
    localKeyValueDomain = v9->_localKeyValueDomain;
    v9->_localKeyValueDomain = (HDKeyValueDomain *)v19;

    v21 = (void *)MEMORY[0x1E0D294B8];
    v22 = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(v21, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    syncedKeyValueDomain = v9->_syncedKeyValueDomain;
    v9->_syncedKeyValueDomain = (HDKeyValueDomain *)v23;

    v25 = v9->_userNotificationCenter;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __80__HRAtrialFibrillationNotificationManager_initWithProfile_featureStatusManager___block_invoke;
    v34[3] = &unk_1E87EFB60;
    v26 = v9;
    v35 = v26;
    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](v25, "requestAuthorizationWithOptions:completionHandler:", 6, v34);
    v27 = [HRAtrialFibrillationAnalyticsCollector alloc];
    v28 = objc_loadWeakRetained((id *)&v9->_profile);
    v29 = -[HRAtrialFibrillationAnalyticsCollector initWithProfile:](v27, "initWithProfile:", v28);
    analyticsCollector = v26->_analyticsCollector;
    v26->_analyticsCollector = (HRAtrialFibrillationAnalyticsCollector *)v29;

    -[HRAtrialFibrillationNotificationManager _subscribeToFakingNotifications](v26, "_subscribeToFakingNotifications");
    v31 = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(v31, "daemon");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "registerForDaemonReady:", v26);

  }
  return v9;
}

void __80__HRAtrialFibrillationNotificationManager_initWithProfile_featureStatusManager___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __80__HRAtrialFibrillationNotificationManager_initWithProfile_featureStatusManager___block_invoke_cold_1(a1, v6);
  }

}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "atrialFibrillationEventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forDataType:", self, v5);

  -[HRAtrialFibrillationNotificationManager _unsubscribeToFakingNotifications](self, "_unsubscribeToFakingNotifications");
  v6.receiver = self;
  v6.super_class = (Class)HRAtrialFibrillationNotificationManager;
  -[HRAtrialFibrillationNotificationManager dealloc](&v6, sel_dealloc);
}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "atrialFibrillationEventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forDataType:", self, v5);

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *queue;
  _QWORD v12[4];
  id v13;
  HRAtrialFibrillationNotificationManager *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "healthAppHiddenOrNotInstalled");

  if (v7)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      HRLogSensitiveClassName();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring event, health app is hidden or deleted.", buf, 0xCu);

    }
  }
  else
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__HRAtrialFibrillationNotificationManager_samplesAdded_anchor___block_invoke;
    v12[3] = &unk_1E87EFB30;
    v13 = v5;
    v14 = self;
    dispatch_async(queue, v12);

  }
}

void __63__HRAtrialFibrillationNotificationManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v19;
    *(_QWORD *)&v3 = 138543618;
    v16 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "sourceRevision", v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "_isAppleWatch") & 1) != 0)
        {
          objc_msgSend(v7, "sourceRevision");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "source");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "_isLocalDevice");

          if ((v12 & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "_queue_addNotificationRequestForAtrialFibrillationEvent:", v7);
            continue;
          }
        }
        else
        {

        }
        _HKInitializeLogging();
        v13 = (void *)*MEMORY[0x1E0CB52F0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          HRLogSensitiveClassName();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v16;
          v23 = v15;
          v24 = 2112;
          v25 = v7;
          _os_log_impl(&dword_1CC29C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring event without first party / local device source: %@", buf, 0x16u);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v4);
  }

}

- (void)_queue_addNotificationRequestForAtrialFibrillationEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  char v15;
  UNUserNotificationCenter *userNotificationCenter;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_NOTIFICATION_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_NOTIFICATION_BODY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBody:", v7);

  objc_msgSend(v5, "setCategoryIdentifier:", CFSTR("IrregularHeartRhythm"));
  objc_msgSend(v5, "setThreadIdentifier:", CFSTR("IrregularHeartRhythm"));
  objc_msgSend(MEMORY[0x1E0CEC6E8], "soundWithAlertType:", 25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlertTopic:", *MEMORY[0x1E0DBF768]);
  objc_msgSend(v5, "setSound:", v8);
  v9 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(v4, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestWithIdentifier:content:trigger:", v11, v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = objc_msgSend(v14, "areHealthNotificationsAuthorized");
  else
    v15 = 0;
  userNotificationCenter = self->_userNotificationCenter;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99__HRAtrialFibrillationNotificationManager__queue_addNotificationRequestForAtrialFibrillationEvent___block_invoke;
  v20[3] = &unk_1E87F0730;
  objc_copyWeak(&v24, &location);
  v17 = v12;
  v21 = v17;
  v18 = v5;
  v22 = v18;
  v19 = v4;
  v23 = v19;
  v25 = v15;
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v17, v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __99__HRAtrialFibrillationNotificationManager__queue_addNotificationRequestForAtrialFibrillationEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDHRNotificationAnalytics *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52F0];
  v5 = *MEMORY[0x1E0CB52F0];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __99__HRAtrialFibrillationNotificationManager__queue_addNotificationRequestForAtrialFibrillationEvent___block_invoke_cold_1((id *)a1, v4, (uint64_t)v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v4;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      HRLogSensitiveClassName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "categoryIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested notification (%{public}@ - %{public}@)", (uint8_t *)&v13, 0x20u);

    }
    v12 = -[HDHRNotificationAnalytics initWithEventSample:areHealthNotificationsAuthorized:]([HDHRNotificationAnalytics alloc], "initWithEventSample:areHealthNotificationsAuthorized:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
    -[HDHRNotificationAnalytics submit](v12, "submit");

  }
}

- (void)_addNotificationRequestForCompanionSoftwareVersionIsTooOld
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_DISABLED_NOTIFICATION_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_DISABLED_PHONE_NOTIFICATION_BODY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke;
  v7[3] = &unk_1E87F0758;
  objc_copyWeak(&v8, &location);
  -[HRAtrialFibrillationNotificationManager _presentNotificationWithTitle:message:cancelButtonTitle:defaultButtonTitle:otherButtonTitle:alertLevel:responseHandler:](self, "_presentNotificationWithTitle:message:cancelButtonTitle:defaultButtonTitle:otherButtonTitle:alertLevel:responseHandler:", v3, v4, 0, 0, 0, 0, v7);

  _HKInitializeLogging();
  v5 = (id)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HRLogSensitiveClassName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested companion software version is too old notification", buf, 0xCu);

  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;

  v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(a1, v6);
  }

}

- (void)_addNotificationRequestForWatchSoftwareVersionIsTooOld
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_DISABLED_WATCH_NOTIFICATION_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_DISABLED_WATCH_NOTIFICATION_BODY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__HRAtrialFibrillationNotificationManager__addNotificationRequestForWatchSoftwareVersionIsTooOld__block_invoke;
  v7[3] = &unk_1E87F0758;
  objc_copyWeak(&v8, &location);
  -[HRAtrialFibrillationNotificationManager _presentNotificationWithTitle:message:cancelButtonTitle:defaultButtonTitle:otherButtonTitle:alertLevel:responseHandler:](self, "_presentNotificationWithTitle:message:cancelButtonTitle:defaultButtonTitle:otherButtonTitle:alertLevel:responseHandler:", v3, v4, 0, 0, 0, 0, v7);

  _HKInitializeLogging();
  v5 = (id)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HRLogSensitiveClassName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested Watch software version is too old notification", buf, 0xCu);

  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __97__HRAtrialFibrillationNotificationManager__addNotificationRequestForWatchSoftwareVersionIsTooOld__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;

  v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(a1, v6);
  }

}

- (BOOL)_queue_isCompanionSoftwareVersionTooOld
{
  HKFeatureStatusManager *statusManager;
  void *v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  statusManager = self->_statusManager;
  v12 = 0;
  -[HKFeatureStatusManager featureStatusWithError:](statusManager, "featureStatusWithError:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isOnboardingRecordPresent");
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4F30]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = v6 & (v9 ^ 1);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationNotificationManager _queue_isCompanionSoftwareVersionTooOld].cold.1();
    v10 = 0;
  }

  return v10;
}

- (BOOL)isCompanionSoftwareVersionTooOld
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__HRAtrialFibrillationNotificationManager_isCompanionSoftwareVersionTooOld__block_invoke;
  v5[3] = &unk_1E87EFE50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__HRAtrialFibrillationNotificationManager_isCompanionSoftwareVersionTooOld__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isCompanionSoftwareVersionTooOld");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_isWatchSoftwareVersionTooOld
{
  HKFeatureStatusManager *statusManager;
  void *v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  statusManager = self->_statusManager;
  v12 = 0;
  -[HKFeatureStatusManager featureStatusWithError:](statusManager, "featureStatusWithError:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isOnboardingRecordPresent");
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4F38]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = v6 & (v9 ^ 1);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationNotificationManager _queue_isWatchSoftwareVersionTooOld].cold.1();
    v10 = 0;
  }

  return v10;
}

- (BOOL)isWatchSoftwareVersionTooOld
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationNotificationManager_isWatchSoftwareVersionTooOld__block_invoke;
  v5[3] = &unk_1E87EFE50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__HRAtrialFibrillationNotificationManager_isWatchSoftwareVersionTooOld__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isWatchSoftwareVersionTooOld");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)notifyUserThatAntimonyIsUnavailableForiOSVersionIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("OldCompanionVersionNotificationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HRAtrialFibrillationNotificationManager _addNotificationRequestForCompanionSoftwareVersionIsTooOld](self, "_addNotificationRequestForCompanionSoftwareVersionIsTooOld");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("OldCompanionVersionNotificationDate"));

  }
}

- (void)notifyUserThatAntimonyIsUnavailableForWatchOSVersionIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("OldWatchVersionNotificationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HRAtrialFibrillationNotificationManager _addNotificationRequestForWatchSoftwareVersionIsTooOld](self, "_addNotificationRequestForWatchSoftwareVersionIsTooOld");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("OldWatchVersionNotificationDate"));

  }
}

- (void)_presentNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 alertLevel:(int64_t)a8 responseHandler:(id)a9
{
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v15 = (objc_class *)MEMORY[0x1E0D298D0];
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = objc_alloc_init(v15);
  objc_msgSend(v22, "setTitle:", v21);

  objc_msgSend(v22, "setMessage:", v20);
  objc_msgSend(v22, "setCancelButton:", v19);

  objc_msgSend(v22, "setDefaultButton:", v18);
  objc_msgSend(v22, "setOtherButton:", v17);

  objc_msgSend(v22, "setAlertLevel:", a8);
  objc_msgSend(v22, "presentWithResponseHandler:", v16);

}

- (int64_t)_atrialFibrillationDetectionRescindedStatusForFeatureStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int64_t v9;

  v3 = a3;
  if (objc_msgSend(v3, "isOnboardingRecordPresent"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4FC0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4F50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v6)
      v9 = v8 ^ 1u;
    else
      v9 = 2;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isPairedSyncCompleted
{
  return 1;
}

- (BOOL)_allowAtrialFibrillationDisableOrReEnableRemotelyAlertWithFeatureStatus:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[HRAtrialFibrillationNotificationManager _isPairedSyncCompleted](self, "_isPairedSyncCompleted"))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = *MEMORY[0x1E0CB4F50];
    v29[0] = *MEMORY[0x1E0CB4FC0];
    v29[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unsatisfiedRequirementIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "isSubsetOfSet:", v9);

    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      HRLogSensitiveClassName();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_1CC29C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Can present rescinded or re-enabled alert: %{public}@; unsatisfied requirements: %{public}@",
        (uint8_t *)&v23,
        0x20u);

    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x1E0CB52F0];
    LOBYTE(v13) = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      HRLogSensitiveClassName();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2114;
      v26 = v21;
      _os_log_impl(&dword_1CC29C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> NO, paired sync not completed", (uint8_t *)&v23, 0x16u);

      LOBYTE(v13) = 0;
    }
  }

  return (char)v13;
}

- (void)presentAtrialFibrillationDetectionRescindedAlertIfNeeded
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to retrieve IRN's feature status; unable to check if rescinded: %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2_0();
}

void __99__HRAtrialFibrillationNotificationManager_presentAtrialFibrillationDetectionRescindedAlertIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  os_log_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *log;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_atrialFibrillationDetectionRescindedStatusForFeatureStatus:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(*(_QWORD *)v2 + 56);
  v5 = *MEMORY[0x1E0CB7558];
  v29 = 0;
  objc_msgSend(v4, "dateForKey:error:", v5, &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB52F0];
  v9 = (void *)*MEMORY[0x1E0CB52F0];
  v10 = *MEMORY[0x1E0CB52F0];
  if (v7)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v15 = v9;
    HRLogSensitiveClassName();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v20 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v18;
    v32 = 2114;
    v33 = v20;
    v34 = 2114;
    v35 = v7;
    _os_log_error_impl(&dword_1CC29C000, v15, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Failed to load notification shown date with error: %{public}@", buf, 0x20u);

    goto LABEL_13;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    HRLogSensitiveClassName();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v11 = objc_claimAutoreleasedReturnValue();
    NSStringFromHKFeatureAvailabilityRescindedStatus();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v31 = v26;
    v32 = 2114;
    v33 = v11;
    v34 = 2112;
    v35 = v13;
    v36 = 2112;
    v37 = v14;
    v38 = 2112;
    v39 = 0;
    _os_log_impl(&dword_1CC29C000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> IRN rescinded status: %@, IRN disabled notification shown date %@ with error: %@", buf, 0x34u);

    v8 = (os_log_t *)MEMORY[0x1E0CB52F0];
  }
  if (v3)
  {
    if (v6)
      goto LABEL_3;
    objc_msgSend(*(id *)(a1 + 32), "_presentAtrialFibrillationDetectionAlertWithRescindedStatus:", v3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queue_setAtrialFibrillationDetectionDisabledNotificationShownDate:", v15);
    objc_msgSend(*(id *)(a1 + 40), "onboardingRecord");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "onboardingCompletion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "countryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "collectAnalyticsForRemoteDisableMessageShownForOnboardingCountryCode:", v18);
    _HKInitializeLogging();
    v19 = *v8;
    if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      goto LABEL_3;
    }
    v20 = v19;
    HRLogSensitiveClassName();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v23 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v21;
    v32 = 2114;
    v33 = v23;
    _os_log_impl(&dword_1CC29C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduling the IRN disabled notification", buf, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v24 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT))
    __99__HRAtrialFibrillationNotificationManager_presentAtrialFibrillationDetectionRescindedAlertIfNeeded__block_invoke_cold_1(v2, v24);
LABEL_3:

}

- (void)_presentAtrialFibrillationDetectionAlertWithRescindedStatus:(int64_t)a3
{
  __CFString *v3;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = &stru_1E87F0B08;
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v6 = CFSTR("ATRIAL_FIBRILLATION_DISABLED_REMOTELY_WATCH_NOTIFICATION_BODY");
      goto LABEL_6;
    case 2:
      v6 = CFSTR("ATRIAL_FIBRILLATION_EXPIRED_SEED_WATCH_NOTIFICATION_BODY");
LABEL_6:
      HRLocalizedStringWithKey(v6);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_initWeak(&location, self);
  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_DISABLED_REMOTELY_WATCH_NOTIFICATION_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__HRAtrialFibrillationNotificationManager__presentAtrialFibrillationDetectionAlertWithRescindedStatus___block_invoke;
  v12[3] = &unk_1E87F0758;
  objc_copyWeak(&v13, &location);
  -[HRAtrialFibrillationNotificationManager _presentNotificationWithTitle:message:cancelButtonTitle:defaultButtonTitle:otherButtonTitle:alertLevel:responseHandler:](self, "_presentNotificationWithTitle:message:cancelButtonTitle:defaultButtonTitle:otherButtonTitle:alertLevel:responseHandler:", v7, v3, 0, 0, 0, 3, v12);

  _HKInitializeLogging();
  v8 = (id)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HRLogSensitiveClassName();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduling IRN disabled notification and resetting IRN disabled notification shown date", buf, 0x16u);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_10:

}

void __103__HRAtrialFibrillationNotificationManager__presentAtrialFibrillationDetectionAlertWithRescindedStatus___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;

  v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(a1, v6);
  }

}

- (void)presentAtrialFibrillationDetectionReEnabledAlertIfNeeded
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to retrieve IRN's feature status; unable to check if no longer rescinded: %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2_0();
}

void __99__HRAtrialFibrillationNotificationManager_presentAtrialFibrillationDetectionReEnabledAlertIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *log;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_atrialFibrillationDetectionRescindedStatusForFeatureStatus:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v4 = *MEMORY[0x1E0CB7558];
  v23 = 0;
  objc_msgSend(v3, "dateForKey:error:", v4, &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v23;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB52F0];
  v8 = *MEMORY[0x1E0CB52F0];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      HRLogSensitiveClassName();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v10;
      v26 = 2114;
      v27 = v12;
      v28 = 2114;
      v29 = v6;
      _os_log_error_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Failed to load notification shown date with error: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      log = v7;
      HRLogSensitiveClassName();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 != 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v21;
      v26 = 2114;
      v27 = v14;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_1CC29C000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> IRN disabled: %@, IRN disabled notification shown date: %@ ", buf, 0x2Au);

    }
    if (!v2 && v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentAtrialFibrillationDetectionReEnabledAlert");
      objc_msgSend(*(id *)(a1 + 40), "onboardingRecord");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "onboardingCompletion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "countryCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "collectAnalyticsForRemoteReEnableMessageShownForOnboardingCountryCode:", v20);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_setAtrialFibrillationDetectionDisabledNotificationShownDate:", 0);
  }

}

- (void)_presentAtrialFibrillationDetectionReEnabledAlert
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_REENABLED_REMOTELY_WATCH_NOTIFICATION_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedStringWithKey(CFSTR("ATRIAL_FIBRILLATION_REENABLED_REMOTELY_WATCH_NOTIFICATION_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__HRAtrialFibrillationNotificationManager__presentAtrialFibrillationDetectionReEnabledAlert__block_invoke;
  v10[3] = &unk_1E87F0758;
  objc_copyWeak(&v11, &location);
  -[HRAtrialFibrillationNotificationManager _presentNotificationWithTitle:message:cancelButtonTitle:defaultButtonTitle:otherButtonTitle:alertLevel:responseHandler:](self, "_presentNotificationWithTitle:message:cancelButtonTitle:defaultButtonTitle:otherButtonTitle:alertLevel:responseHandler:", v4, v5, 0, 0, 0, 3, v10);

  _HKInitializeLogging();
  v6 = (id)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HRLogSensitiveClassName();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduling IRN re-enabled notification and resetting IRN disabled notification shown date", buf, 0x16u);

  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __92__HRAtrialFibrillationNotificationManager__presentAtrialFibrillationDetectionReEnabledAlert__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;

  v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(a1, v6);
  }

}

- (void)_queue_setAtrialFibrillationDetectionDisabledNotificationShownDate:(id)a3
{
  NSObject *queue;
  id v5;
  HDKeyValueDomain *localKeyValueDomain;
  uint64_t v7;
  uint64_t v8;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  localKeyValueDomain = self->_localKeyValueDomain;
  v7 = *MEMORY[0x1E0CB7558];
  v8 = 0;
  -[HDKeyValueDomain setDate:forKey:error:](localKeyValueDomain, "setDate:forKey:error:", v5, v7, &v8);

}

- (id)_getProductVersionWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKFeatureStatusManager featureAvailabilityProviding](self->_statusManager, "featureAvailabilityProviding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedFeatureAttributesWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "watchAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_queue_fakeNotificationWithData:(BOOL)a3
{
  _BOOL8 v3;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  NSObject **v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  HDHRHealthKitSyncManager *v29;
  id v30;
  HDHRHealthKitSyncManager *v31;
  id WeakRetained;
  id v33;
  id *location;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x1E0CB52F0];
  v6 = (void *)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    HRLogSensitiveClassName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v8;
    v44 = 2112;
    v45 = v9;
    _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ faking atrial fibrillation notification, withData: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  -[HRAtrialFibrillationNotificationManager _getProductVersionWithError:](self, "_getProductVersionWithError:", &v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v38;
  if (v11)
  {
    v40 = *MEMORY[0x1E0CB7258];
    v41 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB6378];
    objc_msgSend(MEMORY[0x1E0CB6380], "atrialFibrillationEventType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "categorySampleWithType:value:startDate:endDate:metadata:", v15, 0, v10, v10, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v35 = v13;
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "dataManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v16;
      v39 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      location = (id *)&self->_profile;
      v19 = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(v19, "dataProvenanceManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "defaultLocalDataProvenance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v12;
      v22 = objc_msgSend(v17, "insertDataObjects:withProvenance:creationDate:error:", v18, v21, &v37, CFAbsoluteTimeGetCurrent());
      v33 = v37;

      v23 = (NSObject **)MEMORY[0x1E0CB52F0];
      _HKInitializeLogging();
      v24 = *v23;
      v25 = *v23;
      if (v22)
      {
        v26 = v33;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v24;
          HRLogSensitiveClassName();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v28;
          v44 = 2112;
          v45 = v36;
          _os_log_impl(&dword_1CC29C000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ faking - saved event sample: %@", buf, 0x16u);

        }
      }
      else
      {
        v26 = v33;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[HRAtrialFibrillationNotificationManager _queue_fakeNotificationWithData:].cold.2();
      }
      v16 = v36;
      -[HRAtrialFibrillationNotificationManager _queue_fakeHeartbeatSeriesSamplesForEvent:](self, "_queue_fakeHeartbeatSeriesSamplesForEvent:", v36);
      v29 = [HDHRHealthKitSyncManager alloc];
      v30 = objc_loadWeakRetained(location);
      v31 = -[HDHRHealthKitSyncManager initWithProfile:](v29, "initWithProfile:", v30);

      -[HDHRHealthKitSyncManager triggerImmediateSyncWithReason:loggingCategory:](v31, "triggerImmediateSyncWithReason:loggingCategory:", CFSTR("New fake Atrial Fibrillation / Antimony Notification sample added"), *v23);
      v12 = v26;
      v13 = v35;
    }
    else
    {
      -[HRAtrialFibrillationNotificationManager _queue_addNotificationRequestForAtrialFibrillationEvent:](self, "_queue_addNotificationRequestForAtrialFibrillationEvent:", v16);
    }

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationNotificationManager _queue_fakeNotificationWithData:].cold.1();
  }

}

- (void)_queue_fakeHeartbeatSeriesSamplesForEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  CFAbsoluteTime Current;
  int v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  HDKeyValueDomain *syncedKeyValueDomain;
  uint64_t v36;
  char v37;
  id v38;
  __int128 v39;
  id *location;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = 0;
  location = (id *)&self->_profile;
  v42 = a3;
  v5 = -21600;
  *(_QWORD *)&v6 = 138543618;
  v39 = v6;
  do
  {
    v7 = v4;
    objc_msgSend(v42, "startDate", v39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", (double)v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v9;
    -[HRAtrialFibrillationNotificationManager _queue_fakeHeartbeatSeriesSampleFromDate:](self, "_queue_fakeHeartbeatSeriesSampleFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v45 = objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "dataManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained(location);
    objc_msgSend(v14, "dataProvenanceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "defaultLocalDataProvenance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v48 = v3;
    v18 = objc_msgSend(v12, "insertDataObjects:withProvenance:creationDate:error:", v13, v16, &v48, Current);
    v43 = v48;

    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x1E0CB52F0];
    v20 = *MEMORY[0x1E0CB52F0];
    if (!v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v33 = v19;
        HRLogSensitiveClassName();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v39;
        v51 = v34;
        v52 = 2114;
        v3 = v43;
        v53 = v43;
        _os_log_error_impl(&dword_1CC29C000, v33, OS_LOG_TYPE_ERROR, "%{public}@ faking - failed to save heartbeat series with error: %{public}@", buf, 0x16u);

      }
      else
      {
        v3 = v43;
      }
LABEL_10:
      v30 = v44;
      v4 = (void *)v45;
      goto LABEL_11;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v19;
      HRLogSensitiveClassName();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v39;
      v51 = v22;
      v52 = 2112;
      v53 = v10;
      _os_log_impl(&dword_1CC29C000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ faking - saved heartbeat series: %@", buf, 0x16u);

    }
    v23 = objc_loadWeakRetained(location);
    objc_msgSend(v23, "associationManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v43;
    v28 = objc_msgSend(v24, "associateObjectUUIDs:objectUUID:error:", v26, v27, &v47);
    v3 = v47;

    if ((v28 & 1) != 0)
      goto LABEL_10;
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x1E0CB52F0];
    v30 = v44;
    v4 = (void *)v45;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    {
      v31 = v29;
      HRLogSensitiveClassName();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v39;
      v51 = v32;
      v52 = 2114;
      v53 = v3;
      _os_log_error_impl(&dword_1CC29C000, v31, OS_LOG_TYPE_ERROR, "%{public}@ faking - failed to associate heartbeat series with error: %{public}@", buf, 0x16u);

    }
LABEL_11:

    v5 += 3600;
  }
  while (v5 != -3600);
  syncedKeyValueDomain = self->_syncedKeyValueDomain;
  v36 = *MEMORY[0x1E0CB7730];
  v46 = v3;
  v37 = -[HDKeyValueDomain setDate:forKey:error:](syncedKeyValueDomain, "setDate:forKey:error:", v4, v36, &v46);
  v38 = v46;

  if ((v37 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationNotificationManager _queue_fakeHeartbeatSeriesSamplesForEvent:].cold.1();
  }

}

- (id)_queue_fakeHeartbeatSeriesSampleFromDate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 960);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = 0.0;
  do
  {
    v6 = v6 + (double)arc4random_uniform(0xC8u) / 1000.0 + -0.1 + 1.0;
    v10[1] = 0;
    *(double *)v10 = v6;
    objc_msgSend(v4, "replaceBytesInRange:withBytes:", v5, 16, v10);
    v5 += 16;
  }
  while (v5 != 960);
  objc_msgSend(v3, "dateByAddingTimeInterval:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB67C0], "heartbeatSequenceSampleWithData:startDate:endDate:metadata:", v4, v3, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_subscribeToFakingNotifications
{
  const char *v3;
  NSObject *queue;
  uint64_t v5;
  NSMutableArray *fakingNotificationTokens;
  void *v7;
  const char *v8;
  NSObject *v9;
  NSMutableArray *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  int v14;
  _QWORD handler[4];
  id v16;
  int out_token;
  id location;

  objc_initWeak(&location, self);
  out_token = 0;
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.HeartRhythm.AtrialFibrillation"), "UTF8String");
  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __74__HRAtrialFibrillationNotificationManager__subscribeToFakingNotifications__block_invoke;
  handler[3] = &unk_1E87EFCE0;
  objc_copyWeak(&v16, &location);
  notify_register_dispatch(v3, &out_token, queue, handler);
  fakingNotificationTokens = self->_fakingNotificationTokens;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](fakingNotificationTokens, "addObject:", v7);

  v14 = 0;
  v8 = (const char *)objc_msgSend(CFSTR("com.apple.HeartRhythm.AtrialFibrillationWithData"), "UTF8String");
  v9 = self->_queue;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __74__HRAtrialFibrillationNotificationManager__subscribeToFakingNotifications__block_invoke_2;
  v12[3] = &unk_1E87EFCE0;
  objc_copyWeak(&v13, &location);
  notify_register_dispatch(v8, &v14, v9, v12);
  v10 = self->_fakingNotificationTokens;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v10, "addObject:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__HRAtrialFibrillationNotificationManager__subscribeToFakingNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_fakeNotificationWithData:", 0);
    WeakRetained = v2;
  }

}

void __74__HRAtrialFibrillationNotificationManager__subscribeToFakingNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_fakeNotificationWithData:", 1);
    WeakRetained = v2;
  }

}

- (void)_unsubscribeToFakingNotifications
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_fakingNotificationTokens;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "intValue", (_QWORD)v8);
        if (notify_is_valid_token(v7))
          notify_cancel(v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (HDKeyValueDomain)syncedKeyValueDomain
{
  return self->_syncedKeyValueDomain;
}

- (HDKeyValueDomain)localKeyValueDomain
{
  return self->_localKeyValueDomain;
}

- (HRAtrialFibrillationAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setAnalyticsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCollector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_syncedKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_fakingNotificationTokens, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statusManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __80__HRAtrialFibrillationNotificationManager_initWithProfile_featureStatusManager___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] UNUserNotificationCenter authorization request not granted for 'com.apple.HeartRate', error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __99__HRAtrialFibrillationNotificationManager__queue_addNotificationRequestForAtrialFibrillationEvent___block_invoke_cold_1(id *a1, void *a2, uint64_t a3)
{
  id *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a1 + 7;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  HRLogSensitiveClassName();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "categoryIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138544130;
  v12 = v8;
  v13 = 2114;
  v14 = v9;
  v15 = 2114;
  v16 = v10;
  v17 = 2114;
  v18 = a3;
  _os_log_error_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to request notification (%{public}@ - %{public}@): %{public}@)", (uint8_t *)&v11, 0x2Au);

}

void __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_3(a1, a2);
  v3 = OUTLINED_FUNCTION_6_2();
  HRLogSensitiveClassName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Notification handler responded with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_isCompanionSoftwareVersionTooOld
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to retrieve IRN's feature status; reporting 'onboarded country is supported on companion': %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_isWatchSoftwareVersionTooOld
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to retrieve IRN's feature status; reporting 'onboarded country is supported on this watch': %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2_0();
}

void __99__HRAtrialFibrillationNotificationManager_presentAtrialFibrillationDetectionRescindedAlertIfNeeded__block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HRLogSensitiveClassName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_1CC29C000, v2, OS_LOG_TYPE_FAULT, "[%{public}@] IRN does not meet usage requirements but is expected to", (uint8_t *)&v4, 0xCu);

}

- (void)_queue_fakeNotificationWithData:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] faking - failed to get version: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_fakeNotificationWithData:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "%{public}@ faking - failed to save event with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_fakeHeartbeatSeriesSamplesForEvent:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] faking - failed to set last analyzed sample date in protected key value store: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
