@implementation MFNetworkController

- (int)dataStatus
{
  int v3;

  -[MFNetworkController _initializeDataStatus](self, "_initializeDataStatus");
  -[NSLock lock](self->_lock, "lock");
  if (-[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
  {
    if (self->_hasWiFiCapability && (self->_flags & 0x40000) == 0)
    {
LABEL_12:
      v3 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    if ((-[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode") & 1) != 0)
    {
      v3 = 1;
      goto LABEL_22;
    }
    if (self->_hasWiFiCapability && !self->_hasCellDataCapability && !self->_isWiFiEnabled)
    {
      v3 = 3;
      goto LABEL_22;
    }
  }
  if (!self->_hasCellDataCapability)
  {
    v3 = 6;
    goto LABEL_22;
  }
  if (self->_cellularDataAvailable)
    goto LABEL_12;
  if (CTCellularDataPlanGetIsEnabled())
  {
    if (self->_isRoamingAllowed)
    {
      if (self->_activeCalls)
        v3 = 5;
      else
        v3 = 6;
    }
    else
    {
      v3 = 4;
    }
  }
  else
  {
    v3 = 2;
  }
LABEL_22:
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_initializeDataStatus
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MFNetworkController__initializeDataStatus__block_invoke;
  block[3] = &unk_1E81CB468;
  block[4] = self;
  if (_initializeDataStatus_onceToken != -1)
    dispatch_once(&_initializeDataStatus_onceToken, block);
}

- (BOOL)_isNetworkUp_nts
{
  return (self->_flags & 6) == 2 && self->_dns;
}

- (void)_setDataStatus_nts:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1C8839000, v5, OS_LOG_TYPE_DEFAULT, "#Network setting data status: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    self->_dataIndicator = objc_msgSend(v4, "indicator");
    self->_isRoamingAllowed = objc_msgSend(v4, "roamAllowed");
    v6 = objc_msgSend(v4, "attached")
      && objc_msgSend(v4, "indicator")
      && self->_isRoamingAllowed;
    self->_cellularDataAvailable = v6;
  }
  else
  {
    self->_dataIndicator = 0;
    self->_isRoamingAllowed = 0;
    self->_cellularDataAvailable = 0;
  }

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MFNetworkController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance__sharedInstance;
}

void __37__MFNetworkController_sharedInstance__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id obj;

  obj = objc_alloc(*(Class *)(a1 + 32));
  +[MFStream networkThread](MFStream, "networkThread");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "performSelector:onThread:withObject:waitUntilDone:", sel_init, v1, 0, 1);

  objc_storeStrong((id *)&sharedInstance__sharedInstance, obj);
  v2 = (id)objc_msgSend((id)sharedInstance__sharedInstance, "addNetworkObserverBlock:queue:", &__block_literal_global_16, MEMORY[0x1E0C80D38]);

}

void __37__MFNetworkController_sharedInstance__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA35F10]();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("NetworkConfigurationDidChangeNotification"), sharedInstance__sharedInstance);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification:", v1);

  objc_autoreleasePoolPop(v0);
}

- (MFNetworkController)init
{
  MFNetworkController *v2;
  uint64_t v3;
  NSLock *lock;
  CFRunLoopRef Current;
  const void *(__cdecl *v6)(const void *);
  const __CFAllocator *v7;
  const __SCNetworkReachability *v8;
  void (__cdecl *v9)(const void *);
  CFStringRef (__cdecl *v10)(const void *);
  const __CFString *v11;
  SCDynamicStoreRef v12;
  const __CFArray *v13;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v15;
  __CFBundle *MainBundle;
  CFStringRef Identifier;
  const __CFString *v18;
  const char *v19;
  uint64_t v20;
  const __SCPreferences *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *dataStatusQueue;
  uint64_t v24;
  CoreTelephonyClient *ctc;
  NSMutableSet *v26;
  NSMutableSet *backgroundWifiClients;
  dispatch_queue_t v28;
  OS_dispatch_queue *prefsQueue;
  uint64_t v30;
  RadiosPreferences *radiosPreferences;
  void *v32;
  SCPreferencesContext buf;
  SCDynamicStoreContext v35;
  SCNetworkReachabilityContext context;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)MFNetworkController;
  v2 = -[MFNetworkController init](&v37, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("com.apple.message.mfnetworkcontroller"), v2);
    lock = v2->_lock;
    v2->_lock = (NSLock *)v3;

    v2->_hasCellDataCapability = MGGetBoolAnswer();
    v2->_hasWiFiCapability = MGGetBoolAnswer();
    Current = CFRunLoopGetCurrent();
    v2->_rl = Current;
    CFRetain(Current);
    v6 = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &init_sa);
    v2->_reachability = v8;
    SCNetworkReachabilityGetFlags(v8, &v2->_flags);
    context.version = 0;
    context.info = v2;
    v9 = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
    context.retain = v6;
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
    v10 = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E0C98350];
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E0C98350];
    SCNetworkReachabilitySetCallback(v2->_reachability, (SCNetworkReachabilityCallBack)_NetworkReachabilityCallBack, &context);
    v11 = (const __CFString *)*MEMORY[0x1E0C9B270];
    SCNetworkReachabilityScheduleWithRunLoop(v2->_reachability, v2->_rl, (CFStringRef)*MEMORY[0x1E0C9B270]);
    v35.version = 0;
    v35.info = v2;
    v35.retain = v6;
    v35.release = v9;
    v35.copyDescription = v10;
    v12 = SCDynamicStoreCreate(v7, CFSTR("com.apple.message.mfnetworkcontroller"), (SCDynamicStoreCallBack)_DynamicStoreCallBack, &v35);
    v2->_store = v12;
    if (v12)
    {
      buf.version = (CFIndex)SCDynamicStoreKeyCreateNetworkGlobalEntity(v7, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B70]);
      v13 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &buf, 1);
      -[MFNetworkController _checkKeys:forStore:](v2, "_checkKeys:forStore:", v13, v2->_store);
      SCDynamicStoreSetNotificationKeys(v2->_store, v13, 0);
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(v7, v2->_store, 0);
      v2->_store_source = RunLoopSource;
      CFRunLoopAddSource(v2->_rl, RunLoopSource, v11);

    }
    else
    {
      MFLogGeneral();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.version) = 0;
        _os_log_impl(&dword_1C8839000, v15, OS_LOG_TYPE_DEFAULT, "#Warning #Network Could not create SCDynamicStore", (uint8_t *)&buf, 2u);
      }

    }
    if (!v2->_hasWiFiCapability)
      goto LABEL_13;
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle && (Identifier = CFBundleGetIdentifier(MainBundle)) != 0)
    {
      v18 = Identifier;
      CFRetain(Identifier);
    }
    else
    {
      v19 = getprogname();
      v20 = getpid();
      v18 = CFStringCreateWithFormat(v7, 0, CFSTR("%s (%d)"), v19, v20);
      if (!v18)
      {
LABEL_13:
        v22 = dispatch_queue_create("com.apple.message.MFNetworkController.dataStatus", 0);
        dataStatusQueue = v2->_dataStatusQueue;
        v2->_dataStatusQueue = (OS_dispatch_queue *)v22;

        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_dataStatusQueue);
        ctc = v2->_ctc;
        v2->_ctc = (CoreTelephonyClient *)v24;

        -[CoreTelephonyClient setDelegate:](v2->_ctc, "setDelegate:", v2);
        v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        backgroundWifiClients = v2->_backgroundWifiClients;
        v2->_backgroundWifiClients = v26;

        -[MFNetworkController _inititializeWifiManager](v2, "_inititializeWifiManager");
        -[MFNetworkController _setupSymptons](v2, "_setupSymptons");
        v28 = dispatch_queue_create("com.apple.mail.radioPreferences", 0);
        prefsQueue = v2->_prefsQueue;
        v2->_prefsQueue = (OS_dispatch_queue *)v28;

        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9B8]), "initWithQueue:", v2->_prefsQueue);
        radiosPreferences = v2->_radiosPreferences;
        v2->_radiosPreferences = (RadiosPreferences *)v30;

        -[RadiosPreferences setDelegate:](v2->_radiosPreferences, "setDelegate:", v2);
        objc_msgSend(MEMORY[0x1E0D46090], "sharedController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addDiagnosticsGenerator:", v2);

        return v2;
      }
    }
    v21 = SCPreferencesCreate(v7, v18, CFSTR("com.apple.wifi.plist"));
    v2->_wiFiPreferences = v21;
    buf.version = 0;
    memset(&buf.retain, 0, 24);
    buf.info = v2;
    SCPreferencesSetCallback(v21, (SCPreferencesCallBack)_WiFiCallBack, &buf);
    SCPreferencesScheduleWithRunLoop(v2->_wiFiPreferences, v2->_rl, v11);
    v2->_isWiFiEnabled = _IsWiFiEnabled(v2->_wiFiPreferences);
    CFRelease(v18);
    goto LABEL_13;
  }
  return v2;
}

- (void)_inititializeWifiManager
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void *)WiFiManagerClientCreate();
  self->_wifiManager = v3;
  if (!v3)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_DEFAULT, "#Warning #Network WiFiManagerClientCreate() returned NULL. Check that the process has the appropriate entitlement(s).", v5, 2u);
    }

  }
}

void __44__MFNetworkController__initializeDataStatus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v25 = 0;
  objc_msgSend(v2, "getSubscriptionInfoWithError:", &v25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v25;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v3;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1C8839000, v5, OS_LOG_TYPE_DEFAULT, "#Network retrieved CT subscription info: %@ with error: %@", buf, 0x16u);
  }

  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v3, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_firstObjectPassingTest:", &__block_literal_global_28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
      v24 = 0;
      objc_msgSend(v9, "getDataStatus:error:", v8, &v24);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v24;
      v4 = v11;
      if (v10)
        v12 = v11 == 0;
      else
        v12 = 0;
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "_setDataStatus_nts:", v10);
      }
      else
      {
        MFLogGeneral();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __44__MFNetworkController__initializeDataStatus__block_invoke_cold_2((uint64_t)v8, (uint64_t)v4, v13);

      }
    }
    else
    {
      MFLogGeneral();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __44__MFNetworkController__initializeDataStatus__block_invoke_cold_1(v10, v14, v15, v16, v17, v18, v19, v20);
      v4 = 0;
    }

  }
  v21 = objc_alloc_init(MEMORY[0x1E0C932E0]);
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 152);
  *(_QWORD *)(v22 + 152) = v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(a1 + 32), "_updateActiveCalls");

}

uint64_t __44__MFNetworkController__initializeDataStatus__block_invoke_26(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "userDataPreferred");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setupSymptons
{
  void *v3;
  int *p_symptomsToken;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__MFNetworkController__setupSymptons__block_invoke;
  aBlock[3] = &unk_1E81CB490;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  p_symptomsToken = &self->_symptomsToken;
  if (notify_register_dispatch("com.apple.symptoms.hasAlternateAdvice", p_symptomsToken, MEMORY[0x1E0C80D38], v3))
    *p_symptomsToken = -1;

}

void __37__MFNetworkController__setupSymptons__block_invoke(uint64_t a1, int token)
{
  uint64_t v3;
  void *v4;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  v3 = state64;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 68) = state64 != 0;
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("NetworkSymptonsHasAlternativeAdvice"), *(_QWORD *)(a1 + 32));

  }
}

- (void)dealloc
{
  __assert_rtn("-[MFNetworkController dealloc]", "MFNetworkController.m", 361, "NULL == _store");
}

- (void)invalidate
{
  MFNetworkController *v3;
  CFRunLoopMode *v4;
  __SCNetworkReachability *reachability;
  NSMutableArray *observers;
  __CFRunLoop *rl;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v3 = (MFNetworkController *)objc_claimAutoreleasedReturnValue();

  if (v3 != self)
  {
    -[NSLock lock](self->_lock, "lock");
    v4 = (CFRunLoopMode *)MEMORY[0x1E0C9B270];
    if (self->_store)
    {
      CFRunLoopSourceInvalidate(self->_store_source);
      SCDynamicStoreSetNotificationKeys(self->_store, 0, 0);
      CFRunLoopRemoveSource(self->_rl, self->_store_source, *v4);
      CFRelease(self->_store_source);
      CFRelease(self->_store);
      self->_store = 0;
    }
    reachability = self->_reachability;
    if (reachability)
    {
      SCNetworkReachabilitySetCallback(reachability, 0, 0);
      SCNetworkReachabilityUnscheduleFromRunLoop(self->_reachability, self->_rl, *v4);
      CFRelease(self->_reachability);
      self->_reachability = 0;
    }
    observers = self->_observers;
    self->_observers = 0;

    rl = self->_rl;
    if (rl)
    {
      CFRelease(rl);
      self->_rl = 0;
    }
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (BOOL)_simulationOverrideForType:(unint64_t)a3 actualValue:(BOOL)a4
{
  void *v6;
  uint64_t v7;

  v6 = (void *)CFPreferencesCopyValue(CFSTR("MFNetworkSimulationBitfieldKey"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v7)
    a4 = (v7 & a3) != 0;

  return a4;
}

- (BOOL)isDataAvailable
{
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 1, -[MFNetworkController dataStatus](self, "dataStatus") == 0);
}

- (BOOL)isNetworkUp
{
  _BOOL8 v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts");
  -[NSLock unlock](self->_lock, "unlock");
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 2, v3);
}

- (BOOL)isFatPipe
{
  _BOOL8 v3;

  -[NSLock lock](self->_lock, "lock");
  if (-[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
    v3 = (self->_flags & 0x40000) == 0;
  else
    v3 = 0;
  -[NSLock unlock](self->_lock, "unlock");
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 4, v3);
}

- (BOOL)isOnWWAN
{
  uint64_t v3;

  -[NSLock lock](self->_lock, "lock");
  if (-[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
    v3 = (BYTE2(self->_flags) >> 2) & 1;
  else
    v3 = 0;
  -[NSLock unlock](self->_lock, "unlock");
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 8, v3);
}

- (BOOL)inAirplaneMode
{
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 16, -[MFNetworkController dataStatus](self, "dataStatus") == 1);
}

- (BOOL)is3GConnection
{
  -[MFNetworkController _initializeDataStatus](self, "_initializeDataStatus");
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 32, (self->_dataIndicator - 3) < 3);
}

- (BOOL)is4GConnection
{
  -[MFNetworkController _initializeDataStatus](self, "_initializeDataStatus");
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 64, (self->_dataIndicator - 7) < 2);
}

- (BOOL)hasAlternateAdvice
{
  return self->_alternateAdviceState;
}

- (void)_setFlags:(unsigned int)a3 forReachability:(__SCNetworkReachability *)a4
{
  _BOOL4 v7;
  unsigned int v8;

  -[NSLock lock](self->_lock, "lock");
  if (self->_reachability == a4)
  {
    v7 = -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts");
    v8 = self->_flags ^ a3;
    self->_flags = a3;
    if ((v8 & 0x40000) != 0 || v7 != -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
      -[NSMutableArray makeObjectsPerformSelector:](self->_observers, "makeObjectsPerformSelector:", sel_execute);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_checkKeys:(id)a3 forStore:(__SCDynamicStore *)a4
{
  _BOOL4 v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_store == a4)
  {
    v6 = -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts");
    self->_dns = 0;
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)SCDynamicStoreCopyValue(a4, v7);

      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CE8C28]);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          self->_dns = objc_msgSend(v9, "count") != 0;

        }
      }

    }
    if (v6 != -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
      -[NSMutableArray makeObjectsPerformSelector:](self->_observers, "makeObjectsPerformSelector:", sel_execute);
  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)_handleWiFiNotification:(unsigned int)a3
{
  if ((a3 & 1) != 0)
  {
    -[NSLock lock](self->_lock, "lock");
    self->_isWiFiEnabled = _IsWiFiEnabled(self->_wiFiPreferences);
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (id)_networkAssertionWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = a3;
  v4 = _CTServerConnectionCreateWithIdentifier();
  if (v4)
  {
    v5 = (const void *)v4;
    _CTServerConnectionAddToRunLoop();
    if ((unint64_t)_CTServerConnectionPacketContextAssertionCreate() >> 32)
    {
      MFLogGeneral();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[MFNetworkController _networkAssertionWithIdentifier:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    }
    CFRelease(v5);
  }
  v14 = 0;

  return v14;
}

+ (id)networkAssertionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_networkAssertionWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyCarrierBundleValue:(id)a3
{
  id v4;
  CoreTelephonyClient *ctc;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CoreTelephonyClient *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v28;
  id v29;

  v4 = a3;
  ctc = self->_ctc;
  v29 = 0;
  -[CoreTelephonyClient getSubscriptionInfoWithError:](ctc, "getSubscriptionInfoWithError:", &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;
  if (v7)
  {
    v8 = v7;
    MFLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MFNetworkController copyCarrierBundleValue:].cold.2((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = 0;
  }
  else
  {
    objc_msgSend(v6, "subscriptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ef_firstObjectPassingTest:", &__block_literal_global_40);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
      v19 = self->_ctc;
      v28 = 0;
      v16 = (void *)-[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](v19, "copyCarrierBundleValue:key:bundleType:error:", v9, v4, v18, &v28);
      v8 = v28;
      if (v8)
      {
        MFLogGeneral();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[MFNetworkController copyCarrierBundleValue:].cold.1((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);

      }
    }
    else
    {
      v16 = 0;
      v8 = 0;
    }
  }

  return v16;
}

uint64_t __46__MFNetworkController_copyCarrierBundleValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "userDataPreferred");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)addNetworkObserverBlock:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _MFNetworkObserver *v8;
  NSMutableArray *observers;
  NSMutableArray *v10;
  NSMutableArray *v11;

  v6 = a4;
  v7 = a3;
  v8 = -[_MFNetworkObserver initWithBlock:queue:]([_MFNetworkObserver alloc], "initWithBlock:queue:", v7, v6);

  -[NSLock lock](self->_lock, "lock");
  observers = self->_observers;
  if (!observers)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->_observers;
    self->_observers = v10;

    observers = self->_observers;
  }
  -[NSMutableArray addObject:](observers, "addObject:", v8);
  -[NSLock unlock](self->_lock, "unlock");
  return v8;
}

- (void)removeNetworkObserver:(id)a3
{
  NSLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", v5);

  -[NSLock unlock](self->_lock, "unlock");
}

- (EFObservable)networkObservable
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MFNetworkController_networkObservable__block_invoke;
  v3[3] = &unk_1E81CB528;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D1EF28], "observableWithBlock:", v3);
  return (EFObservable *)(id)objc_claimAutoreleasedReturnValue();
}

id __40__MFNetworkController_networkObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __40__MFNetworkController_networkObservable__block_invoke_2;
  v19[3] = &unk_1E81CB4D8;
  objc_copyWeak(&v22, &location);
  v7 = v3;
  v20 = v7;
  v8 = v4;
  v21 = v8;
  v9 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C80D38];
  objc_msgSend(v5, "addNetworkObserverBlock:queue:", v19, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __40__MFNetworkController_networkObservable__block_invoke_3;
  v16[3] = &unk_1E81CB500;
  objc_copyWeak(&v18, &location);
  v12 = v11;
  v17 = v12;
  objc_msgSend(v8, "addCancelationBlock:", v16);
  v13 = v17;
  v14 = v8;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v14;
}

void __40__MFNetworkController_networkObservable__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", WeakRetained);
    WeakRetained = v3;
  }

}

void __40__MFNetworkController_networkObservable__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeNetworkObserver:", *(_QWORD *)(a1 + 32));

}

- (EFObservable)wifiObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[MFNetworkController networkObservable](self, "networkObservable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startWith:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "map:", &__block_literal_global_48);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distinctUntilChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v7;
}

uint64_t __37__MFNetworkController_wifiObservable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isFatPipe"));
}

- (void)_updateWifiClientType
{
  int v2;

  v2 = -[NSMutableSet count](self->_backgroundWifiClients, "count") != 0;
  if (WiFiManagerClientGetType() != v2)
    WiFiManagerClientSetType();
}

- (void)addBackgroundWifiClient:(id)a3
{
  NSLock *lock;
  id v5;

  if (a3)
  {
    lock = self->_lock;
    v5 = a3;
    -[NSLock lock](lock, "lock");
    -[NSMutableSet addObject:](self->_backgroundWifiClients, "addObject:", v5);

    -[MFNetworkController _updateWifiClientType](self, "_updateWifiClientType");
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)removeBackgroundWifiClient:(id)a3
{
  NSLock *lock;
  id v5;

  if (a3)
  {
    lock = self->_lock;
    v5 = a3;
    -[NSLock lock](lock, "lock");
    -[NSMutableSet removeObject:](self->_backgroundWifiClients, "removeObject:", v5);

    -[MFNetworkController _updateWifiClientType](self, "_updateWifiClientType");
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)_carrierBundleDidChange
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MFNetworkController__carrierBundleDidChange__block_invoke;
  block[3] = &unk_1E81CB468;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __46__MFNetworkController__carrierBundleDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MFCarrierBundleChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)connectionActivationError:(id)a3 connection:(int)a4 error:(int)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  objc_msgSend(v8, "userDataPreferred");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!a4 && v10)
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412802;
      v13 = v8;
      v14 = 1024;
      v15 = 0;
      v16 = 1024;
      v17 = a5;
      _os_log_impl(&dword_1C8839000, v11, OS_LOG_TYPE_DEFAULT, "#Network failed to bring up data context (context: %@, connection: %u, error: %d", (uint8_t *)&v12, 0x18u);
    }

  }
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  -[MFNetworkController _carrierBundleDidChange](self, "_carrierBundleDidChange");
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v4, "slotID");
    _os_log_impl(&dword_1C8839000, v5, OS_LOG_TYPE_DEFAULT, "#Network preferred data sim was changed to slot %lu", (uint8_t *)&v6, 0xCu);
  }

}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  NSObject *dataStatusQueue;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  dataStatusQueue = self->_dataStatusQueue;
  v7 = a3;
  dispatch_assert_queue_V2(dataStatusQueue);
  objc_msgSend(v7, "userDataPreferred");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v8, "BOOLValue");
  if ((_DWORD)v7)
    -[MFNetworkController _setDataStatus_nts:](self, "_setDataStatus_nts:", v9);

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CA7818]))
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v6, "slotID");
      _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_DEFAULT, "#Network SIM is now ready (slot %lu)", (uint8_t *)&v8, 0xCu);
    }

    -[MFNetworkController _carrierBundleDidChange](self, "_carrierBundleDidChange");
  }

}

- (void)_updateActiveCalls
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  int v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CXCallObserver calls](self->_callObserver, "calls", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasEnded") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  MFLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = v6;
    _os_log_impl(&dword_1C8839000, v9, OS_LOG_TYPE_DEFAULT, "#Network %d active calls", buf, 8u);
  }

  self->_activeCalls = v6;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  -[MFNetworkController _updateActiveCalls](self, "_updateActiveCalls");
}

- (id)copyDiagnosticInformation
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t dataIndicator;
  const __CFString *v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NSLock lock](self->_lock, "lock");
  objc_msgSend(v3, "appendString:", CFSTR("\n==== Network Controller State ====\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    reachability flags: 0x%02x\n"), self->_flags);
  if (self->_dns)
    v4 = "YES";
  else
    v4 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("    has DNS: %s\n"), v4);
  if (self->_isWiFiEnabled)
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("    wifi enabled: %s\n"), v5);
  if (self->_cellularDataAvailable)
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("    has cell data: %s\n"), v6);
  dataIndicator = self->_dataIndicator;
  if (dataIndicator > 0xC)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E81CB588[dataIndicator];
  objc_msgSend(v3, "appendFormat:", CFSTR("    data status indicator: %@\n"), v8);
  if (self->_isRoamingAllowed)
    v9 = "YES";
  else
    v9 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("    roaming allowed: %s\n"), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("    calls: %lu\n"), self->_activeCalls);
  objc_msgSend(v3, "appendFormat:", CFSTR("    background wifi clients: %lu\n"), -[NSMutableSet count](self->_backgroundWifiClients, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    core telephony client: %p\n"), self->_ctc);
  -[NSLock unlock](self->_lock, "unlock");
  -[MFNetworkController _initializeDataStatus](self, "_initializeDataStatus");
  objc_msgSend(v3, "appendFormat:", CFSTR("    cellular data plans:\n"));
  -[CoreTelephonyClient getSubscriptionInfoWithError:](self->_ctc, "getSubscriptionInfoWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v10, "subscriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v3, "appendFormat:", CFSTR("        %@\n"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  return v3;
}

- (void)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(void *)a3
{
  self->_wifiManager = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_dataStatusQueue, 0);
  objc_storeStrong((id *)&self->_ctc, 0);
  objc_storeStrong((id *)&self->_prefsQueue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_backgroundWifiClients, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __44__MFNetworkController__initializeDataStatus__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1C8839000, a1, a3, "#Network failed to find data-preferred context", a5, a6, a7, a8, 0);
}

void __44__MFNetworkController__initializeDataStatus__block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C8839000, log, OS_LOG_TYPE_ERROR, "#Network failed to get data status for context %@ with error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_8();
}

- (void)_networkAssertionWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1C8839000, a1, a3, "#Network failed to aquire network assertion", a5, a6, a7, a8, 0);
}

- (void)copyCarrierBundleValue:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, a2, a3, "#Network copyCarrierBundleValue returned error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)copyCarrierBundleValue:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, a2, a3, "#Network could not get subscription info: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

@end
