@implementation HDMHPeriodicPromptedAssessmentsManager

- (HDMHPeriodicPromptedAssessmentsManager)initWithProfile:(id)a3
{
  id v4;
  HDMHPeriodicPromptedAssessmentsManager *v5;
  HDMHPeriodicPromptedAssessmentsManager *v6;
  id v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  HKObserverSet *observers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMHPeriodicPromptedAssessmentsManager;
  v5 = -[HDMHPeriodicPromptedAssessmentsManager init](&v13, sel_init);
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
    -[HDMHPeriodicPromptedAssessmentsManager _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)HDMHPeriodicPromptedAssessmentsManager;
  -[HDMHPeriodicPromptedAssessmentsManager dealloc](&v3, sel_dealloc);
}

- (BOOL)promptedAssessment:(id *)a3 featureStatus:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = *MEMORY[0x24BDD2CA8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "areAllRequirementsSatisfied");

  if ((v11 & 1) != 0)
  {
    v30 = 0;
    -[HDMHPeriodicPromptedAssessmentsManager _promptedAssessmentEligibilityStartDateWithFeatureStatus:error:](self, "_promptedAssessmentEligibilityStartDateWithFeatureStatus:error:", v8, &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    v14 = v12 != 0;
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x24BDD3038];
    v16 = *MEMORY[0x24BDD3038];
    if (v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v15;
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        v33 = 2114;
        v34 = v12;
        v19 = v18;
        _os_log_impl(&dword_2416F5000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Next periodic prompted assessment due date: %{public}@", buf, 0x16u);

      }
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65DD8]), "initWithEligibilityStartDate:reason:", v12, 1);
      v21 = v20;
      if (a3)
      {
        v21 = objc_retainAutorelease(v20);
        *a3 = v21;
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[HDMHPeriodicPromptedAssessmentsManager promptedAssessment:featureStatus:error:].cold.1(v15, (uint64_t)self, (uint64_t)v13);
      v28 = v13;
      v21 = v28;
      if (v28)
      {
        if (a5)
        {
          v21 = objc_retainAutorelease(v28);
          *a5 = v21;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = (void *)objc_opt_class();
      v25 = v24;
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "unsatisfiedRequirementIdentifiersDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 2114;
      v34 = v27;
      _os_log_impl(&dword_2416F5000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Periodic assessments not supported due to: %{public}@", buf, 0x16u);

    }
    v14 = 1;
  }

  return v14;
}

- (id)_promptedAssessmentEligibilityStartDateWithFeatureStatus:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  objc_msgSend(a3, "onboardingRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  -[HDMHPeriodicPromptedAssessmentsManager _mostRecentAssessmentInteractionDateWithFeatureSettings:error:](self, "_mostRecentAssessmentInteractionDateWithFeatureSettings:error:", v7, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  if (v9)
  {
    if (a4)
    {
      v10 = 0;
      *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError();
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v6, "featureSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HDMHPeriodicPromptedAssessmentsManager _periodicAssessmentPromptCadenceInDaysWithFeatureSettings:](self, "_periodicAssessmentPromptCadenceInDaysWithFeatureSettings:", v11);

    if (v8)
    {
      -[HDMHPeriodicPromptedAssessmentsManager _currentGregorianCalendar](self, "_currentGregorianCalendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hk_startOfDateByAddingDays:toDate:", v12, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "earliestDateOfAnyOnboardingCompletion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMHPeriodicPromptedAssessmentsManager _currentDate](self, "_currentDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "hk_isAfterDate:", v14);
      -[HDMHPeriodicPromptedAssessmentsManager _currentGregorianCalendar](self, "_currentGregorianCalendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
        v18 = v14;
      else
        v18 = v13;
      objc_msgSend(v16, "hk_startOfDateByAddingDays:toDate:", v12, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (id)_mostRecentAssessmentInteractionDateWithFeatureSettings:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[HDMHPeriodicPromptedAssessmentsManager _mostRecentAssessmentDateWithError:](self, "_mostRecentAssessmentDateWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHPeriodicPromptedAssessmentsManager _lastPromptAcknowledgmentDateWithFeatureSettings:](self, "_lastPromptAcknowledgmentDateWithFeatureSettings:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMHPeriodicPromptedAssessmentsManager _currentDate](self, "_currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hk_isAfterDate:", v9))
  {

    v7 = 0;
  }
  if (objc_msgSend(v8, "hk_isAfterDate:", v9))
  {

    v8 = 0;
    v10 = v7 != 0;
  }
  else
  {
    v10 = v7 != 0;
    if (v7 && v8)
    {
      objc_msgSend(v7, "laterDate:", v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  if (v10)
    v12 = v7;
  else
    v12 = v8;
  v11 = v12;
LABEL_12:
  v13 = v11;

  return v13;
}

- (id)_mostRecentAssessmentDateWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3720]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHPeriodicPromptedAssessmentsManager _mostRecentSampleStartDateForSampleType:error:](self, "_mostRecentSampleStartDateForSampleType:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3728]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHPeriodicPromptedAssessmentsManager _mostRecentSampleStartDateForSampleType:error:](self, "_mostRecentSampleStartDateForSampleType:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v6)
      v10 = v6;
    else
      v10 = v8;
    v11 = v10;
  }
  else
  {
    objc_msgSend(v6, "laterDate:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (id)_mostRecentSampleStartDateForSampleType:(id)a3 error:(id *)a4
{
  void *v5;
  HDProfile **p_profile;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BE40BC0];
  p_profile = &self->_profile;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v5, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v7, WeakRetained, 0, 0, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_lastPromptAcknowledgmentDateWithFeatureSettings:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "numberForKey:", *MEMORY[0x24BE65D10]);
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

- (int64_t)_periodicAssessmentPromptCadenceInDaysWithFeatureSettings:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "numberForKey:", *MEMORY[0x24BE65D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "integerValue") > 0)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = *MEMORY[0x24BE65D00];

  return v5;
}

- (void)registerObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__HDMHPeriodicPromptedAssessmentsManager_registerObserver___block_invoke;
  v4[3] = &unk_2511A1F30;
  v4[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, 0, v4);
}

uint64_t __59__HDMHPeriodicPromptedAssessmentsManager_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startObserving");
}

- (void)_startObserving
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3720]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forDataType:", self, v6);

  v9 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v9, "dataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3728]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forDataType:", self, v8);

}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__HDMHPeriodicPromptedAssessmentsManager_unregisterObserver___block_invoke;
  v4[3] = &unk_2511A1F30;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __61__HDMHPeriodicPromptedAssessmentsManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopObserving");
}

- (void)_stopObserving
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3720]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forDataType:", self, v6);

  v9 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v9, "dataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3728]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forDataType:", self, v8);

}

- (void)_notifyObserversForPromptedAssessmentUpdate
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __85__HDMHPeriodicPromptedAssessmentsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke;
  v3[3] = &unk_2511A2078;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __85__HDMHPeriodicPromptedAssessmentsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicPromptedAssessmentsManagerDidUpdatePromptedAssessment:", *(_QWORD *)(a1 + 32));
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
  -[HDMHPeriodicPromptedAssessmentsManager _notifyObserversForPromptedAssessmentUpdate](self, "_notifyObserversForPromptedAssessmentUpdate", *(_OWORD *)v8);
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
  -[HDMHPeriodicPromptedAssessmentsManager _notifyObserversForPromptedAssessmentUpdate](self, "_notifyObserversForPromptedAssessmentUpdate", *(_OWORD *)v8);
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

- (void)promptedAssessment:(void *)a1 featureStatus:(uint64_t)a2 error:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
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
  _os_log_error_impl(&dword_2416F5000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error determining eligibility start date: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
