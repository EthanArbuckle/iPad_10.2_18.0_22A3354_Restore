@implementation FMFScheduler

- (FMFScheduler)initWithDelegate:(id)a3
{
  id v5;
  FMFScheduler *v6;
  FMFScheduler *v7;

  v5 = a3;
  v6 = -[FMFScheduler init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    -[FMFScheduler _registerForSignificantTimeChangeNotifications](v7, "_registerForSignificantTimeChangeNotifications");
  }

  return v7;
}

- (void)setSchedules:(id)a3
{
  void *v4;

  objc_storeStrong((id *)&self->_schedules, a3);
  -[FMFScheduler delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schedulerCurrentSchedulesDidChange:", self);

  -[FMFScheduler _updateScheduleTimer](self, "_updateScheduleTimer");
}

- (NSArray)currentSchedules
{
  void *v2;
  void *v3;

  -[FMFScheduler schedules](self, "schedules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fm_filter:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __32__FMFScheduler_currentSchedules__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isCurrentAt:", v4);

  return v5;
}

- (void)scheduleTimerFired
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[FMFScheduler scheduleTimerFired]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "%s: Schedule timer fired at date %@", (uint8_t *)&v6, 0x16u);

  }
  -[FMFScheduler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedulerCurrentSchedulesDidChange:", self);

  -[FMFScheduler _updateScheduleTimer](self, "_updateScheduleTimer");
}

- (void)_updateScheduleTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  xpc_object_t v7;
  double v8;
  double v9;
  time_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFScheduler schedules](self, "schedules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_nextStartOrEndDateFrom:forSchedules:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    xpc_set_event();
    v7 = xpc_dictionary_create(0, 0, 0);
    objc_msgSend(v6, "timeIntervalSinceNow");
    v9 = v8;
    v10 = time(0);
    xpc_dictionary_set_date(v7, "Date", (uint64_t)((ceil(v9) + (double)v10) * 1000000000.0));
    xpc_dictionary_set_BOOL(v7, "UserVisible", 1);
    xpc_set_event();

  }
  LogCategory_Daemon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFScheduler timer](self, "timer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFScheduler schedules](self, "schedules");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315906;
    v15 = "-[FMFScheduler _updateScheduleTimer]";
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1DC81B000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ fireDate: %@ schedules: %@", (uint8_t *)&v14, 0x2Au);

  }
}

+ (id)_nextStartOrEndDateFrom:(id)a3 forSchedules:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__FMFScheduler__nextStartOrEndDateFrom_forSchedules___block_invoke;
  v10[3] = &unk_1EA4F2E50;
  v11 = v5;
  v6 = v5;
  objc_msgSend(a4, "fm_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMFSchedule firstDateFromDates:order:](FMFSchedule, "firstDateFromDates:order:", v7, -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __53__FMFScheduler__nextStartOrEndDateFrom_forSchedules___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nextStartOrEndDateFrom:", *(_QWORD *)(a1 + 32));
}

- (void)setTimer:(id)a3
{
  FMXPCTimer *v5;
  FMXPCTimer *v6;
  FMXPCTimer **p_timer;
  FMXPCTimer *timer;
  FMXPCTimer *v9;

  v5 = (FMXPCTimer *)a3;
  timer = self->_timer;
  p_timer = &self->_timer;
  v6 = timer;
  if (timer != v5)
  {
    v9 = v5;
    -[FMXPCTimer invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_timer, a3);
    v5 = v9;
  }

}

- (void)_registerForSignificantTimeChangeNotifications
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__significantTimeChange_, CFSTR("FMFSchedulerSignificantTimeChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__significantTimeChange_, *MEMORY[0x1E0C99898], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__significantTimeChange_, *MEMORY[0x1E0C998A0], 0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__FMFScheduler__registerForSignificantTimeChangeNotifications__block_invoke;
  block[3] = &unk_1EA4F2450;
  block[4] = self;
  if (_registerForSignificantTimeChangeNotifications_onceToken != -1)
    dispatch_once(&_registerForSignificantTimeChangeNotifications_onceToken, block);
}

void __62__FMFScheduler__registerForSignificantTimeChangeNotifications__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_significantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_significantTimeChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateScheduleTimer, 0);
  -[FMFScheduler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateScheduleTimer, 0, 0.2);
}

- (FMFSchedulerDelegate)delegate
{
  return self->_delegate;
}

- (NSArray)schedules
{
  return self->_schedules;
}

- (FMXPCTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_schedules, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
