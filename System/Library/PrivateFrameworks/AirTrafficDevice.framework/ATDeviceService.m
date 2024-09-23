@implementation ATDeviceService

- (void)registerForStatusOfDataclasses:(id)a3 enabled:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  ATXPCListener *xpcListener;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  _ATLogCategoryFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543618;
    v21 = v8;
    v22 = 2050;
    v23 = objc_msgSend(v9, "longLongValue");
    _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "register for status:%{public}@ enabled:%{public}lld", (uint8_t *)&v20, 0x16u);
  }

  xpcListener = self->_xpcListener;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPCListener proxyForConnection:](xpcListener, "proxyForConnection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "BOOLValue") & 1) != 0 || objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CF2228], "sharedMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v14);

    objc_msgSend(MEMORY[0x1E0CF2228], "sharedMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF2228], "sharedMonitor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObserver:", v14);

    objc_msgSend(MEMORY[0x1E0CF2228], "sharedMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = 0;
  }
  objc_msgSend(v16, "setDataClasses:forObserver:", v18, v14);

  v10[2](v10, 0);
}

+ (ATDeviceService)sharedInstance
{
  if (sharedInstance_onceToken_1262 != -1)
    dispatch_once(&sharedInstance_onceToken_1262, &__block_literal_global_1263);
  return (ATDeviceService *)(id)__sharedInstance;
}

- (ATDeviceService)init
{
  ATDeviceService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  ATXPCListener *v5;
  ATXPCListener *xpcListener;
  uint64_t v7;
  ATServiceProxyListener *proxyListener;
  NSMapTable *v9;
  NSMapTable *messageLinkProxyListeners;
  ATStatusObserverListener *v11;
  ATStatusObserverListener *statusObserverListener;
  ATLockdownListener *v13;
  ATLockdownListener *legacyLockdownListener;
  ATLockdownListener *v15;
  ATLockdownListener *lockdownListener;
  ATLegacyDeviceSyncManager *v17;
  ATLegacyDeviceSyncManager *legacyDeviceSyncManager;
  uint64_t v19;
  ATDeviceSettings *settings;
  uint64_t v21;
  ATEventScheduler *eventScheduler;
  uint64_t v23;
  ATDeviceSyncManager *deviceSyncManager;
  ATIDSService *v25;
  void *v26;
  uint64_t v27;
  ATIDSService *idsService;
  NSObject *v29;
  uint64_t v30;
  MSVXPCTransaction *startupTransaction;
  uint64_t v32;
  MSVXPCTransaction *xpcTransaction;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)ATDeviceService;
  v2 = -[ATConcreteService init](&v36, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.amp.AirTrafficDevice.ATDeviceService.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(ATXPCListener);
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v5;

    -[ATXPCListener run](v2->_xpcListener, "run");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF2218]), "initWithService:", v2);
    proxyListener = v2->_proxyListener;
    v2->_proxyListener = (ATServiceProxyListener *)v7;

    v9 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E0CB3748]);
    messageLinkProxyListeners = v2->_messageLinkProxyListeners;
    v2->_messageLinkProxyListeners = v9;

    v11 = (ATStatusObserverListener *)objc_alloc_init(MEMORY[0x1E0CF2230]);
    statusObserverListener = v2->_statusObserverListener;
    v2->_statusObserverListener = v11;

    v13 = -[ATLockdownListener initWithServiceName:]([ATLockdownListener alloc], "initWithServiceName:", CFSTR("com.apple.atc"));
    legacyLockdownListener = v2->_legacyLockdownListener;
    v2->_legacyLockdownListener = v13;

    -[ATMessageLinkListener setDelegate:](v2->_legacyLockdownListener, "setDelegate:", v2);
    v15 = -[ATLockdownListener initWithServiceName:]([ATLockdownListener alloc], "initWithServiceName:", CFSTR("com.apple.atc2"));
    lockdownListener = v2->_lockdownListener;
    v2->_lockdownListener = v15;

    -[ATMessageLinkListener setDelegate:](v2->_lockdownListener, "setDelegate:", v2);
    v17 = objc_alloc_init(ATLegacyDeviceSyncManager);
    legacyDeviceSyncManager = v2->_legacyDeviceSyncManager;
    v2->_legacyDeviceSyncManager = v17;

    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (ATDeviceSettings *)v19;

    objc_msgSend(MEMORY[0x1E0CF2200], "sharedInstance");
    v21 = objc_claimAutoreleasedReturnValue();
    eventScheduler = v2->_eventScheduler;
    v2->_eventScheduler = (ATEventScheduler *)v21;

    +[ATDeviceSyncManager deviceSyncManager](ATDeviceSyncManager, "deviceSyncManager");
    v23 = objc_claimAutoreleasedReturnValue();
    deviceSyncManager = v2->_deviceSyncManager;
    v2->_deviceSyncManager = (ATDeviceSyncManager *)v23;

    v25 = [ATIDSService alloc];
    -[ATDeviceSettings serviceName](v2->_settings, "serviceName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[ATIDSService initWithServiceName:](v25, "initWithServiceName:", v26);
    idsService = v2->_idsService;
    v2->_idsService = (ATIDSService *)v27;

    -[ATMessageLinkListener setDelegate:](v2->_idsService, "setDelegate:", v2);
    -[ATIDSService addListener:](v2->_idsService, "addListener:", v2);
    notify_register_check("com.apple.atc.started", &v2->_atcRunningToken);
    notify_set_state(v2->_atcRunningToken, 1uLL);
    notify_post("com.apple.atc.started");
    dispatch_get_global_queue(0, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v29, &__block_literal_global_22);

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D130]), "initWithName:", CFSTR("com.apple.atc.service.startup"));
    startupTransaction = v2->_startupTransaction;
    v2->_startupTransaction = (MSVXPCTransaction *)v30;

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D130]), "initWithName:", CFSTR("com.apple.atc.service"));
    xpcTransaction = v2->_xpcTransaction;
    v2->_xpcTransaction = (MSVXPCTransaction *)v32;

    if (MGGetSInt32Answer() == 6)
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3990]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 10485760, 0);
      objc_msgSend(MEMORY[0x1E0CB3990], "setSharedURLCache:", v34);

    }
  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_source *sigTermSrc;
  int atcRunningToken;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  dispatch_source_cancel((dispatch_source_t)self->_sigTermSrc);
  sigTermSrc = self->_sigTermSrc;
  self->_sigTermSrc = 0;

  atcRunningToken = self->_atcRunningToken;
  if (atcRunningToken)
  {
    notify_set_state(atcRunningToken, 0);
    notify_post("com.apple.atc.started");
    notify_cancel(self->_atcRunningToken);
    self->_atcRunningToken = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CF75E8], 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)ATDeviceService;
  -[ATDeviceService dealloc](&v6, sel_dealloc);
}

- (BOOL)run
{
  NSObject *v3;
  void *v4;
  void *v5;
  ATDevicePairedSyncManager *v6;
  ATDevicePairedSyncManager *pairedSyncManager;
  ATLockdownListener *legacyLockdownListener;
  ATLockdownListener *lockdownListener;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  uint8_t v26[128];
  uint8_t buf[4];
  ATDeviceService *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting up", buf, 0xCu);
  }

  -[ATDeviceService _setupStartupTransaction](self, "_setupStartupTransaction");
  objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evacuate");

  v25.receiver = self;
  v25.super_class = (Class)ATDeviceService;
  if (!-[ATConcreteService run](&v25, "run"))
    goto LABEL_8;
  -[ATServiceProxyListener start](self->_proxyListener, "start");
  -[ATStatusObserverListener start](self->_statusObserverListener, "start");
  objc_msgSend(MEMORY[0x1E0CF2220], "sharedSessionServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

  +[ATDevicePairedSyncManager sharedPairedSyncManager](ATDevicePairedSyncManager, "sharedPairedSyncManager");
  v6 = (ATDevicePairedSyncManager *)objc_claimAutoreleasedReturnValue();
  pairedSyncManager = self->_pairedSyncManager;
  self->_pairedSyncManager = v6;

  -[ATDevicePairedSyncManager start](self->_pairedSyncManager, "start");
  legacyLockdownListener = self->_legacyLockdownListener;
  if (!legacyLockdownListener || -[ATLockdownListener start](legacyLockdownListener, "start"))
  {
    lockdownListener = self->_lockdownListener;
    if (lockdownListener)
      v10 = -[ATLockdownListener start](lockdownListener, "start");
    else
      v10 = 1;
  }
  else
  {
LABEL_8:
    v10 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allClients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EFC7B610))
          objc_msgSend(v17, "setDelegate:", self);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v14);
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DDC050], "sharedSecurityInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __22__ATDeviceService_run__block_invoke;
    v20[3] = &unk_1E927E120;
    v20[4] = self;
    objc_msgSend(v18, "performBlockAfterFirstUnlock:", v20);

  }
  return v10;
}

- (BOOL)stop
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  ATDeviceService *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", buf, 0xCu);
  }

  -[ATXPCListener stop](self->_xpcListener, "stop");
  -[ATLockdownListener stop](self->_legacyLockdownListener, "stop");
  -[ATLockdownListener stop](self->_lockdownListener, "stop");
  -[ATIDSService stop](self->_idsService, "stop");
  -[ATServiceProxyListener stop](self->_proxyListener, "stop");
  -[ATStatusObserverListener stop](self->_statusObserverListener, "stop");
  +[ATHostWakeupService sharedInstance](ATHostWakeupService, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[ATDevicePairedSyncManager stop](self->_pairedSyncManager, "stop");
  objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evacuate");

  objc_msgSend(MEMORY[0x1E0CF21F8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

  v8.receiver = self;
  v8.super_class = (Class)ATDeviceService;
  return -[ATConcreteService stop](&v8, sel_stop);
}

- (id)proxyListenerForMessageLink:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1229;
  v16 = __Block_byref_object_dispose__1230;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ATDeviceService_proxyListenerForMessageLink___block_invoke;
  block[3] = &unk_1E927E170;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allMessageLinkProxyListeners
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1229;
  v10 = __Block_byref_object_dispose__1230;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ATDeviceService_allMessageLinkProxyListeners__block_invoke;
  v5[3] = &unk_1E927D590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addMessageLink:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ATDeviceService_addMessageLink___block_invoke;
  block[3] = &unk_1E927E148;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)removeMessageLink:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATDeviceService_removeMessageLink___block_invoke;
  block[3] = &unk_1E927E148;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)messageLinkWasClosed:(id)a3
{
  id v4;
  char isKindOfClass;
  objc_super v6;

  v4 = a3;
  -[ATDeviceService _removeObserversFromMessageLink:](self, "_removeObserversFromMessageLink:", v4);
  v6.receiver = self;
  v6.super_class = (Class)ATDeviceService;
  -[ATConcreteService messageLinkWasClosed:](&v6, sel_messageLinkWasClosed_, v4);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[ATDeviceService _scheduleNewSyncIfNeeded](self, "_scheduleNewSyncIfNeeded");
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseWithError:parameters:", v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sendResponse:withCompletion:", v9, 0);
}

- (void)listener:(id)a3 didReceiveMessageLinkRequest:(id)a4
{
  id v7;
  ATDeviceService *v8;
  NSObject *v9;
  ATLocalCloudAssetLink *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  ATDeviceService *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  ATDeviceService *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (ATDeviceService *)a4;
  _ATLogCategoryFramework();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v36 = self;
    v37 = 2114;
    v38 = v7;
    v39 = 2114;
    v40 = v8;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ did receieve message link request %{public}@", buf, 0x20u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[ATService messageLinks](self, "messageLinks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v17, "close");
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v14);
    }

LABEL_17:
    -[ATDeviceService _addObserversToMessageLink:](self, "_addObserversToMessageLink:", v8);
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ATConcreteService addObserver:](v8, "addObserver:", self->_legacyDeviceSyncManager);
    v10 = -[ATLocalCloudAssetLink initWithMessageLink:]([ATLocalCloudAssetLink alloc], "initWithMessageLink:", v8);
    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAssetLink:", v10);

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATDeviceService.m"), 392, CFSTR("received unknown message link type from lockdown listener: %@"), v8);

LABEL_18:
  -[ATDeviceService addMessageLink:](self, "addMessageLink:", v8);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[ATService observers](self, "observers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22++), "service:willOpenMessageLink:", self, v8);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  if ((-[ATDeviceService open](v8, "open") & 1) == 0)
  {
    _ATLogCategoryFramework();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v8;
      v37 = 2114;
      v38 = v7;
      _os_log_impl(&dword_1D1868000, v23, OS_LOG_TYPE_ERROR, "failed to open message link %{public}@ from listener %{public}@", buf, 0x16u);
    }

    -[ATDeviceService close](v8, "close");
  }

}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATDeviceService prioritizeAsset:forDataclass:withCompletion:](self, "prioritizeAsset:forDataclass:withCompletion:", v9, CFSTR("Application"), &__block_literal_global_138);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)applicationInstallsDidCancel:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "predicateWithFormat:", CFSTR("dataclass = %@ and identifier = %@"), CFSTR("Application"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cancelAllAssetsMatchingPredicate:excludeActiveDownloads:withError:completion:", v11, 0, 0, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (void)restoreFromDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)requestSyncForLibrary:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "request sync for library %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    -[ATService messageLinkForIdentifier:](self, "messageLinkForIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[ATDeviceService _requestSyncForLibrary:onMessageLink:](self, "_requestSyncForLibrary:onMessageLink:", v6, v9);

  }
  else
  {
    _ATLogCategoryFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[ATService messageLinks](self, "messageLinks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "library id not specified - syncing all (%{public}@)", buf, 0xCu);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ATDeviceService_requestSyncForLibrary_withCompletion___block_invoke;
    block[3] = &unk_1E927E120;
    block[4] = self;
    dispatch_async(queue, block);
  }
  v7[2](v7, 0);

}

- (void)requestSyncForPairedDeviceWithPriority:(int)a3 withCompletion:(id)a4
{
  uint64_t v4;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD);

  v4 = *(_QWORD *)&a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[ATDeviceService _deviceMessageLink](self, "_deviceMessageLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATDeviceService _requestSyncForLibrary:onMessageLink:](self, "_requestSyncForLibrary:onMessageLink:", v9, v8);

    if (v6)
      v6[2](v6, 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__ATDeviceService_requestSyncForPairedDeviceWithPriority_withCompletion___block_invoke;
    v10[3] = &unk_1E927D998;
    v11 = v6;
    -[ATDeviceService openDeviceMessageLinkWithPriority:withCompletion:](self, "openDeviceMessageLinkWithPriority:withCompletion:", v4, v10);

  }
}

- (void)requestKeybagSyncToPairedDeviceWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (void (**)(id, _QWORD))a3;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "request keybag sync to paired device", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ATSyncKeybagToPairedDeviceRequestNotification"), 0);

  if (v3)
    v3[2](v3, 0);

}

- (void)cancelSyncWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ATDeviceService_cancelSyncWithCompletion___block_invoke;
  v7[3] = &unk_1E927D348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)prioritizeAsset:(id)a3 forDataclass:(id)a4 withCompletion:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x1E0CF7680];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_msgSend([v8 alloc], "initWithIdentifier:dataclass:prettyName:", v11, v10, 0);

  objc_msgSend(v12, "setIsRestore:", 1);
  -[ATDeviceService prioritizeAsset:withCompletion:](self, "prioritizeAsset:withCompletion:", v12, v9);

}

- (void)prioritizeAsset:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  ATDeviceService *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ prioritize asset:%{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isRestore") && (objc_msgSend(v9, "assetIsEnqueued:", v6) & 1) == 0)
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enqueueAssets:", v10);

  }
  objc_msgSend(v9, "prioritizeAsset:", v6);
  if (v7)
    v7[2](v7, 0);

}

- (void)cancelAssetTransferForFailedAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  ATDeviceService *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling asset:%{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "dataclass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("dataclass = %@ and identifier = %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllAssetsMatchingPredicate:excludeActiveDownloads:withError:completion:", v10, 0, 0, 0);

}

- (void)purgePartialAsset:(id)a3 forDataclass:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  _ATLogCategoryFramework();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "purge partial asset dataclass:%{public}@, id:%{public}@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "purgeAssetWithIdentifier:dataclass:", v7, v8);

  if (v9)
    v9[2](v9, 0);

}

- (void)clearSyncDataWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "clearing sync data", v6, 2u);
  }

  -[ATDeviceSettings removeEndpointInfoForLibrary:](self->_settings, "removeEndpointInfoForLibrary:", 0);
  if (v4)
    v4[2](v4, 0);

}

- (void)lowBatteryNotificationWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, _QWORD))a3;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "low battery notification", v5, 2u);
  }

  if (v3)
    v3[2](v3, 0);

}

- (void)keepATCAlive:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  _ATLogCategoryFramework();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "enabling";
    if (v4)
      v8 = "disabling";
    v9 = 136315138;
    v10 = v8;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "idle exit %s", (uint8_t *)&v9, 0xCu);
  }

  -[MSVXPCTransaction beginTransaction](self->_xpcTransaction, "beginTransaction");
  if (v6)
    v6[2](v6, 0);

}

- (void)getSyncStateWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD, void *);

  v5 = (void (**)(id, _QWORD, void *))a3;
  -[ATLegacyDeviceSyncManager currentSyncState](self->_legacyDeviceSyncManager, "currentSyncState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v5[2](v5, 0, v4);

}

- (void)openDeviceMessageLinkWithPriority:(int)a3 withCompletion:(id)a4
{
  uint64_t v4;
  ATIDSService *idsService;
  void (**v6)(id, _QWORD);

  v4 = *(_QWORD *)&a3;
  idsService = self->_idsService;
  v6 = (void (**)(id, _QWORD))a4;
  -[ATIDSService requestConnectionToPairedDeviceWithPriority:](idsService, "requestConnectionToPairedDeviceWithPriority:", +[ATIDSService openSocketPriorityFromATPendingChangePriority:](ATIDSService, "openSocketPriorityFromATPendingChangePriority:", v4));
  v6[2](v6, 0);

}

- (void)getAssetMetricswithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[ATDeviceDiskUsageProvider sharedInstance](ATDeviceDiskUsageProvider, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ATDeviceService_getAssetMetricswithCompletion___block_invoke;
  v6[3] = &unk_1E927CC50;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getUpdatedUsageWithCompletion:", v6);

}

- (void)getDataRestoreIsCompleteWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  int v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  objc_msgSend(MEMORY[0x1E0DDC050], "sharedSecurityInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeviceClassCUnlocked");

  if ((v6 & 1) != 0)
  {
    +[ATRestoreManager sharedManager](ATRestoreManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__ATDeviceService_getDataRestoreIsCompleteWithCompletion___block_invoke;
    v11[3] = &unk_1E927CC78;
    v13 = &v14;
    v12 = v4;
    objc_msgSend(v7, "restoreSessionActiveWithCompletion:", v11);

  }
  else
  {
    v8 = -[ATDeviceSettings activeRestoreType](self->_settings, "activeRestoreType") == 0;
    *((_BYTE *)v15 + 24) = v8;
    _ATLogCategoryFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *((unsigned __int8 *)v15 + 24);
      *(_DWORD *)buf = 67109120;
      v19 = v10;
      _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "device is locked - restoreComplete %d", buf, 8u);
    }

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, *((unsigned __int8 *)v15 + 24));
  }
  _Block_object_dispose(&v14, 8);

}

- (void)syncChangesForDataClass:(id)a3 withPriority:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = *(_QWORD *)&a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ATDeviceSettings endpointInfo](self->_settings, "endpointInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v24 = v4;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      v23 = v8;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "objectForKey:", CFSTR("HostInfo"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "enabledDataClasses");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15
            || (v16 = (void *)v15,
                objc_msgSend(v14, "enabledDataClasses"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "containsObject:", v6),
                v17,
                v16,
                (v18 & 1) != 0))
          {

            v8 = v23;
            v4 = v24;
            goto LABEL_15;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        v8 = v23;
        if (v11)
          continue;
        break;
      }
    }

    _ATLogCategoryFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v6;
      _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "blocking sync request because no known endpoints support dataClass %{public}@", buf, 0xCu);
    }
  }
  else
  {
LABEL_15:
    -[ATDeviceSettings setSyncPending:forDataClass:](self->_settings, "setSyncPending:forDataClass:", 1, v6);
    -[ATDeviceService _deviceMessageLink](self, "_deviceMessageLink");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v19 = v20;
      v21 = -[ATDeviceSyncManager initiateSyncForDataClass:onMessageLink:](self->_deviceSyncManager, "initiateSyncForDataClass:onMessageLink:", v6, v20);
    }
    else
    {
      if (-[ATIDSService hasPairedDevice](self->_idsService, "hasPairedDevice"))
      {
        -[ATDeviceService openDeviceMessageLinkWithPriority:withCompletion:](self, "openDeviceMessageLinkWithPriority:withCompletion:", v4, &__block_literal_global_152);
      }
      else
      {
        _ATLogCategoryFramework();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1868000, v22, OS_LOG_TYPE_ERROR, "not initiating a sync as we don't have a paired device", buf, 2u);
        }

      }
      v19 = 0;
    }
  }

}

- (void)initiateAssetDownloadSessionsWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  char v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[16];

  v3 = a3;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "initiating download sessions", buf, 2u);
  }

  v5 = dispatch_group_create();
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientForDataclass:", CFSTR("Media"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v5);
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke;
    v21[3] = &unk_1E927E120;
    v22 = v5;
    objc_msgSend(v7, "initiateAssetDownloadsWithCompletion:", v21);
    v9 = 0;
    v10 = v22;
  }
  else
  {
    _ATLogCategoryFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "Could not load sync client for dataclass=media", buf, 2u);
    }
    v9 = 1;
  }

  if (MSVDeviceIsWatch())
  {
    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientForDataclass:", CFSTR("Podcasts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_group_enter(v5);
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke_159;
      v19[3] = &unk_1E927E120;
      v20 = v5;
      objc_msgSend(v12, "initiateAssetDownloadsWithCompletion:", v19);
      v13 = v20;
    }
    else
    {
      _ATLogCategoryFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "Could not load sync client for dataclass=podcasts", buf, 2u);
      }
      v9 = 1;
    }

  }
  dispatch_get_global_queue(25, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke_160;
  v16[3] = &unk_1E927CCC0;
  v18 = v9;
  v17 = v3;
  v15 = v3;
  dispatch_group_notify(v5, v14, v16);

}

- (void)syncClient:(id)a3 hasChangesWithPriority:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "syncDataClass");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATDeviceService syncChangesForDataClass:withPriority:](self, "syncChangesForDataClass:withPriority:", v6, v4);

}

- (void)idsServiceDevicesDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "hasPairedDevice") & 1) == 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[ATDeviceSettings dataClassesNeedingSync](self->_settings, "dataClassesNeedingSync", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[ATDeviceSettings setSyncPending:forDataClass:](self->_settings, "setSyncPending:forDataClass:", 0, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_setupStartupTransaction
{
  OS_dispatch_source *v3;
  OS_dispatch_source *sigTermSrc;
  NSObject *v5;
  uint64_t v6;
  dispatch_time_t v7;
  NSObject *queue;
  _QWORD v9[5];
  _QWORD handler[5];

  -[MSVXPCTransaction beginTransaction](self->_startupTransaction, "beginTransaction");
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, (dispatch_queue_t)self->_queue);
  sigTermSrc = self->_sigTermSrc;
  self->_sigTermSrc = v3;

  v5 = self->_sigTermSrc;
  v6 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43__ATDeviceService__setupStartupTransaction__block_invoke;
  handler[3] = &unk_1E927E120;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigTermSrc);
  v7 = dispatch_time(0, 10000000000);
  queue = self->_queue;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __43__ATDeviceService__setupStartupTransaction__block_invoke_2;
  v9[3] = &unk_1E927E120;
  v9[4] = self;
  dispatch_after(v7, queue, v9);
}

- (void)_endStartupTransaction
{
  if (-[MSVXPCTransaction isActive](self->_startupTransaction, "isActive"))
    -[MSVXPCTransaction endTransaction](self->_startupTransaction, "endTransaction");
}

- (void)_addObserversToMessageLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  ATDeviceProvisioningHandler *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EFC68908))
          objc_msgSend(v4, "addObserver:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "addObserver:", self->_deviceSyncManager);
  objc_msgSend(v4, "addRequestHandler:forDataClass:", self, CFSTR("Control"));
  v12 = objc_alloc_init(ATDeviceProvisioningHandler);
  objc_msgSend(v4, "addObserver:", v12);
  objc_msgSend(v4, "addRequestHandler:forDataClass:", v12, CFSTR("Provisioning"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF21E8]), "initWithMessageLink:", v4);
  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAssetLink:", v13);

  objc_msgSend(v13, "open");
  if (self->_pairedSyncManager)
    objc_msgSend(v4, "addObserver:");

}

- (void)_removeObserversFromMessageLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EFC68908))
          objc_msgSend(v4, "removeObserver:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "removeObserver:", self->_deviceSyncManager);
  if (self->_pairedSyncManager)
    objc_msgSend(v4, "removeObserver:");

}

- (void)_requestSyncForLibrary:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ATLegacyDeviceSyncManager initiateSyncForLibrary:onMessageLink:](self->_legacyDeviceSyncManager, "initiateSyncForLibrary:onMessageLink:", v7, v6);
  else
    -[ATDeviceSyncManager initiateSyncOnMessageLink:](self->_deviceSyncManager, "initiateSyncOnMessageLink:", v6);

}

- (void)_cancelSyncForMessageLink:(id)a3
{
  id v4;
  NSObject *v5;
  ATDeviceSyncManager *p_super;
  ATLegacyDeviceSyncManager *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "cancelling all sync on message link %{public}@", (uint8_t *)&v8, 0xCu);
  }

  p_super = self->_deviceSyncManager;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = self->_legacyDeviceSyncManager;

    p_super = &v7->super;
  }
  -[ATDeviceSyncManager cancelSyncOnMessageLink:](p_super, "cancelSyncOnMessageLink:", v4);

}

- (id)_deviceMessageLink
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
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
  -[ATService messageLinks](self, "messageLinks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_scheduleNewSyncIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  id obj;
  id obja;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[ATDeviceSettings dataClassesNeedingSync](self->_settings, "dataClassesNeedingSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v28 = v4;
  obj = (id)objc_msgSend(v4, "mutableCopy");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EFC7B610))
        {
          objc_msgSend(v11, "syncDataClass");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          if (v13)
          {
            objc_msgSend(v11, "syncDataClass");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "removeObject:", v14);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v8);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obja = obj;
  v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  v16 = v28;
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(obja);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        _ATLogCategoryFramework();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v20;
          _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_DEFAULT, "Removing sync-pending flag for unsupported data class '%{public}@'", buf, 0xCu);
        }

        objc_msgSend(v28, "removeObject:", v20);
        -[ATDeviceSettings setSyncPending:forDataClass:](self->_settings, "setSyncPending:forDataClass:", 0, v20);
      }
      v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v28, "count")
    && !-[ATDevicePairedSyncManager hasRestriction](self->_pairedSyncManager, "hasRestriction"))
  {
    if (-[ATIDSService hasPairedDevice](self->_idsService, "hasPairedDevice"))
    {
      _ATLogCategoryFramework();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v28;
        _os_log_impl(&dword_1D1868000, v22, OS_LOG_TYPE_DEFAULT, "still have pending changes - requesting a new sync. dataclasses:%{public}@", buf, 0xCu);
      }

      -[ATDeviceService requestSyncForPairedDeviceWithPriority:withCompletion:](self, "requestSyncForPairedDeviceWithPriority:withCompletion:", 2, &__block_literal_global_171);
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v23 = v28;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v32;
        do
        {
          for (k = 0; k != v25; ++k)
          {
            if (*(_QWORD *)v32 != v26)
              objc_enumerationMutation(v23);
            -[ATDeviceSettings setSyncPending:forDataClass:](self->_settings, "setSyncPending:forDataClass:", 0, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        }
        while (v25);
      }

      v16 = v28;
    }
  }

}

- (void)handleDataMigrationFinished
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "data migration finished - resuming restore", v5, 2u);
  }

  -[ATDeviceSettings setHasCompletedDataMigration:](self->_settings, "setHasCompletedDataMigration:", 1);
  -[ATDeviceSettings synchronize](self->_settings, "synchronize");
  +[ATRestoreManager sharedManager](ATRestoreManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restoreSessionActiveWithCompletion:", &__block_literal_global_172);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sigTermSrc, 0);
  objc_storeStrong((id *)&self->_startupTransaction, 0);
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
  objc_storeStrong((id *)&self->_eventScheduler, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_legacyDeviceSyncManager, 0);
  objc_storeStrong((id *)&self->_deviceSyncManager, 0);
  objc_storeStrong((id *)&self->_statusObserverListener, 0);
  objc_storeStrong((id *)&self->_messageLinkProxyListeners, 0);
  objc_storeStrong((id *)&self->_proxyListener, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_pairedSyncManager, 0);
  objc_storeStrong((id *)&self->_legacyLockdownListener, 0);
  objc_storeStrong((id *)&self->_lockdownListener, 0);
}

void __46__ATDeviceService_handleDataMigrationFinished__block_invoke(uint64_t a1, int a2)
{
  NSObject *v2;
  id v3;
  uint8_t buf[16];

  if (a2)
  {
    +[ATRestoreManager sharedManager](ATRestoreManager, "sharedManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resume");

  }
  else
  {
    _ATLogCategoryFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "no active restore session - ignoring", buf, 2u);
    }

  }
}

void __43__ATDeviceService__scheduleNewSyncIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _ATLogCategoryFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_ERROR, "sync request failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __43__ATDeviceService__setupStartupTransaction__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_endStartupTransaction");
  exit(0);
}

uint64_t __43__ATDeviceService__setupStartupTransaction__block_invoke_2(uint64_t a1)
{
  dispatch_source_t *v2;

  v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[21])
  {
    dispatch_source_cancel(v2[21]);
    v2 = *(dispatch_source_t **)(a1 + 32);
  }
  return -[dispatch_source_t _endStartupTransaction](v2, "_endStartupTransaction");
}

void __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "finished initiating download session for dataclass=media", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke_159(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "finished initiating download session for dataclass=podcasts", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke_160(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0CF7608], 0);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __56__ATDeviceService_syncChangesForDataClass_withPriority___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _ATLogCategoryFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_ERROR, "failed to open device link. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t __58__ATDeviceService_getDataRestoreIsCompleteWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  int v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 ^ 1;
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "restoreComplete %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__ATDeviceService_getAssetMetricswithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__ATDeviceService_cancelSyncWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  objc_msgSend(*(id *)(a1 + 32), "messageLinks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_cancelSyncForMessageLink:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __73__ATDeviceService_requestSyncForPairedDeviceWithPriority_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "failed to open device link. err=%{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __56__ATDeviceService_requestSyncForLibrary_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "messageLinks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        _ATLogCategoryFramework();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v7;
          _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "requesting sync for %{public}@", buf, 0xCu);
        }

        v9 = *(void **)(a1 + 32);
        objc_msgSend(v7, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_requestSyncForLibrary:onMessageLink:", v10, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v4);
  }

}

void __37__ATDeviceService_removeMessageLink___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_super v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ATDeviceService;
  objc_msgSendSuper2(&v4, sel_removeMessageLink_, v3);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "endTransaction");

}

void __34__ATDeviceService_addMessageLink___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_super v4;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "beginTransaction");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2210]), "initWithMessageLink:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "start");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ATDeviceService;
  objc_msgSendSuper2(&v4, sel_addMessageLink_, v3);

}

void __47__ATDeviceService_allMessageLinkProxyListeners__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectEnumerator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__ATDeviceService_proxyListenerForMessageLink___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __22__ATDeviceService_run__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  ATStoreAssetLink *v4;
  void *v5;
  __objc2_class *v6;
  id v7;
  void *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v11;
  NSObject *v12;
  __CFNotificationCenter *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "start") & 1) == 0)
  {
    _ATLogCategoryFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v17 = 138543362;
      v18 = v3;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_ERROR, "failed to start %{public}@", (uint8_t *)&v17, 0xCu);
    }

  }
  v4 = objc_alloc_init(ATStoreAssetLink);
  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAssetLink:", v4);

  -[ATStoreAssetLink open](v4, "open");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "useNewDownloadService"))
    v6 = ATStoreMediaAssetLink;
  else
    v6 = ATMPStoreAssetLink;
  v7 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAssetLink:", v7);

  objc_msgSend(v7, "open");
  objc_msgSend(MEMORY[0x1E0CF21F8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "start");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleDataMigratorFinishedNotification, (CFStringRef)*MEMORY[0x1E0CF75E8], 0, CFNotificationSuspensionBehaviorDrop);
  +[ATRestoreManager sharedManager](ATRestoreManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "restoreSessionActiveWithCompletion:", &__block_literal_global_107);

  objc_msgSend(*(id *)(a1 + 32), "_scheduleNewSyncIfNeeded");
  _ATLogCategoryFramework();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "atc startup complete", (uint8_t *)&v17, 2u);
  }

  v13 = CFNotificationCenterGetDarwinNotifyCenter();
  v14 = *MEMORY[0x1E0CF7670];
  CFNotificationCenterPostNotification(v13, (CFNotificationName)*MEMORY[0x1E0CF7670], 0, 0, 1u);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", v14, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "start");
  +[ATHostWakeupService sharedInstance](ATHostWakeupService, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "start");

}

void __22__ATDeviceService_run__block_invoke_105(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("not active");
    if (a2)
      v4 = CFSTR("active");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "A restore session is %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (a2)
  {
    +[ATRestoreManager sharedManager](ATRestoreManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resume");

  }
}

void __33__ATDeviceService_sharedInstance__block_invoke()
{
  ATDeviceService *v0;
  void *v1;

  v0 = objc_alloc_init(ATDeviceService);
  v1 = (void *)__sharedInstance;
  __sharedInstance = (uint64_t)v0;

}

@end
