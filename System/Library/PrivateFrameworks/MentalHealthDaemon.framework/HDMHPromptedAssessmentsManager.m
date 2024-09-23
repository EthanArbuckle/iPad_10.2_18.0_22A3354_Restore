@implementation HDMHPromptedAssessmentsManager

- (HDMHPromptedAssessmentsManager)initWithProfile:(id)a3 periodicAssessmentsAvailability:(id)a4 loggingPatternEscalationsAvailability:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDMHPeriodicPromptedAssessmentsManager *v11;
  HDMHLoggingPatternEscalationsManager *v12;
  HDMHPromptedAssessmentsManager *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HDMHPeriodicPromptedAssessmentsManager initWithProfile:]([HDMHPeriodicPromptedAssessmentsManager alloc], "initWithProfile:", v10);
  v12 = -[HDMHLoggingPatternEscalationsManager initWithProfile:]([HDMHLoggingPatternEscalationsManager alloc], "initWithProfile:", v10);
  v13 = -[HDMHPromptedAssessmentsManager initWithProfile:periodicAssessmentsAvailability:loggingPatternEscalationsAvailability:periodicAssessmentsManager:loggingPatternEscalationsManager:](self, "initWithProfile:periodicAssessmentsAvailability:loggingPatternEscalationsAvailability:periodicAssessmentsManager:loggingPatternEscalationsManager:", v10, v9, v8, v11, v12);

  return v13;
}

- (HDMHPromptedAssessmentsManager)initWithProfile:(id)a3 periodicAssessmentsAvailability:(id)a4 loggingPatternEscalationsAvailability:(id)a5 periodicAssessmentsManager:(id)a6 loggingPatternEscalationsManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDMHPromptedAssessmentsManager *v17;
  HDMHPromptedAssessmentsManager *v18;
  uint64_t v19;
  HKFeatureStatusManager *periodicAssessmentsFeatureStatusManager;
  uint64_t v21;
  HKFeatureStatusManager *loggingPatternEscalationsFeatureStatusManager;
  id v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  HKObserverSet *observers;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HDMHPromptedAssessmentsManager;
  v17 = -[HDMHPromptedAssessmentsManager init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v12);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:", v13, v12, 0);
    periodicAssessmentsFeatureStatusManager = v18->_periodicAssessmentsFeatureStatusManager;
    v18->_periodicAssessmentsFeatureStatusManager = (HKFeatureStatusManager *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:", v14, v12, 0);
    loggingPatternEscalationsFeatureStatusManager = v18->_loggingPatternEscalationsFeatureStatusManager;
    v18->_loggingPatternEscalationsFeatureStatusManager = (HKFeatureStatusManager *)v21;

    objc_storeStrong((id *)&v18->_periodicAssessmentsManager, a6);
    objc_storeStrong((id *)&v18->_loggingPatternEscalationsManager, a7);
    v23 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "initWithName:loggingCategory:", v25, *MEMORY[0x24BDD3038]);
    observers = v18->_observers;
    v18->_observers = (HKObserverSet *)v26;

  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  if (-[HKObserverSet count](self->_observers, "count"))
    -[HDMHPromptedAssessmentsManager _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)HDMHPromptedAssessmentsManager;
  -[HDMHPromptedAssessmentsManager dealloc](&v3, sel_dealloc);
}

- (int64_t)periodicAssessmentPromptCadenceInDaysWithError:(id *)a3
{
  void *v4;
  HDMHPeriodicPromptedAssessmentsManager *periodicAssessmentsManager;
  void *v6;
  void *v7;
  int64_t v8;

  -[HKFeatureStatusManager featureStatusWithError:](self->_periodicAssessmentsFeatureStatusManager, "featureStatusWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  periodicAssessmentsManager = self->_periodicAssessmentsManager;
  objc_msgSend(v4, "onboardingRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDMHPeriodicPromptedAssessmentsManager _periodicAssessmentPromptCadenceInDaysWithFeatureSettings:](periodicAssessmentsManager, "_periodicAssessmentPromptCadenceInDaysWithFeatureSettings:", v7);

  return v8;
}

- (id)promptedAssessmentsWithError:(id *)a3
{
  void *v5;
  HDMHPeriodicPromptedAssessmentsManager *periodicAssessmentsManager;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  HDMHLoggingPatternEscalationsManager *loggingPatternEscalationsManager;
  _BOOL4 v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;

  -[HKFeatureStatusManager featureStatusWithError:](self->_periodicAssessmentsFeatureStatusManager, "featureStatusWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    periodicAssessmentsManager = self->_periodicAssessmentsManager;
    v18 = 0;
    v7 = -[HDMHPeriodicPromptedAssessmentsManager promptedAssessment:featureStatus:error:](periodicAssessmentsManager, "promptedAssessment:featureStatus:error:", &v18, v5, a3);
    v8 = v18;
    v9 = 0;
    if (v7)
    {
      -[HKFeatureStatusManager featureStatusWithError:](self->_loggingPatternEscalationsFeatureStatusManager, "featureStatusWithError:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        loggingPatternEscalationsManager = self->_loggingPatternEscalationsManager;
        v17 = 0;
        v12 = -[HDMHLoggingPatternEscalationsManager promptedAssessment:featureStatus:pendingStateOfMind:error:](loggingPatternEscalationsManager, "promptedAssessment:featureStatus:pendingStateOfMind:error:", &v17, v10, 0, a3);
        v13 = v17;
        v9 = 0;
        if (v12)
        {
          v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v15 = v14;
          if (v8)
            objc_msgSend(v14, "addObject:", v8);
          if (v13)
            objc_msgSend(v15, "addObject:", v13);
          v9 = (void *)objc_msgSend(v15, "copy");

        }
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__HDMHPromptedAssessmentsManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_2511A1F30;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

uint64_t __57__HDMHPromptedAssessmentsManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startObserving");
}

- (void)_startObserving
{
  -[HKFeatureStatusManager registerObserver:](self->_periodicAssessmentsFeatureStatusManager, "registerObserver:", self);
  -[HKFeatureStatusManager registerObserver:](self->_loggingPatternEscalationsFeatureStatusManager, "registerObserver:", self);
  -[HDMHPeriodicPromptedAssessmentsManager registerObserver:](self->_periodicAssessmentsManager, "registerObserver:", self);
  -[HDMHLoggingPatternEscalationsManager registerObserver:](self->_loggingPatternEscalationsManager, "registerObserver:", self);
}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__HDMHPromptedAssessmentsManager_unregisterObserver___block_invoke;
  v4[3] = &unk_2511A1F30;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __53__HDMHPromptedAssessmentsManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopObserving");
}

- (void)_stopObserving
{
  -[HKFeatureStatusManager unregisterObserver:](self->_periodicAssessmentsFeatureStatusManager, "unregisterObserver:", self);
  -[HKFeatureStatusManager unregisterObserver:](self->_loggingPatternEscalationsFeatureStatusManager, "unregisterObserver:", self);
  -[HDMHPeriodicPromptedAssessmentsManager unregisterObserver:](self->_periodicAssessmentsManager, "unregisterObserver:", self);
  -[HDMHLoggingPatternEscalationsManager unregisterObserver:](self->_loggingPatternEscalationsManager, "unregisterObserver:", self);
}

- (void)_notifyObserversForPromptedAssessmentsUpdate
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __78__HDMHPromptedAssessmentsManager__notifyObserversForPromptedAssessmentsUpdate__block_invoke;
  v3[3] = &unk_2511A2380;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __78__HDMHPromptedAssessmentsManager__notifyObserversForPromptedAssessmentsUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "promptedAssessmentsManagerDidUpdatePromptedAssessments:", *(_QWORD *)(a1 + 32));
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v5, "featureIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_2416F5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed change in feature status for %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[HDMHPromptedAssessmentsManager _notifyObserversForPromptedAssessmentsUpdate](self, "_notifyObserversForPromptedAssessmentsUpdate");

}

- (void)periodicPromptedAssessmentsManagerDidUpdatePromptedAssessment:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)v7 = 138543362;
    *(_QWORD *)&v7[4] = objc_opt_class();
    v6 = *(id *)&v7[4];
    _os_log_impl(&dword_2416F5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed change in periodic prompted assessment", v7, 0xCu);

  }
  -[HDMHPromptedAssessmentsManager _notifyObserversForPromptedAssessmentsUpdate](self, "_notifyObserversForPromptedAssessmentsUpdate", *(_OWORD *)v7);
}

- (void)loggingPatternEscalationsManagerDidUpdatePromptedAssessment:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)v7 = 138543362;
    *(_QWORD *)&v7[4] = objc_opt_class();
    v6 = *(id *)&v7[4];
    _os_log_impl(&dword_2416F5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed change in logging pattern escalation", v7, 0xCu);

  }
  -[HDMHPromptedAssessmentsManager _notifyObserversForPromptedAssessmentsUpdate](self, "_notifyObserversForPromptedAssessmentsUpdate", *(_OWORD *)v7);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKFeatureStatusManager)periodicAssessmentsFeatureStatusManager
{
  return self->_periodicAssessmentsFeatureStatusManager;
}

- (HKFeatureStatusManager)loggingPatternEscalationsFeatureStatusManager
{
  return self->_loggingPatternEscalationsFeatureStatusManager;
}

- (HDMHPeriodicPromptedAssessmentsManager)periodicAssessmentsManager
{
  return self->_periodicAssessmentsManager;
}

- (HDMHLoggingPatternEscalationsManager)loggingPatternEscalationsManager
{
  return self->_loggingPatternEscalationsManager;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_loggingPatternEscalationsManager, 0);
  objc_storeStrong((id *)&self->_periodicAssessmentsManager, 0);
  objc_storeStrong((id *)&self->_loggingPatternEscalationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_periodicAssessmentsFeatureStatusManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
