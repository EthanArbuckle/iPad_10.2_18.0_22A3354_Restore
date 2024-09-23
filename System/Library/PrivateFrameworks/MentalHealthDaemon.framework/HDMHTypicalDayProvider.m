@implementation HDMHTypicalDayProvider

- (HDMHTypicalDayProvider)initWithProfile:(id)a3
{
  return -[HDMHTypicalDayProvider initWithProfile:userDefaults:fitnessActivityModel:](self, "initWithProfile:userDefaults:fitnessActivityModel:", a3, 0, 0);
}

- (HDMHTypicalDayProvider)initWithProfile:(id)a3 userDefaults:(id)a4 fitnessActivityModel:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDMHTypicalDayProvider *v12;
  HDMHTypicalDayProvider *v13;
  NSUserDefaults *v14;
  NSUserDefaults *userDefaults;
  uint64_t v16;
  HDProtectedDataOperation *operation;
  id v18;
  uint64_t v19;
  HKObserverSet *observers;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDMHTypicalDayProvider;
  v12 = -[HDMHTypicalDayProvider init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profile, a3);
    if (v10)
    {
      v14 = (NSUserDefaults *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "hkmh_mentalHealthDefaults");
      v14 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
    }
    userDefaults = v13->_userDefaults;
    v13->_userDefaults = v14;

    objc_storeStrong((id *)&v13->_lock_typicalDayModel, a5);
    -[HDMHTypicalDayProvider setupCachedTypicalDayMarkers](v13, "setupCachedTypicalDayMarkers");
    v13->_lock._os_unfair_lock_opaque = 0;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE40B80]), "initWithProfile:debugIdentifier:delegate:", v13->_profile, CFSTR("FITypicalDayActivityModelOperation"), v13);
    operation = v13->_operation;
    v13->_operation = (HDProtectedDataOperation *)v16;

    v18 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v19 = objc_msgSend(v18, "initWithName:loggingCategory:", CFSTR("HKMHTypicalDayProviderObservers"), *MEMORY[0x24BDD3038]);
    observers = v13->_observers;
    v13->_observers = (HKObserverSet *)v19;

  }
  return v13;
}

- (id)_typicalDayIntervalFromToday
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHTypicalDayProvider currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "hk_startOfDateBySubtractingDays:fromDate:", *MEMORY[0x24BE327F0], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v6, v5);

  return v7;
}

- (void)rebuildTypicalDayProviderForCurrentDate
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
  _os_log_error_impl(&dword_2416F5000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error requesting protected data operation work: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)setupCachedTypicalDayMarkers
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSDate *v7;
  NSDate *lock_cachedTypicalStartOfDay;
  NSDate *v9;
  NSDate *lock_cachedTypicalEndOfDay;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("TypicalDayProviderCacheLastUpdatedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

    if (v6 > 604800.0 || v6 < 0.0)
    {
      -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", 0, CFSTR("TypicalDayProviderUserStartOfDayCache"));
      -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", 0, CFSTR("TypicalDayProviderUserEndOfDayCache"));
      -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", 0, CFSTR("TypicalDayProviderCacheLastUpdatedDate"));
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("TypicalDayProviderUserStartOfDayCache"));
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lock_cachedTypicalStartOfDay = self->_lock_cachedTypicalStartOfDay;
      self->_lock_cachedTypicalStartOfDay = v7;

      -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("TypicalDayProviderUserEndOfDayCache"));
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lock_cachedTypicalEndOfDay = self->_lock_cachedTypicalEndOfDay;
      self->_lock_cachedTypicalEndOfDay = v9;

      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v13 = v15;
      _os_log_impl(&dword_2416F5000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got nil date from user defaults for _TypicalDayProviderCacheLastUpdatedDate. Not updating day markers.", (uint8_t *)&v14, 0xCu);

    }
  }

}

- (void)_updateTypicalDayMarkers
{
  os_unfair_lock_s *p_lock;
  HDMHActivityModelProviding *v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSDate *v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSDate *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSUserDefaults *userDefaults;
  void *v26;
  NSDate *lock_cachedTypicalStartOfDay;
  NSDate *v28;
  NSDate *lock_cachedTypicalEndOfDay;
  NSDate *v30;
  _BYTE v31[22];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_typicalDayModel;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (os_log_t *)MEMORY[0x24BDD3038];
    v6 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)v31 = 138543362;
      *(_QWORD *)&v31[4] = objc_opt_class();
      v8 = *(id *)&v31[4];
      _os_log_impl(&dword_2416F5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating cached start and end of day.", v31, 0xCu);

    }
    -[HDMHActivityModelProviding userStartOfDay](v4, "userStartOfDay", *(_OWORD *)v31);
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_opt_class();
      v13 = (void *)MEMORY[0x24BDBCEA0];
      v14 = v12;
      objc_msgSend(v13, "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate descriptionWithLocale:](v9, "descriptionWithLocale:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 138543618;
      *(_QWORD *)&v31[4] = v12;
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[14] = v16;
      _os_log_impl(&dword_2416F5000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start of day :%@", v31, 0x16u);

    }
    -[HDMHActivityModelProviding userEndOfDay](v4, "userEndOfDay");
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = (void *)objc_opt_class();
      v21 = (void *)MEMORY[0x24BDBCEA0];
      v22 = v20;
      objc_msgSend(v21, "currentLocale");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate descriptionWithLocale:](v17, "descriptionWithLocale:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 138543618;
      *(_QWORD *)&v31[4] = v20;
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[14] = v24;
      _os_log_impl(&dword_2416F5000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] End of day :%@", v31, 0x16u);

    }
    os_unfair_lock_lock(p_lock);
    userDefaults = self->_userDefaults;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v26, CFSTR("TypicalDayProviderCacheLastUpdatedDate"));

    lock_cachedTypicalStartOfDay = self->_lock_cachedTypicalStartOfDay;
    self->_lock_cachedTypicalStartOfDay = v9;
    v28 = v9;

    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v28, CFSTR("TypicalDayProviderUserStartOfDayCache"));
    lock_cachedTypicalEndOfDay = self->_lock_cachedTypicalEndOfDay;
    self->_lock_cachedTypicalEndOfDay = v17;
    v30 = v17;

    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v30, CFSTR("TypicalDayProviderUserEndOfDayCache"));
    os_unfair_lock_unlock(p_lock);
    -[HDMHTypicalDayProvider _updateObservers](self, "_updateObservers");
  }

}

- (id)userStartOfDay
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;
  NSDate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_cachedTypicalStartOfDay;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[HDMHTypicalDayProvider currentCalendar](self, "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMHTypicalDayProvider currentDate](self, "currentDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startOfDayForDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDMHTypicalDayProvider currentCalendar](self, "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMHTypicalDayProvider _defaultStartOfDayDateComponents](self, "_defaultStartOfDayDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v10, v8, 0);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)userEndOfDay
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;
  NSDate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_cachedTypicalEndOfDay;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[HDMHTypicalDayProvider currentCalendar](self, "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMHTypicalDayProvider currentDate](self, "currentDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startOfDayForDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDMHTypicalDayProvider currentCalendar](self, "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMHTypicalDayProvider _defaultEndOfDayDateComponents](self, "_defaultEndOfDayDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v10, v8, 0);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_defaultStartOfDayDateComponents
{
  if (_defaultStartOfDayDateComponents_onceToken[0] != -1)
    dispatch_once(_defaultStartOfDayDateComponents_onceToken, &__block_literal_global_1);
  return (id)_defaultStartOfDayDateComponents_middayDateComponents;
}

uint64_t __58__HDMHTypicalDayProvider__defaultStartOfDayDateComponents__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v1 = (void *)_defaultStartOfDayDateComponents_middayDateComponents;
  _defaultStartOfDayDateComponents_middayDateComponents = (uint64_t)v0;

  objc_msgSend((id)_defaultStartOfDayDateComponents_middayDateComponents, "setHour:", 8);
  return objc_msgSend((id)_defaultStartOfDayDateComponents_middayDateComponents, "setMinute:", 0);
}

- (id)_defaultEndOfDayDateComponents
{
  if (_defaultEndOfDayDateComponents_onceToken != -1)
    dispatch_once(&_defaultEndOfDayDateComponents_onceToken, &__block_literal_global_203);
  return (id)_defaultEndOfDayDateComponents_middayDateComponents;
}

uint64_t __56__HDMHTypicalDayProvider__defaultEndOfDayDateComponents__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v1 = (void *)_defaultEndOfDayDateComponents_middayDateComponents;
  _defaultEndOfDayDateComponents_middayDateComponents = (uint64_t)v0;

  objc_msgSend((id)_defaultEndOfDayDateComponents_middayDateComponents, "setHour:", 22);
  return objc_msgSend((id)_defaultEndOfDayDateComponents_middayDateComponents, "setMinute:", 30);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__HDMHTypicalDayProvider_registerObserver_queue___block_invoke;
  v5[3] = &unk_2511A1F30;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

uint64_t __49__HDMHTypicalDayProvider_registerObserver_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "requestWorkWithPriority:error:", 2, 0);
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_updateObservers
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__HDMHTypicalDayProvider__updateObservers__block_invoke;
  v3[3] = &unk_2511A22A8;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __42__HDMHTypicalDayProvider__updateObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "typicalDayDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (id)currentCalendar
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
}

- (id)currentDate
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BE40A10];
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithProfile:", self->_profile);
  objc_msgSend(v14, "setShouldIncludePrivateProperties:", 1);
  objc_msgSend(v14, "setShouldIncludeStatistics:", 1);
  HDActivityCacheEntityPredicateForCachesInDateComponentsRange();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __102__HDMHTypicalDayProvider_enumerateActivitySummariesFromDateComponents_toDateComponents_error_handler___block_invoke;
  v18[3] = &unk_2511A22D0;
  v19 = v10;
  v16 = v10;
  LOBYTE(a5) = objc_msgSend(v14, "enumerateActivitySummariesWithPredicate:error:handler:", v15, a5, v18);

  return (char)a5;
}

uint64_t __102__HDMHTypicalDayProvider_enumerateActivitySummariesFromDateComponents_toDateComponents_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)firstOnWristDateToday
{
  return 0;
}

- (void)typicalDayActivityModelDidUpdate
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_2416F5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Typical Day Model did update; notifying observers.",
      v6,
      0xCu);

  }
  -[HDMHTypicalDayProvider _updateTypicalDayMarkers](self, "_updateTypicalDayMarkers", *(_OWORD *)v6);
  -[HDMHTypicalDayProvider _updateObservers](self, "_updateObservers");
}

- (id)clientProvidedDefaultEndOfDay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HDMHTypicalDayProvider currentCalendar](self, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHTypicalDayProvider currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMHTypicalDayProvider currentCalendar](self, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHTypicalDayProvider _defaultEndOfDayDateComponents](self, "_defaultEndOfDayDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v7, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  os_unfair_lock_s *p_lock;
  HDMHActivityModelProviding *v8;
  void *v9;
  id v10;
  HDMHActivityModelProviding *lock_typicalDayModel;
  HDMHActivityModelProviding *v12;
  void (**v13)(void);

  p_lock = &self->_lock;
  v13 = (void (**)(void))a6;
  os_unfair_lock_lock(p_lock);
  v8 = self->_lock_typicalDayModel;
  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    -[HDMHTypicalDayProvider _typicalDayIntervalFromToday](self, "_typicalDayIntervalFromToday");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMHActivityModelProviding rebuildWithInterval:](v8, "rebuildWithInterval:", v9);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x24BE32810]);
    -[HDMHTypicalDayProvider _typicalDayIntervalFromToday](self, "_typicalDayIntervalFromToday");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (HDMHActivityModelProviding *)objc_msgSend(v10, "initForDateInterval:delegate:", v9, self);
  }

  os_unfair_lock_lock(p_lock);
  lock_typicalDayModel = self->_lock_typicalDayModel;
  self->_lock_typicalDayModel = v8;
  v12 = v8;

  os_unfair_lock_unlock(p_lock);
  -[HDMHTypicalDayProvider _updateTypicalDayMarkers](self, "_updateTypicalDayMarkers");

  v13[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_lock_cachedTypicalEndOfDay, 0);
  objc_storeStrong((id *)&self->_lock_cachedTypicalStartOfDay, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_lock_typicalDayModel, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
