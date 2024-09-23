@implementation MFNetworkController

uint64_t __53__MFNetworkController_addNetworkObserverBlock_queue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__MFNetworkController__initializeDataStatus__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "userDataPreferred");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (void)performExecuteOnObservers
{
  id v2;

  objc_msgSend(a1, "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performWhileLocked:", &__block_literal_global_17_1);

}

+ (id)addNetworkObserverBlock:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _MFNetworkObserver *v8;
  void *v9;
  _MFNetworkObserver *v10;
  _QWORD v12[4];
  _MFNetworkObserver *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[_MFNetworkObserver initWithBlock:queue:]([_MFNetworkObserver alloc], "initWithBlock:queue:", v6, v7);
  objc_msgSend(a1, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__MFNetworkController_addNetworkObserverBlock_queue___block_invoke;
  v12[3] = &unk_1E4E8E340;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "performWhileLocked:", v12);

  return v10;
}

+ (id)observers
{
  if (observers_onceToken != -1)
    dispatch_once(&observers_onceToken, &__block_literal_global_13);
  return (id)observers_observers;
}

+ (MFNetworkController)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MFNetworkController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (MFNetworkController *)(id)sharedInstance__sharedInstance;
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

- (BOOL)isNetworkUp
{
  _BOOL8 v3;

  -[MFLock lock](self->_lock, "lock");
  v3 = -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts");
  -[MFLock unlock](self->_lock, "unlock");
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 2, v3);
}

- (BOOL)isFatPipe
{
  _BOOL8 v3;

  -[MFLock lock](self->_lock, "lock");
  if (-[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
    v3 = (self->_flags & 0x40000) == 0;
  else
    v3 = 0;
  -[MFLock unlock](self->_lock, "unlock");
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 4, v3);
}

- (int64_t)dataStatus
{
  int64_t v3;
  NSObject *prefsQueue;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[MFNetworkController _initializeDataStatus](self, "_initializeDataStatus");
  -[MFLock lock](self->_lock, "lock");
  if (-[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
  {
    if (self->_hasWiFiCapability && (self->_flags & 0x40000) == 0)
      goto LABEL_14;
    v3 = 6;
  }
  else
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    prefsQueue = self->_prefsQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__MFNetworkController_dataStatus__block_invoke;
    v7[3] = &unk_1E4E8B708;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(prefsQueue, v7);
    if (*((_BYTE *)v9 + 24))
    {
      v5 = 0;
      v3 = 1;
    }
    else if (!self->_hasWiFiCapability || self->_hasCellDataCapability || self->_isWiFiEnabled)
    {
      v5 = 1;
      v3 = 6;
    }
    else
    {
      v5 = 0;
      v3 = 3;
    }
    _Block_object_dispose(&v8, 8);
    if ((v5 & 1) == 0)
      goto LABEL_15;
  }
  if (self->_hasCellDataCapability)
  {
    if (self->_cellularDataAvailable)
    {
LABEL_14:
      v3 = 0;
      goto LABEL_15;
    }
    if (CTCellularDataPlanGetIsEnabled())
    {
      if (self->_isRoamingAllowed)
      {
        if (self->_activeCalls)
          v3 = 5;
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
  }
LABEL_15:
  -[MFLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)_isNetworkUp_nts
{
  return (self->_flags & 6) == 2 && self->_hasDNS;
}

- (void)_initializeDataStatus
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
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#Network failed to get data status for context %@ with error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

uint64_t __48__MFNetworkController_performExecuteOnObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "makeObjectsPerformSelector:", sel_execute);
}

id __37__MFNetworkController_wifiObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isFatPipe"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  objc_msgSend(v5, "map:", &__block_literal_global_54);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distinctUntilChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v7;
}

- (EFObservable)networkObservable
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MFNetworkController_networkObservable__block_invoke;
  v3[3] = &unk_1E4E8E390;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D1EF28], "observableWithBlock:", v3);
  return (EFObservable *)(id)objc_claimAutoreleasedReturnValue();
}

void __32__MFNetworkController_observers__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D1EEF0]);
  v3 = (id)objc_opt_new();
  v1 = objc_msgSend(v0, "initWithObject:");
  v2 = (void *)observers_observers;
  observers_observers = v1;

}

void __34__MFNetworkController_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;

}

id __40__MFNetworkController_networkObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__MFNetworkController_networkObservable__block_invoke_2;
  v14[3] = &unk_1E4E8E368;
  objc_copyWeak(&v17, &location);
  v6 = v3;
  v15 = v6;
  v7 = v4;
  v16 = v7;
  +[MFNetworkController addNetworkObserverBlock:queue:](MFNetworkController, "addNetworkObserverBlock:queue:", v14, MEMORY[0x1E0C80D38]);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __40__MFNetworkController_networkObservable__block_invoke_3;
  v12[3] = &unk_1E4E88DC8;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v7, "addCancelationBlock:", v12);
  v9 = v13;
  v10 = v7;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __37__MFNetworkController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v1;

  v3 = +[MFNetworkController addNetworkObserverBlock:queue:](MFNetworkController, "addNetworkObserverBlock:queue:", &__block_literal_global_52, MEMORY[0x1E0C80D38]);
  return objc_msgSend((id)sharedInstance__sharedInstance, "_registerStateCaptureHandler");
}

- (MFNetworkController)init
{
  MFNetworkController *v2;
  MFNetworkController *v3;
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  MFLock *lock;
  CFRunLoopRef Main;
  const __CFAllocator *v12;
  const __SCNetworkReachability *v13;
  const void *(__cdecl *v14)(const void *);
  void (__cdecl *v15)(const void *);
  CFStringRef (__cdecl *v16)(const void *);
  const __CFString *v17;
  SCDynamicStoreRef v18;
  const __CFArray *v19;
  __CFRunLoopSource *RunLoopSource;
  NSObject *v21;
  NSObject *v22;
  __CFBundle *MainBundle;
  CFStringRef Identifier;
  const __CFString *v25;
  const char *v26;
  uint64_t v27;
  const __SCPreferences *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *dataStatusQueue;
  uint64_t v31;
  CoreTelephonyClient *ctc;
  dispatch_queue_t v33;
  OS_dispatch_queue *prefsQueue;
  uint64_t v35;
  RadiosPreferences *radiosPreferences;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  SCPreferencesContext v41;
  uint8_t v42[8];
  SCDynamicStoreContext context;
  SCNetworkReachabilityContext buf;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)MFNetworkController;
  v2 = -[MFNetworkController init](&v45, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  v2->_dataStatusInitializerLock._os_unfair_lock_opaque = 0;
  +[MFNetworkController signpostLog](MFNetworkController, "signpostLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFNetworkController signpostLog](MFNetworkController, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  v7 = v4;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.version) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MFNetworkControllerInit", ", (uint8_t *)&buf, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("com.apple.message.mfnetworkcontroller"), v3);
  lock = v3->_lock;
  v3->_lock = (MFLock *)v9;

  v3->_hasCellDataCapability = MGGetBoolAnswer();
  v3->_hasWiFiCapability = MGGetBoolAnswer();
  Main = CFRunLoopGetMain();
  v3->_rl = Main;
  CFRetain(Main);
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v13 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &init_sa);
  v3->_reachability = v13;
  SCNetworkReachabilityGetFlags(v13, &v3->_flags);
  buf.version = 0;
  buf.info = v3;
  v14 = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
  v15 = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
  buf.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
  buf.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
  v16 = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E0C98350];
  buf.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E0C98350];
  SCNetworkReachabilitySetCallback(v3->_reachability, (SCNetworkReachabilityCallBack)_NetworkReachabilityCallBack, &buf);
  v17 = (const __CFString *)*MEMORY[0x1E0C9B270];
  SCNetworkReachabilityScheduleWithRunLoop(v3->_reachability, v3->_rl, (CFStringRef)*MEMORY[0x1E0C9B270]);
  context.version = 0;
  context.info = v3;
  context.retain = v14;
  context.release = v15;
  context.copyDescription = v16;
  v18 = SCDynamicStoreCreate(v12, CFSTR("com.apple.message.mfnetworkcontroller"), (SCDynamicStoreCallBack)_DynamicStoreCallBack, &context);
  v3->_store = v18;
  if (v18)
  {
    v41.version = 0xAAAAAAAAAAAAAAAALL;
    v41.version = (CFIndex)SCDynamicStoreKeyCreateNetworkGlobalEntity(v12, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B70]);
    v19 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v41, 1);
    -[MFNetworkController _checkKeys:forStore:](v3, "_checkKeys:forStore:", v19, v3->_store);
    SCDynamicStoreSetNotificationKeys(v3->_store, v19, 0);
    RunLoopSource = SCDynamicStoreCreateRunLoopSource(v12, v3->_store, 0);
    v3->_store_source = RunLoopSource;
    if (RunLoopSource)
    {
      CFRunLoopAddSource(v3->_rl, RunLoopSource, v17);
    }
    else
    {
      MFLogGeneral();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "#Warning #Network SCDynamicStoreCreateRunLoopSource failed - returned NULL.", v42, 2u);
      }

    }
  }
  else
  {
    MFLogGeneral();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41.version) = 0;
      _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "#Warning #Network Could not create SCDynamicStore", (uint8_t *)&v41, 2u);
    }

  }
  if (v3->_hasWiFiCapability)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle && (Identifier = CFBundleGetIdentifier(MainBundle), (v25 = Identifier) != 0))
    {
      CFRetain(Identifier);
    }
    else
    {
      v26 = getprogname();
      v27 = getpid();
      v25 = CFStringCreateWithFormat(v12, 0, CFSTR("%s (%d)"), v26, v27);
      if (!v25)
        goto LABEL_21;
    }
    v28 = SCPreferencesCreate(v12, v25, CFSTR("com.apple.wifi.plist"));
    v3->_wiFiPreferences = v28;
    v41.version = 0;
    memset(&v41.retain, 0, 24);
    v41.info = v3;
    SCPreferencesSetCallback(v28, (SCPreferencesCallBack)_WiFiCallBack, &v41);
    SCPreferencesScheduleWithRunLoop(v3->_wiFiPreferences, v3->_rl, v17);
    v3->_isWiFiEnabled = _IsWiFiEnabled(v3->_wiFiPreferences);
    CFRelease(v25);
  }
LABEL_21:
  v29 = dispatch_queue_create("com.apple.message.MFNetworkController.dataStatus", 0);
  dataStatusQueue = v3->_dataStatusQueue;
  v3->_dataStatusQueue = (OS_dispatch_queue *)v29;

  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v3->_dataStatusQueue);
  ctc = v3->_ctc;
  v3->_ctc = (CoreTelephonyClient *)v31;

  -[CoreTelephonyClient setDelegate:](v3->_ctc, "setDelegate:", v3);
  -[MFNetworkController _setupSymptoms](v3, "_setupSymptoms");
  v33 = dispatch_queue_create("com.apple.mail.radioPreferences", 0);
  prefsQueue = v3->_prefsQueue;
  v3->_prefsQueue = (OS_dispatch_queue *)v33;

  v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9B8]), "initWithQueue:", v3->_prefsQueue);
  radiosPreferences = v3->_radiosPreferences;
  v3->_radiosPreferences = (RadiosPreferences *)v35;

  -[RadiosPreferences setDelegate:](v3->_radiosPreferences, "setDelegate:", v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObserver:selector:name:object:", v3, sel__resetDataStatusInitialized, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

  v38 = v8;
  v39 = v38;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    LOWORD(v41.version) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v39, OS_SIGNPOST_INTERVAL_END, v6, "MFNetworkControllerInit", ", (uint8_t *)&v41, 2u);
  }

  return v3;
}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MFNetworkController_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1)
    dispatch_once(&signpostLog_onceToken_0, block);
  return (id)signpostLog_log_0;
}

- (void)_setupSymptoms
{
  void *v3;
  int *p_symptomsToken;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__MFNetworkController__setupSymptoms__block_invoke;
  aBlock[3] = &unk_1E4E8E2F8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  p_symptomsToken = &self->_symptomsToken;
  if (notify_register_dispatch("com.apple.symptoms.hasAlternateAdvice", p_symptomsToken, MEMORY[0x1E0C80D38], v3))
    *p_symptomsToken = -1;

}

- (void)_checkKeys:(id)a3 forStore:(__SCDynamicStore *)a4
{
  _BOOL4 v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MFLock lock](self->_lock, "lock");
  if (self->_store == a4)
  {
    v6 = -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts");
    self->_hasDNS = 0;
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
          self->_hasDNS = objc_msgSend(v9, "count") != 0;

        }
      }

    }
    if (v6 != -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
      +[MFNetworkController performExecuteOnObservers](MFNetworkController, "performExecuteOnObservers");
  }
  -[MFLock unlock](self->_lock, "unlock");

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
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "#Network setting data status: %@", (uint8_t *)&v7, 0xCu);
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

- (void)_updateActiveCalls
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CXCallObserver calls](self->_callObserver, "calls", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "hasEnded") ^ 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v5);
  }

  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "#Network %d active calls", buf, 8u);
  }

  self->_activeCalls = v4;
}

- (void)_registerStateCaptureHandler
{
  id v3;
  EFCancelable *v4;
  EFCancelable *stateCancelable;
  id v6;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v6, &location);
  EFLogRegisterStateCaptureBlock();
  v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  stateCancelable = self->_stateCancelable;
  self->_stateCancelable = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

void __37__MFNetworkController_sharedInstance__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85B0E24]();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("NetworkConfigurationDidChangeNotification"), sharedInstance__sharedInstance);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification:", v1);

  objc_autoreleasePoolPop(v0);
}

- (void)_resetDataStatusInitialized
{
  os_unfair_lock_s *p_dataStatusInitializerLock;

  p_dataStatusInitializerLock = &self->_dataStatusInitializerLock;
  os_unfair_lock_lock(&self->_dataStatusInitializerLock);
  self->_dataStatusInitialized = 0;
  os_unfair_lock_unlock(p_dataStatusInitializerLock);
}

void __37__MFNetworkController__setupSymptoms__block_invoke(uint64_t a1, int token)
{
  void *v3;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("NetworkSymptomsHasAlternativeAdvice"), *(_QWORD *)(a1 + 32));

  }
}

- (void)dealloc
{
  __SCPreferences *wiFiPreferences;
  __SCPreferences *v4;
  __CFRunLoop *Main;
  int symptomsToken;
  const char *v7;
  int v8;
  objc_super v9;

  -[EFCancelable cancel](self->_stateCancelable, "cancel");
  wiFiPreferences = self->_wiFiPreferences;
  if (wiFiPreferences)
  {
    SCPreferencesSetCallback(wiFiPreferences, 0, 0);
    v4 = self->_wiFiPreferences;
    Main = CFRunLoopGetMain();
    SCPreferencesUnscheduleFromRunLoop(v4, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);
    CFRelease(self->_wiFiPreferences);
    self->_wiFiPreferences = 0;
  }
  if (self->_store)
  {
    v7 = "NULL == _store";
    v8 = 396;
    goto LABEL_10;
  }
  if (self->_reachability)
  {
    v7 = "NULL == _reachability";
    v8 = 397;
LABEL_10:
    __assert_rtn("-[MFNetworkController dealloc]", "MFNetworkController.m", v8, v7);
  }
  symptomsToken = self->_symptomsToken;
  if (symptomsToken != -1)
    notify_cancel(symptomsToken);
  v9.receiver = self;
  v9.super_class = (Class)MFNetworkController;
  -[MFNetworkController dealloc](&v9, sel_dealloc);
}

uint64_t __33__MFNetworkController_dataStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "airplaneMode");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isDataAvailable
{
  return -[MFNetworkController _simulationOverrideForType:actualValue:](self, "_simulationOverrideForType:actualValue:", 1, -[MFNetworkController dataStatus](self, "dataStatus") == 0);
}

- (BOOL)isOnWWAN
{
  uint64_t v3;

  -[MFLock lock](self->_lock, "lock");
  if (-[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
    v3 = (BYTE2(self->_flags) >> 2) & 1;
  else
    v3 = 0;
  -[MFLock unlock](self->_lock, "unlock");
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

- (int64_t)transportType
{
  int v4;

  if (!-[MFNetworkController isNetworkUp](self, "isNetworkUp"))
    return 0;
  if (-[MFNetworkController isFatPipe](self, "isFatPipe"))
    return 2;
  if (-[MFNetworkController isOnWWAN](self, "isOnWWAN")
    && (v4 = -[MFNetworkController dataIndicator](self, "dataIndicator") - 1, v4 <= 0xE))
  {
    return qword_1A5999A08[v4];
  }
  else
  {
    return 0;
  }
}

- (void)_setFlags:(unsigned int)a3 forReachability:(__SCNetworkReachability *)a4
{
  _BOOL4 v7;
  unsigned int v8;

  -[MFLock lock](self->_lock, "lock");
  if (self->_reachability == a4)
  {
    v7 = -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts");
    v8 = self->_flags ^ a3;
    self->_flags = a3;
    if ((v8 & 0x40000) != 0 || v7 != -[MFNetworkController _isNetworkUp_nts](self, "_isNetworkUp_nts"))
      +[MFNetworkController performExecuteOnObservers](MFNetworkController, "performExecuteOnObservers");
  }
  -[MFLock unlock](self->_lock, "unlock");
}

- (void)_handleWiFiNotification:(unsigned int)a3
{
  if ((a3 & 1) != 0)
  {
    -[MFLock lock](self->_lock, "lock");
    self->_isWiFiEnabled = _IsWiFiEnabled(self->_wiFiPreferences);
    -[MFLock unlock](self->_lock, "unlock");
  }
}

- (id)_networkAssertionWithIdentifier:(id)a3
{
  id v3;
  const void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  v4 = (const void *)_CTServerConnectionCreateWithIdentifier();
  if (v4)
  {
    _CTServerConnectionAddToRunLoop();
    if ((unint64_t)_CTServerConnectionPacketContextAssertionCreate() >> 32)
    {
      MFLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[MFNetworkController _networkAssertionWithIdentifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    }
    CFRelease(v4);
  }
  v13 = 0;

  return v13;
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
    goto LABEL_4;
  }
  objc_msgSend(v6, "subscriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ef_firstObjectPassingTest:", &__block_literal_global_47);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v8 = 0;
LABEL_4:
    v16 = 0;
    goto LABEL_11;
  }
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
LABEL_11:

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

+ (void)removeNetworkObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MFNetworkController_removeNetworkObserver___block_invoke;
  v7[3] = &unk_1E4E8E340;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performWhileLocked:", v7);

}

uint64_t __45__MFNetworkController_removeNetworkObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

void __40__MFNetworkController_networkObservable__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", WeakRetained);

}

uint64_t __40__MFNetworkController_networkObservable__block_invoke_3(uint64_t a1)
{
  return +[MFNetworkController removeNetworkObserver:](MFNetworkController, "removeNetworkObserver:", *(_QWORD *)(a1 + 32));
}

- (void)_carrierBundleDidChange
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MFNetworkController__carrierBundleDidChange__block_invoke;
  block[3] = &unk_1E4E88DC8;
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
  char v10;
  char v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  objc_msgSend(v8, "userDataPreferred");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = v10 ^ 1;
  if (a4)
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412802;
      v14 = v8;
      v15 = 1024;
      v16 = 0;
      v17 = 1024;
      v18 = a5;
      _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "#Network failed to bring up data context (context: %@, connection: %u, error: %d", (uint8_t *)&v13, 0x18u);
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
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "#Network preferred data sim was changed to slot %lu", (uint8_t *)&v6, 0xCu);
  }

}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  objc_msgSend(v9, "userDataPreferred");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
    -[MFNetworkController _setDataStatus_nts:](self, "_setDataStatus_nts:", v6);

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA7818]))
  {
    MFLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = objc_msgSend(v6, "slotID");
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "#Network SIM is now ready (slot %lu)", (uint8_t *)&v9, 0xCu);
    }

    -[MFNetworkController _carrierBundleDidChange](self, "_carrierBundleDidChange");
  }

}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  -[MFNetworkController _updateActiveCalls](self, "_updateActiveCalls");
}

id __51__MFNetworkController__registerStateCaptureHandler__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "dataStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Data Status"));

  objc_msgSend(WeakRetained[6], "lock");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%02x"), *((unsigned int *)WeakRetained + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("Reachability Flags"));

  if (*((_BYTE *)WeakRetained + 68))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("DNS"));
  if (*((_BYTE *)WeakRetained + 90))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("WiFi Enabled"));
  if (*((_BYTE *)WeakRetained + 136))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("Cell Data"));
  v8 = *((int *)WeakRetained + 37);
  if (v8 > 0xC)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E4E8E418[v8];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("Data Status Indicator"));
  if (*((_BYTE *)WeakRetained + 91))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("Roaming Allowed"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", WeakRetained[9]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("Active Calls"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), WeakRetained[15]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("Core Telephony Client"));

  objc_msgSend(WeakRetained[6], "unlock");
  return v2;
}

- (int)dataIndicator
{
  return self->_dataIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStatusQueue, 0);
  objc_storeStrong((id *)&self->_ctc, 0);
  objc_storeStrong((id *)&self->_prefsQueue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_stateCancelable, 0);
}

- (void)_networkAssertionWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, a1, a3, "#Network failed to aquire network assertion", a5, a6, a7, a8, 0);
}

- (void)copyCarrierBundleValue:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "#Network copyCarrierBundleValue returned error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)copyCarrierBundleValue:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "#Network could not get subscription info: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
