@implementation ULBuddyMonitor

- (ULBuddyMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULBuddyMonitor)initWithNotificationHelper:(id)a3
{
  id v4;
  ULBuddyMonitor *v5;
  ULBuddyMonitor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULBuddyMonitor;
  v5 = -[ULEventMonitor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ULBuddyMonitor setNotificationHelper:](v5, "setNotificationHelper:", v4);

  return v6;
}

- (void)startMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  _QWORD v11[4];
  id v12;
  _BYTE location[12];
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ULBuddyMonitor setBuddyComplete:](self, "setBuddyComplete:", -[ULBuddyMonitor _checkBuddyComplete](self, "_checkBuddyComplete"));
  if (!-[ULBuddyMonitor buddyComplete](self, "buddyComplete"))
  {
    objc_initWeak((id *)location, self);
    -[ULBuddyMonitor notificationHelper](self, "notificationHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __34__ULBuddyMonitor_startMonitoring___block_invoke;
    v11[3] = &unk_2511D2C80;
    objc_copyWeak(&v12, (id *)location);
    objc_msgSend(v6, "addObserverForNotificationName:handler:", *MEMORY[0x24BE85850], v11);

    -[ULBuddyMonitor setBuddyComplete:](self, "setBuddyComplete:", -[ULBuddyMonitor _checkBuddyComplete](self, "_checkBuddyComplete"));
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_83);
  v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = -[ULBuddyMonitor buddyComplete](self, "buddyComplete");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v4;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, buddyComplete: %@", location, 0x16u);

  }
}

void __34__ULBuddyMonitor_startMonitoring___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleBuddyCompleteNotification");
    WeakRetained = v2;
  }

}

- (void)stopMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ULBuddyMonitor notificationHelper](self, "notificationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserverForNotificationName:", *MEMORY[0x24BE85850]);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_83);
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }

}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ULBuddyMonitorEventBuddyComplete *v8;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ULEvent eventName](ULBuddyMonitorEventBuddyComplete, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_alloc_init(ULBuddyMonitorEventBuddyComplete);
    -[ULBuddyMonitorEventBuddyComplete setBuddyComplete:](v8, "setBuddyComplete:", -[ULBuddyMonitor buddyComplete](self, "buddyComplete"));
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_handleBuddyCompleteNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ULBuddyMonitor__handleBuddyCompleteNotification__block_invoke;
  block[3] = &unk_2511D2C58;
  block[4] = self;
  dispatch_async(v3, block);

}

void __50__ULBuddyMonitor__handleBuddyCompleteNotification__block_invoke(uint64_t a1)
{
  ULBuddyMonitorEventBuddyComplete *v2;

  objc_msgSend(*(id *)(a1 + 32), "setBuddyComplete:", 1);
  v2 = objc_alloc_init(ULBuddyMonitorEventBuddyComplete);
  -[ULBuddyMonitorEventBuddyComplete setBuddyComplete:](v2, "setBuddyComplete:", 1);
  objc_msgSend(*(id *)(a1 + 32), "postEvent:", v2);

}

- (BOOL)_checkBuddyComplete
{
  return BYSetupAssistantNeedsToRun() ^ 1;
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (BOOL)buddyComplete
{
  return self->_buddyComplete;
}

- (void)setBuddyComplete:(BOOL)a3
{
  self->_buddyComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end
