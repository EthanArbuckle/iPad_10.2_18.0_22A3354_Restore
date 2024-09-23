@implementation USBCableTypeMonitor

+ (id)sharedMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__USBCableTypeMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_once_1 != -1)
    dispatch_once(&sharedMonitor_once_1, block);
  return (id)sharedMonitor_sharedInstance_1;
}

void __36__USBCableTypeMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMonitor_sharedInstance_1;
  sharedMonitor_sharedInstance_1 = (uint64_t)v1;

}

- (USBCableTypeMonitor)init
{
  USBCableTypeMonitor *v2;
  USBCableTypeMonitor *v3;
  NSMutableArray *registeredUUIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)USBCableTypeMonitor;
  v2 = -[USBCableTypeMonitor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    registeredUUIDs = v2->_registeredUUIDs;
    v2->_uid = 0;
    v2->_registeredUUIDs = 0;

    v3->_ioUSB30XHCIRemovablePortNotifyPort = 0;
    *(_QWORD *)&v3->_ioUSB30XHCIRemovablePortNotification = 0;
    *(_QWORD *)&v3->_ioUSB30XHCIRemovablePortMatchIterator = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)USBCableTypeMonitor;
  -[USBCableTypeMonitor dealloc](&v2, sel_dealloc);
}

- (void)startCableTypeMonitoringForUUID:(id)a3
{
  id v4;
  NSMutableArray *registeredUUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  registeredUUIDs = self->_registeredUUIDs;
  v8 = v4;
  if (!registeredUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_registeredUUIDs;
    self->_registeredUUIDs = v6;

    v4 = v8;
    registeredUUIDs = self->_registeredUUIDs;
  }
  -[NSMutableArray addObject:](registeredUUIDs, "addObject:", v4);
  if (-[NSMutableArray count](self->_registeredUUIDs, "count"))
    -[USBCableTypeMonitor initUSB30XHCIRemovablePortNotifications](self, "initUSB30XHCIRemovablePortNotifications");

}

- (void)stopCableTypeMonitoringForUUID:(id)a3
{
  -[NSMutableArray removeObject:](self->_registeredUUIDs, "removeObject:", a3);
  if (!-[NSMutableArray count](self->_registeredUUIDs, "count"))
    -[USBCableTypeMonitor cleanupUSB30XHCIRemovablePortNotifications](self, "cleanupUSB30XHCIRemovablePortNotifications");
}

+ (int)usbCableType
{
  BOOL v2;
  id v3;
  io_registry_entry_t RootEntry;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  BOOL v12;
  id v13;
  id v14;
  mach_port_t mainPort;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  mainPort = -1431655766;
  if (IOMasterPort(0, &mainPort))
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 1;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v8 = MEMORY[0x24BDACB70];
      v3 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[USBCableTypeMonitor usbCableType].cold.6();
LABEL_17:

    v6 = 0;
    goto LABEL_18;
  }
  RootEntry = IORegistryGetRootEntry(mainPort);
  if (!RootEntry)
  {
    if (gLogObjects)
      v12 = gNumLogObjects < 1;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v8 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[USBCableTypeMonitor usbCableType].cold.2();
    goto LABEL_17;
  }
  v5 = (void *)IORegistryEntrySearchCFProperty(RootEntry, "IOService", CFSTR("AppleUSBCableType"), 0, 1u);
  if (!v5)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v8 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[USBCableTypeMonitor usbCableType].cold.4();
    goto LABEL_17;
  }
  v6 = v5;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Detached")) & 1) != 0)
  {
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("USBHost")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("USBHostAltConfig")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("USBDevice")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("USBDeviceNeedsAuthentication")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("USB3Host")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("USB3HostAltConfig")) & 1) != 0)
  {
    v7 = 6;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("USB3Device")) & 1) != 0)
  {
    v7 = 7;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("USB3DeviceNeedsAuthentication")))
  {
    v7 = 8;
  }
  else
  {
    v7 = 0;
  }
LABEL_19:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 1024;
    v19 = v7;
    _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_INFO, "prop='%@' __usbCableType=%d", buf, 0x12u);
  }

  if (v6)
    CFRelease(v6);
  mach_port_deallocate(*MEMORY[0x24BDAEC58], mainPort);

  return v7;
}

- (void)sendUSBCableTypeChangedNotification
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = self->_registeredUUIDs;
  v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v5);
        v15[0] = CFSTR("ACCPlatformCableTypePlugin_CableTypeKey");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", __usbCableType);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15[1] = CFSTR("ACCPlatformCableTypePlugin_ConnectionUUIDKey");
        v16[0] = v7;
        v16[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformCableTypePlugin_USBCableTypeDidChange"), 0, v8);

        ++v5;
      }
      while (v3 != v5);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v3);
  }

}

- (void)initUSB30XHCIRemovablePortNotifications
{
  unsigned int *p_ioUSB30XHCIRemovablePortMatchIterator;
  IONotificationPortRef v4;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  CFMutableDictionaryRef v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  io_iterator_t *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;

  *(_QWORD *)&self->_ioUSB30XHCIRemovablePortMatchIterator = 0;
  p_ioUSB30XHCIRemovablePortMatchIterator = &self->_ioUSB30XHCIRemovablePortMatchIterator;
  *(_QWORD *)&self->_ioUSB30XHCIRemovablePortNotification = 0;
  v4 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
  *((_QWORD *)p_ioUSB30XHCIRemovablePortMatchIterator - 2) = v4;
  if (v4)
  {
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioUSB30XHCIRemovablePortNotifyPort);
    CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    v7 = IOServiceMatching("AppleUSB30XHCIRemovablePort");
    CFRetain(v7);
    if (IOServiceAddMatchingNotification(self->_ioUSB30XHCIRemovablePortNotifyPort, "IOServicePublish", v7, (IOServiceMatchingCallback)__USB30XHCIRemovablePortClassMatch, (void *)self->_uid, p_ioUSB30XHCIRemovablePortMatchIterator)|| (v10 = *p_ioUSB30XHCIRemovablePortMatchIterator, !(_DWORD)v10))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v8 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[USBFaultMonitor initFaultConditionNotifications].cold.1();

      CFRelease(v7);
    }
    else
    {
      v11 = p_ioUSB30XHCIRemovablePortMatchIterator + 1;
      __USB30XHCIRemovablePortClassMatch(self->_uid, v10);
      if (IOServiceAddMatchingNotification(self->_ioUSB30XHCIRemovablePortNotifyPort, "IOServiceTerminate", v7, (IOServiceMatchingCallback)__USB30XHCIRemovablePortClassTerminate, (void *)self->_uid, v11)|| (v14 = *v11, !(_DWORD)v14))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v12 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          v12 = MEMORY[0x24BDACB70];
          v13 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[USBFaultMonitor initFaultConditionNotifications].cold.3();

      }
      else
      {
        __USB30XHCIRemovablePortClassTerminate((void *)self->_uid, v14);
      }
    }
  }
}

- (void)cleanupUSB30XHCIRemovablePortNotifications
{
  io_object_t ioUSB30XHCIRemovablePortNotification;
  io_object_t ioUSB30XHCIRemovablePortService;
  io_object_t ioUSB30XHCIRemovablePortMatchIterator;
  io_object_t ioUSB30XHCIRemovablePortTerminateIterator;
  IONotificationPort *ioUSB30XHCIRemovablePortNotifyPort;

  ioUSB30XHCIRemovablePortNotification = self->_ioUSB30XHCIRemovablePortNotification;
  if (ioUSB30XHCIRemovablePortNotification)
  {
    IOObjectRelease(ioUSB30XHCIRemovablePortNotification);
    self->_ioUSB30XHCIRemovablePortNotification = 0;
  }
  ioUSB30XHCIRemovablePortService = self->_ioUSB30XHCIRemovablePortService;
  if (ioUSB30XHCIRemovablePortService)
  {
    IOObjectRelease(ioUSB30XHCIRemovablePortService);
    self->_ioUSB30XHCIRemovablePortService = 0;
  }
  ioUSB30XHCIRemovablePortMatchIterator = self->_ioUSB30XHCIRemovablePortMatchIterator;
  if (ioUSB30XHCIRemovablePortMatchIterator)
  {
    IOObjectRelease(ioUSB30XHCIRemovablePortMatchIterator);
    self->_ioUSB30XHCIRemovablePortMatchIterator = 0;
  }
  ioUSB30XHCIRemovablePortTerminateIterator = self->_ioUSB30XHCIRemovablePortTerminateIterator;
  if (ioUSB30XHCIRemovablePortTerminateIterator)
  {
    IOObjectRelease(ioUSB30XHCIRemovablePortTerminateIterator);
    self->_ioUSB30XHCIRemovablePortTerminateIterator = 0;
  }
  ioUSB30XHCIRemovablePortNotifyPort = self->_ioUSB30XHCIRemovablePortNotifyPort;
  if (ioUSB30XHCIRemovablePortNotifyPort)
  {
    IONotificationPortDestroy(ioUSB30XHCIRemovablePortNotifyPort);
    self->_ioUSB30XHCIRemovablePortNotifyPort = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredUUIDs, 0);
}

+ (void)usbCableType
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR - IOMasterPort() failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
