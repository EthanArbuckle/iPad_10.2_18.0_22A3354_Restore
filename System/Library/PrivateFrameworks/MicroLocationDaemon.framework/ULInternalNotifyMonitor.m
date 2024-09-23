@implementation ULInternalNotifyMonitor

- (ULInternalNotifyMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULInternalNotifyMonitor)initWithNotificationHelper:(id)a3
{
  id v4;
  ULInternalNotifyMonitor *v5;
  ULInternalNotifyMonitor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULInternalNotifyMonitor;
  v5 = -[ULEventMonitor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ULInternalNotifyMonitor setNotificationHelper:](v5, "setNotificationHelper:", v4);

  return v6;
}

- (void)startMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ULInternalNotifyMonitor _identifierFromEventName:](self, "_identifierFromEventName:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ULInternalNotifyMonitor _startMonitoringForEventName:identifier:](self, "_startMonitoringForEventName:identifier:", v4, v6);

}

- (void)stopMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ULInternalNotifyMonitor _identifierFromEventName:](self, "_identifierFromEventName:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ULInternalNotifyMonitor _stopMonitoringForEventName:identifier:](self, "_stopMonitoringForEventName:identifier:", v4, v6);

}

- (void)_startMonitoringForEventName:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ULInternalNotifyMonitor notificationHelper](self, "notificationHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__ULInternalNotifyMonitor__startMonitoringForEventName_identifier___block_invoke;
  v11[3] = &unk_2511D3E20;
  objc_copyWeak(&v13, &location);
  v9 = v6;
  v12 = v9;
  objc_msgSend(v8, "addObserverForNotificationName:handler:", v7, v11);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_23);
  v10 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@", buf, 0xCu);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __67__ULInternalNotifyMonitor__startMonitoringForEventName_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleNotificationForEventName:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_stopMonitoringForEventName:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_23);
  v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v10, 0xCu);
  }
  -[ULInternalNotifyMonitor notificationHelper](self, "notificationHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserverForNotificationName:", v7);

}

- (void)_handleNotificationForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ULInternalNotifyMonitor *v9;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__ULInternalNotifyMonitor__handleNotificationForEventName___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__ULInternalNotifyMonitor__handleNotificationForEventName___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(NSClassFromString(*(NSString **)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 40), "postEvent:", v2);

}

- (id)_identifierFromEventName:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  v3 = a3;
  +[ULEvent eventName](ULInternalNotifyMonitorEventLocalize, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("com.apple.milod.action-localize");
  }
  else
  {
    +[ULEvent eventName](ULInternalNotifyMonitorEventRecord, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("com.apple.milod.action-record");
    }
    else
    {
      +[ULEvent eventName](ULInternalNotifyMonitorEventPurge, "eventName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqual:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = CFSTR("com.apple.milod.action-purge");
      }
      else
      {
        +[ULEvent eventName](ULInternalNotifyMonitorEventSettingsRefresh, "eventName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "isEqual:", v11);

        if (v12)
          v6 = CFSTR("com.apple.milod.action-settings-refresh");
        else
          v6 = 0;
      }
    }
  }

  return (id)v6;
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end
