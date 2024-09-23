@implementation HDHRHeartbeatSeriesFeatureExclusivityManager

- (HDHRHeartbeatSeriesFeatureExclusivityManager)initWithIrregularRhythmNotificationsStatusManager:(id)a3 aFibHistoryStatusManager:(id)a4 profile:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDHRHeartbeatSeriesFeatureExclusivityManager *v12;
  HDHRHeartbeatSeriesFeatureExclusivityManager *v13;
  uint64_t v14;
  OS_dispatch_queue *queue;
  id v16;
  OS_dispatch_queue *v17;
  uint64_t v18;
  _HKDelayedOperation *disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation;
  HDHRHeartbeatSeriesFeatureExclusivityManager *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v11, "profileType") == 1)
  {
    v28.receiver = self;
    v28.super_class = (Class)HDHRHeartbeatSeriesFeatureExclusivityManager;
    v12 = -[HDHRHeartbeatSeriesFeatureExclusivityManager init](&v28, sel_init);
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_irregularRhythmNotificationsStatusManager, a3);
      objc_storeStrong((id *)&v13->_aFibHistoryStatusManager, a4);
      HKCreateSerialDispatchQueue();
      v14 = objc_claimAutoreleasedReturnValue();
      queue = v13->_queue;
      v13->_queue = (OS_dispatch_queue *)v14;

      objc_initWeak(&location, v13);
      v16 = objc_alloc(MEMORY[0x1E0CB6F80]);
      v17 = v13->_queue;
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __131__HDHRHeartbeatSeriesFeatureExclusivityManager_initWithIrregularRhythmNotificationsStatusManager_aFibHistoryStatusManager_profile___block_invoke;
      v25 = &unk_1E87F01B8;
      objc_copyWeak(&v26, &location);
      v18 = objc_msgSend(v16, "initWithMode:queue:delay:block:", 1, v17, &v22, 0.25);
      disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation = v13->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation;
      v13->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation = (_HKDelayedOperation *)v18;

      -[HDHRHeartbeatSeriesFeatureExclusivityManager _scheduleInitialMaintenanceOperationWithProfile:](v13, "_scheduleInitialMaintenanceOperationWithProfile:", v11, v22, v23, v24, v25);
      -[HKFeatureStatusManager registerObserver:queue:](v13->_irregularRhythmNotificationsStatusManager, "registerObserver:queue:", v13, v13->_queue);
      -[HKFeatureStatusManager registerObserver:queue:](v13->_aFibHistoryStatusManager, "registerObserver:queue:", v13, v13->_queue);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    self = v13;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __131__HDHRHeartbeatSeriesFeatureExclusivityManager_initWithIrregularRhythmNotificationsStatusManager_aFibHistoryStatusManager_profile___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled");

}

- (void)dealloc
{
  objc_super v3;

  -[_HKDelayedOperation invalidate](self->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDHRHeartbeatSeriesFeatureExclusivityManager;
  -[HDHRHeartbeatSeriesFeatureExclusivityManager dealloc](&v3, sel_dealloc);
}

- (void)_scheduleInitialMaintenanceOperationWithProfile:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  OS_dispatch_queue *queue;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D294D0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __96__HDHRHeartbeatSeriesFeatureExclusivityManager__scheduleInitialMaintenanceOperationWithProfile___block_invoke;
  v18 = &unk_1E87F01B8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v5, "maintenanceOperationWithName:queue:synchronousBlock:", v7, queue, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v10 = (id)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    v12 = v11;
    _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling initial maintenance operation", buf, 0xCu);

  }
  objc_msgSend(v4, "daemon", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "maintenanceWorkCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enqueueMaintenanceOperation:", v9);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __96__HDHRHeartbeatSeriesFeatureExclusivityManager__scheduleInitialMaintenanceOperationWithProfile___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      LODWORD(v9) = 138543362;
      *(_QWORD *)((char *)&v9 + 4) = objc_opt_class();
      v4 = *(id *)((char *)&v9 + 4);
      _os_log_impl(&dword_1CC29C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running initial maintenance operation", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(WeakRetained[1], "featureStatusWithError:", 0, v9);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = WeakRetained[5];
    WeakRetained[5] = (id)v5;

    objc_msgSend(WeakRetained[2], "featureStatusWithError:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = WeakRetained[6];
    WeakRetained[6] = (id)v7;

    objc_msgSend(WeakRetained, "_queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled");
  }

}

- (void)_queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled
{
  _BOOL4 v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_irregularRhythmNotificationsStatus)
  {
    if (self->_aFibHistoryStatus)
    {
      v3 = -[HDHRHeartbeatSeriesFeatureExclusivityManager _isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:](self, "_isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:");
      v4 = -[HDHRHeartbeatSeriesFeatureExclusivityManager _isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:](self, "_isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:", self->_aFibHistoryStatus);
      if (v3 && v4)
      {
        -[HKFeatureStatus onboardingRecord](self->_irregularRhythmNotificationsStatus, "onboardingRecord");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "featureSettings");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *MEMORY[0x1E0CB50C8];
        objc_msgSend(v6, "numberForKey:", *MEMORY[0x1E0CB50C8]);
        v8 = objc_claimAutoreleasedReturnValue();

        if (v8 && (-[NSObject BOOLValue](v8, "BOOLValue") & 1) != 0)
        {
          -[HKFeatureStatusManager featureAvailabilityProviding](self->_irregularRhythmNotificationsStatusManager, "featureAvailabilityProviding");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __112__HDHRHeartbeatSeriesFeatureExclusivityManager__queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled__block_invoke;
          v18[3] = &unk_1E87EFB60;
          v18[4] = self;
          objc_msgSend(v9, "setFeatureSettingNumber:forKey:completion:", MEMORY[0x1E0C9AAA0], v7, v18);

        }
        else
        {
          _HKInitializeLogging();
          v15 = (void *)*MEMORY[0x1E0CB52F0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            *(_DWORD *)buf = 138543362;
            v20 = (id)objc_opt_class();
            v17 = v20;
            _os_log_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Nothing to do: IRN is off", buf, 0xCu);

          }
        }
        goto LABEL_15;
      }
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E0CB52F0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        return;
      v8 = v14;
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v11 = v20;
      v12 = "[%{public}@] Nothing to do: at least one feature is unavailable for usage";
    }
    else
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB52F0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        return;
      v8 = v13;
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v11 = v20;
      v12 = "[%{public}@] No feature status available for AFib History: cannot proceed";
    }
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB52F0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      return;
    v8 = v10;
    *(_DWORD *)buf = 138543362;
    v20 = (id)objc_opt_class();
    v11 = v20;
    v12 = "[%{public}@] No feature status available for IRN: cannot proceed";
  }
  _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);

LABEL_15:
}

void __112__HDHRHeartbeatSeriesFeatureExclusivityManager__queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52F0];
  v7 = *MEMORY[0x1E0CB52F0];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      *(_DWORD *)v10 = 138543362;
      *(_QWORD *)&v10[4] = objc_opt_class();
      v9 = *(id *)&v10[4];
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully turned off IRN; firing notification",
        v10,
        0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff", *(_OWORD *)v10);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __112__HDHRHeartbeatSeriesFeatureExclusivityManager__queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled__block_invoke_cold_1(a1, v6);
  }

}

- (BOOL)_isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = *MEMORY[0x1E0CB4ED0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "areAllRequirementsSatisfied");

  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "unsatisfiedRequirementIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB4F78]);

  }
  else
  {
    v10 = 0;
  }

  return v6 | v10;
}

- (void)_fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**unitTesting_postNotificationHandler)(id, id);
  _QWORD v9[5];

  v3 = objc_alloc_init(MEMORY[0x1E0D298D0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IRREGULAR_RHYTHM_NOTIFICATIONS_DISABLED_DUE_TO_AFIB_HISTORY_TITLE"), &stru_1E87F0B08, CFSTR("Localizable-AFibBurden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("IRREGULAR_RHYTHM_NOTIFICATIONS_DISABLED_DUE_TO_AFIB_HISTORY_BODY"), &stru_1E87F0B08, CFSTR("Localizable-AFibBurden"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v7);

  objc_msgSend(v3, "setAlertLevel:", 3);
  unitTesting_postNotificationHandler = (void (**)(id, id))self->___unitTesting_postNotificationHandler;
  if (unitTesting_postNotificationHandler)
  {
    unitTesting_postNotificationHandler[2](unitTesting_postNotificationHandler, v3);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __112__HDHRHeartbeatSeriesFeatureExclusivityManager__fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff__block_invoke;
    v9[3] = &unk_1E87F0870;
    v9[4] = self;
    objc_msgSend(v3, "presentWithResponseHandler:", v9);
  }

}

void __112__HDHRHeartbeatSeriesFeatureExclusivityManager__fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;

  v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __112__HDHRHeartbeatSeriesFeatureExclusivityManager__fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff__block_invoke_cold_1(a1, v6);
  }

}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  objc_class *v6;
  NSObject *queue;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;

  v6 = (objc_class *)a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v8, "featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB4FF8]);
  v10 = 40;
  if ((_DWORD)v8)
    v10 = 48;
  v11 = *(Class *)((char *)&self->super.isa + v10);
  *(Class *)((char *)&self->super.isa + v10) = v6;
  v12 = v6;

  -[_HKDelayedOperation execute](self->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation, "execute");
}

- (id)__unitTesting_postNotificationHandler
{
  return self->___unitTesting_postNotificationHandler;
}

- (void)set__unitTesting_postNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->___unitTesting_postNotificationHandler, 0);
  objc_storeStrong((id *)&self->_aFibHistoryStatus, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsStatus, 0);
  objc_storeStrong((id *)&self->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_aFibHistoryStatusManager, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsStatusManager, 0);
}

void __112__HDHRHeartbeatSeriesFeatureExclusivityManager__queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_3(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Failed to turned off IRN: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

void __112__HDHRHeartbeatSeriesFeatureExclusivityManager__fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_3(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Failed to post notification: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end
