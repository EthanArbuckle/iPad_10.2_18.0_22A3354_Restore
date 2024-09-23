@implementation HRAtrialFibrillationEventDetector

- (HRAtrialFibrillationEventDetector)initWithProfile:(id)a3 availabilityManager:(id)a4 notificationManager:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HRAtrialFibrillationEventDetector *v13;

  v8 = (objc_class *)MEMORY[0x1E0CB6730];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithFeatureAvailabilityProviding:healthDataSource:", v10, v11);
  v13 = -[HRAtrialFibrillationEventDetector initWithProfile:availabilityManager:featureStatusManager:notificationManager:](self, "initWithProfile:availabilityManager:featureStatusManager:notificationManager:", v11, v10, v12, v9);

  return v13;
}

- (HRAtrialFibrillationEventDetector)initWithProfile:(id)a3 availabilityManager:(id)a4 featureStatusManager:(id)a5 notificationManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HRAtrialFibrillationEventDetector *v14;
  HRAtrialFibrillationEventDetector *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  void *v18;
  id WeakRetained;
  uint64_t v20;
  HDKeyValueDomain *localKeyValueDomain;
  void *v22;
  id v23;
  uint64_t v24;
  HDKeyValueDomain *syncedKeyValueDomain;
  HRAtrialFibrillationAnalyticsCollector *v26;
  id v27;
  uint64_t v28;
  HRAtrialFibrillationAnalyticsCollector *analyticsCollector;
  id v30;
  void *v31;
  void *v32;
  objc_super v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)HRAtrialFibrillationEventDetector;
  v14 = -[HRAtrialFibrillationEventDetector init](&v34, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_availabilityManager, a4);
    objc_storeStrong((id *)&v15->_notificationManager, a6);
    objc_storeStrong((id *)&v15->_statusManager, a5);
    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v18 = (void *)MEMORY[0x1E0D294B8];
    WeakRetained = objc_loadWeakRetained((id *)&v15->_profile);
    objc_msgSend(v18, "hdhr_heartRhythmProtectedLocalDomainForProfile:", WeakRetained);
    v20 = objc_claimAutoreleasedReturnValue();
    localKeyValueDomain = v15->_localKeyValueDomain;
    v15->_localKeyValueDomain = (HDKeyValueDomain *)v20;

    v22 = (void *)MEMORY[0x1E0D294B8];
    v23 = objc_loadWeakRetained((id *)&v15->_profile);
    objc_msgSend(v22, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    syncedKeyValueDomain = v15->_syncedKeyValueDomain;
    v15->_syncedKeyValueDomain = (HDKeyValueDomain *)v24;

    v26 = [HRAtrialFibrillationAnalyticsCollector alloc];
    v27 = objc_loadWeakRetained((id *)&v15->_profile);
    v28 = -[HRAtrialFibrillationAnalyticsCollector initWithProfile:](v26, "initWithProfile:", v27);
    analyticsCollector = v15->_analyticsCollector;
    v15->_analyticsCollector = (HRAtrialFibrillationAnalyticsCollector *)v28;

    v30 = objc_loadWeakRetained((id *)&v15->_profile);
    objc_msgSend(v30, "daemon");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "registerForDaemonReady:", v15);

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v15);

  }
  return v15;
}

- (void)dealloc
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forDataType:", self, v6);

  v7 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeProtectedDataObserver:", self);

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", self);

  if (notify_is_valid_token(self->_settingDidUpdateNotificationToken))
    notify_cancel(self->_settingDidUpdateNotificationToken);
  v10.receiver = self;
  v10.super_class = (Class)HRAtrialFibrillationEventDetector;
  -[HRAtrialFibrillationEventDetector dealloc](&v10, sel_dealloc);
}

- (id)_initWithAnalyticsCollector:(id)a3 availabilityManager:(id)a4 featureStatusManager:(id)a5 profile:(id)a6
{
  id v11;
  HRAtrialFibrillationEventDetector *v12;
  HRAtrialFibrillationEventDetector *v13;

  v11 = a3;
  v12 = -[HRAtrialFibrillationEventDetector initWithProfile:availabilityManager:featureStatusManager:notificationManager:](self, "initWithProfile:availabilityManager:featureStatusManager:notificationManager:", a6, a4, a5, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_analyticsCollector, a3);
    v13->__unitTesting = 1;
  }

  return v13;
}

- (NSArray)_unitTest_confirmationCycleSamples
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationEventDetector__unitTest_confirmationCycleSamples__block_invoke;
  v5[3] = &unk_1E87EFE50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __71__HRAtrialFibrillationEventDetector__unitTest_confirmationCycleSamples__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_confirmationCycleSamples");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSNumber)_unitTest_lastAlgorithmVersionUsed
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationEventDetector__unitTest_lastAlgorithmVersionUsed__block_invoke;
  v5[3] = &unk_1E87EFE50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __71__HRAtrialFibrillationEventDetector__unitTest_lastAlgorithmVersionUsed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_lastAlgorithmVersionUsed");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDate)_unitTest_latestAnalyzedSampleDate
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationEventDetector__unitTest_latestAnalyzedSampleDate__block_invoke;
  v5[3] = &unk_1E87EFE50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __71__HRAtrialFibrillationEventDetector__unitTest_latestAnalyzedSampleDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_latestAnalyzedSampleDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSNumber)_unitTest_lastAnalyzedSampleAnchor
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationEventDetector__unitTest_lastAnalyzedSampleAnchor__block_invoke;
  v5[3] = &unk_1E87EFE50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __71__HRAtrialFibrillationEventDetector__unitTest_lastAnalyzedSampleAnchor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_lastAnalyzedSampleAnchor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)daemonReady:(id)a3
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const char *v10;
  NSObject *queue;
  _QWORD handler[5];

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forDataType:", self, v7);

  v8 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addProtectedDataObserver:", self);

  v10 = (const char *)objc_msgSend(CFSTR("HKHeartRateSettingsDidChangeNotification"), "UTF8String");
  queue = self->_queue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __49__HRAtrialFibrillationEventDetector_daemonReady___block_invoke;
  handler[3] = &unk_1E87EFE78;
  handler[4] = self;
  notify_register_dispatch(v10, &self->_settingDidUpdateNotificationToken, queue, handler);
}

uint64_t __49__HRAtrialFibrillationEventDetector_daemonReady___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_detectionDisabled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueMaintainanceOperationForMissedTachograms");
  return result;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  if (a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__HRAtrialFibrillationEventDetector_database_protectedDataDidBecomeAvailable___block_invoke;
    block[3] = &unk_1E87EF6F0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __78__HRAtrialFibrillationEventDetector_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  char v2;
  id *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_detectionDisabled");
  v3 = *(id **)(a1 + 32);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3[2], "presentAtrialFibrillationDetectionRescindedAlertIfNeeded");
  objc_msgSend(v3, "_queue_enqueueMaintainanceOperationForMissedTachograms");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presentAtrialFibrillationDetectionReEnabledAlertIfNeeded");
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  HKFeatureStatusManager *statusManager;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  NSObject *queue;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  statusManager = self->_statusManager;
  v23 = 0;
  -[HKFeatureStatusManager featureStatusWithError:](statusManager, "featureStatusWithError:", &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4F68]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4FB8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if ((v13 & 1) != 0)
      {
        queue = self->_queue;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __57__HRAtrialFibrillationEventDetector_samplesAdded_anchor___block_invoke;
        v20[3] = &unk_1E87EFAE0;
        v20[4] = self;
        v21 = v7;
        v22 = v5;
        dispatch_async(queue, v20);

LABEL_12:
        goto LABEL_13;
      }
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB52F0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v16 = v19;
      HRLogSensitiveClassName();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      v18 = "[%{public}@] Skipping analysis: this is a Family Setup watch";
    }
    else
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E0CB52F0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v16 = v15;
      HRLogSensitiveClassName();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      v18 = "[%{public}@] Skipping analysis: Health app is hidden";
    }
    _os_log_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

    goto LABEL_12;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HRAtrialFibrillationEventDetector samplesAdded:anchor:].cold.1();
LABEL_13:

}

void __57__HRAtrialFibrillationEventDetector_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  int v8;
  id *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isCompanionSoftwareVersionTooOld");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    objc_msgSend(v3, "notifyUserThatAntimonyIsUnavailableForiOSVersionIfNeeded");
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB52F0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      return;
    v5 = v4;
    HRLogSensitiveClassName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v6;
    v7 = "[%{public}@] companion device is too old to support watchOS version";
LABEL_7:
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v20, 0xCu);

LABEL_8:
    return;
  }
  v8 = objc_msgSend(v3, "isWatchSoftwareVersionTooOld");
  v9 = *(id **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9[2], "notifyUserThatAntimonyIsUnavailableForWatchOSVersionIfNeeded");
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB52F0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      return;
    v5 = v10;
    HRLogSensitiveClassName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v6;
    v7 = "[%{public}@] watch device is too old to support iOS version";
    goto LABEL_7;
  }
  v11 = objc_msgSend(v9, "_queue_detectionDisabledWithFeatureStatus:", *(_QWORD *)(a1 + 40));
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v11)
  {
    objc_msgSend(v12, "presentAtrialFibrillationDetectionRescindedAlertIfNeeded");
    return;
  }
  objc_msgSend(v12, "presentAtrialFibrillationDetectionReEnabledAlertIfNeeded");
  v13 = objc_msgSend(*(id *)(a1 + 48), "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "_queue_lastAnalyzedSampleAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  if (v13 >= v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeTachogramsSinceLastAnchor");
    return;
  }
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v16;
    HRLogSensitiveClassName();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queue_lastAnalyzedSampleAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Samples added with anchor %@ below last analyzed anchor %@, ignoring", (uint8_t *)&v20, 0x20u);

    goto LABEL_8;
  }
}

- (void)_queue_enqueueMaintainanceOperationForMissedTachograms
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__HRAtrialFibrillationEventDetector__queue_enqueueMaintainanceOperationForMissedTachograms__block_invoke;
  v7[3] = &unk_1E87EFEC8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0D294D0], "maintenanceOperationWithName:asynchronousBlock:", CFSTR("com.apple.HeartRhythm.AtrialFibrillationEventDetector"), v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maintenanceWorkCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueMaintenanceOperation:", v3);

}

void __91__HRAtrialFibrillationEventDetector__queue_enqueueMaintainanceOperationForMissedTachograms__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__HRAtrialFibrillationEventDetector__queue_enqueueMaintainanceOperationForMissedTachograms__block_invoke_2;
  v7[3] = &unk_1E87EFEA0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __91__HRAtrialFibrillationEventDetector__queue_enqueueMaintainanceOperationForMissedTachograms__block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_queue_detectionDisabled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeTachogramsSinceLastAnchor");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_queue_analyzeTachogramsSinceLastAnchor
{
  uint8_t *v4;
  os_log_t v5;

  OUTLINED_FUNCTION_7_0((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Check for samples since last anchor failed: %@", v4, 0x16u);

}

uint64_t __76__HRAtrialFibrillationEventDetector__queue_analyzeTachogramsSinceLastAnchor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D29428];
  objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v5, "maxAnchorForSamplesWithType:profile:error:", v6, WeakRetained, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v11 || (objc_msgSend(v11, "isEqualToNumber:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0D29578];
    objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v12, "entityEnumeratorWithType:profile:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -172800.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForRowID();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v19, "sourceManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localDeviceSourceWithError:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    HDDataEntityPredicateForSourceEntity();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0D29840];
    v29[0] = v17;
    v29[1] = v18;
    v29[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predicateMatchingAllPredicates:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setPredicate:", v25);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __76__HRAtrialFibrillationEventDetector__queue_analyzeTachogramsSinceLastAnchor__block_invoke_2;
    v27[3] = &unk_1E87EFEF0;
    v28 = *(id *)(a1 + 48);
    objc_msgSend(v15, "enumerateWithError:handler:", a3, v27);

  }
  return 1;
}

uint64_t __76__HRAtrialFibrillationEventDetector__queue_analyzeTachogramsSinceLastAnchor__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

uint64_t __76__HRAtrialFibrillationEventDetector__queue_analyzeTachogramsSinceLastAnchor__block_invoke_213(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (void)_queue_seriesSamplesAdded:(id)a3 lastAnchor:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  v9 = -[HRAtrialFibrillationEventDetector _currentAlgorithmVersion](self, "_currentAlgorithmVersion");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__HRAtrialFibrillationEventDetector__queue_seriesSamplesAdded_lastAnchor___block_invoke;
  v15[3] = &unk_1E87EFF80;
  v15[4] = self;
  v15[5] = v9;
  objc_msgSend(v8, "hk_filter:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    HRLogSensitiveClassName();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_map:", &__block_literal_global_217);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Filtered to samples with background context: %@", buf, 0x16u);

  }
  if (objc_msgSend(v10, "count"))
    -[HRAtrialFibrillationEventDetector _queue_analyzeFilteredSeriesSamples:lastAnchor:](self, "_queue_analyzeFilteredSeriesSamples:lastAnchor:", v10, v6);
  else
    -[HRAtrialFibrillationEventDetector _queue_setLastAnalyzedSampleAnchor:](self, "_queue_setLastAnalyzedSampleAnchor:", v6);

}

uint64_t __74__HRAtrialFibrillationEventDetector__queue_seriesSamplesAdded_lastAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (!v6)
  {
    objc_msgSend(v3, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7240]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 40);
    v14 = v12;
    v15 = v14;
    if (v13 == 1)
    {
      if (!v14)
      {
LABEL_14:
        v8 = 1;
LABEL_15:

        goto LABEL_16;
      }
      v8 = objc_msgSend(v14, "integerValue");

      if (v8 == 1)
        goto LABEL_15;
    }
    else if (v13 == 2)
    {
      v16 = objc_msgSend(v14, "integerValue");

      if (v16 == 2)
        goto LABEL_14;
    }
    else
    {

    }
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x1E0CB52F0];
    v8 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      HRLogSensitiveClassName();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v19;
      _os_log_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring sample from incompatible tachogram version", (uint8_t *)&v21, 0xCu);

      v8 = 0;
    }
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB52F0];
  v8 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v7;
    HRLogSensitiveClassName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v10;
    _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring sample from non-background context", (uint8_t *)&v21, 0xCu);

    v8 = 0;
  }
LABEL_16:

  return v8;
}

uint64_t __74__HRAtrialFibrillationEventDetector__queue_seriesSamplesAdded_lastAnchor___block_invoke_216(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (id)_queue_filterSamplesByDateThreshold:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -172800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__HRAtrialFibrillationEventDetector__queue_filterSamplesByDateThreshold___block_invoke;
  v14[3] = &unk_1E87EFFC8;
  v6 = v5;
  v15 = v6;
  objc_msgSend(v4, "hk_filter:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 < objc_msgSend(v4, "count"))
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      HRLogSensitiveClassName();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count") - objc_msgSend(v7, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping analysis of %@ samples earlier than threshold date %@", buf, 0x20u);

    }
  }

  return v7;
}

uint64_t __73__HRAtrialFibrillationEventDetector__queue_filterSamplesByDateThreshold___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hk_isAfterDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_queue_analyzeFilteredSeriesSamples:(id)a3 lastAnchor:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v8);

  objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_220);
  v10 = (void *)MEMORY[0x1E0D29428];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__HRAtrialFibrillationEventDetector__queue_analyzeFilteredSeriesSamples_lastAnchor___block_invoke_2;
  v16[3] = &unk_1E87F0030;
  v16[4] = self;
  v13 = v9;
  v17 = v13;
  v14 = v6;
  v18 = v14;
  LOBYTE(v10) = objc_msgSend(v10, "performWriteTransactionWithHealthDatabase:error:block:", v12, &v19, v16);
  v15 = v19;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationEventDetector _queue_analyzeFilteredSeriesSamples:lastAnchor:].cold.1();
  }

}

uint64_t __84__HRAtrialFibrillationEventDetector__queue_analyzeFilteredSeriesSamples_lastAnchor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __84__HRAtrialFibrillationEventDetector__queue_analyzeFilteredSeriesSamples_lastAnchor___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_currentAlgorithmVersion");
  objc_msgSend(*(id *)(a1 + 32), "_queue_lastAlgorithmVersionUsed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && v2 != objc_msgSend(v3, "integerValue"))
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      HRLogSensitiveClassName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v7;
      v15 = 2048;
      v16 = objc_msgSend(v4, "integerValue");
      v17 = 2048;
      v18 = v2;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Algorithm version changed from %ld to %ld: resetting confirmation cycle", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_endConfirmationCycleIfNeeded");
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 40), "hk_dequeue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_queue_confirmationCycleSamples");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeCurrentConfirmationCycleSamples:withAlgorithmVersion:", v10, v2);
    }
    while (objc_msgSend(*(id *)(a1 + 40), "count"));
    objc_msgSend(*(id *)(a1 + 32), "_queue_setLastAnalyzedSampleAnchor:", *(_QWORD *)(a1 + 48));
    if (v11)
      objc_msgSend(*(id *)(a1 + 32), "_queue_requestAnotherTachogram");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_setLastAnalyzedSampleAnchor:", *(_QWORD *)(a1 + 48));
  }

  return 1;
}

- (BOOL)_queue_analyzeCurrentConfirmationCycleSamples:(id)a3 withAlgorithmVersion:(int64_t)a4
{
  NSObject *queue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  HRAtrialFibrillationAnalyticsCollector *analyticsCollector;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  -[HRAtrialFibrillationEventDetector _queue_filterSamplesByDateThreshold:](self, "_queue_filterSamplesByDateThreshold:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__2;
    v51 = __Block_byref_object_dispose__2;
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v52 = (id)objc_claimAutoreleasedReturnValue();

    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__2;
    v45 = __Block_byref_object_dispose__2;
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v46 = (id)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v11 = (id *)MEMORY[0x1E0CB52F0];
    v12 = (id)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HRLogSensitiveClassName();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __104__HRAtrialFibrillationEventDetector__queue_analyzeCurrentConfirmationCycleSamples_withAlgorithmVersion___block_invoke;
      v40[3] = &unk_1E87F0058;
      v40[4] = &v47;
      v40[5] = &v41;
      objc_msgSend(v8, "hk_map:", v40);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v13;
      v55 = 2112;
      v56 = v14;
      _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending sample(s) to analyzer: %@", buf, 0x16u);

    }
    -[HRAtrialFibrillationEventDetector _processTachograms:withAlgorithmVersion:](self, "_processTachograms:withAlgorithmVersion:", v8, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    analyticsCollector = self->_analyticsCollector;
    v17 = objc_alloc(MEMORY[0x1E0CB3588]);
    v18 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v48[5], v42[5]);
    -[HRAtrialFibrillationAnalyticsCollector collectAnalyticsForResult:algorithmVersion:samplesDateInterval:](analyticsCollector, "collectAnalyticsForResult:algorithmVersion:samplesDateInterval:", v15, a4, v18);

    -[HRAtrialFibrillationAnalyticsCollector updateCountAnalyzedTachogramsWithCount:keyValueDomain:](self->_analyticsCollector, "updateCountAnalyzedTachogramsWithCount:keyValueDomain:", objc_msgSend(v8, "count"), self->_syncedKeyValueDomain);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRAtrialFibrillationEventDetector _queue_setLastAlgorithmVersionUsed:](self, "_queue_setLastAlgorithmVersionUsed:", v19);

    objc_msgSend(v8, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRAtrialFibrillationEventDetector _queue_setLatestAnalyzedSampleDate:](self, "_queue_setLatestAnalyzedSampleDate:", v21);

    v22 = objc_msgSend(v15, "userShouldBeAlerted");
    if (v22)
    {
      _HKInitializeLogging();
      v23 = *v11;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HRLogSensitiveClassName();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuidsForNextCycle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v24;
        v55 = 2112;
        v56 = v25;
        _os_log_impl(&dword_1CC29C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Result indicated user should be notified, UUIDs for next cycle: %@", buf, 0x16u);

      }
      objc_msgSend(v8, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "endDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hk_foldRightFrom:with:", v27, &__block_literal_global_227);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "positiveUUIDs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:](self, "_queue_alertUserWithDate:positiveTachogramUUIDs:", v28, v29);

      -[HRAtrialFibrillationEventDetector _queue_endConfirmationCycleIfNeeded](self, "_queue_endConfirmationCycleIfNeeded");
    }
    else
    {
      if (!objc_msgSend(v15, "tachogramShouldBeRequested"))
      {
        _HKInitializeLogging();
        v35 = *v11;
        if (os_log_type_enabled((os_log_t)*v11, OS_LOG_TYPE_DEBUG))
        {
          v36 = v35;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            HRLogSensitiveClassName();
            v37 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "uuidsForNextCycle");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[HRAtrialFibrillationEventDetector _queue_analyzeCurrentConfirmationCycleSamples:withAlgorithmVersion:].cold.1(v37, v38, (uint64_t)buf);
          }

        }
        -[HRAtrialFibrillationEventDetector _queue_endConfirmationCycleIfNeeded](self, "_queue_endConfirmationCycleIfNeeded");
        v30 = 0;
        goto LABEL_19;
      }
      _HKInitializeLogging();
      v31 = *v11;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        HRLogSensitiveClassName();
        v32 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuidsForNextCycle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v32;
        v55 = 2112;
        v56 = v33;
        _os_log_impl(&dword_1CC29C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Result indicated more samples are needed, UUIDs for next cycle: %@", buf, 0x16u);

      }
      objc_msgSend(v15, "uuidsForNextCycle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRAtrialFibrillationEventDetector _queue_orderedConfirmationCycleSamplesFromSamples:requestedUUIDs:](self, "_queue_orderedConfirmationCycleSamplesFromSamples:requestedUUIDs:", v8, v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRAtrialFibrillationEventDetector _queue_setConfirmationCycleSamples:](self, "_queue_setConfirmationCycleSamples:", v34);

    }
    v30 = v22 ^ 1;
LABEL_19:

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);

    goto LABEL_20;
  }
  -[HRAtrialFibrillationEventDetector _queue_endConfirmationCycleIfNeeded](self, "_queue_endConfirmationCycleIfNeeded");
  v30 = 0;
LABEL_20:

  return v30;
}

id __104__HRAtrialFibrillationEventDetector__queue_analyzeCurrentConfirmationCycleSamples_withAlgorithmVersion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earlierDate:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "laterDate:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringWithFormat:", CFSTR("(UUID: %@, startDate: %@, endDate: %@)"), v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __104__HRAtrialFibrillationEventDetector__queue_analyzeCurrentConfirmationCycleSamples_withAlgorithmVersion___block_invoke_225(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a2;
  objc_msgSend(a3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_processTachograms:(id)a3 withAlgorithmVersion:(int64_t)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HRAtrialFibrillationEventDetector _unitTest_processTachograms](self, "_unitTest_processTachograms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HRAtrialFibrillationEventDetector _unitTest_processTachograms](self, "_unitTest_processTachograms");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      HRLogSensitiveClassName();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_1CC29C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyzing tachograms with algorithm version %ld", (uint8_t *)&v15, 0x16u);

    }
    v8 = (void (**)(_QWORD, _QWORD))objc_msgSend(objc_alloc(MEMORY[0x1E0D2FC28]), "initWithIrregularRhythmVersion:", -[HRAtrialFibrillationEventDetector _currentAlgorithmVersion](self, "_currentAlgorithmVersion"));
    objc_msgSend(v8, "processTachograms:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v9;

  return v13;
}

- (int64_t)_currentAlgorithmVersion
{
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *availabilityManager;
  void *v3;
  id v4;
  int64_t v5;
  id v7;

  availabilityManager = self->_availabilityManager;
  v7 = 0;
  -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager highestAvailableOnboardedAlgorithmVersionWithError:](availabilityManager, "highestAvailableOnboardedAlgorithmVersionWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationEventDetector _currentAlgorithmVersion].cold.1();
    v5 = 1;
  }

  return v5;
}

- (BOOL)_queue_detectionDisabled
{
  HKFeatureStatusManager *statusManager;
  void *v5;
  id v6;
  BOOL v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HRAtrialFibrillationEventDetector _unitTesting](self, "_unitTesting"))
    return -[HRAtrialFibrillationEventDetector _unitTest_detectionDisabled](self, "_unitTest_detectionDisabled");
  statusManager = self->_statusManager;
  v8 = 0;
  -[HKFeatureStatusManager featureStatusWithError:](statusManager, "featureStatusWithError:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v5)
  {
    v7 = -[HRAtrialFibrillationEventDetector _queue_detectionDisabledWithFeatureStatus:](self, "_queue_detectionDisabledWithFeatureStatus:", v5);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationEventDetector _queue_detectionDisabled].cold.1();
    v7 = 0;
  }

  return v7;
}

- (BOOL)_queue_detectionDisabledWithFeatureStatus:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HRAtrialFibrillationEventDetector _unitTesting](self, "_unitTesting"))
  {
    v5 = -[HRAtrialFibrillationEventDetector _unitTest_detectionDisabled](self, "_unitTest_detectionDisabled");
  }
  else
  {
    v6 = *MEMORY[0x1E0CB4ED0];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "areAllRequirementsSatisfied");

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        HRLogSensitiveClassName();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "unsatisfiedRequirementIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v11;
        v17 = 2114;
        v18 = v13;
        _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detection is disabled, unsatisfied usage requirements: %{public}@", (uint8_t *)&v15, 0x16u);

      }
    }
    v5 = v8 ^ 1;
  }

  return v5;
}

- (BOOL)_queue_inConfirmationCycle
{
  void *v3;
  BOOL v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HRAtrialFibrillationEventDetector _queue_confirmationCycleSamples](self, "_queue_confirmationCycleSamples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_queue_endConfirmationCycleIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HRAtrialFibrillationEventDetector _queue_inConfirmationCycle](self, "_queue_inConfirmationCycle"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      HRLogSensitiveClassName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending current confirmation cycle", (uint8_t *)&v6, 0xCu);

    }
    -[HRAtrialFibrillationEventDetector _queue_setConfirmationCycleSamples:](self, "_queue_setConfirmationCycleSamples:", MEMORY[0x1E0C9AA60]);
  }
}

- (void)_queue_requestAnotherTachogram
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(void);
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HRAtrialFibrillationEventDetector _unitTest_moreTachogramsRequestedHandler](self, "_unitTest_moreTachogramsRequestedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HRAtrialFibrillationEventDetector _unitTest_moreTachogramsRequestedHandler](self, "_unitTest_moreTachogramsRequestedHandler");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
  else
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      HRLogSensitiveClassName();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting background sample", buf, 0xCu);

    }
  }
}

- (void)_queue_alertUserWithDate:(id)a3 positiveTachogramUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HRAtrialFibrillationEventDetector _unitTest_userAlertedHandler](self, "_unitTest_userAlertedHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HRAtrialFibrillationEventDetector _unitTest_userAlertedHandler](self, "_unitTest_userAlertedHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);

  }
  else
  {
    v44 = 0;
    -[HRAtrialFibrillationEventDetector _getProductVersionWithError:](self, "_getProductVersionWithError:", &v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v44;
    if (v10)
    {
      v48 = *MEMORY[0x1E0CB7258];
      v49[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB6378];
      objc_msgSend(MEMORY[0x1E0CB6380], "atrialFibrillationEventType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)v12;
      objc_msgSend(v13, "categorySampleWithType:value:startDate:endDate:metadata:", v14, 0, v6, v6, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "deviceManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      objc_msgSend(v17, "currentDeviceEntityWithError:", &v43);
      v18 = objc_claimAutoreleasedReturnValue();
      v11 = v43;

      v40 = (void *)v18;
      if (v18)
      {
        v38 = v10;
        v19 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v19, "dataProvenanceManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "defaultLocalDataProvenanceWithDeviceEntity:", v18);
        v21 = objc_claimAutoreleasedReturnValue();

        v22 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v22, "dataManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
        v24 = v15;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v37 = (void *)v21;
        LODWORD(v21) = objc_msgSend(v23, "insertDataObjects:withProvenance:creationDate:error:", v25, v21, &v42, CFAbsoluteTimeGetCurrent());
        v26 = v42;

        if ((_DWORD)v21)
        {
          v27 = objc_loadWeakRetained((id *)&self->_profile);
          objc_msgSend(v27, "associationManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v24;
          objc_msgSend(v24, "UUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v26;
          v30 = objc_msgSend(v28, "associateObjectUUIDs:objectUUID:error:", v7, v29, &v41);
          v11 = v41;

          _HKInitializeLogging();
          v31 = (void *)*MEMORY[0x1E0CB52F0];
          v32 = *MEMORY[0x1E0CB52F0];
          if (v30)
          {
            v10 = v38;
            v33 = v39;
            v15 = v36;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              v34 = v31;
              HRLogSensitiveClassName();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v46 = v35;
              _os_log_impl(&dword_1CC29C000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saved event with associated positive samples", buf, 0xCu);

              v15 = v36;
            }
          }
          else
          {
            v10 = v38;
            v33 = v39;
            v15 = v36;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:].cold.3();
          }
          -[HRAtrialFibrillationEventDetector _queue_forceHealthKitSync](self, "_queue_forceHealthKitSync");
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
            -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:].cold.4();
          v11 = v26;
          v15 = v24;
          v10 = v38;
          v33 = v39;
        }

      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
          -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:].cold.2();
        v33 = v39;
      }

    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:].cold.1();
    }

  }
}

- (id)_getProductVersionWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager pairedFeatureAttributesWithError:](self->_availabilityManager, "pairedFeatureAttributesWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "watchAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_queue_forceHealthKitSync
{
  HDHRHealthKitSyncManager *v3;
  id WeakRetained;
  HDHRHealthKitSyncManager *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [HDHRHealthKitSyncManager alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = -[HDHRHealthKitSyncManager initWithProfile:](v3, "initWithProfile:", WeakRetained);

  -[HDHRHealthKitSyncManager triggerImmediateSyncWithReason:loggingCategory:](v5, "triggerImmediateSyncWithReason:loggingCategory:", CFSTR("New Atrial Fibrillation / Antimony Notification sample added"), *MEMORY[0x1E0CB52F0]);
}

- (id)_queue_confirmationCycleSamples
{
  NSArray *cachedConfirmationCycleSamples;
  HDKeyValueDomain *localKeyValueDomain;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedConfirmationCycleSamples = self->_cachedConfirmationCycleSamples;
  if (cachedConfirmationCycleSamples)
    goto LABEL_4;
  localKeyValueDomain = self->_localKeyValueDomain;
  v19 = 0;
  -[HDKeyValueDomain dataForKey:error:](localKeyValueDomain, "dataForKey:error:", CFSTR("ConfirmationCycleUUIDs"), &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __68__HRAtrialFibrillationEventDetector__queue_confirmationCycleSamples__block_invoke;
    v17 = &unk_1E87F00C0;
    v18 = v8;
    v9 = v8;
    objc_msgSend(v5, "hk_enumerateUUIDsUsingBlock:", &v14);
    -[HRAtrialFibrillationEventDetector _queue_orderedConfirmationCycleSamplesFromUUIDs:](self, "_queue_orderedConfirmationCycleSamplesFromUUIDs:", v9, v14, v15, v16, v17);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_cachedConfirmationCycleSamples;
    self->_cachedConfirmationCycleSamples = v10;

    cachedConfirmationCycleSamples = self->_cachedConfirmationCycleSamples;
LABEL_4:
    v12 = cachedConfirmationCycleSamples;
    return v12;
  }
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationEventDetector _queue_confirmationCycleSamples].cold.1();
    v12 = 0;
  }
  else
  {
    v12 = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

uint64_t __68__HRAtrialFibrillationEventDetector__queue_confirmationCycleSamples__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_queue_orderedConfirmationCycleSamplesFromUUIDs:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = (void *)MEMORY[0x1E0D29578];
  objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  HDDataEntityPredicateForDataUUIDs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v6, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v7, WeakRetained, 0, v9, 0, 0, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;

  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationEventDetector _queue_orderedConfirmationCycleSamplesFromUUIDs:].cold.1();
  }
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_236);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __85__HRAtrialFibrillationEventDetector__queue_orderedConfirmationCycleSamplesFromUUIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_queue_orderedConfirmationCycleSamplesFromSamples:(id)a3 requestedUUIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__HRAtrialFibrillationEventDetector__queue_orderedConfirmationCycleSamplesFromSamples_requestedUUIDs___block_invoke;
  v12[3] = &unk_1E87EFFC8;
  v6 = v5;
  v13 = v6;
  objc_msgSend(a3, "hk_filter:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_237);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9 != objc_msgSend(v6, "count"))
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationEventDetector _queue_orderedConfirmationCycleSamplesFromSamples:requestedUUIDs:].cold.1(v10);
  }

  return v8;
}

uint64_t __102__HRAtrialFibrillationEventDetector__queue_orderedConfirmationCycleSamplesFromSamples_requestedUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __102__HRAtrialFibrillationEventDetector__queue_orderedConfirmationCycleSamplesFromSamples_requestedUUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_queue_setConfirmationCycleSamples:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HDKeyValueDomain *localKeyValueDomain;
  char v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_msgSend(v5, "isEqual:", self->_cachedConfirmationCycleSamples) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "hk_appendBytesWithUUID:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    localKeyValueDomain = self->_localKeyValueDomain;
    v16 = 0;
    v14 = -[HDKeyValueDomain setData:forKey:error:](localKeyValueDomain, "setData:forKey:error:", v6, CFSTR("ConfirmationCycleUUIDs"), &v16);
    v15 = v16;
    if ((v14 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HRAtrialFibrillationEventDetector _queue_setConfirmationCycleSamples:].cold.1();
    }
    objc_storeStrong((id *)&self->_cachedConfirmationCycleSamples, a3);

  }
}

- (void)_queue_setLastAlgorithmVersionUsed:(id)a3
{
  id v5;
  HDKeyValueDomain *localKeyValueDomain;
  char v7;
  id v8;
  id v9;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_msgSend(v5, "isEqual:", self->_cachedLastAlgorithmVersionUsed) & 1) == 0)
  {
    localKeyValueDomain = self->_localKeyValueDomain;
    v9 = 0;
    v7 = -[HDKeyValueDomain setNumber:forKey:error:](localKeyValueDomain, "setNumber:forKey:error:", v5, CFSTR("LastAlgorithmVersionUsed"), &v9);
    v8 = v9;
    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HRAtrialFibrillationEventDetector _queue_setLastAlgorithmVersionUsed:].cold.1();
    }
    objc_storeStrong((id *)&self->_cachedLastAlgorithmVersionUsed, a3);

  }
}

- (id)_queue_lastAlgorithmVersionUsed
{
  NSNumber *cachedLastAlgorithmVersionUsed;
  HDKeyValueDomain *localKeyValueDomain;
  NSNumber *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSNumber *v9;
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedLastAlgorithmVersionUsed = self->_cachedLastAlgorithmVersionUsed;
  if (!cachedLastAlgorithmVersionUsed)
  {
    localKeyValueDomain = self->_localKeyValueDomain;
    v11 = 0;
    -[HDKeyValueDomain numberForKey:error:](localKeyValueDomain, "numberForKey:error:", CFSTR("LastAlgorithmVersionUsed"), &v11);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    v7 = v6;
    if (v5)
      v8 = 1;
    else
      v8 = v6 == 0;
    if (!v8)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HRAtrialFibrillationEventDetector _queue_lastAlgorithmVersionUsed].cold.1();
    }
    v9 = self->_cachedLastAlgorithmVersionUsed;
    self->_cachedLastAlgorithmVersionUsed = v5;

    cachedLastAlgorithmVersionUsed = self->_cachedLastAlgorithmVersionUsed;
  }
  return cachedLastAlgorithmVersionUsed;
}

- (void)_queue_setLatestAnalyzedSampleDate:(id)a3
{
  id v5;
  HDKeyValueDomain *syncedKeyValueDomain;
  uint64_t v7;
  char v8;
  id v9;
  id v10;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_msgSend(v5, "isEqual:", self->_cachedLatestAnalyzedSampleDate) & 1) == 0)
  {
    syncedKeyValueDomain = self->_syncedKeyValueDomain;
    v7 = *MEMORY[0x1E0CB7730];
    v10 = 0;
    v8 = -[HDKeyValueDomain setDate:forKey:error:](syncedKeyValueDomain, "setDate:forKey:error:", v5, v7, &v10);
    v9 = v10;
    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HRAtrialFibrillationEventDetector _queue_setLatestAnalyzedSampleDate:].cold.1();
    }
    objc_storeStrong((id *)&self->_cachedLatestAnalyzedSampleDate, a3);

  }
}

- (id)_queue_latestAnalyzedSampleDate
{
  NSDate *cachedLatestAnalyzedSampleDate;
  HDKeyValueDomain *syncedKeyValueDomain;
  uint64_t v5;
  NSDate *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSDate *v10;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedLatestAnalyzedSampleDate = self->_cachedLatestAnalyzedSampleDate;
  if (!cachedLatestAnalyzedSampleDate)
  {
    syncedKeyValueDomain = self->_syncedKeyValueDomain;
    v5 = *MEMORY[0x1E0CB7730];
    v12 = 0;
    -[HDKeyValueDomain dateForKey:error:](syncedKeyValueDomain, "dateForKey:error:", v5, &v12);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    v8 = v7;
    if (v6)
      v9 = 1;
    else
      v9 = v7 == 0;
    if (!v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HRAtrialFibrillationEventDetector _queue_latestAnalyzedSampleDate].cold.1();
    }
    v10 = self->_cachedLatestAnalyzedSampleDate;
    self->_cachedLatestAnalyzedSampleDate = v6;

    cachedLatestAnalyzedSampleDate = self->_cachedLatestAnalyzedSampleDate;
  }
  return cachedLatestAnalyzedSampleDate;
}

- (void)_queue_setLastAnalyzedSampleAnchor:(id)a3
{
  NSNumber *v4;
  HDKeyValueDomain *localKeyValueDomain;
  char v6;
  id v7;
  NSNumber *cachedLastAnalyzedSampleAnchor;
  NSNumber *v9;
  id v10;

  v4 = (NSNumber *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  localKeyValueDomain = self->_localKeyValueDomain;
  v10 = 0;
  v6 = -[HDKeyValueDomain setNumber:forKey:error:](localKeyValueDomain, "setNumber:forKey:error:", v4, CFSTR("LastAnalyzedSampleAnchor"), &v10);
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationEventDetector _queue_setLastAnalyzedSampleAnchor:].cold.1();
  }
  cachedLastAnalyzedSampleAnchor = self->_cachedLastAnalyzedSampleAnchor;
  self->_cachedLastAnalyzedSampleAnchor = v4;
  v9 = v4;

}

- (id)_queue_lastAnalyzedSampleAnchor
{
  NSNumber *cachedLastAnalyzedSampleAnchor;
  HDKeyValueDomain *localKeyValueDomain;
  NSNumber *v5;
  id v6;
  void *v7;
  NSNumber *v8;
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedLastAnalyzedSampleAnchor = self->_cachedLastAnalyzedSampleAnchor;
  if (cachedLastAnalyzedSampleAnchor)
    return cachedLastAnalyzedSampleAnchor;
  localKeyValueDomain = self->_localKeyValueDomain;
  v10 = 0;
  -[HDKeyValueDomain numberForKey:error:](localKeyValueDomain, "numberForKey:error:", CFSTR("LastAnalyzedSampleAnchor"), &v10);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  if (v5)
  {
LABEL_3:
    v8 = self->_cachedLastAnalyzedSampleAnchor;
    self->_cachedLastAnalyzedSampleAnchor = v5;

    cachedLastAnalyzedSampleAnchor = self->_cachedLastAnalyzedSampleAnchor;
    return cachedLastAnalyzedSampleAnchor;
  }
  if (!v6)
  {
    v5 = (NSNumber *)&unk_1E87FF008;
    goto LABEL_3;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HRAtrialFibrillationEventDetector _queue_lastAnalyzedSampleAnchor].cold.1();

  return 0;
}

- (id)diagnosticDescription
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HRAtrialFibrillationEventDetector_diagnosticDescription__block_invoke;
  v5[3] = &unk_1E87F0168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__HRAtrialFibrillationEventDetector_diagnosticDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "hk_map:", &__block_literal_global_241);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Confirmation cycle samples: %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Last algorithm version used: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Latest analyzed sample date: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Last analyzed sample anchor: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __58__HRAtrialFibrillationEventDetector_diagnosticDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)availabilityManager
{
  return self->_availabilityManager;
}

- (void)setAvailabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityManager, a3);
}

- (BOOL)_unitTesting
{
  return self->__unitTesting;
}

- (void)set_unitTesting:(BOOL)a3
{
  self->__unitTesting = a3;
}

- (BOOL)_unitTest_detectionDisabled
{
  return self->__unitTest_detectionDisabled;
}

- (void)set_unitTest_detectionDisabled:(BOOL)a3
{
  self->__unitTest_detectionDisabled = a3;
}

- (id)_unitTest_userAlertedHandler
{
  return self->__unitTest_userAlertedHandler;
}

- (void)set_unitTest_userAlertedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)_unitTest_moreTachogramsRequestedHandler
{
  return self->__unitTest_moreTachogramsRequestedHandler;
}

- (void)set_unitTest_moreTachogramsRequestedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)_unitTest_processTachograms
{
  return self->__unitTest_processTachograms;
}

- (void)set_unitTest_processTachograms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__unitTest_processTachograms, 0);
  objc_storeStrong(&self->__unitTest_moreTachogramsRequestedHandler, 0);
  objc_storeStrong(&self->__unitTest_userAlertedHandler, 0);
  objc_storeStrong((id *)&self->_availabilityManager, 0);
  objc_storeStrong((id *)&self->_syncedKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_cachedLastAnalyzedSampleAnchor, 0);
  objc_storeStrong((id *)&self->_cachedLatestAnalyzedSampleDate, 0);
  objc_storeStrong((id *)&self->_cachedLastAlgorithmVersionUsed, 0);
  objc_storeStrong((id *)&self->_cachedConfirmationCycleSamples, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statusManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)samplesAdded:anchor:.cold.1()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to retrieve IRN's feature status; skipping analysis after samples added: %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_analyzeFilteredSeriesSamples:lastAnchor:.cold.1()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to perform write analysis write transaction: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_analyzeCurrentConfirmationCycleSamples:(uint64_t)a3 withAlgorithmVersion:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_7_0((uint64_t)a1, (uint64_t)a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Result indicated no action is needed, UUIDs for next cycle: %@", v5, 0x16u);

}

- (void)_currentAlgorithmVersion
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Unable to determine current algorithm version, defaulting to 1.0: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_detectionDisabled
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to retrieve IRN's feature status; reporting 'detection disabled': %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_alertUserWithDate:positiveTachogramUUIDs:.cold.1()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to get version for product: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_alertUserWithDate:positiveTachogramUUIDs:.cold.2()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to get current device entity: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_alertUserWithDate:positiveTachogramUUIDs:.cold.3()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to associate samples: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_alertUserWithDate:positiveTachogramUUIDs:.cold.4()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to insert event: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_confirmationCycleSamples
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to read confirmation cycle UUIDs from protected key value store: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_orderedConfirmationCycleSamplesFromUUIDs:.cold.1()
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to read confirmation cycle samples from UUIDs %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_orderedConfirmationCycleSamplesFromSamples:(void *)a1 requestedUUIDs:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;

  v1 = OUTLINED_FUNCTION_5(a1);
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1CC29C000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected number of requested confirmation cycle UUIDs", (uint8_t *)&v3, 0xCu);

}

- (void)_queue_setConfirmationCycleSamples:.cold.1()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to set confirmation cycle UUIDs in protected key value store: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_setLastAlgorithmVersionUsed:.cold.1()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to set last used algorithm version in protected key value store: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_lastAlgorithmVersionUsed
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to read last algorithm version used from protected key value store: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_setLatestAnalyzedSampleDate:.cold.1()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to set last analyzed sample date in protected key value store: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_latestAnalyzedSampleDate
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to read last analyzed sample date from protected key value store: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_setLastAnalyzedSampleAnchor:.cold.1()
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
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to set last analyzed sample anchor in protected key value store: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_lastAnalyzedSampleAnchor
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to read last analyzed sample anchor from protected key value store: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
