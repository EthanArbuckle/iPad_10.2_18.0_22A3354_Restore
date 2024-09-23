@implementation _DKNotificationKeybagLockMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v4 = a3;
  -[_DKMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61___DKNotificationKeybagLockMonitor_receiveNotificationEvent___block_invoke;
  v11[3] = &unk_24DA66D60;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  v8 = v4;
  v9 = (void *)os_transaction_create();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_0;
  block[3] = &unk_24DA66E28;
  v14 = v9;
  v15 = v7;
  v10 = v9;
  dispatch_async(v5, block);

}

- (void)_receiveNotificationEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  double Current;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t v25[16];

  v4 = a3;
  -[_DKMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_activated)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Notification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE67240]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v10 = +[_DKNotificationKeybagLockMonitor getCurrentLockState](_DKNotificationKeybagLockMonitor, "getCurrentLockState");
      objc_msgSend((id)objc_opt_class(), "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_DKNotificationKeybagLockMonitor _receiveNotificationEvent:].cold.1(v10, v11);

      if ((_DWORD)v10 != -1)
      {
        if (!(_DWORD)v10)
        {
          -[_DKMonitor currentEvent](self, "currentEvent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend((id)objc_opt_class(), "log");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v25 = 0;
              _os_log_impl(&dword_219056000, v13, OS_LOG_TYPE_INFO, "Keybag unlocked but we don't have a previous lock event. Creating an initial (boot) lock state.", v25, 2u);
            }

            v14 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "systemUptime");
            objc_msgSend(v14, "dateWithTimeIntervalSinceNow:", -v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = (void *)MEMORY[0x24BE1B080];
            objc_msgSend(MEMORY[0x24BE1B130], "keybagIsLockedStream");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE1B048], "yes");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "eventWithStream:startDate:endDate:value:", v19, v17, v20, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v22, 0);
          }
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKNotificationKeybagLockMonitor _eventWithState:](_DKNotificationKeybagLockMonitor, "_eventWithState:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v24, 1);

        -[_DKNotificationKeybagLockMonitor _enqueueKeybagLockedUpdate:timestamp:](self, "_enqueueKeybagLockedUpdate:timestamp:", v10, Current);
      }
    }
  }

}

- (void)synchronouslyReflectCurrentValue
{
  void *v2;
  uint64_t v3;
  id v4;

  -[_DKMonitor currentEvent](self, "currentEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = +[_DKNotificationKeybagLockMonitor getCurrentLockState](_DKNotificationKeybagLockMonitor, "getCurrentLockState");
    if ((_DWORD)v3 != -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      +[_DKNotificationKeybagLockMonitor setIsLocked:](_DKNotificationKeybagLockMonitor, "setIsLocked:", objc_msgSend(v4, "BOOLValue"));

    }
  }
}

+ (id)log
{
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, &__block_literal_global_0);
  return (id)log_log_0;
}

+ (id)eventStream
{
  return CFSTR("KeybagLockState");
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (int)getCurrentLockState
{
  unsigned int v2;
  int v3;
  NSObject *v5;

  v2 = MKBGetDeviceLockState();
  v3 = v2;
  if (v2 < 4)
    return dword_219084930[v2];
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[_DKNotificationKeybagLockMonitor getCurrentLockState].cold.1(v3, v5);

  return -1;
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
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForKeybagLockStatus");
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

  +[_DKNotificationKeybagLockMonitor setIsLocked:](_DKNotificationKeybagLockMonitor, "setIsLocked:", v5);
  v6 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "keybagIsLockedStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventWithStream:startDate:endDate:value:", v7, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41___DKNotificationKeybagLockMonitor_start__block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_activate
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *donationQueue;
  CFAbsoluteTime Current;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  CFAbsoluteTime v17;
  uint8_t buf[16];

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_DEFAULT, "activate", buf, 2u);
  }

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (OS_dispatch_queue *)dispatch_queue_create("_DKNotificationKeybagLockMonitor.donations", v5);
  donationQueue = self->_donationQueue;
  self->_donationQueue = v6;

  dispatch_suspend((dispatch_object_t)self->_donationQueue);
  self->_donationQueueResumed = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v9 = +[_DKNotificationKeybagLockMonitor getCurrentLockState](_DKNotificationKeybagLockMonitor, "getCurrentLockState");
  v10 = objc_alloc(MEMORY[0x24BE0C350]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithStarting:", v11);

  v13 = self->_donationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45___DKNotificationKeybagLockMonitor__activate__block_invoke;
  block[3] = &unk_24DA66F60;
  block[4] = self;
  v16 = v12;
  v17 = Current;
  v14 = v12;
  dispatch_async(v13, block);
  self->_activated = 1;
  if (MKBDeviceUnlockedSinceBoot())
    -[_DKNotificationKeybagLockMonitor _resume](self, "_resume");

}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40___DKNotificationKeybagLockMonitor_stop__block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_deactivate
{
  NSObject *v3;
  NSObject *donationQueue;
  OS_dispatch_queue *v5;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  self->_activated = 0;
  if (!self->_donationQueueResumed)
    dispatch_resume((dispatch_object_t)self->_donationQueue);
  donationQueue = self->_donationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47___DKNotificationKeybagLockMonitor__deactivate__block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_barrier_sync(donationQueue, block);
  v5 = self->_donationQueue;
  self->_donationQueue = 0;

}

- (void)_updateWithKeybagLocked:(id)a3 timestamp:(double)a4
{
  BMDeviceKeybagLocked *v6;
  NSObject *v7;
  BMSource *source;
  void *v9;
  void *v10;
  void *v11;
  BMSource *v12;
  BMSource *v13;
  BMDeviceKeybagLocked *lastEvent;
  int v15;
  BMDeviceKeybagLocked *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (BMDeviceKeybagLocked *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_donationQueue);
  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v6;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_219056000, v7, OS_LOG_TYPE_DEFAULT, "Writing keybagLocked event %{public}@ at %f", (uint8_t *)&v15, 0x16u);
  }

  source = self->_source;
  if (!source)
  {
    BiomeLibrary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "Device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "KeybagLocked");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "source");
    v12 = (BMSource *)objc_claimAutoreleasedReturnValue();
    v13 = self->_source;
    self->_source = v12;

    source = self->_source;
  }
  -[BMSource sendEvent:timestamp:](source, "sendEvent:timestamp:", v6, a4);
  lastEvent = self->_lastEvent;
  self->_lastEvent = v6;

  self->_lastUpdate = a4;
}

- (void)_enqueueKeybagLockedUpdate:(int)a3 timestamp:(double)a4
{
  uint64_t v5;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *donationQueue;
  id v12;
  _QWORD block[5];
  id v14;
  double v15;

  v5 = *(_QWORD *)&a3;
  -[_DKMonitor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_alloc(MEMORY[0x24BE0C350]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithStarting:", v9);

  donationQueue = self->_donationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73___DKNotificationKeybagLockMonitor__enqueueKeybagLockedUpdate_timestamp___block_invoke;
  block[3] = &unk_24DA66F60;
  v15 = a4;
  block[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_async(donationQueue, block);
  if (!(_DWORD)v5)
    -[_DKNotificationKeybagLockMonitor _resume](self, "_resume");

}

- (void)_resume
{
  NSObject *v3;

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_activated && !self->_donationQueueResumed)
  {
    dispatch_resume((dispatch_object_t)self->_donationQueue);
    self->_donationQueueResumed = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
}

+ (void)getCurrentLockState
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_219056000, a2, OS_LOG_TYPE_FAULT, "Unexpected lock state %d", (uint8_t *)v2, 8u);
}

- (void)_receiveNotificationEvent:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_219056000, a2, OS_LOG_TYPE_DEBUG, "Keybag lock state: %d", (uint8_t *)v2, 8u);
}

@end
