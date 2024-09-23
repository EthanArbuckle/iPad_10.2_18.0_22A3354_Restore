@implementation EAAccessoryManager

uint64_t __54__EAAccessoryManager__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkForConnectedAccessories:backgroundTaskIdentifier:", 0, 0);
}

+ (EAAccessoryManager)sharedAccessoryManager
{
  if (sharedAccessoryManager_onceToken != -1)
    dispatch_once(&sharedAccessoryManager_onceToken, &__block_literal_global_131);
  if (__iapdCrashed == 1)
  {
    IAPAppRegisterClient();
    __iapdCrashed = 0;
  }
  return (EAAccessoryManager *)sharedAccessoryManager_sharedInstance;
}

- (void)setAreLocationAccessoriesEnabled:(BOOL)a3
{
  _BOOL4 v3;

  if (__areLocationAccessoriesEnabled != a3)
  {
    v3 = a3;
    NSLog(CFSTR("[#Location] areLocationAccessoriesEnabled %d -> %d"), a2, __areLocationAccessoriesEnabled, a3);
    __areLocationAccessoriesEnabled = v3;
    if (v3)
    {
      IAPLocationActivate();
      -[EAAccessoryManager startLocationForConnectedAccessories](self, "startLocationForConnectedAccessories");
    }
    else
    {
      IAPLocationDeactivate();
      -[EAAccessoryManager stopLocationForConnectedAccessories](self, "stopLocationForConnectedAccessories");
    }
  }
}

id __44__EAAccessoryManager_sharedAccessoryManager__block_invoke()
{
  BOOL v0;
  void *v1;
  void *v2;
  __SecTask *v3;
  __SecTask *v4;
  void *v5;
  CFTypeID v6;
  int Value;
  CFErrorRef v8;
  id result;
  CFErrorRef error;

  if (NSClassFromString(CFSTR("UIApplication")))
    v0 = uikitFramework == 0;
  else
    v0 = 0;
  if (v0)
    uikitFramework = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 16);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKey:", CFSTR("XPC_SERVICE_NAME")), "hasPrefix:", CFSTR("UIKitApplication")))__capabilities |= 0x8000u;
  v1 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (!v1 || objc_msgSend(v1, "isEqualToString:", &stru_1E6B07EE0))
    __capabilities |= 0x200u;
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "objectForInfoDictionaryKey:", CFSTR("UIBackgroundModes"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v2, "containsObject:", CFSTR("external-accessory")))
  {
    __capabilities |= 0x10u;
  }
  if (_CFExecutableLinkedOnOrAfter())
    __capabilities |= 0x20u;
  v3 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v3)
  {
    v4 = v3;
    error = 0;
    v5 = (void *)SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.private.externalaccessory.showallaccessories"), &error);
    CFRelease(v4);
    if (v5)
    {
      v6 = CFGetTypeID(v5);
      if (v6 == CFBooleanGetTypeID())
      {
        Value = CFBooleanGetValue((CFBooleanRef)v5);
        CFRelease(v5);
        if (Value)
          __supportsEAShowAllAccessoriesEntitlement = 1;
        goto LABEL_27;
      }
      v8 = (CFErrorRef)v5;
    }
    else
    {
      if (!error)
        goto LABEL_27;
      NSLog(CFSTR("[#ExternalAccessory] SecTaskCopyValueForEntitlement failed for \"%@\", error:%@"), CFSTR("com.apple.private.externalaccessory.showallaccessories"), error);
      v8 = error;
      if (!error)
        goto LABEL_27;
    }
    CFRelease(v8);
  }
LABEL_27:
  IAPAppRegisterClient();
  __iapdStartedSinceLastAppExecution = IAPDHasLaunched();
  __iap2dStartedSinceLastAppExecution = IAP2DHasLaunched();
  result = -[EAAccessoryManager _initFromSingletonCreationMethod]([EAAccessoryManager alloc], "_initFromSingletonCreationMethod");
  sharedAccessoryManager_sharedInstance = (uint64_t)result;
  __iapdCrashed = 0;
  return result;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  NSLog(CFSTR("[#ExternalAccessory] %s: %@"), a2, "-[EAAccessoryManager _applicationWillEnterForeground:]", a3);
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d __capabilities = 0x%X, EAAccessoryCapabilitiesKeepSessionsOpenWhenSuspended = 0x%X, EAAccessoryCapabilitiesKeepSessionsOpenInBackground = 0x%X"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _applicationWillEnterForeground:]", 1362, __capabilities, 16, 32);
  if ((__capabilities & 0x30) == 0
    && +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
  {
    NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d reRegisterForNotifications"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _applicationWillEnterForeground:]", 1379);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__EAAccessoryManager__applicationWillEnterForeground___block_invoke;
  block[3] = &unk_1E6B077D8;
  block[4] = self;
  dispatch_async(global_queue, block);
}

- (id)_initFromSingletonCreationMethod
{
  EAAccessoryManager *v3;
  NSString *v4;
  char v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  NSRecursiveLock *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  EAAccessoryInternal *v19;
  id v20;
  NSMutableArray *connectedAccessories;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  IAPRegisterEAAuthGetters();
  v29.receiver = self;
  v29.super_class = (Class)EAAccessoryManager;
  v3 = -[EAAccessoryManager init](&v29, sel_init);
  if (v3)
  {
    signal(13, (void (__cdecl *)(int))1);
    v4 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    v3->_managerInstanceUUID = v4;
    NSLog(CFSTR("[#ExternalAccessory] %s initializing (%p) with uuid %@"), "-[EAAccessoryManager _initFromSingletonCreationMethod]", v3, v4);
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isMacCatalystApp") & 1) == 0)
    {
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isiOSAppOnMac");
      if (uikitFramework)
      {
        if ((v5 & 1) == 0)
        {
          NSLog(CFSTR("[#ExternalAccessory] %s isRunningOnMac"), "-[EAAccessoryManager _initFromSingletonCreationMethod]");
          v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          if (uikitFramework
            && (v7 = (uint64_t *)dlsym((void *)uikitFramework, "UIApplicationDidEnterBackgroundNotification")) != 0)
          {
            v8 = *v7;
          }
          else
          {
            v8 = 0;
          }
          objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__applicationDidEnterBackground_, v8, 0);
          if (uikitFramework
            && (v9 = (uint64_t *)dlsym((void *)uikitFramework, "UIApplicationWillEnterForegroundNotification")) != 0)
          {
            v10 = *v9;
          }
          else
          {
            v10 = 0;
          }
          objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForeground_, v10, 0);
        }
      }
    }
    v11 = EAWeakLinkClass(CFSTR("ACCExternalAccessoryProvider"), (const void *)6);
    if (v11)
    {
      v12 = [v11 alloc];
      __accEAProviderClassInstance = objc_msgSend(v12, "initWithDelegate:capabilities:", v3, __capabilities);
    }
    else
    {
      NSLog(CFSTR("[#ExternalAccessory] no ACCExternalAccessoryProviderClass"));
    }
    __currentCoreAccessoriesEASessions = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    __activeCoreAccessoriesEASessions = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_connectionQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.EA.connectionQueue", 0);
    v13 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v3->_pickerLock = v13;
    -[NSRecursiveLock setName:](v13, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "com.apple.EA.pickerLock", 4));
    if (_initFromSingletonCreationMethod_onceToken != -1)
      dispatch_once(&_initFromSingletonCreationMethod_onceToken, &__block_literal_global);
    obj = (id)IAPAppConnectedAccessories();
    if (obj)
    {
      NSLog(CFSTR("[#ExternalAccessory] iapConnectedAccessories count = %lu, managerUUID %@"), objc_msgSend(obj, "count"), v3->_managerInstanceUUID);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v19 = objc_alloc_init(EAAccessoryInternal);
            __convertIAPAccessoryToEAAccessory(v18, v19);
            -[EAAccessoryInternal setConnected:](v19, "setConnected:", 1);
            v20 = -[EAAccessory _initWithAccessory:]([EAAccessory alloc], "_initWithAccessory:", v19);
            objc_msgSend((id)__accessoryListLock, "lock");
            connectedAccessories = v3->_connectedAccessories;
            if (!connectedAccessories)
            {
              connectedAccessories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v3->_connectedAccessories = connectedAccessories;
            }
            -[NSMutableArray addObject:](connectedAccessories, "addObject:", v20);
            objc_msgSend((id)__accessoryListLock, "unlock");
            NSLog(CFSTR("[#ExternalAccessory] Added iapConnectedAccessory connectionID %lu"), objc_msgSend(v20, "connectionID"));

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v15);
      }
    }
    v3->_sequesterNewAccessories = 0;
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__externalAccessoryConnectedNotificationHandler_, *MEMORY[0x1E0D33B28], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__externalAccessoryUpdated_, *MEMORY[0x1E0D33BE8], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__externalAccessoryDisconnected_, *MEMORY[0x1E0D33B30], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__pointOfInterestStatusReceived_, *MEMORY[0x1E0D33BC0], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__OOBBTPairingCompletionStatusReceived_, *MEMORY[0x1E0D33B88], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__iapServerDied_, *MEMORY[0x1E0D33C30], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__externalAccessoryReconnected_, *MEMORY[0x1E0D33C48], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__timeSyncInfoUpdated_, *MEMORY[0x1E0D33D70], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__vehicleDataUpdated_, *MEMORY[0x1E0D33D88], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__cameraInfoUpdated_, *MEMORY[0x1E0D33C98], 0);
  }
  return v3;
}

uint64_t __54__EAAccessoryManager__initFromSingletonCreationMethod__block_invoke()
{
  __accessoryListLock = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3740]);
  return objc_msgSend((id)__accessoryListLock, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "com.apple.EA.accessoryListLock", 4));
}

+ (BOOL)isLoggingEnabled
{
  int v2;
  CFPropertyListRef v3;

  v2 = isLoggingEnabled_isLoggingEnabled;
  if (isLoggingEnabled_isLoggingEnabled == 255)
  {
    v3 = CFPreferencesCopyValue(CFSTR("LogEAEvents"), CFSTR("com.apple.logging"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
    v2 = objc_msgSend((id)(id)CFMakeCollectable(v3), "BOOLValue");
    isLoggingEnabled_isLoggingEnabled = v2;
  }
  return v2 != 0;
}

- (void)startLocationForConnectedAccessories
{
  NSMutableArray *connectedAccessories;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)__accessoryListLock, "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  connectedAccessories = self->_connectedAccessories;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(connectedAccessories);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (-[EAAccessoryManager areLocationAccessoriesEnabled](self, "areLocationAccessoriesEnabled")
          && objc_msgSend(v8, "supportsLocation")
          && objc_msgSend(v8, "createdByCoreAccessories"))
        {
          NSLog(CFSTR("[#ExternalAccessory] Checking for connected accessories, starting location for accessory UUID %@"), objc_msgSend(v8, "coreAccessoriesPrimaryUUID"));
          objc_msgSend((id)__accEAProviderClassInstance, "startLocationInformationForAccessoryUUID:", objc_msgSend(v8, "coreAccessoriesPrimaryUUID"));
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  objc_msgSend((id)__accessoryListLock, "unlock");
}

- (NSArray)connectedAccessories
{
  NSMutableArray *connectedAccessories;
  uint64_t v4;
  NSArray *v5;

  objc_msgSend((id)__accessoryListLock, "lock");
  connectedAccessories = self->_connectedAccessories;
  if (connectedAccessories)
    connectedAccessories = (NSMutableArray *)-[NSMutableArray count](connectedAccessories, "count");
  NSLog(CFSTR("[#ExternalAccessory] Returning connectedAccessories count %lu"), connectedAccessories);
  if (self->_connectedAccessories)
    v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    v4 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (NSArray *)v4;
  objc_msgSend((id)__accessoryListLock, "unlock");
  return v5;
}

- (void)_checkForConnectedAccessories:(BOOL)a3 backgroundTaskIdentifier:(unint64_t)a4
{
  char v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  id v25;
  _BOOL4 v26;
  _QWORD block[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  NSLog(CFSTR("[#ExternalAccessory] %s inBackground %d, identifier %lu"), a2, "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]", a3, a4);
  v5 = __capabilities;
  v6 = IAPAppConnectedAccessories();
  v25 = -[EAAccessoryManager _findExtraAccessoriesContainedOnlyIniAP:](self, "_findExtraAccessoriesContainedOnlyIniAP:", v6);
  v7 = -[EAAccessoryManager _findExtraAccessoriesContainedOnlyInEA:](self, "_findExtraAccessoriesContainedOnlyInEA:", v6);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "_internalConnectionID")));
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v10);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    v16 = *MEMORY[0x1E0D33C20];
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v8);
        v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled")
          || (v5 & 0x10) != 0
          || (v5 & 0x20) != 0)
        {
          NSLog(CFSTR("[#ExternalAccessory] %s disconnecting accessory %@"), "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]", v18);
        }
        -[EAAccessoryManager _externalAccessoryDisconnected:](self, "_externalAccessoryDisconnected:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("EAAccessoryCleanUpForTaskSuspend"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v18, v16)));
      }
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v14);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v25);
        v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k);
        if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled")
          || (v5 & 0x10) != 0
          || (v5 & 0x20) != 0)
        {
          NSLog(CFSTR("[#ExternalAccessory] %s attaching accessory %@"), "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]", v23);
        }
        -[EAAccessoryManager _externalAccessoryConnected:](self, "_externalAccessoryConnected:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("EAAccessoryReConnectOnEnterForeground"), self, v23));
      }
      v20 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v20);
  }
  if (v26)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__EAAccessoryManager__checkForConnectedAccessories_backgroundTaskIdentifier___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)initialEAAccessoriesAttachedAfterClientConnection:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  EAAccessoryInternal *v10;
  id v11;
  NSMutableArray *connectedAccessories;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("[#ExternalAccessory] initialConnectedAccessories count %lu"), objc_msgSend(a3, "count"));
  objc_msgSend((id)__accessoryListLock, "lock");
  if (a3)
  {
    if (objc_msgSend(a3, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(a3);
            v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
            v10 = objc_alloc_init(EAAccessoryInternal);
            __convertIAPAccessoryToEAAccessory(v9, v10);
            -[EAAccessoryInternal setConnected:](v10, "setConnected:", 1);
            v11 = -[EAAccessory _initWithAccessory:]([EAAccessory alloc], "_initWithAccessory:", v10);
            connectedAccessories = self->_connectedAccessories;
            if (!connectedAccessories)
            {
              connectedAccessories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              self->_connectedAccessories = connectedAccessories;
            }
            -[NSMutableArray addObject:](connectedAccessories, "addObject:", v11);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }
    }
  }
  NSLog(CFSTR("[#ExternalAccessory] _connectedAccessories (%lu)"), -[NSMutableArray count](self->_connectedAccessories, "count"));
  objc_msgSend((id)__accessoryListLock, "unlock");
  NSLog(CFSTR("[#ExternalAccessory] Done attaching initialConnectedAccessories"));
}

- (id)_findExtraAccessoriesContainedOnlyIniAP:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id Accessory;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a3;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = *MEMORY[0x1E0D33C20];
    v10 = *MEMORY[0x1E0D33BD8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(v12, "objectForKey:", v9);
        Accessory = __findAccessory(objc_msgSend(v13, "unsignedIntValue"), self->_connectedAccessories);
        if (Accessory
          || (Accessory = __findAccessory(objc_msgSend(v13, "unsignedIntValue"), self->_sequesteredAccessories)) != 0)
        {
          if ((objc_msgSend(Accessory, "containsSameProtocolsAsiAPAccessoryProtocols:", objc_msgSend(v12, "objectForKey:", v10)) & 1) != 0)continue;
          if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
            NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d found accessory %@ in iAP with different EA Protocols than EA Accessory %@"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _findExtraAccessoriesContainedOnlyIniAP:]", 1194, v12, objc_msgSend(Accessory, "protocolStrings"));
        }
        objc_msgSend(v5, "addObject:", v12);
        if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
          NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d found accessory %@ in iAP not contained in EA (total found count is %lu)"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _findExtraAccessoriesContainedOnlyIniAP:]", 1208, v12, objc_msgSend(v5, "count"));
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)_findExtraAccessoriesContainedOnlyInEA:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  _BOOL4 v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_connectedAccessories);
  objc_msgSend(v5, "addObjectsFromArray:", self->_sequesteredAccessories);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    v9 = *MEMORY[0x1E0D33C20];
    v21 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      v22 = v7;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        if ((objc_msgSend(v11, "createdByCoreAccessories") & 1) == 0)
        {
          v23 = v11;
          v12 = objc_msgSend(v11, "connectionID");
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            v16 = *(_QWORD *)v29;
            while (1)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v29 != v16)
                  objc_enumerationMutation(a3);
                if ((v15 & 1) != 0)
                  goto LABEL_13;
                if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "objectForKey:", v9), "unsignedIntegerValue") == v12)
                {
                  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
                    NSLog(CFSTR("[#ExternalAccessory] Found iap accessory for connection id %lu"), v12);
LABEL_13:
                  v15 = 1;
                  continue;
                }
                v15 = 0;
              }
              v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
              if (!v14)
                goto LABEL_22;
            }
          }
          v15 = 0;
LABEL_22:
          v18 = +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled");
          v7 = v22;
          if ((v15 & 1) == 0 && v18)
            NSLog(CFSTR("[#ExternalAccessory] connection ID %lu not found in iap accessories list"), v12);
          v8 = v21;
          if ((v15 & 1) == 0)
          {
            objc_msgSend(v20, "addObject:", v23);
            if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
              NSLog(CFSTR("[#ExternalAccessory] %s:%s Found accessory %@  in EA not contained in iAP, needs to be detached, (total found count is %lu)"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _findExtraAccessoriesContainedOnlyInEA:]", v23, objc_msgSend(v20, "count"));
          }
        }
        ++v10;
      }
      while (v10 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }
  return v20;
}

- (void)registerForLocalNotifications
{
  int v2;
  void *v4;
  uint64_t v5;

  v2 = __registeredForLocalNotifications;
  if (!__registeredForLocalNotifications)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__locationNmeaDataAvailable_, *MEMORY[0x1E0D33D20], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__locationPointDataAvailable_, *MEMORY[0x1E0D33D18], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__ephemerisURLAvailable_, *MEMORY[0x1E0D33D10], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__nmeaFilteringSupportChanged_, *MEMORY[0x1E0D33CE8], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__gpsTimeRequested_, *MEMORY[0x1E0D33D28], 0);
    v2 = __registeredForLocalNotifications;
  }
  v5 = (v2 + 1);
  __registeredForLocalNotifications = v5;
  NSLog(CFSTR("[#ExternalAccessory] On: %d RegisteredForLocalNotifications Count: %d"), a2, 1043, v5);
}

- (void)unregisterForLocalNotifications
{
  uint64_t v2;
  void *v4;

  v2 = __registeredForLocalNotifications;
  if (__registeredForLocalNotifications == 1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D33D20], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D33D18], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D33D10], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D33CE8], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D33D28], 0);
    v2 = __registeredForLocalNotifications;
  }
  if ((_DWORD)v2)
  {
    v2 = (v2 - 1);
    __registeredForLocalNotifications = v2;
  }
  NSLog(CFSTR("[#ExternalAccessory] On: %d Unregistering. RegisteredForLocalNotifications Count: %d"), 1063, v2);
}

- (void)stopLocationForConnectedAccessories
{
  NSMutableArray *connectedAccessories;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  connectedAccessories = self->_connectedAccessories;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(connectedAccessories);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "supportsLocation"))
        {
          if (objc_msgSend(v7, "createdByCoreAccessories"))
          {
            NSLog(CFSTR("[#Location] Checking for connected accessories, stopping location for accessory UUID %@"), objc_msgSend(v7, "coreAccessoriesPrimaryUUID"));
            objc_msgSend((id)__accEAProviderClassInstance, "stopLocationInformationForAccessoryUUID:", objc_msgSend(v7, "coreAccessoriesPrimaryUUID"));
          }
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

- (EAAccessoryManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("EAAccessoryManagerInitException"), CFSTR("-init is not supported. Use +sharedAccessoryManager."));
  return 0;
}

- (void)dealloc
{
  char v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id pickerCompletion;
  void *v10;
  objc_super v11;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isMacCatalystApp") & 1) == 0)
  {
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isiOSAppOnMac");
    if (uikitFramework)
    {
      if ((v3 & 1) == 0)
      {
        v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        if (uikitFramework
          && (v5 = (uint64_t *)dlsym((void *)uikitFramework, "UIApplicationDidEnterBackgroundNotification")) != 0)
        {
          v6 = *v5;
        }
        else
        {
          v6 = 0;
        }
        objc_msgSend(v4, "removeObserver:name:object:", self, v6, 0);
        if (uikitFramework
          && (v7 = (uint64_t *)dlsym((void *)uikitFramework, "UIApplicationWillEnterForegroundNotification")) != 0)
        {
          v8 = *v7;
        }
        else
        {
          v8 = 0;
        }
        objc_msgSend(v4, "removeObserver:name:object:", self, v8, 0);
        dlclose((void *)uikitFramework);
      }
    }
  }
  objc_msgSend((id)__accessoryListLock, "lock");

  self->_connectedAccessories = 0;
  objc_msgSend((id)__accessoryListLock, "unlock");

  self->_sequesteredAccessories = 0;
  -[NSRecursiveLock lock](self->_pickerLock, "lock");

  self->_selectedBluetoothAddress = 0;
  -[EABluetoothAccessoryPicker dismissPicker](self->_picker, "dismissPicker");

  self->_picker = 0;
  pickerCompletion = self->_pickerCompletion;
  if (pickerCompletion)
  {
    _Block_release(pickerCompletion);
    self->_pickerCompletion = 0;
  }
  -[NSTimer invalidate](self->_pickerTimer, "invalidate");

  self->_pickerTimer = 0;
  -[NSRecursiveLock unlock](self->_pickerLock, "unlock");

  dispatch_release((dispatch_object_t)self->_connectionQueue);
  self->_connectionQueue = 0;
  -[EAAccessoryManager unregisterForLocalNotifications](self, "unregisterForLocalNotifications");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33B28], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33BE8], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33B30], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33C30], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33C48], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33D70], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33D88], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33BC0], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33B88], 0);
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D33C98], 0);

  self->_managerInstanceUUID = 0;
  v11.receiver = self;
  v11.super_class = (Class)EAAccessoryManager;
  -[EAAccessoryManager dealloc](&v11, sel_dealloc);
}

- (void)EAAccessoryArrived:(id)a3
{
  NSLog(CFSTR("[#ExternalAccessory] CoreAccessories accessoryInfo for arrival = %@"), +[EAAccessoryManager accessoryDictionaryForLogging:](EAAccessoryManager, "accessoryDictionaryForLogging:"));
  -[EAAccessoryManager _externalAccessoryConnected:](self, "_externalAccessoryConnected:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", *MEMORY[0x1E0D33B28], self, a3));
}

- (void)EAAccessoryLeft:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  NSLog(CFSTR("[#ExternalAccessory] CoreAccessories accessoryInfo for departure = %@"), +[EAAccessoryManager accessoryDictionaryForLogging:](EAAccessoryManager, "accessoryDictionaryForLogging:"));
  v5 = *MEMORY[0x1E0D33C20];
  v6 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33C20]);
  if (v6)
    -[EAAccessoryManager _externalAccessoryDisconnected:](self, "_externalAccessoryDisconnected:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", *MEMORY[0x1E0D33B30], self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, v5)));
  else
    NSLog(CFSTR("[#ExternalAccessory] ERROR: No connectionIDObject in EAAccessoryLeft"));
}

- (void)startDestinationSharingForUUID:(id)a3 options:(unint64_t)a4
{
  id AccessoryByUUID;
  void *v7;
  void *v8;

  AccessoryByUUID = __findAccessoryByUUID((uint64_t)a3, self->_connectedAccessories);
  if (AccessoryByUUID)
  {
    v7 = AccessoryByUUID;
    objc_msgSend(AccessoryByUUID, "setPointOfInterestHandoffEnabled:", 1);
    objc_msgSend(v7, "setDestinationSharingOptions:", a4);
    if (__registeredForLocalNotifications)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("EAAccessoryUpdateNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("EAAccessoryKey")));
    }
  }
}

- (void)stopDestinationSharingForUUID:(id)a3
{
  id AccessoryByUUID;
  id v5;
  void *v6;

  AccessoryByUUID = __findAccessoryByUUID((uint64_t)a3, self->_connectedAccessories);
  if (AccessoryByUUID)
  {
    v5 = AccessoryByUUID;
    objc_msgSend(AccessoryByUUID, "setPointOfInterestHandoffEnabled:", 0);
    if (__registeredForLocalNotifications)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("EAAccessoryUpdateNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v5, CFSTR("EAAccessoryKey")));
    }
  }
}

- (void)destinationSharingStatus:(BOOL)a3 forDestinationUUID:(id)a4 supportedParams:(id)a5 forUUID:(id)a6
{
  _BOOL8 v8;
  void *v10;

  v8 = a3;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4, a5, a6);
  objc_msgSend(v10, "setObject:forKey:", a4, CFSTR("EAAccessoryDestinationStatusIdentifierKey"));
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("EAAccessoryDestinationStatusDidSucceedKey"));
  objc_msgSend(v10, "setObject:forKey:", a5, CFSTR("EAAccessoryDestinationStatusParametersUsedKey"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDestinationStatusNotification"), self, v10);
}

- (void)nmeaSentenceArrived:(id)a3 forAccessoryUUID:(id)a4 withTimestamps:(id)a5
{
  id AccessoryByUUID;

  AccessoryByUUID = __findAccessoryByUUID((uint64_t)a4, self->_connectedAccessories);
  if (AccessoryByUUID)
  {
    objc_msgSend(AccessoryByUUID, "addNMEASentence:withTimestamps:", a3, a5);
    -[EAAccessoryManager _locationNmeaDataAvailable:](self, "_locationNmeaDataAvailable:", 0);
  }
  else
  {
    NSLog(CFSTR("[#Location] %s: Cannot find accessory for UUID %@, skip nmeaSentence %@, timestamps %@"), "-[EAAccessoryManager nmeaSentenceArrived:forAccessoryUUID:withTimestamps:]", a4, a3, a5);
  }
}

- (void)vehicleStatusUpdate:(id)a3 forAccessoryUUID:(id)a4
{
  id AccessoryByUUID;
  void *v8;

  AccessoryByUUID = __findAccessoryByUUID((uint64_t)a4, self->_connectedAccessories);
  NSLog(CFSTR("[#VehicleInfoStatus] %s: accessory UUID %@, vehicleStatusUpdate %@"), "-[EAAccessoryManager vehicleStatusUpdate:forAccessoryUUID:]", a4, a3);
  if (AccessoryByUUID)
  {
    NSLog(CFSTR("[#VehicleInfoStatus] Found accessory for vehicle status update, %@"), a4);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(AccessoryByUUID, "connectionID")), CFSTR("EAConnectionIDKey"));
    -[EAAccessoryManager _vehicleDataUpdated:](self, "_vehicleDataUpdated:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", *MEMORY[0x1E0D33D88], 0, v8));
  }
  else
  {
    NSLog(CFSTR("[#VehicleInfoStatus] No accessory found for vehicle status update, ignoring, %@"), a4);
  }
}

- (void)updateAccessoryInfo:(id)a3
{
  -[EAAccessoryManager _externalAccessoryUpdated:](self, "_externalAccessoryUpdated:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", *MEMORY[0x1E0D33BE8], 0, a3));
}

- (void)showBluetoothAccessoryPickerWithNameFilter:(NSPredicate *)predicate completion:(EABluetoothAccessoryPickerCompletion)completion
{
  NSString *selectedBluetoothAddress;
  EABluetoothAccessoryPicker *v8;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isMacCatalystApp") & 1) != 0
    || objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isiOSAppOnMac"))
  {
    NSLog(CFSTR("[#BTPicker] %s isRunningOnMac"), "-[EAAccessoryManager showBluetoothAccessoryPickerWithNameFilter:completion:]");
    +[EAPostAlert EANotificationPostAccessoryNotification:forMsg:forDefaultButton:withAlternateButton:forNotification:withCallback:andTimeout:](EAPostAlert, "EANotificationPostAccessoryNotification:forMsg:forDefaultButton:withAlternateButton:forNotification:withCallback:andTimeout:", CFSTR("BLUETOOTH_PICKER_UNAVAILABLE_TITLE"), CFSTR("BLUETOOTH_PICKER_UNAVAILABLE_MSG"), CFSTR("OKAY_STRING"), 0, &_BTPickerUnsupportedNotificationRef, __notificationCleanup, 0.0);
  }
  else
  {
    -[NSRecursiveLock lock](self->_pickerLock, "lock");
    if (!self->_picker)
    {
      self->_sequesterNewAccessories = 1;
      selectedBluetoothAddress = self->_selectedBluetoothAddress;
      if (selectedBluetoothAddress)
      {

        self->_selectedBluetoothAddress = 0;
      }
      self->_pickerCompletion = _Block_copy(completion);
      v8 = -[EABluetoothAccessoryPicker initWithPredicate:]([EABluetoothAccessoryPicker alloc], "initWithPredicate:", predicate);
      self->_picker = v8;
      -[EABluetoothAccessoryPicker setDelegate:](v8, "setDelegate:", self);
      -[EABluetoothAccessoryPicker show](self->_picker, "show");
    }
    -[NSRecursiveLock unlock](self->_pickerLock, "unlock");
  }
}

- (void)_notifyObserversThatAccessoryDisconnectedWithUserInfo:(id)a3
{
  uint64_t v5;
  _QWORD block[7];

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryKey"));
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__EAAccessoryManager__notifyObserversThatAccessoryDisconnectedWithUserInfo___block_invoke;
    block[3] = &unk_1E6B077B0;
    block[4] = v5;
    block[5] = self;
    block[6] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __76__EAAccessoryManager__notifyObserversThatAccessoryDisconnectedWithUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "accessoryDidDisconnect:", *(_QWORD *)(a1 + 32));
  v2 = objc_msgSend(*(id *)(a1 + 32), "coreAccessoriesPrimaryUUID");
  v3 = objc_msgSend(*(id *)(a1 + 32), "connectionID");
  v4 = objc_msgSend(*(id *)(a1 + 32), "createdByCoreAccessories");
  NSLog(CFSTR("[#ExternalAccessory] On: %d Accessory Disconnected. UUID %@ connectionID %lu createdByCoreAccessories %d. RegisteredForLocalNotifications Count: %d"), 1078, v2, v3, v4, __registeredForLocalNotifications);
  if (__registeredForLocalNotifications)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDidDisconnectNotification"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_iapServerDied:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  NSLog(CFSTR("[#ExternalAccessory] Handling _iapServerDied, _connectedAccessories count = %lu, notification %@"), -[NSMutableArray count](self->_connectedAccessories, "count"), a3);
  -[EAAccessoryManager _removeAlliAPAccessoriesFromArray:notifyClients:](self, "_removeAlliAPAccessoriesFromArray:notifyClients:", self->_connectedAccessories, 1);
  -[EAAccessoryManager _removeAlliAPAccessoriesFromArray:notifyClients:](self, "_removeAlliAPAccessoriesFromArray:notifyClients:", self->_sequesteredAccessories, 0);
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] Handling _iapServerDied: __iapdCrashed %d -> %d, __iap2dStartedSinceLastAppExecution %d -> %d, __iapdStartedSinceLastAppExecution %d -> %d"), __iapdCrashed, 1, __iap2dStartedSinceLastAppExecution, 0, __iapdStartedSinceLastAppExecution, 0);
  __iapdCrashed = 1;
  __iap2dStartedSinceLastAppExecution = 0;
  __iapdStartedSinceLastAppExecution = 0;

}

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *global_queue;
  _QWORD block[5];
  _QWORD v10[5];

  NSLog(CFSTR("[#ExternalAccessory] _applicationDidEnterBackground, %@"), a2, a3);
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d __capabilities = 0x%X, EAAccessoryCapabilitiesKeepSessionsOpenWhenSuspended = 0x%X, EAAccessoryCapabilitiesKeepSessionsOpenInBackground = 0x%X"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _applicationDidEnterBackground:]", 1119, __capabilities, 16, 32);
  if (_backgroundTask)
  {
    v4 = objc_opt_class();
    NSLog(CFSTR("[#ExternalAccessory] %@: _backgroundTask not 0, %lu"), v4, _backgroundTask);
  }
  v5 = (void *)-[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__EAAccessoryManager__applicationDidEnterBackground___block_invoke;
  v10[3] = &unk_1E6B077D8;
  v10[4] = self;
  _backgroundTask = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("EA_BackgroundTask"), v10);
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
  {
    v7 = objc_opt_class();
    NSLog(CFSTR("[#ExternalAccessory] %@: created new backgroundTask %lu"), v7, _backgroundTask);
  }
  if ((__capabilities & 0x30) != 0)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __53__EAAccessoryManager__applicationDidEnterBackground___block_invoke_2;
    block[3] = &unk_1E6B077D8;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  else
  {
    -[EAAccessoryManager _cleanUpForTaskSuspendWithTaskIdentifier:](self, "_cleanUpForTaskSuspendWithTaskIdentifier:", _backgroundTask);
  }
}

void __53__EAAccessoryManager__applicationDidEnterBackground___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
  {
    v0 = objc_opt_class();
    NSLog(CFSTR("[#ExternalAccessory] %@: background task expired, _backgroundTask %lu"), v0, _backgroundTask);
  }
  v1 = _backgroundTask;
  v2 = objc_opt_class();
  if (v1)
  {
    NSLog(CFSTR("[#ExternalAccessory] %@: ending expired background task for _backgroundTask %lu, resetting back to 0"), v2, _backgroundTask);
    objc_msgSend((id)-[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication"), "endBackgroundTask:", _backgroundTask);
    _backgroundTask = 0;
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] %@: background task already expired"), v2);
  }
}

uint64_t __53__EAAccessoryManager__applicationDidEnterBackground___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkForConnectedAccessories:backgroundTaskIdentifier:", 1, _backgroundTask);
}

void __77__EAAccessoryManager__checkForConnectedAccessories_backgroundTaskIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] %s:%d ending background task identifier=%lu _backgroundTask=%lu"), "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]_block_invoke", 1302, *(_QWORD *)(a1 + 32), _backgroundTask);
  objc_msgSend((id)-[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication"), "endBackgroundTask:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (_backgroundTask == v2)
  {
    if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
      NSLog(CFSTR("[#ExternalAccessory] %s backgroundTask %lu, resetting back to 0"), "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]_block_invoke", *(_QWORD *)(a1 + 32));
    _backgroundTask = 0;
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] %s _backgroundTask(%lu) != identifier(%lu)"), "-[EAAccessoryManager _checkForConnectedAccessories:backgroundTaskIdentifier:]_block_invoke", _backgroundTask, v2);
  }
}

- (void)_cleanUpForTaskSuspendWithTaskIdentifier:(unint64_t)a3
{
  void *v4;
  NSMutableArray *connectedAccessories;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_connectedAccessories, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  connectedAccessories = self->_connectedAccessories;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(connectedAccessories);
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "_internalConnectionID")));
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    v13 = *MEMORY[0x1E0D33C20];
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v4);
        -[EAAccessoryManager _externalAccessoryDisconnected:](self, "_externalAccessoryDisconnected:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("EAAccessoryCleanUpForTaskSuspend"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), v13)));
      }
      v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] %s ending backgroundTask %lu"), "-[EAAccessoryManager _cleanUpForTaskSuspendWithTaskIdentifier:]", a3);
  objc_msgSend((id)-[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication"), "endBackgroundTask:", a3);
  if (_backgroundTask == a3)
  {
    if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
      NSLog(CFSTR("[#ExternalAccessory] %s backgroundTask = %lu, resetting back to 0"), "-[EAAccessoryManager _cleanUpForTaskSuspendWithTaskIdentifier:]", _backgroundTask);
    _backgroundTask = 0;
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] %s backgroundTask(%lu) != identifier(%lu)"), "-[EAAccessoryManager _cleanUpForTaskSuspendWithTaskIdentifier:]", _backgroundTask, a3);
  }
}

- (void)_externalAccessoryReconnected:(id)a3
{
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d advertising accessory reconnection for userInfo %@\n"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryReconnected:]", 1400, objc_msgSend(a3, "userInfo"));
  -[EAAccessoryManager _externalAccessoryConnected:](self, "_externalAccessoryConnected:", a3);
}

- (void)_removeAlliAPAccessoriesFromArray:(id)a3 notifyClients:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  unsigned int v10;
  id v11;

  v4 = a4;
  v7 = objc_msgSend(a3, "count");
  v8 = +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled");
  v9 = objc_msgSend(a3, "count");
  if (v8)
    NSLog(CFSTR("[#ExternalAccessory] %s: shouldNotifyClients %d, accessories (count %lu) %@"), "-[EAAccessoryManager _removeAlliAPAccessoriesFromArray:notifyClients:]", v4, v9, a3);
  else
    NSLog(CFSTR("[#ExternalAccessory] %s: shouldNotifyClients %d, accessories (count %lu)"), "-[EAAccessoryManager _removeAlliAPAccessoriesFromArray:notifyClients:]", v4, v9);
  if (v7)
  {
    v10 = 1;
    do
    {
      v11 = (id)objc_msgSend(a3, "objectAtIndex:", 0);
      if ((objc_msgSend(v11, "createdByCoreAccessories") & 1) != 0)
      {
        NSLog(CFSTR("[#ExternalAccessory] found an iAP accessory created by CoreAccessories, connectionID %lu"), objc_msgSend(v11, "connectionID"));
      }
      else
      {
        if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
          NSLog(CFSTR("[#ExternalAccessory] %s: found an iAP accessory to remove, index %d, connectionID %lu, shouldNotifyClients = %d"), "-[EAAccessoryManager _removeAlliAPAccessoriesFromArray:notifyClients:]", v10 - 1, objc_msgSend(v11, "connectionID"), v4);
        objc_msgSend(v11, "_setConnected:", 0);
        objc_msgSend(a3, "removeObjectAtIndex:", 0);
        if (v4)
          -[EAAccessoryManager _notifyObserversThatAccessoryDisconnectedWithUserInfo:](self, "_notifyObserversThatAccessoryDisconnectedWithUserInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v11, CFSTR("EAAccessoryKey")));
      }

    }
    while (v7 > v10++);
  }
}

- (void)_externalAccessoryConnectedNotificationHandler:(id)a3
{
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] %s-%d Received notification of accessory connection"), "-[EAAccessoryManager _externalAccessoryConnectedNotificationHandler:]", 1445);
  -[EAAccessoryManager _externalAccessoryConnected:](self, "_externalAccessoryConnected:", a3);
}

- (void)_externalAccessoryConnected:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  EAAccessoryInternal *v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  unsigned int v15;
  const __CFString *v16;
  NSMutableArray *sequesteredAccessories;
  void (**pickerCompletion)(id, _QWORD);
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  char v22;
  NSObject *connectionQueue;
  _QWORD block[9];
  _QWORD v25[3];
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = *MEMORY[0x1E0D33C20];
  v6 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D33C20]);
  if (__findAccessory(objc_msgSend(v6, "unsignedIntValue"), self->_connectedAccessories)
    || __findAccessory(objc_msgSend(v6, "unsignedIntValue"), self->_sequesteredAccessories))
  {
    v7 = (void *)MEMORY[0x1E0CB37C0];
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = objc_msgSend(v4, "objectForKey:", v5);
    -[EAAccessoryManager _externalAccessoryDisconnected:](self, "_externalAccessoryDisconnected:", objc_msgSend(v7, "notificationWithName:object:userInfo:", CFSTR("EAAccessoryReConnect"), self, objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("EAAccessoryIsReconnecting"), 0)));
  }
  v10 = objc_alloc_init(EAAccessoryInternal);
  NSLog(CFSTR("[#ExternalAccessory] _externalAccessoryConnected: userInfo %@"), v4);
  __convertIAPAccessoryToEAAccessory(v4, v10);
  -[EAAccessoryInternal setConnected:](v10, "setConnected:", 1);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v26 = -[EAAccessoryInternal createdByCoreAccessories](v10, "createdByCoreAccessories");
  v11 = -[EAAccessory _initWithAccessory:]([EAAccessory alloc], "_initWithAccessory:", v10);
  objc_msgSend((id)__accessoryListLock, "lock");
  if (!self->_connectedAccessories)
    self->_connectedAccessories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)__accessoryListLock, "unlock");
  -[NSRecursiveLock lock](self->_pickerLock, "lock");
  v12 = (void *)objc_msgSend(v11, "macAddress");
  v13 = objc_msgSend(v12, "localizedCompare:", self->_selectedBluetoothAddress);
  *((_BYTE *)v28 + 24) = v13 == 0;
  if (self->_sequesterNewAccessories)
  {
    if (v13)
      v14 = v12 == 0;
    else
      v14 = 1;
    v15 = !v14;
  }
  else
  {
    v15 = 0;
  }
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
  {
    NSLog(CFSTR("[#ExternalAccessory] New Address: %@ Saved address: %@ Bool: %u\n"), v12, self->_selectedBluetoothAddress, v15);
    v16 = CFSTR("NO");
    if (!v12)
      v16 = CFSTR("YES");
    NSLog(CFSTR("[#ExternalAccessory] address is nil = %@"), v16);
  }
  -[NSRecursiveLock unlock](self->_pickerLock, "unlock");
  if (v15)
  {
    sequesteredAccessories = self->_sequesteredAccessories;
    if (!sequesteredAccessories)
    {
      sequesteredAccessories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_sequesteredAccessories = sequesteredAccessories;
    }
    -[NSMutableArray addObject:](sequesteredAccessories, "addObject:", v11);
  }
  else
  {
    objc_msgSend((id)__accessoryListLock, "lock");
    -[NSMutableArray addObject:](self->_connectedAccessories, "addObject:", v11);
    NSLog(CFSTR("[#ExternalAccessory] Added accessory connectionID %lu, UUID %@"), objc_msgSend(v11, "connectionID"), objc_msgSend(v11, "coreAccessoriesPrimaryUUID"));
    objc_msgSend((id)__accessoryListLock, "unlock");
  }

  if (*((_BYTE *)v28 + 24))
  {
    -[NSRecursiveLock lock](self->_pickerLock, "lock");
    -[NSTimer invalidate](self->_pickerTimer, "invalidate");

    self->_pickerTimer = 0;
    -[EABluetoothAccessoryPicker dismissPicker](self->_picker, "dismissPicker");

    self->_picker = 0;
    pickerCompletion = (void (**)(id, _QWORD))self->_pickerCompletion;
    if (pickerCompletion)
    {
      pickerCompletion[2](pickerCompletion, 0);
      _Block_release(self->_pickerCompletion);
      self->_pickerCompletion = 0;
    }
    -[NSRecursiveLock unlock](self->_pickerLock, "unlock");
    self->_sequesterNewAccessories = 0;
    -[EAAccessoryManager _integrateSequesteredAccessories](self, "_integrateSequesteredAccessories");
  }
  v19 = objc_msgSend(v11, "coreAccessoriesPrimaryUUID");
  v20 = objc_msgSend(v11, "connectionID");
  v21 = objc_msgSend(v11, "createdByCoreAccessories");
  NSLog(CFSTR("[#ExternalAccessory] On: %d Accessory Connected with UUID %@ connectionID %lu createdByCoreAccessories %d. RegisteredForLocalNotifications Count: %d"), 1544, v19, v20, v21, __registeredForLocalNotifications);
  if (__registeredForLocalNotifications)
    v22 = v15;
  else
    v22 = 1;
  if ((v22 & 1) == 0)
  {
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__EAAccessoryManager__externalAccessoryConnected___block_invoke;
    block[3] = &unk_1E6B07848;
    block[4] = v6;
    block[5] = v11;
    block[7] = v25;
    block[8] = &v27;
    block[6] = self;
    dispatch_async(connectionQueue, block);
  }
  if (-[EAAccessoryManager areLocationAccessoriesEnabled](self, "areLocationAccessoriesEnabled")
    && objc_msgSend(v11, "supportsLocation")
    && objc_msgSend(v11, "createdByCoreAccessories"))
  {
    NSLog(CFSTR("[#ExternalAccessory] [#Location] Starting location for accessory UUID %@"), objc_msgSend(v11, "coreAccessoriesPrimaryUUID"));
    objc_msgSend((id)__accEAProviderClassInstance, "startLocationInformationForAccessoryUUID:", objc_msgSend(v11, "coreAccessoriesPrimaryUUID"));
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] [#Location] skip startLocationInformationForAccessoryUUID, enable %d, accessory UUID %@ (support %d, coreAccessories %d)"), -[EAAccessoryManager areLocationAccessoriesEnabled](self, "areLocationAccessoriesEnabled"), objc_msgSend(v11, "coreAccessoriesPrimaryUUID"), objc_msgSend(v11, "supportsLocation"), objc_msgSend(v11, "createdByCoreAccessories"));
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
}

void __50__EAAccessoryManager__externalAccessoryConnected___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  __int128 v4;
  uint64_t v5;
  int v6;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && (__capabilities & 0x30) == 0x20)
  {
    v6 = 2;
    objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue");
    v2 = (void *)RetainConnectionToIAPDaemonByCheckingConnectionID();
    if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
      NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d accessory connectionID %@ not found in iap's list of connected accessories\n"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryConnected:]_block_invoke", 1570, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_setNotPresentInIAPAccessoriesArray:", 1);
    if (v2)
      xpc_release(v2);
  }
  NSLog(CFSTR("[#ExternalAccessory] On: %d Accessory Connected. InternalNotPresentIniAPAccArray: %d"), 1583, objc_msgSend(*(id *)(a1 + 40), "_internalNotPresentInIAPAccessoriesArray"));
  if (objc_msgSend(*(id *)(a1 + 40), "_internalNotPresentInIAPAccessoriesArray"))
  {
    if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
      NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d skipping attach notification\n"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryConnected:]_block_invoke", 1590);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__EAAccessoryManager__externalAccessoryConnected___block_invoke_2;
    block[3] = &unk_1E6B07820;
    v5 = *(_QWORD *)(a1 + 64);
    v4 = *(_OWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __50__EAAccessoryManager__externalAccessoryConnected___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("EAAccessoryKey"));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(v2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("EAAccessorySelectedKey"));
  NSLog(CFSTR("[#ExternalAccessory] On: %d Posting EA DidConnect Notification for Accessory with UUID: %@ connectionID %lu createdByCoreAccessories %d"), 1608, objc_msgSend(*(id *)(a1 + 32), "coreAccessoriesPrimaryUUID"), objc_msgSend(*(id *)(a1 + 32), "connectionID"), objc_msgSend(*(id *)(a1 + 32), "createdByCoreAccessories"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDidConnectNotification"), *(_QWORD *)(a1 + 40), v2);

}

- (void)_externalAccessoryUpdated:(id)a3
{
  void *v4;
  void *v5;
  id Accessory;
  id v7;
  BOOL v8;
  void *v9;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D33C20]);
  Accessory = __findAccessory(objc_msgSend(v5, "unsignedIntValue"), self->_connectedAccessories);
  v7 = Accessory;
  if (Accessory || (v7 = __findAccessory(objc_msgSend(v5, "unsignedIntValue"), self->_sequesteredAccessories)) != 0)
  {
    objc_msgSend(v7, "_updateAccessoryInfo:", v4);
    if (Accessory)
      v8 = __registeredForLocalNotifications == 0;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("EAAccessoryUpdateNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("EAAccessoryKey")));
    }
  }
}

- (void)_pointOfInterestStatusReceived:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D33BB0]), CFSTR("EAAccessoryDestinationStatusIdentifierKey"));
  v7 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D33BA8]), CFSTR("EAAccessoryDestinationStatusDidSucceedKey"));
  v8 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D33BB8]), CFSTR("EAAccessoryDestinationStatusParametersUsedKey"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDestinationStatusNotification"), self, v5);
}

- (void)_OOBBTPairingCompletionStatusReceived:(id)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D33B98]), "unsignedIntValue");
  v7 = (void *)objc_msgSend(a3, "userInfo");
  v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D33B90]), "unsignedCharValue");
  v9 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend(__findAccessory(v6, -[EAAccessoryManager connectedAccessories](self, "connectedAccessories")), "_OOBBTPairingCompletedWithStatus:forAccessoryWithMACAddress:", v8, objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D33B80]));
}

- (void)_externalAccessoryDisconnected:(id)a3
{
  void *v5;
  void *v6;
  NSMutableArray *connectedAccessories;
  NSMutableArray **p_connectedAccessories;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *sequesteredAccessories;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSMutableArray *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D33C20]);
  NSLog(CFSTR("[#ExternalAccessory] %s: connectionID %llu"), "-[EAAccessoryManager _externalAccessoryDisconnected:]", objc_msgSend(v6, "unsignedLongLongValue"));
  if (v6)
  {
    v27 = objc_msgSend(v6, "unsignedIntValue");
    objc_msgSend((id)__accessoryListLock, "lock");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    p_connectedAccessories = &self->_connectedAccessories;
    connectedAccessories = self->_connectedAccessories;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v33;
      while (2)
      {
        v13 = 0;
        v14 = v11 + v10;
        do
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(connectedAccessories);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v13), "connectionID") == v27)
          {
            v22 = v11 + v13;
            v23 = 1;
LABEL_23:
            v24 = *p_connectedAccessories;
            v25 = (id)-[NSMutableArray objectAtIndex:](v24, "objectAtIndex:", v22);
            objc_msgSend(v25, "_setConnected:", 0);
            -[NSMutableArray removeObjectAtIndex:](v24, "removeObjectAtIndex:", v22);
            objc_msgSend((id)__accessoryListLock, "unlock");
            if (objc_msgSend(v25, "_internalNotPresentInIAPAccessoriesArray"))
            {
              if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
                NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d accessory connectionID %u tagged as not found in IAP, skipping disconnect\n"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryDisconnected:]", 1749, v27);
            }
            else if (v23)
            {
              if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
                NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d accessory connectionID %u disconnected %@\n"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessoryManager.m", "-[EAAccessoryManager _externalAccessoryDisconnected:]", 1757, v27, v25);
              -[EAAccessoryManager _notifyObserversThatAccessoryDisconnectedWithUserInfo:](self, "_notifyObserversThatAccessoryDisconnectedWithUserInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v25, CFSTR("EAAccessoryKey"), objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("EAAccessoryIsReconnecting")), CFSTR("EAAccessoryIsReconnecting"), 0));
            }

            return;
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        v11 = v14;
        if (v10)
          continue;
        break;
      }
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    p_connectedAccessories = &self->_sequesteredAccessories;
    sequesteredAccessories = self->_sequesteredAccessories;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequesteredAccessories, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v29;
      while (2)
      {
        v20 = 0;
        v21 = v18 + v17;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(sequesteredAccessories);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v20), "connectionID") == v27)
          {
            v23 = 0;
            v22 = v18 + v20;
            goto LABEL_23;
          }
          ++v20;
        }
        while (v17 != v20);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequesteredAccessories, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        v18 = v21;
        if (v17)
          continue;
        break;
      }
    }
    objc_msgSend((id)__accessoryListLock, "unlock");
    NSLog(CFSTR("[#ExternalAccessory] accessory disconnect failed because accessory with connectionID %u was not found"), v27);
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] accessory disconnect received without connection ID"), v26);
  }
}

- (void)_locationNmeaDataAvailable:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDidReceiveNMEASentenceNotification"), self, 0);
}

- (void)_locationPointDataAvailable:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDidReceiveLocationPointDataNotification"), self, 0);
}

- (void)_ephemerisURLAvailable:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDidReceiveEphemerisURLNotification"), self, 0);
}

- (void)_nmeaFilteringSupportChanged:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryNMEASentenceFilteringSupportChangedNotification"), self, 0);
}

- (void)_gpsTimeRequested:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDidRequestGPSTimeNotification"), self, 0);
}

- (void)_vehicleDataUpdated:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryVehicleDataUpdate"), self, objc_msgSend(a3, "userInfo"));
}

- (void)_cameraInfoUpdated:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryCameraInfoNotification"), self, objc_msgSend(a3, "userInfo"));
}

- (void)_integrateSequesteredAccessories
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[6];

  if (-[NSMutableArray count](self->_sequesteredAccessories, "count"))
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = MEMORY[0x1E0C80D38];
    do
    {
      v5 = (void *)-[NSMutableArray objectAtIndex:](self->_sequesteredAccessories, "objectAtIndex:", 0);
      v6 = v5;
      -[NSMutableArray removeObjectAtIndex:](self->_sequesteredAccessories, "removeObjectAtIndex:", 0);
      -[NSMutableArray addObject:](self->_connectedAccessories, "addObject:", v5);
      if (__registeredForLocalNotifications)
      {
        v7[0] = v3;
        v7[1] = 3221225472;
        v7[2] = __54__EAAccessoryManager__integrateSequesteredAccessories__block_invoke;
        v7[3] = &unk_1E6B07870;
        v7[4] = self;
        v7[5] = v5;
        dispatch_async(v4, v7);
      }

    }
    while (-[NSMutableArray count](self->_sequesteredAccessories, "count"));
  }
}

uint64_t __54__EAAccessoryManager__integrateSequesteredAccessories__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  return objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDidConnectNotification"), *(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("EAAccessoryKey")));
}

- (void)_handleAccessoryNotificationTimeout:(id)a3
{
  void (**pickerCompletion)(id, uint64_t);

  -[NSRecursiveLock lock](self->_pickerLock, "lock");
  self->_pickerTimer = 0;
  -[EABluetoothAccessoryPicker dismissPicker](self->_picker, "dismissPicker");

  self->_picker = 0;
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] Timed out waiting for iAP device to appear"));
  pickerCompletion = (void (**)(id, uint64_t))self->_pickerCompletion;
  if (pickerCompletion)
  {
    pickerCompletion[2](pickerCompletion, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EABluetoothAccessoryPickerErrorDomain"), 1, 0));
    _Block_release(self->_pickerCompletion);
    self->_pickerCompletion = 0;
  }
  -[NSRecursiveLock unlock](self->_pickerLock, "unlock");
  self->_sequesterNewAccessories = 0;
  -[EAAccessoryManager _integrateSequesteredAccessories](self, "_integrateSequesteredAccessories");
}

- (void)_timeSyncInfoUpdated:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryTimeSyncInfoUpdate"), self, objc_msgSend(a3, "userInfo"));
}

+ (void)registerCapabilities:(unsigned int)a3
{
  __capabilities |= a3;
}

- (void)openCompleteForSession:(unsigned int)a3 connectionID:(unsigned int)a4
{
  objc_msgSend(__findAccessory(a4, self->_connectedAccessories), "_openCompleteForSession:", *(_QWORD *)&a3);
}

- (void)endSession:(unsigned int)a3 forConnectionID:(unsigned int)a4
{
  objc_msgSend(__findAccessory(a4, self->_connectedAccessories), "_endSession:", *(_QWORD *)&a3);
}

- (void)wakeAccessoryWithToken:(id)a3
{
  void *v3;
  uint64_t v4;

  v4 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v4);
  if (!v4)
    +[EABluetoothAccessoryPicker wakeSelectedBluetoothAccessories:](EABluetoothAccessoryPicker, "wakeSelectedBluetoothAccessories:", objc_msgSend(v3, "objectForKey:", CFSTR("EAAccessoryMacAddress")));
}

- (BOOL)appDeclaresProtocol:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!_CFExecutableLinkedOnOrAfter() || (__supportsEAShowAllAccessoriesEntitlement & 1) != 0)
  {
LABEL_3:
    LOBYTE(v4) = 1;
    return v4;
  }
  v5 = (id)__declaredProtocols;
  if (__declaredProtocols)
    goto LABEL_11;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "objectForInfoDictionaryKey:", CFSTR("UISupportedExternalAccessoryProtocols"));
  if (!v6 || (v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = (id)__declaredProtocols;
    if (!__declaredProtocols)
      goto LABEL_9;
LABEL_11:
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (!v4)
      return v4;
    v8 = v4;
    v9 = *(_QWORD *)v13;
LABEL_13:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v9)
        objc_enumerationMutation(v5);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "caseInsensitiveCompare:", a3))
        goto LABEL_3;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        LOBYTE(v4) = 0;
        if (v8)
          goto LABEL_13;
        return v4;
      }
    }
  }
  v5 = v7;
  __declaredProtocols = (uint64_t)v5;
  if (v5)
    goto LABEL_11;
LABEL_9:
  LOBYTE(v4) = 0;
  return v4;
}

- (id)_connectedAccessories
{
  return self->_connectedAccessories;
}

- (BOOL)shouldAllowInternalProtocols
{
  return __shouldAllowInternalProtocols;
}

- (void)setShouldAllowInternalProtocols:(BOOL)a3
{
  __shouldAllowInternalProtocols = a3;
}

- (BOOL)shouldAllowCppRuntime
{
  return __shouldAllowCppRuntime;
}

- (void)setShouldAllowCppRuntime:(BOOL)a3
{
  __shouldAllowCppRuntime = a3;
}

- (void)accessibilityAction:(id)a3
{
  unsigned int v5;
  id Accessory;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33C20]), "unsignedIntValue");
  if (v5)
  {
    Accessory = __findAccessory(v5, self->_connectedAccessories);
    objc_msgSend(Accessory, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(Accessory, "delegate"), "accessibilityAccessory:performAction:withObject:", Accessory, objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilityActionKey")), "unsignedIntValue"), a3);
  }
}

- (void)accessibilityContextChange:(id)a3
{
  unsigned int v5;
  id Accessory;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33C20]), "unsignedIntValue");
  if (v5)
  {
    Accessory = __findAccessory(v5, self->_connectedAccessories);
    objc_msgSend(Accessory, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(Accessory, "delegate"), "accessibilityAccessory:setContext:", Accessory, objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilityContextKey")), "unsignedIntValue"));
  }
}

- (void)accessibilityItemPropertyRequest:(id)a3
{
  unsigned int v5;
  id Accessory;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33C20]), "unsignedIntValue");
  if (v5)
  {
    Accessory = __findAccessory(v5, self->_connectedAccessories);
    objc_msgSend(Accessory, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilityItemPropertyKey")), "unsignedIntValue");
      if ((v7 - 1) <= 4)
      {
        v8 = objc_msgSend((id)objc_msgSend(Accessory, "delegate"), "accessibilityAccessory:currentValueForItemProperty:", Accessory, v7);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilityItemPropertyKey")), CFSTR("EAAccessoryAccessibilityItemPropertyKey"), objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilityContextKey")), CFSTR("EAAccessoryAccessibilityContextKey"), v8, CFSTR("EAAccessoryAccessibilityResponseKey"), 0);
        IAPAppSendAccessibilityResponse();
      }
    }
  }
}

- (void)accessibilitySystemPropertyChange:(id)a3
{
  unsigned int v5;
  id Accessory;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33C20]), "unsignedIntValue");
  if (v5)
  {
    Accessory = __findAccessory(v5, self->_connectedAccessories);
    objc_msgSend(Accessory, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(Accessory, "delegate"), "accessibilityAccessory:setValue:forSystemProperty:", Accessory, a3, objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilitySystemPropertyKey")), "unsignedIntValue"));
  }
}

- (void)accessibilitySystemPropertyRequest:(id)a3
{
  unsigned int v5;
  id Accessory;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33C20]), "unsignedIntValue");
  if (v5)
  {
    Accessory = __findAccessory(v5, self->_connectedAccessories);
    objc_msgSend(Accessory, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilitySystemPropertyKey")), "unsignedIntValue");
      if ((v7 - 1) <= 2)
      {
        v8 = objc_msgSend((id)objc_msgSend(Accessory, "delegate"), "accessibilityAccessory:currentValueForSystemProperty:", Accessory, v7);
        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilitySystemPropertyKey")), CFSTR("EAAccessoryAccessibilitySystemPropertyKey"), v8, CFSTR("EAAccessoryAccessibilityResponseKey"), objc_msgSend(a3, "objectForKey:", CFSTR("EAAccessoryAccessibilityContextKey")), CFSTR("EAAccessoryAccessibilityContextKey"), 0);
          IAPAppSendAccessibilityResponse();
        }
      }
    }
  }
}

- (BOOL)areLocationAccessoriesEnabled
{
  return __areLocationAccessoriesEnabled;
}

- (void)sendGPRMCDataStatus:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5 forUUID:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  if (__findAccessoryByUUID((uint64_t)a6, self->_connectedAccessories))
    objc_msgSend((id)__accEAProviderClassInstance, "sendGPRMCDataStatus:ValueV:ValueX:forAccessoryUUID:", v9, v8, v7, a6);
}

- (void)pointOfInterestSelection:(id)a3
{
  unsigned int v5;
  id Accessory;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33C20]), "unsignedIntValue");
  if (v5)
  {
    Accessory = __findAccessory(v5, self->_connectedAccessories);
    objc_msgSend(Accessory, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(Accessory, "delegate"), "pointOfInterestAccessory:pointOfInterestSelection:", Accessory, a3);
  }
}

- (BOOL)destinationInformation:(id)a3 forAccessoryUUID:(id)a4
{
  objc_msgSend((id)__accEAProviderClassInstance, "destinationInformation:forUUID:", a3, a4);
  return 1;
}

- (void)devicePicker:(id)a3 didSelectAddress:(id)a4 errorCode:(int64_t)a5
{
  NSMutableArray *connectedAccessories;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void (**v17)(id, uint64_t);
  void *v18;
  id v19;
  int v20;
  uint64_t v21;
  NSMutableArray *sequesteredAccessories;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSTimer *v28;
  NSTimer *v29;
  void (**pickerCompletion)(id, void *);
  id v31;
  id v32;
  _QWORD block[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_pickerLock, "lock");
  if (self->_picker == a3)
  {
    if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
      NSLog(CFSTR("[#BTPicker] Address: %s Error code: %lu\n"), objc_msgSend(a4, "cStringUsingEncoding:", 1), a5);
    if (a4 && objc_msgSend(a4, "length"))
    {
      self->_selectedBluetoothAddress = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", a4);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      connectedAccessories = self->_connectedAccessories;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v39;
        while (2)
        {
          v14 = 0;
          v15 = v12 + v11;
          do
          {
            if (*(_QWORD *)v39 != v13)
              objc_enumerationMutation(connectedAccessories);
            v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
            if (!objc_msgSend((id)objc_msgSend(v16, "macAddress"), "localizedCompare:", self->_selectedBluetoothAddress))
            {
              v18 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EABluetoothAccessoryPickerErrorDomain"), 0, 0);
              v19 = v18;
              v20 = 0;
              v21 = v12 + v14;
LABEL_30:
              -[EABluetoothAccessoryPicker dismissPicker](self->_picker, "dismissPicker");

              self->_picker = 0;
              pickerCompletion = (void (**)(id, void *))self->_pickerCompletion;
              if (pickerCompletion)
              {
                pickerCompletion[2](pickerCompletion, v18);
                _Block_release(self->_pickerCompletion);
                self->_pickerCompletion = 0;
              }

              if (v20)
              {
                v31 = v16;
                -[NSMutableArray removeObjectAtIndex:](self->_sequesteredAccessories, "removeObjectAtIndex:", v21);
                -[NSMutableArray addObject:](self->_connectedAccessories, "addObject:", v16);

                if (__registeredForLocalNotifications)
                {
                  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  objc_msgSend(v32, "setObject:forKey:", v16, CFSTR("EAAccessoryKey"));
                  objc_msgSend(v32, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("EAAccessorySelectedKey"));
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __62__EAAccessoryManager_devicePicker_didSelectAddress_errorCode___block_invoke;
                  block[3] = &unk_1E6B07870;
                  block[4] = self;
                  block[5] = v32;
                  dispatch_async(MEMORY[0x1E0C80D38], block);

                }
              }
              self->_sequesterNewAccessories = 0;
              -[EAAccessoryManager _integrateSequesteredAccessories](self, "_integrateSequesteredAccessories");

              self->_selectedBluetoothAddress = 0;
              goto LABEL_36;
            }
            ++v14;
          }
          while (v11 != v14);
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedAccessories, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          v12 = v15;
          if (v11)
            continue;
          break;
        }
      }
      else
      {
        v15 = 0;
      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      sequesteredAccessories = self->_sequesteredAccessories;
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequesteredAccessories, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v35;
        while (2)
        {
          v26 = 0;
          v27 = v15 + v24;
          do
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(sequesteredAccessories);
            v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v26);
            if (!objc_msgSend((id)objc_msgSend(v16, "macAddress"), "localizedCompare:", self->_selectedBluetoothAddress))
            {
              v18 = 0;
              v21 = v15 + v26;
              v20 = 1;
              goto LABEL_30;
            }
            ++v26;
          }
          while (v24 != v26);
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequesteredAccessories, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          v15 = v27;
          if (v24)
            continue;
          break;
        }
      }
      v28 = (NSTimer *)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleAccessoryNotificationTimeout_, 0, 0, 10.0);
      self->_pickerTimer = v28;
      v29 = v28;
    }
    else
    {
      -[EABluetoothAccessoryPicker dismissPicker](self->_picker, "dismissPicker");

      self->_picker = 0;
      v17 = (void (**)(id, uint64_t))self->_pickerCompletion;
      if (v17)
      {
        v17[2](v17, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EABluetoothAccessoryPickerErrorDomain"), a5, 0));
        _Block_release(self->_pickerCompletion);
        self->_pickerCompletion = 0;
      }
      self->_sequesterNewAccessories = 0;
      -[EAAccessoryManager _integrateSequesteredAccessories](self, "_integrateSequesteredAccessories");
    }
  }
LABEL_36:
  -[NSRecursiveLock unlock](self->_pickerLock, "unlock");
}

uint64_t __62__EAAccessoryManager_devicePicker_didSelectAddress_errorCode___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("EAAccessoryDidConnectNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)createEASessionForProtocol:(id)a3 accessoryUUID:(id)a4 withReply:(id)a5
{
  objc_msgSend((id)__accEAProviderClassInstance, "createExternalAccessorySessionForProtocol:accessoryUUID:withEASessionReply:", a3, a4, a5);
}

- (void)closeEASessionForEASessionUUID:(id)a3
{
  if (a3)
  {
    objc_msgSend((id)__currentCoreAccessoriesEASessions, "removeObjectForKey:");
    objc_msgSend((id)__activeCoreAccessoriesEASessions, "removeObjectForKey:", a3);
    objc_msgSend((id)__accEAProviderClassInstance, "closeExternalAccessorySession:", a3);
  }
}

- (void)accessoryClosedEASession:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)__currentCoreAccessoriesEASessions, "objectForKey:");
  objc_msgSend((id)__activeCoreAccessoriesEASessions, "removeObjectForKey:", a3);
  if (v4)
    objc_msgSend((id)objc_msgSend(v4, "accessory"), "_endSession:", objc_msgSend(v4, "_sessionID"));
  objc_msgSend((id)__currentCoreAccessoriesEASessions, "removeObjectForKey:", a3);
}

- (void)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5
{
  void *v7;
  void *v8;

  v7 = (void *)objc_msgSend((id)__activeCoreAccessoriesEASessions, "objectForKey:", a4);
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "_handleIncomingEAData:", a3);
  (*((void (**)(id, BOOL))a5 + 2))(a5, v8 != 0);
}

- (void)closeInputStreamForEASessionUUID:(id)a3
{
  if (a3)
  {
    objc_msgSend((id)__activeCoreAccessoriesEASessions, "removeObjectForKey:");
  }
  else if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
  {
    NSLog(CFSTR("[#ExternalAccessory] no eaSessionUUID to close stream"));
  }
}

- (void)saveEASession:(id)a3 forEASessionUUID:(id)a4
{
  objc_msgSend((id)__currentCoreAccessoriesEASessions, "setObject:forKey:");
  objc_msgSend((id)__activeCoreAccessoriesEASessions, "setObject:forKey:", a3, a4);
}

- (void)sendOutgoingEAData:(id)a3 forSessionUUID:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__EAAccessoryManager_sendOutgoingEAData_forSessionUUID___block_invoke;
  v4[3] = &unk_1E6B07898;
  v4[4] = a4;
  objc_msgSend((id)__accEAProviderClassInstance, "sendOutgoingExternalAccessoryData:forEASessionIdentifier:withReply:", a3, a4, v4);
}

void __56__EAAccessoryManager_sendOutgoingEAData_forSessionUUID___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    NSLog(CFSTR("[#ExternalAccessory] Some sort of error sending outgoing EA data for eaSessionUUID %@"), *(_QWORD *)(a1 + 32));
}

- (void)openSessionFromAccessoryToApp:(id)a3
{
  objc_msgSend((id)__accEAProviderClassInstance, "openSocketForAccessoryToApp:", a3);
}

- (void)openSessionFromAppToAccessory:(id)a3
{
  objc_msgSend((id)__accEAProviderClassInstance, "openSocketForAppToAccessory:", a3);
}

- (void)sendNMEAFilterList:(id)a3 forUUID:(id)a4
{
  id AccessoryByUUID;

  AccessoryByUUID = __findAccessoryByUUID((uint64_t)a4, self->_connectedAccessories);
  if (AccessoryByUUID)
  {
    NSLog(CFSTR("[#Location] Sending NMEA filter list to accessory UUID %@"), objc_msgSend(AccessoryByUUID, "coreAccessoriesPrimaryUUID"));
    objc_msgSend((id)__accEAProviderClassInstance, "sendNMEAFilterList:forAccessoryUUID:", a3, a4);
  }
}

- (BOOL)processIDIsUsingAccessory:(__CFString *)a3
{
  return 0;
}

- (id)authCertForLegacyConnectionID:(unsigned int)a3
{
  id result;

  result = __findAccessory(a3, self->_connectedAccessories);
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(result, "certData"), "copy");
  return result;
}

- (id)authCertSerialNumberForLegacyConnectionID:(unsigned int)a3
{
  id result;

  result = __findAccessory(a3, self->_connectedAccessories);
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(result, "certSerial"), "copy");
  return result;
}

- (void)requestIAPAccessoryWiFiCredentials:(id)a3
{
  if (__findAccessoryByUUID((uint64_t)a3, self->_connectedAccessories))
  {
    NSLog(CFSTR("[#ExternalAccessory] Call requestIAPAccessoryWiFiCredentials for accessory UUID %@"), a3);
    objc_msgSend((id)__accEAProviderClassInstance, "requestAccessoryWifiCredentials:", a3);
  }
}

- (id)currentVehicleInformation:(id)a3
{
  if (__findAccessoryByUUID((uint64_t)a3, self->_connectedAccessories))
  {
    NSLog(CFSTR("[#VehicleInfoStatus] Call currentVehicleInformation for accessory UUID %@"), a3);
    return (id)objc_msgSend((id)__accEAProviderClassInstance, "currentVehicleInfo:", a3);
  }
  else
  {
    NSLog(CFSTR("[#VehicleInfoStatus] No accessory to get currentVehicleInformation. accessory UUID %@"), a3);
    return 0;
  }
}

- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4 forUUID:(id)a5
{
  if (__findAccessoryByUUID((uint64_t)a5, self->_connectedAccessories))
  {
    NSLog(CFSTR("[#ExternalAccessory] Call sendDeviceIdentifierNotification:usbIdentifier:forUUID: for accessoryUUID %@"), a5);
    objc_msgSend((id)__accEAProviderClassInstance, "sendDeviceIdentifierNotification:usbIdentifier:forUUID:", a3, a4, a5);
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 forUUID:(id)a7
{
  if (__findAccessoryByUUID((uint64_t)a7, self->_connectedAccessories))
  {
    NSLog(CFSTR("[#ExternalAccessory] Call sendWiredCarPlayAvailable:usbIdentifier:wirelessCarPlayAvailable:bluetoothIdentifier:forUUID: for accessoryUUID %@"), a7);
    objc_msgSend((id)__accEAProviderClassInstance, "sendWiredCarPlayAvailable:usbIdentifier:wirelessAvailable:bluetoothIdentifier:forUUID:", a3, a4, a5, a6, a7);
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7 forUUID:(id)a8
{
  if (__findAccessoryByUUID((uint64_t)a8, self->_connectedAccessories))
  {
    NSLog(CFSTR("[#ExternalAccessory] Call sendWiredCarPlayAvailable:usbIdentifier:wirelessCarPlayAvailable:bluetoothIdentifier:themeAssetsAvailable:forUUID: for accessoryUUID %@"), a8);
    objc_msgSend((id)__accEAProviderClassInstance, "sendWiredCarPlayAvailable:usbIdentifier:wirelessAvailable:bluetoothIdentifier:themeAssetsAvailable:forUUID:", a3, a4, a5, a6, a7, a8);
  }
}

+ (id)accessoryDictionaryForLogging:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  if (objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertDataKey")))
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertDataKey")), "length");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu bytes"), v4), CFSTR("IAPAppAccessoryCertDataKey"));
  }
  if (objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertSerialNumberKey")))
  {
    v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertSerialNumberKey")), "length");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu bytes"), v5), CFSTR("IAPAppAccessoryCertSerialNumberKey"));
  }
  return v3;
}

@end
