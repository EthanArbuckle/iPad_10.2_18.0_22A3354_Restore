@implementation EFXPCAlarmScheduler

- (id)initGlobalInstance
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD v5[4];
  id v6;
  id location;

  v2 = -[EFXPCAlarmScheduler _init](self, "_init");
  if (v2)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v3 = v2[3];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__EFXPCAlarmScheduler_initGlobalInstance__block_invoke;
    v5[3] = &unk_1E62A7960;
    objc_copyWeak(&v6, &location);
    xpc_set_event_stream_handler("com.apple.alarm", v3, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)_init
{
  EFXPCAlarmScheduler *v2;
  uint64_t v3;
  NSMapTable *alarms;
  NSMutableSet *v5;
  NSMutableSet *pendingEvents;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EFXPCAlarmScheduler;
  v2 = -[EFXPCAlarmScheduler init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    alarms = v2->_alarms;
    v2->_alarms = (NSMapTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingEvents = v2->_pendingEvents;
    v2->_pendingEvents = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.email.EFXPCAlarmScheduler", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

  }
  return v2;
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EFXPCAlarmScheduler_addAlarm___block_invoke;
  block[3] = &unk_1E62A58B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __32__EFXPCAlarmScheduler_addAlarm___block_invoke(uint64_t a1)
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

  v14 = *MEMORY[0x1E0C80C00];
  +[EFXPCAlarmScheduler log](EFXPCAlarmScheduler, "log");
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
    _os_log_impl(&dword_1B106E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding alarm %{public}@", (uint8_t *)&v10, 0x16u);

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v6, "eventName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyAlarmsOfPendingEvents");
}

- (void)_queue_notifyAlarmsOfPendingEvents
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSMapTable *alarms;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSMutableSet *pendingEvents;
  __int128 v18;
  NSMutableSet *v19;
  NSMutableSet *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_pendingEvents;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v22;
    *(_QWORD *)&v4 = 138543618;
    v18 = v4;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        alarms = self->_alarms;
        objc_msgSend(v7, "name", v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](alarms, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          +[EFXPCAlarmScheduler log](EFXPCAlarmScheduler, "log");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v26 = v12;
            v27 = 2114;
            v28 = v10;
            v29 = 2114;
            v30 = v7;
            v13 = v12;
            _os_log_impl(&dword_1B106E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying alarm %{public}@ of event: %{public}@", buf, 0x20u);

          }
          objc_msgSend(v10, "eventDidFire:", v7);
        }
        else
        {
          +[EFXPCAlarmScheduler log](EFXPCAlarmScheduler, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)objc_opt_class();
            *(_DWORD *)buf = v18;
            v26 = v15;
            v27 = 2114;
            v28 = v7;
            v16 = v15;
            _os_log_impl(&dword_1B106E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] no registered alarm for event: %{public}@", buf, 0x16u);

          }
          -[NSMutableSet addObject:](v19, "addObject:", v7);
        }

      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v3);
  }

  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = v19;

}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EFXPCAlarmScheduler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1)
    dispatch_once(&log_onceToken_10, block);
  return (id)log_log_10;
}

void __26__EFXPCAlarmScheduler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;

}

void __41__EFXPCAlarmScheduler_initGlobalInstance__block_invoke(uint64_t a1, void *a2)
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
  id v8;
  double v9;
  NSObject *v10;
  EFXPCAlarmEvent *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81298]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EFXPCAlarmScheduler log](EFXPCAlarmScheduler, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (id)objc_opt_class();
    objc_msgSend(v6, "timeIntervalSince1970");
    v13 = 138543874;
    v14 = v8;
    v15 = 2082;
    v16 = string;
    v17 = 2048;
    v18 = (uint64_t)v9;
    _os_log_impl(&dword_1B106E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received XPC alarm event with name: %{public}s date: %{time_t}ld", (uint8_t *)&v13, 0x20u);

  }
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[EFXPCAlarmEvent initWithName:fireDate:isUserVisible:]([EFXPCAlarmEvent alloc], "initWithName:fireDate:isUserVisible:", v10, v6, xpc_dictionary_get_BOOL(v4, "UserVisible"));
    -[EFXPCAlarmScheduler _queue_handleEvent:](self, "_queue_handleEvent:", v11);

  }
  else
  {
    +[EFXPCAlarmScheduler log](EFXPCAlarmScheduler, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      -[EFXPCAlarmScheduler _queue_handleXPCEvent:].cold.1(v12, (uint64_t)&v13, v10);
    }
  }

}

- (void)_queue_scheduleEvent:(id)a3
{
  xpc_object_t v4;
  void *v5;
  double v6;
  id v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v8, "fireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  xpc_dictionary_set_date(v4, "Date", (uint64_t)(v6 * 1000000000.0));

  xpc_dictionary_set_BOOL(v4, "UserVisible", objc_msgSend(v8, "isUserVisible"));
  objc_msgSend(v8, "name");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  xpc_set_event();

}

- (void)_queue_unscheduleEventWithName:(id)a3
{
  id v4;
  NSMutableSet *pendingEvents;
  void *v6;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = objc_retainAutorelease(v4);
  objc_msgSend(v7, "UTF8String");
  xpc_set_event();
  pendingEvents = self->_pendingEvents;
  +[EFXPCAlarmEvent _eventWithName:](EFXPCAlarmEvent, "_eventWithName:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](pendingEvents, "removeObject:", v6);

}

- (void)test_fireEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EFXPCAlarmScheduler_test_fireEvent___block_invoke;
  block[3] = &unk_1E62A58B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __38__EFXPCAlarmScheduler_test_fireEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_handleEvent:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableSet addObject:](self->_pendingEvents, "addObject:", v4);
  -[EFXPCAlarmScheduler _queue_notifyAlarmsOfPendingEvents](self, "_queue_notifyAlarmsOfPendingEvents");

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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EFXPCAlarmScheduler_removeAlarm___block_invoke;
  block[3] = &unk_1E62A58B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __35__EFXPCAlarmScheduler_removeAlarm___block_invoke(uint64_t a1)
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

  v13 = *MEMORY[0x1E0C80C00];
  +[EFXPCAlarmScheduler log](EFXPCAlarmScheduler, "log");
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
    _os_log_impl(&dword_1B106E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing alarm %{public}@", (uint8_t *)&v9, 0x16u);

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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EFXPCAlarmScheduler_scheduleEvent___block_invoke;
  block[3] = &unk_1E62A58B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __37__EFXPCAlarmScheduler_scheduleEvent___block_invoke(uint64_t a1)
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

  v11 = *MEMORY[0x1E0C80C00];
  +[EFXPCAlarmScheduler log](EFXPCAlarmScheduler, "log");
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
    _os_log_impl(&dword_1B106E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling event: %{public}@", (uint8_t *)&v7, 0x16u);

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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EFXPCAlarmScheduler_unscheduleEventWithName___block_invoke;
  block[3] = &unk_1E62A58B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __47__EFXPCAlarmScheduler_unscheduleEventWithName___block_invoke(uint64_t a1)
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

  v11 = *MEMORY[0x1E0C80C00];
  +[EFXPCAlarmScheduler log](EFXPCAlarmScheduler, "log");
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
    _os_log_impl(&dword_1B106E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] unscheduling event: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleEventWithName:", *(_QWORD *)(a1 + 40));
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  NSObject *queue;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;
  EFXPCAlarmScheduler *v11;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%p"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__EFXPCAlarmScheduler_debugDescription__block_invoke;
  block[3] = &unk_1E62A58B0;
  v6 = v3;
  v10 = v6;
  v11 = self;
  dispatch_sync(queue, block);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __39__EFXPCAlarmScheduler_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("\tAlarms"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v5));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("\t\t%@"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("\tPending Events"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%@"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

}

- (id)ef_publicDescription
{
  void *v3;
  int v4;

  +[EFDevice currentDevice](EFDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
    -[EFXPCAlarmScheduler debugDescription](self, "debugDescription");
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %lu Pending Events>"), objc_opt_class(), self, -[NSMutableSet count](self->_pendingEvents, "count"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)test_schedulerObserver
{
  return self->_test_schedulerObserver;
}

- (void)setTest_schedulerObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_test_schedulerObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

- (void)_queue_handleXPCEvent:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_error_impl(&dword_1B106E000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Ignoring XPC alarm event with NULL event name", (uint8_t *)a2, 0xCu);

}

@end
