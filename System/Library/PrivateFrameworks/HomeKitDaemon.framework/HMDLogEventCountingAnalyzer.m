@implementation HMDLogEventCountingAnalyzer

- (HMDLogEventCountingAnalyzer)initWithEventCountersManager:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5 systemInfo:(id)a6 queue:(id)a7
{
  HMDLogEventCountingAnalyzer *v12;
  _QWORD v14[4];
  HMDLogEventCountingAnalyzer *v15;

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105__HMDLogEventCountingAnalyzer_initWithEventCountersManager_dailyScheduler_dateProvider_systemInfo_queue___block_invoke_2;
  v14[3] = &unk_24E78ECA0;
  v15 = self;
  v12 = -[HMDLogEventCountingAnalyzer initWithEventCountersManager:dailyScheduler:dateProvider:systemInfo:queue:loggingPeriodicitySeconds:tickSecondsProviderBlock:periodicCountersLoggingBlock:](v15, "initWithEventCountersManager:dailyScheduler:dateProvider:systemInfo:queue:loggingPeriodicitySeconds:tickSecondsProviderBlock:periodicCountersLoggingBlock:", a3, a4, a5, a6, a7, 900, &__block_literal_global_185775, v14);

  return v12;
}

- (HMDLogEventCountingAnalyzer)initWithEventCountersManager:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5 systemInfo:(id)a6 queue:(id)a7 loggingPeriodicitySeconds:(unint64_t)a8 tickSecondsProviderBlock:(id)a9 periodicCountersLoggingBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDLogEventCountingAnalyzer *v22;
  HMDLogEventCountingAnalyzer *v23;
  uint64_t v24;
  NSMutableDictionary *currentPeriodCounters;
  int v26;
  void *v27;
  void *v28;
  id tickSecondsProviderBlock;
  void *v30;
  id periodicCountersSnapshotBlock;
  id v34;
  objc_super v35;

  v34 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v35.receiver = self;
  v35.super_class = (Class)HMDLogEventCountingAnalyzer;
  v22 = -[HMDLogEventCountingAnalyzer init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_countersManager, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    currentPeriodCounters = v23->_currentPeriodCounters;
    v23->_currentPeriodCounters = (NSMutableDictionary *)v24;

    objc_storeStrong((id *)&v23->_dateProvider, a5);
    v26 = isInternalBuild();
    if (v26)
    {
      objc_msgSend(v18, "serialNumber");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    objc_storeStrong((id *)&v23->_serialNumber, v27);
    if (v26)

    objc_storeStrong((id *)&v23->_queue, a7);
    v23->_loggingPeriodicitySeconds = a8;
    v28 = _Block_copy(v20);
    tickSecondsProviderBlock = v23->_tickSecondsProviderBlock;
    v23->_tickSecondsProviderBlock = v28;

    v23->_tickSecondsLastLogged = (*((uint64_t (**)(void))v23->_tickSecondsProviderBlock + 2))();
    v30 = _Block_copy(v21);
    periodicCountersSnapshotBlock = v23->_periodicCountersSnapshotBlock;
    v23->_periodicCountersSnapshotBlock = v30;

    objc_msgSend(v16, "registerDailyTaskRunner:", v23);
  }

  return v23;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDLogEventCountingAnalyzer_didReceiveEventFromDispatcher___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didReceiveEventFromDispatcher:(id)a3 withCurrentTickSeconds:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  id v12;

  v6 = a3;
  -[HMDLogEventCountingAnalyzer queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDLogEventCountingAnalyzer incrementPeriodicCountersForEventName:](self, "incrementPeriodicCountersForEventName:", v12);
  -[HMDLogEventCountingAnalyzer incrementDailyCountersForEventName:](self, "incrementDailyCountersForEventName:", v12);
  -[HMDLogEventCountingAnalyzer periodicSnapshotAtCurrentTickSeconds:](self, "periodicSnapshotAtCurrentTickSeconds:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMDLogEventCountingAnalyzer periodicCountersSnapshotBlock](self, "periodicCountersSnapshotBlock");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDLogEventCountingAnalyzer serialNumber](self, "serialNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v10)[2](v10, v9, v11);

  }
}

- (id)periodicSnapshotAtCurrentTickSeconds:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (a3 - self->_tickSecondsLastLogged >= self->_loggingPeriodicitySeconds)
  {
    v6 = (void *)-[NSMutableDictionary copy](self->_currentPeriodCounters, "copy");
    -[NSMutableDictionary removeAllObjects](self->_currentPeriodCounters, "removeAllObjects");
    self->_tickSecondsLastLogged = a3;
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)incrementPeriodicCountersForEventName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentPeriodCounters, "objectForKeyedSubscript:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentPeriodCounters, "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentPeriodCounters, "setObject:forKeyedSubscript:", v7, v8);

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentPeriodCounters, "setObject:forKeyedSubscript:", &unk_24E96C5F0, v8);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)incrementDailyCountersForEventName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDLogEventCountingAnalyzer currentDayCountersGroup](self, "currentDayCountersGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "incrementEventCounterForEventName:", v4);

}

- (HMDEventCounterGroup)currentDayCountersGroup
{
  HMDDateCounterGroupSpecifier *v3;
  void *v4;
  void *v5;
  HMDDateCounterGroupSpecifier *v6;
  void *v7;
  void *v8;

  v3 = [HMDDateCounterGroupSpecifier alloc];
  -[HMDLogEventCountingAnalyzer dateProvider](self, "dateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfCurrentDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDDateCounterGroupSpecifier initWithGroupName:date:](v3, "initWithGroupName:date:", CFSTR("HMDLogEventCountingAnalyzerDailyGroupName"), v5);

  -[HMDLogEventCountingAnalyzer countersManager](self, "countersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "counterGroupForSpecifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDEventCounterGroup *)v8;
}

- (void)runDailyTask
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDLogEventCountingAnalyzer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HMDLogEventCountingAnalyzer_runDailyTask__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDLogEventCountingAnalyzer countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDLogEventCountingAnalyzer_deleteCountersBeforeDate___block_invoke;
  v7[3] = &unk_24E78FF80;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeCounterGroupsBasedOnPredicate:", v7);

}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDLogEventCountingAnalyzer countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HMDLogEventCountingAnalyzer_deleteCountersAfterDate___block_invoke;
  v7[3] = &unk_24E78FF80;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeCounterGroupsBasedOnPredicate:", v7);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)currentPeriodCounters
{
  return self->_currentPeriodCounters;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (id)tickSecondsProviderBlock
{
  return self->_tickSecondsProviderBlock;
}

- (id)periodicCountersSnapshotBlock
{
  return self->_periodicCountersSnapshotBlock;
}

- (unint64_t)loggingPeriodicitySeconds
{
  return self->_loggingPeriodicitySeconds;
}

- (unint64_t)tickSecondsLastLogged
{
  return self->_tickSecondsLastLogged;
}

- (void)setTickSecondsLastLogged:(unint64_t)a3
{
  self->_tickSecondsLastLogged = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (void)setCurrentDayCountersGroup:(id)a3
{
  objc_storeStrong((id *)&self->_currentDayCountersGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDayCountersGroup, 0);
  objc_storeStrong((id *)&self->_countersManager, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong(&self->_periodicCountersSnapshotBlock, 0);
  objc_storeStrong(&self->_tickSecondsProviderBlock, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_currentPeriodCounters, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

BOOL __55__HMDLogEventCountingAnalyzer_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("HMDLogEventCountingAnalyzerDailyGroupName")))
    {
      objc_msgSend(v6, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "compare:", *(_QWORD *)(a1 + 32)) == 1;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL __56__HMDLogEventCountingAnalyzer_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("HMDLogEventCountingAnalyzerDailyGroupName")))
    {
      objc_msgSend(v6, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "compare:", *(_QWORD *)(a1 + 32)) == -1;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __43__HMDLogEventCountingAnalyzer_runDailyTask__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayByAddingDayCount:", -5);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "deleteCountersBeforeDate:", v5);
  objc_msgSend(*(id *)(a1 + 32), "dateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayByAddingDayCount:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "deleteCountersAfterDate:", v4);
}

void __61__HMDLogEventCountingAnalyzer_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t (**v3)(void);

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "tickSecondsProviderBlock");
  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didReceiveEventFromDispatcher:withCurrentTickSeconds:", v2, v3[2]());

}

void __105__HMDLogEventCountingAnalyzer_initWithEventCountersManager_dailyScheduler_dateProvider_systemInfo_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v10;
    v13 = 1024;
    v14 = 15;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[Logging Period = %d Minutes] Metric event counts on current device: %@ %@", (uint8_t *)&v11, 0x26u);

  }
  objc_autoreleasePoolPop(v7);

}

__uint64_t __105__HMDLogEventCountingAnalyzer_initWithEventCountersManager_dailyScheduler_dateProvider_systemInfo_queue___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
}

@end
