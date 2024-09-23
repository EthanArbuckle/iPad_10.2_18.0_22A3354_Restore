@implementation HDCloudSyncSubscriptionNotificationHandler

- (HDCloudSyncSubscriptionNotificationHandler)initWithCoordinator:(id)a3 behavior:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncSubscriptionNotificationHandler *v8;
  HDCloudSyncSubscriptionNotificationHandler *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncSubscriptionNotificationHandler;
  v8 = -[HDCloudSyncSubscriptionNotificationHandler init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_coordinator, v6);
    objc_storeStrong((id *)&v9->_behavior, a4);
    HKCreateSerialUtilityDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v9->_lock._os_unfair_lock_opaque = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v9->_coordinator);
    objc_msgSend(WeakRetained, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerDaemonReadyObserver:queue:", v9, v9->_queue);

  }
  return v9;
}

- (void)_enableAPSPush
{
  NSObject *v3;
  uint8_t v4[8];
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!_HDIsUnitTesting)
  {
    if (self->_apsConnection)
    {
      _HKInitializeLogging();
      v3 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "APS connection is already created (#t0)", v4, 2u);
      }
    }
    else
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __60__HDCloudSyncSubscriptionNotificationHandler__enableAPSPush__block_invoke;
      v5[3] = &unk_1E6CF3490;
      v5[4] = self;
      -[HDCloudSyncSubscriptionNotificationHandler _queue_fetchAPSEnvironmentStringWithHandler:](self, "_queue_fetchAPSEnvironmentStringWithHandler:", v5);
    }
  }
}

void __60__HDCloudSyncSubscriptionNotificationHandler__enableAPSPush__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HDCloudSyncSubscriptionNotificationHandler__enableAPSPush__block_invoke_187;
    v8[3] = &unk_1E6CE8080;
    v8[4] = v5;
    v9 = v3;
    dispatch_async(v6, v8);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Error establishing APS connection due to nil APS enviroment.", buf, 2u);
    }
  }

}

void __60__HDCloudSyncSubscriptionNotificationHandler__enableAPSPush__block_invoke_187(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", *MEMORY[0x1E0CB7630]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE148]), "initWithEnvironmentName:namedDelegatePort:queue:", *(_QWORD *)(a1 + 40), CFSTR("com.apple.aps.healthd.cloud.subscription.push"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  v8 = *MEMORY[0x1E0CB5370];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 134217984;
      v13 = v9;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Created APS connection %p (#t0)", buf, 0xCu);
    }
    v11 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "_setEnabledTopics:", v10);

  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Couldn't create APS push connection (#t0)", buf, 2u);
  }

}

- (id)_copyAPSEntitlement
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)xpc_copy_entitlement_for_self();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v2));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_queue_fetchAPSEnvironmentStringWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[HDCloudSyncSubscriptionNotificationHandler _copyAPSEntitlement](self, "_copyAPSEntitlement");
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "compare:options:", *MEMORY[0x1E0C94968], 1))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
      objc_msgSend(WeakRetained, "daemon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "primaryProfile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cloudSyncManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __90__HDCloudSyncSubscriptionNotificationHandler__queue_fetchAPSEnvironmentStringWithHandler___block_invoke;
      v11[3] = &unk_1E6CEF060;
      v12 = v4;
      objc_msgSend(v10, "fetchServerPreferredPushEnvironmentWithCompletion:", v11);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __90__HDCloudSyncSubscriptionNotificationHandler__queue_fetchAPSEnvironmentStringWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id)*MEMORY[0x1E0CFE130];
  v8 = (os_log_t *)MEMORY[0x1E0CB5370];
  if (v6)
  {
    _HKInitializeLogging();
    v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "Error getting server APS preferred push environment: %{public}@ (#t0)", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v10 = v5;

    v7 = v10;
  }
  _HKInitializeLogging();
  v11 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "Using APS push environment: %{public}@ (#t0)", (uint8_t *)&v12, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_queue_handleSubscriptionWithID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  HDCloudSyncSubscriptionNotificationHandler *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "isEqual:", HDCloudSyncPrimaryProfileDataRequestedSubscriptionIdentifier))
  {
    -[HDCloudSyncSubscriptionNotificationHandler _queue_handleIncomingDataUploadRequest](self, "_queue_handleIncomingDataUploadRequest");
  }
  else if (objc_msgSend(v4, "isEqual:", HDCloudSyncPrimaryProfileDataAvailableForDownloadSubscriptionIdentifier))
  {
    -[HDCloudSyncSubscriptionNotificationHandler _queue_handleIncomingDataDownloadAvailableNotificationOnTinkerDevices](self, "_queue_handleIncomingDataDownloadAvailableNotificationOnTinkerDevices");
  }
  else if (objc_msgSend(v4, "isEqual:", HDCloudSyncTinkerProfileDataAvailableForDownloadSubscriptionIdentifier))
  {
    -[HDCloudSyncSubscriptionNotificationHandler _queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices](self, "_queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices");
  }
  else if (objc_msgSend(v4, "isEqual:", HDCloudSyncPrimaryMedicalIDDataAvailableForDownloadSubscriptionIdentifier))
  {
    -[HDCloudSyncSubscriptionNotificationHandler _queue_handleIncomingPrimaryMedicalIDDataAvailableForDownloadNotification](self, "_queue_handleIncomingPrimaryMedicalIDDataAvailableForDownloadNotification");
  }
  else if (objc_msgSend(v4, "isEqual:", HDCloudSyncTinkerMedicalIDDataAvailableForDownloadSubscriptionIdentifier))
  {
    -[HDCloudSyncSubscriptionNotificationHandler _queue_handleIncomingTinkerMedicalIDDataAvailableForDownloadNotification](self, "_queue_handleIncomingTinkerMedicalIDDataAvailableForDownloadNotification");
  }
  else if (objc_msgSend(v4, "isEqual:", HDCloudSyncSharedSummaryDataAvailableForDownloadSubscriptionIdentifier))
  {
    -[HDCloudSyncSubscriptionNotificationHandler _queue_handleIncomingSharedSummaryDataAvailableForDownloadNotification](self, "_queue_handleIncomingSharedSummaryDataAvailableForDownloadNotification");
  }
  else if (objc_msgSend(v4, "isEqual:", HDCloudSyncMedicationsStateChangedSubscriptionIdentifier))
  {
    -[HDCloudSyncSubscriptionNotificationHandler _queue_handleMedicationsStateUpdatedNotification](self, "_queue_handleMedicationsStateUpdatedNotification");
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543618;
      v7 = self;
      v8 = 2114;
      v9 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Unknown subscription type %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }

}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerProfileReadyObserver:queue:", self, self->_queue);

}

- (void)_queue_handleIncomingCloudKitPushNotification:(id)a3
{
  id v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "subscriptionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Recieved CloudKit push notification for subscription with id: %{public}@ (#t0)", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(v4, "alertBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HDCloudSyncSubscriptionNotificationHandler _queue_handleSubscriptionWithID:](self, "_queue_handleSubscriptionWithID:", v5);
  }
  else
  {
    _HKInitializeLogging();
    v9 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "Push notification is low-priority, ignoring. (#t0)", (uint8_t *)&v10, 2u);
    }
  }

}

- (BOOL)_shouldTriggerUpload
{
  os_unfair_lock_s *p_lock;
  double v4;
  NSObject *v5;
  int v7;
  HDCloudSyncSubscriptionNotificationHandler *v8;
  __int16 v9;
  double v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = CFAbsoluteTimeGetCurrent() - self->_lock_lastTinkerDataUploadTriggerTime;
  if (v4 <= 300.0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543874;
      v8 = self;
      v9 = 2048;
      v10 = v4;
      v11 = 2048;
      v12 = 0x4072C00000000000;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data upload request; time since last request %lf is less than threshold %lf",
        (uint8_t *)&v7,
        0x20u);
    }
  }
  else
  {
    self->_lock_lastTinkerDataUploadTriggerTime = CFAbsoluteTimeGetCurrent();
  }
  os_unfair_lock_unlock(p_lock);
  return v4 > 300.0;
}

- (void)_queue_handleIncomingDataUploadRequest
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  HDCloudSyncSubscriptionNotificationHandler *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled") & 1) != 0)
  {
    if (-[HDCloudSyncSubscriptionNotificationHandler _shouldTriggerUpload](self, "_shouldTriggerUpload"))
    {
      v3 = objc_alloc(MEMORY[0x1E0CB6430]);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 0);
      v5 = (void *)objc_msgSend(v3, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v4, 0, 0, 0, 0, 1, 25);

      v6 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v5), 16, 0);
      objc_msgSend(v6, "setSyncRequest:", v5);
      WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
      v13 = 0;
      v8 = objc_msgSend(WeakRetained, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 1, v6, CFSTR("Tinker data upload requested notification"), &v13);
      v9 = v13;

      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5370];
      v11 = *MEMORY[0x1E0CB5370];
      if ((v8 & 1) != 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v15 = self;
          _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Tinker data upload requested notification", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = self;
        v16 = 2114;
        v17 = v9;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Tinker data upload requested notification %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data upload request on ineligible device.", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldTriggerDownload
{
  os_unfair_lock_s *p_lock;
  double v4;
  NSObject *v5;
  int v7;
  HDCloudSyncSubscriptionNotificationHandler *v8;
  __int16 v9;
  double v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = CFAbsoluteTimeGetCurrent() - self->_lock_lastTinkerDataDownloadTriggerTime;
  if (v4 <= 1800.0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543874;
      v8 = self;
      v9 = 2048;
      v10 = v4;
      v11 = 2048;
      v12 = 0x409C200000000000;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data download request; time since last request %lf is less than threshold %lf",
        (uint8_t *)&v7,
        0x20u);
    }
  }
  else
  {
    self->_lock_lastTinkerDataDownloadTriggerTime = CFAbsoluteTimeGetCurrent();
  }
  os_unfair_lock_unlock(p_lock);
  return v4 > 1800.0;
}

- (void)_queue_handleIncomingDataDownloadAvailableNotificationOnTinkerDevices
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  HDCloudSyncSubscriptionNotificationHandler *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled") & 1) != 0)
  {
    if (-[HDCloudSyncSubscriptionNotificationHandler _shouldTriggerDownload](self, "_shouldTriggerDownload"))
    {
      v3 = objc_alloc(MEMORY[0x1E0CB6430]);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 0, 1, 0);
      v5 = (void *)objc_msgSend(v3, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v4, 0, 0, 0, 0, 1, 25);

      v6 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v5), 17, 0);
      objc_msgSend(v6, "setSyncRequest:", v5);
      WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
      v13 = 0;
      v8 = objc_msgSend(WeakRetained, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 1, v6, CFSTR("Guardian data available for download notification"), &v13);
      v9 = v13;

      if ((v8 & 1) == 0)
      {
        _HKInitializeLogging();
        v10 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v15 = self;
          v16 = 2114;
          v17 = v9;
          _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Guardian data available for download notification %{public}@", buf, 0x16u);
        }
      }
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = self;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Guardian data available for download notification", buf, 0xCu);
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data download request on ineligible device.", buf, 0xCu);
    }
  }
}

- (void)_queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  HDCloudSyncSubscriptionNotificationHandler *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled"))
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data download on ineligible device.", buf, 0xCu);
    }
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB6430]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 0, 1, 0);
    v6 = (void *)objc_msgSend(v4, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v5, 0, 0, 0, 0, 1, 25);

    v7 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v6), 17, 0);
    objc_msgSend(v7, "setSyncRequest:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
    objc_msgSend(WeakRetained, "syncStatusProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDataUploadRequestStatus:profileType:", 3, 3);

    v10 = objc_loadWeakRetained((id *)&self->_coordinator);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __117__HDCloudSyncSubscriptionNotificationHandler__queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices__block_invoke;
    v11[3] = &unk_1E6CE77C8;
    v11[4] = self;
    objc_msgSend(v10, "syncAllProfilesViaGatedXPCActivity:context:reason:completion:", 0, v7, CFSTR("Tinker data available for download notification"), v11);

  }
}

void __117__HDCloudSyncSubscriptionNotificationHandler__queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully completed sync for Tinker data available for download notification", (uint8_t *)&v14, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "syncStatusProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 4;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v13;
      v16 = 2114;
      v17 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Error syncing Tinker data available for download notification %{public}@", (uint8_t *)&v14, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "syncStatusProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 5;
  }
  objc_msgSend(v10, "setDataUploadRequestStatus:profileType:", v12, 3);

}

- (void)_queue_handleIncomingPrimaryMedicalIDDataAvailableForDownloadNotification
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  HDCloudSyncSubscriptionNotificationHandler *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc(MEMORY[0x1E0CB6430]);
  v4 = objc_alloc_init(MEMORY[0x1E0CB6850]);
  v5 = (void *)objc_msgSend(v3, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", 0, 0, 0, v4, 0, 1, 25);

  v6 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v5), 23, 0);
  objc_msgSend(v6, "setSyncRequest:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v12 = 0;
  v8 = objc_msgSend(WeakRetained, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 1, v6, CFSTR("Medical ID on data available notification"), &v12);
  v9 = v12;

  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5370];
  v11 = *MEMORY[0x1E0CB5370];
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Medical ID on data available notification", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v9;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Medical ID on data available notification %{public}@", buf, 0x16u);
  }

}

- (void)_queue_handleIncomingTinkerMedicalIDDataAvailableForDownloadNotification
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  HDCloudSyncSubscriptionNotificationHandler *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc(MEMORY[0x1E0CB6430]);
  v4 = objc_alloc_init(MEMORY[0x1E0CB6850]);
  v5 = (void *)objc_msgSend(v3, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", 0, 0, 0, v4, 0, 1, 25);

  v6 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v5), 23, 0);
  objc_msgSend(v6, "setSyncRequest:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v12 = 0;
  v8 = objc_msgSend(WeakRetained, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 1, v6, CFSTR("Tinker Medical ID on data available notification"), &v12);
  v9 = v12;

  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5370];
  v11 = *MEMORY[0x1E0CB5370];
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Tinker Medical ID on data available notification", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v9;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Tinker Medical ID on data available notification %{public}@", buf, 0x16u);
  }

}

- (void)_queue_handleIncomingSharedSummaryDataAvailableForDownloadNotification
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  HDCloudSyncSubscriptionNotificationHandler *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc(MEMORY[0x1E0CB6430]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CA0]), "initWithPush:pull:", 0, 1);
  v5 = (void *)objc_msgSend(v3, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", 0, 0, 0, 0, v4, 1, 25);

  v6 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v5), 25, 0);
  objc_msgSend(v6, "setSyncRequest:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v12 = 0;
  v8 = objc_msgSend(WeakRetained, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 1, v6, CFSTR("Summary sharing data available notification"), &v12);
  v9 = v12;

  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5370];
  v11 = *MEMORY[0x1E0CB5370];
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Summary sharing data available notification", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v9;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Summary sharing data available notification %{public}@", buf, 0x16u);
  }

}

- (void)_queue_handleMedicationsStateUpdatedNotification
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  HDCloudSyncSubscriptionNotificationHandler *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "stateSyncDomainForSubscriptionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", HDCloudSyncMedicationsStateChangedSubscriptionIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "analyticsSubmissionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateSync_subscriptionTriggeredDomain:", v5);

  v9 = objc_alloc(MEMORY[0x1E0CB6430]);
  v10 = objc_alloc_init(MEMORY[0x1E0CB6C58]);
  v11 = (void *)objc_msgSend(v9, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", 0, 0, v10, 0, 0, 1, 25);

  v12 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v11), 29, 0);
  objc_msgSend(v12, "setSyncRequest:", v11);
  v13 = objc_loadWeakRetained((id *)&self->_coordinator);
  v18 = 0;
  v14 = objc_msgSend(v13, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 1, v12, CFSTR("Medications subscription notification"), &v18);
  v15 = v18;

  _HKInitializeLogging();
  v16 = *MEMORY[0x1E0CB5370];
  v17 = *MEMORY[0x1E0CB5370];
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for medications on receiving subscription notification", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v15;
    _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for medications on receiving subscription notification %{public}@", buf, 0x16u);
  }

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v7;
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "Subscription notification registration complete or updated with public token \"%@\" on connection %p", (uint8_t *)&v9, 0x16u);
  }

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v15 = 138413058;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2048;
    v22 = v10;
    _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "Received per-topic push token \"%@\" for topic \"%{public}@\" identifier \"%@\" on connection %p", (uint8_t *)&v15, 0x2Au);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94F40], "notificationFromRemoteNotificationDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v5, "topic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "APS push recieved: %@ %@ (#t0)", (uint8_t *)&v11, 0x16u);

  }
  -[HDCloudSyncSubscriptionNotificationHandler _queue_handleIncomingCloudKitPushNotification:](self, "_queue_handleIncomingCloudKitPushNotification:", v7);

}

- (void)triggerSubscription:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HDCloudSyncSubscriptionNotificationHandler_triggerSubscription___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __66__HDCloudSyncSubscriptionNotificationHandler_triggerSubscription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleSubscriptionWithID:", *(_QWORD *)(a1 + 40));
}

- (void)resetSubscriptionSyncBackoff
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_lastTinkerDataDownloadTriggerTime = 0.0;
  self->_lock_lastTinkerDataUploadTriggerTime = 0.0;
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
