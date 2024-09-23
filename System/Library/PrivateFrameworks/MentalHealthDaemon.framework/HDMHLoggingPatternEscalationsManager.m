@implementation HDMHLoggingPatternEscalationsManager

- (HDMHLoggingPatternEscalationsManager)initWithProfile:(id)a3
{
  id v4;
  HDMHLoggingPatternEscalationsManager *v5;
  HDMHLoggingPatternEscalationsManager *v6;
  id v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  HKObserverSet *observers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMHLoggingPatternEscalationsManager;
  v5 = -[HDMHLoggingPatternEscalationsManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithName:loggingCategory:", v9, *MEMORY[0x24BDD3038]);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v10;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (-[HKObserverSet count](self->_observers, "count"))
    -[HDMHLoggingPatternEscalationsManager _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)HDMHLoggingPatternEscalationsManager;
  -[HDMHLoggingPatternEscalationsManager dealloc](&v3, sel_dealloc);
}

- (BOOL)promptedAssessment:(id *)a3 featureStatus:(id)a4 pendingStateOfMind:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  HDMHLoggingPatternDetector *v15;
  id WeakRetained;
  HDMHLoggingPatternDetector *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v26;

  v10 = a5;
  v11 = a4;
  -[HDMHLoggingPatternEscalationsManager _currentDate](self, "_currentDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHLoggingPatternEscalationsManager _currentGregorianCalendar](self, "_currentGregorianCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDMHLoggingPatternEscalationsManager _areEscalationsSupportedAndNotSnoozedWithCurrentDate:gregorianCalendar:featureStatus:](self, "_areEscalationsSupportedAndNotSnoozedWithCurrentDate:gregorianCalendar:featureStatus:", v12, v13, v11);

  if (v14)
  {
    v15 = [HDMHLoggingPatternDetector alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v17 = -[HDMHLoggingPatternDetector initWithProfile:](v15, "initWithProfile:", WeakRetained);

    v26 = 0;
    -[HDMHLoggingPatternDetector isUnpleasantLoggingPatternDetectedWithCurrentDate:gregorianCalendar:pendingStateOfMind:error:](v17, "isUnpleasantLoggingPatternDetectedWithCurrentDate:gregorianCalendar:pendingStateOfMind:error:", v12, v13, v10, &v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;
    v20 = v18 != 0;
    if (v18)
    {
      if (!objc_msgSend(v18, "BOOLValue"))
      {
LABEL_14:

        goto LABEL_15;
      }
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65DD8]), "initWithEligibilityStartDate:reason:", v12, 2);
      v22 = v21;
      if (a3)
      {
        v22 = objc_retainAutorelease(v21);
        *a3 = v22;
      }
    }
    else
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x24BDD3038];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
        -[HDMHLoggingPatternEscalationsManager promptedAssessment:featureStatus:pendingStateOfMind:error:].cold.1(v23, (uint64_t)self, (uint64_t)v19);
      v24 = v19;
      v22 = v24;
      if (v24)
      {
        if (a6)
        {
          v22 = objc_retainAutorelease(v24);
          *a6 = v22;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }

    goto LABEL_14;
  }
  v20 = 1;
LABEL_15:

  return v20;
}

- (BOOL)_areEscalationsSupportedAndNotSnoozedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 featureStatus:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BDD2CA8];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "areAllRequirementsSatisfied");

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v10, "onboardingRecord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "featureSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDMHLoggingPatternEscalationsManager _areEscalationsSnoozedWithCurrentDate:gregorianCalendar:featureSettings:](self, "_areEscalationsSnoozedWithCurrentDate:gregorianCalendar:featureSettings:", v8, v9, v15);

    v17 = !v16;
  }
  else
  {
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x24BDD3038];
    v17 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = (void *)objc_opt_class();
      v21 = v20;
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "unsatisfiedRequirementIdentifiersDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v20;
      v27 = 2114;
      v28 = v23;
      _os_log_impl(&dword_2416F5000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Escalations not supported due to: %{public}@", (uint8_t *)&v25, 0x16u);

      v17 = 0;
    }
  }

  return v17;
}

- (BOOL)_areEscalationsSnoozedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 featureSettings:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a4;
  -[HDMHLoggingPatternEscalationsManager _lastEscalationAcknowledgmentDateWithFeatureSettings:](self, "_lastEscalationAcknowledgmentDateWithFeatureSettings:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "hk_startOfDateByAddingDays:toDate:", *MEMORY[0x24BE65D78], v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hk_isBeforeDate:", v8))
      v12 = objc_msgSend(v11, "hk_isAfterDate:", v8);
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_lastEscalationAcknowledgmentDateWithFeatureSettings:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "numberForKey:", *MEMORY[0x24BE65D08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_currentDate
{
  NSDate *unitTest_currentDate;

  unitTest_currentDate = self->_unitTest_currentDate;
  if (unitTest_currentDate)
    return unitTest_currentDate;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_currentGregorianCalendar
{
  NSCalendar *unitTest_gregorianCalendar;

  unitTest_gregorianCalendar = self->_unitTest_gregorianCalendar;
  if (unitTest_gregorianCalendar)
    return unitTest_gregorianCalendar;
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)registerObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__HDMHLoggingPatternEscalationsManager_registerObserver___block_invoke;
  v4[3] = &unk_2511A1F30;
  v4[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, 0, v4);
}

uint64_t __57__HDMHLoggingPatternEscalationsManager_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startObserving");
}

- (void)_startObserving
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F08], "stateOfMindType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forDataType:", self, v4);

}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__HDMHLoggingPatternEscalationsManager_unregisterObserver___block_invoke;
  v4[3] = &unk_2511A1F30;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __59__HDMHLoggingPatternEscalationsManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopObserving");
}

- (void)_stopObserving
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F08], "stateOfMindType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forDataType:", self, v4);

}

- (void)_notifyObserversForPromptedAssessmentUpdate
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __83__HDMHLoggingPatternEscalationsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke;
  v3[3] = &unk_2511A1F58;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __83__HDMHLoggingPatternEscalationsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loggingPatternEscalationsManagerDidUpdatePromptedAssessment:", *(_QWORD *)(a1 + 32));
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)v8 = 138543362;
    *(_QWORD *)&v8[4] = objc_opt_class();
    v7 = *(id *)&v8[4];
    _os_log_impl(&dword_2416F5000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed samples added", v8, 0xCu);

  }
  -[HDMHLoggingPatternEscalationsManager _notifyObserversForPromptedAssessmentUpdate](self, "_notifyObserversForPromptedAssessmentUpdate", *(_OWORD *)v8);
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)v8 = 138543362;
    *(_QWORD *)&v8[4] = objc_opt_class();
    v7 = *(id *)&v8[4];
    _os_log_impl(&dword_2416F5000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed samples removed", v8, 0xCu);

  }
  -[HDMHLoggingPatternEscalationsManager _notifyObserversForPromptedAssessmentUpdate](self, "_notifyObserversForPromptedAssessmentUpdate", *(_OWORD *)v8);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSCalendar)unitTest_gregorianCalendar
{
  return self->_unitTest_gregorianCalendar;
}

- (void)setUnitTest_gregorianCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)promptedAssessment:(uint64_t)a3 featureStatus:pendingStateOfMind:error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_2416F5000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error seeking pattern in logging: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
