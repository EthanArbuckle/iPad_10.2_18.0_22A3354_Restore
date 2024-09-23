@implementation HDHRElectrocardiogramRecordingFeatureAvailabilityManager

- (HDHRElectrocardiogramRecordingFeatureAvailabilityManager)initWithProfile:(id)a3 cacheDefaults:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D29510]);
  objc_msgSend(v6, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDaemon:remoteDisableCondition:seedExpirationCondition:", v9, *MEMORY[0x1E0CB5E00], *MEMORY[0x1E0CB5E10]);

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isCompanionCapable"))
  {
    HKHRElectrocardiogramRecordingV1FeatureAvailabilityProvider(v6, 0, v10, 0, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKHRElectrocardiogramRecordingV1FeatureAvailabilityProvider(v6, 0, v10, 0, v7, objc_msgSend(v13, "isAppleWatch") ^ 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isCompanionCapable"))
  {
    HKHRElectrocardiogramRecordingV2FeatureAvailabilityProvider(v6, 0, v10, 0, v7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKHRElectrocardiogramRecordingV2FeatureAvailabilityProvider(v6, 0, v10, 0, v7, objc_msgSend(v16, "isAppleWatch") ^ 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager initWithV1FeatureAvailabilityManager:v2FeatureAvailabilityManager:cacheDefaults:](self, "initWithV1FeatureAvailabilityManager:v2FeatureAvailabilityManager:cacheDefaults:", v12, v15, v7);

  return v17;
}

- (HDHRElectrocardiogramRecordingFeatureAvailabilityManager)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4 cacheDefaults:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v12;
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v13;
  id v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  HKFeatureAvailabilityProvidingObserver *observers;
  uint64_t v19;
  OS_dispatch_queue *observerQueue;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDHRElectrocardiogramRecordingFeatureAvailabilityManager;
  v12 = -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_needsOnboardingVersionCacheUpdate = 1;
    objc_storeStrong((id *)&v12->_v1FeatureAvailabilityManager, a3);
    objc_storeStrong((id *)&v13->_v2FeatureAvailabilityManager, a4);
    objc_storeStrong((id *)&v13->_cacheDefaults, a5);
    v14 = objc_alloc(MEMORY[0x1E0CB6988]);
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithName:loggingCategory:", v16, *MEMORY[0x1E0CB52F0]);
    observers = v13->_observers;
    v13->_observers = (HKFeatureAvailabilityProvidingObserver *)v17;

    HKCreateSerialDispatchQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    observerQueue = v13->_observerQueue;
    v13->_observerQueue = (OS_dispatch_queue *)v19;

    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager _registerForCacheUpdatedNotifications](v13, "_registerForCacheUpdatedNotifications");
    -[HDFeatureAvailabilityExtension registerObserver:queue:](v13->_v1FeatureAvailabilityManager, "registerObserver:queue:", v13, v13->_observerQueue);
    -[HDFeatureAvailabilityExtension registerObserver:queue:](v13->_v2FeatureAvailabilityManager, "registerObserver:queue:", v13, v13->_observerQueue);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[HDFeatureAvailabilityExtension unregisterObserver:](self->_v1FeatureAvailabilityManager, "unregisterObserver:", self);
  -[HDFeatureAvailabilityExtension unregisterObserver:](self->_v2FeatureAvailabilityManager, "unregisterObserver:", self);
  if (notify_is_valid_token(self->_didUpdateOnboardingCacheNotificationToken))
    notify_cancel(self->_didUpdateOnboardingCacheNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)HDHRElectrocardiogramRecordingFeatureAvailabilityManager;
  -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager dealloc](&v3, sel_dealloc);
}

- (void)_registerForCacheUpdatedNotifications
{
  const char *v3;
  NSObject *observerQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)*MEMORY[0x1E0CB5198];
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__HDHRElectrocardiogramRecordingFeatureAvailabilityManager__registerForCacheUpdatedNotifications__block_invoke;
  v5[3] = &unk_1E87EFCE0;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_didUpdateOnboardingCacheNotificationToken, observerQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __97__HDHRElectrocardiogramRecordingFeatureAvailabilityManager__registerForCacheUpdatedNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", WeakRetained);

}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CB5008];
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v20;
  id v21;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v21 = 0;
  -[HDFeatureAvailabilityExtension featureOnboardingRecordWithError:](v1FeatureAvailabilityManager, "featureOnboardingRecordWithError:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.2();
  }
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v20 = 0;
  -[HDFeatureAvailabilityExtension featureOnboardingRecordWithError:](v2FeatureAvailabilityManager, "featureOnboardingRecordWithError:", &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v9)
  {
    if (v6)
    {
      v11 = objc_msgSend(v6, "onboardingState");
      v12 = objc_msgSend(v9, "onboardingState");
      v13 = v12;
      if ((unint64_t)(v11 - 4) < 2)
      {
        if (v12 == 2)
          v16 = 2;
        else
          v16 = v11;
        if (v12 == 4)
          v16 = 4;
        if (v12 != 5)
          v13 = v16;
        goto LABEL_30;
      }
      if (v11 != 2)
      {
        if (v11 != 1)
        {
LABEL_30:
          if (objc_msgSend(v9, "onboardingState") == v13)
            v18 = v9;
          else
            v18 = v6;
          v17 = v18;
          goto LABEL_34;
        }
        if ((unint64_t)(v12 - 1) < 5)
        {
          v13 = qword_1CC2E7838[v12 - 1];
          goto LABEL_30;
        }
      }
      v13 = 2;
      goto LABEL_30;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
  }
  if (v7)
    v14 = v7;
  else
    v14 = v10;
  v15 = v14;
  if (v15)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();
  }

  v17 = 0;
LABEL_34:

  return v17;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  id v20;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v20 = 0;
  -[HDFeatureAvailabilityExtension isCurrentOnboardingVersionCompletedWithError:](v1FeatureAvailabilityManager, "isCurrentOnboardingVersionCompletedWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v19 = 0;
  -[HDFeatureAvailabilityExtension isCurrentOnboardingVersionCompletedWithError:](v2FeatureAvailabilityManager, "isCurrentOnboardingVersionCompletedWithError:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = v10;
  if (v6)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v7)
      v13 = v7;
    else
      v13 = v10;
    v14 = v13;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
      v16 = 1;
    else
      v16 = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v15, "numberWithInt:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  uint64_t v7;
  NSObject *v8;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  v5 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__7;
  v32[4] = __Block_byref_object_dispose__7;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__7;
  v31 = 0;
  dispatch_group_enter(v5);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v26[3] = &unk_1E87F0780;
  v28 = v32;
  v29 = v30;
  v8 = v5;
  v27 = v8;
  -[HDFeatureAvailabilityExtension isCurrentOnboardingVersionCompletedWithCompletion:](v1FeatureAvailabilityManager, "isCurrentOnboardingVersionCompletedWithCompletion:", v26);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__7;
  v24[4] = __Block_byref_object_dispose__7;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__7;
  v22[4] = __Block_byref_object_dispose__7;
  v23 = 0;
  dispatch_group_enter(v8);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2;
  v18[3] = &unk_1E87F0780;
  v20 = v24;
  v21 = v22;
  v10 = v8;
  v19 = v10;
  -[HDFeatureAvailabilityExtension isCurrentOnboardingVersionCompletedWithCompletion:](v2FeatureAvailabilityManager, "isCurrentOnboardingVersionCompletedWithCompletion:", v18);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_3;
  v12[3] = &unk_1E87F07A8;
  v13 = v4;
  v14 = v32;
  v15 = v24;
  v16 = v30;
  v17 = v22;
  v11 = v4;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v12);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

void __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v2 && *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    if ((objc_msgSend(v2, "BOOLValue") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "BOOLValue");
    v5 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v6, 0);

  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (!v4)
      v4 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], 0, v4);
  }
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  id v7;
  void *v8;
  id v9;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v21;
  id v22;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v22 = 0;
  v7 = a3;
  -[HDFeatureAvailabilityExtension canCompleteOnboardingForCountryCode:error:](v1FeatureAvailabilityManager, "canCompleteOnboardingForCountryCode:error:", v7, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v21 = 0;
  -[HDFeatureAvailabilityExtension canCompleteOnboardingForCountryCode:error:](v2FeatureAvailabilityManager, "canCompleteOnboardingForCountryCode:error:", v7, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v21;
  v13 = v12;
  if (v8)
    v14 = v11 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (v9)
      v15 = v9;
    else
      v15 = v12;
    v16 = v15;
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    v19 = 0;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
      v18 = 1;
    else
      v18 = objc_msgSend(v11, "BOOLValue");
    objc_msgSend(v17, "numberWithInt:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  id v7;
  void *v8;
  id v9;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  HDFeatureAvailabilityExtension *v18;
  uint64_t v19;
  id v20;
  HDFeatureAvailabilityExtension *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v45 = 0;
  v7 = a3;
  -[HDFeatureAvailabilityExtension onboardingEligibilityForCountryCode:error:](v1FeatureAvailabilityManager, "onboardingEligibilityForCountryCode:error:", v7, &v45);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v45;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v44 = 0;
  -[HDFeatureAvailabilityExtension onboardingEligibilityForCountryCode:error:](v2FeatureAvailabilityManager, "onboardingEligibilityForCountryCode:error:", v7, &v44);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v44;
  v13 = v12;
  if (v8)
    v14 = v11 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    v18 = self->_v1FeatureAvailabilityManager;
    v43 = 0;
    -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v18, "onboardedCountryCodeSupportedStateWithError:", &v43);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v43;
    v21 = self->_v2FeatureAvailabilityManager;
    v42 = 0;
    -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v21, "onboardedCountryCodeSupportedStateWithError:", &v42);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v42;
    v24 = v23;
    if (!(v19 | v22))
    {
      if (v20)
        v25 = v20;
      else
        v25 = v23;
      v26 = v25;
      if (v26)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v26);
        else
          _HKLogDroppedError();
      }

      v17 = 0;
      goto LABEL_52;
    }
    if (v19)
    {
      if (v22)
      {
        v27 = objc_msgSend((id)v19, "integerValue");
        v28 = objc_msgSend((id)v22, "integerValue");
        if ((unint64_t)(v27 - 4) < 2)
        {
          if (v28 == 5 || v28 == 4 || v28 == 2)
LABEL_39:
            v27 = v28;
        }
        else if (v27 != 2)
        {
          if (v27 == 1)
          {
            v27 = 2;
            switch(v28)
            {
              case 1:
              case 3:
                goto LABEL_41;
              case 4:
              case 5:
                goto LABEL_39;
              default:
                goto LABEL_45;
            }
          }
          v27 = v28;
          if (v28 == 1)
          {
LABEL_41:
            if (objc_msgSend(v11, "isEligible", v24))
              v30 = v11;
            else
              v30 = v8;
            v41 = v30;
            goto LABEL_51;
          }
        }
LABEL_45:
        if (v28 == v27)
          v31 = v11;
        else
          v31 = v8;
        v32 = v31;
        v41 = v32;
        if ((v27 & 0xFFFFFFFFFFFFFFFELL) != 4)
        {
          v39 = v24;
LABEL_51:
          -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier", v39);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "eligibilityRespectingOverridesForFeatureIdentifier:", v37);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v40;
          goto LABEL_52;
        }
        v33 = v32;
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v33;
        v36 = (void *)v34;
        objc_msgSend(v35, "eligibilityRespectingOverridesForFeatureIdentifier:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_52:
        goto LABEL_53;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:].cold.2();
      v29 = v8;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:].cold.1();
      v29 = v11;
    }
    v17 = v29;
    goto LABEL_52;
  }
  if (v9)
    v15 = v9;
  else
    v15 = v12;
  v16 = v15;
  v20 = v16;
  if (!v16)
    goto LABEL_26;
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_26:
    v17 = 0;
    goto LABEL_53;
  }
  v20 = objc_retainAutorelease(v16);
  v17 = 0;
  *a4 = v20;
LABEL_53:

  return v17;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  uint64_t v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  id v23;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v23 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v1FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v23);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v23;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v22 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v2FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v22);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v22;
  v11 = v10;
  if (v6 | v9)
  {
    if (!v6)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:].cold.1();
      v18 = (id)v9;
      goto LABEL_32;
    }
    if (!v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:].cold.2();
      v18 = (id)v6;
      goto LABEL_32;
    }
    v14 = objc_msgSend((id)v6, "integerValue");
    v15 = objc_msgSend((id)v9, "integerValue");
    v16 = v15;
    if ((unint64_t)(v14 - 4) >= 2)
    {
      if (v14 == 2)
      {
LABEL_14:
        v17 = 2;
        goto LABEL_30;
      }
      if (v14 == 1)
      {
        v17 = 1;
        switch(v15)
        {
          case 1:
          case 3:
            goto LABEL_30;
          case 4:
            goto LABEL_28;
          case 5:
            goto LABEL_26;
          default:
            goto LABEL_14;
        }
      }
LABEL_27:
      v17 = v16;
      if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 4)
        goto LABEL_28;
LABEL_30:
      v20 = (void *)MEMORY[0x1E0CB37E8];
      goto LABEL_31;
    }
    if (v15 == 2)
    {
      v17 = 2;
      goto LABEL_30;
    }
    if (v15 != 4)
    {
      v16 = v14;
      if (v15 != 5)
        goto LABEL_27;
LABEL_26:
      v16 = 5;
    }
LABEL_28:
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v17 = v16;
LABEL_31:
    objc_msgSend(v20, "numberWithInteger:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
    v19 = v18;
    goto LABEL_33;
  }
  if (v7)
    v12 = v7;
  else
    v12 = v10;
  v13 = v12;
  if (v13)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
  }

  v19 = 0;
LABEL_33:

  return v19;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  id v20;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v20 = 0;
  -[HDFeatureAvailabilityExtension isFeatureCapabilitySupportedOnActivePairedDeviceWithError:](v1FeatureAvailabilityManager, "isFeatureCapabilitySupportedOnActivePairedDeviceWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v19 = 0;
  -[HDFeatureAvailabilityExtension isFeatureCapabilitySupportedOnActivePairedDeviceWithError:](v2FeatureAvailabilityManager, "isFeatureCapabilitySupportedOnActivePairedDeviceWithError:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = v10;
  if (v6)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v7)
      v13 = v7;
    else
      v13 = v10;
    v14 = v13;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
      v16 = 1;
    else
      v16 = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v15, "numberWithInt:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  uint64_t v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v18 = 0;
  -[HDFeatureAvailabilityExtension earliestDateLowestOnboardingVersionCompletedWithError:](v1FeatureAvailabilityManager, "earliestDateLowestOnboardingVersionCompletedWithError:", &v18);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v18;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v17 = 0;
  -[HDFeatureAvailabilityExtension earliestDateLowestOnboardingVersionCompletedWithError:](v2FeatureAvailabilityManager, "earliestDateLowestOnboardingVersionCompletedWithError:", &v17);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (v6 | v9)
  {
    if (v6)
    {
      if (v9)
      {
        objc_msgSend((id)v6, "earlierDate:", v9);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = (id)v6;
      }
    }
    else
    {
      v14 = (id)v9;
    }
    v15 = v14;
  }
  else
  {
    if (v7)
      v12 = v7;
    else
      v12 = v10;
    v13 = v12;
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

    v15 = 0;
  }

  return v15;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  void *v6;
  id v7;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  HDFeatureAvailabilityExtension *v19;
  void *v20;
  NSObject *v21;
  id v23;
  id v24;

  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v24 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v1FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v23 = 0;
  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](v2FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  v11 = v10;
  if (v6)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v7)
      v13 = v7;
    else
      v13 = v10;
    v14 = v13;
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }
    goto LABEL_39;
  }
  v15 = objc_msgSend(v6, "integerValue");
  v16 = objc_msgSend(v9, "integerValue");
  if ((unint64_t)(v15 - 4) < 2)
  {
    if (v16 == 2)
      v17 = 2;
    else
      v17 = v15;
    if (v16 == 5 || v16 == 4)
      v15 = v16;
    else
      v15 = v17;
  }
  else if (v15 != 2)
  {
    if (v15 == 1)
    {
      v15 = 2;
      switch(v16)
      {
        case 1:
        case 3:
          goto LABEL_32;
        case 4:
        case 5:
          v15 = v16;
          goto LABEL_26;
        default:
          goto LABEL_26;
      }
    }
    v15 = v16;
    if (v16 == 1)
    {
LABEL_32:
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager pairedFeatureAttributesWithError:].cold.1(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, CFSTR("Unable to determine paired feature attributes for ECG without onboarding completion"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v14);
        else
          _HKLogDroppedError();
      }

LABEL_39:
      v20 = 0;
      goto LABEL_40;
    }
  }
LABEL_26:
  if (objc_msgSend(v9, "integerValue") == v15)
    v19 = self->_v2FeatureAvailabilityManager;
  else
    v19 = self->_v1FeatureAvailabilityManager;
  -[HDFeatureAvailabilityExtension pairedFeatureAttributesWithError:](v19, "pairedFeatureAttributesWithError:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v20;
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D2FC00], "requirementSet", a3);
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)-[HDFeatureAvailabilityExtension regionAvailabilityWithError:](self->_v2FeatureAvailabilityManager, "regionAvailabilityWithError:", a3);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  BOOL v19;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  BOOL v27;
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    v19 = 0;
LABEL_8:
    objc_initWeak((id *)buf, self);
    v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __158__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
    v21[3] = &unk_1E87F08E0;
    objc_copyWeak(v26, (id *)buf);
    v25 = v15;
    v27 = v19;
    v22 = v12;
    v26[1] = (id)a4;
    v23 = v13;
    v24 = v14;
    -[HDFeatureAvailabilityExtension setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](v2FeatureAvailabilityManager, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v22, a4, v23, v24, v21);

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  -[NSUserDefaults objectForKey:](self->_cacheDefaults, "objectForKey:", *MEMORY[0x1E0CB4D08]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  if (v17 != 3)
  {
    v19 = v17 == 4;

    goto LABEL_8;
  }
  _HKInitializeLogging();
  v18 = *MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Force ECG v1 onboarding override is set, skipping attemp to onboard v2", buf, 0xCu);
  }
  -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager _setV1CurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](self, "_setV1CurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v12, a4, v13, v14, v15);

LABEL_9:
}

void __158__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void (*v7)(void);
  os_log_t *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (a2)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    _HKInitializeLogging();
    v8 = (os_log_t *)MEMORY[0x1E0CB52F0];
    v9 = *MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __158__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v5, v9);
    if (!*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(WeakRetained, "_setV1CurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      goto LABEL_10;
    }
    _HKInitializeLogging();
    v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = WeakRetained;
      _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Force ECG v2 onboarding override is set, skipping attemp to onboard v1", (uint8_t *)&v11, 0xCu);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v7();
LABEL_10:

}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;

  v5 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:].cold.1(v6);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Saving HKOnboardingCompletion directly is not supported for ECG's combined feature identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager setFeatureSettingData:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown data setting for ECG"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager setFeatureSettingString:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown string setting for ECG"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown number setting for ECG"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager removeFeatureSettingValueForKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot remove unknown setting for ECG"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v7);

}

- (void)resetOnboardingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  HDFeatureAvailabilityExtension *v1FeatureAvailabilityManager;
  uint64_t v7;
  NSObject *v8;
  HDFeatureAvailabilityExtension *v2FeatureAvailabilityManager;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[3];
  char v33;

  v4 = a3;
  v5 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__7;
  v31 = 0;
  dispatch_group_enter(v5);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke;
  v26[3] = &unk_1E87F07D0;
  v28 = v32;
  v29 = v30;
  v8 = v5;
  v27 = v8;
  -[HDFeatureAvailabilityExtension resetOnboardingWithCompletion:](v1FeatureAvailabilityManager, "resetOnboardingWithCompletion:", v26);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__7;
  v22[4] = __Block_byref_object_dispose__7;
  v23 = 0;
  dispatch_group_enter(v8);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_2;
  v18[3] = &unk_1E87F07D0;
  v20 = v24;
  v21 = v22;
  v10 = v8;
  v19 = v10;
  -[HDFeatureAvailabilityExtension resetOnboardingWithCompletion:](v2FeatureAvailabilityManager, "resetOnboardingWithCompletion:", v18);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_3;
  v12[3] = &unk_1E87F07A8;
  v13 = v4;
  v14 = v32;
  v15 = v24;
  v16 = v30;
  v17 = v22;
  v11 = v4;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v12);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

void __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) && *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (!v2)
    v2 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], 0, v2);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HKFeatureAvailabilityProvidingObserver registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[HKFeatureAvailabilityProvidingObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  NSObject *v4;
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v6[5];
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for didUpdateOnboardingCompletion", buf, 0xCu);
  }
  -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager _observerQueue_updateCachedOnboardingVersionIfNeeded](self, "_observerQueue_updateCachedOnboardingVersionIfNeeded");
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __118__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke;
  v6[3] = &unk_1E87EF678;
  v6[4] = self;
  -[HKFeatureAvailabilityProvidingObserver notifyObservers:](observers, "notifyObservers:", v6);
}

uint64_t __118__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  NSObject *v4;
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v6[5];
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for didUpdateSettings", buf, 0xCu);
  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke;
  v6[3] = &unk_1E87EF678;
  v6[4] = self;
  -[HKFeatureAvailabilityProvidingObserver notifyObservers:](observers, "notifyObservers:", v6);
}

void __106__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdateSettings:", *(_QWORD *)(a1 + 32));

}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  NSObject *v4;
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v6[5];
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for didUpdatePairedDeviceCapability", buf, 0xCu);
  }
  -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager _observerQueue_updateCachedOnboardingVersionIfNeeded](self, "_observerQueue_updateCachedOnboardingVersionIfNeeded");
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __120__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdatePairedDeviceCapability___block_invoke;
  v6[3] = &unk_1E87EF678;
  v6[4] = self;
  -[HKFeatureAvailabilityProvidingObserver notifyObservers:](observers, "notifyObservers:", v6);
}

void __120__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdatePairedDeviceCapability___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdatePairedDeviceCapability:", *(_QWORD *)(a1 + 32));

}

- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3
{
  NSObject *v4;
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v6[5];
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for didUpdateRegionAvailability", buf, 0xCu);
  }
  -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager _observerQueue_updateCachedOnboardingVersionIfNeeded](self, "_observerQueue_updateCachedOnboardingVersionIfNeeded");
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __116__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityExtensionDidUpdateRegionAvailability___block_invoke;
  v6[3] = &unk_1E87EF678;
  v6[4] = self;
  -[HKFeatureAvailabilityProvidingObserver notifyObservers:](observers, "notifyObservers:", v6);
}

void __116__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityExtensionDidUpdateRegionAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF9CBA60))
    objc_msgSend(v3, "featureAvailabilityExtensionDidUpdateRegionAvailability:", *(_QWORD *)(a1 + 32));

}

- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3
{
  NSObject *v4;
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v6[5];
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for onboardingCompletionDataDidBecomeAvailable", buf, 0xCu);
  }
  if (self->_needsOnboardingVersionCacheUpdate)
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager _observerQueue_updateCachedOnboardingVersionIfNeeded](self, "_observerQueue_updateCachedOnboardingVersionIfNeeded");
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __131__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable___block_invoke;
  v6[3] = &unk_1E87EF678;
  v6[4] = self;
  -[HKFeatureAvailabilityProvidingObserver notifyObservers:](observers, "notifyObservers:", v6);
}

void __131__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF9CBA60))
    objc_msgSend(v3, "featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:", *(_QWORD *)(a1 + 32));

}

- (void)_setV1CurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager v1FeatureAvailabilityManager](self, "v1FeatureAvailabilityManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __161__HDHRElectrocardiogramRecordingFeatureAvailabilityManager__setV1CurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
  v18[3] = &unk_1E87F0908;
  v19 = v12;
  v17 = v12;
  objc_msgSend(v16, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v15, a4, v14, v13, v18);

}

uint64_t __161__HDHRElectrocardiogramRecordingFeatureAvailabilityManager__setV1CurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)a2)
    a2 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, a2);
}

- (void)_observerQueue_updateCachedOnboardingVersionIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSInteger v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v20;
  __int16 v21;
  NSInteger v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if ((v4 & 1) == 0)
  {
    v18 = 0;
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
    if (v5
      && (objc_msgSend(v5, "onboardingCompletion"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      if (objc_msgSend(v5, "onboardingState") != 1)
      {
        v8 = *MEMORY[0x1E0CB4D30];
        v9 = -[NSUserDefaults integerForKey:](self->_cacheDefaults, "integerForKey:", *MEMORY[0x1E0CB4D30]);
        objc_msgSend(v5, "onboardingCompletion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "version");

        if (v9 == v11)
        {
          _HKInitializeLogging();
          v12 = *MEMORY[0x1E0CB52F0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v20 = self;
            v21 = 2048;
            v22 = v9;
            _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Current onboarding version matched cached version (%ld)", buf, 0x16u);
          }
          goto LABEL_18;
        }
        -[NSUserDefaults setInteger:forKey:](self->_cacheDefaults, "setInteger:forKey:", v11, v8);
        _HKInitializeLogging();
        v14 = *MEMORY[0x1E0CB52F0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v20 = self;
          v21 = 2048;
          v22 = v11;
          _os_log_impl(&dword_1CC29C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updated cached onboarding version to %ld", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isCompanionCapable");

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          HKSynchronizeNanoPreferencesUserDefaults();

        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = self;
        _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completions found when trying to update cached onboarding version", buf, 0xCu);
      }
      if (v6)
      {
        if (objc_msgSend(v6, "code") == 6)
          self->_needsOnboardingVersionCacheUpdate = 1;
        goto LABEL_18;
      }
    }
    self->_needsOnboardingVersionCacheUpdate = 0;
LABEL_18:

  }
}

- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager
{
  return self->_v1FeatureAvailabilityManager;
}

- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager
{
  return self->_v2FeatureAvailabilityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_v2FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_cacheDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Failed to retrieve onboarding record for ECG2: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)featureOnboardingRecordWithError:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Failed to retrieve onboarding record for ECG1: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)onboardingEligibilityForCountryCode:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, v0, v1, "Error checking onboarded country code supported state for ECG 1.0, returning supported state for 2.0: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)onboardingEligibilityForCountryCode:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, v0, v1, "Error checking onboarded country code supported state for ECG 2.0, returning supported state for 1.0: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pairedFeatureAttributesWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "Unable to determine paired feature attributes for ECG without onboarding completion", v1, 2u);
}

void __158__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to complete ECG 2.0 onboarding with error: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)saveOnboardingCompletion:(void *)a1 settings:completion:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  id v3;
  uint8_t v4[24];

  v1 = OUTLINED_FUNCTION_5(a1);
  objc_opt_class();
  OUTLINED_FUNCTION_6_0();
  v3 = v2;
  _os_log_error_impl(&dword_1CC29C000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Saving HKOnboardingCompletion directly is not supported for ECG's combined feature identifier", v4, 0xCu);

}

- (void)setFeatureSettingData:forKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Unknown data setting for ECG: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)setFeatureSettingString:forKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Unknown string setting for ECG: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)setFeatureSettingNumber:forKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Unknown number setting for ECG: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)removeFeatureSettingValueForKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Unknown setting for ECG: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

@end
