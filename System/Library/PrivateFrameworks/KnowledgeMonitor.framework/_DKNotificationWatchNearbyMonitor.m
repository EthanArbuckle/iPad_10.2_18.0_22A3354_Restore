@implementation _DKNotificationWatchNearbyMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x219A29278]();
  if (self->_enabled)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Notification"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("com.apple.coreduetd.nearbydeviceschanged"));

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_219056000, v9, OS_LOG_TYPE_DEFAULT, "Received notification event for nearby devices changed!", v12, 2u);
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_State"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKNotificationWatchNearbyMonitor _eventWithNearbyDeviceCount:](_DKNotificationWatchNearbyMonitor, "_eventWithNearbyDeviceCount:", objc_msgSend(v10, "unsignedIntegerValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v11, 1);

    }
  }
  objc_autoreleasePoolPop(v6);

}

- (void)dealloc
{
  objc_super v3;

  -[_DKNotificationWatchNearbyMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationWatchNearbyMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("WatchNearby");
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (void)setIsWatchNearby:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_DEFAULT, "Watch Nearby Status: %u", (uint8_t *)v8, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForDefaultPairedDeviceNearbyStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

+ (id)_eventWithNearbyDeviceCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "no");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKNotificationWatchNearbyMonitor setIsWatchNearby:](_DKNotificationWatchNearbyMonitor, "setIsWatchNearby:", a3 != 0);
  v5 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "watchNearbyStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithStream:startDate:endDate:value:", v6, v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setWatchIsNearby
{
  const char *v3;
  NSObject *v4;
  uint64_t v5;
  int out_token;

  out_token = 0;
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.coreduetd.nearbydeviceschanged"), "UTF8String");
  -[_DKMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch(v3, &out_token, v4, &__block_literal_global_142);

  v5 = 0;
  if (!notify_get_state(out_token, &v5))
    +[_DKNotificationWatchNearbyMonitor setIsWatchNearby:](_DKNotificationWatchNearbyMonitor, "setIsWatchNearby:", v5 != 0);
  notify_cancel(out_token);
}

- (void)start
{
  int *p_token;
  const char *v4;
  NSObject *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKNotificationWatchNearbyMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v6, sel_instantMonitorNeedsActivation))
  {
    self->_enabled = 1;
    p_token = &self->_token;
    self->_token = -1;
    -[_DKNotificationWatchNearbyMonitor setWatchIsNearby](self, "setWatchIsNearby");
    v4 = (const char *)objc_msgSend(CFSTR("com.apple.coreduetd.nearbydeviceschanged"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch(v4, p_token, v5, &__block_literal_global_143);

  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationWatchNearbyMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKNotificationWatchNearbyMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  int token;

  self->_enabled = 0;
  token = self->_token;
  if (token != -1)
    notify_cancel(token);
}

- (void)synchronouslyReflectCurrentValue
{
  if (!self->_enabled)
    -[_DKNotificationWatchNearbyMonitor setWatchIsNearby](self, "setWatchIsNearby");
}

@end
