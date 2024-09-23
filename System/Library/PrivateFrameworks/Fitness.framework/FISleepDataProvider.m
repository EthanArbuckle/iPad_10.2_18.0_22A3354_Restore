@implementation FISleepDataProvider

- (FISleepDataProvider)initWithSleepStore:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  FISleepDataProvider *v9;
  FISleepDataProvider *v10;
  id v11;
  uint64_t v12;
  NSUserDefaults *userDefaults;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FISleepDataProvider;
  v9 = -[FISleepDataProvider init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sleepStore, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = objc_alloc(MEMORY[0x24BDBCF50]);
    v12 = objc_msgSend(v11, "initWithSuiteName:", *MEMORY[0x24BDD46A0]);
    userDefaults = v10->_userDefaults;
    v10->_userDefaults = (NSUserDefaults *)v12;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)activate
{
  -[FISleepDataProvider _fetchGoodMorningAlertNotificationEnabled](self, "_fetchGoodMorningAlertNotificationEnabled");
  -[FISleepDataProvider _fetchLastGoodMorningDismissedDate](self, "_fetchLastGoodMorningDismissedDate");
  -[FISleepDataProvider _fetchLastAlarmWakeUpDate](self, "_fetchLastAlarmWakeUpDate");
  -[FISleepDataProvider _updateCurrentSleepScheduleState](self, "_updateCurrentSleepScheduleState");
  -[FISleepDataProvider _initialLoadSleepUserDay](self, "_initialLoadSleepUserDay");
  -[HKSPSleepStore addObserver:](self->_sleepStore, "addObserver:", self);
}

- (void)dealloc
{
  objc_super v3;

  -[HKSPSleepStore removeObserver:](self->_sleepStore, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)FISleepDataProvider;
  -[FISleepDataProvider dealloc](&v3, sel_dealloc);
}

- (FISleepUserDay)sleepUserDay
{
  os_unfair_lock_s *p_lock;
  FISleepUserDay *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sleepUserDay;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDate)lastGoodMorningDismissedDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastGoodMorningDismissedDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isGoodMorningAlertNotificationEnabled
{
  FISleepDataProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isGoodMorningAlertNotificationEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDate)lastAlarmWakeUpDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastAlarmWakeUpDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isUserAwake
{
  FISleepDataProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_currentSleepScheduleState == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_initialLoadSleepUserDay
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x24BDD2FC8];
  v4 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_21168F000, v4, OS_LOG_TYPE_DEFAULT, "Sleep data provider - initial load sleep user day", (uint8_t *)&v24, 2u);
  }
  -[FISleepDataProvider _fetchCachedSleepUserDay](self, "_fetchCachedSleepUserDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -600.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hk_isAfterOrEqualToDate:", v8);

  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v11, "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isDateInToday:", v13);

  if (v5)
    v15 = v10;
  else
    v15 = 0;
  v16 = v15 & v14;
  _HKInitializeLogging();
  v17 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    objc_msgSend(v5, "creationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v19;
    v26 = 1024;
    LODWORD(v27) = v16;
    _os_log_impl(&dword_21168F000, v18, OS_LOG_TYPE_DEFAULT, "Sleep data provider - cached sleep user day creation date %@; is valid %d",
      (uint8_t *)&v24,
      0x12u);

  }
  if (v16)
  {
    _HKInitializeLogging();
    v20 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v5, "startOfDay");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endOfDay");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v22;
      v26 = 2112;
      v27 = v23;
      _os_log_impl(&dword_21168F000, v21, OS_LOG_TYPE_DEFAULT, "Sleep data provider - cached sleep user day start of day (%@) end of day (%@)", (uint8_t *)&v24, 0x16u);

    }
    if ((objc_msgSend(v5, "isEmpty") & 1) != 0)
      -[FISleepDataProvider _setEmptySleepUserDay:](self, "_setEmptySleepUserDay:", v5);
    else
      -[FISleepDataProvider _setSleepUserDay:](self, "_setSleepUserDay:", v5);
  }
  else
  {
    -[FISleepDataProvider _updateSleepUserDay](self, "_updateSleepUserDay");
  }

}

- (void)_updateSleepUserDay
{
  os_log_t *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  HKSPSleepStore *sleepStore;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  os_log_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x24BDD2FC8];
  v4 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21168F000, v4, OS_LOG_TYPE_DEFAULT, "Sleep data provider - updating sleep user day", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  sleepStore = self->_sleepStore;
  v20 = 0;
  -[HKSPSleepStore nextEventDueAfterDate:error:](sleepStore, "nextEventDueAfterDate:error:", v6, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  v10 = v9;
  if (!v8 || v9)
  {
    _HKInitializeLogging();
    v15 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v10, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v17;
      v18 = "Sleep data provider - did not find sleep event (%@) error (%@)";
LABEL_16:
      _os_log_impl(&dword_21168F000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);

    }
LABEL_17:
    -[FISleepDataProvider _clearSleepUserDay](self, "_clearSleepUserDay");
    goto LABEL_20;
  }
  objc_msgSend(v8, "dueDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FISleepDataProvider _isDate:within24HoursOfDate:](self, "_isDate:within24HoursOfDate:", v11, v6);

  if (!v12)
  {
    _HKInitializeLogging();
    v19 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v19;
      objc_msgSend(v8, "dueDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v17;
      v23 = 2112;
      v24 = v6;
      v18 = "Sleep data provider - next event (%@) > 24 hours from current date (%@)";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v14 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_21168F000, v14, OS_LOG_TYPE_DEFAULT, "Sleep data provider - updating with identifier %@", buf, 0xCu);
  }
  if (v13 == (void *)*MEMORY[0x24BEA95C8])
  {
    -[FISleepDataProvider _updateSleepUserDayFromWakeUp:currentDate:](self, "_updateSleepUserDayFromWakeUp:currentDate:", v8, v6);
  }
  else if (v13 == (void *)*MEMORY[0x24BEA95D8] || v13 == (void *)*MEMORY[0x24BEA95A0])
  {
    -[FISleepDataProvider _updateSleepUserDayFromWindDownOrBedtime:currentDate:](self, "_updateSleepUserDayFromWindDownOrBedtime:currentDate:", v8, v6);
  }

LABEL_20:
}

- (void)_updateSleepUserDayFromWakeUp:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  HKSPSleepStore *sleepStore;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sleepStore = self->_sleepStore;
  objc_msgSend(v6, "dueDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  -[HKSPSleepStore nextEventDueAfterDate:error:](sleepStore, "nextEventDueAfterDate:error:", v9, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v11, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v15;
      v16 = "Sleep data provider - error fetching next event after wake up (%@) error (%@)";
LABEL_11:
      _os_log_impl(&dword_21168F000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_msgSend(v10, "dueDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FISleepDataProvider _isDate:within24HoursOfDate:](self, "_isDate:within24HoursOfDate:", v17, v7);

  if (!v18)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v21;
      objc_msgSend(v10, "dueDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v15;
      v25 = 2112;
      v26 = v7;
      v16 = "Sleep data provider - next event after wake up (%@) > 24 hours from current date (%@)";
      goto LABEL_11;
    }
LABEL_12:
    -[FISleepDataProvider _clearSleepUserDay](self, "_clearSleepUserDay");
    goto LABEL_13;
  }
  objc_msgSend(v6, "dueDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dueDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FISleepDataProvider _setSleepUserDayWithStartOfDay:endOfDay:](self, "_setSleepUserDayWithStartOfDay:endOfDay:", v19, v20);

LABEL_13:
}

- (void)_updateSleepUserDayFromWindDownOrBedtime:(id)a3 currentDate:(id)a4
{
  id v5;
  HKSPSleepStore *sleepStore;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HKSPSleepStore *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sleepStore = self->_sleepStore;
  v25 = 0;
  -[HKSPSleepStore sleepScheduleModelWithError:](sleepStore, "sleepScheduleModelWithError:", &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (!v8)
  {
    objc_msgSend(v7, "previousEventWithIdentifier:dueBeforeDate:", *MEMORY[0x24BEA95C8], v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (-[FISleepDataProvider _isDate:within24HoursOfDate:](self, "_isDate:within24HoursOfDate:", v13, v5))
      {
        v14 = self->_sleepStore;
        v24 = 0;
        -[HKSPSleepStore nextEventDueAfterDate:error:](v14, "nextEventDueAfterDate:error:", v13, &v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v24;
        if (v9)
        {
          _HKInitializeLogging();
          v16 = (void *)*MEMORY[0x24BDD2FC8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            objc_msgSend(v9, "localizedDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v27 = v18;
            _os_log_impl(&dword_21168F000, v17, OS_LOG_TYPE_DEFAULT, "Sleep data provider - error fetching next event after previous wake up event (%@)", buf, 0xCu);

          }
          -[FISleepDataProvider _clearSleepUserDay](self, "_clearSleepUserDay");
        }
        else
        {
          objc_msgSend(v15, "dueDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[FISleepDataProvider _setSleepUserDayWithStartOfDay:endOfDay:](self, "_setSleepUserDayWithStartOfDay:endOfDay:", v13, v23);

        }
        goto LABEL_17;
      }
      _HKInitializeLogging();
      v22 = *MEMORY[0x24BDD2FC8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v13;
        v28 = 2112;
        v29 = v5;
        _os_log_impl(&dword_21168F000, v22, OS_LOG_TYPE_DEFAULT, "Sleep data provider - previous wake up event before wind down or bedtime (%@) > 24 hours from current date (%@)", buf, 0x16u);
      }
    }
    else
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x24BDD2FC8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        objc_msgSend(0, "localizedDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = 0;
        v28 = 2112;
        v29 = v21;
        _os_log_impl(&dword_21168F000, v20, OS_LOG_TYPE_DEFAULT, "Sleep data provider - error fetching next event after 24 hours before wind down or bedtime (%@) error (%@)", buf, 0x16u);

      }
    }
    -[FISleepDataProvider _clearSleepUserDay](self, "_clearSleepUserDay");
    v9 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v9 = v8;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v9, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v12;
    _os_log_impl(&dword_21168F000, v11, OS_LOG_TYPE_DEFAULT, "Sleep data provider - error fetching sleep model for wind down or bedtime event error (%@)", buf, 0xCu);

  }
LABEL_18:

}

- (void)_clearSleepUserDay
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21168F000, v3, OS_LOG_TYPE_DEFAULT, "Sleep data provider - clearing sleep user start of day", v5, 2u);
  }
  v4 = -[FISleepUserDay initEmptySleepUserDay]([FISleepUserDay alloc], "initEmptySleepUserDay");
  -[FISleepDataProvider _setEmptySleepUserDay:](self, "_setEmptySleepUserDay:", v4);

}

- (void)_setEmptySleepUserDay:(id)a3
{
  os_unfair_lock_s *p_lock;
  FISleepUserDay *sleepUserDay;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  sleepUserDay = self->_sleepUserDay;
  self->_sleepUserDay = 0;

  os_unfair_lock_unlock(p_lock);
  -[FISleepDataProvider _cacheSleepUserDay:](self, "_cacheSleepUserDay:", v6);

}

- (void)_setSleepUserDayWithStartOfDay:(id)a3 endOfDay:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  FISleepUserDay *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_21168F000, v8, OS_LOG_TYPE_DEFAULT, "Sleep data provider - setting sleep user start of day (%@) end of day (%@)", (uint8_t *)&v10, 0x16u);
  }
  v9 = -[FISleepUserDay initWithStartOfDay:endOfDay:]([FISleepUserDay alloc], "initWithStartOfDay:endOfDay:", v6, v7);
  -[FISleepDataProvider _setSleepUserDay:](self, "_setSleepUserDay:", v9);

}

- (void)_setSleepUserDay:(id)a3
{
  FISleepUserDay *v4;
  FISleepUserDay *sleepUserDay;
  FISleepUserDay *v6;

  v4 = (FISleepUserDay *)a3;
  os_unfair_lock_lock(&self->_lock);
  sleepUserDay = self->_sleepUserDay;
  self->_sleepUserDay = v4;
  v6 = v4;

  os_unfair_lock_unlock(&self->_lock);
  -[FISleepDataProvider _cacheSleepUserDay:](self, "_cacheSleepUserDay:", v6);

}

- (void)_fetchLastGoodMorningDismissedDate
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_5(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21168F000, v3, v4, "Sleep data provider - failed to fetch current sleep event record (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (BOOL)_updateLastGoodMorningDismissedDateIfNeeded:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  id *p_lastGoodMorningDismissedDate;
  NSDate *lastGoodMorningDismissedDate;
  BOOL v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastGoodMorningDismissedDate = self->_lastGoodMorningDismissedDate;
  p_lastGoodMorningDismissedDate = (id *)&self->_lastGoodMorningDismissedDate;
  v9 = -[NSDate isEqualToDate:](lastGoodMorningDismissedDate, "isEqualToDate:", v5);
  if (!v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *p_lastGoodMorningDismissedDate;
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_21168F000, v10, OS_LOG_TYPE_DEFAULT, "Sleep data provider - last good morning dismissed date (%@ -> %@)", (uint8_t *)&v13, 0x16u);
    }
    objc_storeStrong(p_lastGoodMorningDismissedDate, a3);
  }
  os_unfair_lock_unlock(p_lock);

  return !v9;
}

- (void)_fetchGoodMorningAlertNotificationEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_5(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21168F000, v3, v4, "Sleep data provider - failed to fetch current sleep schedule model (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (BOOL)_updateGoodMorningAlertNotificationEnabledIfNeeded:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int isGoodMorningAlertNotificationEnabled;
  NSObject *v7;
  _BOOL4 v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  isGoodMorningAlertNotificationEnabled = self->_isGoodMorningAlertNotificationEnabled;
  if (isGoodMorningAlertNotificationEnabled != v3)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_isGoodMorningAlertNotificationEnabled;
      v10[0] = 67109376;
      v10[1] = v8;
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_21168F000, v7, OS_LOG_TYPE_DEFAULT, "Sleep data provider - updated good morning alert notification enabled (%d -> %d)", (uint8_t *)v10, 0xEu);
    }
    self->_isGoodMorningAlertNotificationEnabled = v3;
  }
  os_unfair_lock_unlock(p_lock);
  return isGoodMorningAlertNotificationEnabled != v3;
}

- (void)_fetchLastAlarmWakeUpDate
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_5(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21168F000, v3, v4, "Sleep data provider - failed to fetch current sleep event record for wake up date (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (BOOL)_updateLastAlarmWakeUpDateIfNeeded:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  id *p_lastAlarmWakeUpDate;
  NSDate *lastAlarmWakeUpDate;
  BOOL v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastAlarmWakeUpDate = self->_lastAlarmWakeUpDate;
  p_lastAlarmWakeUpDate = (id *)&self->_lastAlarmWakeUpDate;
  v9 = -[NSDate isEqualToDate:](lastAlarmWakeUpDate, "isEqualToDate:", v5);
  if (!v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *p_lastAlarmWakeUpDate;
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_21168F000, v10, OS_LOG_TYPE_DEFAULT, "Sleep data provider - updated last alarm wake up date (%@ -> %@)", (uint8_t *)&v13, 0x16u);
    }
    objc_storeStrong(p_lastAlarmWakeUpDate, a3);
  }
  os_unfair_lock_unlock(p_lock);

  return !v9;
}

- (void)_updateCurrentSleepScheduleState
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_5(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21168F000, v3, v4, "Sleep data provider - failed to fetch current sleep schedule state update, setting state to disabled (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_clearCurrentSleepScheduleState
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_currentSleepScheduleState = 0;
  os_unfair_lock_unlock(p_lock);
}

- (id)_fetchCachedSleepUserDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults valueForKey:](self->_userDefaults, "valueForKey:", CFSTR("cachedSleepUserDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v5, v2, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v7)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_ERROR))
        -[FISleepDataProvider _fetchCachedSleepUserDay].cold.1();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_cacheSleepUserDay:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_ERROR))
      -[FISleepDataProvider _cacheSleepUserDay:].cold.1();
  }
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("cachedSleepUserDay"));

}

- (BOOL)_isDate:(id)a3 within24HoursOfDate:(id)a4
{
  BOOL result;
  double v5;

  result = 0;
  if (a3)
  {
    if (a4)
    {
      objc_msgSend(a3, "timeIntervalSinceDate:", a4);
      return fabs(v5) <= 86400.0;
    }
  }
  return result;
}

- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4
{
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "Sleep store schedule did change; updating sleep data provider and notifying observers",
      v7,
      2u);
  }
  -[FISleepDataProvider _updateSleepUserDay](self, "_updateSleepUserDay");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sleepDataProviderUserDayDidUpdate");

}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "Sleep store settings did change; updating sleep data provider and notifying observers",
      v7,
      2u);
  }
  -[FISleepDataProvider _updateSleepUserDay](self, "_updateSleepUserDay");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sleepDataProviderUserDayDidUpdate");

}

- (void)sleepStore:(id)a3 sleepScheduleStateDidChange:(unint64_t)a4
{
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "Sleep store state did change; updating sleep data provider and notifying observers",
      v7,
      2u);
  }
  -[FISleepDataProvider _updateCurrentSleepScheduleState](self, "_updateCurrentSleepScheduleState");
  -[FISleepDataProvider _updateSleepUserDay](self, "_updateSleepUserDay");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sleepDataProviderUserDayDidUpdate");

}

- (void)sleepStore:(id)a3 sleepModeOnDidChange:(BOOL)a4
{
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "Sleep store mode did change; updating sleep data provider and notifying observers",
      v7,
      2u);
  }
  -[FISleepDataProvider _updateSleepUserDay](self, "_updateSleepUserDay");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sleepDataProviderUserDayDidUpdate");

}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  id WeakRetained;
  NSObject *v14;
  id v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = a4;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x24BDD2FC8];
  v7 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21168F000, v7, OS_LOG_TYPE_DEFAULT, "Sleep store record did change; updating sleep data provider and notifying observers",
      buf,
      2u);
  }
  objc_msgSend(v5, "wakeUpAlarmDismissedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FISleepDataProvider _updateLastAlarmWakeUpDateIfNeeded:](self, "_updateLastAlarmWakeUpDateIfNeeded:", v8);

  objc_msgSend(v5, "goodMorningDismissedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[FISleepDataProvider _updateLastGoodMorningDismissedDateIfNeeded:](self, "_updateLastGoodMorningDismissedDateIfNeeded:", v10);
  if (v9)
  {
    _HKInitializeLogging();
    v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21168F000, v12, OS_LOG_TYPE_DEFAULT, "Most recent alarm wake up date did change; notifying observers",
        v17,
        2u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sleepDataProviderLastAlarmWakeUpDateDidChange");

  }
  if (v11)
  {
    _HKInitializeLogging();
    v14 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21168F000, v14, OS_LOG_TYPE_DEFAULT, "Last good morning dismissed date did change; notifying observers",
        v16,
        2u);
    }
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "sleepDataProviderLastGoodMorningDismissedDateDidChange");

  }
}

- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  FISleepDataProviderDelegate **p_delegate;
  id WeakRetained;
  id v16;
  id v17;
  uint8_t v18[16];

  v5 = a4;
  _HKInitializeLogging();
  v6 = *MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21168F000, v6, OS_LOG_TYPE_DEFAULT, "Sleep store model did change; updating sleep data provider and notifying observers",
      v18,
      2u);
  }
  objc_msgSend(v5, "sleepEventRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wakeUpAlarmDismissedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FISleepDataProvider _updateLastAlarmWakeUpDateIfNeeded:](self, "_updateLastAlarmWakeUpDateIfNeeded:", v8);

  v10 = -[FISleepDataProvider _updateGoodMorningAlertNotificationEnabledIfNeeded:](self, "_updateGoodMorningAlertNotificationEnabledIfNeeded:", objc_msgSend(v5, "goodMorningAlertNotificationEnabled"));
  objc_msgSend(v5, "sleepEventRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "goodMorningDismissedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FISleepDataProvider _updateLastGoodMorningDismissedDateIfNeeded:](self, "_updateLastGoodMorningDismissedDateIfNeeded:", v12);

  -[FISleepDataProvider _updateSleepUserDay](self, "_updateSleepUserDay");
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "sleepDataProviderUserDayDidUpdate");

  if (v9)
  {
    v16 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v16, "sleepDataProviderLastAlarmWakeUpDateDidChange");

  }
  if (v10 || v13)
  {
    v17 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v17, "sleepDataProviderLastGoodMorningDismissedDateDidChange");

  }
}

- (void)_setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void)setSleepUserDay:(id)a3
{
  objc_storeStrong((id *)&self->_sleepUserDay, a3);
}

- (void)setLastGoodMorningDismissedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setIsGoodMorningAlertNotificationEnabled:(BOOL)a3
{
  self->_isGoodMorningAlertNotificationEnabled = a3;
}

- (void)setLastAlarmWakeUpDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setIsUserAwake:(BOOL)a3
{
  self->_isUserAwake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAlarmWakeUpDate, 0);
  objc_storeStrong((id *)&self->_lastGoodMorningDismissedDate, 0);
  objc_storeStrong((id *)&self->_sleepUserDay, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sleepStore, 0);
}

- (void)_fetchCachedSleepUserDay
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_21168F000, v0, v1, "Sleep data provider - failed to fetch cached sleep user day %@", v2);
}

- (void)_cacheSleepUserDay:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_21168F000, v0, v1, "Sleep data provider - failed to cache sleep user day %@", v2);
}

@end
