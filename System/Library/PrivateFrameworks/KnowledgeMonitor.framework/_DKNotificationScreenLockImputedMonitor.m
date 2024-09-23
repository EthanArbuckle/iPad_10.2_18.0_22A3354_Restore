@implementation _DKNotificationScreenLockImputedMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD block[4];
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x219A29278]();
  if (self->_enabled)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Notification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.springboard.lockstate"));

    if (v7)
    {
      -[_DKMonitor queue](self, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x24BDAC760];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __68___DKNotificationScreenLockImputedMonitor_receiveNotificationEvent___block_invoke;
      v15[3] = &unk_24DA66D10;
      v15[4] = self;
      v10 = v15;
      v11 = (void *)os_transaction_create();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke_2;
      block[3] = &unk_24DA66E28;
      v17 = v11;
      v18 = v10;
      v12 = v11;
      dispatch_async(v8, block);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_State"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKNotificationScreenLockImputedMonitor _eventWithState:](_DKNotificationScreenLockImputedMonitor, "_eventWithState:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v14, 1);

    }
  }
  objc_autoreleasePoolPop(v5);

}

- (void)dealloc
{
  objc_super v3;

  -[_DKNotificationScreenLockImputedMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockImputedMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("ScreenLockStateImputed");
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (void)setIsLocked:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForDeviceLockStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

}

+ (id)_eventWithState:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "no");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "BOOLValue");

  +[_DKNotificationScreenLockImputedMonitor setIsLocked:](_DKNotificationScreenLockImputedMonitor, "setIsLocked:", v5);
  v6 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "deviceIsLockedImputedStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventWithStream:startDate:endDate:value:", v7, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchMostRecentScreenLockStateEventFromKnowledgeStore
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BE1B088];
  objc_msgSend(MEMORY[0x24BE1B130], "deviceIsLockedImputedStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v5, 0, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "executeQuery:error:", v7, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_DKNotificationScreenLockImputedMonitor fetchMostRecentScreenLockStateEventFromKnowledgeStore].cold.2((uint64_t)v10, v11);

  }
  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_DKNotificationScreenLockImputedMonitor fetchMostRecentScreenLockStateEventFromKnowledgeStore].cold.1(v9, v12);

  objc_msgSend(v9, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setCurrentEventInInstantStateUsingLastKnowledgeStoreEvent
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_219056000, log, OS_LOG_TYPE_DEBUG, "ScreenLockStateImputed: Unable to retrieve latest ScreenLockState event.", v1, 2u);
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockImputedMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v3, sel_instantMonitorNeedsActivation))
    self->_enabled = 1;
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockImputedMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKNotificationScreenLockImputedMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  self->_enabled = 0;
}

- (void)synchronouslyReflectCurrentValue
{
  void *v3;
  const char *v4;
  NSObject *v5;
  uint64_t v6;
  int out_token;

  -[_DKMonitor currentEvent](self, "currentEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    out_token = 0;
    v4 = (const char *)objc_msgSend(CFSTR("com.apple.springboard.lockstate"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch(v4, &out_token, v5, &__block_literal_global_133);

    v6 = 0;
    if (!notify_get_state(out_token, &v6))
      +[_DKNotificationScreenLockImputedMonitor setIsLocked:](_DKNotificationScreenLockImputedMonitor, "setIsLocked:", v6 != 0);
    notify_cancel(out_token);
  }
}

- (void)fetchMostRecentScreenLockStateEventFromKnowledgeStore
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_219056000, a2, OS_LOG_TYPE_ERROR, "ScreenLockStateImputed: Error querying Duet: %@", (uint8_t *)&v2, 0xCu);
}

@end
