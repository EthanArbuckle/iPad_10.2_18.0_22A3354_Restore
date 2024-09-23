@implementation _DKNotificationTimeZoneChangeMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x219A29278]();
  if (self->_enabled)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Notification"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("SignificantTimeChangeNotification"));

    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_219056000, v9, OS_LOG_TYPE_DEFAULT, "Received notification event for time zone changed!", v10, 2u);
      }

      -[_DKNotificationTimeZoneChangeMonitor enqueueTimeZoneUpdate](self, "enqueueTimeZoneUpdate");
    }
  }
  objc_autoreleasePoolPop(v6);

}

+ (id)log
{
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, &__block_literal_global_12);
  return (id)log_log_3;
}

- (_DKNotificationTimeZoneChangeMonitor)init
{
  _DKNotificationTimeZoneChangeMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *donationQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DKNotificationTimeZoneChangeMonitor;
  v2 = -[_DKMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("_DKNotificationTimeZoneChangeMonitor.donations", v3);
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKNotificationTimeZoneChangeMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationTimeZoneChangeMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("TimeZone");
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationTimeZoneChangeMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v3, sel_instantMonitorNeedsActivation))
    -[_DKNotificationTimeZoneChangeMonitor activate](self, "activate");
}

- (void)activate
{
  NSObject *v3;
  CFAbsoluteTime Current;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *donationQueue;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  _QWORD block[5];
  id v15;
  CFAbsoluteTime v16;
  uint8_t buf[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_DEFAULT, "activate", buf, 2u);
  }

  dispatch_suspend((dispatch_object_t)self->_donationQueue);
  self->_resumed = 0;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE0C390]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "secondsFromGMT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithSecondsFromGMT:name:", v7, v8);

  donationQueue = self->_donationQueue;
  v11 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke;
  block[3] = &unk_24DA66F60;
  block[4] = self;
  v15 = v9;
  v16 = Current;
  v12 = v9;
  dispatch_async(donationQueue, block);
  self->_enabled = 1;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke_21;
  v13[3] = &unk_24DA66D10;
  v13[4] = self;
  objc_msgSend(MEMORY[0x24BE7A5D0], "runBlockWhenDeviceIsClassCUnlocked:", v13);

}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationTimeZoneChangeMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKNotificationTimeZoneChangeMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  self->_enabled = 0;
  if (!self->_resumed)
  {
    self->_cancel = 1;
    dispatch_resume((dispatch_object_t)self->_donationQueue);
  }
  dispatch_barrier_sync((dispatch_queue_t)self->_donationQueue, &__block_literal_global_24);
}

- (void)_updateWithTimeZone:(id)a3 timestamp:(double)a4
{
  BMDeviceTimeZone *v6;
  NSObject *v7;
  BMDeviceTimeZone *timeZone;
  BMDeviceTimeZone *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BMDeviceTimeZone *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (BMDeviceTimeZone *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_donationQueue);
  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_219056000, v7, OS_LOG_TYPE_DEFAULT, "Writing timezone event %@ at %f", (uint8_t *)&v14, 0x16u);
  }

  timeZone = self->_timeZone;
  self->_timeZone = v6;
  v9 = v6;

  self->_lastUpdate = a4;
  BiomeLibrary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "TimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:timestamp:", v9, a4);

}

- (void)enqueueTimeZoneUpdate
{
  CFAbsoluteTime Current;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *donationQueue;
  id v10;
  _QWORD block[5];
  id v12;
  CFAbsoluteTime v13;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE0C390]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "secondsFromGMT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithSecondsFromGMT:name:", v6, v7);

  donationQueue = self->_donationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___DKNotificationTimeZoneChangeMonitor_enqueueTimeZoneUpdate__block_invoke;
  block[3] = &unk_24DA66F60;
  block[4] = self;
  v12 = v8;
  v13 = Current;
  v10 = v8;
  dispatch_async(donationQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
