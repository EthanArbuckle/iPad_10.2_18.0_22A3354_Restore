@implementation MOOnboardingAndSettingsManager

- (MOOnboardingAndSettingsManager)init
{
  NSObject *v3;
  MOOnboardingAndSettingsManager *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *proxyQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *cacheQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *clientQueue;
  uint64_t v17;
  NSMutableDictionary *stateCache;
  uint64_t v19;
  NSLock *proxyLock;
  uint64_t v21;
  MOSettingsManagerDelegate *settingsManagerDelegate;
  uint64_t v23;
  MOOnboardingManagerDelegate *onboardingManagerDelegate;
  MODefaultsManager *v25;
  MODefaultsManager *defaultManager;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v28;
  MOConnection *v29;
  void *v30;
  uint64_t v31;
  id interruptHandler;
  void *v33;
  NSObject *v34;
  MOOnboardingAndSettingsManager *v35;
  objc_super v37;
  uint8_t buf[16];

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_DEFAULT, "new MOOnboardingAndSettingsManager", buf, 2u);
  }

  v37.receiver = self;
  v37.super_class = (Class)MOOnboardingAndSettingsManager;
  v4 = -[MOOnboardingAndSettingsManager init](&v37, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("MOOnboardingAndSettingsManager", v5);
    queue = v4->queue;
    v4->queue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("MOOnboardingAndSettingsManagerProxy", v8);
    proxyQueue = v4->proxyQueue;
    v4->proxyQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("MOOnboardingAndSettingsManagerCache", v11);
    cacheQueue = v4->cacheQueue;
    v4->cacheQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("MOOnboardingAndSettingsManagerClient", v14);
    clientQueue = v4->clientQueue;
    v4->clientQueue = (OS_dispatch_queue *)v15;

    v17 = objc_opt_new();
    stateCache = v4->stateCache;
    v4->stateCache = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    proxyLock = v4->proxyLock;
    v4->proxyLock = (NSLock *)v19;

    v21 = objc_opt_new();
    settingsManagerDelegate = v4->_settingsManagerDelegate;
    v4->_settingsManagerDelegate = (MOSettingsManagerDelegate *)v21;

    v23 = objc_opt_new();
    onboardingManagerDelegate = v4->_onboardingManagerDelegate;
    v4->_onboardingManagerDelegate = (MOOnboardingManagerDelegate *)v23;

    v25 = -[MODefaultsManager initWithSuiteName:]([MODefaultsManager alloc], "initWithSuiteName:", CFSTR("com.apple.momentsd"));
    defaultManager = v4->_defaultManager;
    v4->_defaultManager = v25;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)onEventStreamsUpdated_bounce, CFSTR("com.apple.momentsd.event-streams-updated"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v28 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v28, v4, (CFNotificationCallback)onEventStreamsUpdated_bounce, CFSTR("com.apple.momentsd.onboarding-status-updated"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v29 = -[MOConnection initWithName:]([MOConnection alloc], "initWithName:", CFSTR("MOOnboardingAndSettingsManager"));
    -[MOOnboardingAndSettingsManager setConnectionProxy:](v4, "setConnectionProxy:", v29);

    -[MOOnboardingAndSettingsManager connectionProxy](v4, "connectionProxy");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "onConnectionInterrupted");
    v31 = objc_claimAutoreleasedReturnValue();
    interruptHandler = v4->interruptHandler;
    v4->interruptHandler = (id)v31;

    +[MODiagnosticReporter defaultReporter](MODiagnosticReporter, "defaultReporter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "configureWithOnboardingAndSettingsManager:", v4);

    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2422B0000, v34, OS_LOG_TYPE_DEFAULT, "initiate client", buf, 2u);
    }

    -[MOOnboardingAndSettingsManager refreshCache](v4, "refreshCache");
    v35 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MOOnboardingAndSettingsManager;
  -[MOOnboardingAndSettingsManager dealloc](&v3, sel_dealloc);
}

- (MOOnboardingAndSettingsXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  MOOnboardingAndSettingsXPCProtocol *v22;
  MOOnboardingAndSettingsXPCProtocol *proxyIvar;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  id buf[2];

  -[NSLock lock](self->proxyLock, "lock");
  if (!self->_proxyIvar)
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_DEFAULT, "Preparing new proxy", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25722DF50);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getOnboardingFlowCompletionStatusWithHandler_, 0, 1);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setOnboardingFlowCompletionStatus_, 0, 0);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getStateForSetting_withHandler_, 0, 1);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getStateForSettingFast_withHandler_, 0, 1);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_setState_forSetting_, 0, 0);

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getDiagnosticReporterConfiguration_, 0, 0);

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getApplicationsWithDataAccess_, 0, 0);

    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_registerApplicationsForDataAccess_, 0, 0);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.momentsd"), 0);
    objc_msgSend(v20, "setRemoteObjectInterface:", v4);
    objc_initWeak(buf, self);
    objc_initWeak(&location, v20);
    v21 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __39__MOOnboardingAndSettingsManager_proxy__block_invoke;
    v27[3] = &unk_25133F4B8;
    objc_copyWeak(&v28, buf);
    objc_copyWeak(&v29, &location);
    objc_msgSend(v20, "setInterruptionHandler:", v27);
    v25[0] = v21;
    v25[1] = 3221225472;
    v25[2] = __39__MOOnboardingAndSettingsManager_proxy__block_invoke_104;
    v25[3] = &unk_25133F4E0;
    objc_copyWeak(&v26, buf);
    objc_msgSend(v20, "setInvalidationHandler:", v25);
    objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
    v22 = (MOOnboardingAndSettingsXPCProtocol *)objc_claimAutoreleasedReturnValue();
    proxyIvar = self->_proxyIvar;
    self->_proxyIvar = v22;

    objc_storeStrong((id *)&self->connection, v20);
    -[NSXPCConnection resume](self->connection, "resume");
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    objc_destroyWeak(buf);

  }
  -[NSLock unlock](self->proxyLock, "unlock");
  return self->_proxyIvar;
}

void __39__MOOnboardingAndSettingsManager_proxy__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
  NSObject *v5;
  __int16 v6[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[7], "lock");
  v3 = WeakRetained[9];
  WeakRetained[9] = 0;

  objc_msgSend(WeakRetained[7], "unlock");
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "invalidate");

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 0;
    _os_log_impl(&dword_2422B0000, v5, OS_LOG_TYPE_DEFAULT, "Connection Interrupted", (uint8_t *)v6, 2u);
  }

  (*((void (**)(void))WeakRetained[8] + 2))();
}

void __39__MOOnboardingAndSettingsManager_proxy__block_invoke_104(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  NSObject *v3;
  __int16 v4[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[7], "lock");
  v2 = WeakRetained[9];
  WeakRetained[9] = 0;

  objc_msgSend(WeakRetained[7], "unlock");
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 0;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_DEFAULT, "Connection Invalidated", (uint8_t *)v4, 2u);
  }

}

void __39__MOOnboardingAndSettingsManager_proxy__block_invoke_105(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = CFSTR("Error on remote object proxy");
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);

  }
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__MOOnboardingAndSettingsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_shared;
}

void __48__MOOnboardingAndSettingsManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v1;

}

- (void)onEventStreamsUpdated
{
  NSObject *v3;
  uint8_t v4[16];

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_DEFAULT, "onEventStreamsUpdated", v4, 2u);
  }

  -[MOOnboardingAndSettingsManager refreshCache](self, "refreshCache");
}

- (void)waitForRefresh
{
  dispatch_sync((dispatch_queue_t)self->queue, &__block_literal_global_110);
}

- (void)_updateOnboardingCacheAndNotifyForKey:(id)a3 andState:(unint64_t)a4 isComplete:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NSObject *clientQueue;
  _QWORD block[6];
  BOOL v17;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->stateCache, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_onboardingManagerDelegate)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = objc_msgSend(v10, "isEqualToNumber:", v9);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->stateCache, "setObject:forKeyedSubscript:", v13, v8);

      if ((v12 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->stateCache, "setObject:forKeyedSubscript:", v10, v8);

    }
    clientQueue = self->clientQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__MOOnboardingAndSettingsManager__updateOnboardingCacheAndNotifyForKey_andState_isComplete___block_invoke;
    block[3] = &unk_25133F5A8;
    block[4] = self;
    block[5] = a4;
    v17 = a5;
    dispatch_async(clientQueue, block);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->stateCache, "setObject:forKeyedSubscript:", v14, v8);

  }
LABEL_8:

}

uint64_t __92__MOOnboardingAndSettingsManager__updateOnboardingCacheAndNotifyForKey_andState_isComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "onOnboardingFlowCompletionChange:isComplete:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_updateSettingCacheAndNotifyForKey:(id)a3 andState:(BOOL)a4 setting:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NSObject *clientQueue;
  _QWORD block[6];
  BOOL v17;

  v6 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->stateCache, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_settingsManagerDelegate)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = objc_msgSend(v10, "isEqualToNumber:", v9);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->stateCache, "setObject:forKeyedSubscript:", v13, v8);

      if ((v12 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->stateCache, "setObject:forKeyedSubscript:", v10, v8);

    }
    clientQueue = self->clientQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__MOOnboardingAndSettingsManager__updateSettingCacheAndNotifyForKey_andState_setting___block_invoke;
    block[3] = &unk_25133F5A8;
    v17 = v6;
    block[4] = self;
    block[5] = a5;
    dispatch_async(clientQueue, block);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->stateCache, "setObject:forKeyedSubscript:", v14, v8);

  }
LABEL_8:

}

uint64_t __86__MOOnboardingAndSettingsManager__updateSettingCacheAndNotifyForKey_andState_setting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "onStateChange:forSetting:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)refreshCache
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke;
  block[3] = &unk_25133F698;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  dispatch_time_t v38;
  intptr_t v39;
  BOOL v40;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD block[21];
  _QWORD v48[4];
  NSObject *v49;
  _QWORD *v50;
  uint64_t *v51;
  _QWORD v52[4];
  NSObject *v53;
  _QWORD *v54;
  uint64_t *v55;
  _QWORD v56[4];
  NSObject *v57;
  _QWORD *v58;
  uint64_t *v59;
  _QWORD v60[4];
  NSObject *v61;
  _QWORD *v62;
  uint64_t *v63;
  _QWORD v64[4];
  NSObject *v65;
  _QWORD *v66;
  uint64_t *v67;
  _QWORD v68[4];
  NSObject *v69;
  _QWORD *v70;
  uint64_t *v71;
  _QWORD v72[4];
  NSObject *v73;
  _QWORD *v74;
  uint64_t *v75;
  _QWORD v76[4];
  NSObject *v77;
  _QWORD *v78;
  uint64_t *v79;
  _QWORD v80[4];
  NSObject *v81;
  _QWORD *v82;
  uint64_t *v83;
  _QWORD v84[4];
  NSObject *v85;
  _QWORD *v86;
  uint64_t *v87;
  _QWORD v88[4];
  NSObject *v89;
  _QWORD *v90;
  _QWORD v91[4];
  NSObject *v92;
  _QWORD *v93;
  uint64_t *v94;
  _QWORD v95[4];
  NSObject *v96;
  _QWORD *v97;
  uint64_t *v98;
  _QWORD v99[4];
  NSObject *v100;
  _QWORD *v101;
  uint64_t *v102;
  _QWORD v103[4];
  NSObject *v104;
  _QWORD *v105;
  uint64_t *v106;
  _QWORD v107[4];
  NSObject *v108;
  _QWORD *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  _QWORD v115[5];
  id v116;
  _QWORD v117[5];
  id v118;
  _QWORD v119[3];
  char v120;
  _QWORD v121[3];
  char v122;
  _QWORD v123[3];
  char v124;
  _QWORD v125[3];
  char v126;
  _QWORD v127[3];
  char v128;
  _QWORD v129[3];
  char v130;
  _QWORD v131[3];
  char v132;
  _QWORD v133[3];
  char v134;
  _QWORD v135[3];
  char v136;
  _QWORD v137[3];
  char v138;
  _QWORD v139[3];
  char v140;
  _QWORD v141[3];
  char v142;
  _QWORD v143[4];
  _QWORD v144[4];
  uint8_t buf[4];
  unsigned int v146;
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  v144[0] = 0;
  v144[1] = v144;
  v144[2] = 0x2020000000;
  v144[3] = 4;
  v143[0] = 0;
  v143[1] = v143;
  v143[2] = 0x2020000000;
  v143[3] = 4;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x2020000000;
  v142 = 0;
  v139[0] = 0;
  v139[1] = v139;
  v139[2] = 0x2020000000;
  v140 = 0;
  v137[0] = 0;
  v137[1] = v137;
  v137[2] = 0x2020000000;
  v138 = 0;
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  v136 = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x2020000000;
  v134 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  v132 = 0;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x2020000000;
  v130 = 0;
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x2020000000;
  v128 = 0;
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x2020000000;
  v126 = 0;
  v123[0] = 0;
  v123[1] = v123;
  v123[2] = 0x2020000000;
  v124 = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x2020000000;
  v122 = 0;
  v119[0] = 0;
  v119[1] = v119;
  v119[2] = 0x2020000000;
  v117[2] = 0x3032000000;
  v117[3] = __Block_byref_object_copy_;
  v117[4] = __Block_byref_object_dispose_;
  v115[2] = 0x3032000000;
  v115[3] = __Block_byref_object_copy_;
  v115[4] = __Block_byref_object_dispose_;
  v113 = 0x2020000000;
  v120 = 0;
  v117[0] = 0;
  v117[1] = v117;
  v118 = 0;
  v115[0] = 0;
  v115[1] = v115;
  v116 = 0;
  v111 = 0;
  v112 = &v111;
  v114 = 1;
  v2 = 2;
  v3 = MEMORY[0x24BDAC760];
  do
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v146 = v2;
      _os_log_impl(&dword_2422B0000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing cache (%d)", buf, 8u);
    }

    *((_BYTE *)v112 + 24) = 1;
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = *(void **)(a1 + 32);
    v107[0] = v3;
    v107[1] = 3221225472;
    v107[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_111;
    v107[3] = &unk_25133F5D0;
    v109 = v144;
    v110 = &v111;
    v7 = v5;
    v108 = v7;
    objc_msgSend(v6, "_getOnboardingFlowCompletionStatusWithHandler:", v107);
    dispatch_group_enter(v7);
    v8 = *(void **)(a1 + 32);
    v103[0] = v3;
    v103[1] = 3221225472;
    v103[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_2;
    v103[3] = &unk_25133F5D0;
    v105 = v143;
    v106 = &v111;
    v9 = v7;
    v104 = v9;
    objc_msgSend(v8, "_getOnboardingFlowRefreshCompletionStatusWithHandler:", v103);
    dispatch_group_enter(v9);
    v10 = *(void **)(a1 + 32);
    v99[0] = v3;
    v99[1] = 3221225472;
    v99[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_3;
    v99[3] = &unk_25133F5F8;
    v101 = v141;
    v102 = &v111;
    v11 = v9;
    v100 = v11;
    objc_msgSend(v10, "_getStateForSetting:withHandler:", 0, v99);
    dispatch_group_enter(v11);
    v12 = *(void **)(a1 + 32);
    v95[0] = v3;
    v95[1] = 3221225472;
    v95[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_4;
    v95[3] = &unk_25133F5F8;
    v97 = v139;
    v98 = &v111;
    v13 = v11;
    v96 = v13;
    objc_msgSend(v12, "_getStateForSetting:withHandler:", 1, v95);
    dispatch_group_enter(v13);
    v14 = *(void **)(a1 + 32);
    v91[0] = v3;
    v91[1] = 3221225472;
    v91[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_5;
    v91[3] = &unk_25133F5F8;
    v93 = v137;
    v94 = &v111;
    v15 = v13;
    v92 = v15;
    objc_msgSend(v14, "_getStateForSetting:withHandler:", 2, v91);
    dispatch_group_enter(v15);
    v16 = *(void **)(a1 + 32);
    v88[0] = v3;
    v88[1] = 3221225472;
    v88[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_6;
    v88[3] = &unk_25133F620;
    v90 = v135;
    v17 = v15;
    v89 = v17;
    objc_msgSend(v16, "_getStateForSetting:withHandler:", 3, v88);
    dispatch_group_enter(v17);
    v18 = *(void **)(a1 + 32);
    v84[0] = v3;
    v84[1] = 3221225472;
    v84[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_7;
    v84[3] = &unk_25133F5F8;
    v86 = v133;
    v87 = &v111;
    v19 = v17;
    v85 = v19;
    objc_msgSend(v18, "_getStateForSetting:withHandler:", 4, v84);
    dispatch_group_enter(v19);
    v20 = *(void **)(a1 + 32);
    v80[0] = v3;
    v80[1] = 3221225472;
    v80[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_8;
    v80[3] = &unk_25133F5F8;
    v82 = v131;
    v83 = &v111;
    v21 = v19;
    v81 = v21;
    objc_msgSend(v20, "_getStateForSettingFast:withHandler:", 5, v80);
    dispatch_group_enter(v21);
    v22 = *(void **)(a1 + 32);
    v76[0] = v3;
    v76[1] = 3221225472;
    v76[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_9;
    v76[3] = &unk_25133F5F8;
    v78 = v129;
    v79 = &v111;
    v23 = v21;
    v77 = v23;
    objc_msgSend(v22, "_getStateForSettingFast:withHandler:", 11, v76);
    dispatch_group_enter(v23);
    v24 = *(void **)(a1 + 32);
    v72[0] = v3;
    v72[1] = 3221225472;
    v72[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_10;
    v72[3] = &unk_25133F5F8;
    v74 = v127;
    v75 = &v111;
    v25 = v23;
    v73 = v25;
    objc_msgSend(v24, "_getStateForSetting:withHandler:", 6, v72);
    dispatch_group_enter(v25);
    v26 = *(void **)(a1 + 32);
    v68[0] = v3;
    v68[1] = 3221225472;
    v68[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_11;
    v68[3] = &unk_25133F5F8;
    v70 = v121;
    v71 = &v111;
    v27 = v25;
    v69 = v27;
    objc_msgSend(v26, "_getStateForSetting:withHandler:", 7, v68);
    dispatch_group_enter(v27);
    v28 = *(void **)(a1 + 32);
    v64[0] = v3;
    v64[1] = 3221225472;
    v64[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_12;
    v64[3] = &unk_25133F5F8;
    v66 = v119;
    v67 = &v111;
    v29 = v27;
    v65 = v29;
    objc_msgSend(v28, "_getStateForSetting:withHandler:", 8, v64);
    dispatch_group_enter(v29);
    v30 = *(void **)(a1 + 32);
    v60[0] = v3;
    v60[1] = 3221225472;
    v60[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_13;
    v60[3] = &unk_25133F5F8;
    v62 = v125;
    v63 = &v111;
    v31 = v29;
    v61 = v31;
    objc_msgSend(v30, "_getStateForSetting:withHandler:", 9, v60);
    dispatch_group_enter(v31);
    v32 = *(void **)(a1 + 32);
    v56[0] = v3;
    v56[1] = 3221225472;
    v56[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_14;
    v56[3] = &unk_25133F5F8;
    v58 = v123;
    v59 = &v111;
    v33 = v31;
    v57 = v33;
    objc_msgSend(v32, "_getStateForSetting:withHandler:", 10, v56);
    dispatch_group_enter(v33);
    v34 = *(void **)(a1 + 32);
    v52[0] = v3;
    v52[1] = 3221225472;
    v52[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_15;
    v52[3] = &unk_25133F648;
    v54 = v117;
    v55 = &v111;
    v35 = v33;
    v53 = v35;
    objc_msgSend(v34, "getApplicationsWithDataAccess:", v52);
    dispatch_group_enter(v35);
    v36 = *(void **)(a1 + 32);
    v48[0] = v3;
    v48[1] = 3221225472;
    v48[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_16;
    v48[3] = &unk_25133F648;
    v50 = v115;
    v51 = &v111;
    v37 = v35;
    v49 = v37;
    objc_msgSend(v36, "getClientsWithDataAccess:", v48);
    v38 = dispatch_time(0, 60000000000);
    v39 = dispatch_group_wait(v37, v38);
    if (v39)
      v40 = 0;
    else
      v40 = *((_BYTE *)v112 + 24) != 0;
    *((_BYTE *)v112 + 24) = v40;

    if (*((_BYTE *)v112 + 24))
      break;
  }
  while (v2-- > 1);
  if (*((_BYTE *)v112 + 24))
  {
    v42 = *(_QWORD *)(a1 + 32);
    v43 = *(NSObject **)(v42 + 40);
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_17;
    block[3] = &unk_25133F670;
    block[4] = v42;
    block[5] = v143;
    block[6] = v144;
    block[7] = v141;
    block[8] = v139;
    block[9] = v137;
    block[10] = v135;
    block[11] = v133;
    block[12] = v131;
    block[13] = v129;
    block[14] = v127;
    block[15] = v121;
    block[16] = v119;
    block[17] = v125;
    block[18] = v123;
    block[19] = v117;
    block[20] = v115;
    dispatch_async(v43, block);
  }
  else
  {
    if (v39)
    {
      _mo_log_facility_get_os_log(MOLogFacilityPermissions);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_cold_2(v44, v45, v46);
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityPermissions);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_cold_1();
    }

  }
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(v115, 8);

  _Block_object_dispose(v117, 8);
  _Block_object_dispose(v119, 8);
  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v123, 8);
  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v127, 8);
  _Block_object_dispose(v129, 8);
  _Block_object_dispose(v131, 8);
  _Block_object_dispose(v133, 8);
  _Block_object_dispose(v135, 8);
  _Block_object_dispose(v137, 8);
  _Block_object_dispose(v139, 8);
  _Block_object_dispose(v141, 8);
  _Block_object_dispose(v143, 8);
  _Block_object_dispose(v144, 8);
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_111(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_3(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_4(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_5(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_6(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_7(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_8(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_9(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_10(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_11(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_12(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_13(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_14(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = a3;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  id v12;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;
  v12 = a3;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (a3)
    v10 = 1;
  else
    v10 = *(_BYTE *)(v9 + 24) == 0;
  v11 = !v10;
  *(_BYTE *)(v9 + 24) = v11;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  id v12;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;
  v12 = a3;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (a3)
    v10 = 1;
  else
    v10 = *(_BYTE *)(v9 + 24) == 0;
  v11 = !v10;
  *(_BYTE *)(v9 + 24) = v11;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_updateOnboardingCacheAndNotifyForKey:andState:isComplete:", CFSTR("MOStateOnboardingRefreshStatus"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateOnboardingCacheAndNotifyForKey:andState:isComplete:", CFSTR("MOStateOnboardingStatus"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingTopLevelSwitch"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingActivity"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingMedia"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), 2);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingCommunications"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), 3);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingPhotos"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), 4);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingSignificantLocation"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 5);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("kMOStateSettingSystemSignificantLocationReadOnly"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), 11);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingNearbyPeople"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24), 6);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingAlwaysPreviewItems"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24), 7);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingDiscoverableByNearbyContacts"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24), 8);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingStateOfMind"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24), 9);
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", CFSTR("MOStateSettingReflection"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24), 10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), CFSTR("MOStateApplicationsWithDataAccess"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40), CFSTR("MOStateClientsWithDataAccess"));
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2422B0000, v2, OS_LOG_TYPE_INFO, "Refreshed cache %@", (uint8_t *)&v4, 0xCu);
  }

}

+ (id)_getKeyNameForSetting:(unint64_t)a3
{
  if (a3 > 0xB)
    return 0;
  else
    return off_25133F8C0[a3];
}

- (unint64_t)getOnboardingFlowCompletionStatus
{
  NSObject *v3;
  NSObject *cacheQueue;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_INFO, "Client is retrieving onboarding status...", buf, 2u);
  }

  -[MOOnboardingAndSettingsManager waitForRefresh](self, "waitForRefresh");
  cacheQueue = self->cacheQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__MOOnboardingAndSettingsManager_getOnboardingFlowCompletionStatus__block_invoke;
  v12[3] = &unk_25133F6C0;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(cacheQueue, v12);
  v5 = (void *)v14[5];
  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = CFSTR("MOStateOnboardingStatus");
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "Retrieved cached state for key %@: %@", buf, 0x16u);

    }
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[MOOnboardingAndSettingsManager getOnboardingFlowCompletionStatus].cold.1(v7, v9, v10);
    v6 = 4;
  }

  _Block_object_dispose(&v13, 8);
  return v6;
}

void __67__MOOnboardingAndSettingsManager_getOnboardingFlowCompletionStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("MOStateOnboardingStatus"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_getOnboardingFlowCompletionStatusWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *proxyQueue;
  _QWORD v9[5];
  void (**v10)(id, uint64_t, uint64_t);
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  -[MOOnboardingAndSettingsManager defaultManager](self, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("OnboardingStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "Retrieved onboarding state from defaults: %@", buf, 0xCu);
    }

    v4[2](v4, objc_msgSend(v6, "integerValue"), 1);
  }
  else
  {
    proxyQueue = self->proxyQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke;
    v9[3] = &unk_25133F760;
    v9[4] = self;
    v10 = v4;
    dispatch_async(proxyQueue, v9);

  }
}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connectionProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_2;
  v7[3] = &unk_25133F710;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_121;
  v5[3] = &unk_25133F738;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "callBlock:onInterruption:", v7, v5);

}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_3;
  v6[3] = &unk_25133F6E8;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "getOnboardingFlowCompletionStatusWithHandler:", v6);

}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_2422B0000, v4, OS_LOG_TYPE_INFO, "Retrieved onboarding state from daemon: %@", (uint8_t *)&v6, 0xCu);

  }
}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_121(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_121_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *cacheQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_2422B0000, v5, OS_LOG_TYPE_INFO, "Setting onboarding state in cache: %@", buf, 0xCu);

  }
  cacheQueue = self->cacheQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__MOOnboardingAndSettingsManager_setOnboardingFlowCompletionStatus___block_invoke;
  v8[3] = &unk_25133F788;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(cacheQueue, v8);
}

void __68__MOOnboardingAndSettingsManager_setOnboardingFlowCompletionStatus___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_updateOnboardingCacheAndNotifyForKey:andState:isComplete:", CFSTR("MOStateOnboardingStatus"), *(_QWORD *)(a1 + 40), 1);
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_2422B0000, v2, OS_LOG_TYPE_INFO, "Passing onboarding state to daemon: %@", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__MOOnboardingAndSettingsManager_setOnboardingFlowCompletionStatus___block_invoke_122;
  v7[3] = &unk_25133F788;
  v7[4] = v4;
  v7[5] = v5;
  dispatch_async(v6, v7);
}

void __68__MOOnboardingAndSettingsManager_setOnboardingFlowCompletionStatus___block_invoke_122(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOnboardingFlowCompletionStatus:", *(_QWORD *)(a1 + 40));

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_INFO, "Completed onboarding state configuration: %@", (uint8_t *)&v5, 0xCu);

  }
}

- (unint64_t)getOnboardingFlowRefreshCompletionStatus
{
  NSObject *v3;
  NSObject *cacheQueue;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_INFO, "Client is retrieving onboarding status...", buf, 2u);
  }

  -[MOOnboardingAndSettingsManager waitForRefresh](self, "waitForRefresh");
  cacheQueue = self->cacheQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__MOOnboardingAndSettingsManager_getOnboardingFlowRefreshCompletionStatus__block_invoke;
  v12[3] = &unk_25133F6C0;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(cacheQueue, v12);
  v5 = (void *)v14[5];
  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = CFSTR("MOStateOnboardingRefreshStatus");
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "Retrieved cached state for key %@: %@", buf, 0x16u);

    }
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[MOOnboardingAndSettingsManager getOnboardingFlowRefreshCompletionStatus].cold.1(v7, v9, v10);
    v6 = 4;
  }

  _Block_object_dispose(&v13, 8);
  return v6;
}

void __74__MOOnboardingAndSettingsManager_getOnboardingFlowRefreshCompletionStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("MOStateOnboardingRefreshStatus"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_getOnboardingFlowRefreshCompletionStatusWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *proxyQueue;
  _QWORD v9[5];
  void (**v10)(id, uint64_t, uint64_t);
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  -[MOOnboardingAndSettingsManager defaultManager](self, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("OnboardingRefreshStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "Retrieved onboarding refresh state from defaults: %@", buf, 0xCu);
    }

    v4[2](v4, objc_msgSend(v6, "integerValue"), 1);
  }
  else
  {
    proxyQueue = self->proxyQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke;
    v9[3] = &unk_25133F760;
    v9[4] = self;
    v10 = v4;
    dispatch_async(proxyQueue, v9);

  }
}

void __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connectionProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_2;
  v7[3] = &unk_25133F710;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_125;
  v5[3] = &unk_25133F738;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "callBlock:onInterruption:", v7, v5);

}

void __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_3;
  v6[3] = &unk_25133F6E8;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "getOnboardingFlowRefreshCompletionStatusWithHandler:", v6);

}

void __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_2422B0000, v4, OS_LOG_TYPE_INFO, "Retrieved onboarding refresh state from daemon: %@", (uint8_t *)&v6, 0xCu);

  }
}

void __87__MOOnboardingAndSettingsManager__getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_121_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (BOOL)getStateForSetting:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *cacheQueue;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v22;
  __int128 *p_buf;
  uint8_t v24[4];
  id v25;
  __int16 v26;
  void *v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2422B0000, v6, OS_LOG_TYPE_INFO, "Client is retrieving setting %@...", (uint8_t *)&buf, 0xCu);

  }
  if (a3 == 8)
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOOnboardingAndSettingsManager getStateForSetting:].cold.3();

  }
  -[MOOnboardingAndSettingsManager waitForRefresh](self, "waitForRefresh");
  +[MOOnboardingAndSettingsManager _getKeyNameForSetting:](MOOnboardingAndSettingsManager, "_getKeyNameForSetting:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOOnboardingAndSettingsManager getStateForSetting:].cold.2(a3);

    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOOnboardingAndSettingsManager.m"), 629, CFSTR("Unhandled setting %@ (in %s:%d)"), v12, "-[MOOnboardingAndSettingsManager getStateForSetting:]", 629);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  cacheQueue = self->cacheQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__MOOnboardingAndSettingsManager_getStateForSetting___block_invoke;
  block[3] = &unk_25133F7B0;
  p_buf = &buf;
  block[4] = self;
  v14 = v9;
  v22 = v14;
  dispatch_sync(cacheQueue, block);
  v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v15)
  {
    v16 = objc_msgSend(v15, "BOOLValue");
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v24 = 138412546;
      v25 = v14;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_2422B0000, v17, OS_LOG_TYPE_INFO, "Retrieved cached state for key %@: %@", v24, 0x16u);

    }
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOOnboardingAndSettingsManager getStateForSetting:].cold.1(v19, (uint64_t)v24, v17);
    }
    LOBYTE(v16) = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __53__MOOnboardingAndSettingsManager_getStateForSetting___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_getStateForSetting:(unint64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *proxyQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  proxyQueue = self->proxyQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke;
  block[3] = &unk_25133F828;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(proxyQueue, block);

}

void __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "connectionProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_2;
  v8[3] = &unk_25133F800;
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = v4;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_133;
  v6[3] = &unk_25133F738;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "callBlock:onInterruption:", v8, v6);

}

void __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_3;
  v9[3] = &unk_25133F7D8;
  v10 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v4, "getStateForSetting:withHandler:", v5, v9);

}

void __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
    (*(void (**)(void))(a1[5] + 16))();
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_2422B0000, v4, OS_LOG_TYPE_INFO, "Retrieved setting state from daemon %@: %@", (uint8_t *)&v7, 0x16u);

  }
}

void __66__MOOnboardingAndSettingsManager__getStateForSetting_withHandler___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_121_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

- (void)_getStateForSettingFast:(unint64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *proxyQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  proxyQueue = self->proxyQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke;
  block[3] = &unk_25133F828;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(proxyQueue, block);

}

void __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "connectionProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_2;
  v8[3] = &unk_25133F800;
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = v4;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_134;
  v6[3] = &unk_25133F738;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "callBlock:onInterruption:", v8, v6);

}

void __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_3;
  v9[3] = &unk_25133F7D8;
  v10 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v4, "getStateForSettingFast:withHandler:", v5, v9);

}

void __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
    (*(void (**)(void))(a1[5] + 16))();
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_2422B0000, v4, OS_LOG_TYPE_INFO, "(Fast) Retrieved setting state from daemon %@: %@", (uint8_t *)&v7, 0x16u);

  }
}

void __70__MOOnboardingAndSettingsManager__getStateForSettingFast_withHandler___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_121_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4
{
  NSObject *v5;
  _BOOL8 v6;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *cacheQueue;
  _QWORD block[5];
  id v18;
  unint64_t v19;
  BOOL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a4 == 11)
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[MOOnboardingAndSettingsManager setState:forSetting:].cold.3();
  }
  else if (a4 == 8)
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[MOOnboardingAndSettingsManager setState:forSetting:].cold.2();
  }
  else
  {
    v6 = a3;
    +[MOOnboardingAndSettingsManager _getKeyNameForSetting:](MOOnboardingAndSettingsManager, "_getKeyNameForSetting:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MOOnboardingAndSettingsManager setState:forSetting:].cold.1(a4);

      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOOnboardingAndSettingsManager.m"), 695, CFSTR("Unhandled setting %@ (in %s:%d)"), v12, "-[MOOnboardingAndSettingsManager setState:forSetting:]", 695);

    }
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2422B0000, v13, OS_LOG_TYPE_INFO, "Setting setting state in cache: %@: %@", buf, 0x16u);

    }
    cacheQueue = self->cacheQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__MOOnboardingAndSettingsManager_setState_forSetting___block_invoke;
    block[3] = &unk_25133F850;
    block[4] = self;
    v18 = v9;
    v20 = v6;
    v19 = a4;
    v5 = v9;
    dispatch_async(cacheQueue, block);

  }
}

void __54__MOOnboardingAndSettingsManager_setState_forSetting___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[6];
  char v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_updateSettingCacheAndNotifyForKey:andState:setting:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2422B0000, v2, OS_LOG_TYPE_INFO, "Passing setting state to daemon: %@: %@", buf, 0x16u);

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MOOnboardingAndSettingsManager_setState_forSetting___block_invoke_135;
  block[3] = &unk_25133F5A8;
  v9 = *(_BYTE *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  block[4] = v5;
  block[5] = v7;
  dispatch_async(v6, block);
}

void __54__MOOnboardingAndSettingsManager_setState_forSetting___block_invoke_135(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:forSetting:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_INFO, "Completed setting state configuration: %@: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)getDiagnosticReporterConfiguration:(id)a3
{
  id v4;
  NSObject *proxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  proxyQueue = self->proxyQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke;
  v7[3] = &unk_25133F760;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(proxyQueue, v7);

}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connectionProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_2;
  v7[3] = &unk_25133F710;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_136;
  v5[3] = &unk_25133F738;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "callBlock:onInterruption:", v7, v5);

}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_3;
  v6[3] = &unk_25133F878;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "getDiagnosticReporterConfiguration:", v6);

}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "getDiagnosticReporterConfiguration, count, %lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_3_cold_1();
  }

}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_136(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_136_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, MEMORY[0x24BDBD1B8], v3);

}

- (BOOL)isApplicationUsingDataAccess:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *cacheQueue;
  id v7;
  uint8_t v8;
  _QWORD block[5];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2422B0000, v5, OS_LOG_TYPE_INFO, "Client is checking data access usage...", buf, 2u);
  }

  -[MOOnboardingAndSettingsManager waitForRefresh](self, "waitForRefresh");
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x2020000000;
  v16 = 0;
  cacheQueue = self->cacheQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MOOnboardingAndSettingsManager_isApplicationUsingDataAccess___block_invoke;
  block[3] = &unk_25133F8A0;
  v11 = v4;
  v12 = buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(cacheQueue, block);
  v8 = v14[24];

  _Block_object_dispose(buf, 8);
  return v8;
}

void __63__MOOnboardingAndSettingsManager_isApplicationUsingDataAccess___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", CFSTR("MOStateApplicationsWithDataAccess"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

}

- (void)getApplicationsWithDataAccess:(id)a3
{
  id v4;
  NSObject *proxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  proxyQueue = self->proxyQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke;
  v7[3] = &unk_25133F760;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(proxyQueue, v7);

}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connectionProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_2;
  v7[3] = &unk_25133F710;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_137;
  v5[3] = &unk_25133F738;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "callBlock:onInterruption:", v7, v5);

}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_3;
  v6[3] = &unk_25133F878;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "getApplicationsWithDataAccess:", v6);

}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "getApplicationsWithDataAccess, count, %lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_3_cold_1();
  }

}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_137(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_137_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)registerApplicationsForDataAccess:(id)a3
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
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2422B0000, v5, OS_LOG_TYPE_INFO, "Registering application for data access: %@", (uint8_t *)&v8, 0xCu);
  }

  -[MOOnboardingAndSettingsManager proxy](self, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerApplicationsForDataAccess:", v4);

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "Done registering application for data access: %@", (uint8_t *)&v8, 0xCu);
  }

  -[MOOnboardingAndSettingsManager refreshCache](self, "refreshCache");
}

- (BOOL)isClientUsingDataAccess:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *cacheQueue;
  id v7;
  uint8_t v8;
  _QWORD block[5];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2422B0000, v5, OS_LOG_TYPE_INFO, "Client is checking data access usage...", buf, 2u);
  }

  -[MOOnboardingAndSettingsManager waitForRefresh](self, "waitForRefresh");
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x2020000000;
  v16 = 0;
  cacheQueue = self->cacheQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__MOOnboardingAndSettingsManager_isClientUsingDataAccess___block_invoke;
  block[3] = &unk_25133F8A0;
  v11 = v4;
  v12 = buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(cacheQueue, block);
  v8 = v14[24];

  _Block_object_dispose(buf, 8);
  return v8;
}

void __58__MOOnboardingAndSettingsManager_isClientUsingDataAccess___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", CFSTR("MOStateClientsWithDataAccess"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

}

- (void)getClientsWithDataAccess:(id)a3
{
  id v4;
  NSObject *proxyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  proxyQueue = self->proxyQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke;
  v7[3] = &unk_25133F760;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(proxyQueue, v7);

}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connectionProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_2;
  v7[3] = &unk_25133F710;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_138;
  v5[3] = &unk_25133F738;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "callBlock:onInterruption:", v7, v5);

}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_3;
  v6[3] = &unk_25133F878;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "getClientsWithDataAccess:", v6);

}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "getClientsWithDataAccess, count, %lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_3_cold_1();
  }

}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_138_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)registerClientsForDataAccess:(id)a3
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
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2422B0000, v5, OS_LOG_TYPE_INFO, "Registering client for data access: %@", (uint8_t *)&v8, 0xCu);
  }

  -[MOOnboardingAndSettingsManager proxy](self, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClientsForDataAccess:", v4);

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2422B0000, v7, OS_LOG_TYPE_INFO, "Done registering client for data access: %@", (uint8_t *)&v8, 0xCu);
  }

  -[MOOnboardingAndSettingsManager refreshCache](self, "refreshCache");
}

- (MOSettingsManagerDelegate)settingsManagerDelegate
{
  return self->_settingsManagerDelegate;
}

- (void)setSettingsManagerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManagerDelegate, a3);
}

- (MOOnboardingManagerDelegate)onboardingManagerDelegate
{
  return self->_onboardingManagerDelegate;
}

- (void)setOnboardingManagerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingManagerDelegate, a3);
}

- (MODefaultsManager)defaultManager
{
  return self->_defaultManager;
}

- (MOConnection)connectionProxy
{
  return self->_connectionProxy;
}

- (void)setConnectionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_connectionProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProxy, 0);
  objc_storeStrong((id *)&self->_defaultManager, 0);
  objc_storeStrong((id *)&self->_onboardingManagerDelegate, 0);
  objc_storeStrong((id *)&self->_settingsManagerDelegate, 0);
  objc_storeStrong((id *)&self->_proxyIvar, 0);
  objc_storeStrong(&self->interruptHandler, 0);
  objc_storeStrong((id *)&self->proxyLock, 0);
  objc_storeStrong((id *)&self->clientQueue, 0);
  objc_storeStrong((id *)&self->cacheQueue, 0);
  objc_storeStrong((id *)&self->proxyQueue, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->stateCache, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2422B0000, v0, v1, "Failed up refresh cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__MOOnboardingAndSettingsManager_refreshCache__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = &unk_2513444A0;
  OUTLINED_FUNCTION_4(&dword_2422B0000, a1, a3, "Refresh cache timedout after %@ seconds", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)getOnboardingFlowCompletionStatus
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("MOStateOnboardingStatus");
  OUTLINED_FUNCTION_4(&dword_2422B0000, a1, a3, "Missing cached state for key %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __80__MOOnboardingAndSettingsManager__getOnboardingFlowCompletionStatusWithHandler___block_invoke_121_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2422B0000, v0, v1, "Remote process returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getOnboardingFlowRefreshCompletionStatus
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("MOStateOnboardingRefreshStatus");
  OUTLINED_FUNCTION_4(&dword_2422B0000, a1, a3, "Missing cached state for key %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)getStateForSetting:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_2422B0000, a3, (uint64_t)a3, "Missing cached state for key %@", (uint8_t *)a2);

}

- (void)getStateForSetting:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_2422B0000, v2, v3, "Unhandled setting %@ (in %s:%d)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)getStateForSetting:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2422B0000, v0, v1, "MOSettingDiscoverableByNearbyContacts is a disabled setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setState:(uint64_t)a1 forSetting:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_2422B0000, v2, v3, "Unhandled setting %@ (in %s:%d)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)setState:forSetting:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2422B0000, v0, v1, "MOSettingDiscoverableByNearbyContacts is a disabled setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setState:forSetting:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2422B0000, v0, v1, "MOSettingSystemSignificantLocationReadOnly is a read only setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2422B0000, v0, v1, "getDiagnosticReporterConfiguration, result suppressed by interuption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__MOOnboardingAndSettingsManager_getDiagnosticReporterConfiguration___block_invoke_136_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2422B0000, v0, v1, "getDiagnosticReporterConfiguration, remote process returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2422B0000, v0, v1, "getApplicationsWithDataAccess, result suppressed by interuption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__MOOnboardingAndSettingsManager_getApplicationsWithDataAccess___block_invoke_137_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2422B0000, v0, v1, "getApplicationsWithDataAccess, remote process returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2422B0000, v0, v1, "getClientsWithDataAccess, result suppressed by interuption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__MOOnboardingAndSettingsManager_getClientsWithDataAccess___block_invoke_138_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_2422B0000, v0, v1, "getClientsWithDataAccess, remote process returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
