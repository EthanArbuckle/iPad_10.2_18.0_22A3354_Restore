@implementation _DKNotificationScreenLockMonitor

- (void)receiveNotificationEvent:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x219A29278]();
  if (self->_enabled)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Notification"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", CFSTR("com.apple.springboard.lockstate"));

    if (v6)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_State"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        +[_DKNotificationScreenLockMonitor _eventWithState:](_DKNotificationScreenLockMonitor, "_eventWithState:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v9, 1);

        +[_DKNotificationScreenLockMonitor _BMEventWithState:](_DKNotificationScreenLockMonitor, "_BMEventWithState:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMSource sendEvent:](self->_source, "sendEvent:", v10);

      }
    }
  }
  objc_autoreleasePoolPop(v4);

}

- (void)dealloc
{
  objc_super v3;

  -[_DKNotificationScreenLockMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("ScreenLockState");
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

  +[_DKNotificationScreenLockMonitor setIsLocked:](_DKNotificationScreenLockMonitor, "setIsLocked:", v5);
  v6 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "deviceIsLockedStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventWithStream:startDate:endDate:value:", v7, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_BMEventWithState:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(a3, "BOOLValue");
  v4 = objc_alloc(MEMORY[0x24BE0C378]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStarting:", v5);

  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  BMSource *v6;
  BMSource *source;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DKNotificationScreenLockMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v8, sel_instantMonitorNeedsActivation))
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ScreenLocked");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v6 = (BMSource *)objc_claimAutoreleasedReturnValue();
    source = self->_source;
    self->_source = v6;

    self->_enabled = 1;
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKNotificationScreenLockMonitor deactivate](self, "deactivate");
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
    notify_register_dispatch(v4, &out_token, v5, &__block_literal_global_3);

    v6 = 0;
    if (!notify_get_state(out_token, &v6))
      +[_DKNotificationScreenLockMonitor setIsLocked:](_DKNotificationScreenLockMonitor, "setIsLocked:", v6 != 0);
    notify_cancel(out_token);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
