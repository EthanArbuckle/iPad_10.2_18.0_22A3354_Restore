@implementation HDHeartbeatSeriesFeatureStatusManager

- (HDHeartbeatSeriesFeatureStatusManager)initWithClient:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HDHeartbeatSeriesFeatureStatusManager *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileExtensionWithIdentifier:", *MEMORY[0x1E0D2FB48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EF9CD0C0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeartbeatSeriesFeatureStatusManager.m"), 35, CFSTR("Profile extension that provides feature availability extensions must be used"));

  }
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EF9CCED0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeartbeatSeriesFeatureStatusManager.m"), 36, CFSTR("Profile extension that provides heart defaults must be installed"));

  }
  objc_msgSend(v7, "heartNotificationsUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(v9, "featureAvailabilityExtensionForFeatureIdentifier:", *MEMORY[0x1E0CB5038]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeartbeatSeriesFeatureStatusManager.m"), 43, CFSTR("IRN feature availability extension not installed"));

  }
  objc_msgSend(v9, "irregularRhythmNotificationsFeatureStatusManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeartbeatSeriesFeatureStatusManager.m"), 45, CFSTR("IRN feature status manager not installed"));

  }
  objc_msgSend(v9, "featureAvailabilityExtensionForFeatureIdentifier:", *MEMORY[0x1E0CB4FF8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeartbeatSeriesFeatureStatusManager.m"), 48, CFSTR("AFib Burden feature availability extension not installed"));

  }
  v13 = objc_alloc(MEMORY[0x1E0CB6730]);
  objc_msgSend(v5, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFeatureAvailabilityProviding:healthDataSource:", v12, v14);

  objc_msgSend(v5, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HDHeartbeatSeriesFeatureStatusManager initWithProfile:aFibBurdenFeatureStatusManager:irregularRhythmNotificationsFeatureStatusManager:heartNotificationsUserDefaults:](self, "initWithProfile:aFibBurdenFeatureStatusManager:irregularRhythmNotificationsFeatureStatusManager:heartNotificationsUserDefaults:", v16, v15, v11, v8);
  return v17;
}

- (HDHeartbeatSeriesFeatureStatusManager)initWithProfile:(id)a3 aFibBurdenFeatureStatusManager:(id)a4 irregularRhythmNotificationsFeatureStatusManager:(id)a5 heartNotificationsUserDefaults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDHeartbeatSeriesFeatureStatusManager *v14;
  HDHeartbeatSeriesFeatureStatusManager *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HDHeartbeatSeriesFeatureStatusManager;
  v14 = -[HDHeartbeatSeriesFeatureStatusManager init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v15->_heartNotificationsUserDefaults, a6);
    objc_storeStrong((id *)&v15->_aFibBurdenFeatureStatusManager, a4);
    objc_storeStrong((id *)&v15->_irregularRhythmNotificationsFeatureStatusManager, a5);
  }

  return v15;
}

- (void)startObservingChangesWithDelegate:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  char v13;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  OS_dispatch_queue *queue;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x1E0CB52E8];
  v6 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2114;
    v24 = WeakRetained;
    _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observing changes with delegate %{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_delegate, v4);

  v11 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDataProtectedByFirstUnlockAvailable");

  if ((v13 & 1) == 0)
  {
    _HKInitializeLogging();
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      v17 = v16;
      _os_log_impl(&dword_1CC29C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] First unlock has not occurred, registering to notify when it has", buf, 0xCu);

    }
    objc_msgSend(v11, "database");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__HDHeartbeatSeriesFeatureStatusManager_startObservingChangesWithDelegate___block_invoke;
    v20[3] = &unk_1E87EF6F0;
    v20[4] = self;
    objc_msgSend(v18, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v20);

  }
  -[HKFeatureStatusManager registerObserver:queue:](self->_aFibBurdenFeatureStatusManager, "registerObserver:queue:", self, self->_queue);
  -[HKFeatureStatusManager registerObserver:queue:](self->_irregularRhythmNotificationsFeatureStatusManager, "registerObserver:queue:", self, self->_queue);

}

uint64_t __75__HDHeartbeatSeriesFeatureStatusManager_startObservingChangesWithDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v4 = *(id *)&v6[4];
    _os_log_impl(&dword_1CC29C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying for first unlock", v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfCurrentState", *(_OWORD *)v6);
}

- (void)stopObservingChanges
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observing changes", v6, 0xCu);

  }
  -[HKFeatureStatusManager unregisterObserver:](self->_aFibBurdenFeatureStatusManager, "unregisterObserver:", self, *(_OWORD *)v6);
  -[HKFeatureStatusManager unregisterObserver:](self->_irregularRhythmNotificationsFeatureStatusManager, "unregisterObserver:", self);
}

- (void)notifyDelegateOfCurrentState
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received request to notify delegate of current state", v6, 0xCu);

  }
  -[HDHeartbeatSeriesFeatureStatusManager _notifyDelegateOfCurrentState](self, "_notifyDelegateOfCurrentState", *(_OWORD *)v6);
}

- (void)_notifyDelegateOfCurrentState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__HDHeartbeatSeriesFeatureStatusManager__notifyDelegateOfCurrentState__block_invoke;
  v2[3] = &unk_1E87F0190;
  v2[4] = self;
  -[HDHeartbeatSeriesFeatureStatusManager getPredominantFeatureWithCompletion:](self, "getPredominantFeatureWithCompletion:", v2);
}

void __70__HDHeartbeatSeriesFeatureStatusManager__notifyDelegateOfCurrentState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    objc_msgSend(WeakRetained, "heartbeatSeriesFeatureStatusManager:didUpdatePredominantFeature:", v7, objc_msgSend(v9, "integerValue"));
  }
  else if (v5)
  {
    objc_msgSend(WeakRetained, "heartbeatSeriesFeatureStatusManager:didFailToUpdateWithError:", v7, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2000, CFSTR("Unknown failure to update predominant feature"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "heartbeatSeriesFeatureStatusManager:didFailToUpdateWithError:", v7, v8);

  }
}

- (void)getPredominantFeatureWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:](self, "predominantFeatureWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)predominantFeatureWithError:(id *)a3
{
  HKFeatureStatusManager *aFibBurdenFeatureStatusManager;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  id v21;
  NSObject *v22;
  HKFeatureStatusManager *irregularRhythmNotificationsFeatureStatusManager;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  id v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  aFibBurdenFeatureStatusManager = self->_aFibBurdenFeatureStatusManager;
  v34 = 0;
  -[HKFeatureStatusManager featureStatusWithError:](aFibBurdenFeatureStatusManager, "featureStatusWithError:", &v34);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v34;
  if (v6)
  {
    v8 = *MEMORY[0x1E0CB4ED0];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "areAllRequirementsSatisfied"))
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      if (v11)
      {
        HKHRAFibBurdenLogForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.2((uint64_t)self, v12);
LABEL_15:
        v15 = &unk_1E87FF020;
        v21 = v7;
LABEL_44:

        v7 = v21;
        goto LABEL_45;
      }
LABEL_16:
      v15 = &unk_1E87FF020;
      goto LABEL_45;
    }
    objc_msgSend(v9, "unsatisfiedRequirementIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = *MEMORY[0x1E0CB4F78];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToArray:", v17);

    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

    if (v18)
    {
      if (v20)
      {
        HKHRAFibBurdenLogForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.3((uint64_t)self, v12);
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if (v20)
    {
      HKHRAFibBurdenLogForCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.8();

    }
    irregularRhythmNotificationsFeatureStatusManager = self->_irregularRhythmNotificationsFeatureStatusManager;
    v33 = v7;
    -[HKFeatureStatusManager featureStatusWithError:](irregularRhythmNotificationsFeatureStatusManager, "featureStatusWithError:", &v33);
    v12 = objc_claimAutoreleasedReturnValue();
    v21 = v33;

    if (v12)
    {
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v8);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "areAllRequirementsSatisfied"))
      {
        -[NSObject onboardingRecord](v12, "onboardingRecord");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "onboardingCompletion");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "featureIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB5048]);

        _HKInitializeLogging();
        v29 = (void *)*MEMORY[0x1E0CB52E8];
        v30 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEBUG);
        if (v28)
        {
          if (v30)
            -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.5(v29);
          v15 = &unk_1E87FF038;
        }
        else
        {
          if (v30)
            -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.6(v29);
          v15 = &unk_1E87FF050;
        }

      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEBUG))
          -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.7();
        v15 = &unk_1E87FF068;
      }
      goto LABEL_43;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.4();
    v31 = v21;
    v24 = v31;
    if (v31)
    {
      if (a3)
      {
        v24 = objc_retainAutorelease(v31);
        v15 = 0;
        *a3 = v24;
LABEL_43:

        goto LABEL_44;
      }
      _HKLogDroppedError();
    }
    v15 = 0;
    goto LABEL_43;
  }
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.1((uint64_t)self, v13);

  v14 = v7;
  v9 = v14;
  if (!v14)
  {
LABEL_28:
    v15 = 0;
    v7 = v9;
    goto LABEL_45;
  }
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_28;
  }
  v9 = objc_retainAutorelease(v14);
  v15 = 0;
  *a3 = v9;
  v7 = v9;
LABEL_45:

  return v15;
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB52E8];
  v9 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_opt_class();
    v12 = v11;
    objc_msgSend(v6, "featureIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v13;
    _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received feature status update for %{public}@", (uint8_t *)&v14, 0x16u);

  }
  _HKInitializeLogging();
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
    -[HDHeartbeatSeriesFeatureStatusManager featureStatusProviding:didUpdateFeatureStatus:].cold.1();
  -[HDHeartbeatSeriesFeatureStatusManager _notifyDelegateOfCurrentState](self, "_notifyDelegateOfCurrentState");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_aFibBurdenFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)predominantFeatureWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint8_t v5[24];

  v3 = (void *)OUTLINED_FUNCTION_8_0();
  v4 = OUTLINED_FUNCTION_7(v3);
  _os_log_error_impl(&dword_1CC29C000, a2, OS_LOG_TYPE_ERROR, "[%@] Error reading feature status for AFib Burden", v5, 0xCu);

  OUTLINED_FUNCTION_8();
}

- (void)predominantFeatureWithError:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_8_0();
  v4 = OUTLINED_FUNCTION_7(v3);
  OUTLINED_FUNCTION_3_3(&dword_1CC29C000, a2, v5, "[%@] Predominant feature is AFib Burden", v6);

  OUTLINED_FUNCTION_8();
}

- (void)predominantFeatureWithError:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_8_0();
  v4 = OUTLINED_FUNCTION_7(v3);
  OUTLINED_FUNCTION_3_3(&dword_1CC29C000, a2, v5, "[%@] Predominant feature is AFib Burden though feature is not yet enabled due to IRN being enabled", v6);

  OUTLINED_FUNCTION_8();
}

- (void)predominantFeatureWithError:.cold.4()
{
  NSObject *v0;
  id v1;
  void *v2;
  id v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  _os_log_error_impl(&dword_1CC29C000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Error reading feature state for IRN: %{public}@", v4, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)predominantFeatureWithError:(void *)a1 .cold.5(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_7(v2);
  OUTLINED_FUNCTION_3_3(&dword_1CC29C000, v1, v4, "[%{public}@] Predominant feature is IRNv2", v5);

  OUTLINED_FUNCTION_8();
}

- (void)predominantFeatureWithError:(void *)a1 .cold.6(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_7(v2);
  OUTLINED_FUNCTION_3_3(&dword_1CC29C000, v1, v4, "[%{public}@] Predominant feature is IRN", v5);

  OUTLINED_FUNCTION_8();
}

- (void)predominantFeatureWithError:.cold.7()
{
  void *v0;
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = v3;
  objc_msgSend(v0, "unsatisfiedRequirementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v3;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_0_3(&dword_1CC29C000, v1, v6, "[%{public}@] IRN is not available due to unmet requirements %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)predominantFeatureWithError:.cold.8()
{
  NSObject *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  OUTLINED_FUNCTION_6();
  v2 = (void *)OUTLINED_FUNCTION_8_0();
  v3 = v2;
  objc_msgSend(v1, "unsatisfiedRequirementIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v2;
  v8 = 2114;
  v9 = v4;
  OUTLINED_FUNCTION_0_3(&dword_1CC29C000, v0, v5, "[%{public}@] AFibBurden is not available due to unmet requirements %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)featureStatusProviding:didUpdateFeatureStatus:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_0_3(&dword_1CC29C000, v0, v4, "[%{public}@] Feature status: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
