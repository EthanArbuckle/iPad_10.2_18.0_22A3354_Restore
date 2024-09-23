@implementation HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm

- (HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *v8;

  v4 = a3;
  HKCreateSerialDispatchQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29570]), "initWithProfile:clientIdentifier:eventHandlerQueue:", v4, CFSTR("HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm"), v5);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm initWithScheduler:profile:userDefaults:queue:dateGenerator:shouldAutomaticallyStart:](self, "initWithScheduler:profile:userDefaults:queue:dateGenerator:shouldAutomaticallyStart:", v6, v4, v7, v5, &__block_literal_global_12, 1);

  return v8;
}

uint64_t __67__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm_initWithProfile___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm)initWithScheduler:(id)a3 profile:(id)a4 userDefaults:(id)a5 queue:(id)a6 dateGenerator:(id)a7 shouldAutomaticallyStart:(BOOL)a8
{
  _BOOL4 v8;
  id v15;
  id v16;
  id v17;
  id v18;
  HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *v19;
  HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *v20;
  uint64_t v21;
  id dateGenerator;
  id WeakRetained;
  id v25;
  objc_super v26;

  v8 = a8;
  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm;
  v19 = -[HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_scheduler, a3);
    objc_storeWeak((id *)&v20->_profile, v15);
    objc_storeStrong((id *)&v20->_defaults, a5);
    objc_storeStrong((id *)&v20->_queue, a6);
    v21 = MEMORY[0x1D17A8B4C](v18);
    dateGenerator = v20->_dateGenerator;
    v20->_dateGenerator = (id)v21;

    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
      objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v20, v20->_queue);

    }
  }

  return v20;
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained;
  void *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];

  -[HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm _queue_beginReceivingAlarmEvents](self, "_queue_beginReceivingAlarmEvents", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm_profileDidBecomeReady___block_invoke;
  v7[3] = &unk_1E87EF6F0;
  v7[4] = self;
  objc_msgSend(v5, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v7);

}

uint64_t __73__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleEventWithCompletion:", 0);
}

- (void)_unitTest_beginReceivingAlarmEvents
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__unitTest_beginReceivingAlarmEvents__block_invoke;
  block[3] = &unk_1E87EF6F0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __86__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__unitTest_beginReceivingAlarmEvents__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__unitTest_beginReceivingAlarmEvents__block_invoke_2;
  v3[3] = &unk_1E87F04B8;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "beginReceivingEventsWithHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __86__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__unitTest_beginReceivingAlarmEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);

}

- (void)_stop
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

  if (v4)
  {
    HKHRAFibBurdenLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_INFO, "[%@] Stopping observation", (uint8_t *)&v6, 0xCu);
    }

  }
  -[HDRestorableAlarm invalidate](self->_scheduler, "invalidate");
}

- (void)_queue_beginReceivingAlarmEvents
{
  HDRestorableAlarm *scheduler;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  scheduler = self->_scheduler;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__queue_beginReceivingAlarmEvents__block_invoke;
  v4[3] = &unk_1E87F04B8;
  objc_copyWeak(&v5, &location);
  -[HDRestorableAlarm beginReceivingEventsWithHandler:](scheduler, "beginReceivingEventsWithHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __83__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__queue_beginReceivingAlarmEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);

}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Alarm fired, rescheduling and firing", (uint8_t *)&v7, 0xCu);
  }

  -[HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm _scheduleEventWithCompletion:](self, "_scheduleEventWithCompletion:", 0);
  -[HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "initialAnalysisAlarmDidFireWithAlarm:", self);

}

- (void)_scheduleEventWithCompletion:(id)a3
{
  id v4;
  HDRestorableAlarm *scheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__scheduleEventWithCompletion___block_invoke;
  v7[3] = &unk_1E87F04E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HDRestorableAlarm checkForDueEventsWithCompletion:](scheduler, "checkForDueEventsWithCompletion:", v7);

}

void __80__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__scheduleEventWithCompletion___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;

  v7 = a2;
  v8 = a4;
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __80__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__scheduleEventWithCompletion___block_invoke_cold_1(a1, (uint64_t)v8, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleEvent");
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

- (void)_queue_scheduleEvent
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CC29C000, a2, a3, "[%@] Error while scheduling events: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

- (id)_determineNextEventDateComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponentsWithDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_dateGenerator + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextDateAfterDate:matchingComponents:options:", v5, v3, 1024);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Scheduling alarm to trigger analysis at %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 252, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCalendar:", v8);
  objc_msgSend(v8, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  return v9;
}

- (HKHRAFibBurdenSevenDayAnalysisSchedulerAlarmDelegate)delegate
{
  return (HKHRAFibBurdenSevenDayAnalysisSchedulerAlarmDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __80__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__scheduleEventWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CC29C000, a2, a3, "[%{public}@] Error checking for due events before rescheduling: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
