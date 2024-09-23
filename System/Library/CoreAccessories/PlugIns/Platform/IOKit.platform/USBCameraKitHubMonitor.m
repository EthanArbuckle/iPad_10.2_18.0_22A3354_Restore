@implementation USBCameraKitHubMonitor

+ (id)sharedMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__USBCameraKitHubMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_once_0 != -1)
    dispatch_once(&sharedMonitor_once_0, block);
  return (id)sharedMonitor_sharedInstance_0;
}

void __39__USBCameraKitHubMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMonitor_sharedInstance_0;
  sharedMonitor_sharedInstance_0 = (uint64_t)v1;

}

- (USBCameraKitHubMonitor)init
{
  USBCameraKitHubMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)USBCameraKitHubMonitor;
  v2 = -[USBCameraKitHubMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.accessoryd.cameraKitHubQ", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  objc_super v4;

  queue = self->_queue;
  self->_queue = 0;

  v4.receiver = self;
  v4.super_class = (Class)USBCameraKitHubMonitor;
  -[USBCameraKitHubMonitor dealloc](&v4, sel_dealloc);
}

- (void)initUSBCameraKitHubNotifications:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  __int128 v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[USBCameraKitHubMonitor initUSBCameraKitHubNotifications:].cold.2((uint64_t)self, v7);

  if (!self->_ioUSB20CameraKitHubNotifyPort)
  {
    +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
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
      LODWORD(v16) = 138412290;
      *(_QWORD *)((char *)&v16 + 4) = v8;
      _os_log_impl(&dword_2171EA000, v9, OS_LOG_TYPE_INFO, "_InitUSB20CameraKitHubNotifications: monitor=%@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(v8, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v16 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v16 + 1) = 3221225472;
    v17 = ___InitUSB20CameraKitHubNotifications_block_invoke;
    v18 = &unk_24D70BBF8;
    v19 = v8;
    v12 = v8;
    dispatch_async(v11, &v16);

  }
  if (!self->_ioUSB30CameraKitHubNotifyPort)
  {
    +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v16 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v16 + 1) = 3221225472;
    v17 = ___InitUSB30CameraKitHubNotifications_block_invoke;
    v18 = &unk_24D70BBF8;
    v19 = v13;
    v15 = v13;
    dispatch_async(v14, &v16);

  }
}

- (BOOL)supportsUSB20CameraKitHub:(id)a3
{
  return self->_ioUSB20CameraKitHubService != 0;
}

- (BOOL)supportsUSB30CameraKitHub:(id)a3
{
  return self->_ioUSB30CameraKitHubService != 0;
}

- (BOOL)overcurrentState:(id)a3
{
  return self->_ioUSBCameraKitHubOverCurrentDetected;
}

- (void)resetOvercurrentSiphoning:(id)a3
{
  -[USBCameraKitHubMonitor _setOvercurrentSiphoning:forUUID:](self, "_setOvercurrentSiphoning:forUUID:", 0, a3);
}

- (void)setOvercurrentSiphoning:(id)a3
{
  -[USBCameraKitHubMonitor _setOvercurrentSiphoning:forUUID:](self, "_setOvercurrentSiphoning:forUUID:", 1, a3);
}

- (unsigned)getUSBHubSiphoningCurrentRequirementInmA:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  id v8;
  unsigned int ioUSB20CameraKitHubPortCurrentAllocation;
  unsigned int ioUSB20CameraKitHubPortFailedRequestedPower;
  unsigned int ioUSB30CameraKitHubPortCurrentAllocation;
  unsigned int ioUSB30CameraKitHubPortFailedRequestedPower;
  unsigned int ioUSB20CameraKitHubExtraRequestedPower;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  NSObject *v18;
  id v19;
  unsigned int ioUSB20CameraKitHubCurrentNeeded;
  unsigned int ioUSB30CameraKitHubCurrentNeeded;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_ioUSBCameraKitHubCurrentNeedUpdate)
  {
    queue = self->_queue;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __67__USBCameraKitHubMonitor_getUSBHubSiphoningCurrentRequirementInmA___block_invoke;
    v27[3] = &unk_24D70BC20;
    v27[4] = self;
    v28 = v4;
    dispatch_sync(queue, v27);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      ioUSB20CameraKitHubPortCurrentAllocation = self->_ioUSB20CameraKitHubPortCurrentAllocation;
      ioUSB20CameraKitHubPortFailedRequestedPower = self->_ioUSB20CameraKitHubPortFailedRequestedPower;
      ioUSB30CameraKitHubPortCurrentAllocation = self->_ioUSB30CameraKitHubPortCurrentAllocation;
      ioUSB30CameraKitHubPortFailedRequestedPower = self->_ioUSB30CameraKitHubPortFailedRequestedPower;
      ioUSB20CameraKitHubExtraRequestedPower = self->_ioUSB20CameraKitHubExtraRequestedPower;
      *(_DWORD *)buf = 67110144;
      v30 = ioUSB20CameraKitHubPortCurrentAllocation;
      v31 = 1024;
      v32 = ioUSB30CameraKitHubPortCurrentAllocation;
      v33 = 1024;
      v34 = ioUSB20CameraKitHubPortFailedRequestedPower;
      v35 = 1024;
      v36 = ioUSB30CameraKitHubPortFailedRequestedPower;
      v37 = 1024;
      v38 = ioUSB20CameraKitHubExtraRequestedPower;
      _os_log_impl(&dword_2171EA000, v7, OS_LOG_TYPE_INFO, "getUSBHubSiphoningCurrentRequirement: CameraKitHubPortCurrentAllocation=%d/%d CameraKitHubPortFailedRequestedPower=%d/%d CameraKitHubExtraRequestedPower=%d", buf, 0x20u);
    }

    v14 = self->_ioUSB30CameraKitHubPortCurrentAllocation;
    if (v14 <= self->_ioUSB30CameraKitHubPortFailedRequestedPower)
      v14 = self->_ioUSB30CameraKitHubPortFailedRequestedPower;
    self->_ioUSB30CameraKitHubCurrentNeeded = v14;
    v15 = self->_ioUSB20CameraKitHubPortCurrentAllocation;
    v16 = self->_ioUSB20CameraKitHubPortFailedRequestedPower;
    if (v15 > v16)
      v16 = self->_ioUSB20CameraKitHubPortCurrentAllocation;
    if (v15 >= self->_ioUSB20CameraKitHubExtraRequestedPower)
      v17 = v16;
    else
      v17 = self->_ioUSB20CameraKitHubExtraRequestedPower;
    self->_ioUSB20CameraKitHubCurrentNeeded = v17;

  }
  if (self->_ioUSB20CameraKitHubCurrentNeeded >= 0x65 && self->_ioUSB30CameraKitHubCurrentNeeded >= 0x97)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      ioUSB20CameraKitHubCurrentNeeded = self->_ioUSB20CameraKitHubCurrentNeeded;
      ioUSB30CameraKitHubCurrentNeeded = self->_ioUSB30CameraKitHubCurrentNeeded;
      *(_DWORD *)buf = 67109376;
      v30 = ioUSB20CameraKitHubCurrentNeeded;
      v31 = 1024;
      v32 = ioUSB30CameraKitHubCurrentNeeded;
      _os_log_impl(&dword_2171EA000, v18, OS_LOG_TYPE_DEFAULT, "getUSBHubSiphoningCurrentRequirementInmA: ERROR: Unexpected extra power request on both CameraKitHub %d %d", buf, 0xEu);
    }

  }
  v22 = self->_ioUSB30CameraKitHubCurrentNeeded;
  if (v22)
  {
    if (v22 <= 0x384)
      v23 = 900;
    else
      v23 = self->_ioUSB30CameraKitHubCurrentNeeded;
  }
  else
  {
    v24 = self->_ioUSB20CameraKitHubCurrentNeeded;
    if (v24 <= 0x226)
      v25 = 550;
    else
      v25 = self->_ioUSB20CameraKitHubCurrentNeeded;
    if (v24)
      v23 = v25;
    else
      v23 = 0;
  }

  return v23;
}

uint64_t __67__USBCameraKitHubMonitor_getUSBHubSiphoningCurrentRequirementInmA___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSiphoningValuesFromDrivers:", *(_QWORD *)(a1 + 40));
}

- (unsigned)getUSBHubSiphoningCurrentActualRequirementInmA:(id)a3
{
  unsigned int result;

  -[USBCameraKitHubMonitor getUSBHubSiphoningCurrentRequirementInmA:](self, "getUSBHubSiphoningCurrentRequirementInmA:", a3);
  result = self->_ioUSB30CameraKitHubCurrentNeeded;
  if (!result)
    return self->_ioUSB20CameraKitHubCurrentNeeded;
  return result;
}

- (unsigned)getUSBHubUnitLoadInmA:(id)a3
{
  -[USBCameraKitHubMonitor getUSBHubSiphoningCurrentRequirementInmA:](self, "getUSBHubSiphoningCurrentRequirementInmA:", a3);
  if (self->_ioUSB30CameraKitHubCurrentNeeded)
    return 150;
  if (self->_ioUSB20CameraKitHubCurrentNeeded)
    return 100;
  return 0;
}

- (void)_powerPostCCKHubChangeNotification
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformUSBCameraKitHubPlugin_HubChange"), 0, 0);

}

- (void)_setOvercurrentSiphoning:(BOOL)a3 forUUID:(id)a4
{
  self->_ioUSBCameraKitHubOverCurrentDetected = a3;
  self->_ioUSBCameraKitHubCurrentNeedUpdate = 1;
  -[USBCameraKitHubMonitor _powerPostCCKHubChangeNotification](self, "_powerPostCCKHubChangeNotification");
}

- (void)_updateSiphoningValuesFromDrivers:(id)a3
{
  id v4;
  io_registry_entry_t ioUSB20CameraKitHubService;
  void *v6;
  NSObject *v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  id v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  int v15;
  NSObject *v16;
  id v17;
  unsigned int ioUSB20CameraKitHubPortCurrentAllocation;
  unsigned int ioUSB20CameraKitHubPortFailedRequestedPower;
  unsigned int ioUSB30CameraKitHubPortCurrentAllocation;
  unsigned int ioUSB30CameraKitHubPortFailedRequestedPower;
  unsigned int ioUSB20CameraKitHubExtraRequestedPower;
  _BOOL4 ioUSBCameraKitHubOverCurrentDetected;
  uint64_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  unsigned int ioUSBCameraKitHubTotalCurrent;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  _BOOL4 v34;
  uint64_t v35;
  io_registry_entry_t object;
  io_registry_entry_t child;
  int valuePtr;
  _BYTE v39[10];
  _BYTE v40[6];
  _BYTE v41[6];
  _BYTE v42[6];
  _BYTE v43[6];
  unsigned int v44;
  __int16 v45;
  unsigned int v46;
  __int16 v47;
  _BOOL4 v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_ioUSBCameraKitHubCurrentNeedUpdate)
  {
    self->_ioUSBCameraKitHubCurrentNeedUpdate = 0;
    self->_ioUSB20CameraKitHubPortCurrentAllocation = __USBCameraKitHubGetPortCurAllocation(self->_ioUSB20CameraKitHubService);
    self->_ioUSB20CameraKitHubPortFailedRequestedPower = __USBCameraKitHubGetPortFailedRequestedPower(self->_ioUSB20CameraKitHubService);
    self->_ioUSB30CameraKitHubPortCurrentAllocation = __USBCameraKitHubGetPortCurAllocation(self->_ioUSB30CameraKitHubService);
    self->_ioUSB30CameraKitHubPortFailedRequestedPower = __USBCameraKitHubGetPortFailedRequestedPower(self->_ioUSB30CameraKitHubService);
    ioUSB20CameraKitHubService = self->_ioUSB20CameraKitHubService;
    if (ioUSB20CameraKitHubService)
    {
      child = -1431655766;
      if (IORegistryEntryGetChildEntry(ioUSB20CameraKitHubService, "IOService", &child))
      {
        ioUSB20CameraKitHubService = 0;
      }
      else
      {
        +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        object = -1431655766;
        if (IORegistryEntryGetChildEntry(child, "IOService", &object))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v7 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              __29__SleepAssertionManager_init__block_invoke_cold_1();
            v7 = MEMORY[0x24BDACB70];
            v10 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v11 = objc_msgSend(v6, "ioUSB30CameraKitHubService");
            valuePtr = 67109888;
            if (v11 == ioUSB20CameraKitHubService)
              v12 = 2;
            else
              v12 = 3;
            *(_DWORD *)v39 = ioUSB20CameraKitHubService;
            *(_WORD *)&v39[4] = 1024;
            *(_DWORD *)&v39[6] = v12;
            *(_WORD *)v40 = 1024;
            *(_DWORD *)&v40[2] = child;
            *(_WORD *)v41 = 1024;
            *(_DWORD *)&v41[2] = 0;
            _os_log_impl(&dword_2171EA000, v7, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortExtraRequestedPower: failed to get child kIOUSBPlane, service=%d(%d) child=%d, result=%d", (uint8_t *)&valuePtr, 0x1Au);
          }

          ioUSB20CameraKitHubService = 0;
        }
        else
        {
          v8 = (const __CFNumber *)IORegistryEntrySearchCFProperty(child, "IOService", CFSTR("kUSBDesiredChargingCurrent"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 1u);
          if (v8)
          {
            v9 = v8;
            valuePtr = -1431655766;
            CFNumberGetValue(v8, kCFNumberIntType, &valuePtr);
            ioUSB20CameraKitHubService = valuePtr;
            CFRelease(v9);
          }
          else
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v13 = *(id *)gLogObjects;
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
              if (objc_msgSend(v6, "ioUSB30CameraKitHubService") == ioUSB20CameraKitHubService)
                v15 = 2;
              else
                v15 = 3;
              valuePtr = 136316162;
              *(_QWORD *)v39 = "kUSBDesiredChargingCurrent";
              *(_WORD *)&v39[8] = 1024;
              *(_DWORD *)v40 = ioUSB20CameraKitHubService;
              *(_WORD *)&v40[4] = 1024;
              *(_DWORD *)v41 = v15;
              *(_WORD *)&v41[4] = 1024;
              *(_DWORD *)v42 = child;
              *(_WORD *)&v42[4] = 1024;
              *(_DWORD *)v43 = 0;
              _os_log_impl(&dword_2171EA000, v13, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortExtraRequestedPower: failed to get %s, service=%d(%d) child=%d usbExtraRequestedPowerRef=%x, expected for normal condition", (uint8_t *)&valuePtr, 0x24u);
            }

            ioUSB20CameraKitHubService = 0;
          }
          IOObjectRelease(object);
        }
        IOObjectRelease(child);

      }
    }
    self->_ioUSB20CameraKitHubExtraRequestedPower = ioUSB20CameraKitHubService;
    if (-[USBCameraKitHubMonitor overcurrentState:](self, "overcurrentState:", v4)
      && (self->_ioUSB20CameraKitHubPortCurrentAllocation || self->_ioUSB30CameraKitHubPortCurrentAllocation))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v16 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        ioUSB20CameraKitHubPortCurrentAllocation = self->_ioUSB20CameraKitHubPortCurrentAllocation;
        ioUSB20CameraKitHubPortFailedRequestedPower = self->_ioUSB20CameraKitHubPortFailedRequestedPower;
        ioUSB30CameraKitHubPortCurrentAllocation = self->_ioUSB30CameraKitHubPortCurrentAllocation;
        ioUSB30CameraKitHubPortFailedRequestedPower = self->_ioUSB30CameraKitHubPortFailedRequestedPower;
        ioUSB20CameraKitHubExtraRequestedPower = self->_ioUSB20CameraKitHubExtraRequestedPower;
        ioUSBCameraKitHubOverCurrentDetected = self->_ioUSBCameraKitHubOverCurrentDetected;
        valuePtr = 67110400;
        *(_DWORD *)v39 = ioUSB20CameraKitHubPortCurrentAllocation;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = ioUSB30CameraKitHubPortCurrentAllocation;
        *(_WORD *)v40 = 1024;
        *(_DWORD *)&v40[2] = ioUSB20CameraKitHubPortFailedRequestedPower;
        *(_WORD *)v41 = 1024;
        *(_DWORD *)&v41[2] = ioUSB30CameraKitHubPortFailedRequestedPower;
        *(_WORD *)v42 = 1024;
        *(_DWORD *)&v42[2] = ioUSB20CameraKitHubExtraRequestedPower;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = ioUSBCameraKitHubOverCurrentDetected;
        _os_log_impl(&dword_2171EA000, v16, OS_LOG_TYPE_INFO, "_updateSiphoningValuesFromDrivers: ResetOvercurrentSiphoning(), PortCurrentAllocation=%d/%d PortFailedRequestedPower=%d/%d ExtraRequestedPower=%d OverCurrentDetected=%d", (uint8_t *)&valuePtr, 0x26u);
      }

      -[USBCameraKitHubMonitor resetOvercurrentSiphoning:](self, "resetOvercurrentSiphoning:", v4);
    }
    if (self->_ioUSBCameraKitHubOverCurrentDetected)
    {
      *(_QWORD *)&self->_ioUSB20CameraKitHubPortCurrentAllocation = 0x1F400000064;
      if (-[USBCameraKitHubMonitor supportsUSB30CameraKitHub:](self, "supportsUSB30CameraKitHub:", v4))
      {
        self->_ioUSB20CameraKitHubPortFailedRequestedPower = 100;
        v24 = 0x38400000096;
      }
      else
      {
        v24 = 0;
      }
      *(_QWORD *)&self->_ioUSB30CameraKitHubPortCurrentAllocation = v24;
      self->_ioUSB20CameraKitHubExtraRequestedPower = 0;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v25 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v25 = MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSince1970");
      ioUSBCameraKitHubTotalCurrent = self->_ioUSBCameraKitHubTotalCurrent;
      v29 = self->_ioUSB20CameraKitHubPortCurrentAllocation;
      v30 = self->_ioUSB20CameraKitHubPortFailedRequestedPower;
      v31 = self->_ioUSB30CameraKitHubPortCurrentAllocation;
      v32 = self->_ioUSB30CameraKitHubPortFailedRequestedPower;
      v33 = self->_ioUSB20CameraKitHubExtraRequestedPower;
      v34 = self->_ioUSBCameraKitHubOverCurrentDetected;
      valuePtr = 134219776;
      *(_QWORD *)v39 = v35;
      *(_WORD *)&v39[8] = 1024;
      *(_DWORD *)v40 = ioUSBCameraKitHubTotalCurrent;
      *(_WORD *)&v40[4] = 1024;
      *(_DWORD *)v41 = v29;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)v42 = v31;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)v43 = v30;
      *(_WORD *)&v43[4] = 1024;
      v44 = v32;
      v45 = 1024;
      v46 = v33;
      v47 = 1024;
      v48 = v34;
      _os_log_impl(&dword_2171EA000, v25, OS_LOG_TYPE_INFO, "_updateSiphoningValuesFromDrivers: %f TotalCurrent=%d PortCurrentAllocation=%d/%d PortFailedRequestedPower=%d/%d ExtraRequestedPower=%d OverCurrentDetected=%d", (uint8_t *)&valuePtr, 0x36u);

    }
  }

}

- (IONotificationPort)ioUSB20CameraKitHubNotifyPort
{
  return self->_ioUSB20CameraKitHubNotifyPort;
}

- (void)setIoUSB20CameraKitHubNotifyPort:(IONotificationPort *)a3
{
  self->_ioUSB20CameraKitHubNotifyPort = a3;
}

- (unsigned)ioUSB20CameraKitHubNotification
{
  return self->_ioUSB20CameraKitHubNotification;
}

- (void)setIoUSB20CameraKitHubNotification:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubNotification = a3;
}

- (unsigned)ioUSB20CameraKitHubService
{
  return self->_ioUSB20CameraKitHubService;
}

- (void)setIoUSB20CameraKitHubService:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubService = a3;
}

- (unsigned)ioUSB20CameraKitHubMatchIterator
{
  return self->_ioUSB20CameraKitHubMatchIterator;
}

- (void)setIoUSB20CameraKitHubMatchIterator:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubMatchIterator = a3;
}

- (unsigned)ioUSB20CameraKitHubTerminateIterator
{
  return self->_ioUSB20CameraKitHubTerminateIterator;
}

- (void)setIoUSB20CameraKitHubTerminateIterator:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubTerminateIterator = a3;
}

- (unsigned)ioUSB20CameraKitHubCurrentNeeded
{
  return self->_ioUSB20CameraKitHubCurrentNeeded;
}

- (void)setIoUSB20CameraKitHubCurrentNeeded:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubCurrentNeeded = a3;
}

- (unsigned)ioUSB20CameraKitHubPortCurrentAllocation
{
  return self->_ioUSB20CameraKitHubPortCurrentAllocation;
}

- (void)setIoUSB20CameraKitHubPortCurrentAllocation:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortCurrentAllocation = a3;
}

- (unsigned)ioUSB20CameraKitHubPortFailedRequestedPower
{
  return self->_ioUSB20CameraKitHubPortFailedRequestedPower;
}

- (void)setIoUSB20CameraKitHubPortFailedRequestedPower:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortFailedRequestedPower = a3;
}

- (unsigned)ioUSB20CameraKitHubExtraRequestedPower
{
  return self->_ioUSB20CameraKitHubExtraRequestedPower;
}

- (void)setIoUSB20CameraKitHubExtraRequestedPower:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubExtraRequestedPower = a3;
}

- (IONotificationPort)ioUSB20CameraKitHubPortNotifyPort
{
  return self->_ioUSB20CameraKitHubPortNotifyPort;
}

- (void)setIoUSB20CameraKitHubPortNotifyPort:(IONotificationPort *)a3
{
  self->_ioUSB20CameraKitHubPortNotifyPort = a3;
}

- (unsigned)ioUSB20CameraKitHubPortNotification
{
  return self->_ioUSB20CameraKitHubPortNotification;
}

- (void)setIoUSB20CameraKitHubPortNotification:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortNotification = a3;
}

- (unsigned)ioUSB20CameraKitHubPortService
{
  return self->_ioUSB20CameraKitHubPortService;
}

- (void)setIoUSB20CameraKitHubPortService:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortService = a3;
}

- (unsigned)ioUSB20CameraKitHubPortMatchIterator
{
  return self->_ioUSB20CameraKitHubPortMatchIterator;
}

- (void)setIoUSB20CameraKitHubPortMatchIterator:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortMatchIterator = a3;
}

- (unsigned)ioUSB20CameraKitHubPortTerminateIterator
{
  return self->_ioUSB20CameraKitHubPortTerminateIterator;
}

- (void)setIoUSB20CameraKitHubPortTerminateIterator:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortTerminateIterator = a3;
}

- (IONotificationPort)ioUSB30CameraKitHubNotifyPort
{
  return self->_ioUSB30CameraKitHubNotifyPort;
}

- (void)setIoUSB30CameraKitHubNotifyPort:(IONotificationPort *)a3
{
  self->_ioUSB30CameraKitHubNotifyPort = a3;
}

- (unsigned)ioUSB30CameraKitHubNotification
{
  return self->_ioUSB30CameraKitHubNotification;
}

- (void)setIoUSB30CameraKitHubNotification:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubNotification = a3;
}

- (unsigned)ioUSB30CameraKitHubService
{
  return self->_ioUSB30CameraKitHubService;
}

- (void)setIoUSB30CameraKitHubService:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubService = a3;
}

- (unsigned)ioUSB30CameraKitHubMatchIterator
{
  return self->_ioUSB30CameraKitHubMatchIterator;
}

- (void)setIoUSB30CameraKitHubMatchIterator:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubMatchIterator = a3;
}

- (unsigned)ioUSB30CameraKitHubTerminateIterator
{
  return self->_ioUSB30CameraKitHubTerminateIterator;
}

- (void)setIoUSB30CameraKitHubTerminateIterator:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubTerminateIterator = a3;
}

- (unsigned)ioUSB30CameraKitHubCurrentNeeded
{
  return self->_ioUSB30CameraKitHubCurrentNeeded;
}

- (void)setIoUSB30CameraKitHubCurrentNeeded:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubCurrentNeeded = a3;
}

- (unsigned)ioUSB30CameraKitHubPortCurrentAllocation
{
  return self->_ioUSB30CameraKitHubPortCurrentAllocation;
}

- (void)setIoUSB30CameraKitHubPortCurrentAllocation:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortCurrentAllocation = a3;
}

- (unsigned)ioUSB30CameraKitHubPortFailedRequestedPower
{
  return self->_ioUSB30CameraKitHubPortFailedRequestedPower;
}

- (void)setIoUSB30CameraKitHubPortFailedRequestedPower:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortFailedRequestedPower = a3;
}

- (IONotificationPort)ioUSB30CameraKitHubPortNotifyPort
{
  return self->_ioUSB30CameraKitHubPortNotifyPort;
}

- (void)setIoUSB30CameraKitHubPortNotifyPort:(IONotificationPort *)a3
{
  self->_ioUSB30CameraKitHubPortNotifyPort = a3;
}

- (unsigned)ioUSB30CameraKitHubPortNotification
{
  return self->_ioUSB30CameraKitHubPortNotification;
}

- (void)setIoUSB30CameraKitHubPortNotification:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortNotification = a3;
}

- (unsigned)ioUSB30CameraKitHubPortService
{
  return self->_ioUSB30CameraKitHubPortService;
}

- (void)setIoUSB30CameraKitHubPortService:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortService = a3;
}

- (unsigned)ioUSB30CameraKitHubPortMatchIterator
{
  return self->_ioUSB30CameraKitHubPortMatchIterator;
}

- (void)setIoUSB30CameraKitHubPortMatchIterator:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortMatchIterator = a3;
}

- (unsigned)ioUSB30CameraKitHubPortTerminateIterator
{
  return self->_ioUSB30CameraKitHubPortTerminateIterator;
}

- (void)setIoUSB30CameraKitHubPortTerminateIterator:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortTerminateIterator = a3;
}

- (unsigned)ioUSBCameraKitHubTotalCurrent
{
  return self->_ioUSBCameraKitHubTotalCurrent;
}

- (void)setIoUSBCameraKitHubTotalCurrent:(unsigned int)a3
{
  self->_ioUSBCameraKitHubTotalCurrent = a3;
}

- (BOOL)ioUSBCameraKitHubCurrentNeedUpdate
{
  return self->_ioUSBCameraKitHubCurrentNeedUpdate;
}

- (void)setIoUSBCameraKitHubCurrentNeedUpdate:(BOOL)a3
{
  self->_ioUSBCameraKitHubCurrentNeedUpdate = a3;
}

- (BOOL)ioUSBCameraKitHubOverCurrentDetected
{
  return self->_ioUSBCameraKitHubOverCurrentDetected;
}

- (void)setIoUSBCameraKitHubOverCurrentDetected:(BOOL)a3
{
  self->_ioUSBCameraKitHubOverCurrentDetected = a3;
}

- (int64_t)once
{
  return self->_once;
}

- (void)setOnce:(int64_t)a3
{
  self->_once = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initUSBCameraKitHubNotifications:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 112);
  v3 = *(unsigned __int8 *)(a1 + 128);
  v4[0] = 67109376;
  v4[1] = v2;
  v5 = 1024;
  v6 = v3;
  _os_log_debug_impl(&dword_2171EA000, a2, OS_LOG_TYPE_DEBUG, "initUSBCameraKitHubNotifications: _ioUSB20CameraKitHubNotifyPort=%d _ioUSB30CameraKitHubNotifyPort=%d", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_2();
}

@end
