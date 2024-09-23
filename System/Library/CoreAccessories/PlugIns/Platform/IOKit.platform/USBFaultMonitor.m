@implementation USBFaultMonitor

+ (id)sharedMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__USBFaultMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_once != -1)
    dispatch_once(&sharedMonitor_once, block);
  return (id)sharedMonitor_sharedInstance;
}

void __32__USBFaultMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMonitor_sharedInstance;
  sharedMonitor_sharedInstance = (uint64_t)v1;

}

- (USBFaultMonitor)init
{
  USBFaultMonitor *v2;
  USBFaultMonitor *v3;
  NSMutableDictionary *usbFaultStates;
  NSMutableDictionary *usbFaultStatesSent;
  NSMutableDictionary *requestedUSBFaultNotifications;
  NSMutableArray *registeredUUIDs;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)USBFaultMonitor;
  v2 = -[USBFaultMonitor init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_uid = 0;
    usbFaultStates = v2->_usbFaultStates;
    v2->_usbFaultStates = 0;

    usbFaultStatesSent = v3->_usbFaultStatesSent;
    v3->_usbFaultStatesSent = 0;

    requestedUSBFaultNotifications = v3->_requestedUSBFaultNotifications;
    v3->_requestedUSBFaultNotifications = 0;

    registeredUUIDs = v3->_registeredUUIDs;
    v3->_registeredUUIDs = 0;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)USBFaultMonitor;
  -[USBFaultMonitor dealloc](&v2, sel_dealloc);
}

- (void)startFaultMonitoringForUUID:(id)a3
{
  id v4;
  NSMutableArray *registeredUUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *usbFaultStates;
  NSMutableDictionary *v11;
  NSMutableDictionary *usbFaultStatesSent;
  NSMutableDictionary *v13;
  NSMutableDictionary *requestedUSBFaultNotifications;
  id v15;

  v4 = a3;
  registeredUUIDs = self->_registeredUUIDs;
  v15 = v4;
  if (!registeredUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_registeredUUIDs;
    self->_registeredUUIDs = v6;

    v4 = v15;
    registeredUUIDs = self->_registeredUUIDs;
  }
  -[NSMutableArray addObject:](registeredUUIDs, "addObject:", v4);
  if (-[NSMutableArray count](self->_registeredUUIDs, "count"))
  {
    +[IAPUIDManager sharedIAPUIDManager](IAPUIDManager, "sharedIAPUIDManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_uid = objc_msgSend(v8, "iapUID:", self);

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    usbFaultStates = self->_usbFaultStates;
    self->_usbFaultStates = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    usbFaultStatesSent = self->_usbFaultStatesSent;
    self->_usbFaultStatesSent = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    requestedUSBFaultNotifications = self->_requestedUSBFaultNotifications;
    self->_requestedUSBFaultNotifications = v13;

    -[USBFaultMonitor registerFaultInterest:](self, "registerFaultInterest:", 2);
    -[USBFaultMonitor initFaultConditionNotifications](self, "initFaultConditionNotifications");
  }

}

- (void)stopFaultMonitoringForUUID:(id)a3
{
  void *v4;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  io_object_t ioUSBCardReaderNotification;
  io_object_t ioUSBCardReaderService;
  io_object_t ioUSBCardReaderMatchIterator;
  io_object_t ioUSBCardReaderTerminateIterator;
  NSMutableDictionary *usbFaultStates;
  NSMutableDictionary *usbFaultStatesSent;
  NSMutableDictionary *requestedUSBFaultNotifications;

  -[NSMutableArray removeObject:](self->_registeredUUIDs, "removeObject:", a3);
  +[IAPUIDManager sharedIAPUIDManager](IAPUIDManager, "sharedIAPUIDManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeIAPUID:", self->_uid);

  self->_uid = 0;
  if (!-[NSMutableArray count](self->_registeredUUIDs, "count"))
  {
    if (self->_ioUSBCardReaderNotifyPort)
    {
      Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioUSBCardReaderNotifyPort);
      CFRunLoopRemoveSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      IONotificationPortDestroy(self->_ioUSBCardReaderNotifyPort);
      self->_ioUSBCardReaderNotifyPort = 0;
    }
    ioUSBCardReaderNotification = self->_ioUSBCardReaderNotification;
    if (ioUSBCardReaderNotification)
    {
      IOObjectRelease(ioUSBCardReaderNotification);
      self->_ioUSBCardReaderNotification = 0;
    }
    ioUSBCardReaderService = self->_ioUSBCardReaderService;
    if (ioUSBCardReaderService)
    {
      IOObjectRelease(ioUSBCardReaderService);
      self->_ioUSBCardReaderService = 0;
    }
    ioUSBCardReaderMatchIterator = self->_ioUSBCardReaderMatchIterator;
    if (ioUSBCardReaderMatchIterator)
    {
      IOObjectRelease(ioUSBCardReaderMatchIterator);
      self->_ioUSBCardReaderMatchIterator = 0;
    }
    ioUSBCardReaderTerminateIterator = self->_ioUSBCardReaderTerminateIterator;
    if (ioUSBCardReaderTerminateIterator)
    {
      IOObjectRelease(ioUSBCardReaderTerminateIterator);
      self->_ioUSBCardReaderTerminateIterator = 0;
    }
    usbFaultStates = self->_usbFaultStates;
    if (usbFaultStates)
    {
      self->_usbFaultStates = 0;

    }
    usbFaultStatesSent = self->_usbFaultStatesSent;
    if (usbFaultStatesSent)
    {
      self->_usbFaultStatesSent = 0;

    }
    requestedUSBFaultNotifications = self->_requestedUSBFaultNotifications;
    if (requestedUSBFaultNotifications)
    {
      self->_requestedUSBFaultNotifications = 0;

    }
  }
}

- (void)sendUSBFaultNotification
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = self->_registeredUUIDs;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v16[0] = CFSTR("USBFaultNotification_FaultTypeKey");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[USBFaultMonitor getFaultState:](self, "getFaultState:", 2));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = CFSTR("USBFaultNotification_ConnectionUUIDKey");
        v17[0] = v8;
        v17[1] = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("USBFaultNotification"), 0, v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v4);
  }

  -[NSMutableDictionary setDictionary:](self->_usbFaultStatesSent, "setDictionary:", self->_usbFaultStates);
}

- (void)setFaultState:(int)a3 flag:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSMutableDictionary *usbFaultStates;
  void *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109376;
    v13[1] = v5;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_INFO, "type=%d flag=%d", (uint8_t *)v13, 0xEu);
  }

  usbFaultStates = self->_usbFaultStates;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](usbFaultStates, "setObject:forKey:", v11, v12);

}

- (BOOL)getFaultState:(int)a3
{
  NSMutableDictionary *usbFaultStates;
  void *v4;
  void *v5;
  char v6;

  usbFaultStates = self->_usbFaultStates;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](usbFaultStates, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)registerFaultInterest:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *requestedUSBFaultNotifications;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  requestedUSBFaultNotifications = self->_requestedUSBFaultNotifications;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](requestedUSBFaultNotifications, "setObject:forKey:", v6, v5);

}

- (void)initFaultConditionNotifications
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_2171EA000, v0, v1, "IOServiceAddMatchingNotification terminate fail status:%02X, ioIter:%04X\n", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)checkUSBCardReaderProperty:(unsigned int)a3
{
  __CFDictionary *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  id v11;
  CFMutableDictionaryRef properties;

  properties = 0;
  if (IORegistryEntryCreateCFProperties(a3, &properties, 0, 0) || !properties)
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 1;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v6 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[USBFaultMonitor checkUSBCardReaderProperty:].cold.1(a3, v6);
  }
  else
  {
    v5 = properties;
    -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("NEEDS_ACCESSORY_RESET"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[USBFaultMonitor setFaultState:flag:](self, "setFaultState:flag:", 2, -[NSObject BOOLValue](v6, "BOOLValue"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_usbFaultStatesSent, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 || (v9 = -[NSObject BOOLValue](v6, "BOOLValue"), v9 != objc_msgSend(v8, "BOOLValue")))
      -[USBFaultMonitor sendUSBFaultNotification](self, "sendUSBFaultNotification");

  }
  if (properties)
    CFRelease(properties);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredUUIDs, 0);
  objc_storeStrong((id *)&self->_requestedUSBFaultNotifications, 0);
  objc_storeStrong((id *)&self->_usbFaultStatesSent, 0);
  objc_storeStrong((id *)&self->_usbFaultStates, 0);
}

- (void)checkUSBCardReaderProperty:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2171EA000, a2, OS_LOG_TYPE_ERROR, "Could not get property dictionary for service=%x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

@end
