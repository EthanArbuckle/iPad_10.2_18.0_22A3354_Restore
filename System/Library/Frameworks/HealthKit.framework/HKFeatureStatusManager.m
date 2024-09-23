@implementation HKFeatureStatusManager

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4
{
  return -[HKFeatureStatusManager initWithFeatureIdentifier:healthStore:countryCodeSource:](self, "initWithFeatureIdentifier:healthStore:countryCodeSource:", a3, a4, 0);
}

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 currentCountryCode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKFixedCurrentCountryCodeProvider *v11;
  void *v12;
  HKFeatureStatusManager *v13;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "featureAvailabilityProvidingForFeatureIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKFixedCurrentCountryCodeProvider initWithCountryCode:]([HKFixedCurrentCountryCodeProvider alloc], "initWithCountryCode:", v8);

  +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:currentCountryCodeProvider:](HKFeatureAvailabilityRequirementEvaluationDataSource, "dataSourceWithHealthDataSource:currentCountryCodeProvider:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKFeatureStatusManager initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:](self, "initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:", v10, v12);
  return v13;
}

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 countryCodeSource:(int64_t)a5
{
  id v8;
  void *v9;
  HKFeatureStatusManager *v10;

  v8 = a4;
  objc_msgSend(v8, "featureAvailabilityProvidingForFeatureIdentifier:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKFeatureStatusManager initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:](self, "initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:", v9, v8, a5);

  return v10;
}

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 cachingDefaults:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKFixedCurrentCountryCodeProvider *v11;
  HKFeatureOnboardingRecordInaccessibilityCache *v12;
  void *v13;
  HKFeatureStatusManager *v14;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "featureAvailabilityProvidingForFeatureIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKFixedCurrentCountryCodeProvider initWithCountryCode:]([HKFixedCurrentCountryCodeProvider alloc], "initWithCountryCode:", 0);
  v12 = -[HKFeatureOnboardingRecordInaccessibilityCache initWithCachingDefaults:]([HKFeatureOnboardingRecordInaccessibilityCache alloc], "initWithCachingDefaults:", v8);

  +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:currentCountryCodeProvider:onboardingRecordFallbackProvider:](HKFeatureAvailabilityRequirementEvaluationDataSource, "dataSourceWithHealthDataSource:currentCountryCodeProvider:onboardingRecordFallbackProvider:", v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HKFeatureStatusManager initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:](self, "initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:", v10, v13);
  return v14;
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4
{
  return -[HKFeatureStatusManager initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:](self, "initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:", a3, a4, 0);
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4 currentCountryCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKFixedCurrentCountryCodeProvider *v11;
  void *v12;
  HKFeatureStatusManager *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HKFixedCurrentCountryCodeProvider initWithCountryCode:]([HKFixedCurrentCountryCodeProvider alloc], "initWithCountryCode:", v8);

  +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:currentCountryCodeProvider:](HKFeatureAvailabilityRequirementEvaluationDataSource, "dataSourceWithHealthDataSource:currentCountryCodeProvider:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKFeatureStatusManager initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:](self, "initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:", v10, v12);
  return v13;
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4 countryCodeSource:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HKFeatureStatusManager *v17;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a5 == 1)
  {
    HKPreferredRegulatoryDomainProvider();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:currentCountryCodeProvider:](HKFeatureAvailabilityRequirementEvaluationDataSource, "dataSourceWithHealthDataSource:currentCountryCodeProvider:", v11, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFeatureStatusManager.m"), 143, CFSTR("Unexpected country code source"));

      v15 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v10, "sharedRequirementEvaluationDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
      v13 = v14;
    }
    else
    {
      +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:](HKFeatureAvailabilityRequirementEvaluationDataSource, "dataSourceWithHealthDataSource:", v11);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v15 = v14;

  if (!v15)
    goto LABEL_8;
LABEL_9:
  v17 = -[HKFeatureStatusManager initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:](self, "initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:", v9, v15);

  return v17;
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKFeatureStatusManager *v9;

  v6 = a4;
  v7 = a3;
  +[HKFeatureAvailabilityContextConstraint allContexts](HKFeatureAvailabilityContextConstraint, "allContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKFeatureStatusManager initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:contextConstraint:](self, "initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:contextConstraint:", v7, v6, v8);

  return v9;
}

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 contextConstraint:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HKFeatureStatusManager *v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "featureAvailabilityProvidingForFeatureIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:](HKFeatureAvailabilityRequirementEvaluationDataSource, "dataSourceWithHealthDataSource:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HKFeatureStatusManager initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:contextConstraint:](self, "initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:contextConstraint:", v10, v11, v8);
  return v12;
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4 contextConstraint:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKFeatureStatusManager *v12;
  HKFeatureStatusManager *v13;
  HKObserverSet *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HKObserverSet *observers;
  void *v19;
  uint64_t v20;
  OS_dispatch_queue *queue;
  void *v22;
  _HKDelayedOperation *v23;
  OS_dispatch_queue *v24;
  uint64_t v25;
  _HKDelayedOperation *notifyObserversOperation;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)HKFeatureStatusManager;
  v12 = -[HKFeatureStatusManager init](&v31, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_featureAvailabilityProviding, a3);
    objc_storeStrong((id *)&v13->_strongDataSource, a4);
    objc_storeStrong((id *)&v13->_contextConstraint, a5);
    v14 = [HKObserverSet alloc];
    -[HKFeatureStatusManager description](v13, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKObserverSet initWithName:loggingCategory:](v14, "initWithName:loggingCategory:", v15, v16);
    observers = v13->_observers;
    v13->_observers = (HKObserverSet *)v17;

    objc_msgSend(v9, "featureIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HKCreateSerialDispatchQueue(v13, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v20;

    objc_msgSend(v10, "featureAvailabilityProvidingDataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setKnownFeatureAvailabilityProviding:", v13->_featureAvailabilityProviding);

    objc_initWeak(&location, v13);
    v23 = [_HKDelayedOperation alloc];
    v24 = v13->_queue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __111__HKFeatureStatusManager_initWithFeatureAvailabilityProviding_featureAvailabilityDataSource_contextConstraint___block_invoke;
    v28[3] = &unk_1E37E85F0;
    objc_copyWeak(&v29, &location);
    v25 = -[_HKDelayedOperation initWithMode:queue:delay:block:](v23, "initWithMode:queue:delay:block:", 1, v24, v28, 0.1);
    notifyObserversOperation = v13->_notifyObserversOperation;
    v13->_notifyObserversOperation = (_HKDelayedOperation *)v25;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __111__HKFeatureStatusManager_initWithFeatureAvailabilityProviding_featureAvailabilityDataSource_contextConstraint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 9);
    if (v3)
    {
      -[HKFeatureStatusManager _notifyObserversWithFeatureStatus:]((uint64_t)WeakRetained, v3);
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        __111__HKFeatureStatusManager_initWithFeatureAvailabilityProviding_featureAvailabilityDataSource_contextConstraint___block_invoke_cold_1((uint64_t)v2, v4);

    }
  }

}

- (void)_notifyObserversWithFeatureStatus:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      HKLogInfrastructure();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 48), "allObservers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = a1;
        v15 = 2114;
        v16 = v9;
        _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers for feature status update", buf, 0x16u);

      }
    }
    v10 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__HKFeatureStatusManager__notifyObserversWithFeatureStatus___block_invoke;
    v11[3] = &unk_1E37E86E0;
    v11[4] = a1;
    v12 = v3;
    objc_msgSend(v10, "notifyObservers:", v11);

  }
}

+ (id)childFeatureStatusManagerWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4 contextConstraint:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithFeatureAvailabilityProviding:featureAvailabilityDataSource:contextConstraint:", v10, v9, v8);

  v12 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = 0;

  objc_storeWeak((id *)(v11 + 24), v9);
  return (id)v11;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isObserving)
    -[HKFeatureStatusManager __unregisterForFeatureStatusChanges]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HKFeatureStatusManager;
  -[HKFeatureStatusManager dealloc](&v3, sel_dealloc);
}

- (void)__unregisterForFeatureStatusChanges
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "unregisterObserver:", a1);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v3 = WeakRetained;
    if (!WeakRetained)
      v3 = *(void **)(a1 + 32);
    v4 = v3;

    v5 = *(_QWORD **)(a1 + 80);
    if (v5 && v4)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[HKFeatureAvailabilityRequirementSet allRequirements](v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v4, "requirementSatisfactionOverridesDataSource");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 16), "featureIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "unregisterObserver:forFeature:requirement:", a1, v13, v11);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
        }
        while (v8);
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[HKFeatureAvailabilityRequirementSet allObservableRequirements](*(_QWORD **)(a1 + 80));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "unregisterObserver:fromDataSource:", a1, v4, (_QWORD)v24);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        }
        while (v16);
      }

      objc_msgSend((id)a1, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "healthDataRequirementDataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "unregisterObserver:", a1);

    }
    *(_BYTE *)(a1 + 8) = 0;
    _HKInitializeLogging();
    HKLogInfrastructure();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);

    if (v22)
    {
      HKLogInfrastructure();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v33 = a1;
        _os_log_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_INFO, "[%{public}@] Unregistered for feature status changes", buf, 0xCu);
      }

    }
  }
}

- (NSString)featureIdentifier
{
  return (NSString *)-[HKFeatureAvailabilityProviding featureIdentifier](self->_featureAvailabilityProviding, "featureIdentifier");
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSource
{
  HKFeatureAvailabilityRequirementEvaluationDataSource **p_weakDataSource;
  id WeakRetained;
  HKFeatureAvailabilityRequirementEvaluationDataSource *v6;
  HKFeatureAvailabilityRequirementEvaluationDataSource *strongDataSource;
  void *v9;

  p_weakDataSource = &self->_weakDataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakDataSource);

  if (WeakRetained)
  {
    v6 = (HKFeatureAvailabilityRequirementEvaluationDataSource *)objc_loadWeakRetained((id *)p_weakDataSource);
  }
  else
  {
    strongDataSource = self->_strongDataSource;
    if (!strongDataSource)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFeatureStatusManager.m"), 238, CFSTR("No data source for %@ has been retained!"), self);

      strongDataSource = self->_strongDataSource;
    }
    v6 = strongDataSource;
  }
  return v6;
}

- (id)featureStatusWithError:(id *)a3
{
  NSObject *queue;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HKFeatureStatusManager_featureStatusWithError___block_invoke;
  block[3] = &unk_1E37E8618;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v17;
  dispatch_sync(queue, block);
  v5 = (void *)v12[5];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v7 = (id)v18[5];
    v8 = v7;
    if (v7)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v7);
      else
        _HKLogDroppedError(v7);
    }

  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v5;
}

void __49__HKFeatureStatusManager_featureStatusWithError___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = a1[4];
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Updating feature status for client request", buf, 0xCu);
    }

  }
  v6 = a1[4];
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  -[HKFeatureStatusManager _queue_updateFeatureStatusWithRequestDrivenByObservation:error:](v6, 0, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)_queue_updateFeatureStatusWithRequestDrivenByObservation:(_QWORD *)a3 error:
{
  void *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  id obj;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v32 = 0;
    v33[0] = &v32;
    v33[1] = 0x3032000000;
    v33[2] = __Block_byref_object_copy__1;
    v33[3] = __Block_byref_object_dispose__1;
    v34 = 0;
    v7 = (id *)(a1 + 80);
    v6 = *(void **)(a1 + 80);
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v9 = *(void **)(a1 + 16);
      obj = 0;
      objc_msgSend(v9, "featureAvailabilityRequirementsWithError:", &obj);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(&v34, obj);
    }
    v10 = (void *)-[HKFeatureAvailabilityRequirementSet copyApplyingContextConstraint:]((uint64_t)v8, *(void **)(a1 + 40));

    if (v10)
    {
      -[HKFeatureStatusManager _requirementSatisfactionOverrides]((id *)a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __89__HKFeatureStatusManager__queue_updateFeatureStatusWithRequestDrivenByObservation_error___block_invoke;
      v26[3] = &unk_1E37E8668;
      v30 = &v32;
      v27 = v10;
      v28 = a1;
      v13 = v11;
      v29 = v13;
      objc_msgSend(v12, "performLocalEvaluation:", v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (!*v7)
          objc_storeStrong(v7, v10);
        v15 = *(void **)(a1 + 72);
        if (v15)
        {
          a2 = 0;
          v16 = objc_msgSend(v15, "isEqual:", v14) ^ 1;
        }
        else
        {
          v16 = 0;
        }
        if ((a2 | v16) == 1)
        {
          _HKInitializeLogging();
          HKLogInfrastructure();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);

          if (v22)
          {
            HKLogInfrastructure();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v36 = a1;
              _os_log_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_INFO, "[%{public}@] Feature status did change", buf, 0xCu);
            }

          }
          objc_storeStrong((id *)(a1 + 72), v14);
          objc_msgSend(*(id *)(a1 + 64), "execute");
        }
        else
        {
          objc_storeStrong((id *)(a1 + 72), v14);
        }
        v24 = v14;
      }
      else
      {
        v19 = *(id *)(v33[0] + 40);
        v20 = v19;
        if (v19)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v19);
          else
            _HKLogDroppedError(v19);
        }

      }
      goto LABEL_33;
    }
    _HKInitializeLogging();
    HKLogInfrastructure();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[HKFeatureStatusManager _queue_updateFeatureStatusWithRequestDrivenByObservation:error:].cold.1(a1, (uint64_t)v33, v17);

    v18 = *(id *)(v33[0] + 40);
    v13 = v18;
    if (v18)
    {
      if (a3)
      {
        v13 = objc_retainAutorelease(v18);
        v14 = 0;
        *a3 = v13;
LABEL_33:

        _Block_object_dispose(&v32, 8);
        return v14;
      }
      _HKLogDroppedError(v18);
    }
    v14 = 0;
    goto LABEL_33;
  }
  return 0;
}

- (id)_requirementSatisfactionOverrides
{
  id *v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "dataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[2], "featureIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requirementSatisfactionOverridesForFeatureWithIdentifier:", v3);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

id __89__HKFeatureStatusManager__queue_updateFeatureStatusWithRequestDrivenByObservation_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "healthDataRequirementDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(id *)(v5 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__HKFeatureStatusManager__queue_updateFeatureStatusWithRequestDrivenByObservation_error___block_invoke_2;
  v10[3] = &unk_1E37E8640;
  v6 = *(void **)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v12 = v6;
  v13 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v4, "withPrewarmedEvaluationOfRequirementSet:error:handler:", v6, &v14, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), v14);

  return v8;
}

HKFeatureStatus *__89__HKFeatureStatusManager__queue_updateFeatureStatusWithRequestDrivenByObservation_error___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  return -[HKFeatureStatusManager _queue_featureStatusWithEvaluationContext:requirements:overrides:error:](*(HKFeatureStatus **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), a2);
}

- (HKFeatureStatus)_queue_featureStatusWithEvaluationContext:(void *)a3 requirements:(void *)a4 overrides:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    -[NSDictionary featureIdentifier](a1->_requirementsEvaluationByContext, "featureIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v9, "onboardingRecordForFeatureWithIdentifier:error:", v12, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;

    if (v13)
    {
      v22 = v14;
      -[HKFeatureAvailabilityRequirementSet evaluationByContextWithDataSource:overrides:error:]((uint64_t)v10, v9, v11, &v22);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v22;

      if (v15)
      {
        a1 = -[HKFeatureStatus initWithOnboardingRecord:requirementsEvaluationByContext:]([HKFeatureStatus alloc], "initWithOnboardingRecord:requirementsEvaluationByContext:", v13, v15);
      }
      else
      {
        _HKInitializeLogging();
        HKLogInfrastructure();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[HKFeatureStatusManager _queue_featureStatusWithEvaluationContext:requirements:overrides:error:].cold.2();

        v20 = v16;
        v16 = v20;
        if (v20)
        {
          if (a5)
            *a5 = objc_retainAutorelease(v20);
          else
            _HKLogDroppedError(v20);
        }

        a1 = 0;
      }
      goto LABEL_19;
    }
    _HKInitializeLogging();
    HKLogInfrastructure();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[HKFeatureStatusManager _queue_featureStatusWithEvaluationContext:requirements:overrides:error:].cold.1();

    v18 = v14;
    v15 = v18;
    if (v18)
    {
      if (a5)
      {
        v15 = objc_retainAutorelease(v18);
        a1 = 0;
        *a5 = v15;
        v16 = v15;
LABEL_19:

        goto LABEL_20;
      }
      _HKLogDroppedError(v18);
    }
    a1 = 0;
    v16 = v15;
    goto LABEL_19;
  }
LABEL_20:

  return a1;
}

- (void)registerObserver:(id)a3
{
  -[HKFeatureStatusManager registerObserver:queue:](self, "registerObserver:queue:", a3, 0);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  HKObserverSet *observers;
  NSObject *queue;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8 = MEMORY[0x1E0C809B0];
  observers = self->_observers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__HKFeatureStatusManager_registerObserver_queue___block_invoke;
  v12[3] = &unk_1E37E8690;
  v12[4] = &v13;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v6, v7, v12);
  if (*((_BYTE *)v14 + 24))
  {
    queue = self->_queue;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __49__HKFeatureStatusManager_registerObserver_queue___block_invoke_2;
    v11[3] = &unk_1E37E6770;
    v11[4] = self;
    dispatch_sync(queue, v11);
  }
  _Block_object_dispose(&v13, 8);

}

uint64_t __49__HKFeatureStatusManager_registerObserver_queue___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __49__HKFeatureStatusManager_registerObserver_queue___block_invoke_2(uint64_t a1)
{
  -[HKFeatureStatusManager _queue_registerForFeatureStatusChanges](*(_QWORD *)(a1 + 32));
}

- (void)_queue_registerForFeatureStatusChanges
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_19A0E6000, v0, OS_LOG_TYPE_FAULT, "[%{public}@]: Error determining feature requirements during registration: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  uint64_t v5;
  HKObserverSet *observers;
  NSObject *queue;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = MEMORY[0x1E0C809B0];
  observers = self->_observers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HKFeatureStatusManager_unregisterObserver___block_invoke;
  v9[3] = &unk_1E37E8690;
  v9[4] = &v10;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", v4, v9);
  if (*((_BYTE *)v11 + 24))
  {
    queue = self->_queue;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __45__HKFeatureStatusManager_unregisterObserver___block_invoke_2;
    v8[3] = &unk_1E37E6770;
    v8[4] = self;
    dispatch_sync(queue, v8);
  }
  _Block_object_dispose(&v10, 8);

}

uint64_t __45__HKFeatureStatusManager_unregisterObserver___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __45__HKFeatureStatusManager_unregisterObserver___block_invoke_2(uint64_t a1)
{
  -[HKFeatureStatusManager _queue_unregisterForFeatureStatusChanges](*(_QWORD *)(a1 + 32));
}

- (void)_queue_unregisterForFeatureStatusChanges
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    -[HKFeatureStatusManager __unregisterForFeatureStatusChanges](a1);
  }
}

- (void)_registerForRequirementSatisfactionOverrideChangesForRequirements:(id *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[HKFeatureAvailabilityRequirementSet allRequirements](a2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
          objc_msgSend(a1, "dataSource");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "requirementSatisfactionOverridesDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[2], "featureIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __92__HKFeatureStatusManager__registerForRequirementSatisfactionOverrideChangesForRequirements___block_invoke;
          v12[3] = &unk_1E37E86B8;
          v12[4] = v7;
          objc_msgSend(v9, "registerObserver:forFeature:requirement:newValueHandler:", a1, v10, v7, v12);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

  }
}

void __92__HKFeatureStatusManager__registerForRequirementSatisfactionOverrideChangesForRequirements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v8;
      _os_log_error_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Ignoring observed override value of %{public}@ for %{public}@; invalid type",
        (uint8_t *)&v9,
        0x20u);

    }
  }
  else
  {
    -[HKFeatureStatusManager _updateOverriddenSatisfactionOfRequirement:overriddenSatisfaction:]((uint64_t)v5, *(void **)(a1 + 32), v6);
  }

}

- (void)_updateOverriddenSatisfactionOfRequirement:(void *)a3 overriddenSatisfaction:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      v9 = objc_msgSend(v6, "BOOLValue");
      _HKInitializeLogging();
      HKLogInfrastructure();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

      if (v11)
      {
        HKLogInfrastructure();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = CFSTR("is NOT");
          *(_DWORD *)buf = 138543874;
          v18 = a1;
          v19 = 2114;
          if (v9)
            v13 = CFSTR("is");
          v20 = v8;
          v21 = 2114;
          v22 = v13;
          _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Override: %{public}@ %{public}@ satisfied; updating feature status",
            buf,
            0x20u);
        }

      }
      -[HKFeatureStatusManager _updateSatisfactionOfRequirement:isSatisfied:](a1, v5, v9);
    }
    else
    {
      v14 = *(NSObject **)(a1 + 56);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __92__HKFeatureStatusManager__updateOverriddenSatisfactionOfRequirement_overriddenSatisfaction___block_invoke;
      v15[3] = &unk_1E37E6980;
      v15[4] = a1;
      v16 = v7;
      dispatch_sync(v14, v15);

    }
  }

}

uint64_t __60__HKFeatureStatusManager__notifyObserversWithFeatureStatus___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureStatusProviding:didUpdateFeatureStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKFeatureAvailabilityProviding featureIdentifier](self->_featureAvailabilityProviding, "featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@:%p>"), v4, v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  HKFeatureStatusManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Updating feature status for onboarding completion update", (uint8_t *)&v7, 0xCu);
    }

  }
  -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation]((uint64_t)self);
}

- (void)_queue_attemptFeatureStatusUpdateDrivenByObservation
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[%{public}@]: Error attempting to update feature status: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  HKFeatureStatusManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Updating feature status for paired device capability update", (uint8_t *)&v7, 0xCu);
    }

  }
  -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation]((uint64_t)self);
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  HKFeatureStatusManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Updating feature status for feature settings update", (uint8_t *)&v7, 0xCu);
    }

  }
  -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation]((uint64_t)self);
}

- (void)featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  HKFeatureStatusManager *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFeatureStatusManager _requirementSatisfactionOverrides]((id *)&self->super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overriddenSatisfactionOfRequirementWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

    if (v11)
    {
      HKLogInfrastructure();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138543618;
        v14 = self;
        v15 = 2114;
        v16 = v7;
        _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Satisfaction of %{public}@ is overridden; ignoring observed satisfaction change",
          (uint8_t *)&v13,
          0x16u);
      }

    }
  }
  else
  {
    -[HKFeatureStatusManager _updateSatisfactionOfRequirement:isSatisfied:]((uint64_t)self, v6, a4);
  }

}

- (void)_updateSatisfactionOfRequirement:(char)a3 isSatisfied:
{
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  char v12;

  v8 = a2;
  if (a1)
  {
    objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__HKFeatureStatusManager__updateSatisfactionOfRequirement_isSatisfied___block_invoke;
    block[3] = &unk_1E37E8708;
    block[4] = a1;
    v10 = v5;
    v12 = a3;
    v11 = v8;
    v7 = v5;
    dispatch_sync(v6, block);

  }
}

void __92__HKFeatureStatusManager__updateOverriddenSatisfactionOfRequirement_overriddenSatisfaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Override of %{public}@ cleared; regenerating feature status",
        (uint8_t *)&v7,
        0x16u);
    }

  }
  -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation](*(_QWORD *)(a1 + 32));
}

void __71__HKFeatureStatusManager__updateSatisfactionOfRequirement_isSatisfied___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  char v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  _BOOL4 v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  if (!v3 || (v4 = *(_QWORD *)(v2 + 80)) == 0)
  {
    if (HKFeatureAvailabilityRequirementIdentifierReflectsSensitiveData(*(void **)(a1 + 40))
      && (+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "showSensitiveLogItems"),
          v17,
          (v18 & 1) == 0))
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);

      if (v29)
      {
        HKLogInfrastructure();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v30 = *(_QWORD *)(a1 + 32);
          v34 = 138543362;
          v35 = v30;
          v25 = "[%{public}@] Requirement satisfaction changed; regenerating feature status";
          v26 = v21;
          v27 = 12;
LABEL_21:
          _os_log_impl(&dword_19A0E6000, v26, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v34, v27);
        }
LABEL_22:

      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

      if (v20)
      {
        HKLogInfrastructure();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = *(_QWORD *)(a1 + 32);
          v23 = *(_QWORD *)(a1 + 40);
          v24 = CFSTR("is");
          if (!*(_BYTE *)(a1 + 56))
            v24 = CFSTR("is NOT");
          v34 = 138543874;
          v35 = v22;
          v36 = 2114;
          v37 = v23;
          v38 = 2114;
          v39 = v24;
          v25 = "[%{public}@] %{public}@ %{public}@ satisfied; regenerating feature status";
          v26 = v21;
          v27 = 32;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
    }
    -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation](*(_QWORD *)(a1 + 32));
    return;
  }
  v5 = (void *)objc_msgSend(v3, "copyUpdatingRequirement:fromRequirements:isSatisfied:", *(_QWORD *)(a1 + 48), v4, *(unsigned __int8 *)(a1 + 56));
  if ((objc_msgSend(v5, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)) & 1) == 0)
  {
    if (HKFeatureAvailabilityRequirementIdentifierReflectsSensitiveData(*(void **)(a1 + 40))
      && (+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "showSensitiveLogItems"),
          v6,
          (v7 & 1) == 0))
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

      if (v32)
      {
        HKLogInfrastructure();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v33 = *(_QWORD *)(a1 + 32);
          v34 = 138543362;
          v35 = v33;
          v14 = "[%{public}@] Requirement satisfaction changed; updating feature status";
          v15 = v10;
          v16 = 12;
LABEL_27:
          _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v34, v16);
        }
LABEL_28:

      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

      if (v9)
      {
        HKLogInfrastructure();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          v13 = CFSTR("is");
          if (!*(_BYTE *)(a1 + 56))
            v13 = CFSTR("is NOT");
          v34 = 138543874;
          v35 = v11;
          v36 = 2114;
          v37 = v12;
          v38 = 2114;
          v39 = v13;
          v14 = "[%{public}@] %{public}@ %{public}@ satisfied; updating feature status";
          v15 = v10;
          v16 = 32;
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "execute");
  }

}

- (HKFeatureAvailabilityProviding)featureAvailabilityProviding
{
  return self->_featureAvailabilityProviding;
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)weakDataSource
{
  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)objc_loadWeakRetained((id *)&self->_weakDataSource);
}

- (void)setWeakDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_weakDataSource, a3);
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)strongDataSource
{
  return self->_strongDataSource;
}

- (void)setStrongDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_strongDataSource, a3);
}

- (HKFeatureAvailabilityContextConstraint)contextConstraint
{
  return self->_contextConstraint;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_HKDelayedOperation)notifyObserversOperation
{
  return self->_notifyObserversOperation;
}

- (void)setNotifyObserversOperation:(id)a3
{
  objc_storeStrong((id *)&self->_notifyObserversOperation, a3);
}

- (HKFeatureStatus)currentFeatureStatus
{
  return self->_currentFeatureStatus;
}

- (void)setCurrentFeatureStatus:(id)a3
{
  objc_storeStrong((id *)&self->_currentFeatureStatus, a3);
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (HKFeatureAvailabilityRequirementSet)requirements
{
  return self->_requirements;
}

- (void)setRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_requirements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_currentFeatureStatus, 0);
  objc_storeStrong((id *)&self->_notifyObserversOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_contextConstraint, 0);
  objc_storeStrong((id *)&self->_strongDataSource, 0);
  objc_destroyWeak((id *)&self->_weakDataSource);
  objc_storeStrong((id *)&self->_featureAvailabilityProviding, 0);
}

void __111__HKFeatureStatusManager_initWithFeatureAvailabilityProviding_featureAvailabilityDataSource_contextConstraint___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_fault_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_FAULT, "[%{public}@]: Asked to notify observers, but no feature status available", (uint8_t *)&v4, 0xCu);

}

- (void)_queue_updateFeatureStatusWithRequestDrivenByObservation:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_0(&dword_19A0E6000, a2, a3, "[%{public}@]: Error determining feature requirements: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

- (void)_queue_featureStatusWithEvaluationContext:requirements:overrides:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[%{public}@]: Error retrieving onboarding record: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)_queue_featureStatusWithEvaluationContext:requirements:overrides:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[%{public}@]: Error evaluating requirements by context: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
