@implementation HMFPowerManager

+ (id)sharedManager
{
  if (qword_1ED0132D0 != -1)
    dispatch_once(&qword_1ED0132D0, &__block_literal_global_24);
  return (id)_MergedGlobals_1;
}

uint64_t __32__HMFPowerManager_sharedManager__block_invoke()
{
  HMFPowerManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMFPowerManager);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_1, "start");
}

- (HMFPowerManager)init
{
  HMFPowerManager *v2;
  HMFPowerManager *v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientQueue;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  void *CFProperty;
  CFTypeID TypeID;
  void *v13;
  id v14;
  char v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HMFPowerManager;
  v2 = -[HMFPowerManager init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMFDispatchQueueName(v2, 0);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v6;

    v3->_batteryState = 0;
    v3->_batteryLevel = -1.0;
    LODWORD(v4) = *MEMORY[0x1E0CBBAA8];
    v8 = IOServiceMatching("IOPMPowerSource");
    MatchingService = IOServiceGetMatchingService((mach_port_t)v4, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("BatteryInstalled"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      TypeID = CFBooleanGetTypeID();
      objc_opt_class();
      if (CFProperty && CFGetTypeID(CFProperty) != TypeID)
      {
        CFRelease(CFProperty);
        CFProperty = 0;
      }
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = CFProperty;
      else
        v13 = 0;
      v14 = v13;

      v15 = objc_msgSend(v14, "BOOLValue");
      IOObjectRelease(v10);
    }
    else
    {
      v15 = 0;
    }
    v3->_hasBattery = v15;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[HMFPowerManager _deregisterForPowerSourceNotifications:](self, "_deregisterForPowerSourceNotifications:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HMFPowerManager;
  -[HMFPowerManager dealloc](&v3, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFPowerManager clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__HMFPowerManager_start__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __24__HMFPowerManager_start__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isRunning");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRunning:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "_registerForPowerSourceNotifications");
  }
  return result;
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFPowerManager clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__HMFPowerManager_stop__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __23__HMFPowerManager_stop__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  +[HMFPowerManager sharedManager](HMFPowerManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setRunning:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_deregisterForPowerSourceNotifications:", 1);
    }
  }
}

- (int64_t)batteryState
{
  os_unfair_lock_s *p_lock;
  int64_t batteryState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  batteryState = self->_batteryState;
  os_unfair_lock_unlock(p_lock);
  return batteryState;
}

- (float)batteryLevel
{
  os_unfair_lock_s *p_lock;
  float batteryLevel;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  batteryLevel = self->_batteryLevel;
  os_unfair_lock_unlock(p_lock);
  return batteryLevel;
}

- (void)updateBatteryState:(unsigned int)a3
{
  void *v5;
  const __CFAllocator *v6;
  void *CFProperty;
  CFTypeID TypeID;
  void *v9;
  id v10;
  void *v11;
  CFTypeID v12;
  void *v13;
  id v14;
  float v15;
  float v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  CFTypeID v21;
  void *v22;
  id v23;
  void *v24;
  CFTypeID v25;
  void *v26;
  id v27;
  int v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)MEMORY[0x1A1AC355C](self, a2);
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("CurrentCapacity"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    TypeID = CFNumberGetTypeID();
    objc_opt_class();
    if (CFProperty && CFGetTypeID(CFProperty) != TypeID)
    {
      CFRelease(CFProperty);
      CFProperty = 0;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = CFProperty;
    else
      v9 = 0;
    v10 = v9;

    v11 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("MaxCapacity"), v6, 0);
    v12 = CFNumberGetTypeID();
    objc_opt_class();
    if (v11 && CFGetTypeID(v11) != v12)
    {
      CFRelease(v11);
      v11 = 0;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v11;
    else
      v13 = 0;
    v14 = v13;

    if (v10 && v14 && objc_msgSend(v14, "integerValue") >= 1)
    {
      v15 = (float)objc_msgSend(v10, "integerValue");
      v16 = v15 / (float)objc_msgSend(v14, "integerValue");
    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v19;
        _os_log_impl(&dword_19B546000, v18, OS_LOG_TYPE_INFO, "%{public}@Unable to determine the current battery level", (uint8_t *)&v33, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v16 = -1.0;
    }
    __updateBatteryLevel(self, v16);
    v20 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("ExternalChargeCapable"), v6, 0);
    v21 = CFBooleanGetTypeID();
    objc_opt_class();
    if (v20 && CFGetTypeID(v20) != v21)
    {
      CFRelease(v20);
      v20 = 0;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v20;
    else
      v22 = 0;
    v23 = v22;

    if (v23)
    {
      if (objc_msgSend(v23, "BOOLValue"))
      {
        v24 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("FullyCharged"), v6, 0);
        v25 = CFBooleanGetTypeID();
        objc_opt_class();
        if (v24 && CFGetTypeID(v24) != v25)
        {
          CFRelease(v24);
          v24 = 0;
        }
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v24;
        else
          v26 = 0;
        v27 = v26;

        v28 = objc_msgSend(v27, "BOOLValue");
        if (v28)
          v29 = 3;
        else
          v29 = 2;
      }
      else
      {
        v29 = 1;
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v32;
        _os_log_impl(&dword_19B546000, v31, OS_LOG_TYPE_INFO, "%{public}@Unable to determine the current battery state", (uint8_t *)&v33, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      v29 = 0;
    }
    __updateBatteryState(self, v29);

    objc_autoreleasePoolPop(v5);
  }
}

- (void)_registerForPowerSourceNotifications
{
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v4;
  __CFRunLoop *Main;
  IONotificationPort *v6;
  const __CFDictionary *v7;
  io_iterator_t notification;

  self->_notificationPort = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  if (-[HMFPowerManager notificationPort](self, "notificationPort"))
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(-[HMFPowerManager notificationPort](self, "notificationPort"));
    if (RunLoopSource)
    {
      v4 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      notification = 0;
      v6 = -[HMFPowerManager notificationPort](self, "notificationPort");
      v7 = IOServiceMatching("IOPMPowerSource");
      if (!IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", v7, (IOServiceMatchingCallback)_matchedBatteryMatchingCallback, self, &notification))_matchedBatteryMatchingCallback(self, notification);
      IOObjectRelease(notification);
    }
    else
    {
      IONotificationPortDestroy(-[HMFPowerManager notificationPort](self, "notificationPort"));
      self->_notificationPort = 0;
    }
  }
}

- (void)_deregisterForPowerSourceNotifications:(BOOL)a3
{
  _BOOL4 v3;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v6;
  __CFRunLoop *Main;

  v3 = a3;
  if (-[HMFPowerManager interestNotification](self, "interestNotification"))
  {
    IOObjectRelease(-[HMFPowerManager interestNotification](self, "interestNotification"));
    self->_interestNotification = 0;
  }
  if (-[HMFPowerManager notificationPort](self, "notificationPort"))
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(-[HMFPowerManager notificationPort](self, "notificationPort"));
    if (RunLoopSource)
    {
      v6 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopRemoveSource(Main, v6, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    }
    IONotificationPortDestroy(-[HMFPowerManager notificationPort](self, "notificationPort"));
    self->_notificationPort = 0;
  }
  if (v3)
  {
    __updateBatteryState(self, 0);
    __updateBatteryLevel(self, -1.0);
  }
}

- (unsigned)interestNotification
{
  return self->_interestNotification;
}

- (BOOL)hasBattery
{
  return self->_hasBattery;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
