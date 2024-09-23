@implementation _GCControllerManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_12);
  return (id)sharedInstance_sharedManager;
}

+ (void)initialize
{
  NSObject *v2;
  uint8_t buf[4];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1 && gc_isInternalBuild())
  {
    getGCLogger();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v4 = objc_opt_class();
      _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, "+[%{public}@ initialize]", buf, 0xCu);
    }

  }
}

- (_GCControllerManager)init
{
  _GCControllerManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *controllersQueue;
  uint64_t v5;
  NSMapTable *ipcObjectRegistry;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *hidSystemClientQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_GCControllerManager;
  v2 = -[_GCControllerManager init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("GCControllerManager.controllers", MEMORY[0x24BDAC9C0]);
    controllersQueue = v2->_controllersQueue;
    v2->_controllersQueue = (OS_dispatch_queue *)v3;

    v2->_ipcRegistryLock._os_unfair_lock_opaque = 0;
    v5 = objc_msgSend(objc_alloc((Class)&off_254DF7908), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    ipcObjectRegistry = v2->_ipcObjectRegistry;
    v2->_ipcObjectRegistry = (NSMapTable *)v5;

    -[_GCControllerManager registerIPCObject:](v2, "registerIPCObject:", v2);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.corecontroller.events", v7);
    hidSystemClientQueue = v2->_hidSystemClientQueue;
    v2->_hidSystemClientQueue = (OS_dispatch_queue *)v8;

    -[_GCControllerManager _legacy_init](v2, "_legacy_init");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_GCControllerManager _legacy_dealloc](self, "_legacy_dealloc");
  v3.receiver = self;
  v3.super_class = (Class)_GCControllerManager;
  -[_GCControllerManager dealloc](&v3, sel_dealloc);
}

- (void)setShouldMonitorBackgroundEvents:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldMonitorBackgroundEvents != a3)
  {
    self->_shouldMonitorBackgroundEvents = a3;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_shouldMonitorBackgroundEvents)
          v5 = CFSTR("YES");
        else
          v5 = CFSTR("NO");
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "shouldMonitorBackgroundEvents = %@", (uint8_t *)&v6, 0xCu);
      }

    }
    if (self->_shouldMonitorBackgroundEvents)
      -[_GCControllerManager CBApplicationDidBecomeActive](self, "CBApplicationDidBecomeActive");
  }
}

- (BOOL)shouldMonitorBackgroundEvents
{
  return self->_shouldMonitorBackgroundEvents;
}

- (id)HIDDeviceMatchingAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  +[NSMutableArray array](&off_254DEBB20, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("DeviceUsagePage");
  v14[1] = CFSTR("DeviceUsage");
  v15[0] = &unk_24D30DEB8;
  v15[1] = &unk_24D30DED0;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);
  v12[0] = CFSTR("DeviceUsagePage");
  v12[1] = CFSTR("DeviceUsage");
  v13[0] = &unk_24D30DEB8;
  v13[1] = &unk_24D30DEE8;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);
  v10[0] = CFSTR("DeviceUsagePage");
  v10[1] = CFSTR("DeviceUsage");
  v11[0] = &unk_24D30DEB8;
  v11[1] = &unk_24D30DF00;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);
  v8[0] = CFSTR("DeviceUsagePage");
  v8[1] = CFSTR("DeviceUsage");
  v9[0] = &unk_24D30DEB8;
  v9[1] = &unk_24D30DF18;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  return v2;
}

- (void)setupHIDMonitor:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _GCHIDEventSubject *v12;
  _GCHIDEventSubject *hidEventSource;
  void *v14;
  int IsGameControllerDaemon;
  NSObject *hidSystemClientQueue;
  _QWORD v17[4];
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27[2];
  _QWORD v28[4];
  id v29[2];
  id location;
  os_activity_scope_state_s state;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (!self->_hidSystemClient)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v5 = _os_activity_create(&dword_215181000, "Setup HID Monitor", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    v6 = (void *)IOHIDEventSystemClientCreateWithType();
    IOHIDEventSystemClientSetDispatchQueue();
    -[_GCControllerManager HIDDeviceMatchingAttributes](self, "HIDDeviceMatchingAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientSetMatchingMultiple();

    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __40___GCControllerManager_setupHIDMonitor___block_invoke;
    v28[3] = &unk_24D2B41C8;
    objc_copyWeak(v29, &location);
    v29[1] = v6;
    v9 = (void *)MEMORY[0x2199DEBB0](v28);
    v25[0] = v8;
    v25[1] = 3221225472;
    v25[2] = __40___GCControllerManager_setupHIDMonitor___block_invoke_88;
    v25[3] = &unk_24D2B41F0;
    objc_copyWeak(v27, &location);
    v27[1] = v6;
    v10 = v9;
    v26 = v10;
    v11 = (void *)MEMORY[0x2199DEBB0](v25);
    IOHIDEventSystemClientRegisterDeviceMatchingBlock();
    -[_GCControllerManager makeHIDEventSource:](self, "makeHIDEventSource:", v6);
    v12 = (_GCHIDEventSubject *)objc_claimAutoreleasedReturnValue();
    hidEventSource = self->_hidEventSource;
    self->_hidEventSource = v12;

    v20 = v8;
    v21 = 3221225472;
    v22 = __40___GCControllerManager_setupHIDMonitor___block_invoke_89;
    v23 = &__block_descriptor_40_e5_v8__0l;
    v24 = v6;
    IOHIDEventSystemClientSetCancelHandler();
    self->_hidSystemClient = (__IOHIDEventSystemClient *)CFRetain(v6);
    __dmb(0xBu);
    if (v3)
    {
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __40___GCControllerManager_setupHIDMonitor___block_invoke_2;
      v17[3] = &unk_24D2B4218;
      v19 = v6;
      v18 = v11;
      v14 = (void *)MEMORY[0x2199DEBB0](v17);
      IsGameControllerDaemon = currentProcessIsGameControllerDaemon();
      hidSystemClientQueue = self->_hidSystemClientQueue;
      if (IsGameControllerDaemon)
        dispatch_async_and_wait(hidSystemClientQueue, v14);
      else
        dispatch_async(hidSystemClientQueue, v14);

    }
    IOHIDEventSystemClientActivate();

    objc_destroyWeak(v27);
    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
    os_activity_scope_leave(&state);

  }
}

- (void)teardownHIDMonitor:(BOOL)a3
{
  _BOOL4 v3;
  __IOHIDEventSystemClient *hidSystemClient;
  NSObject *v6;
  void (**v7)(_QWORD);
  void *v8;
  _GCHIDEventSubject *hidEventSource;
  _QWORD v10[6];
  os_activity_scope_state_s state;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  hidSystemClient = self->_hidSystemClient;
  if (hidSystemClient)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v6 = _os_activity_create(&dword_215181000, "Teardown HID Monitor", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43___GCControllerManager_teardownHIDMonitor___block_invoke;
    v10[3] = &unk_24D2B4240;
    v10[4] = self;
    v10[5] = hidSystemClient;
    v7 = (void (**)(_QWORD))MEMORY[0x2199DEBB0](v10);
    v8 = v7;
    if (v3)
      dispatch_sync((dispatch_queue_t)self->_hidSystemClientQueue, v7);
    else
      v7[2](v7);
    hidEventSource = self->_hidEventSource;
    self->_hidEventSource = 0;

    os_activity_scope_leave(&state);
  }
}

- (id)observeHIDEvents:(id)a3 forService:(id)a4
{
  return -[_GCHIDEventSubject observeHIDEvents:forService:](self->_hidEventSource, "observeHIDEvents:forService:", a3, a4);
}

- (id)observeHIDEvents:(id)a3
{
  return -[_GCHIDEventSubject observeHIDEvents:](self->_hidEventSource, "observeHIDEvents:", a3);
}

- (void)open
{
  NSObject *v3;
  uint8_t v4[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "open", v4, 2u);
    }

  }
  if (!self->_hidSystemClient)
    -[_GCControllerManager _legacy_startHIDDeviceMonitor](self, "_legacy_startHIDDeviceMonitor");
  -[_GCControllerManager setupHIDMonitor:](self, "setupHIDMonitor:", 1);
}

- (OS_dispatch_queue)controllersQueue
{
  return self->_controllersQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__controller_genericBTRemote, 0);
  objc_storeStrong((id *)&self->_keyboardAndMouseManager, 0);
  objc_destroyWeak((id *)&self->_firstMicroGamepad);
  objc_storeStrong((id *)&self->_controllersByRegistryID, 0);
  objc_storeStrong((id *)&self->_controllersByUDID, 0);
  objc_storeStrong(&self->_hidEventObservation, 0);
  objc_storeStrong((id *)&self->_currentExtendedGamepad, 0);
  objc_storeStrong((id *)&self->_currentMicroGamepad, 0);
  objc_storeStrong((id *)&self->_currentController, 0);
  objc_storeStrong((id *)&self->_hidEventSource, 0);
  objc_storeStrong((id *)&self->_ipcObjectRegistry, 0);
  objc_storeStrong((id *)&self->_hidSystemClientQueue, 0);
  objc_storeStrong((id *)&self->_controllersQueue, 0);
}

- (NSObject)identifier
{
  return CFSTR("SharedManagee");
}

- (id)IPCObjectWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_ipcRegistryLock;
  id v5;
  void *v6;

  p_ipcRegistryLock = &self->_ipcRegistryLock;
  v5 = a3;
  os_unfair_lock_lock(p_ipcRegistryLock);
  -[NSMapTable objectForKey:](self->_ipcObjectRegistry, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_ipcRegistryLock);
  return v6;
}

- (void)registerIPCObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "copyWithZone:", 0);

  if (!v8)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManager.m"), 500, CFSTR("Object has nil IPCIdentifier"));

  }
  os_unfair_lock_lock(&self->_ipcRegistryLock);
  -[NSMapTable setObject:forKey:](self->_ipcObjectRegistry, "setObject:forKey:", v5, v8);

  os_unfair_lock_unlock(&self->_ipcRegistryLock);
}

- (id)serviceClientForIPCService:(id)a3
{
  return 0;
}

- (void)_legacy_init
{
  NSMutableDictionary *v3;
  NSMutableDictionary *controllersByUDID;
  NSMutableDictionary *v5;
  NSMutableDictionary *controllersByRegistryID;
  GCKeyboardAndMouseManager *v7;
  GCKeyboardAndMouseManager *keyboardAndMouseManager;

  v3 = (NSMutableDictionary *)objc_opt_new();
  controllersByUDID = self->_controllersByUDID;
  self->_controllersByUDID = v3;

  v5 = (NSMutableDictionary *)objc_opt_new();
  controllersByRegistryID = self->_controllersByRegistryID;
  self->_controllersByRegistryID = v5;

  self->_currentMediaRemoteInputMode = -1;
  +[GCKeyboardAndMouseManager managerWithQueue:](GCKeyboardAndMouseManager, "managerWithQueue:", self->_controllersQueue);
  v7 = (GCKeyboardAndMouseManager *)objc_claimAutoreleasedReturnValue();
  keyboardAndMouseManager = self->_keyboardAndMouseManager;
  self->_keyboardAndMouseManager = v7;

}

- (BOOL)isAppInBackground
{
  void *v2;
  char v3;

  +[_GCCurrentApplicationForegroundMonitor sharedInstance]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppInBackground");

  return v3;
}

- (void)CBApplicationWillResignActive
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_GCControllerManager _legacy_stopHIDEventMonitor](self, "_legacy_stopHIDEventMonitor");
  -[_GCControllerManager controllers](self, "controllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "motion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "motion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_pauseMotionUpdates:", 1);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  +[GCController __daemon__appDidEnterBackground](GCController, "__daemon__appDidEnterBackground");

}

- (void)CBApplicationDidBecomeActive
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_GCControllerManager _legacy_startHIDEventMonitor](self, "_legacy_startHIDEventMonitor");
  -[_GCControllerManager controllers](self, "controllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "motion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "motion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_pauseMotionUpdates:", 0);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  +[GCController __daemon__appWillEnterForeground](GCController, "__daemon__appWillEnterForeground");

}

- (id)_legacy_makeHIDEventSource:(__IOHIDEventSystemClient *)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _GCHIDEventIOKitClient *v10;
  _GCHIDEventIOKitClient *v11;

  +[NSBundle mainBundle](&off_254DF2768, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("_GCBypassUIKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0
    || (+[UIApplication sharedApplication](&off_254DF2320, "sharedApplication"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v10 = -[_GCHIDEventIOKitClient initWithClient:queue:]([_GCHIDEventIOKitClient alloc], "initWithClient:queue:", a3, self->_hidSystemClientQueue);
  }
  else
  {
    +[UIApplication sharedApplication](&off_254DF2320, "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v10 = -[_GCHIDEventUIKitClient initWithQueue:]([_GCHIDEventUIKitClient alloc], "initWithQueue:", self->_hidSystemClientQueue);
  }
  v11 = v10;
LABEL_7:

  return v11;
}

- (void)_legacy_startHIDDeviceMonitor
{
  NSObject *v3;
  uint8_t v4[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "startHIDEventSystemClient", v4, 2u);
    }

  }
  -[_GCControllerManager setupHIDMonitor:](self, "setupHIDMonitor:", 1);
}

- (void)_legacy_stopHIDDeviceMonitor
{
  NSObject *v3;
  uint8_t v4[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "stopHIDEventSystemClient", v4, 2u);
    }

  }
  -[_GCControllerManager teardownHIDMonitor:](self, "teardownHIDMonitor:", 0);
}

- (void)_legacy_startHIDEventMonitor
{
  void *v3;
  id hidEventObservation;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "startHIDEventMonitor", buf, 2u);
    }

  }
  if (!self->_hidSystemClient)
    -[_GCControllerManager _legacy_startHIDDeviceMonitor](self, "_legacy_startHIDDeviceMonitor");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60___GCControllerManager_Legacy___legacy_startHIDEventMonitor__block_invoke;
  v6[3] = &unk_24D2B6038;
  v6[4] = self;
  -[_GCControllerManager observeHIDEvents:](self, "observeHIDEvents:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  hidEventObservation = self->_hidEventObservation;
  self->_hidEventObservation = v3;

}

- (void)_legacy_stopHIDEventMonitor
{
  id hidEventObservation;
  NSObject *v4;
  uint8_t v5[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "stopHIDEventMonitor", v5, 2u);
    }

  }
  hidEventObservation = self->_hidEventObservation;
  self->_hidEventObservation = 0;

}

- (void)_legacy_publishController:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _GCControllerManager *v8;

  v4 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "areAllHIDDevicesConnected") && (objc_msgSend(v4, "isPublished") & 1) == 0)
  {
    objc_msgSend(v4, "_legacy_invalidateDescription");
    objc_msgSend(v4, "setPublished:", 1);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58___GCControllerManager_Legacy___legacy_publishController___block_invoke;
    v6[3] = &unk_24D2B2B48;
    v7 = v4;
    v8 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

- (void)updateCurrentControllerAndProfileForUnpublishedController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  _GCControllerManager *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  _GCControllerManager *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v32, OS_LOG_TYPE_DEFAULT, "current GCController disconnected, searching for more recently used controller", buf, 2u);
    }

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[_GCControllerManager _legacy_controllers](self, "_legacy_controllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (!v5)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_28;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v39;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v39 != v9)
        objc_enumerationMutation(obj);
      v11 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * v10);
      if (v11 != v4)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v10), "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "profile");
            v36 = self;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastEventTimestamp");
            *(_DWORD *)buf = 134217984;
            v43 = v28;
            _os_log_impl(&dword_215181000, v26, OS_LOG_TYPE_DEFAULT, "candidate controller lastEventTimestamp=%f", buf, 0xCu);

            self = v36;
          }

        }
        objc_msgSend(v12, "lastEventTimestamp");
        v14 = v13;
        objc_msgSend(v8, "profile");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastEventTimestamp");
        v17 = v16;

        if (v14 >= v17)
        {
          v18 = v11;

          v8 = v18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_GCControllerManager currentExtendedGamepad](self, "currentExtendedGamepad");
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_GCControllerManager currentMicroGamepad](self, "currentMicroGamepad");
          v19 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v20 = (void *)v19;
        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v12, "lastEventTimestamp");
        v22 = v21;
        objc_msgSend(v20, "lastEventTimestamp");
        if (v22 >= v23)
        {
          v24 = self;
          v25 = v12;

          v7 = v25;
          self = v24;
        }

      }
      ++v10;
    }
    while (v6 != v10);
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    v6 = v29;
  }
  while (v29);
LABEL_28:

  v30 = v7;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "profile");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastEventTimestamp");
      *(_DWORD *)buf = 138412546;
      v43 = v8;
      v44 = 2048;
      v45 = v35;
      _os_log_impl(&dword_215181000, v33, OS_LOG_TYPE_DEFAULT, "setting current controller to %@, as lastEventTimestamp=%f", buf, 0x16u);

    }
  }
  -[_GCControllerManager currentController](self, "currentController");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  if (v31 == v4)
    -[_GCControllerManager setCurrentController:](self, "setCurrentController:", v8);
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_GCControllerManager setCurrentExtendedGamepad:](self, "setCurrentExtendedGamepad:", v30);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[_GCControllerManager setCurrentMicroGamepad:](self, "setCurrentMicroGamepad:", v30);
    }
  }

}

- (void)_legacy_unpublishController:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _GCControllerManager *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "isPublished"))
  {
    objc_msgSend(v4, "setPublished:", 0);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "productCategory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v4;
        _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_DEFAULT, "posting GCControllerDidDisconnectNotification for %@ controller: %@", buf, 0x16u);

      }
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60___GCControllerManager_Legacy___legacy_unpublishController___block_invoke;
    v8[3] = &unk_24D2B2B48;
    v9 = v4;
    v10 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

- (void)storeController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(v4, "deviceHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_controllersByUDID, "setObject:forKey:", v4, v5);
  objc_msgSend(v4, "hidServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v20;
    *(_QWORD *)&v10 = 138412290;
    v18 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "registryID", v18, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!gc_isInternalBuild())
        {
          if (!v14)
            goto LABEL_9;
LABEL_8:
          -[NSMutableDictionary setObject:forKey:](self->_controllersByRegistryID, "setObject:forKey:", v4, v14);
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_DEFAULT, "added to controllers by registry id lookup", buf, 2u);
            }

          }
          goto LABEL_9;
        }
        getGCLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v24 = v14;
          _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_DEFAULT, "got registryID = %@", buf, 0xCu);
        }

        if (v14)
          goto LABEL_8;
LABEL_9:

        ++v13;
      }
      while (v11 != v13);
      v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      v11 = v17;
    }
    while (v17);
  }

}

- (void)addController:(id)a3
{
  id v4;
  NSObject *controllersQueue;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _GCControllerManager *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "hidServices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "addController:%@, services: %@", buf, 0x16u);

    }
  }
  controllersQueue = self->_controllersQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46___GCControllerManager_Legacy__addController___block_invoke;
  v9[3] = &unk_24D2B2B48;
  v10 = v4;
  v11 = self;
  v6 = v4;
  dispatch_barrier_sync(controllersQueue, v9);

}

- (void)removeController:(id)a3
{
  -[_GCControllerManager removeController:registryID:](self, "removeController:registryID:", a3, 0);
}

- (void)removeController:(id)a3 registryID:(id)a4
{
  id v6;
  id v7;
  NSObject *controllersQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  controllersQueue = self->_controllersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60___GCControllerManager_Legacy__removeController_registryID___block_invoke;
  block[3] = &unk_24D2B3D70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(controllersQueue, block);

}

- (void)_queue_removeController:(id)a3 registryID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *controller_genericBTRemote;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllersQueue);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412546;
      v21 = v6;
      v22 = 2048;
      v23 = objc_msgSend(v6, "deviceHash");
      _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_DEFAULT, "removeController:%@ for hash: %lu", (uint8_t *)&v20, 0x16u);
    }

  }
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(v6, "deviceHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_controllersByUDID, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412546;
        v21 = v7;
        v22 = 2112;
        v23 = (uint64_t)v8;
        _os_log_impl(&dword_215181000, v19, OS_LOG_TYPE_DEFAULT, "removing from registry lookup with registry ID: %@ and UDID: %@", (uint8_t *)&v20, 0x16u);
      }

    }
    -[NSMutableDictionary removeObjectForKey:](self->_controllersByRegistryID, "removeObjectForKey:", v7);
  }
  objc_msgSend(v9, "physicalInputProfile");
  controller_genericBTRemote = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(controller_genericBTRemote, "conformsToProtocol:", &unk_254DCB1F0))
  {
    objc_msgSend(v9, "physicalInputProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "deviceType") == 5)
    {

    }
    else
    {
      objc_msgSend(v9, "physicalInputProfile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "deviceType");

      if (v13 != 6)
        goto LABEL_11;
    }
    controller_genericBTRemote = self->__controller_genericBTRemote;
    self->__controller_genericBTRemote = 0;
  }

LABEL_11:
  objc_msgSend(v6, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_18;
  }
  objc_msgSend(v6, "hidServices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 < 2)
  {
LABEL_18:
    objc_msgSend(v9, "setAllHIDDevicesConnected:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_controllersByUDID, "removeObjectForKey:", v8);
    -[_GCControllerManager _legacy_unpublishController:](self, "_legacy_unpublishController:", v9);
    goto LABEL_19;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v7;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_DEFAULT, "Coalesced keyboard was removed with registryID: %@", (uint8_t *)&v20, 0xCu);
    }

  }
LABEL_19:

}

- (id)_legacy_controllers
{
  NSObject *controllersQueue;
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
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  controllersQueue = self->_controllersQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51___GCControllerManager_Legacy___legacy_controllers__block_invoke;
  v5[3] = &unk_24D2B3008;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(controllersQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isExistingController:(id)a3
{
  id v4;
  NSObject *controllersQueue;
  id v6;
  _QWORD block[4];
  id v9;
  _GCControllerManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  controllersQueue = self->_controllersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53___GCControllerManager_Legacy__isExistingController___block_invoke;
  block[3] = &unk_24D2B6060;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_barrier_sync(controllersQueue, block);
  LOBYTE(controllersQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)controllersQueue;
}

- (void)_legacy_addControllerWithServiceInfo:(id)a3
{
  id v4;
  void *v5;
  GCController *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    objc_msgSend(v4, "numberPropertyForKey:", CFSTR("GameControllerSupportedHIDDevice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "BOOLValue") & 1) == 0
      && (objc_msgSend(ControllerClassForService((__IOHIDServiceClient *)objc_msgSend(v4, "service")), "conformsToProtocol:", &unk_254DC73D0) & 1) == 0&& !-[GCKeyboardAndMouseManager addDeviceWithServiceRef:](self->_keyboardAndMouseManager, "addDeviceWithServiceRef:", objc_msgSend(v4, "service")))
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "registryID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 138412546;
          v10 = v4;
          v11 = 2112;
          v12 = v8;
          _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "addControllerWithServiceInfo:%@ registryID:%@", (uint8_t *)&v9, 0x16u);

        }
      }
      v6 = -[GCController initWithServiceRef:]([GCController alloc], "initWithServiceRef:", objc_msgSend(v4, "service"));
      if (v6)
        -[_GCControllerManager addController:](self, "addController:", v6);

    }
  }

}

- (void)_legacy_removeControllerWithServiceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    -[GCKeyboardAndMouseManager removeDeviceWithServiceRef:](self->_keyboardAndMouseManager, "removeDeviceWithServiceRef:", objc_msgSend(v4, "service"));
    objc_msgSend(v4, "registryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_controllersByRegistryID, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_GCControllerManager removeController:registryID:](self, "removeController:registryID:", v6, v5);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "hidServices");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 138412290;
          v10 = v8;
          _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "Removing: %@", (uint8_t *)&v9, 0xCu);

        }
      }
      objc_msgSend(v6, "removeServiceRef:", objc_msgSend(v4, "service"));
    }

  }
}

- (id)coalescedKeyboard
{
  return -[GCKeyboardAndMouseManager coalescedKeyboard](self->_keyboardAndMouseManager, "coalescedKeyboard");
}

- (id)mice
{
  void *v2;
  void *v3;
  id v4;

  -[GCKeyboardAndMouseManager mice](self->_keyboardAndMouseManager, "mice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (GCMouse)currentMouse
{
  return -[GCKeyboardAndMouseManager currentMouse](self->_keyboardAndMouseManager, "currentMouse");
}

- (GCController)currentController
{
  return self->_currentController;
}

- (void)setCurrentController:(id)a3
{
  GCController *v5;
  _GCControllerManager *v6;
  id *p_currentController;
  GCController *currentController;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v5 = (GCController *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_currentController = (id *)&v6->_currentController;
  currentController = v6->_currentController;
  if (currentController != v5)
  {
    if (currentController)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[_GCControllerManager(Legacy) setCurrentController:].cold.2((uint64_t)&v6->_currentController, v28, v29, v30, v31, v32, v33, v34);

      }
      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCControllerDidStopBeingCurrentNotification"), *p_currentController, 0);

    }
    objc_storeStrong((id *)&v6->_currentController, a3);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[_GCControllerManager(Legacy) setCurrentController:].cold.1((uint64_t)&v6->_currentController, v21, v22, v23, v24, v25, v26, v27);

    }
    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("GCControllerDidBecomeCurrentNotification"), *p_currentController, 0);

    objc_msgSend(*p_currentController, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v13 = *p_currentController;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v13, "profile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCControllerManager setCurrentExtendedGamepad:](v6, "setCurrentExtendedGamepad:", v14);

      objc_msgSend(*p_currentController, "profile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCControllerManager setCurrentMicroGamepad:](v6, "setCurrentMicroGamepad:", v15);
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v13, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __deprecated_GCGamepad_Class();
    v17 = objc_opt_isKindOfClass();

    v18 = *p_currentController;
    if ((v17 & 1) != 0)
    {
      objc_msgSend(v18, "profile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCControllerManager setCurrentMicroGamepad:](v6, "setCurrentMicroGamepad:", v15);
      goto LABEL_12;
    }
    objc_msgSend(v18, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) != 0)
    {
      objc_msgSend(*p_currentController, "profile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCControllerManager setCurrentMicroGamepad:](v6, "setCurrentMicroGamepad:", v15);
      goto LABEL_12;
    }
  }
LABEL_13:
  objc_sync_exit(v6);

}

- (GCMicroGamepad)currentMicroGamepad
{
  return self->_currentMicroGamepad;
}

- (void)setCurrentMicroGamepad:(id)a3
{
  GCMicroGamepad *v5;
  _GCControllerManager *v6;
  GCMicroGamepad **p_currentMicroGamepad;
  GCMicroGamepad *currentMicroGamepad;
  void *v9;
  void *v10;
  NSObject *v11;
  GCMicroGamepad *v12;
  NSObject *v13;
  GCMicroGamepad *v14;
  int v15;
  GCMicroGamepad *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (GCMicroGamepad *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_currentMicroGamepad = &v6->_currentMicroGamepad;
  currentMicroGamepad = v6->_currentMicroGamepad;
  if (currentMicroGamepad != v5)
  {
    if (currentMicroGamepad)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *p_currentMicroGamepad;
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_DEFAULT, "GCMicroGamepadDidStopBeingCurrent - %@", (uint8_t *)&v15, 0xCu);
        }

      }
      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCMicroGamepadDidStopBeingCurrentNotification"), *p_currentMicroGamepad, 0);

    }
    objc_storeStrong((id *)&v6->_currentMicroGamepad, a3);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *p_currentMicroGamepad;
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "GCMicroGamepadDidBecomeCurrent - %@", (uint8_t *)&v15, 0xCu);
      }

    }
    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("GCMicroGamepadDidBecomeCurrentNotification"), *p_currentMicroGamepad, 0);

  }
  objc_sync_exit(v6);

}

- (GCExtendedGamepad)currentExtendedGamepad
{
  return self->_currentExtendedGamepad;
}

- (void)setCurrentExtendedGamepad:(id)a3
{
  GCExtendedGamepad *v5;
  _GCControllerManager *v6;
  GCExtendedGamepad **p_currentExtendedGamepad;
  GCExtendedGamepad *currentExtendedGamepad;
  void *v9;
  void *v10;
  NSObject *v11;
  GCExtendedGamepad *v12;
  NSObject *v13;
  GCExtendedGamepad *v14;
  int v15;
  GCExtendedGamepad *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (GCExtendedGamepad *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_currentExtendedGamepad = &v6->_currentExtendedGamepad;
  currentExtendedGamepad = v6->_currentExtendedGamepad;
  if (currentExtendedGamepad != v5)
  {
    if (currentExtendedGamepad)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *p_currentExtendedGamepad;
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_DEFAULT, "GCExtendedGamepadDidStopBeingCurrent - %@", (uint8_t *)&v15, 0xCu);
        }

      }
      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCExtendedGamepadDidStopBeingCurrentNotification"), *p_currentExtendedGamepad, 0);

    }
    objc_storeStrong((id *)&v6->_currentExtendedGamepad, a3);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *p_currentExtendedGamepad;
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "GCExtendedGamepadDidBecomeCurrent - %@", (uint8_t *)&v15, 0xCu);
      }

    }
    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("GCExtendedGamepadDidBecomeCurrentNotification"), *p_currentExtendedGamepad, 0);

  }
  objc_sync_exit(v6);

}

- (void)_legacy_updateControllerWithEvent:(__IOHIDEvent *)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  if ((!-[_GCControllerManager isAppInBackground](self, "isAppInBackground")
     || -[_GCControllerManager shouldMonitorBackgroundEvents](self, "shouldMonitorBackgroundEvents"))
    && !-[GCKeyboardAndMouseManager handleHIDEvent:](self->_keyboardAndMouseManager, "handleHIDEvent:", a3))
  {
    +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", IOHIDEventGetSenderID());
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (IOHIDEventGetType() == 11 && _DescendantPointerEvent_0((uint64_t)a3))
    {
      +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", IOHIDEventGetSenderID());
      v5 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v5;
    }
    -[NSMutableDictionary objectForKey:](self->_controllersByRegistryID, "objectForKey:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isComponentBased");
    if (v6)
    {
      if ((v7 & 1) == 0)
      {
        -[_GCControllerManager setCurrentController:](self, "setCurrentController:", v6);
        objc_msgSend(v6, "_legacy_handleEvent:", a3);
      }
    }

  }
}

- (void)removeCoalescedControllerComponent:(id)a3
{
  GCController *v4;
  GCController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  GCController *v11;
  GCController *v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  GCController *v16;
  GCController *controller_genericBTRemote;
  GCController *v18;
  GCController *v19;
  BOOL v20;
  void *v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  GCController *v28;
  _GCControllerManager *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  GCController *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = (GCController *)a3;
  v29 = self;
  -[_GCControllerManager firstMicroGamepad](self, "firstMicroGamepad");
  v5 = (GCController *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCController deviceHash](v4, "deviceHash");
  -[GCController profile](v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "owner") == v6)
    objc_msgSend(v7, "setOwner:", 0);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary allValues](v29->_controllersByUDID, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v9)
  {
    v10 = v9;
    v28 = v5;
    v27 = v7;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v8);
        v16 = *(GCController **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (v16 != v4
          && objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "isATVRemote")
          && -[GCController areAllHIDDevicesConnected](v16, "areAllHIDDevicesConnected"))
        {
          ++v13;
          controller_genericBTRemote = v29->__controller_genericBTRemote;
          v18 = v16;
          if (v16 == controller_genericBTRemote)
            v19 = v11;
          else
            v19 = v12;
          if (v16 == controller_genericBTRemote)
            v11 = v18;
          else
            v12 = v18;

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v10);

    if (v13)
    {
      if (v11 && (v11 == v29->__controller_genericBTRemote ? (v20 = v13 == 1) : (v20 = 0), v20))
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v11;
            _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_DEFAULT, "Publishing directional gamepad as the first microgamepad, since no others remain... %@", buf, 0xCu);
          }

        }
        v5 = v28;
        -[_GCControllerManager _legacy_unpublishController:](v29, "_legacy_unpublishController:", v28, v27);
        -[_GCControllerManager setFirstMicroGamepad:](v29, "setFirstMicroGamepad:", v11);
        -[_GCControllerManager _legacy_publishController:](v29, "_legacy_publishController:", v11);
      }
      else
      {
        v5 = v28;
        if (v28 == v4)
        {
          v7 = v27;
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v12;
              _os_log_impl(&dword_215181000, v26, OS_LOG_TYPE_DEFAULT, "Publishing candidate gamepad as the first microgamepad, since the first microgamepad was disconnected... %@", buf, 0xCu);
            }

            v7 = v27;
            v5 = v28;
          }
          -[_GCControllerManager _legacy_unpublishController:](v29, "_legacy_unpublishController:", v4, v27);
          -[_GCControllerManager setFirstMicroGamepad:](v29, "setFirstMicroGamepad:", v12);
          -[_GCControllerManager _legacy_publishController:](v29, "_legacy_publishController:", v12);
          goto LABEL_36;
        }
      }
      v7 = v27;
      goto LABEL_36;
    }
    v7 = v27;
    v5 = v28;
  }
  else
  {

    v12 = 0;
    v11 = 0;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v5;
      _os_log_impl(&dword_215181000, v24, OS_LOG_TYPE_DEFAULT, "We are the last microgamepad, disconnecting the first microgamepad... %@", buf, 0xCu);
    }

  }
  -[_GCControllerManager _legacy_unpublishController:](v29, "_legacy_unpublishController:", v5, v27);
  -[_GCControllerManager setFirstMicroGamepad:](v29, "setFirstMicroGamepad:", 0);
LABEL_36:
  -[GCController hidServices](v4, "hidServices", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 <= 1)
  {
    +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", -[GCController deviceHash](v4, "deviceHash"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v29->_controllersByUDID, "removeObjectForKey:", v23);

  }
}

- (int)connectedATVRemoteCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_controllersByUDID, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isATVRemote"))
          v5 += objc_msgSend(v8, "areAllHIDDevicesConnected");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GCController)firstMicroGamepad
{
  return (GCController *)objc_loadWeakRetained((id *)&self->_firstMicroGamepad);
}

- (void)setFirstMicroGamepad:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  if (obj)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_firstMicroGamepad);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)&self->_firstMicroGamepad);
      -[_GCControllerManager _legacy_unpublishController:](self, "_legacy_unpublishController:", v5);

    }
  }
  objc_storeWeak((id *)&self->_firstMicroGamepad, obj);

}

- (BOOL)combineSiriRemoteHIDDevicesWithNewController:(id)a3 existingController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  BOOL v27;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hidServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registryID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v41 = 138412546;
        v42 = (uint64_t)v6;
        v43 = 2112;
        v44 = v7;
        _os_log_impl(&dword_215181000, v29, OS_LOG_TYPE_DEFAULT, "combineSiriRemoteHIDDevicesWithNewController: %@ existingController: %@", (uint8_t *)&v41, 0x16u);
      }

    }
    objc_msgSend(v7, "motion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_stopDeviceMotionUpdates");

    objc_msgSend(v7, "motion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueChangedHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)MEMORY[0x2199DEBB0](v13);
        v41 = 138412290;
        v42 = (uint64_t)v31;
        _os_log_impl(&dword_215181000, v30, OS_LOG_TYPE_DEFAULT, "previous motion handler = %@", (uint8_t *)&v41, 0xCu);

      }
    }
    if (objc_msgSend(v6, "physicalDeviceUsesCompass"))
      objc_msgSend(v7, "setPhysicalDeviceUsesCompass:", objc_msgSend(v6, "physicalDeviceUsesCompass"));
    objc_msgSend(v7, "addServiceRefs:", v6);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v41 = 138412290;
        v42 = (uint64_t)v10;
        _os_log_impl(&dword_215181000, v32, OS_LOG_TYPE_DEFAULT, "registering existing controller with registry id = %@", (uint8_t *)&v41, 0xCu);
      }

    }
    -[NSMutableDictionary setObject:forKey:](self->_controllersByRegistryID, "setObject:forKey:", v7, v10);
    objc_msgSend(v6, "clearServiceRef");
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "hidServices");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138412290;
        v42 = (uint64_t)v34;
        _os_log_impl(&dword_215181000, v33, OS_LOG_TYPE_DEFAULT, "serviceRefs: %@", (uint8_t *)&v41, 0xCu);

      }
      if (!v13)
      {
LABEL_10:
        objc_msgSend(v7, "physicalDeviceUniqueID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v6, "physicalDeviceUniqueID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setPhysicalDeviceUniqueID:", v16);

        }
        objc_msgSend(v7, "profile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "conformsToProtocol:", &unk_254DCB1F0);

        if (!v18)
        {
          v27 = 0;
LABEL_31:

          goto LABEL_32;
        }
        objc_msgSend(v7, "profile");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "profile");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl(&dword_215181000, v35, OS_LOG_TYPE_DEFAULT, "========================================================================", (uint8_t *)&v41, 2u);
          }

        }
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = objc_msgSend(v19, "deviceType");
            v41 = 134217984;
            v42 = v37;
            _os_log_impl(&dword_215181000, v36, OS_LOG_TYPE_DEFAULT, "Existing device type: %ld", (uint8_t *)&v41, 0xCu);
          }

        }
        if (!objc_msgSend(v19, "deviceType"))
          objc_msgSend(v19, "setDeviceType:", objc_msgSend(v20, "deviceType"));
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = objc_msgSend(v19, "deviceType");
            v41 = 134217984;
            v42 = v39;
            _os_log_impl(&dword_215181000, v38, OS_LOG_TYPE_DEFAULT, "New device type: %ld", (uint8_t *)&v41, 0xCu);
          }

        }
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl(&dword_215181000, v40, OS_LOG_TYPE_DEFAULT, "========================================================================", (uint8_t *)&v41, 2u);
          }

        }
        if (objc_msgSend(v19, "deviceType") != 1
          || (objc_msgSend(v7, "hidServices"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v21, "count"),
              v21,
              v22 <= 2))
        {
          if (objc_msgSend(v19, "deviceType") != 2
            || (objc_msgSend(v7, "hidServices"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = objc_msgSend(v23, "count"),
                v23,
                v24 <= 2))
          {
            if (objc_msgSend(v19, "deviceType") != 6
              || (objc_msgSend(v7, "hidServices"),
                  v25 = (void *)objc_claimAutoreleasedReturnValue(),
                  v26 = objc_msgSend(v25, "count"),
                  v25,
                  v26 < 2))
            {
              v27 = 0;
              goto LABEL_30;
            }
            objc_storeStrong((id *)&self->__controller_genericBTRemote, a4);
          }
        }
        v27 = 1;
LABEL_30:

        goto LABEL_31;
      }
    }
    else if (!v13)
    {
      goto LABEL_10;
    }
    objc_msgSend(v7, "motion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValueChangedHandler:", v13);

    goto LABEL_10;
  }
  v27 = 0;
LABEL_32:

  return v27;
}

@end
