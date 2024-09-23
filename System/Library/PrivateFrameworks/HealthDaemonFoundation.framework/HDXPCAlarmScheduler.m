@implementation HDXPCAlarmScheduler

- (HDXPCAlarmScheduler)init
{
  HDXPCAlarmScheduler *v2;
  uint64_t v3;
  NSMapTable *alarms;
  NSMutableSet *v5;
  NSMutableSet *pendingEvents;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HDXPCAlarmScheduler;
  v2 = -[HDXPCAlarmScheduler init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    alarms = v2->_alarms;
    v2->_alarms = (NSMapTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    pendingEvents = v2->_pendingEvents;
    v2->_pendingEvents = v5;

    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    +[HDDiagnosticManager sharedDiagnosticManager](HDDiagnosticManager, "sharedDiagnosticManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v2);

    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "schedulesXPCAlarms");

    if (v11)
    {
      objc_initWeak(&location, v2);
      v12 = v2->_queue;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __27__HDXPCAlarmScheduler_init__block_invoke;
      v14[3] = &unk_24CB18228;
      objc_copyWeak(&v15, &location);
      xpc_set_event_stream_handler("com.apple.alarm", v12, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __27__HDXPCAlarmScheduler_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_handleXPCEvent:", v3);

}

- (void)_queue_handleXPCEvent:(id)a3
{
  id v4;
  const char *string;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  double v10;
  NSObject *v11;
  HDXPCAlarmEvent *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDACF50]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_set_event();
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v6, "timeIntervalSince1970");
    v13 = 138543874;
    v14 = v8;
    v15 = 2082;
    v16 = string;
    v17 = 2048;
    v18 = (uint64_t)v10;
    _os_log_impl(&dword_210F9A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received XPC alarm event with name: %{public}s date: %{time_t}ld", (uint8_t *)&v13, 0x20u);

  }
  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[HDXPCAlarmEvent initWithName:fireDate:isUserVisible:]([HDXPCAlarmEvent alloc], "initWithName:fireDate:isUserVisible:", v11, v6, xpc_dictionary_get_BOOL(v4, "UserVisible"));
    -[HDXPCAlarmScheduler _queue_handleEvent:](self, "_queue_handleEvent:", v12);

  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HDXPCAlarmScheduler _queue_handleXPCEvent:].cold.1((uint64_t)self, v11);
  }

}

- (void)_queue_scheduleEvent:(id)a3
{
  NSObject *queue;
  id v4;
  void *v5;
  void *v6;
  id v7;
  xpc_object_t xdict;

  queue = self->_queue;
  v4 = a3;
  dispatch_assert_queue_V2(queue);
  xdict = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v4, "fireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_date(xdict, "Date", objc_msgSend(v5, "hk_nanosecondsSince1970"));

  xpc_dictionary_set_BOOL(xdict, "UserVisible", objc_msgSend(v4, "isUserVisible"));
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "UTF8String");
  xpc_set_event();

}

- (void)_queue_unscheduleEventWithName:(id)a3
{
  NSObject *queue;
  id v5;
  id v6;
  NSMutableSet *pendingEvents;
  id v8;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "UTF8String");
  xpc_set_event();
  pendingEvents = self->_pendingEvents;
  +[HDXPCAlarmEvent _eventWithName:](HDXPCAlarmEvent, "_eventWithName:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet removeObject:](pendingEvents, "removeObject:", v8);
}

- (void)unittest_fireEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HDXPCAlarmScheduler_unittest_fireEvent___block_invoke;
  block[3] = &unk_24CB18410;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __42__HDXPCAlarmScheduler_unittest_fireEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_handleEvent:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableSet addObject:](self->_pendingEvents, "addObject:", v5);

  -[HDXPCAlarmScheduler _queue_notifyAlarmsOfPendingEvents](self, "_queue_notifyAlarmsOfPendingEvents");
}

- (void)_queue_notifyAlarmsOfPendingEvents
{
  NSMutableSet *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMapTable *alarms;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSMutableSet *pendingEvents;
  __int128 v20;
  NSMutableSet *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_pendingEvents;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v23;
    *(_QWORD *)&v5 = 138543618;
    v20 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        alarms = self->_alarms;
        objc_msgSend(v9, "name", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](alarms, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        _HKInitializeLogging();
        HKLogInfrastructure();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            v15 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v27 = v15;
            v28 = 2114;
            v29 = v12;
            v30 = 2114;
            v31 = v9;
            v16 = v15;
            _os_log_impl(&dword_210F9A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying alarm %{public}@ of event: %{public}@", buf, 0x20u);

          }
          objc_msgSend(v12, "eventDidFire:", v9);
        }
        else
        {
          if (v14)
          {
            v17 = (void *)objc_opt_class();
            *(_DWORD *)buf = v20;
            v27 = v17;
            v28 = 2114;
            v29 = v9;
            v18 = v17;
            _os_log_impl(&dword_210F9A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] no registered alarm for event: %{public}@", buf, 0x16u);

          }
          -[NSMutableSet addObject:](v21, "addObject:", v9);
        }

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v6);
  }

  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = v21;

}

- (void)addAlarm:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HDXPCAlarmScheduler_addAlarm___block_invoke;
  block[3] = &unk_24CB18410;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __32__HDXPCAlarmScheduler_addAlarm___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v3;
    v12 = 2114;
    v13 = v4;
    v5 = v3;
    _os_log_impl(&dword_210F9A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding alarm %{public}@", (uint8_t *)&v10, 0x16u);

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v6, "eventName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyAlarmsOfPendingEvents");
}

- (void)removeAlarm:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HDXPCAlarmScheduler_removeAlarm___block_invoke;
  block[3] = &unk_24CB18410;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __35__HDXPCAlarmScheduler_removeAlarm___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    v5 = v3;
    _os_log_impl(&dword_210F9A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing alarm %{public}@", (uint8_t *)&v9, 0x16u);

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v6, "eventName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (void)scheduleEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HDXPCAlarmScheduler_scheduleEvent___block_invoke;
  block[3] = &unk_24CB18410;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __37__HDXPCAlarmScheduler_scheduleEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v5 = v3;
    _os_log_impl(&dword_210F9A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling event: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleEvent:", *(_QWORD *)(a1 + 40));
}

- (void)unscheduleEventWithName:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HDXPCAlarmScheduler_unscheduleEventWithName___block_invoke;
  block[3] = &unk_24CB18410;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __47__HDXPCAlarmScheduler_unscheduleEventWithName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v5 = v3;
    _os_log_impl(&dword_210F9A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] unscheduling event: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleEventWithName:", *(_QWORD *)(a1 + 40));
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  NSObject *queue;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;
  HDXPCAlarmScheduler *v11;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%p"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__HDXPCAlarmScheduler_diagnosticDescription__block_invoke;
  block[3] = &unk_24CB18410;
  v10 = v3;
  v11 = self;
  v6 = v3;
  dispatch_sync(queue, block);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __44__HDXPCAlarmScheduler_diagnosticDescription__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("\tAlarms"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)MEMORY[0x24BDD17C8];
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v6));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("\t\t%@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("\tPending Events"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\t%@"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

}

- (id)unitTest_schedulerObserver
{
  return self->_unitTest_schedulerObserver;
}

- (void)setUnitTest_schedulerObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_schedulerObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

- (void)_queue_handleXPCEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_210F9A000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Ignoring XPC alarm event with NULL event name", (uint8_t *)&v4, 0xCu);

}

@end
