@implementation _DKMonitor

- (id)instantHandler
{
  return self->_instantHandler;
}

- (void)saveState
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  v2 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __23___DKMonitor_saveState__block_invoke;
  v8[3] = &unk_24DA66D10;
  v8[4] = self;
  v4 = v8;
  v5 = queue;
  v6 = (void *)os_transaction_create();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_24DA66E28;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  dispatch_async(v5, block);

}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 0;
}

- (id)filter
{
  return self->_filter;
}

- (BOOL)historicalStateHasChanged:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_instantState, "objectForKeyedSubscript:", CFSTR("kCurrentEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (*((uint64_t (**)(void))self->_eventComparator + 2))() != 0;
  else
    v6 = 1;

  return v6;
}

- (_DKEvent)currentEvent
{
  NSObject *eventQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  eventQueue = self->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26___DKMonitor_currentEvent__block_invoke;
  v5[3] = &unk_24DA67010;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_DKEvent *)v3;
}

- (void)setCurrentEvent:(id)a3 inferHistoricalState:(BOOL)a4
{
  id v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  _QWORD block[4];
  id v18;
  id v19;

  v6 = a3;
  queue = self->_queue;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke;
  v14[3] = &unk_24DA67038;
  v14[4] = self;
  v15 = v6;
  v16 = a4;
  v9 = v14;
  v10 = queue;
  v11 = v6;
  v12 = (void *)os_transaction_create();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_24DA66E28;
  v18 = v12;
  v19 = v9;
  v13 = v12;
  dispatch_async(v10, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)historicalHandler
{
  return self->_historicalHandler;
}

- (id)eventComparator
{
  return self->_eventComparator;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSSet)classesForSecureStateDecoding
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (_DKMonitor)init
{
  _DKMonitor *v2;
  objc_class *v3;
  const char *Name;
  os_log_t v5;
  OS_os_log *log;
  objc_class *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_class *v13;
  void *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *eventQueue;
  uint64_t v20;
  NSDictionary *state;
  uint64_t v22;
  NSMutableDictionary *instantState;
  uint64_t v24;
  NSMutableDictionary *historicalState;
  uint64_t v26;
  NSDate *lastUpdate;
  id eventComparator;
  id filter;
  uint64_t v30;
  _DKEvent *currentEvent;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  NSDate *dateAtLastClockChange;
  void *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)_DKMonitor;
  v2 = -[_DKMonitor init](&v41, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = os_log_create("com.apple.coreduet.monitors", Name);
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(".event"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v18;

    -[_DKMonitor loadState](v2, "loadState");
    v20 = objc_claimAutoreleasedReturnValue();
    state = v2->_state;
    v2->_state = (NSDictionary *)v20;

    -[NSDictionary objectForKeyedSubscript:](v2->_state, "objectForKeyedSubscript:", CFSTR("kInstantState"));
    v22 = objc_claimAutoreleasedReturnValue();
    instantState = v2->_instantState;
    v2->_instantState = (NSMutableDictionary *)v22;

    -[NSDictionary objectForKeyedSubscript:](v2->_state, "objectForKeyedSubscript:", CFSTR("kHistoricalState"));
    v24 = objc_claimAutoreleasedReturnValue();
    historicalState = v2->_historicalState;
    v2->_historicalState = (NSMutableDictionary *)v24;

    -[NSMutableDictionary objectForKeyedSubscript:](v2->_historicalState, "objectForKeyedSubscript:", CFSTR("kLastUpdateDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    lastUpdate = v2->_lastUpdate;
    v2->_lastUpdate = (NSDate *)v26;

    eventComparator = v2->_eventComparator;
    v2->_eventComparator = &__block_literal_global_1;

    filter = v2->_filter;
    v2->_filter = &__block_literal_global_14;

    if (objc_msgSend((id)objc_opt_class(), "shouldMergeUnchangedEvents"))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v2->_instantState, "objectForKeyedSubscript:", CFSTR("kCurrentEvent"));
      v30 = objc_claimAutoreleasedReturnValue();
      currentEvent = v2->_currentEvent;
      v2->_currentEvent = (_DKEvent *)v30;

    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("Backlight"), CFSTR("ScreenLockState"), CFSTR("AppUsage"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "eventStream");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      objc_msgSend((id)objc_opt_class(), "eventStream");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v32, "containsObject:", v35);

      if (v36)
      {
        v2->_machTimeAtLastClockChange = mach_continuous_time();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v37 = objc_claimAutoreleasedReturnValue();
        dateAtLastClockChange = v2->_dateAtLastClockChange;
        v2->_dateAtLastClockChange = (NSDate *)v37;

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObserver:selector:name:object:", v2, sel_systemClockDidChange_, *MEMORY[0x24BDBCBB8], 0);

      }
    }

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDBCBB8], 0);

  v4.receiver = self;
  v4.super_class = (Class)_DKMonitor;
  -[_DKMonitor dealloc](&v4, sel_dealloc);
}

- (id)loadState
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __23___DKMonitor_loadState__block_invoke;
  v5[3] = &unk_24DA66FE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)eventStream
{
  return 0;
}

+ (id)entitlements
{
  return 0;
}

- (BOOL)instantMonitorNeedsActivation
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43___DKMonitor_instantMonitorNeedsActivation__block_invoke;
  v5[3] = &unk_24DA67010;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_instantMonitorNeedsActivation
{
  int64_t references;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  references = self->_references;
  self->_references = references + 1;
  return references == 0;
}

- (BOOL)instantMonitorNeedsDeactivation
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45___DKMonitor_instantMonitorNeedsDeactivation__block_invoke;
  v5[3] = &unk_24DA67010;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_instantMonitorNeedsDeactivation
{
  int64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_references - 1;
  self->_references = v3;
  return v3 == 0;
}

- (void)endCurrentEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_instantState, "objectForKeyedSubscript:", CFSTR("kCurrentEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_DKMonitor filter](self, "filter");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v5);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "setEndDate:", v4);
      -[_DKMonitor historicalHandler](self, "historicalHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[_DKMonitor historicalHandler](self, "historicalHandler");
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v11[0] = v5;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v9)[2](v9, v10);

      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_instantState, "removeObjectForKey:", CFSTR("kCurrentEvent"));
  }

}

- (void)setCurrentEvent:(id)a3
{
  -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", a3, 0);
}

- (void)invalidateInstantState
{
  -[_DKMonitor setCurrentEvent:](self, "setCurrentEvent:", 0);
}

- (void)setLastUpdate:(id)a3
{
  NSObject *v5;
  void *v6;
  NSDate *lastUpdate;
  void *v8;
  id v9;

  v9 = a3;
  -[_DKMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x219A29278]();
  objc_storeStrong((id *)&self->_lastUpdate, a3);
  lastUpdate = self->_lastUpdate;
  if (lastUpdate)
  {
    -[_DKMonitor historicalState](self, "historicalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", lastUpdate, CFSTR("kLastUpdateDate"));

    -[_DKMonitor saveState](self, "saveState");
  }
  objc_autoreleasePoolPop(v6);

}

- (void)systemClockDidChange:(id)a3
{
  id v4;
  NSObject *eventQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  if (systemClockDidChange__onceToken != -1)
    dispatch_once(&systemClockDidChange__onceToken, &__block_literal_global_38);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35___DKMonitor_systemClockDidChange___block_invoke_2;
  v6[3] = &unk_24DA66FE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  if (*((_BYTE *)v8 + 24))
  {
    -[_DKMonitor invalidateInstantState](self, "invalidateInstantState");
    -[_DKMonitor synchronouslyReflectCurrentValue](self, "synchronouslyReflectCurrentValue");
  }
  _Block_object_dispose(&v7, 8);

}

- (void)setInstantHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHistoricalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)shutdownHandler
{
  return self->_shutdownHandler;
}

- (void)setShutdownHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (NSMutableDictionary)instantState
{
  return self->_instantState;
}

- (NSMutableDictionary)historicalState
{
  return self->_historicalState;
}

- (void)setEventComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)references
{
  return self->_references;
}

- (unint64_t)machTimeAtLastClockChange
{
  return self->_machTimeAtLastClockChange;
}

- (void)setMachTimeAtLastClockChange:(unint64_t)a3
{
  self->_machTimeAtLastClockChange = a3;
}

- (NSDate)dateAtLastClockChange
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDateAtLastClockChange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_dateAtLastClockChange, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong(&self->_eventComparator, 0);
  objc_storeStrong((id *)&self->_historicalState, 0);
  objc_storeStrong((id *)&self->_instantState, 0);
  objc_storeStrong((id *)&self->_currentEvent, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong(&self->_shutdownHandler, 0);
  objc_storeStrong(&self->_historicalHandler, 0);
  objc_storeStrong(&self->_instantHandler, 0);
  objc_storeStrong((id *)&self->_bootSessionUUID, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
