@implementation CUTWiFiManager

+ (id)sharedInstance
{
  if (qword_1ECD8FDD0 != -1)
    dispatch_once(&qword_1ECD8FDD0, &unk_1E448FFB8);
  return (id)qword_1ECD8FDC0;
}

- (void)_threadedMain
{
  NSRunLoop *v3;
  NSRunLoop *wifiRunLoop;
  __CFRunLoop *Current;
  void *v6;
  CFRunLoopSourceContext context;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v3 = (NSRunLoop *)objc_claimAutoreleasedReturnValue();
  wifiRunLoop = self->_wifiRunLoop;
  self->_wifiRunLoop = v3;

  memset(&context, 0, sizeof(context));
  self->_runLoopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &context);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  while (1)
  {
    v6 = (void *)MEMORY[0x1A1B01454]();
    CFRunLoopRun();
    objc_autoreleasePoolPop(v6);
  }
}

- (void)_performBackgroundInit
{
  NSObject *v3;
  NSObject *v4;
  const char *wifiManager;
  void *wifiDevice;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  +[CUTLog network](CUTLog, "network");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0BC3000, v3, OS_LOG_TYPE_DEFAULT, "Creating wifi manager", buf, 2u);
  }

  -[CUTWiFiManager _setupWifiNotifications](self, "_setupWifiNotifications");
  +[CUTLog network](CUTLog, "network");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    wifiManager = (const char *)self->_wifiManager;
    wifiDevice = self->_wifiDevice;
    *(_DWORD *)buf = 138543619;
    v12 = wifiManager;
    v13 = 2113;
    v14 = wifiDevice;
    _os_log_impl(&dword_1A0BC3000, v4, OS_LOG_TYPE_DEFAULT, " => Done: %{public}@   (Current device: %{private}@)", buf, 0x16u);
  }

  -[CUTWiFiManager _createDynamicStore](self, "_createDynamicStore");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  +[CUTLog network](CUTLog, "network");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CUTWiFiManager _performBackgroundInit]";
    _os_log_impl(&dword_1A0BC3000, v7, OS_LOG_TYPE_DEFAULT, "%s Running network block sync", buf, 0xCu);
  }

  -[CUTWiFiManager _updateIsWiFiAssociatedAsync:](self, "_updateIsWiFiAssociatedAsync:", 0);
  +[CUTLog network](CUTLog, "network");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0BC3000, v8, OS_LOG_TYPE_DEFAULT, " => Done running network block", buf, 2u);
  }

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1A0BCC518;
  handler[3] = &unk_1E4490510;
  handler[4] = self;
  notify_register_dispatch("com.apple.wifi.linkdidchange", &self->_linkToken, v9, handler);

}

- (CUTWiFiManager)init
{
  CUTWiFiManager *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  dispatch_queue_t v5;
  OS_dispatch_queue *incomingCallbacksQueue;
  uint64_t v7;
  NSThread *wifiThread;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUTWiFiManager;
  v2 = -[CUTWiFiManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = dispatch_queue_create("com.apple.cutwifimanager.callbacks", 0);
    incomingCallbacksQueue = v2->_incomingCallbacksQueue;
    v2->_incomingCallbacksQueue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", v2, sel__threadedMain, 0);
    wifiThread = v2->_wifiThread;
    v2->_wifiThread = (NSThread *)v7;

    -[NSThread setName:](v2->_wifiThread, "setName:", CFSTR("CommonUtilities-WiFi-Thread"));
    -[NSThread start](v2->_wifiThread, "start");
    -[NSRecursiveLock lock](v2->_lock, "lock");
    v2->_wifiManager = (void *)WiFiManagerClientCreate();
    -[CUTWiFiManager _updateInitialWiFiState](v2, "_updateInitialWiFiState");
    -[NSRecursiveLock unlock](v2->_lock, "unlock");
    -[CUTWiFiManager performSelector:onThread:withObject:waitUntilDone:](v2, "performSelector:onThread:withObject:waitUntilDone:", sel__performBackgroundInit, v2->_wifiThread, 0, 0);
  }
  return v2;
}

- (void)dealloc
{
  void *dynamicStore;
  void *wifiDevice;
  void *wifiManager;
  __CFRunLoopSource *runLoopSource;
  objc_super v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSMutableSet removeAllObjects](self->_wiFiAutoAssociationTokens, "removeAllObjects");
  -[CUTWiFiManager _adjustWiFiAutoAssociation](self, "_adjustWiFiAutoAssociation");
  -[CUTWiFiManager _handlePotentialDeviceChange:](self, "_handlePotentialDeviceChange:", 0);
  dynamicStore = self->_dynamicStore;
  if (dynamicStore)
    CFRelease(dynamicStore);
  wifiDevice = self->_wifiDevice;
  if (wifiDevice)
    CFRelease(wifiDevice);
  wifiManager = self->_wifiManager;
  if (wifiManager)
    CFRelease(wifiManager);
  notify_cancel(self->_linkToken);
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceInvalidate(runLoopSource);
    CFRelease(self->_runLoopSource);
  }
  -[NSThread cancel](self->_wifiThread, "cancel");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v7.receiver = self;
  v7.super_class = (Class)CUTWiFiManager;
  -[CUTWiFiManager dealloc](&v7, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  NSHashTable *delegateMap;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!-[NSHashTable containsObject:](self->_delegateMap, "containsObject:", v7))
  {
    delegateMap = self->_delegateMap;
    if (!delegateMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v6 = self->_delegateMap;
      self->_delegateMap = v5;

      delegateMap = self->_delegateMap;
    }
    -[NSHashTable addObject:](delegateMap, "addObject:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)removeDelegate:(id)a3
{
  NSRecursiveLock *lock;
  id v5;
  NSHashTable *delegateMap;

  if (a3)
  {
    lock = self->_lock;
    v5 = a3;
    -[NSRecursiveLock lock](lock, "lock");
    -[NSHashTable removeObject:](self->_delegateMap, "removeObject:", v5);

    if (!-[NSHashTable count](self->_delegateMap, "count"))
    {
      delegateMap = self->_delegateMap;
      self->_delegateMap = 0;

    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (void)addWoWClient:(id)a3
{
  NSUInteger v4;
  NSHashTable *wowClients;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v8 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v4 = -[NSHashTable count](self->_wowClients, "count");
  if (!-[NSHashTable containsObject:](self->_wowClients, "containsObject:", v8))
  {
    wowClients = self->_wowClients;
    if (!wowClients)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_wowClients;
      self->_wowClients = v6;

      wowClients = self->_wowClients;
    }
    -[NSHashTable addObject:](wowClients, "addObject:", v8);
    if (!v4)
      -[CUTWiFiManager _adjustWoWState](self, "_adjustWoWState");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)removeWoWClient:(id)a3
{
  NSRecursiveLock *lock;
  id v5;
  NSUInteger v6;
  NSHashTable *wowClients;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  v6 = -[NSHashTable count](self->_wowClients, "count");
  -[NSHashTable removeObject:](self->_wowClients, "removeObject:", v5);

  if (!-[NSHashTable count](self->_wowClients, "count"))
  {
    wowClients = self->_wowClients;
    self->_wowClients = 0;

    if (v6)
      -[CUTWiFiManager _adjustWoWState](self, "_adjustWoWState");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)hasWoWClient:(id)a3
{
  NSRecursiveLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  LOBYTE(lock) = -[NSHashTable containsObject:](self->_wowClients, "containsObject:", v5);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (char)lock;
}

- (void)_adjustWoWState
{
  if (self->_wifiManager)
  {
    -[NSHashTable count](self->_wowClients, "count");
    WiFiManagerClientSetWoWState();
  }
}

- (void)_setupWifiNotifications
{
  __CFRunLoop *Current;
  NSObject *v4;

  if (self->_wifiManager)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterNotificationCallback();
    Current = CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop();
    CFRunLoopWakeUp(Current);
    -[CUTWiFiManager _updateInitialWiFiState](self, "_updateInitialWiFiState");
  }
  else
  {
    +[CUTLog network](CUTLog, "network");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_1A0BD24AC();

  }
}

- (void)_updateInitialWiFiState
{
  NSObject *v3;
  _QWORD v4[5];

  if (self->_wifiManager)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_1A0BCCBA8;
    v4[3] = &unk_1E4490538;
    v4[4] = self;
    -[CUTWiFiManager _performDeviceBlock:useCache:](self, "_performDeviceBlock:useCache:", v4, 0);
    -[CUTWiFiManager _adjustWoWState](self, "_adjustWoWState");
    -[CUTWiFiManager _adjustWiFiAutoAssociationLocked](self, "_adjustWiFiAutoAssociationLocked");
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
  else
  {
    +[CUTLog network](CUTLog, "network");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      sub_1A0BD24AC();

  }
}

- (void)_createDynamicStore
{
  void *v3;
  const __CFAllocator *v4;
  void *dynamicStore;
  NSObject *v6;
  const CFArrayCallBacks *v7;
  __CFArray *Mutable;
  __CFArray *v9;
  const __CFString *v10;
  CFStringRef NetworkGlobalEntity;
  CFStringRef NetworkInterfaceEntity;
  SCDynamicStoreContext context;

  +[CUTWeakReference weakRefWithObject:](CUTWeakReference, "weakRefWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  context.version = 0;
  context.info = v3;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
  context.copyDescription = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  dynamicStore = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.cutwifimanager"), (SCDynamicStoreCallBack)sub_1A0BCCD5C, &context);
  self->_dynamicStore = dynamicStore;
  if (!dynamicStore)
  {
    +[CUTLog network](CUTLog, "network");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_1A0BD2510();

    dynamicStore = self->_dynamicStore;
  }
  SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)dynamicStore, (dispatch_queue_t)self->_incomingCallbacksQueue);
  v7 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x1E0C9B378]);
  v9 = CFArrayCreateMutable(v4, 0, v7);
  v10 = (const __CFString *)*MEMORY[0x1E0CE8B30];
  NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(v4, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
  CFArrayAppendValue(Mutable, NetworkGlobalEntity);
  CFRelease(NetworkGlobalEntity);
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v4, v10, (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B60]);
  CFArrayAppendValue(v9, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)self->_dynamicStore, Mutable, v9);
  CFRelease(Mutable);
  CFRelease(v9);

}

- (BOOL)isHostingWiFiHotSpot
{
  BOOL isHostingHotSpot;

  if (!-[CUTWiFiManager isWiFiEnabled](self, "isWiFiEnabled"))
    return 0;
  -[NSRecursiveLock lock](self->_lock, "lock");
  isHostingHotSpot = self->_isHostingHotSpot;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isHostingHotSpot;
}

- (BOOL)willTryToAutoAssociateWiFiNetwork
{
  _BOOL4 v3;
  int AskToJoinState;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;

  v3 = -[CUTWiFiManager isWiFiEnabled](self, "isWiFiEnabled");
  if (v3)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    if (!self->_wifiManager
      || (AskToJoinState = WiFiManagerClientGetAskToJoinState(),
          (v5 = (const __CFArray *)WiFiManagerClientCopyEnabledNetworks()) == 0))
    {
      -[NSRecursiveLock unlock](self->_lock, "unlock");
LABEL_7:
      LOBYTE(v3) = 0;
      return v3;
    }
    v6 = v5;
    Count = CFArrayGetCount(v5);
    CFRelease(v6);
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    LOBYTE(v3) = AskToJoinState != 0;
    if (!Count)
      goto LABEL_7;
  }
  return v3;
}

- (BOOL)willTryToSearchForWiFiNetwork
{
  BOOL v3;

  if (!-[CUTWiFiManager isWiFiEnabled](self, "isWiFiEnabled"))
    return 0;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_wifiManager)
    v3 = WiFiManagerClientGetAskToJoinState() != 0;
  else
    v3 = 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSNumber)wiFiSignalStrength
{
  void *v3;
  void *v4;
  const void *v5;
  const void *v6;
  void *v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_wifiManager)
  {
    v3 = (void *)WiFiManagerClientCopyDevices();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "count") && (v5 = (const void *)objc_msgSend(v4, "objectAtIndex:", 0)) != 0)
    {
      v6 = v5;
      CFRetain(v5);
      v7 = (void *)WiFiDeviceClientCopyProperty();
      CFRelease(v6);
    }
    else
    {
      v7 = 0;
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");

  }
  else
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSNumber)wiFiScaledRSSI
{
  void *v3;
  void *v4;
  const void *v5;
  const void *v6;
  void *v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_wifiManager)
  {
    v3 = (void *)WiFiManagerClientCopyDevices();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "count") && (v5 = (const void *)objc_msgSend(v4, "objectAtIndex:", 0)) != 0)
    {
      v6 = v5;
      CFRetain(v5);
      v7 = (void *)WiFiDeviceClientCopyProperty();
      CFRelease(v6);
    }
    else
    {
      v7 = 0;
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");

  }
  else
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSNumber)wiFiScaledRate
{
  void *v3;
  void *v4;
  const void *v5;
  const void *v6;
  void *v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_wifiManager)
  {
    v3 = (void *)WiFiManagerClientCopyDevices();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "count") && (v5 = (const void *)objc_msgSend(v4, "objectAtIndex:", 0)) != 0)
    {
      v6 = v5;
      CFRetain(v5);
      v7 = (void *)WiFiDeviceClientCopyProperty();
      CFRelease(v6);
    }
    else
    {
      v7 = 0;
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");

  }
  else
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (BOOL)isWiFiAssociated
{
  void *currentNetwork;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  currentNetwork = self->_currentNetwork;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  +[CUTLog network](CUTLog, "network");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (currentNetwork)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A0BC3000, v4, OS_LOG_TYPE_DEFAULT, "is WiFi associated? %@", (uint8_t *)&v7, 0xCu);
  }

  return currentNetwork != 0;
}

- (void)_updateIsWiFiAssociatedAsync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A0BCD4A4;
  v6[3] = &unk_1E4490588;
  v6[4] = self;
  v5 = (void *)MEMORY[0x1A1B015EC](v6, a2);
  -[CUTWiFiManager _performCurrentNetworkBlock:withDevice:async:](self, "_performCurrentNetworkBlock:withDevice:async:", v5, 0, v3);

}

- (void)_updateIsWiFiEnabled
{
  int Power;
  void *v4;
  int v5;
  _BOOL4 v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v9[16];

  *(_WORD *)&self->_isHostingHotSpot = 0;
  if (self->_wifiManager)
  {
    Power = WiFiManagerClientGetPower();
    v4 = (void *)WiFiManagerClientCopyProperty();
    v5 = objc_msgSend(v4, "BOOLValue");
    if (v4)
      CFRelease(v4);
    if (Power)
      v6 = v5;
    else
      v6 = 0;
    self->_isWifiEnabled = v6;
    v7 = v6 && WiFiManagerClientGetMISState() != 0;
    self->_isHostingHotSpot = v7;
    +[CUTLog network](CUTLog, "network");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A0BC3000, v8, OS_LOG_TYPE_DEFAULT, "Running network block async", v9, 2u);
    }

    -[CUTWiFiManager _updateIsWiFiAssociatedAsync:](self, "_updateIsWiFiAssociatedAsync:", 1);
  }
}

- (BOOL)isWiFiEnabled
{
  BOOL isWifiEnabled;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isWifiEnabled = self->_isWifiEnabled;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isWifiEnabled;
}

- (void)_performDeviceBlock:(id)a3 useCache:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  void (**v7)(id, void *);
  void *wifiDevice;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v4 = a4;
  v6 = (void (**)(id, void *))a3;
  if (!v6)
    goto LABEL_16;
  v7 = v6;
  v12 = (void (**)(id, void *))objc_msgSend(v6, "copy");

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (v4)
  {
    wifiDevice = self->_wifiDevice;
    if (wifiDevice)
      CFRetain(self->_wifiDevice);
    goto LABEL_13;
  }
  if (self->_wifiManager)
  {
    v9 = (void *)WiFiManagerClientCopyDevices();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "count"))
    {
      v11 = (void *)objc_msgSend(v10, "objectAtIndex:", 0);
      wifiDevice = v11;
      if (v11)
        CFRetain(v11);
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
  }
  wifiDevice = 0;
LABEL_12:

LABEL_13:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v12[2](v12, wifiDevice);
  if (wifiDevice)
    CFRelease(wifiDevice);
  v6 = v12;
LABEL_16:

}

- (void)_performDeviceBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1A1B01454]();
  -[CUTWiFiManager _performDeviceBlock:useCache:](self, "_performDeviceBlock:useCache:", v5, 1);
  objc_autoreleasePoolPop(v4);

}

- (void)_performCurrentNetworkBlock:(id)a3 withDevice:(__WiFiDeviceClient *)a4 async:(BOOL)a5
{
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1A0BCDB3C;
    v12[3] = &unk_1E44905D8;
    v12[4] = self;
    v14 = a5;
    v13 = v8;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1B015EC](v12);
    if (a4)
    {
      v11 = (void *)MEMORY[0x1A1B01454]();
      ((void (**)(_QWORD, __WiFiDeviceClient *))v10)[2](v10, a4);
      objc_autoreleasePoolPop(v11);
    }
    else
    {
      -[CUTWiFiManager _performDeviceBlock:](self, "_performDeviceBlock:", v10);
    }

  }
}

- (void)_performCurrentNetworkBlock:(id)a3 withDevice:(__WiFiDeviceClient *)a4
{
  -[CUTWiFiManager _performCurrentNetworkBlock:withDevice:async:](self, "_performCurrentNetworkBlock:withDevice:async:", a3, a4, 0);
}

- (void)_performCurrentNetworkBlock:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__performCurrentNetworkBlock_withDevice_);
}

- (id)_ssidFromNetwork:(__WiFiNetwork *)a3
{
  void *SSID;

  if (a3)
    SSID = (void *)WiFiNetworkGetSSID();
  else
    SSID = 0;
  return SSID;
}

- (void)_handleDevicePowerCallback
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[CUTWiFiManager _updateIsWiFiEnabled](self, "_updateIsWiFiEnabled");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_handleDeviceAttachedCallback
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1A0BCDF74;
  v2[3] = &unk_1E4490538;
  v2[4] = self;
  -[CUTWiFiManager _performDeviceBlock:useCache:](self, "_performDeviceBlock:useCache:", v2, 0);
}

- (void)_handleHostAPStateChangedCallback
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[CUTWiFiManager _updateIsWiFiEnabled](self, "_updateIsWiFiEnabled");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_handlePotentialDeviceChange:(__WiFiDeviceClient *)a3
{
  __WiFiDeviceClient *wifiDevice;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  _QWORD block[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  wifiDevice = (__WiFiDeviceClient *)self->_wifiDevice;
  if (wifiDevice == a3)
  {
    self->_isWakeOnWiFiSupported = 1;
  }
  else
  {
    if (wifiDevice)
    {
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      WiFiDeviceClientRegisterExtendedLinkCallback();
      WiFiDeviceClientRegisterHostApStateChangedCallback();
      CFRelease(self->_wifiDevice);
      self->_wifiDevice = 0;
    }
    if (a3)
    {
      self->_wifiDevice = a3;
      CFRetain(a3);
      self->_isWakeOnWiFiSupported = WiFiManagerClientGetWoWCapability() != 0;
      -[CUTWiFiManager _updateIsWiFiEnabled](self, "_updateIsWiFiEnabled");
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      WiFiDeviceClientRegisterExtendedLinkCallback();
      WiFiDeviceClientRegisterPowerCallback();
      WiFiDeviceClientRegisterHostApStateChangedCallback();
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v6 = self->_delegateMap;
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        v10 = MEMORY[0x1E0C809B0];
        v11 = MEMORY[0x1E0C80D38];
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v6);
            v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            block[0] = v10;
            block[1] = 3221225472;
            block[2] = sub_1A0BCE31C;
            block[3] = &unk_1E44901E0;
            block[4] = v13;
            block[5] = self;
            dispatch_async(v11, block);
          }
          v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

    }
    else
    {
      self->_isWifiEnabled = 0;
      +[CUTLog network](CUTLog, "network");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1A0BC3000, v14, OS_LOG_TYPE_DEFAULT, "Running network block async", v15, 2u);
      }

      -[CUTWiFiManager _updateIsWiFiAssociatedAsync:](self, "_updateIsWiFiAssociatedAsync:", 1);
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setCurrentNetwork:(void *)a3
{
  void *currentNetwork;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  currentNetwork = self->_currentNetwork;
  if (currentNetwork != a3)
  {
    if (currentNetwork)
      CFRelease(currentNetwork);
    self->_currentNetwork = a3;
    if (a3)
      CFRetain(a3);
    +[CUTLog network](CUTLog, "network");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_currentNetwork;
      v8 = 134217984;
      v9 = v7;
      _os_log_impl(&dword_1A0BC3000, v6, OS_LOG_TYPE_DEFAULT, "_currentNetwork is %p", (uint8_t *)&v8, 0xCu);
    }

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_setCurrentNetwork:(__WiFiNetwork *)a3
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[CUTWiFiManager setCurrentNetwork:](self, "setCurrentNetwork:", a3);
  -[CUTWiFiManager _updateIsWiFiEnabled](self, "_updateIsWiFiEnabled");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_performPowerReading
{
  NSUInteger v3;
  _QWORD v4[5];

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = -[NSHashTable count](self->_delegateMap, "count");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_1A0BCE500;
    v4[3] = &unk_1E4490600;
    v4[4] = self;
    -[CUTWiFiManager currentWiFiNetworkPowerUsageWithCompletion:](self, "currentWiFiNetworkPowerUsageWithCompletion:", v4);
  }
}

- (double)_wifiMeasurementErrorForInterval:(double)a3
{
  return ((a3 + -1.0) * 1.5 + 280.0) / (a3 * 15.0);
}

- (void)currentWiFiNetworkPowerUsageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1A0BCE770;
    v6[3] = &unk_1E4490650;
    v6[4] = self;
    v7 = v4;
    -[CUTWiFiManager _performDeviceBlock:](self, "_performDeviceBlock:", v6);

  }
}

- (NSString)currentSSID
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1A0BCECCC;
  v9 = sub_1A0BCECDC;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A0BCECE4;
  v4[3] = &unk_1E4490678;
  v4[4] = self;
  v4[5] = &v5;
  -[CUTWiFiManager _performCurrentNetworkBlock:](self, "_performCurrentNetworkBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (BOOL)_isPrimaryCellular
{
  BOOL isPrimaryCellularCached;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isPrimaryCellularCached = self->_isPrimaryCellularCached;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isPrimaryCellularCached;
}

- (BOOL)isWiFiCaptive
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A0BCEDF4;
  v4[3] = &unk_1E44906A0;
  v4[4] = self;
  v4[5] = &v5;
  -[CUTWiFiManager _performCurrentNetworkBlock:](self, "_performCurrentNetworkBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_adjustWiFiAutoAssociationLocked
{
  _BOOL4 v3;
  int v4;
  NSObject *v5;
  const char *v6;
  NSMutableSet *wiFiAutoAssociationTokens;
  int v8;
  const char *v9;
  __int16 v10;
  NSMutableSet *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_wifiManager)
  {
    v3 = -[CUTWiFiManager autoAssociateWiFi](self, "autoAssociateWiFi");
    if (v3)
    {
      if (-[CUTWiFiManager autoAssociateWiFiAsForegroundClient](self, "autoAssociateWiFiAsForegroundClient"))
        v4 = 2;
      else
        v4 = 1;
    }
    else
    {
      v4 = 0;
    }
    if (WiFiManagerClientGetType() != v4)
    {
      +[CUTLog network](CUTLog, "network");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = "disabling";
        wiFiAutoAssociationTokens = self->_wiFiAutoAssociationTokens;
        if (v3)
          v6 = "enabling";
        v8 = 136446467;
        v9 = v6;
        v10 = 2113;
        v11 = wiFiAutoAssociationTokens;
        _os_log_impl(&dword_1A0BC3000, v5, OS_LOG_TYPE_DEFAULT, "Interface manager: %{public}s WiFi association on wake (client tokens: %{private}@)", (uint8_t *)&v8, 0x16u);
      }

      WiFiManagerClientSetType();
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
  else
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (void)_adjustWiFiAutoAssociation
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[CUTWiFiManager _adjustWiFiAutoAssociationLocked](self, "_adjustWiFiAutoAssociationLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)autoAssociateWiFi
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = -[NSMutableSet count](self->_wiFiAutoAssociationTokens, "count") != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)hasWiFiAutoAssociationClientToken:(id)a3
{
  NSRecursiveLock *lock;
  id v5;

  if (!a3)
    return 0;
  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  LOBYTE(lock) = -[NSMutableSet containsObject:](self->_wiFiAutoAssociationTokens, "containsObject:", v5);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (char)lock;
}

- (void)addWiFiAutoAssociationClientToken:(id)a3
{
  id v4;
  NSMutableSet *wiFiAutoAssociationTokens;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSObject *v8;
  NSMutableSet *v9;
  int v10;
  id v11;
  __int16 v12;
  NSMutableSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    wiFiAutoAssociationTokens = self->_wiFiAutoAssociationTokens;
    if (!wiFiAutoAssociationTokens)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = self->_wiFiAutoAssociationTokens;
      self->_wiFiAutoAssociationTokens = v6;

      wiFiAutoAssociationTokens = self->_wiFiAutoAssociationTokens;
    }
    -[NSMutableSet addObject:](wiFiAutoAssociationTokens, "addObject:", v4);
    +[CUTLog network](CUTLog, "network");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_wiFiAutoAssociationTokens;
      v10 = 138478083;
      v11 = v4;
      v12 = 2113;
      v13 = v9;
      _os_log_impl(&dword_1A0BC3000, v8, OS_LOG_TYPE_DEFAULT, "Client token: %{private}@ was added to WiFi association clients (%{private}@)", (uint8_t *)&v10, 0x16u);
    }

    -[CUTWiFiManager _adjustWiFiAutoAssociationLocked](self, "_adjustWiFiAutoAssociationLocked");
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

}

- (void)removeWiFiAutoAssociationClientToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *wiFiAutoAssociationTokens;
  int v7;
  id v8;
  __int16 v9;
  NSMutableSet *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    +[CUTLog network](CUTLog, "network");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      wiFiAutoAssociationTokens = self->_wiFiAutoAssociationTokens;
      v7 = 138478083;
      v8 = v4;
      v9 = 2113;
      v10 = wiFiAutoAssociationTokens;
      _os_log_impl(&dword_1A0BC3000, v5, OS_LOG_TYPE_DEFAULT, "Client token: %{private}@ being removed from WiFi association clients (%{private}@)", (uint8_t *)&v7, 0x16u);
    }

    -[NSMutableSet removeObject:](self->_wiFiAutoAssociationTokens, "removeObject:", v4);
    -[CUTWiFiManager _adjustWiFiAutoAssociationLocked](self, "_adjustWiFiAutoAssociationLocked");
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

}

- (void)showNetworkOptions
{
  NSObject *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_wifiManager)
  {
    WiFiManagerClientSetAssociationMode();
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
  else
  {
    +[CUTLog network](CUTLog, "network");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      sub_1A0BD253C();

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (BOOL)isWoWEnabled
{
  BOOL isWakeOnWiFiEnabled;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isWakeOnWiFiEnabled = self->_isWakeOnWiFiEnabled;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isWakeOnWiFiEnabled;
}

- (BOOL)autoAssociateWiFiAsForegroundClient
{
  return self->_shouldAutoAssociateAsForeground;
}

- (void)setAutoAssociateWiFiAsForegroundClient:(BOOL)a3
{
  self->_shouldAutoAssociateAsForeground = a3;
}

- (BOOL)isWoWSupported
{
  return self->_isWakeOnWiFiSupported;
}

- (NSMutableSet)wiFiAutoAssociationTokens
{
  return self->_wiFiAutoAssociationTokens;
}

- (void)setWiFiAutoAssociationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_wiFiAutoAssociationTokens, a3);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSHashTable)delegateMap
{
  return self->_delegateMap;
}

- (void)setDelegateMap:(id)a3
{
  objc_storeStrong((id *)&self->_delegateMap, a3);
}

- (NSHashTable)wowClients
{
  return self->_wowClients;
}

- (void)setWowClients:(id)a3
{
  objc_storeStrong((id *)&self->_wowClients, a3);
}

- (void)currentNetwork
{
  return self->_currentNetwork;
}

- (int)linkToken
{
  return self->_linkToken;
}

- (void)setLinkToken:(int)a3
{
  self->_linkToken = a3;
}

- (void)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(void *)a3
{
  self->_wifiManager = a3;
}

- (void)wifiDevice
{
  return self->_wifiDevice;
}

- (void)setWifiDevice:(void *)a3
{
  self->_wifiDevice = a3;
}

- (void)dynamicStore
{
  return self->_dynamicStore;
}

- (void)setDynamicStore:(void *)a3
{
  self->_dynamicStore = a3;
}

- (NSDictionary)lastWiFiPowerInfo
{
  return self->_lastWiFiPowerInfo;
}

- (void)setLastWiFiPowerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSThread)wifiThread
{
  return self->_wifiThread;
}

- (void)setWifiThread:(id)a3
{
  objc_storeStrong((id *)&self->_wifiThread, a3);
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (NSRunLoop)wifiRunLoop
{
  return self->_wifiRunLoop;
}

- (void)setWifiRunLoop:(id)a3
{
  objc_storeStrong((id *)&self->_wifiRunLoop, a3);
}

- (OS_dispatch_queue)incomingCallbacksQueue
{
  return self->_incomingCallbacksQueue;
}

- (void)setIncomingCallbacksQueue:(id)a3
{
  objc_storeStrong((id *)&self->_incomingCallbacksQueue, a3);
}

- (BOOL)isPrimaryCellularCached
{
  return self->_isPrimaryCellularCached;
}

- (void)setIsPrimaryCellularCached:(BOOL)a3
{
  self->_isPrimaryCellularCached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingCallbacksQueue, 0);
  objc_storeStrong((id *)&self->_wifiRunLoop, 0);
  objc_storeStrong((id *)&self->_wifiThread, 0);
  objc_storeStrong((id *)&self->_lastWiFiPowerInfo, 0);
  objc_storeStrong((id *)&self->_wowClients, 0);
  objc_storeStrong((id *)&self->_delegateMap, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_wiFiAutoAssociationTokens, 0);
}

@end
