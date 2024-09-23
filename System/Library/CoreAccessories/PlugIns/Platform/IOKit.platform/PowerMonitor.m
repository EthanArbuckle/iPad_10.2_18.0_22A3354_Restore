@implementation PowerMonitor

+ (id)sharedMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__PowerMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_once_2 != -1)
    dispatch_once(&sharedMonitor_once_2, block);
  return (id)sharedMonitor_sharedInstance_2;
}

void __29__PowerMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMonitor_sharedInstance_2;
  sharedMonitor_sharedInstance_2 = (uint64_t)v1;

}

- (PowerMonitor)init
{
  PowerMonitor *v2;
  PowerMonitor *v3;
  dispatch_semaphore_t v4;
  OS_dispatch_semaphore *sleepSemaphore;
  uint64_t v6;
  NSMutableArray *sleepNotificationClients;
  uint64_t v8;
  NSMutableArray *batteryNotificationClients;
  NSLock *v10;
  NSLock *batteryNotificationClientsLock;
  NSMutableArray *clientsPreventingSleep;
  dispatch_queue_t v13;
  OS_dispatch_queue *clientsPreventingSleepLock;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PowerMonitor;
  v2 = -[PowerMonitor init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isExtChargerConnected = 0;
    v2->_batteryCapacity = 0;
    v2->_batteryCapacityMax = 100;
    v2->_batteryChargeLevelPercent = 0;
    v2->_sleepNotificationsEnabled = 0;
    v4 = dispatch_semaphore_create(0);
    sleepSemaphore = v3->_sleepSemaphore;
    v3->_sleepSemaphore = (OS_dispatch_semaphore *)v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    sleepNotificationClients = v3->_sleepNotificationClients;
    v3->_sleepNotificationClients = (NSMutableArray *)v6;

    v3->_batteryNotifyPortRef = 0;
    v3->_battery_iter = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    batteryNotificationClients = v3->_batteryNotificationClients;
    v3->_batteryNotificationClients = (NSMutableArray *)v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    batteryNotificationClientsLock = v3->_batteryNotificationClientsLock;
    v3->_batteryNotificationClientsLock = v10;

    *(_QWORD *)&v3->_batteryChargingType = -1;
    v3->_systemIsAsleep = 0;
    clientsPreventingSleep = v3->_clientsPreventingSleep;
    v3->_clientsPreventingSleep = 0;

    v13 = dispatch_queue_create("clientsPreventingSleepLock", 0);
    clientsPreventingSleepLock = v3->_clientsPreventingSleepLock;
    v3->_clientsPreventingSleepLock = (OS_dispatch_queue *)v13;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__preferenceChangedNotification, CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)PowerMonitor;
  -[PowerMonitor dealloc](&v4, sel_dealloc);
}

- (int)getBatteryChargingState
{
  unsigned int v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  id v12;
  int v13;
  id v14;
  id v15;
  id v16;

  v3 = -[PowerMonitor getBatteryChargeLevel](self, "getBatteryChargeLevel");
  if (gLogObjects)
    v4 = gNumLogObjects < 3;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PowerMonitor getBatteryChargingState].cold.9(v3, self, v6);

  if (-[PowerMonitor isBatteryCharging](self, "isBatteryCharging")
    && !-[PowerMonitor batteryCapacityOverride](self, "batteryCapacityOverride")
    || -[PowerMonitor isExtChargerConnected](self, "isExtChargerConnected") && v3 <= 0x63)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v7 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PowerMonitor getBatteryChargingState].cold.1();
    v13 = 1;
    goto LABEL_55;
  }
  if (!-[PowerMonitor isExtChargerConnected](self, "isExtChargerConnected"))
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v7 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_54;
LABEL_53:
    -[PowerMonitor getBatteryChargingState].cold.5();
LABEL_54:
    v13 = 0;
    goto LABEL_55;
  }
  v8 = -[PowerMonitor batteryCapacity](self, "batteryCapacity");
  v9 = -[PowerMonitor batteryCapacityMax](self, "batteryCapacityMax");
  if (gLogObjects)
    v10 = gNumLogObjects <= 2;
  else
    v10 = 1;
  v11 = !v10;
  if (v8 != v9)
  {
    if (v11)
    {
      v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v7 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_54;
    goto LABEL_53;
  }
  if (v11)
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v7 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  v13 = 2;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PowerMonitor getBatteryChargingState].cold.3();
LABEL_55:

  return v13;
}

- (unsigned)getBatteryChargeLevel
{
  int v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = -[PowerMonitor batteryChargeLevelPercent](self, "batteryChargeLevelPercent");
  if (-[PowerMonitor batteryCapacityOverride](self, "batteryCapacityOverride") >= 1)
    v3 = -[PowerMonitor batteryCapacityOverride](self, "batteryCapacityOverride");
  if (gLogObjects)
    v4 = gNumLogObjects < 3;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PowerMonitor getBatteryChargeLevel].cold.1(self, v3, v6);

  return v3;
}

- (BOOL)_getBatteryChargingTypeIsInductive:(int)a3
{
  return (a3 - 11) < 5;
}

- (BOOL)getBatteryChargingTypeIsInductive
{
  _BOOL4 v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = -[PowerMonitor _getBatteryChargingTypeIsInductive:](self, "_getBatteryChargingTypeIsInductive:", -[PowerMonitor batteryChargingType](self, "batteryChargingType"));
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl(&dword_2171EA000, v5, OS_LOG_TYPE_INFO, "getBatteryChargingTypeIsInductive = %d", (uint8_t *)v7, 8u);
  }

  return v2;
}

- (BOOL)getExternalBatteryChargingTypeIsInductive
{
  _BOOL4 v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = -[PowerMonitor _getBatteryChargingTypeIsInductive:](self, "_getBatteryChargingTypeIsInductive:", -[PowerMonitor batteryChargingTypeExternal](self, "batteryChargingTypeExternal"));
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl(&dword_2171EA000, v5, OS_LOG_TYPE_INFO, "getExternalBatteryChargingTypeIsInductive = %d", (uint8_t *)v7, 8u);
  }

  return v2;
}

- (id)createBatteryNotificationClient
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v13;
  __CFRunLoop *Main;
  IONotificationPort *v15;
  const __CFDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PowerMonitor batteryNotificationClientsLock](self, "batteryNotificationClientsLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[PowerMonitor batteryNotificationClients](self, "batteryNotificationClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PowerMonitor batteryNotificationClients](self, "batteryNotificationClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412546;
    v31 = v4;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_2171EA000, v7, OS_LOG_TYPE_DEFAULT, "createBatteryNotificationClient registered clientUUID: %@ batteryNotificationClients: %@", (uint8_t *)&v30, 0x16u);

  }
  -[PowerMonitor batteryNotificationClients](self, "batteryNotificationClients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 == 1)
  {
    -[PowerMonitor setBatteryNotifyPortRef:](self, "setBatteryNotifyPortRef:", IONotificationPortCreate(*MEMORY[0x24BDD8B20]));
    RunLoopSource = IONotificationPortGetRunLoopSource(-[PowerMonitor batteryNotifyPortRef](self, "batteryNotifyPortRef"));
    if (RunLoopSource)
    {
      v13 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v13, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      v15 = -[PowerMonitor batteryNotifyPortRef](self, "batteryNotifyPortRef");
      v16 = IOServiceMatching("IOPMPowerSource");
      v17 = IOServiceAddMatchingNotification(v15, "IOServiceFirstMatch", v16, (IOServiceMatchingCallback)__powerBatteryMatch, &self->_batteryNotifyPortRef, &self->_battery_iter);
      if ((_DWORD)v17)
      {
        v18 = v17;
        if (gLogObjects && gNumLogObjects >= 3)
        {
          v19 = *(id *)(gLogObjects + 16);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          v19 = MEMORY[0x24BDACB70];
          v20 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[PowerMonitor createBatteryNotificationClient].cold.1(v18, v19, v21, v22, v23, v24, v25, v26);

      }
      else
      {
        __powerBatteryMatch(&self->_batteryNotifyPortRef, -[PowerMonitor battery_iter](self, "battery_iter"));
      }
    }
  }
  -[PowerMonitor batteryNotificationClientsLock](self, "batteryNotificationClientsLock");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "unlock");

  dispatch_get_global_queue(0, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v28, &__block_literal_global);

  return v4;
}

void __47__PowerMonitor_createBatteryNotificationClient__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformCableTypePlugin_IsExternalChargerConnectedKey"), 0, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformCableTypePlugin_BatteryChargingStateKey"), 0, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformCableTypePlugin_BatteryChargeLevelKey"), 0, 0);

}

- (void)destroyBatteryNotificationsForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PowerMonitor batteryNotificationClientsLock](self, "batteryNotificationClientsLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (v4)
  {
    -[PowerMonitor batteryNotificationClients](self, "batteryNotificationClients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      -[PowerMonitor batteryNotificationClients](self, "batteryNotificationClients");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v4);

      if (gLogObjects && gNumLogObjects >= 3)
      {
        v9 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[PowerMonitor batteryNotificationClients](self, "batteryNotificationClients");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v4;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_DEFAULT, "destroyBatteryNotificationClient clientUUID: %@ remaining batteryNotificationClients: %@", (uint8_t *)&v19, 0x16u);

      }
    }
    -[PowerMonitor batteryNotificationClients](self, "batteryNotificationClients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v14 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v14 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_2171EA000, v14, OS_LOG_TYPE_DEFAULT, "0 clients, unregistering battery notifications", (uint8_t *)&v19, 2u);
      }

      if (-[PowerMonitor batteryNotifyPortRef](self, "batteryNotifyPortRef"))
      {
        Main = CFRunLoopGetMain();
        RunLoopSource = IONotificationPortGetRunLoopSource(-[PowerMonitor batteryNotifyPortRef](self, "batteryNotifyPortRef"));
        CFRunLoopRemoveSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
        IONotificationPortDestroy(-[PowerMonitor batteryNotifyPortRef](self, "batteryNotifyPortRef"));
        -[PowerMonitor setBatteryNotifyPortRef:](self, "setBatteryNotifyPortRef:", 0);
      }
    }
  }
  -[PowerMonitor batteryNotificationClientsLock](self, "batteryNotificationClientsLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

}

- (id)createSleepNotificationClient
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  dispatch_queue_t v12;
  IONotificationPort *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PowerMonitor sleepNotificationClients](self, "sleepNotificationClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  if (gLogObjects)
    v6 = gNumLogObjects < 3;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PowerMonitor sleepNotificationClients](self, "sleepNotificationClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v4;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_DEFAULT, "createSleepNotificationClient registered clientUUID: %@ sleepNotificationClients: %@", (uint8_t *)&v19, 0x16u);

  }
  -[PowerMonitor sleepNotificationClients](self, "sleepNotificationClients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 == 1)
  {
    v12 = dispatch_queue_create("com.apple.accessoryd.powerMonitor.systemPower.queue", 0);
    -[PowerMonitor setSystemPowerQueue:](self, "setSystemPowerQueue:", v12);

    -[PowerMonitor setSystemPowerPort:](self, "setSystemPowerPort:", 0);
    -[PowerMonitor setSystemPowerNotifyPortRef:](self, "setSystemPowerNotifyPortRef:", 0);
    -[PowerMonitor setSystemPowerIterator:](self, "setSystemPowerIterator:", 0);
    -[PowerMonitor setSystemPowerPort:](self, "setSystemPowerPort:", IORegisterForSystemPower(self, &self->_systemPowerNotifyPortRef, (IOServiceInterestCallback)__SystemPowerCallback, &self->_systemPowerIterator));
    if (-[PowerMonitor systemPowerPort](self, "systemPowerPort"))
    {
      v13 = -[PowerMonitor systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef");
      -[PowerMonitor systemPowerQueue](self, "systemPowerQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      IONotificationPortSetDispatchQueue(v13, v14);

      -[PowerMonitor setSleepNotificationsEnabled:](self, "setSleepNotificationsEnabled:", 1);
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v15 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v15 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_2171EA000, v15, OS_LOG_TYPE_DEFAULT, "createSleepNotificationClient successfully registered for sleep notifications", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v15 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v15 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PowerMonitor createSleepNotificationClient].cold.1();
    }

  }
  return v4;
}

- (void)destroySleepNotificationsForClient:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[PowerMonitor sleepNotificationClients](self, "sleepNotificationClients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      -[PowerMonitor sleepNotificationClients](self, "sleepNotificationClients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v4);

      if (gLogObjects && gNumLogObjects >= 3)
      {
        v8 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v8 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[PowerMonitor sleepNotificationClients](self, "sleepNotificationClients");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v4;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_DEFAULT, "destroySleepNotificationsForClient clientUUID: %@ sleepNotificationClients: %@", (uint8_t *)&v15, 0x16u);

      }
    }
    -[PowerMonitor sleepNotificationClients](self, "sleepNotificationClients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
      if (-[PowerMonitor systemPowerIterator](self, "systemPowerIterator"))
        IODeregisterForSystemPower(&self->_systemPowerIterator);
      if (-[PowerMonitor systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef"))
        IONotificationPortDestroy(-[PowerMonitor systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef"));
      if (-[PowerMonitor systemPowerPort](self, "systemPowerPort"))
        IOServiceClose(-[PowerMonitor systemPowerPort](self, "systemPowerPort"));
      -[PowerMonitor setSystemPowerQueue:](self, "setSystemPowerQueue:", 0);
      -[PowerMonitor setSleepNotificationsEnabled:](self, "setSleepNotificationsEnabled:", 0);
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v13 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v13 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_2171EA000, v13, OS_LOG_TYPE_DEFAULT, "0 clients, unregistering sleep notifications", (uint8_t *)&v15, 2u);
      }

    }
  }

}

- (void)clientHandledSleepNotification:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[PowerMonitor clientsPreventingSleepLock](self, "clientsPreventingSleepLock");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__PowerMonitor_clientHandledSleepNotification___block_invoke;
    block[3] = &unk_24D70BC20;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __47__PowerMonitor_clientHandledSleepNotification___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "clientsPreventingSleep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientsPreventingSleep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

    if (gLogObjects && gNumLogObjects >= 3)
    {
      v5 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v5 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "clientsPreventingSleep");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_2171EA000, v5, OS_LOG_TYPE_DEFAULT, "clientHandledSleepNotification removed client: %@: clientsPreventingSleep: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "clientsPreventingSleep");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject count](v9, "count"))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "systemIsAsleep");

      if (!v10)
        return;
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v11 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v11 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_2171EA000, v11, OS_LOG_TYPE_DEFAULT, "No longer waiting on clients, signaling semaphore", (uint8_t *)&v13, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "sleepSemaphore");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v9);
    }

  }
}

- (void)_checkAndSendNotificationForOldConnected:(BOOL)a3 oldIsBatteryCharging:(BOOL)a4 oldBatteryChargeLevelPercent:(int)a5 oldBatteryChargingType:(int)a6 oldBatteryChargingTypeExt:(int)a7 overrideChanged:(BOOL)a8
{
  _BOOL4 v11;
  _BOOL4 v13;
  int v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  int v23;
  _BOOL4 v24;
  uint8_t buf[4];
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v23 = a4;
  v24 = a8;
  v11 = a3;
  v49 = *MEMORY[0x24BDAC8D0];
  v13 = -[PowerMonitor isBatteryCharging](self, "isBatteryCharging");
  v14 = -[PowerMonitor batteryChargeLevelPercent](self, "batteryChargeLevelPercent");
  if (-[PowerMonitor batteryCapacityOverride](self, "batteryCapacityOverride") >= 1)
  {
    v14 = -[PowerMonitor batteryCapacityOverride](self, "batteryCapacityOverride");
    if (v14 == 100)
      v13 = 0;
  }
  v22 = v13;
  if (gLogObjects)
    v15 = gNumLogObjects < 3;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67111936;
    v26 = v24;
    v27 = 1024;
    v28 = v11;
    v29 = 1024;
    v30 = -[PowerMonitor isExtChargerConnected](self, "isExtChargerConnected");
    v31 = 1024;
    v32 = v23;
    v33 = 1024;
    v34 = v13;
    v35 = 1024;
    v36 = -[PowerMonitor batteryCapacityOverride](self, "batteryCapacityOverride");
    v37 = 1024;
    v38 = a5;
    v39 = 1024;
    v40 = v14;
    v41 = 1024;
    v42 = a6;
    v43 = 1024;
    v44 = -[PowerMonitor batteryChargingType](self, "batteryChargingType");
    v45 = 1024;
    v46 = a7;
    v47 = 1024;
    v48 = -[PowerMonitor batteryChargingTypeExternal](self, "batteryChargingTypeExternal");
    _os_log_impl(&dword_2171EA000, v17, OS_LOG_TYPE_INFO, "_checkAndSendNotificationForOldConnected: overrideChanged %d, isExtChargerConnected %d -> %d, isBatteryCharging %d -> %d, batteryChargeLevelPercent(%d) %d -> %d, batteryChargingType %d -> %d, batteryChargingTypeExternal %d -> %d", buf, 0x4Au);
  }

  if (-[PowerMonitor isExtChargerConnected](self, "isExtChargerConnected") != v11)
  {
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v18, &__block_literal_global_11);

  }
  if (v22 != v23)
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, &__block_literal_global_12);

  }
  if (v24 || v14 != a5)
  {
    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v20, &__block_literal_global_13);

  }
  if (-[PowerMonitor batteryChargingType](self, "batteryChargingType") != a6
    || -[PowerMonitor batteryChargingTypeExternal](self, "batteryChargingTypeExternal") != a7)
  {
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v21, &__block_literal_global_14);

  }
}

void __172__PowerMonitor__checkAndSendNotificationForOldConnected_oldIsBatteryCharging_oldBatteryChargeLevelPercent_oldBatteryChargingType_oldBatteryChargingTypeExt_overrideChanged___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformCableTypePlugin_IsExternalChargerConnectedKey"), 0, 0);

}

void __172__PowerMonitor__checkAndSendNotificationForOldConnected_oldIsBatteryCharging_oldBatteryChargeLevelPercent_oldBatteryChargingType_oldBatteryChargingTypeExt_overrideChanged___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformCableTypePlugin_BatteryChargingStateKey"), 0, 0);

}

void __172__PowerMonitor__checkAndSendNotificationForOldConnected_oldIsBatteryCharging_oldBatteryChargeLevelPercent_oldBatteryChargingType_oldBatteryChargingTypeExt_overrideChanged___block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformCableTypePlugin_BatteryChargeLevelKey"), 0, 0);

}

void __172__PowerMonitor__checkAndSendNotificationForOldConnected_oldIsBatteryCharging_oldBatteryChargeLevelPercent_oldBatteryChargingType_oldBatteryChargingTypeExt_overrideChanged___block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformCableTypePlugin_BatteryChargingTypeChanged"), 0, 0);

}

- (OS_dispatch_queue)systemPowerQueue
{
  return self->_systemPowerQueue;
}

- (void)setSystemPowerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_systemPowerQueue, a3);
}

- (unsigned)systemPowerPort
{
  return self->_systemPowerPort;
}

- (void)setSystemPowerPort:(unsigned int)a3
{
  self->_systemPowerPort = a3;
}

- (IONotificationPort)systemPowerNotifyPortRef
{
  return self->_systemPowerNotifyPortRef;
}

- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3
{
  self->_systemPowerNotifyPortRef = a3;
}

- (unsigned)systemPowerIterator
{
  return self->_systemPowerIterator;
}

- (void)setSystemPowerIterator:(unsigned int)a3
{
  self->_systemPowerIterator = a3;
}

- (BOOL)sleepNotificationsEnabled
{
  return self->_sleepNotificationsEnabled;
}

- (void)setSleepNotificationsEnabled:(BOOL)a3
{
  self->_sleepNotificationsEnabled = a3;
}

- (NSMutableArray)sleepNotificationClients
{
  return self->_sleepNotificationClients;
}

- (void)setSleepNotificationClients:(id)a3
{
  objc_storeStrong((id *)&self->_sleepNotificationClients, a3);
}

- (NSMutableArray)clientsPreventingSleep
{
  return self->_clientsPreventingSleep;
}

- (void)setClientsPreventingSleep:(id)a3
{
  objc_storeStrong((id *)&self->_clientsPreventingSleep, a3);
}

- (OS_dispatch_semaphore)sleepSemaphore
{
  return self->_sleepSemaphore;
}

- (void)setSleepSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_sleepSemaphore, a3);
}

- (BOOL)systemIsAsleep
{
  return self->_systemIsAsleep;
}

- (void)setSystemIsAsleep:(BOOL)a3
{
  self->_systemIsAsleep = a3;
}

- (OS_dispatch_queue)clientsPreventingSleepLock
{
  return self->_clientsPreventingSleepLock;
}

- (void)setClientsPreventingSleepLock:(id)a3
{
  objc_storeStrong((id *)&self->_clientsPreventingSleepLock, a3);
}

- (BOOL)isExtChargerConnected
{
  return self->_isExtChargerConnected;
}

- (void)setIsExtChargerConnected:(BOOL)a3
{
  self->_isExtChargerConnected = a3;
}

- (int)batteryCapacity
{
  return self->_batteryCapacity;
}

- (void)setBatteryCapacity:(int)a3
{
  self->_batteryCapacity = a3;
}

- (int)batteryCapacityOverride
{
  return self->_batteryCapacityOverride;
}

- (void)setBatteryCapacityOverride:(int)a3
{
  self->_batteryCapacityOverride = a3;
}

- (int)batteryCapacityMax
{
  return self->_batteryCapacityMax;
}

- (void)setBatteryCapacityMax:(int)a3
{
  self->_batteryCapacityMax = a3;
}

- (BOOL)isBatteryCharging
{
  return self->_isBatteryCharging;
}

- (void)setIsBatteryCharging:(BOOL)a3
{
  self->_isBatteryCharging = a3;
}

- (unsigned)batteryChargeLevelPercent
{
  return self->_batteryChargeLevelPercent;
}

- (void)setBatteryChargeLevelPercent:(unsigned __int8)a3
{
  self->_batteryChargeLevelPercent = a3;
}

- (IONotificationPort)batteryNotifyPortRef
{
  return self->_batteryNotifyPortRef;
}

- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3
{
  self->_batteryNotifyPortRef = a3;
}

- (unsigned)battery_iter
{
  return self->_battery_iter;
}

- (void)setBattery_iter:(unsigned int)a3
{
  self->_battery_iter = a3;
}

- (NSMutableArray)batteryNotificationClients
{
  return self->_batteryNotificationClients;
}

- (void)setBatteryNotificationClients:(id)a3
{
  objc_storeStrong((id *)&self->_batteryNotificationClients, a3);
}

- (NSLock)batteryNotificationClientsLock
{
  return self->_batteryNotificationClientsLock;
}

- (void)setBatteryNotificationClientsLock:(id)a3
{
  objc_storeStrong((id *)&self->_batteryNotificationClientsLock, a3);
}

- (int)batteryChargingType
{
  return self->_batteryChargingType;
}

- (void)setBatteryChargingType:(int)a3
{
  self->_batteryChargingType = a3;
}

- (int)batteryChargingTypeExternal
{
  return self->_batteryChargingTypeExternal;
}

- (void)setBatteryChargingTypeExternal:(int)a3
{
  self->_batteryChargingTypeExternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryNotificationClientsLock, 0);
  objc_storeStrong((id *)&self->_batteryNotificationClients, 0);
  objc_storeStrong((id *)&self->_clientsPreventingSleepLock, 0);
  objc_storeStrong((id *)&self->_sleepSemaphore, 0);
  objc_storeStrong((id *)&self->_clientsPreventingSleep, 0);
  objc_storeStrong((id *)&self->_sleepNotificationClients, 0);
  objc_storeStrong((id *)&self->_systemPowerQueue, 0);
}

- (void)getBatteryChargingState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_2171EA000, v0, v1, "getBatteryChargingState: Disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (float)getBatteryChargingState
{
  int v5;
  float result;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v7[0] = 67109888;
  v7[1] = objc_msgSend(a2, "isBatteryCharging");
  v8 = 1024;
  v9 = objc_msgSend(a2, "batteryCapacityOverride");
  v10 = 1024;
  v11 = objc_msgSend(a2, "isExtChargerConnected");
  v12 = 1024;
  v13 = v5;
  _os_log_debug_impl(&dword_2171EA000, a3, OS_LOG_TYPE_DEBUG, "getBatteryChargeLevel: isBatteryCharging %d, batteryCapacityOverride %d, isExtChargerConnected %d, batteryChargeLevelPercent %d", (uint8_t *)v7, 0x1Au);
  return result;
}

- (void)getBatteryChargeLevel
{
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5[0] = 67109376;
  v5[1] = objc_msgSend(a1, "batteryChargeLevelPercent");
  v6 = 1024;
  v7 = a2;
  _os_log_debug_impl(&dword_2171EA000, a3, OS_LOG_TYPE_DEBUG, "getBatteryChargeLevel: batteryChargeLevelPercent: %d -> %d", (uint8_t *)v5, 0xEu);
}

- (void)createBatteryNotificationClient
{
  OUTLINED_FUNCTION_1(&dword_2171EA000, a2, a3, "%s IOServiceAddMatchingNotification failed: %08x", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)createSleepNotificationClient
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_2171EA000, v0, OS_LOG_TYPE_ERROR, "IORegisterForSystemPower failed!!  No system power notifications", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
