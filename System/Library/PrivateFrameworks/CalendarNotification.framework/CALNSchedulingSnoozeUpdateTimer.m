@implementation CALNSchedulingSnoozeUpdateTimer

- (CALNSchedulingSnoozeUpdateTimer)initWithDateProvider:(id)a3 scheduler:(id)a4
{
  id v7;
  id v8;
  CALNSchedulingSnoozeUpdateTimer *v9;
  CALNSchedulingSnoozeUpdateTimer *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *fireDates;
  NSMutableDictionary *v13;
  NSMutableDictionary *overdueDates;
  uint64_t v15;
  NSDate *scheduledFireDate;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CALNSchedulingSnoozeUpdateTimer;
  v9 = -[CALNSchedulingSnoozeUpdateTimer init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateProvider, a3);
    objc_storeStrong((id *)&v10->_scheduler, a4);
    -[CALNActivityScheduler setDelegate:](v10->_scheduler, "setDelegate:", v10);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    fireDates = v10->_fireDates;
    v10->_fireDates = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    overdueDates = v10->_overdueDates;
    v10->_overdueDates = v13;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v15 = objc_claimAutoreleasedReturnValue();
    scheduledFireDate = v10->_scheduledFireDate;
    v10->_scheduledFireDate = (NSDate *)v15;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)setFireDate:(id)a3 leeway:(double)a4 forEventWithIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  snoozeLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v8;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Setting snooze update fire date for %{public}@ to %{public}@ with leeway = %f", (uint8_t *)&v12, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fireDates, "setObject:forKeyedSubscript:", v8, v9);
  objc_msgSend(v8, "dateByAddingTimeInterval:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_overdueDates, "setObject:forKeyedSubscript:", v11, v9);

  -[CALNSchedulingSnoozeUpdateTimer _scheduleTimer](self, "_scheduleTimer");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)significantTimeChange
{
  NSObject *v3;
  uint8_t v4[16];

  snoozeLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Snooze update timer informed of significant time change; rescheduling",
      v4,
      2u);
  }

  -[CALNActivityScheduler unschedule](self->_scheduler, "unschedule");
  -[CALNSchedulingSnoozeUpdateTimer notifyDelegateOfDueAlarmsAndRescheduleTimer](self, "notifyDelegateOfDueAlarmsAndRescheduleTimer");
}

- (void)activityRun
{
  NSObject *v3;
  uint8_t v4[16];

  snoozeLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Snooze update timer fired", v4, 2u);
  }

  -[CALNSchedulingSnoozeUpdateTimer notifyDelegateOfDueAlarmsAndRescheduleTimer](self, "notifyDelegateOfDueAlarmsAndRescheduleTimer");
}

- (void)notifyDelegateOfDueAlarmsAndRescheduleTimer
{
  OUTLINED_FUNCTION_0(&dword_215D9B000, a1, a3, "No notifications need refreshing right now", a5, a6, a7, a8, 0);
}

- (id)_dequeueEventsDueBy:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_fireDates;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_fireDates, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "CalIsAfterOrSameAsDate:", v12))
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
        -[NSMutableDictionary removeObjectForKey:](self->_fireDates, "removeObjectForKey:", v18, (_QWORD)v20);
        -[NSMutableDictionary removeObjectForKey:](self->_overdueDates, "removeObjectForKey:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  return v13;
}

- (void)_scheduleTimer
{
  OUTLINED_FUNCTION_0(&dword_215D9B000, a1, a3, "Still no snooze updates scheduled", a5, a6, a7, a8, 0);
}

- (CALNSnoozeUpdateTimerDelegate)delegate
{
  return (CALNSnoozeUpdateTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overdueDates, 0);
  objc_storeStrong((id *)&self->_fireDates, 0);
  objc_storeStrong((id *)&self->_scheduledOverdueDate, 0);
  objc_storeStrong((id *)&self->_scheduledFireDate, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end
