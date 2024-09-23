@implementation SYService

char *__64__SYService_initWithService_priority_qos_asMasterStore_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  char *v7;

  v2 = (void *)MEMORY[0x212BE0D64]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateForLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = (char *)malloc_type_malloc(objc_msgSend(v6, "length") + 200, 0x56405FE4uLL);
  *(_DWORD *)v7 = 2;
  __strlcpy_chk();
  __strlcpy_chk();
  snprintf(v7 + 136, 0x40uLL, "Service '%s'", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  *((_DWORD *)v7 + 1) = objc_msgSend(v6, "length");
  objc_msgSend(v6, "getBytes:length:", v7 + 200, objc_msgSend(v6, "length"));

  objc_autoreleasePoolPop(v2);
  return v7;
}

- (PBCodable)stateForLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  $FC3B5D260D4F8D1F83CF9B539A238CFB flags;
  uint64_t v14;

  v3 = (void *)objc_opt_new();
  -[SYService name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  -[SYService syncEngine](self, "syncEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateForLogging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEngine:", v6);

  -[SYService currentSession](self, "currentSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stateForLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSession:", v8);

  objc_msgSend(v3, "setSessionQueueRunning:", -[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended") ^ 1);
  -[SYDevice stateForLogging](self->_targetedDevice, "stateForLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetedDevice:", v9);

  -[SYService options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCocoaTransportOptions:", v10);

  -[SYService peerID](self, "peerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPeerID:", v11);

  objc_msgSend(v3, "setPeerGenerationID:", self->_generationID);
  if (-[SYService isMasterStore](self, "isMasterStore"))
    v12 = 1;
  else
    v12 = 2;
  objc_msgSend(v3, "setServiceType:", v12);
  os_unfair_lock_lock(&self->_flagLock);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    v14 = 2;
  else
    v14 = (*(unsigned int *)&flags >> 1) & 1;
  objc_msgSend(v3, "setEnqueuedSyncType:", v14);
  os_unfair_lock_unlock(&self->_flagLock);
  return (PBCodable *)v3;
}

- (SYSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (NSString)peerID
{
  NSString *peerID;
  void *v4;
  NSString *v5;
  NSString *v6;
  __CFString *v7;

  peerID = self->_peerID;
  if (peerID)
    goto LABEL_3;
  -[SYService persistentStore](self, "persistentStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerID");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = self->_peerID;
  self->_peerID = v5;

  peerID = self->_peerID;
  if (peerID)
  {
LABEL_3:
    v7 = peerID;
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[SYService peerID].cold.1();
    v7 = CFSTR("0BADF00D-DEAD-0000-9999-1234567890AB");
  }
  return (NSString *)v7;
}

- (SYPersistentStore)persistentStore
{
  os_unfair_lock_s *p_persistentStoreLock;
  SYPersistentStore *v4;
  SYPersistentStore *v5;
  SYPersistentStore *persistentStore;

  p_persistentStoreLock = &self->_persistentStoreLock;
  os_unfair_lock_lock(&self->_persistentStoreLock);
  v4 = self->_persistentStore;
  if (!v4)
  {
    +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", self->_serviceName);
    v5 = (SYPersistentStore *)objc_claimAutoreleasedReturnValue();
    persistentStore = self->_persistentStore;
    self->_persistentStore = v5;

    v4 = self->_persistentStore;
  }
  os_unfair_lock_unlock(p_persistentStoreLock);
  return v4;
}

- (void)peerID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "LYING about peerID, because it's nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (NSDictionary)options
{
  return self->_defaultOptions;
}

- (NSString)name
{
  return self->_serviceName;
}

- (BOOL)isMasterStore
{
  return *(_DWORD *)&self->_flags & 1;
}

- (SYSession)currentSession
{
  return self->_currentSession;
}

- (SYService)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("-[%@ init] is not supported."), v6);

  return 0;
}

- (SYService)initWithService:(id)a3 priority:(int64_t)a4 asMasterStore:(BOOL)a5 options:(id)a6
{
  _BOOL8 v7;
  int64_t defaultPriority;
  unsigned int v9;
  uint64_t v10;

  v7 = a5;
  defaultPriority = self->_defaultPriority;
  if (defaultPriority)
    v9 = 17;
  else
    v9 = 21;
  if (defaultPriority == 20)
    v10 = 25;
  else
    v10 = v9;
  return -[SYService initWithService:priority:qos:asMasterStore:options:](self, "initWithService:priority:qos:asMasterStore:options:", a3, a4, v10, v7, a6);
}

- (SYService)initWithService:(id)a3 priority:(int64_t)a4 qos:(unsigned int)a5 asMasterStore:(BOOL)a6 options:(id)a7
{
  uint64_t v8;
  SYService *v11;
  SYService *v12;
  id v13;
  const char *v14;
  os_activity_t v15;
  OS_os_activity *serviceActivity;
  void *v17;
  uint64_t v18;
  NSString *generationID;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  id v29;
  void *v30;
  void *v31;
  id v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *incomingIOQueue;
  id v35;
  void *v36;
  void *v37;
  id v38;
  dispatch_queue_t v39;
  OS_dispatch_queue *delegateQueue;
  void *v41;
  uint64_t v42;
  id v43;
  const char *v44;
  __CFString *v45;
  __CFString *v46;
  NSString *v47;
  NSObject *v48;
  uint64_t v49;
  NSString *serviceName;
  uint64_t v51;
  NSDictionary *defaultOptions;
  unsigned int v53;
  id v54;
  void *v55;
  void *v56;
  _SYMultiSuspendableQueue *v57;
  _SYMultiSuspendableQueue *sessionQueue;
  uint64_t v59;
  SYDevice *targetedDevice;
  void *v61;
  BOOL v62;
  NSObject *v63;
  dispatch_source_t v64;
  OS_dispatch_source *processSignalSource;
  NSObject *v66;
  uint64_t v67;
  NSMutableArray *onSessionEnd;
  void *v69;
  id v70;
  SYService *v71;
  _BOOL4 v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  _QWORD handler[4];
  id v79;
  os_activity_scope_state_s state;
  objc_super v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  __CFString *v87;
  __int16 v88;
  NSString *v89;
  uint64_t v90;

  v73 = a6;
  v8 = *(_QWORD *)&a5;
  v90 = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  v74 = a7;
  v81.receiver = self;
  v81.super_class = (Class)SYService;
  v11 = -[SYService init](&v81, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_flagLock._os_unfair_lock_opaque = 0;
    v13 = v75;
    if ((objc_msgSend(v13, "hasSuffix:", CFSTR("addressbooksync")) & 1) != 0)
    {
      v14 = "addressbooksync";
    }
    else if ((objc_msgSend(v13, "hasSuffix:", CFSTR("appregistrysync")) & 1) != 0)
    {
      v14 = "appregistrysync";
    }
    else if ((objc_msgSend(v13, "hasSuffix:", CFSTR("eventkitsync")) & 1) != 0)
    {
      v14 = "eventkitsync";
    }
    else if ((objc_msgSend(v13, "hasSuffix:", CFSTR("location.auth")) & 1) != 0)
    {
      v14 = "location.auth";
    }
    else if ((objc_msgSend(v13, "hasSuffix:", CFSTR("location.wifitilesync")) & 1) != 0)
    {
      v14 = "location.wifitilesync";
    }
    else if ((objc_msgSend(v13, "hasSuffix:", CFSTR("maps.sync")) & 1) != 0)
    {
      v14 = "maps.sync";
    }
    else if ((objc_msgSend(v13, "hasSuffix:", CFSTR("tccd.sync")) & 1) != 0)
    {
      v14 = "tccd.sync";
    }
    else if (objc_msgSend(v13, "hasSuffix:", CFSTR("voicemailsync")))
    {
      v14 = "voicemailsync";
    }
    else
    {
      v14 = "SYService";
    }
    v15 = _os_activity_create(&dword_211704000, v14, MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);

    serviceActivity = v12->_serviceActivity;
    v12->_serviceActivity = (OS_os_activity *)v15;

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter((os_activity_t)v12->_serviceActivity, &state);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "UUIDString");
    v18 = objc_claimAutoreleasedReturnValue();
    generationID = v12->_generationID;
    v12->_generationID = (NSString *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((_DWORD)v8)
    {
      dispatch_queue_attr_make_with_qos_class(v20, (dispatch_qos_class_t)v8, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v21 = v22;
    }
    v23 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v13, "pathExtension");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("CompanionSync.SYService.%@.%p"), v24, v12);

    v26 = objc_retainAutorelease(v25);
    v27 = dispatch_queue_create((const char *)objc_msgSend(v26, "UTF8String"), v21);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v27;

    dispatch_queue_set_specific((dispatch_queue_t)v12->_queue, (const void *)__SYService_Queue_Tag_Key, v12, 0);
    +[SYQueueDumper registerQueue:](SYQueueDumper, "registerQueue:", v12->_queue);
    v29 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v13, "pathExtension");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("CompanionSync.SYService.%@.incoming-io"), v30);

    v32 = objc_retainAutorelease(v31);
    v33 = dispatch_queue_create_with_target_V2((const char *)objc_msgSend(v32, "UTF8String"), v21, (dispatch_queue_t)v12->_queue);
    incomingIOQueue = v12->_incomingIOQueue;
    v12->_incomingIOQueue = (OS_dispatch_queue *)v33;

    +[SYQueueDumper registerQueue:](SYQueueDumper, "registerQueue:", v12->_incomingIOQueue);
    v35 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v13, "pathExtension");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("CompanionSync.SYService.%@.delegate"), v36);

    v38 = objc_retainAutorelease(v37);
    v39 = dispatch_queue_create((const char *)objc_msgSend(v38, "UTF8String"), v21);
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v39;

    +[SYQueueDumper registerQueue:](SYQueueDumper, "registerQueue:", v12->_delegateQueue);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v41 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v8;
      v43 = v38;
      if (v73)
        v44 = "as Master";
      else
        v44 = "as Slave";
      v45 = CFSTR("low");
      if (!a4)
        v45 = CFSTR("high");
      if (a4 == 20)
        v45 = CFSTR("urgent");
      v46 = v45;
      v47 = v12->_generationID;
      *(_DWORD *)buf = 138544130;
      v83 = v13;
      v84 = 2080;
      v85 = v44;
      v38 = v43;
      v8 = v42;
      v86 = 2114;
      v87 = v46;
      v88 = 2114;
      v89 = v47;
      v48 = v41;
      _os_log_impl(&dword_211704000, v48, OS_LOG_TYPE_DEFAULT, "CompanionSync initializing new SYService %{public}@ %s, %{public}@ priority, generation %{public}@", buf, 0x2Au);

    }
    v49 = objc_msgSend(v13, "copy");
    serviceName = v12->_serviceName;
    v12->_serviceName = (NSString *)v49;

    v12->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&v12->_flags & 0xFFFFFFFE | v73);
    v12->_defaultPriority = a4;
    v51 = objc_msgSend(v74, "copy");
    defaultOptions = v12->_defaultOptions;
    v12->_defaultOptions = (NSDictionary *)v51;

    v53 = *(_DWORD *)&v12->_flags & 0xFFFFFE3F | 0x80;
    *(_OWORD *)&v12->_defaultMessageTimeout = xmmword_2117AA460;
    v12->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)v53;
    v12->_engineType = 1;
    v12->_sendingBufferCap = 0x200000;
    v54 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v13, "pathExtension");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v54, "initWithFormat:", CFSTR("CompanionSync.SYService.%@.SessionStartQueue"), v55);

    v57 = -[_SYMultiSuspendableQueue initWithName:qosClass:serial:target:]([_SYMultiSuspendableQueue alloc], "initWithName:qosClass:serial:target:", v56, v8, 1, v12->_queue);
    sessionQueue = v12->_sessionQueue;
    v12->_sessionQueue = v57;

    -[_SYMultiSuspendableQueue suspend](v12->_sessionQueue, "suspend");
    if (!-[_SYMultiSuspendableQueue isSuspended](v12->_sessionQueue, "isSuspended"))
    {
      _os_assumes_log();
      -[SYService initWithService:priority:qos:asMasterStore:options:].cold.1();
    }
    -[SYService _setupPairingNotifications](v12, "_setupPairingNotifications");
    +[SYDevice targetableDevice](SYDevice, "targetableDevice");
    v59 = objc_claimAutoreleasedReturnValue();
    targetedDevice = v12->_targetedDevice;
    v12->_targetedDevice = (SYDevice *)v59;

    -[SYDevice pairingStorePath](v12->_targetedDevice, "pairingStorePath");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61 == 0;

    if (!v62)
    {
      *(_DWORD *)&v12->_flags |= 8u;
      -[SYService _updateMetaProtocolInfoForDevice:](v12, "_updateMetaProtocolInfoForDevice:", v12->_targetedDevice);
    }
    objc_initWeak((id *)buf, v12);
    -[_SYMultiSuspendableQueue dispatchQueue](v12->_sessionQueue, "dispatchQueue");
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, v63);
    processSignalSource = v12->_processSignalSource;
    v12->_processSignalSource = (OS_dispatch_source *)v64;

    v66 = v12->_processSignalSource;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __64__SYService_initWithService_priority_qos_asMasterStore_options___block_invoke;
    handler[3] = &unk_24CC655F8;
    objc_copyWeak(&v79, (id *)buf);
    dispatch_source_set_event_handler(v66, handler);
    dispatch_resume((dispatch_object_t)v12->_processSignalSource);
    v67 = objc_opt_new();
    onSessionEnd = v12->_onSessionEnd;
    v12->_onSessionEnd = (NSMutableArray *)v67;

    v69 = (void *)objc_msgSend(v13, "copy");
    objc_copyWeak(&v77, (id *)buf);
    v76 = v69;
    v70 = v69;
    v12->_stateHandle = os_state_add_handler();
    v71 = v12;

    objc_destroyWeak(&v77);
    objc_destroyWeak(&v79);
    objc_destroyWeak((id *)buf);

    os_activity_scope_leave(&state);
  }

  return v12;
}

void __64__SYService_initWithService_priority_qos_asMasterStore_options___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_processPendingChanges");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  os_state_remove_handler();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SYService;
  -[SYService dealloc](&v4, sel_dealloc);
}

- (void)_setupPairingNotifications
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SYService__setupPairingNotifications__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __39__SYService__setupPairingNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 188);
  if ((v2 & 0x20) == 0)
  {
    *(_DWORD *)(v1 + 188) = v2 | 0x20;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__deviceTargetabilityChanged_, CFSTR("SYDeviceTargetabilityChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__deviceRemoved_, CFSTR("SYDeviceRemovedNotification"), 0);

  }
}

- (void)_setProtocolVersionForRemoteOSVersion:(id)a3 build:(id)a4 remoteIsWatch:(BOOL)a5 switchingEngines:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  $FC3B5D260D4F8D1F83CF9B539A238CFB flags;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  $FC3B5D260D4F8D1F83CF9B539A238CFB v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a6;
  v7 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  os_unfair_lock_lock(&self->_flagLock);
  flags = self->_flags;
  os_unfair_lock_unlock(&self->_flagLock);
  if (!v7)
  {
    if (objc_msgSend(v11, "compare:options:", CFSTR("13E"), 64) == -1)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = _sync_log_facilities;
      if (!os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v19 = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      v14 = "Remote device is an iDevice running OS %{public}@ (%{public}@). Will use protocol v1 when communicating with this device.";
      goto LABEL_13;
    }
LABEL_8:
    v15 = 2;
    goto LABEL_15;
  }
  if (objc_msgSend(v11, "compare:options:range:", CFSTR("13V"), 64, 0, 3) != -1)
    goto LABEL_8;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v13 = _sync_log_facilities;
  if (!os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    goto LABEL_14;
  v19 = 138543618;
  v20 = v10;
  v21 = 2114;
  v22 = v11;
  v14 = "Remote device is an WATCH running OS %{public}@ (%{public}@). Will use protocol v1 when communicating with this device.";
LABEL_13:
  _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, 0x16u);
LABEL_14:
  v15 = 1;
LABEL_15:
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v16 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109120;
    LODWORD(v20) = v15;
    _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Updating protocol version for device OSInfo change: will use protocol v%d", (uint8_t *)&v19, 8u);
  }
  os_unfair_lock_lock(&self->_flagLock);
  self->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFFE3F | ((_DWORD)v15 << 6));
  os_unfair_lock_unlock(&self->_flagLock);
  if (v6)
  {
    v17 = (*(unsigned int *)&flags >> 6) & 7;
    if ((_DWORD)v15 != v17)
    {
      os_unfair_lock_lock(&self->_flagLock);
      v18 = self->_flags;
      os_unfair_lock_unlock(&self->_flagLock);
      if (v15 <= v17
        || ((*(unsigned int *)&v18 >> 11) & 7) == ((*(unsigned int *)&v18 >> 14) & 7)
        || !-[SYService _protocolVersion:supportsEngineType:](self, "_protocolVersion:supportsEngineType:", v15, (*(unsigned int *)&v18 >> 11) & 7))
      {
        if (v15 < v17
          && !-[SYService _protocolVersion:supportsEngineType:](self, "_protocolVersion:supportsEngineType:", v15, (*(unsigned int *)&v18 >> 14) & 7))
        {
          -[SYService _downgradeEngineForVersion:](self, "_downgradeEngineForVersion:", v15);
        }
      }
      else
      {
        -[SYService _upgradeEngineTo:](self, "_upgradeEngineTo:", (*(unsigned int *)&v18 >> 11) & 7);
      }
    }
  }

}

- (BOOL)_protocolVersion:(int)a3 supportsEngineType:(unsigned int)a4
{
  return a3 == 2 || a4 == 1;
}

- (void)_updateMetaProtocolInfoForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "deviceClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
    {
      v12 = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_INFO, "Remote device is a %{public}@ with system version %{public}@, build %{public}@", (uint8_t *)&v12, 0x20u);
    }
    v10 = objc_msgSend(v6, "hasPrefix:", CFSTR("Watch"));
    if ((_DWORD)v10)
    {
      os_unfair_lock_lock(&self->_flagLock);
      *(_DWORD *)&self->_flags |= 0x200u;
      os_unfair_lock_unlock(&self->_flagLock);
    }
    -[SYService _setProtocolVersionForRemoteOSVersion:build:remoteIsWatch:switchingEngines:](self, "_setProtocolVersionForRemoteOSVersion:build:remoteIsWatch:switchingEngines:", v7, v8, v10, 0);
    if ((*((_BYTE *)&self->_flags + 1) & 4) == 0)
    {
      os_unfair_lock_lock(&self->_flagLock);
      *(_DWORD *)&self->_flags |= 0x400u;
      os_unfair_lock_unlock(&self->_flagLock);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__deviceOSInfoChanged_, CFSTR("SYDeviceOSInfoChangedNotification"), v5);

    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, (os_log_type_t)0x90u))
      -[SYService _updateMetaProtocolInfoForDevice:].cold.1();
    os_unfair_lock_lock(&self->_flagLock);
    self->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFFE3F | 0x80);
    os_unfair_lock_unlock(&self->_flagLock);
  }

}

- (void)_deviceOSInfoChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __34__SYService__deviceOSInfoChanged___block_invoke;
  v13[3] = &unk_24CC65C10;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v10 = v6;
  v11 = v8;
  v12 = v7;
  dispatch_async(queue, v13);

  os_activity_scope_leave(&state);
}

uint64_t __34__SYService__deviceOSInfoChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setProtocolVersionForRemoteOSVersion:build:remoteIsWatch:switchingEngines:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "hasPrefix:", CFSTR("Watch")), 1);
}

- (void)_ifDelegateImplements:(SEL)a3 do:(id)a4 then:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id WeakRetained;
  char v10;
  OS_dispatch_queue *delegateQueue;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(_QWORD);
  _QWORD block[4];
  id v20;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __43__SYService__ifDelegateImplements_do_then___block_invoke;
    v16[3] = &unk_24CC65C38;
    v17 = v7;
    v18 = v8;
    v16[4] = self;
    v13 = delegateQueue;
    v14 = (void *)objc_msgSend(v16, "copy");
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = ___dispatch_async_autoreleased_block_invoke;
    block[3] = &unk_24CC65FB8;
    v20 = v14;
    v15 = v14;
    dispatch_async(v13, block);

  }
  else if (v8)
  {
    v8[2](v8);
  }

}

void __43__SYService__ifDelegateImplements_do_then___block_invoke(_QWORD *a1)
{
  void *v2;

  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)a1[6];
  if (v2)
    dispatch_async(*(dispatch_queue_t *)(a1[4] + 56), v2);
}

- (void)_switchToNewTargetedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char flags;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SYService *v24;

  v4 = a3;
  -[SYDevice pairingID](self->_targetedDevice, "pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SYMultiSuspendableQueue suspend](self->_sessionQueue, "suspend");
  -[SYService currentSession](self, "currentSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "_pause");
  dispatch_suspend((dispatch_object_t)self->_incomingIOQueue);
  os_unfair_lock_lock(&self->_flagLock);
  flags = (char)self->_flags;
  os_unfair_lock_unlock(&self->_flagLock);
  v10 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __40__SYService__switchToNewTargetedDevice___block_invoke;
  v21[3] = &unk_24CC65560;
  v22 = v5;
  v23 = v6;
  v24 = self;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __40__SYService__switchToNewTargetedDevice___block_invoke_73;
  v15[3] = &unk_24CC65C60;
  v15[4] = self;
  v16 = v4;
  v20 = (flags & 0x10) != 0;
  v17 = v23;
  v18 = v22;
  v19 = v8;
  v11 = v8;
  v12 = v22;
  v13 = v23;
  v14 = v4;
  -[SYService _ifDelegateImplements:do:then:](self, "_ifDelegateImplements:do:then:", sel_service_willSwitchFromPairingID_toPairingID_, v21, v15);

}

void __40__SYService__switchToNewTargetedDevice___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "Calling delegate willSwitchFromPairingID:%{public}@ toPairingID:%{public}@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 48));
  objc_msgSend(WeakRetained, "service:willSwitchFromPairingID:toPairingID:", a1[6], a1[4], a1[5]);

}

void __40__SYService__switchToNewTargetedDevice___block_invoke_73(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint32_t os_unfair_lock_opaque;
  os_unfair_lock_s *v4;
  uint32_t v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 184));
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_opaque = v2[47]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2 + 46);
  if ((os_unfair_lock_opaque & 0x10) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_suspend");
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 184));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 188) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 184));
  }
  objc_msgSend(*(id *)(a1 + 32), "_removePairingStoreDevice");
  objc_msgSend(*(id *)(a1 + 32), "_updateMetaProtocolInfoForDevice:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setupPairingStoreWithDevice:", *(_QWORD *)(a1 + 40));
  if ((os_unfair_lock_opaque & 0x10) != 0 && *(_BYTE *)(a1 + 72) && *(_QWORD *)(a1 + 40)
    || (os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 184)),
        v4 = *(os_unfair_lock_s **)(a1 + 32),
        v5 = v4[47]._os_unfair_lock_opaque,
        os_unfair_lock_unlock(v4 + 46),
        (v5 & 0x20000) != 0))
  {
    v6 = *(void **)(a1 + 32);
    v24 = 0;
    v7 = objc_msgSend(v6, "resume:", &v24);
    v8 = v24;
    if ((v7 & 1) != 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 184));
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 188) &= ~0x20000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 184));
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v9 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Failed to resume store after switching devices!", buf, 2u);
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_dealWithPotentiallyStallingCurrentSession");
  if (*(_QWORD *)(a1 + 48))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 232);
    *(_QWORD *)(v12 + 232) = v11;

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(v15 + 232);
      *(_DWORD *)buf = 134218242;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "SYService %p has new generation %{public}@", buf, 0x16u);
    }
  }
  v17 = *(void **)(a1 + 32);
  v18 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __40__SYService__switchToNewTargetedDevice___block_invoke_76;
  v21[3] = &unk_24CC65560;
  v21[4] = v17;
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 48);
  v19[0] = v18;
  v19[1] = 3221225472;
  v19[2] = __40__SYService__switchToNewTargetedDevice___block_invoke_2;
  v19[3] = &unk_24CC652B8;
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = *(id *)(a1 + 64);
  objc_msgSend(v17, "_ifDelegateImplements:do:then:", sel_service_didSwitchFromPairingID_toPairingID_, v21, v19);

}

void __40__SYService__switchToNewTargetedDevice___block_invoke_76(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  objc_msgSend(WeakRetained, "service:didSwitchFromPairingID:toPairingID:", a1[4], a1[5], a1[6]);

}

void __40__SYService__switchToNewTargetedDevice___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "hasPairingStore"))
    objc_msgSend(*(id *)(a1 + 32), "_signalPairingStoreAvailable");
  v2 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v2, "_continue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resume");
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)_deviceTargetabilityChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SYService__deviceTargetabilityChanged___block_invoke;
  block[3] = &unk_24CC65C88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

void __41__SYService__deviceTargetabilityChanged___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG))
      __41__SYService__deviceTargetabilityChanged___block_invoke_cold_3();
    objc_msgSend(*(id *)(a1 + 32), "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isTargetable");
    v5 = WeakRetained[19];
    if (v4)
    {
      if (v5 && objc_msgSend(v3, "isEqual:"))
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v6 = _sync_log_facilities;
        if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Newly-targetable device is our existing targeted device. No switch actually occurring.", buf, 2u);
        }
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v7 = (void *)_sync_log_facilities;
        if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG))
          __41__SYService__deviceTargetabilityChanged___block_invoke_cold_1((uint64_t)(WeakRetained + 19), v7);
      }
      else
      {
        objc_msgSend(WeakRetained, "_switchToNewTargetedDevice:", v3);
      }
    }
    else if (objc_msgSend(v3, "isEqual:", v5))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v8 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Targeted device became untargetable. We should get a new targetable-device notification soon.", v10, 2u);
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v9 = (void *)_sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG))
        __41__SYService__deviceTargetabilityChanged___block_invoke_cold_2((uint64_t)(WeakRetained + 19), v9);
    }

  }
}

- (void)_deviceRemoved:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__SYService__deviceRemoved___block_invoke;
  block[3] = &unk_24CC65C88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

void __28__SYService__deviceRemoved___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", WeakRetained[19]);

    if (v4)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v5 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        v6 = WeakRetained[19];
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Current targeted device (%@) was removed from known devices list.", (uint8_t *)&v10, 0xCu);
      }
    }
    +[SYDevice knownDevices](SYDevice, "knownDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v9 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Last known paired device has unpaired. SYService can no longer function.", (uint8_t *)&v10, 2u);
      }
      objc_msgSend(WeakRetained, "_signalPairingStoreUnavailable");
      objc_msgSend(WeakRetained, "_switchToNewTargetedDevice:", 0);
    }
  }

}

- (void)_removePairingStoreDevice
{
  void *v3;
  SYDevice *targetedDevice;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SYDeviceOSInfoChangedNotification"), self->_targetedDevice);

  *(_DWORD *)&self->_flags &= ~0x400u;
  targetedDevice = self->_targetedDevice;
  self->_targetedDevice = 0;

  *(_DWORD *)&self->_flags &= ~8u;
}

- (void)_setupPairingStoreWithDevice:(id)a3
{
  id v5;
  void *v6;
  SYDevice *targetedDevice;
  SYPersistentStore *persistentStore;
  id v9;

  v5 = a3;
  v9 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pairingStorePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_flagLock);
    objc_storeStrong((id *)&self->_targetedDevice, a3);
    *(_DWORD *)&self->_flags |= 8u;
    os_unfair_lock_unlock(&self->_flagLock);

  }
  else
  {
    os_unfair_lock_lock(&self->_flagLock);
    targetedDevice = self->_targetedDevice;
    self->_targetedDevice = 0;

    *(_DWORD *)&self->_flags &= ~8u;
    os_unfair_lock_lock(&self->_persistentStoreLock);
    persistentStore = self->_persistentStore;
    self->_persistentStore = 0;

    os_unfair_lock_unlock(&self->_persistentStoreLock);
    os_unfair_lock_unlock(&self->_flagLock);
  }

}

- (void)_signalPairingStoreAvailable
{
  id WeakRetained;
  OS_dispatch_queue *delegateQueue;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SYService *v11;
  _QWORD block[4];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __41__SYService__signalPairingStoreAvailable__block_invoke;
    v9[3] = &unk_24CC652B8;
    v10 = WeakRetained;
    v11 = self;
    v6 = delegateQueue;
    v7 = (void *)objc_msgSend(v9, "copy");
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = ___dispatch_async_autoreleased_block_invoke;
    block[3] = &unk_24CC65FB8;
    v13 = v7;
    v8 = v7;
    dispatch_async(v6, block);

  }
}

uint64_t __41__SYService__signalPairingStoreAvailable__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -serviceDidPairDevice", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "serviceDidPairDevice:", *(_QWORD *)(a1 + 40));
}

- (void)_signalPairingStoreUnavailable
{
  id WeakRetained;
  OS_dispatch_queue *delegateQueue;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SYService *v11;
  _QWORD block[4];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43__SYService__signalPairingStoreUnavailable__block_invoke;
    v9[3] = &unk_24CC652B8;
    v10 = WeakRetained;
    v11 = self;
    v6 = delegateQueue;
    v7 = (void *)objc_msgSend(v9, "copy");
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = ___dispatch_async_autoreleased_block_invoke;
    block[3] = &unk_24CC65FB8;
    v13 = v7;
    v8 = v7;
    dispatch_async(v6, block);

  }
}

uint64_t __43__SYService__signalPairingStoreUnavailable__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -serviceDidUnpairDevice", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "serviceDidUnpairDevice:", *(_QWORD *)(a1 + 40));
}

- (void)_dealWithPotentiallyStallingCurrentSession
{
  void *v2;
  void *v3;
  int v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SYService currentSession](self, "currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isSending");
    v5 = objc_msgSend(v3, "state");
    if (v4)
    {
      if ((v5 & 0xFFFFFFFE) == 6)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v6 = (void *)qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          v7 = v6;
          _SYObfuscate(v3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543362;
          v22 = v8;
          _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "Canceling current sending session %{public}@ due to QWS", (uint8_t *)&v21, 0xCu);

        }
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2021, 0);
        objc_msgSend(v3, "_handleError:", v9);

      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v10 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        _SYObfuscate(v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v3, "state");
        v21 = 138543618;
        v22 = v12;
        v23 = 2048;
        v24 = v13;
        v14 = "Sending session (%{public}@}) still active at time of QWS. State is %{companionsync:SYSessionState}ld, so "
              "I'm letting it continue so that IDS can give it a not-the-active-device error next time it sends";
LABEL_23:
        _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v21, 0x16u);

      }
    }
    else
    {
      if (v5 <= 1)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v15 = (void *)qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          _SYObfuscate(v3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543362;
          v22 = v17;
          _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Canceling current receiving session %{public}@ due to QWS", (uint8_t *)&v21, 0xCu);

        }
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2021, 0);
        objc_msgSend(v3, "_handleError:", v18);

      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v19 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
      {
        v11 = v19;
        _SYObfuscate(v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v3, "state");
        v21 = 138543618;
        v22 = v12;
        v23 = 2048;
        v24 = v20;
        v14 = "Receiving session (%{public}@}) still active at time of QWS. State is %{companionsync:SYSessionState}ld, s"
              "o I'm letting it continue so that IDS can give it a not-the-active-device error next time it sends";
        goto LABEL_23;
      }
    }
  }

}

- (void)_whenSessionEnds:(id)a3
{
  os_unfair_lock_s *p_flagLock;
  NSMutableArray *onSessionEnd;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(a3, "copy");
  p_flagLock = &self->_flagLock;
  os_unfair_lock_lock(&self->_flagLock);
  onSessionEnd = self->_onSessionEnd;
  v6 = (void *)MEMORY[0x212BE0F2C](v7);
  -[NSMutableArray addObject:](onSessionEnd, "addObject:", v6);

  os_unfair_lock_unlock(p_flagLock);
}

- (BOOL)targetIsInProximity
{
  return -[SYSyncEngine targetIsNearby](self->_syncEngine, "targetIsNearby");
}

- (BOOL)targetIsConnected
{
  return -[SYSyncEngine targetConnected](self->_syncEngine, "targetConnected");
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *delegateQueue;
  os_activity_scope_state_s state;
  char label[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  if (v7)
  {
    objc_storeStrong((id *)&self->_delegateQueue, a4);
  }
  else
  {
    -[NSString lastPathComponent](self->_serviceName, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    __snprintf_chk(label, 0x80uLL, 0, 0x80uLL, "CompanionSync.SYService.%s.delegate", (const char *)objc_msgSend(v8, "UTF8String"));

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (OS_dispatch_queue *)dispatch_queue_create(label, v9);
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v10;

  }
  objc_storeWeak((id *)&self->_delegate, v6);
  os_activity_scope_leave(&state);

}

- (BOOL)resume:(id *)a3
{
  $FC3B5D260D4F8D1F83CF9B539A238CFB flags;
  id WeakRetained;
  _BOOL4 v7;
  $FC3B5D260D4F8D1F83CF9B539A238CFB v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *queue;
  int v16;
  void (*v17[7])(_QWORD);
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  os_activity_scope_state_s state;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  os_unfair_lock_lock(&self->_flagLock);
  flags = self->_flags;
  os_unfair_lock_unlock(&self->_flagLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
      -[SYService resume:].cold.3();
    if (a3)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0FC8];
      v32[0] = CFSTR("SYService has already been resumed.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithSYError:userInfo:", 2002, v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_22;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained == 0;

  if (v7)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
      -[SYService resume:].cold.1();
    if (a3)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0FC8];
      v30 = CFSTR("SYService cannot be resumed until a delegate has been set.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithSYError:userInfo:", 2001, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_22;
  }
  os_unfair_lock_lock(&self->_flagLock);
  v8 = self->_flags;
  os_unfair_lock_unlock(&self->_flagLock);
  if ((*(_BYTE *)&v8 & 8) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
      -[SYService resume:].cold.2();
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 2003, 0);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  queue = self->_queue;
  v17[0] = (void (*)(_QWORD))MEMORY[0x24BDAC760];
  v17[1] = (void (*)(_QWORD))3221225472;
  v17[2] = __20__SYService_resume___block_invoke;
  v17[3] = (void (*)(_QWORD))&unk_24CC65CB0;
  v17[4] = (void (*)(_QWORD))self;
  v17[5] = (void (*)(_QWORD))&v18;
  v17[6] = (void (*)(_QWORD))&v24;
  _dispatch_sync_safe_tagged(queue, self, v17);
  v16 = *((unsigned __int8 *)v25 + 24);
  if (a3 && !*((_BYTE *)v25 + 24))
  {
    *a3 = objc_retainAutorelease((id)v19[5]);
    v16 = *((unsigned __int8 *)v25 + 24);
  }
  v9 = v16 != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
LABEL_23:
  os_activity_scope_leave(&state);
  return v9;
}

void __20__SYService_resume___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id obj;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(v2 + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "_initializeServiceDB:", &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if ((v5 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
      __20__SYService_resume___block_invoke_cold_3();
    goto LABEL_14;
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "_initializeMessaging:", &v13);
  objc_storeStrong((id *)(v7 + 40), v13);
  if ((v8 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
      __20__SYService_resume___block_invoke_cold_2();
LABEL_14:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "peerID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 200);
  *(_QWORD *)(v11 + 200) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resume");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isSuspended"))
    __20__SYService_resume___block_invoke_cold_1();
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 188) |= 0x10u;
}

- (void)suspend
{
  NSObject *queue;
  void (*v4[5])(_QWORD);
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  queue = self->_queue;
  v4[0] = (void (*)(_QWORD))MEMORY[0x24BDAC760];
  v4[1] = (void (*)(_QWORD))3221225472;
  v4[2] = (void (*)(_QWORD))__20__SYService_suspend__block_invoke;
  v4[3] = (void (*)(_QWORD))&unk_24CC65418;
  v4[4] = (void (*)(_QWORD))self;
  _dispatch_sync_safe_tagged(queue, self, v4);
  os_activity_scope_leave(&state);
}

uint64_t __20__SYService_suspend__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 184));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 188) &= ~0x20000u;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 184));
  return objc_msgSend(*(id *)(a1 + 32), "_suspend");
}

- (id)_makeSessionForDeltaSync:(BOOL)a3
{
  __objc2_class *v4;
  SYSendingSession *v5;
  void *v6;
  int v7;

  if ((*(_DWORD *)&self->_flags & 0x1C0) == 0x40)
  {
    if (a3)
    {
      v4 = SYOutgoingDeltaTransactionSession;
    }
    else
    {
      -[SYService name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.private.alloy.maps.sync"));

      if (v7)
        v4 = SYOutgoingSyncAllObjectsSession;
      else
        v4 = SYOutgoingBatchSyncSession;
    }
    v5 = (SYSendingSession *)objc_msgSend([v4 alloc], "initWithService:", self);
  }
  else
  {
    v5 = -[SYSendingSession initWithService:isReset:]([SYSendingSession alloc], "initWithService:isReset:", self, !a3);
  }
  return v5;
}

- (void)_processPendingChanges
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_17_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_18_0(&dword_211704000, v3, v4, "About to build a new session, but there's already one running! Currently-running session is %{public}@", v5);

  OUTLINED_FUNCTION_12_0();
}

void __35__SYService__processPendingChanges__block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error:", buf, 2u);
  }
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v9 = 0;
  v6 = objc_msgSend(v3, "service:startSession:error:", v4, v5, &v9);
  v7 = v9;
  v8 = v9;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v7);

}

void __35__SYService__processPendingChanges__block_invoke_97(uint64_t a1, char a2, void *a3)
{
  char *v5;
  id WeakRetained;
  unint64_t pseudo_signpost_id;
  NSObject *v8;
  id *v9;
  const char *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      pseudo_signpost_id = _next_pseudo_signpost_id();
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v8 = (id)qword_253D84AE8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (id *)(a1 + 40);
        if (*(_BYTE *)(a1 + 56))
          v10 = "delta";
        else
          v10 = "reset";
        v20 = v10;
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v9, "reason");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 40), "reason");
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = CFSTR("-");
        }
        *(_DWORD *)buf = 134219266;
        v23 = pseudo_signpost_id;
        v24 = 2082;
        v25 = v20;
        v26 = 2114;
        v27 = v12;
        v28 = 2114;
        v29 = v13;
        v30 = 2114;
        v31 = v14;
        v32 = 2114;
        v33 = v16;
        _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Start signpost %llu: Started outgoing %{public}s %{public}@ with identifier %{public}@ for service %{public}@. Reason = '%{public}@'", buf, 0x3Eu);
        if (v15)

      }
      objc_msgSend(*(id *)(a1 + 40), "setSessionSignpost:", pseudo_signpost_id);
    }
    else
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 168), &state);
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v17 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = (unint64_t)v19;
        v24 = 2112;
        v25 = v5;
        _os_log_impl(&dword_211704000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to start: %@", buf, 0x16u);

      }
      os_activity_scope_leave(&state);
    }
  }

}

- (void)_sendResetRequest
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  SYSyncEngine *syncEngine;
  int64_t v8;
  NSDictionary *customIDSOptions;
  uint64_t *v10;
  SYSyncEngine *v11;
  void *v12;
  uint64_t v13;
  id v14;
  SYSyncEngine *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, char, void *, void *);
  void *v19;
  SYService *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, char, void *, void *);
  void *v24;
  SYService *v25;

  if ((*(_DWORD *)&self->_flags & 0x1C0) == 0x40)
  {
    v3 = (void *)objc_opt_new();
    v4 = -[SYService _newMessageHeader](self, "_newMessageHeader");
    objc_msgSend(v3, "setHeader:", v4);

    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSyncID:", v6);

    syncEngine = self->_syncEngine;
    v8 = -[SYService priority](self, "priority");
    customIDSOptions = self->_customIDSOptions;
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __30__SYService__sendResetRequest__block_invoke;
    v24 = &unk_24CC65788;
    v25 = self;
    v10 = &v21;
    v11 = syncEngine;
    v12 = v3;
    v13 = 1;
  }
  else
  {
    v3 = (void *)objc_opt_new();
    v14 = -[SYService _newMessageHeader](self, "_newMessageHeader");
    objc_msgSend(v3, "setHeader:", v14);

    v15 = self->_syncEngine;
    v8 = -[SYService priority](self, "priority");
    customIDSOptions = self->_customIDSOptions;
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __30__SYService__sendResetRequest__block_invoke_106;
    v19 = &unk_24CC65788;
    v20 = self;
    v10 = &v16;
    v11 = v15;
    v12 = v3;
    v13 = 101;
  }
  -[SYSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:](v11, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v12, v13, v8, customIDSOptions, 0, v10, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);

}

void __30__SYService__sendResetRequest__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 168), &v12);
  if ((a2 & 1) != 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Enqueued full-sync request with ID %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), a3);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v11 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Failed to enqueue full-sync request: %@", buf, 0xCu);
    }
  }
  os_activity_scope_leave(&v12);

}

void __30__SYService__sendResetRequest__block_invoke_106(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 168), &v12);
  if ((a2 & 1) != 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Enqueued reset request with ID %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), a3);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v11 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Failed to enqueue reset request: %@", buf, 0xCu);
    }
  }
  os_activity_scope_leave(&v12);

}

- (void)setHasChangesAvailable
{
  NSObject *v3;
  uint8_t v4[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Delta requested", v4, 2u);
  }
  os_unfair_lock_lock(&self->_flagLock);
  *(_DWORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_flagLock);
  dispatch_source_merge_data((dispatch_source_t)self->_processSignalSource, 1uLL);
  os_activity_scope_leave(&state);
}

- (void)setNeedsResetSync
{
  NSObject *v3;
  uint8_t v4[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Reset requested", v4, 2u);
  }
  os_unfair_lock_lock(&self->_flagLock);
  *(_DWORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_flagLock);
  dispatch_source_merge_data((dispatch_source_t)self->_processSignalSource, 1uLL);
  os_activity_scope_leave(&state);
}

- (id)_pathForDataStore
{
  return -[SYDevice pairingStorePath](self->_targetedDevice, "pairingStorePath");
}

- (BOOL)_initializeServiceDB:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  SYVectorClock *v14;
  void *v15;
  void *v16;
  SYVectorClock *v17;
  SYVectorClock *vectorClock;
  SYVectorClock *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  os_activity_scope_state_s v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v5 = _os_activity_create(&dword_211704000, "SYService DB Setup", (os_activity_t)self->_serviceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  v29.opaque[0] = 0;
  v29.opaque[1] = 0;
  os_activity_scope_enter(v5, &v29);
  -[SYService _pathForDataStore](self, "_pathForDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = *MEMORY[0x24BDD0C78];
    v36[0] = *MEMORY[0x24BDD0CB0];
    v36[1] = v7;
    v37[0] = CFSTR("mobile");
    v37[1] = CFSTR("mobile");
    v36[2] = *MEMORY[0x24BDD0CC8];
    v37[2] = &unk_24CC83A08;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v8, a3);

    if ((v10 & 1) != 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v11 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Setting up change-list database", buf, 2u);
      }
      self->_persistentStoreLock._os_unfair_lock_opaque = 0;
      -[SYService persistentStore](self, "persistentStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 != 0;

      if (v13)
      {
        v14 = [SYVectorClock alloc];
        -[SYService persistentStore](self, "persistentStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "vectorClockJSON");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[SYVectorClock initWithJSONRepresentation:](v14, "initWithJSONRepresentation:", v16);
        vectorClock = self->_vectorClock;
        self->_vectorClock = v17;

        if (!-[SYVectorClock clocksCount](self->_vectorClock, "clocksCount"))
        {
          v19 = self->_vectorClock;
          -[SYService peerID](self, "peerID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SYVectorClock incrementClockForPeerID:](v19, "incrementClockForPeerID:", v20);

          -[SYService _vectorClockUpdated](self, "_vectorClockUpdated");
        }
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v21 = (id)_sync_log_facilities;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          -[SYService peerID](self, "peerID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SYService persistentStore](self, "persistentStore");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "vectorClockJSON");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v22;
          v32 = 2114;
          v33 = v24;
          _os_log_impl(&dword_211704000, v21, OS_LOG_TYPE_DEFAULT, "SYService persistent store initialized. PeerID = %{public}@, vector clock = %{public}@.", buf, 0x16u);

        }
        goto LABEL_27;
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
        -[SYService _initializeServiceDB:].cold.2();
      if (a3)
      {
        v27 = objc_alloc(MEMORY[0x24BDD1540]);
        v34 = *MEMORY[0x24BDD0FC8];
        v35 = CFSTR("Failed to create persistent store");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v21 = objc_claimAutoreleasedReturnValue();
        *a3 = (id)objc_msgSend(v27, "initWithSYError:userInfo:", 2001, v21);
LABEL_27:

        goto LABEL_29;
      }
    }
    v13 = 0;
    goto LABEL_29;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
    -[SYService _initializeServiceDB:].cold.1();
  if (a3)
  {
    v25 = objc_alloc(MEMORY[0x24BDD1540]);
    v38 = *MEMORY[0x24BDD0FC8];
    v39[0] = CFSTR("No pairing store path is available, which usually indicates we are not paired.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "initWithSYError:userInfo:", 2003, v8);
    v13 = 0;
    *a3 = v26;
LABEL_29:

    goto LABEL_30;
  }
  v13 = 0;
LABEL_30:

  os_activity_scope_leave(&v29);
  return v13;
}

- (void)_vectorClockUpdated
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[SYVectorClock jsonRepresentation](self->_vectorClock, "jsonRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SYService persistentStore](self, "persistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVectorClockJSON:", v4);

}

- (id)_makeSyncEngineOfType:(unsigned int)a3
{
  __objc2_class **v3;

  v3 = off_24CC64628;
  if (a3 != 2)
    v3 = off_24CC64660;
  return (id)objc_msgSend(objc_alloc(*v3), "initWithService:queue:", self, self->_queue);
}

- (BOOL)_initializeMessaging:(id *)a3
{
  NSObject *v5;
  SYSyncEngine *syncEngine;
  $FC3B5D260D4F8D1F83CF9B539A238CFB flags;
  SYSyncEngine *v8;
  SYSyncEngine *v9;
  unsigned int v10;
  SYSyncEngine *v11;
  SYSyncEngine *v12;
  BOOL v13;
  os_activity_scope_state_s v15;

  v5 = _os_activity_create(&dword_211704000, "SYService Sync Engine Setup", (os_activity_t)self->_serviceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v5, &v15);
  os_unfair_lock_lock(&self->_flagLock);
  self->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFC7FF | ((self->_engineType & 7) << 11));
  os_unfair_lock_unlock(&self->_flagLock);
  syncEngine = self->_syncEngine;
  if (!syncEngine)
  {
    os_unfair_lock_lock(&self->_flagLock);
    flags = self->_flags;
    os_unfair_lock_unlock(&self->_flagLock);
    if ((*(_WORD *)&flags & 0x1C0) == 0x40)
    {
      -[SYService _makeSyncEngineOfType:](self, "_makeSyncEngineOfType:", 1);
      v8 = (SYSyncEngine *)objc_claimAutoreleasedReturnValue();
      v9 = self->_syncEngine;
      self->_syncEngine = v8;

      os_unfair_lock_lock(&self->_flagLock);
      v10 = 0x4000;
    }
    else
    {
      -[SYService _makeSyncEngineOfType:](self, "_makeSyncEngineOfType:", self->_engineType);
      v11 = (SYSyncEngine *)objc_claimAutoreleasedReturnValue();
      v12 = self->_syncEngine;
      self->_syncEngine = v11;

      os_unfair_lock_lock(&self->_flagLock);
      v10 = (self->_engineType & 7) << 14;
    }
    self->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | v10);
    os_unfair_lock_unlock(&self->_flagLock);
    -[SYSyncEngine setResponder:](self->_syncEngine, "setResponder:", self);
    syncEngine = self->_syncEngine;
  }
  v13 = -[SYSyncEngine resume:](syncEngine, "resume:", a3);

  os_activity_scope_leave(&v15);
  return v13;
}

- (void)_swapEngineTo:(unsigned int)a3
{
  NSObject *v5;
  SYSyncEngine **p_syncEngine;
  SYSyncEngine *syncEngine;
  SYSyncEngine *v8;
  SYSyncEngine *v9;
  __objc2_class **v10;
  SYSyncEngine *v11;
  SYSyncEngine *v12;
  SYSyncEngine *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  SYSyncEngine *v18;
  BOOL v19;
  NSObject *v20;
  id WeakRetained;
  char v22;
  uint64_t v23;
  OS_dispatch_queue *delegateQueue;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  SYService *v32;
  id v33;
  id v34;
  id v35;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = _os_activity_create(&dword_211704000, "SYService Sync Engine Swap", (os_activity_t)self->_serviceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  p_syncEngine = &self->_syncEngine;
  syncEngine = self->_syncEngine;
  v8 = syncEngine;
  -[SYSyncEngine suspend](v8, "suspend");
  v9 = self->_syncEngine;
  self->_syncEngine = 0;

  v10 = off_24CC64628;
  if (a3 != 2)
    v10 = off_24CC64660;
  v11 = (SYSyncEngine *)objc_msgSend(objc_alloc(*v10), "initWithService:queue:", self, self->_queue);
  v12 = self->_syncEngine;
  self->_syncEngine = v11;

  -[SYSyncEngine setResponder:](self->_syncEngine, "setResponder:", self);
  v13 = *p_syncEngine;
  v35 = 0;
  v14 = -[SYSyncEngine resume:](v13, "resume:", &v35);
  v15 = v35;
  if (v14)
  {
    os_unfair_lock_lock(&self->_flagLock);
    self->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | ((a3 & 7) << 14));
    os_unfair_lock_unlock(&self->_flagLock);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v16 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Returning to original engine after swap error", buf, 2u);
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v17 = (id)_sync_log_facilities;
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      _SYObfuscate(v15);
      objc_claimAutoreleasedReturnValue();
      -[SYService _swapEngineTo:].cold.2();
    }

    objc_storeStrong((id *)&self->_syncEngine, syncEngine);
    v18 = *p_syncEngine;
    v34 = 0;
    v19 = -[SYSyncEngine resume:](v18, "resume:", &v34);
    v15 = v34;
    if (!v19)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v20 = (id)_sync_log_facilities;
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        _SYObfuscate(v15);
        objc_claimAutoreleasedReturnValue();
        -[SYService _swapEngineTo:].cold.1();
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        v23 = MEMORY[0x24BDAC760];
        delegateQueue = self->_delegateQueue;
        v28 = MEMORY[0x24BDAC760];
        v29 = 3221225472;
        v30 = __27__SYService__swapEngineTo___block_invoke;
        v31 = &unk_24CC652B8;
        v32 = self;
        v33 = v15;
        v25 = delegateQueue;
        v26 = (void *)objc_msgSend(&v28, "copy");
        *(_QWORD *)buf = v23;
        v38 = 3221225472;
        v39 = ___dispatch_async_autoreleased_block_invoke;
        v40 = &unk_24CC65FB8;
        v41 = v26;
        v27 = v26;
        dispatch_async(v25, buf);

      }
      -[SYService suspend](self, "suspend", v28, v29, v30, v31, v32);
    }
  }

  os_activity_scope_leave(&state);
}

void __27__SYService__swapEngineTo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "service:encounteredError:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)_upgradeEngineTo:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  int v9;
  id location;

  v3 = *(_QWORD *)&a3;
  -[SYService currentSession](self, "currentSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SYService currentSession](self, "currentSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __30__SYService__upgradeEngineTo___block_invoke;
    v7[3] = &unk_24CC65D28;
    objc_copyWeak(&v8, &location);
    v9 = v3;
    -[SYService _whenSessionEnds:](self, "_whenSessionEnds:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  -[SYService _swapEngineTo:](self, "_swapEngineTo:", v3);
}

void __30__SYService__upgradeEngineTo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_upgradeEngineTo:", *(unsigned int *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_downgradeEngineForVersion:(int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  int v10;
  id location;

  -[SYService currentSession](self, "currentSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SYService currentSession](self, "currentSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40__SYService__downgradeEngineForVersion___block_invoke;
    v8[3] = &unk_24CC65D28;
    objc_copyWeak(&v9, &location);
    v10 = a3;
    -[SYService _whenSessionEnds:](self, "_whenSessionEnds:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (a3 == 2)
    v7 = 2;
  else
    v7 = 1;
  -[SYService _swapEngineTo:](self, "_swapEngineTo:", v7);
}

void __40__SYService__downgradeEngineForVersion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_downgradeEngineForVersion:", *(unsigned int *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_suspend
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  if (_sync_log_facilities_pred != -1)
    OUTLINED_FUNCTION_8();
  if (OUTLINED_FUNCTION_4_2())
    OUTLINED_FUNCTION_0_5(&dword_211704000, v0, v1, "Queue state assumption failed: _sessionQueue.suspended == YES", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)_copyPeerClockFromMessageHeaderIfNecessary:(id)a3
{
  id v4;
  SYVectorClock *vectorClock;
  void *v6;
  SYVectorClock *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  vectorClock = self->_vectorClock;
  v11 = v4;
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(vectorClock) = -[SYVectorClock hasClockForPeer:](vectorClock, "hasClockForPeer:", v6);

  if ((vectorClock & 1) == 0)
  {
    v7 = self->_vectorClock;
    objc_msgSend(v11, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clockForPeer:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYVectorClock addClocks:](v7, "addClocks:", v10);

    -[SYService _vectorClockUpdated](self, "_vectorClockUpdated");
  }

}

- (id)_newMessageHeader
{
  void *v3;
  SYPeer *v4;
  void *v5;
  SYPeer *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  v4 = [SYPeer alloc];
  -[SYService peerID](self, "peerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SYPeer initWithPeerID:generation:](v4, "initWithPeerID:generation:", v5, self->_generationID);
  objc_msgSend(v3, "setSender:", v6);

  v7 = (void *)-[SYVectorClock copy](self->_vectorClock, "copy");
  objc_msgSend(v3, "setState:", v7);

  objc_msgSend(v3, "setVersion:", (*(_DWORD *)&self->_flags >> 6) & 7);
  -[SYService persistentStore](self, "persistentStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSequenceNumber:", objc_msgSend(v8, "nextSequenceNumber"));

  return v3;
}

- (void)sessionDidEnd:(id)a3 withError:(id)a4
{
  SYSession *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  char v11;
  OS_dispatch_queue *delegateQueue;
  uint64_t v13;
  id *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *queue;
  _QWORD block[5];
  SYSession *v20;
  _QWORD v21[5];
  SYSession *v22;
  id v23;
  uint8_t buf[8];
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;

  v6 = (SYSession *)a3;
  v7 = a4;
  if (self->_currentSession == v6)
  {
LABEL_11:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13 = MEMORY[0x24BDAC760];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __37__SYService_sessionDidEnd_withError___block_invoke;
      v21[3] = &unk_24CC65560;
      v21[4] = self;
      v14 = (id *)&v22;
      v22 = v6;
      v23 = v7;
      v15 = delegateQueue;
      v16 = (void *)objc_msgSend(v21, "copy");
      *(_QWORD *)buf = v13;
      v25 = 3221225472;
      v26 = ___dispatch_async_autoreleased_block_invoke;
      v27 = &unk_24CC65FB8;
      v28 = v16;
      v17 = v16;
      dispatch_async(v15, buf);

    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __37__SYService_sessionDidEnd_withError___block_invoke_2;
      block[3] = &unk_24CC652B8;
      block[4] = self;
      v14 = (id *)&v20;
      v20 = v6;
      dispatch_async(queue, block);
    }

    goto LABEL_15;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    -[SYService sessionDidEnd:withError:].cold.1(v8);
  if (!self->_currentSession)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "The current session is nil, so I'll inform the delegate anyway", buf, 2u);
    }
    goto LABEL_11;
  }
LABEL_15:

}

void __37__SYService_sessionDidEnd_withError___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:sessionEnded:error:", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  objc_msgSend(WeakRetained, "service:sessionEnded:error:", a1[4], a1[5], a1[6]);

  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = *(NSObject **)(v4 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SYService_sessionDidEnd_withError___block_invoke_125;
  v7[3] = &unk_24CC652B8;
  v7[4] = v4;
  v8 = v5;
  dispatch_async(v6, v7);

}

uint64_t __37__SYService_sessionDidEnd_withError___block_invoke_125(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wrapUpCurrentSession:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__SYService_sessionDidEnd_withError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wrapUpCurrentSession:", *(_QWORD *)(a1 + 40));
}

- (void)_wrapUpCurrentSession:(id)a3
{
  SYSession *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double Current;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  SYSession *currentSession;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  _SYQueuedStartSession *queuedStartSession;
  _SYQueuedStartSession *v33;
  _SYQueuedStartSession *v34;
  NSObject *queue;
  _SYQueuedStartSession *v36;
  _QWORD v37[5];
  _SYQueuedStartSession *v38;
  id v39;
  id location;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE buf[22];
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = (SYSession *)a3;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if (-[SYSession isResetSync](v4, "isResetSync"))
      v7 = "reset";
    else
      v7 = "delta";
    -[SYService name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_INFO, "Wrapping up %s session for service %{public}@", buf, 0x16u);

  }
  if (self->_currentSession == v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[SYSession birthDate](v4, "birthDate");
    v15 = Current - v14;
    if (v15 < 0.0)
    {
      v16 = (void *)MEMORY[0x24BDBCE60];
      -[SYSession birthDate](v4, "birthDate");
      objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v18 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYService _wrapUpCurrentSession:].cold.1((uint64_t)v17, v18);

    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v19 = (id)qword_253D84AE8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = -[SYSession sessionSignpost](v4, "sessionSignpost");
      if (-[SYSession isResetSync](v4, "isResetSync"))
        v21 = "Reset";
      else
        v21 = "Delta";
      -[SYSession identifier](v4, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYService name](self, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYSession reason](v4, "reason");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        -[SYSession reason](v4, "reason");
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = CFSTR("-");
      }
      *(_DWORD *)buf = 134219266;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v21;
      v47 = 2114;
      v48 = v22;
      v49 = 2114;
      v50 = v23;
      v51 = 2114;
      v52 = v25;
      v53 = 2048;
      v54 = v15;
      _os_log_impl(&dword_211704000, v19, OS_LOG_TYPE_DEFAULT, "End signpost %llu: %s session with identifier %{public}@ for service %{public}@ (reason '%{public}@') completed in %.04f seconds.", buf, 0x3Eu);
      if (v24)

    }
    -[SYSession isSending](v4, "isSending");
    -[SYSyncEngine endSession](self->_syncEngine, "endSession");
    currentSession = self->_currentSession;
    self->_currentSession = 0;

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter((os_activity_t)self->_serviceActivity, (os_activity_scope_state_t)buf);
    os_unfair_lock_lock(&self->_flagLock);
    if (-[NSMutableArray count](self->_onSessionEnd, "count"))
    {
      v27 = (void *)-[NSMutableArray copy](self->_onSessionEnd, "copy");
      -[NSMutableArray removeAllObjects](self->_onSessionEnd, "removeAllObjects");
    }
    else
    {
      v27 = 0;
    }
    os_unfair_lock_unlock(&self->_flagLock);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v28);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i) + 16))();
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v29);
    }

    queuedStartSession = self->_queuedStartSession;
    if (queuedStartSession)
    {
      v33 = queuedStartSession;
      v34 = self->_queuedStartSession;
      self->_queuedStartSession = 0;

      objc_initWeak(&location, self);
      queue = self->_queue;
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __35__SYService__wrapUpCurrentSession___block_invoke;
      v37[3] = &unk_24CC65D50;
      objc_copyWeak(&v39, &location);
      v37[4] = self;
      v38 = v33;
      v36 = v33;
      dispatch_async(queue, v37);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      -[_SYMultiSuspendableQueue resume](self->_sessionQueue, "resume");
    }

    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[SYSession identifier](v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYSession identifier](self->_currentSession, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Wrapping up session %{public}@ is not the current session (%{public}@)", buf, 0x16u);

    }
    -[_SYMultiSuspendableQueue resume](self->_sessionQueue, "resume");
  }

}

void __35__SYService__wrapUpCurrentSession___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __35__SYService__wrapUpCurrentSession___block_invoke_2;
    v6[3] = &unk_24CC652B8;
    v6[4] = WeakRetained;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __35__SYService__wrapUpCurrentSession___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleStartSession:completion:", v3, v4);

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isSuspended") & 1) == 0)
    __35__SYService__wrapUpCurrentSession___block_invoke_2_cold_1();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resume");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isSuspended") & 1) == 0)
    __35__SYService__wrapUpCurrentSession___block_invoke_2_cold_1();
}

- (void)sessionFailedToCancelMessageUUIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[SYService persistentStore](self, "persistentStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addMessageIDsToIgnore:", v5);

  }
}

- (id)_chooseBetweenCollidingSessions:(id)a3 :(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  _BOOL4 v26;
  int v27;
  void *v28;
  id v29;
  id WeakRetained;
  char v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *delegateQueue;
  uint64_t v36;
  id v37;
  uint64_t *v38;
  NSObject *v39;
  void *v40;
  id v41;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(_QWORD *);
  void *v46;
  SYService *v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  __int128 block;
  void (*v58)(uint64_t);
  void *v59;
  uint64_t *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isResetSync");
  if (v8 != objc_msgSend(v7, "isResetSync"))
  {
    v9 = objc_msgSend(v6, "isResetSync") ? v7 : v6;
    v10 = v9;
    if (v10)
      goto LABEL_28;
  }
  v11 = (*(_DWORD *)&self->_flags >> 6) & 7;
  if (v11 < 2)
  {
    if (v11 != 1)
    {
LABEL_17:
      v10 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v7, "birthDate");
    v21 = v20;
    objc_msgSend(v6, "birthDate");
    v19 = v21 - v22;
  }
  else
  {
    _SessionIdentifierDateFormatter();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _SessionIdentifierDateFormatter();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateFromString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "timeIntervalSinceDate:", v17);
    v19 = v18;

  }
  v23 = v7;
  if (v19 <= 1.0)
  {
    v23 = v6;
    if (v19 >= -1.0)
      goto LABEL_17;
  }
  v24 = v23;
  v10 = v24;
  if (v24 && objc_msgSend(v24, "hasRejectedPeerSession"))
  {
    if (v10 == v6)
    {
      v10 = v7;

      if (v10)
        goto LABEL_28;
    }
    else
    {
      v25 = v6;

      v10 = v25;
      if (v25)
        goto LABEL_28;
    }
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v10, "setHasRejectedPeerSession:", 1);
  if (v10)
    goto LABEL_28;
LABEL_19:
  v26 = -[SYService isMasterStore](self, "isMasterStore");
  v27 = objc_msgSend(v6, "isSending");
  if (v27)
    v28 = v7;
  else
    v28 = v6;
  if (v27)
    v29 = v6;
  else
    v29 = v7;
  if (!v26)
    v28 = v29;
  v10 = v28;
LABEL_28:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v32 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYService _chooseBetweenCollidingSessions::].cold.1(v32, v10);
    if (v10 == v6)
      v33 = v7;
    else
      v33 = v6;
    v34 = v33;
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__5;
    v55 = __Block_byref_object_dispose__5;
    v56 = 0;
    delegateQueue = self->_delegateQueue;
    v36 = MEMORY[0x24BDAC760];
    v43 = MEMORY[0x24BDAC760];
    v44 = 3221225472;
    v45 = __46__SYService__chooseBetweenCollidingSessions::__block_invoke;
    v46 = &unk_24CC65D78;
    v50 = &v51;
    v47 = self;
    v10 = v10;
    v48 = v10;
    v37 = v34;
    v49 = v37;
    v38 = &v43;
    *(_QWORD *)&block = v36;
    *((_QWORD *)&block + 1) = 3221225472;
    v58 = ___dispatch_sync_autoreleased_block_invoke;
    v59 = &unk_24CC65FB8;
    v60 = v38;
    dispatch_sync(delegateQueue, &block);

    if ((id)v52[5] == v37)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v39 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v52[5], "identifier", v43, v44, v45, v46, v47, v48);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(block) = 138543362;
        *(_QWORD *)((char *)&block + 4) = v40;
        _os_log_impl(&dword_211704000, v39, OS_LOG_TYPE_DEFAULT, "Delegate vetoed our decision. Session %{public}@ is now the winner", (uint8_t *)&block, 0xCu);

      }
      v41 = (id)v52[5];

      v10 = v41;
    }

    _Block_object_dispose(&v51, 8);
  }

  return v10;
}

void __46__SYService__chooseBetweenCollidingSessions::__block_invoke(_QWORD *a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:willPreferSession:overSession:", v7, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  objc_msgSend(WeakRetained, "service:willPreferSession:overSession:", a1[4], a1[5], a1[6]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)_shouldSession:(id)a3 fromPeer:(id)a4 supercedeSession:(id)a5 ofAge:(double)a6 collisionDetected:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  int v15;
  _BOOL4 v16;
  id v17;
  char v18;
  unsigned int v19;
  void *v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_msgSend(v14, "state");
  switch(v15)
  {
    case 0:
      goto LABEL_4;
    case 7:
      v16 = -[SYSyncEngine buffersSessions](self->_syncEngine, "buffersSessions");
      if (v16)
        v16 = -[SYSyncEngine buffersHandshake](self->_syncEngine, "buffersHandshake");
      break;
    case 6:
LABEL_4:
      v16 = 1;
      break;
    default:
      v16 = 0;
      break;
  }
  if (a7)
    *a7 = v16;
  if (v16 && self->_sessionStalenessInterval > a6)
  {
    -[SYService _chooseBetweenCollidingSessions::](self, "_chooseBetweenCollidingSessions::", v12, v14);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17 == v12)
      v18 = 1;
    else
      v18 = objc_msgSend(v14, "_willAcquiesceToNewSessionFromPeer:", v13);
    goto LABEL_21;
  }
  if ((objc_msgSend(v14, "_willAcquiesceToNewSessionFromPeer:", v13) & 1) != 0)
  {
    v18 = 1;
  }
  else if (self->_sessionStalenessInterval <= a6)
  {
    v19 = (*(_DWORD *)&self->_flags >> 6) & 7;
    if (v19 >= 2)
    {
      objc_msgSend(v12, "identifier");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "compare:", v20) == 1;

LABEL_21:
      goto LABEL_28;
    }
    v18 = a6 > 1800.0 && v19 == 1;
  }
  else
  {
    v18 = 0;
  }
LABEL_28:

  return v18;
}

- (void)_postVersionRejectionMessageForMessageWithID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SYService queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SYService__postVersionRejectionMessageForMessageWithID___block_invoke;
  v7[3] = &unk_24CC652B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__SYService__postVersionRejectionMessageForMessageWithID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newMessageHeader");
  objc_msgSend(v3, "setHeader:", v2);

  objc_msgSend(v3, "setInReplyTo:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setSupportedVersions:count:", &_postVersionRejectionMessageForMessageWithID__supportedVersions, 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v3, 0x7FFFLL, objc_msgSend(*(id *)(a1 + 32), "priority"), 0, 0, &__block_literal_global_132);

}

void __58__SYService__postVersionRejectionMessageForMessageWithID___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((a2 & 1) != 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Enqueued version rejection message with ID %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      _SYObfuscate(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Failed to enqueue version rejection message: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (NSDictionary)extraTransportOptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[SYService currentSession](self, "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYService options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CoalesceOptionDictionaries(v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return (NSDictionary *)v4;
}

- (BOOL)willAcceptMessageWithHeader:(id)a3 messageID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "sequenceNumber");
  if (objc_msgSend(v6, "version") <= 2 && objc_msgSend(v6, "version"))
  {
    -[SYService persistentStore](self, "persistentStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldIgnoreMessageID:", v7);

    if (v10)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v11 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v45 = 138543362;
        v46 = (uint64_t)v7;
        _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring message ID %{public}@, it's in the 'cancellation failed' list", (uint8_t *)&v45, 0xCu);
      }
      -[SYService persistentStore](self, "persistentStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeMessageIDFromIgnoreList:", v7);

      goto LABEL_10;
    }
    v15 = (*(_DWORD *)&self->_flags >> 6) & 7;
    if (v15 != objc_msgSend(v6, "version"))
      self->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFFE3F | ((objc_msgSend(v6, "version") & 7) << 6));
    v16 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v6, "timestamp");
    objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYService persistentStore](self, "persistentStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastMessageReceived");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[SYService persistentStore](self, "persistentStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sender");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "peerID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "sequenceNumberIsDuplicate:forPeer:", v8, v22);

    if (v23)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v24 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v45 = 138543618;
        v46 = (uint64_t)v7;
        v47 = 2048;
        v48 = v8;
        _os_log_impl(&dword_211704000, v24, OS_LOG_TYPE_DEFAULT, "Possible duplicate message %{public}@ received with seqno %llu. Comparing timestamps.", (uint8_t *)&v45, 0x16u);
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v25 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)MEMORY[0x24BDBCE60];
        v27 = v25;
        objc_msgSend(v6, "timestamp");
        objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138543618;
        v46 = (uint64_t)v28;
        v47 = 2114;
        v48 = (uint64_t)v19;
        _os_log_impl(&dword_211704000, v27, OS_LOG_TYPE_DEFAULT, "This message timestamp = %{public}@ vs. last message timestamp = %{public}@", (uint8_t *)&v45, 0x16u);

      }
      if (objc_msgSend(v17, "compare:", v19) != 1)
      {
        +[SYTransportLog sharedInstance](SYTransportLog, "sharedInstance");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "oslog");
        v42 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
          -[SYService willAcceptMessageWithHeader:messageID:].cold.2((uint64_t)v7, v8, v42);
        v13 = 0;
        goto LABEL_46;
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v29 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v45) = 0;
        _os_log_impl(&dword_211704000, v29, OS_LOG_TYPE_DEFAULT, "Sequence numbers were reset; clearing our received seqno set.",
          (uint8_t *)&v45,
          2u);
      }
      -[SYService persistentStore](self, "persistentStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sender");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "peerID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "resetSequenceNumbersForPeer:", v32);

    }
    -[SYService persistentStore](self, "persistentStore");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sender");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "peerID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v33, "lastSequenceNumberForPeerID:", v35);

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v37 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
    {
      v45 = 134218240;
      v46 = v8;
      v47 = 2048;
      v48 = v36;
      _os_log_impl(&dword_211704000, v37, OS_LOG_TYPE_INFO, "Received seqno=%llu, last seen=%llu", (uint8_t *)&v45, 0x16u);
    }
    if (v8 != v36 + 1)
    {
      +[SYTransportLog sharedInstance](SYTransportLog, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "oslog");
      v39 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
      {
        v45 = 138543874;
        v46 = (uint64_t)v7;
        v47 = 2048;
        v48 = v8;
        v49 = 2048;
        v50 = v36;
        _os_log_error_impl(&dword_211704000, v39, (os_log_type_t)0x90u, "Out of order delivery or dropped message detected on receipt of message with ID %{public}@. Message sequence number = %llu, last received sequence number = %llu", (uint8_t *)&v45, 0x20u);
      }

    }
    if (objc_msgSend(v6, "version") >= 3)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v40 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYService willAcceptMessageWithHeader:messageID:].cold.1(v40);
    }
    v41 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v6, "timestamp");
    objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");
    v42 = objc_claimAutoreleasedReturnValue();
    -[SYService persistentStore](self, "persistentStore");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setLastMessageReceived:", v42);

    v13 = 1;
LABEL_46:

    goto LABEL_11;
  }
  -[SYService _postVersionRejectionMessageForMessageWithID:](self, "_postVersionRejectionMessageForMessageWithID:", v7);
LABEL_10:
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)handleSyncRequest:(id)a3 ofType:(unsigned __int16)a4 response:(id)a5
{
  id v8;
  id v9;
  NSObject *incomingIOQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int16 v16;

  v8 = a3;
  v9 = a5;
  incomingIOQueue = self->_incomingIOQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__SYService_handleSyncRequest_ofType_response___block_invoke;
  v13[3] = &unk_24CC65DE0;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(incomingIOQueue, v13);

}

uint64_t __47__SYService_handleSyncRequest_ofType_response___block_invoke(uint64_t a1)
{
  unsigned __int16 *v2;
  uint64_t result;
  void *v4;

  v2 = (unsigned __int16 *)(a1 + 56);
  switch(*(_WORD *)(a1 + 56))
  {
    case 1:
      result = objc_msgSend(*(id *)(a1 + 32), "_v1_handleFullSyncRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
    case 2:
      result = objc_msgSend(*(id *)(a1 + 32), "_v1_handleSyncAllObjects:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
    case 3:
      result = objc_msgSend(*(id *)(a1 + 32), "_v1_handleBatchSyncStart:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
    case 4:
      result = objc_msgSend(*(id *)(a1 + 32), "_v1_handleBatchSyncChunk:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
    case 5:
      result = objc_msgSend(*(id *)(a1 + 32), "_v1_handleBatchSyncEnd:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
    case 6:
      result = objc_msgSend(*(id *)(a1 + 32), "_v1_handleChangeMessage:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
    default:
      switch(*(_WORD *)(a1 + 56))
      {
        case 'e':
          result = objc_msgSend(*(id *)(a1 + 32), "_handleResetRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          break;
        case 'f':
          result = objc_msgSend(*(id *)(a1 + 32), "_handleStartSession:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          break;
        case 'g':
          result = objc_msgSend(*(id *)(a1 + 32), "_handleSyncBatch:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          break;
        case 'h':
          result = objc_msgSend(*(id *)(a1 + 32), "_handleRestartSession:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          break;
        case 'i':
          result = objc_msgSend(*(id *)(a1 + 32), "_handleEndSession:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          break;
        default:
          if (*(_WORD *)(a1 + 56) == 0x7FFF)
          {
            result = objc_msgSend(*(id *)(a1 + 32), "_peerRejectedVersion:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          }
          else
          {
            if (_sync_log_facilities_pred != -1)
              _os_once();
            v4 = (void *)qword_253D84AB8;
            if (os_log_type_enabled((os_log_t)qword_253D84AB8, (os_log_type_t)0x90u))
              __47__SYService_handleSyncRequest_ofType_response___block_invoke_cold_1(v2, a1, v4);
            result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          }
          break;
      }
      break;
  }
  return result;
}

- (void)handleSyncResponse:(id)a3 ofType:(unsigned __int16)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *incomingIOQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int16 v16;

  v8 = a3;
  v9 = a5;
  incomingIOQueue = self->_incomingIOQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__SYService_handleSyncResponse_ofType_completion___block_invoke;
  v13[3] = &unk_24CC65DE0;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(incomingIOQueue, v13);

}

void __50__SYService_handleSyncResponse_ofType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  SYErrorInfo *v24;
  SYErrorInfo *v25;
  SYErrorInfo *v26;
  SYErrorInfo *v27;
  NSObject *v28;
  void *v29;
  __int16 v30[8];
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  switch(*(_WORD *)(a1 + 56))
  {
    case 'e':
      v2 = *(void **)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      v35 = 0;
      v4 = objc_msgSend(v2, "_handleResetResponse:error:", v3, &v35);
      v5 = v35;
      break;
    case 'f':
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v34 = 0;
      v4 = objc_msgSend(v13, "_handleStartSessionResponse:error:", v14, &v34);
      v5 = v34;
      break;
    case 'g':
      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v33 = 0;
      v4 = objc_msgSend(v15, "_handleSyncBatchResponse:error:", v16, &v33);
      v5 = v33;
      break;
    case 'h':
      v17 = *(void **)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 40);
      v32 = 0;
      v4 = objc_msgSend(v17, "_handleRestartSessionResponse:error:", v18, &v32);
      v5 = v32;
      break;
    case 'i':
      v19 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      v31 = 0;
      v4 = objc_msgSend(v19, "_handleEndSessionResponse:error:", v20, &v31);
      v5 = v31;
      break;
    default:
      v6 = 0;
      switch(*(_WORD *)(a1 + 56))
      {
        case 1:
          v9 = *(void **)(a1 + 32);
          v10 = *(_QWORD *)(a1 + 40);
          v38 = 0;
          v4 = objc_msgSend(v9, "_v1_handleFullSyncRequestAck:error:", v10, &v38);
          v5 = v38;
          goto LABEL_11;
        case 2:
        case 5:
          v7 = *(void **)(a1 + 32);
          v8 = *(_QWORD *)(a1 + 40);
          v36 = 0;
          v4 = objc_msgSend(v7, "_v1_handleBatchEndResponse:error:", v8, &v36);
          v5 = v36;
          goto LABEL_11;
        case 4:
          v11 = *(void **)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          v37 = 0;
          v4 = objc_msgSend(v11, "_v1_handleBatchChunkAck:error:", v12, &v37);
          v5 = v37;
          goto LABEL_11;
        default:
          goto LABEL_12;
      }
  }
LABEL_11:
  v6 = v5;
  if ((v4 & 1) == 0)
  {
LABEL_12:
    if (*(unsigned __int16 *)(a1 + 56) - 102 <= 2
      && (objc_msgSend(*(id *)(a1 + 40), "hasError") & 1) == 0)
    {
      v21 = (void *)objc_opt_new();
      v22 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newMessageHeader");
      objc_msgSend(v21, "setHeader:", v22);

      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSessionID:", v23);

      v24 = [SYErrorInfo alloc];
      v25 = v24;
      if (v6)
      {
        v26 = -[SYErrorInfo initWithError:](v24, "initWithError:", v6);
        objc_msgSend(v21, "setError:", v26);
      }
      else
      {
        v26 = (SYErrorInfo *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2006, 0);
        v27 = -[SYErrorInfo initWithError:](v25, "initWithError:", v26);
        objc_msgSend(v21, "setError:", v27);

      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v28 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
      {
        v30[0] = 0;
        _os_log_impl(&dword_211704000, v28, OS_LOG_TYPE_INFO, "Enqueueing end-session message to cancel an orphaned receiving session on peer.", (uint8_t *)v30, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "syncEngine");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v21, 105, objc_msgSend(*(id *)(a1 + 32), "priority"), 0, 0, &__block_literal_global_137);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __50__SYService_handleSyncResponse_ofType_completion___block_invoke_136(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v7 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_INFO, "Enqueued end-session message to orphaned session on peer.", v8, 2u);
  }

}

- (void)handleOutOfBandData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  OS_dispatch_queue *delegateQueue;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  SYService *v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __44__SYService_handleOutOfBandData_completion___block_invoke;
    v16[3] = &unk_24CC65620;
    v17 = WeakRetained;
    v18 = self;
    v19 = v6;
    v20 = v7;
    v11 = delegateQueue;
    v12 = (void *)objc_msgSend(v16, "copy");
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = ___dispatch_async_autoreleased_block_invoke;
    block[3] = &unk_24CC65FB8;
    v22 = v12;
    v13 = v12;
    dispatch_async(v11, block);

    v14 = v17;
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v15 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block[0]) = 0;
      _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "SYService received OOB data, but delegate doesn't support it", (uint8_t *)block, 2u);
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2008, 0);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);
  }

}

uint64_t __44__SYService_handleOutOfBandData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:incomingData:completion:", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "service:incomingData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)_claimOwnershipOfFileAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  int *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  int *v22;
  uint64_t v23;
  id v24;

  v5 = a3;
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("SYFileTransfer-XXXXX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  v10 = strdup((const char *)objc_msgSend(v9, "UTF8String"));
  v11 = mkdtemp(v10);
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v11, 1, 0);
    free(v10);
    objc_msgSend(v5, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    v16 = objc_retainAutorelease(v14);
    if (link(v15, (const char *)objc_msgSend(v16, "fileSystemRepresentation")))
    {
      v17 = __error();
      if (a4)
      {
        v18 = *v17;
        v19 = objc_alloc(MEMORY[0x24BDD1540]);
        v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v18, 0);
        v21 = 0;
        *a4 = v20;
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = v16;
    }

  }
  else
  {
    v22 = __error();
    if (a4)
    {
      v23 = *v22;
      v24 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = 0;
      *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v23, 0);
    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (void)handleFileTransfer:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  OS_dispatch_queue *delegateQueue;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  SYService *v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v26 = 0;
    -[SYService _claimOwnershipOfFileAtURL:error:](self, "_claimOwnershipOfFileAtURL:error:", v8, &v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v26;
    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __52__SYService_handleFileTransfer_metadata_completion___block_invoke;
      v20[3] = &unk_24CC65E50;
      v21 = v12;
      v22 = WeakRetained;
      v23 = self;
      v24 = v9;
      v25 = v10;
      v16 = delegateQueue;
      v17 = (void *)objc_msgSend(v20, "copy");
      block[0] = v15;
      block[1] = 3221225472;
      block[2] = ___dispatch_async_autoreleased_block_invoke;
      block[3] = &unk_24CC65FB8;
      v28 = v17;
      v18 = v17;
      dispatch_async(v16, block);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v13);
    }

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v19 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block[0]) = 0;
      _os_log_impl(&dword_211704000, v19, OS_LOG_TYPE_DEFAULT, "SYService received OOB file transfer, but delegate doesn't support it", (uint8_t *)block, 2u);
    }
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2008, 0);
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v13);
  }

}

void __52__SYService_handleFileTransfer_metadata_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  SYCompressedFileInputStream *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:incomingStream:metadata:completion:", buf, 2u);
  }
  v3 = -[SYCompressedFileInputStream initWithCompressedFileAtURL:]([SYCompressedFileInputStream alloc], "initWithCompressedFileAtURL:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SYService_handleFileTransfer_metadata_completion___block_invoke_146;
  v7[3] = &unk_24CC65E28;
  v6 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v6, "service:incomingStream:metadata:completion:", v4, v3, v5, v7);

}

void __52__SYService_handleFileTransfer_metadata_completion___block_invoke_146(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v9);
  v8 = v9;

  if ((v7 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
      __52__SYService_handleFileTransfer_metadata_completion___block_invoke_146_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)handleSyncError:(id)a3 forMessageWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *queue;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7
    && (-[SYService persistentStore](self, "persistentStore"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "shouldIgnoreMessageID:", v7),
        v8,
        v9))
  {
    -[SYService persistentStore](self, "persistentStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeMessageIDFromIgnoreList:", v7);

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v11 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = v7;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Received expected error for message ID %{public}@, will ignore it. Error is %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v12 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "Sync error occurred: %@", buf, 0xCu);
    }
    objc_msgSend(v6, "persistentUserInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", 0x24CC69840);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", 0x24CC69840);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    queue = self->_queue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __54__SYService_handleSyncError_forMessageWithIdentifier___block_invoke;
    v19[3] = &unk_24CC65C10;
    v19[4] = self;
    v20 = v15;
    v21 = v7;
    v22 = v6;
    v18 = v15;
    dispatch_async(queue, v19);

  }
}

void __54__SYService_handleSyncError_forMessageWithIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = *(id *)(a1[4] + 40);
  if (v6
    && a1[5]
    && (objc_msgSend(v6, "identifier"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isEqualToString:", a1[5]),
        v2,
        v3))
  {
    if (a1[6])
      objc_msgSend(v6, "_clearOutgoingMessageUUID:");
    v4 = a1[7];
    v5 = v6;
  }
  else
  {
    v5 = (void *)a1[4];
    v4 = a1[7];
  }
  objc_msgSend(v5, "_handleError:", v4);

}

- (void)enqueuedMessageWithID:(id)a3 context:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SYService_enqueuedMessageWithID_context___block_invoke;
  v8[3] = &unk_24CC652B8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __43__SYService_enqueuedMessageWithID_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "_recordOutgoingMessageUUID:", *(_QWORD *)(a1 + 40));
    v2 = v3;
  }

}

- (void)sentMessageWithID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SYService_sentMessageWithID_context___block_invoke;
  block[3] = &unk_24CC65560;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __39__SYService_sentMessageWithID_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeMessageIDFromIgnoreList:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_sentMessageWithIdentifier:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = v4;
  }

}

- (void)deliveredMessageWithID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SYService_deliveredMessageWithID_context___block_invoke;
  block[3] = &unk_24CC65560;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __44__SYService_deliveredMessageWithID_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeMessageIDFromIgnoreList:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_clearOutgoingMessageUUID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "_peerProcessedMessageWithIdentifier:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = v4;
  }

}

- (void)serializeForIncomingSession:(id)a3
{
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  dispatch_block_t block;

  block = a3;
  -[SYService syncEngine](self, "syncEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "buffersSessions"))
  {

    goto LABEL_5;
  }
  v5 = -[SYSession _readyToProcessIncomingMessages](self->_currentSession, "_readyToProcessIncomingMessages");

  if (!v5)
  {
LABEL_5:
    -[_SYMultiSuspendableQueue barrierAsync:](self->_sessionQueue, "barrierAsync:", block);
    goto LABEL_6;
  }
  -[SYService queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, block);

LABEL_6:
}

- (void)currentDeviceProximityChanged:(BOOL)a3
{
  id WeakRetained;
  NSObject *delegateQueue;
  _QWORD block[4];
  id v8;
  SYService *v9;
  BOOL v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__SYService_currentDeviceProximityChanged___block_invoke;
    block[3] = &unk_24CC65268;
    v8 = WeakRetained;
    v9 = self;
    v10 = a3;
    dispatch_async(delegateQueue, block);

  }
}

uint64_t __43__SYService_currentDeviceProximityChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "service:targetDeviceProximityChanged:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)currentDeviceConnectionChanged:(BOOL)a3
{
  id WeakRetained;
  NSObject *delegateQueue;
  _QWORD block[4];
  id v8;
  SYService *v9;
  BOOL v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__SYService_currentDeviceConnectionChanged___block_invoke;
    block[3] = &unk_24CC65268;
    v8 = WeakRetained;
    v9 = self;
    v10 = a3;
    dispatch_async(delegateQueue, block);

  }
}

uint64_t __44__SYService_currentDeviceConnectionChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "service:targetDeviceConnectionChanged:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (id)_sessionFromIncomingStartRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SYReceivingSession *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "header");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "header");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clockForPeer:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v9;
  v26 = (void *)v6;
  -[SYVectorClock setClockValue:forPeer:](self->_vectorClock, "setClockValue:forPeer:", objc_msgSend(v9, "version"), v6);
  -[SYService _vectorClockUpdated](self, "_vectorClockUpdated");
  if (objc_msgSend(v4, "hasMetadata"))
  {
    objc_msgSend(v4, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYSession unarchiveMetadata:](SYSession, "unarchiveMetadata:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = -[SYReceivingSession initWithService:isReset:metadata:]([SYReceivingSession alloc], "initWithService:isReset:metadata:", self, objc_msgSend(v4, "isResetSync"), v11);
  objc_msgSend(v4, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession setIdentifier:](v12, "setIdentifier:", v13);

  objc_msgSend(v4, "header");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timestamp");
  -[SYSession setBirthDate:](v12, "setBirthDate:");

  objc_msgSend(v4, "header");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "generationID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession peerGenerationIDs](v12, "peerGenerationIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "header");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sender");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "peerID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v21);

  objc_msgSend(v4, "reason");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession setReason:](v12, "setReason:", v22);

  objc_msgSend(v4, "sessionTimeout");
  -[SYSession setFullSessionTimeout:](v12, "setFullSessionTimeout:", v23 - CFAbsoluteTimeGetCurrent());

  return v12;
}

- (void)_enqueueIncomingStartSessionRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _SYQueuedStartSession *v12;
  _SYQueuedStartSession *queuedStartSession;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_queuedStartSession)
    -[SYService _enqueueIncomingStartSessionRequest:withCompletion:].cold.1();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _SYObfuscate(self->_currentSession);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Deferring incoming start-session (%{public}@) to allow current session (%{public}@) to finish closing.", (uint8_t *)&v14, 0x16u);

  }
  v12 = -[_SYQueuedStartSession initWithRequest:completion:]([_SYQueuedStartSession alloc], "initWithRequest:completion:", v6, v7);
  queuedStartSession = self->_queuedStartSession;
  self->_queuedStartSession = v12;

}

- (BOOL)_request:(id)a3 hasValidSessionIDForSession:(id)a4 response:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id, _QWORD);
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  SYErrorInfo *v20;
  void *v21;
  SYErrorInfo *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, id, _QWORD))a6;
  v12 = a4;
  objc_msgSend(v9, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v13, "isEqualToString:", v14);
  if ((v15 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v16 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v19;
      _os_log_impl(&dword_211704000, v17, OS_LOG_TYPE_DEFAULT, "Received %{public}@ message for another session ID", (uint8_t *)&v24, 0xCu);

    }
    v20 = [SYErrorInfo alloc];
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2006, 0);
    v22 = -[SYErrorInfo initWithError:](v20, "initWithError:", v21);
    objc_msgSend(v10, "setError:", v22);

    v11[2](v11, v10, 0);
  }

  return v15;
}

- (void)_handleStartSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SYSession *currentSession;
  void **p_currentSession;
  id v14;
  double Current;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  SYErrorInfo *v28;
  void *v29;
  SYErrorInfo *v30;
  void *v31;
  id WeakRetained;
  void *v33;
  id v34;
  void (**v35)(id, void *, void *);
  uint64_t v36;
  NSObject *delegateQueue;
  id v38;
  _QWORD *v39;
  NSObject *v40;
  unsigned int v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  SYErrorInfo *v45;
  id v46;
  uint64_t v47;
  void *v48;
  SYErrorInfo *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  id v54;
  void *v55;
  SYErrorInfo *v56;
  SYErrorInfo *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  void (**v65)(id, void *, void *);
  id v66;
  id location;
  _QWORD v68[4];
  id v69;
  SYService *v70;
  id v71;
  uint64_t *v72;
  _BYTE *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  _QWORD v78[4];
  id v79;
  id v80;
  void (**v81)(id, void *, void *);
  os_activity_scope_state_s state;
  _BYTE buf[24];
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _BYTE block[24];
  void *v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_delegateQueue);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  v8 = (void *)objc_opt_new();
  v9 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v9);

  objc_msgSend(v8, "setAccepted:", 0);
  objc_msgSend(v6, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionID:", v10);

  -[SYService _sessionFromIncomingStartRequest:](self, "_sessionFromIncomingStartRequest:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  p_currentSession = (void **)&self->_currentSession;
  currentSession = self->_currentSession;
  if (!currentSession)
  {
    if (objc_msgSend(v6, "isResetSync") && -[SYService isMasterStore](self, "isMasterStore"))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYService _handleStartSession:completion:].cold.1();
      v28 = [SYErrorInfo alloc];
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2014, 0);
      v30 = -[SYErrorInfo initWithError:](v28, "initWithError:", v29);
      objc_msgSend(v8, "setError:", v30);

      objc_msgSend(v6, "sessionID");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      UserInfoDictionaryWithAssociatedSessionID(v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v8, v31);

    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v74 = 0;
      v75 = &v74;
      v76 = 0x2020000000;
      v77 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v84 = __Block_byref_object_copy__5;
      v85 = __Block_byref_object_dispose__5;
      v86 = 0;
      v33 = v8;
      v34 = v6;
      v35 = v7;
      v36 = MEMORY[0x24BDAC760];
      delegateQueue = self->_delegateQueue;
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __44__SYService__handleStartSession_completion___block_invoke_155;
      v68[3] = &unk_24CC65CD8;
      v72 = &v74;
      v14 = WeakRetained;
      v69 = v14;
      v70 = self;
      v71 = v11;
      v73 = buf;
      v38 = v71;
      v39 = v68;
      *(_QWORD *)block = v36;
      v7 = v35;
      v6 = v34;
      v8 = v33;
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = ___dispatch_sync_autoreleased_block_invoke;
      v88 = &unk_24CC65FB8;
      v89 = v39;
      dispatch_sync(delegateQueue, block);

      if (*((_BYTE *)v75 + 24))
      {
        if (*p_currentSession)
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v40 = (id)qword_253D84AB8;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            _SYObfuscate(*p_currentSession);
            objc_claimAutoreleasedReturnValue();
            -[SYService _handleStartSession:completion:].cold.5();
          }

        }
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
          -[SYService _handleStartSession:completion:].cold.4();
        -[SYSyncEngine beginSession](self->_syncEngine, "beginSession");
        if (-[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended"))
        {
          _os_assumes_log();
          -[SYService _processPendingChanges].cold.1();
        }
        -[_SYMultiSuspendableQueue suspend](self->_sessionQueue, "suspend");
        if (!-[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended"))
        {
          _os_assumes_log();
          -[SYService _processPendingChanges].cold.3();
        }
        objc_storeStrong((id *)&self->_currentSession, v11);
        objc_initWeak(&location, self);
        v61[0] = MEMORY[0x24BDAC760];
        v61[1] = 3221225472;
        v61[2] = __44__SYService__handleStartSession_completion___block_invoke_156;
        v61[3] = &unk_24CC65EA0;
        objc_copyWeak(&v66, &location);
        v62 = v38;
        v63 = v33;
        v64 = v6;
        v65 = v7;
        objc_msgSend(v62, "start:", v61);

        objc_destroyWeak(&v66);
        objc_destroyWeak(&location);
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v53 = (id)qword_253D84AB8;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          _SYObfuscate(v38);
          v54 = (id)objc_claimAutoreleasedReturnValue();
          _SYObfuscate(*(void **)(*(_QWORD *)&buf[8] + 40));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)block = 138543618;
          *(_QWORD *)&block[4] = v54;
          *(_WORD *)&block[12] = 2114;
          *(_QWORD *)&block[14] = v55;
          _os_log_impl(&dword_211704000, v53, OS_LOG_TYPE_DEFAULT, "Delegate rejected incoming sync session (%{public}@) with error %{public}@", block, 0x16u);

        }
        v56 = [SYErrorInfo alloc];
        v57 = -[SYErrorInfo initWithError:](v56, "initWithError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        objc_msgSend(v33, "setError:", v57);

        objc_msgSend(v38, "wrappedUserContext");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v33, v58);

      }
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v74, 8);
    }
    goto LABEL_67;
  }
  if (self->_queuedStartSession
    || (v41 = -[SYSession state](currentSession, "state"), v41 > 9)
    || ((1 << v41) & 0x228) == 0)
  {
    objc_msgSend(v6, "sessionID");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*p_currentSession, "birthDate");
    v17 = v16;
    block[0] = 0;
    objc_msgSend(v6, "header");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sender");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = Current - v17;
    v21 = -[SYService _shouldSession:fromPeer:supercedeSession:ofAge:collisionDetected:](self, "_shouldSession:fromPeer:supercedeSession:ofAge:collisionDetected:", v11, v19, self->_currentSession, block, v20);

    if (v21)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v22 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        _SYObfuscate(*p_currentSession);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_211704000, v22, OS_LOG_TYPE_DEFAULT, "Cancelling current session (%{public}@) to make way for a new one (%{public}@).", buf, 0x16u);

      }
      v24 = *p_currentSession;
      v25 = objc_alloc(MEMORY[0x24BDD1540]);
      if (block[0])
        v26 = 2023;
      else
        v26 = 2005;
      v27 = (void *)objc_msgSend(v25, "initWithSYError:userInfo:", v26, 0);
      objc_msgSend(v24, "cancelWithError:", v27);

      -[SYService _enqueueIncomingStartSessionRequest:withCompletion:](self, "_enqueueIncomingStartSessionRequest:withCompletion:", v6, v7);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v43 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        _SYObfuscate(*p_currentSession);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2048;
        v84 = *(uint64_t (**)(uint64_t, uint64_t))&v20;
        _os_log_impl(&dword_211704000, v43, OS_LOG_TYPE_DEFAULT, "A new StartSyncSession (%{public}@) arrived, but there is a current session (%{public}@) with an age of %.02f, so we are rejecting the new session.", buf, 0x20u);

      }
      v45 = [SYErrorInfo alloc];
      v46 = objc_alloc(MEMORY[0x24BDD1540]);
      if (block[0])
        v47 = 2023;
      else
        v47 = 2005;
      v48 = (void *)objc_msgSend(v46, "initWithSYError:userInfo:", v47, 0);
      v49 = -[SYErrorInfo initWithError:](v45, "initWithError:", v48);
      objc_msgSend(v8, "setError:", v49);

      objc_msgSend(v6, "sessionID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      UserInfoDictionaryWithAssociatedSessionID(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*p_currentSession, "state"))
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v52 = qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211704000, v52, OS_LOG_TYPE_DEFAULT, "Issuing immediate rejection of incoming session request", buf, 2u);
        }
        v7[2](v7, v8, v51);
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v59 = qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211704000, v59, OS_LOG_TYPE_DEFAULT, "Terrifying deferred session rejection path (enqueue).", buf, 2u);
        }
        v60 = *p_currentSession;
        v78[0] = MEMORY[0x24BDAC760];
        v78[1] = 3221225472;
        v78[2] = __44__SYService__handleStartSession_completion___block_invoke;
        v78[3] = &unk_24CC65E78;
        v81 = v7;
        v79 = v8;
        v80 = v51;
        objc_msgSend(v60, "_onSessionStateChangedTo:do:", 6, v78);

      }
    }
LABEL_67:

    goto LABEL_68;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v42 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v42, OS_LOG_TYPE_DEFAULT, "Deferring incoming session requst for a short while", buf, 2u);
  }
  -[SYService _enqueueIncomingStartSessionRequest:withCompletion:](self, "_enqueueIncomingStartSessionRequest:withCompletion:", v6, v7);
LABEL_68:

  os_activity_scope_leave(&state);
}

uint64_t __44__SYService__handleStartSession_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "Terrifying deferred session rejection path (dequeue).", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __44__SYService__handleStartSession_completion___block_invoke_155(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error: (receiving)", buf, 2u);
  }
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v9 = 0;
  v6 = objc_msgSend(v3, "service:startSession:error:", v4, v5, &v9);
  v7 = v9;
  v8 = v9;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v7);

}

void __44__SYService__handleStartSession_completion___block_invoke_156(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t pseudo_signpost_id;
  NSObject *v12;
  const char *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  unint64_t v20;
  SYErrorInfo *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  unint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "metadataModified"))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = (void *)MEMORY[0x24BDD1618];
        objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setMetadata:", v10);

      }
    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "setAccepted:", 1);
      pseudo_signpost_id = _next_pseudo_signpost_id();
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v12 = (id)qword_253D84AE8;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*(id *)(a1 + 48), "isResetSync"))
          v13 = "reset";
        else
          v13 = "delta";
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "reason");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(*(id *)(a1 + 32), "reason");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = CFSTR("-");
        }
        v25 = 134219010;
        v26 = pseudo_signpost_id;
        v27 = 2082;
        v28 = v13;
        v29 = 2114;
        v30 = v15;
        v31 = 2114;
        v32 = v16;
        v33 = 2114;
        v34 = v18;
        _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "Start signpost %llu: Started incoming %{public}s %{public}@ with identifier %{public}@. Reason = '%{public}@'", (uint8_t *)&v25, 0x34u);
        if (v17)

      }
      objc_msgSend(*(id *)(a1 + 32), "setSessionSignpost:", pseudo_signpost_id);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v19 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 32);
        v25 = 138543362;
        v26 = v20;
        _os_log_impl(&dword_211704000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ decided not to come out and play.", (uint8_t *)&v25, 0xCu);
      }
      v21 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", v5);
      objc_msgSend(*(id *)(a1 + 40), "setError:", v21);

    }
    v22 = *(_QWORD *)(a1 + 56);
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "wrappedUserContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v22 + 16))(v22, v23, v24);

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      __44__SYService__handleStartSession_completion___block_invoke_156_cold_1();
  }

}

- (void)_handleResetRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  SYErrorInfo *v19;
  void *v20;
  SYErrorInfo *v21;
  NSObject *v22;
  os_activity_scope_state_s v23;
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &v23);
  v8 = (void *)objc_opt_new();
  v9 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v9);

  objc_msgSend(v8, "setAccepted:", 0);
  if (-[SYService isMasterStore](self, "isMasterStore"))
  {
    -[SYService currentSession](self, "currentSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelSessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:", v13) == 1;

      if (v14)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v15 = (id)qword_253D84AB8;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_msgSend(v11, "isResetSync");
          v17 = CFSTR("delta");
          if (v16)
            v17 = CFSTR("reset");
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "Accepting reset request: %{public}@ sync in progress, which will be canceled to make way for the requested reset.", buf, 0xCu);
        }

        objc_msgSend(v11, "cancel");
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2022, 0);
        objc_msgSend(v11, "setError:", v18);

      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v22 = qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211704000, v22, OS_LOG_TYPE_DEFAULT, "Canceling current session-- cancelation was explicitly requested by a reset request.", buf, 2u);
        }
        objc_msgSend(v11, "cancel");
      }
    }
    objc_msgSend(v8, "setAccepted:", 1);
    -[SYService setNeedsResetSync](self, "setNeedsResetSync");
    v7[2](v7, v8, 0);

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, (os_log_type_t)0x90u))
      -[SYService _handleResetRequest:completion:].cold.1();
    v19 = [SYErrorInfo alloc];
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2024, 0);
    v21 = -[SYErrorInfo initWithError:](v19, "initWithError:", v20);
    objc_msgSend(v8, "setError:", v21);

    v7[2](v7, v8, 0);
  }

  os_activity_scope_leave(&v23);
}

- (void)_handleSyncBatch:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SYErrorInfo *v12;
  void *v13;
  SYErrorInfo *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = (void *)objc_opt_new();
  v9 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v9);

  objc_msgSend(v6, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionID:", v10);

  objc_msgSend(v8, "setIndex:", objc_msgSend(v6, "index"));
  -[SYService currentSession](self, "currentSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (-[SYService _request:hasValidSessionIDForSession:response:completion:](self, "_request:hasValidSessionIDForSession:response:completion:", v6, v11, v8, v7))
    {
      objc_msgSend(v11, "_handleSyncBatch:response:completion:", v6, v8, v7);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYService _handleSyncBatch:completion:].cold.1();
    v12 = [SYErrorInfo alloc];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2004, 0);
    v14 = -[SYErrorInfo initWithError:](v12, "initWithError:", v13);
    objc_msgSend(v8, "setError:", v14);

    objc_msgSend(v6, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UserInfoDictionaryWithAssociatedSessionID(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v16);

  }
}

- (void)_handleRestartSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SYErrorInfo *v12;
  void *v13;
  SYErrorInfo *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = (void *)objc_opt_new();
  v9 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v9);

  objc_msgSend(v6, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionID:", v10);

  objc_msgSend(v8, "setAccepted:", 0);
  -[SYService currentSession](self, "currentSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (-[SYService _request:hasValidSessionIDForSession:response:completion:](self, "_request:hasValidSessionIDForSession:response:completion:", v6, v11, v8, v7))
    {
      objc_msgSend(v11, "_handleRestartSession:response:completion:", v6, v8, v7);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYService _handleRestartSession:completion:].cold.1();
    v12 = [SYErrorInfo alloc];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2004, 0);
    v14 = -[SYErrorInfo initWithError:](v12, "initWithError:", v13);
    objc_msgSend(v8, "setError:", v14);

    objc_msgSend(v6, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UserInfoDictionaryWithAssociatedSessionID(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v16);

  }
}

- (void)_handleEndSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SYErrorInfo *v12;
  void *v13;
  SYErrorInfo *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = (void *)objc_opt_new();
  v9 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v9);

  objc_msgSend(v6, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionID:", v10);

  -[SYService currentSession](self, "currentSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (-[SYService _request:hasValidSessionIDForSession:response:completion:](self, "_request:hasValidSessionIDForSession:response:completion:", v6, v11, v8, v7))
    {
      objc_msgSend(v11, "_handleEndSession:response:completion:", v6, v8, v7);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYService _handleEndSession:completion:].cold.1();
    v12 = [SYErrorInfo alloc];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2004, 0);
    v14 = -[SYErrorInfo initWithError:](v12, "initWithError:", v13);
    objc_msgSend(v8, "setError:", v14);

    objc_msgSend(v6, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UserInfoDictionaryWithAssociatedSessionID(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v16);

  }
}

- (BOOL)_handleResetResponse:(id)a3 error:(id *)a4
{
  id v5;
  NSString *inFlightSyncRequestIdentifier;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &v12);
  inFlightSyncRequestIdentifier = self->_inFlightSyncRequestIdentifier;
  self->_inFlightSyncRequestIdentifier = 0;

  if ((objc_msgSend(v5, "accepted") & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = (id)_sync_log_facilities;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "error");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("(no error)");
      if (v8)
        v10 = (const __CFString *)v8;
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "Reset Sync request was denied: %@", buf, 0xCu);

    }
  }
  os_activity_scope_leave(&v12);

  return 1;
}

- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  -[SYService currentSession](self, "currentSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    {
      -[SYService _handleStartSessionResponse:error:].cold.1();
      if (!a4)
        goto LABEL_13;
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    v19 = objc_alloc(MEMORY[0x24BDD1540]);
    v20 = 2004;
LABEL_11:
    v18 = 0;
    *a4 = (id)objc_msgSend(v19, "initWithSYError:userInfo:", v20, 0);
    goto LABEL_14;
  }
  objc_msgSend(v6, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      v19 = objc_alloc(MEMORY[0x24BDD1540]);
      v20 = 2006;
      goto LABEL_11;
    }
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "header");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generationID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "peerGenerationIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "header");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "peerID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v17);

  v18 = objc_msgSend(v7, "_handleStartSessionResponse:error:", v6, a4);
LABEL_14:

  return v18;
}

- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  -[SYService currentSession](self, "currentSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    {
      -[SYService _handleStartSessionResponse:error:].cold.1();
      if (!a4)
        goto LABEL_13;
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = 2004;
LABEL_11:
    v11 = 0;
    *a4 = (id)objc_msgSend(v12, "initWithSYError:userInfo:", v13, 0);
    goto LABEL_14;
  }
  objc_msgSend(v6, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      v12 = objc_alloc(MEMORY[0x24BDD1540]);
      v13 = 2006;
      goto LABEL_11;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v11 = objc_msgSend(v7, "_handleSyncBatchResponse:error:", v6, a4);
LABEL_14:

  return v11;
}

- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  -[SYService currentSession](self, "currentSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    {
      -[SYService _handleStartSessionResponse:error:].cold.1();
      if (!a4)
        goto LABEL_13;
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = 2004;
LABEL_11:
    v11 = 0;
    *a4 = (id)objc_msgSend(v12, "initWithSYError:userInfo:", v13, 0);
    goto LABEL_14;
  }
  objc_msgSend(v6, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      v12 = objc_alloc(MEMORY[0x24BDD1540]);
      v13 = 2006;
      goto LABEL_11;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v11 = objc_msgSend(v7, "_handleRestartSessionResponse:error:", v6, a4);
LABEL_14:

  return v11;
}

- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  -[SYService currentSession](self, "currentSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    {
      -[SYService _handleStartSessionResponse:error:].cold.1();
      if (!a4)
        goto LABEL_13;
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = 2004;
LABEL_11:
    v11 = 0;
    *a4 = (id)objc_msgSend(v12, "initWithSYError:userInfo:", v13, 0);
    goto LABEL_14;
  }
  objc_msgSend(v6, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      v12 = objc_alloc(MEMORY[0x24BDD1540]);
      v13 = 2006;
      goto LABEL_11;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v11 = objc_msgSend(v7, "_handleEndSessionResponse:error:", v6, a4);
LABEL_14:

  return v11;
}

- (void)_handleError:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;
  uint64_t v8;
  NSObject *delegateQueue;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "persistentUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = MEMORY[0x24BDAC760];
    delegateQueue = self->_delegateQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __26__SYService__handleError___block_invoke;
    v11[3] = &unk_24CC65560;
    v11[4] = self;
    v12 = v4;
    v13 = v5;
    v10 = v11;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = ___dispatch_sync_autoreleased_block_invoke;
    block[3] = &unk_24CC65FB8;
    v15 = v10;
    dispatch_sync(delegateQueue, block);

  }
}

void __26__SYService__handleError___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:encounteredError:context:", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  objc_msgSend(WeakRetained, "service:encounteredError:context:", a1[4], a1[5], a1[6]);

}

- (void)_peerRejectedVersion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  NSString *inFlightSyncRequestIdentifier;
  void *v13;
  NSString *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "supportedVersionsCount");
  if (v8)
  {
    v9 = 0;
    while (1)
    {
      v10 = objc_msgSend(v6, "supportedVersionsAtIndex:", v9);
      if ((v10 - 3) >= 0xFFFFFFFE)
        break;
      if (v8 == ++v9)
        goto LABEL_5;
    }
    v11 = v10;
    os_unfair_lock_lock(&self->_flagLock);
    self->_flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFFE3F | ((v11 & 7) << 6));
    os_unfair_lock_unlock(&self->_flagLock);
    inFlightSyncRequestIdentifier = self->_inFlightSyncRequestIdentifier;
    objc_msgSend(v6, "inReplyTo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(inFlightSyncRequestIdentifier) = -[NSString isEqualToString:](inFlightSyncRequestIdentifier, "isEqualToString:", v13);

    if ((_DWORD)inFlightSyncRequestIdentifier)
    {
      v14 = self->_inFlightSyncRequestIdentifier;
      self->_inFlightSyncRequestIdentifier = 0;

      -[SYService _sendResetRequest](self, "_sendResetRequest");
    }
    else
    {
      -[SYService _swapSessionForVersionChange](self, "_swapSessionForVersionChange");
    }
  }
  else
  {
LABEL_5:
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYService _peerRejectedVersion:completion:].cold.1();
  }
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)_swapSessionForVersionChange
{
  SYSession *v3;
  SYSession *v4;
  NSObject *queue;
  _QWORD v6[5];
  SYSession *v7;

  v3 = self->_currentSession;
  v4 = v3;
  if (v3)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__SYService__swapSessionForVersionChange__block_invoke;
    v6[3] = &unk_24CC652B8;
    v6[4] = self;
    v7 = v3;
    dispatch_async(queue, v6);

  }
}

void __41__SYService__swapSessionForVersionChange__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "_makeSessionForDeltaSync:", objc_msgSend(*(id *)(a1 + 40), "isResetSync") ^ 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_supercededWithSession:", v2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;
  v5 = v2;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__SYService__swapSessionForVersionChange__block_invoke_2;
  v6[3] = &unk_24CC65290;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "start:", v6);

}

void __41__SYService__swapSessionForVersionChange__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Swapped-out session (version rejection) failed to start: %@", buf, 0xCu);
    }
    v7 = objc_alloc(MEMORY[0x24BDD1540]);
    v10 = *MEMORY[0x24BDD1398];
    v11 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSYError:userInfo:", 2018, v8);

    objc_msgSend(*(id *)(a1 + 32), "_handleError:", v9);
  }

}

- (int64_t)priority
{
  return self->_defaultPriority;
}

- (void)setPriority:(int64_t)a3
{
  self->_defaultPriority = a3;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_defaultOptions, a3);
}

- (OS_os_activity)serviceActivity
{
  return self->_serviceActivity;
}

- (_SYMultiSuspendableQueue)sessionQueue
{
  return self->_sessionQueue;
}

- (double)defaultMessageTimeout
{
  return self->_defaultMessageTimeout;
}

- (void)setDefaultMessageTimeout:(double)a3
{
  self->_defaultMessageTimeout = a3;
}

- (double)sessionStalenessInterval
{
  return self->_sessionStalenessInterval;
}

- (void)setSessionStalenessInterval:(double)a3
{
  self->_sessionStalenessInterval = a3;
}

- (int64_t)sendingBufferCap
{
  return self->_sendingBufferCap;
}

- (void)setSendingBufferCap:(int64_t)a3
{
  self->_sendingBufferCap = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unsigned)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(unsigned int)a3
{
  self->_engineType = a3;
}

- (NSString)generationID
{
  return self->_generationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_serviceActivity, 0);
  objc_storeStrong((id *)&self->_onSessionEnd, 0);
  objc_storeStrong((id *)&self->_targetedDevice, 0);
  objc_storeStrong((id *)&self->_queuedStartSession, 0);
  objc_storeStrong((id *)&self->_inFlightSyncRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_rejectingV1SyncSessions, 0);
  objc_storeStrong((id *)&self->_vectorClock, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_processSignalSource, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_incomingIOQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_customIDSOptions, 0);
  objc_storeStrong((id *)&self->_defaultOptions, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)sendData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SYService *v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  v11 = (void *)objc_msgSend(v10, "copy");

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke;
  v15[3] = &unk_24CC65620;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v11;
  v12 = v11;
  v13 = v9;
  v14 = v8;
  _os_activity_initiate(&dword_211704000, "Send OOB Data", OS_ACTIVITY_FLAG_DEFAULT, v15);

  os_activity_scope_leave(&state);
}

void __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setPayload:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(v3 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke_2;
  v7[3] = &unk_24CC65620;
  v7[4] = v3;
  v8 = v2;
  v9 = v4;
  v10 = *(id *)(a1 + 56);
  v6 = v2;
  dispatch_async(v5, v7);

}

void __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)v2[14];
  v5 = objc_msgSend(v2, "priority");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke_3;
  v7[3] = &unk_24CC65EC8;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v3, 106, v5, v6, 0, v7);

}

uint64_t __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)sendData:(id)a3 options:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  dispatch_time_t v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, char, void *, void *);
  void *v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  v12 = dispatch_group_create();
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__5;
  v40 = __Block_byref_object_dispose__5;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  dispatch_group_enter(v12);
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __67__SYService_AtomicTransactions__sendData_options_identifier_error___block_invoke;
  v25 = &unk_24CC65EF0;
  v27 = &v42;
  v28 = &v36;
  v29 = &v30;
  v13 = v12;
  v26 = v13;
  -[SYService sendData:options:completion:](self, "sendData:options:completion:", v10, v11, &v22);
  -[SYService defaultMessageTimeout](self, "defaultMessageTimeout", v22, v23, v24, v25);
  v15 = v14;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SYServiceOptionMessageTimeout"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SYServiceOptionMessageTimeout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v15 = v18;

  }
  v19 = dispatch_walltime(0, (uint64_t)(v15 * 1000000000.0));
  if (dispatch_group_wait(v13, v19))
  {
    v20 = 0;
    if (a6)
      *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2007, 0);
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease((id)v37[5]);
    if (a6)
      *a6 = objc_retainAutorelease((id)v31[5]);
    v20 = *((_BYTE *)v43 + 24) != 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  os_activity_scope_leave(&state);

  return v20;
}

void __67__SYService_AtomicTransactions__sendData_options_identifier_error___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dataStreamWithMetadata:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  v11 = (void *)objc_msgSend(v10, "copy");

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__SYService_AtomicTransactions__dataStreamWithMetadata_options_completion___block_invoke;
  v15[3] = &unk_24CC65620;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v11;
  v12 = v11;
  v13 = v9;
  v14 = v8;
  _os_activity_initiate(&dword_211704000, "OOB Data Stream", OS_ACTIVITY_FLAG_DEFAULT, v15);

  os_activity_scope_leave(&state);
}

void __75__SYService_AtomicTransactions__dataStreamWithMetadata_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 56);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__SYService_AtomicTransactions__dataStreamWithMetadata_options_completion___block_invoke_2;
  v5[3] = &unk_24CC65620;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  dispatch_async(v4, v5);

}

void __75__SYService_AtomicTransactions__dataStreamWithMetadata_options_completion___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = (_QWORD *)a1[4];
  v3 = a1[5];
  v4 = (void *)v2[14];
  v5 = objc_msgSend(v2, "priority");
  v6 = a1[6];
  v9 = 0;
  objc_msgSend(v4, "outputStreamWithMetadata:priority:options:context:error:", v3, v5, v6, 0, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  (*(void (**)(void))(a1[7] + 16))();

}

- (id)dataStreamWithMetadata:(id)a3 options:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[5];
  id v16;
  id v17;
  uint64_t *v18;
  id *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;

  v9 = a3;
  v10 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  v25 = 0;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __81__SYService_AtomicTransactions__dataStreamWithMetadata_options_identifier_error___block_invoke;
  activity_block[3] = &unk_24CC65F40;
  activity_block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = &v20;
  v19 = a6;
  v11 = v10;
  v12 = v9;
  _os_activity_initiate(&dword_211704000, "OOB Data Stream", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __81__SYService_AtomicTransactions__dataStreamWithMetadata_options_identifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void (*v7[5])(_QWORD);
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v3 + 56);
  v7[0] = (void (*)(_QWORD))MEMORY[0x24BDAC760];
  v7[1] = (void (*)(_QWORD))3221225472;
  v7[2] = __81__SYService_AtomicTransactions__dataStreamWithMetadata_options_identifier_error___block_invoke_2;
  v7[3] = (void (*)(_QWORD))&unk_24CC65F18;
  v10 = *(_QWORD *)(a1 + 56);
  v7[4] = (void (*)(_QWORD))v3;
  v8 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  v9 = v5;
  v11 = v6;
  _dispatch_sync_safe_tagged(v4, (void *)v3, v7);

}

void __81__SYService_AtomicTransactions__dataStreamWithMetadata_options_identifier_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "outputStreamWithMetadata:priority:options:context:error:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "priority"), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)customIDSOptions
{
  return self->_customIDSOptions;
}

- (void)setCustomIDSOptions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *customIDSOptions;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  customIDSOptions = self->_customIDSOptions;
  self->_customIDSOptions = v4;

}

- (BOOL)hasPairingStore
{
  SYService *v2;
  os_unfair_lock_s *p_flagLock;

  v2 = self;
  p_flagLock = &self->_flagLock;
  os_unfair_lock_lock(&self->_flagLock);
  LODWORD(v2) = (*(_DWORD *)&v2->_flags >> 3) & 1;
  os_unfair_lock_unlock(p_flagLock);
  return (char)v2;
}

- (void)_v1_handleFullSyncRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double Current;
  double v13;
  void *v14;
  void *v15;
  SYErrorInfo *v16;
  void *v17;
  SYErrorInfo *v18;
  NSObject *v19;
  void *v20;
  SYErrorInfo *v21;
  void *v22;
  SYErrorInfo *v23;
  os_activity_scope_state_s v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v24.opaque[0] = 0;
  v24.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &v24);
  v8 = (void *)objc_opt_new();
  v9 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v9);

  objc_msgSend(v6, "syncID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequestSyncID:", v10);

  objc_msgSend(v8, "setAccepted:", 0);
  if (-[SYService isMasterStore](self, "isMasterStore"))
  {
    -[SYService currentSession](self, "currentSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v11, "birthDate");
      if (Current - v13 <= 1800.0)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v19 = (id)qword_253D84AB8;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v20;
          _os_log_impl(&dword_211704000, v19, OS_LOG_TYPE_DEFAULT, "Rejecting full-sync request: session (%{public}@) in progress", buf, 0xCu);

        }
        v21 = [SYErrorInfo alloc];
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2005, 0);
        v23 = -[SYErrorInfo initWithError:](v21, "initWithError:", v22);
        objc_msgSend(v8, "setError:", v23);

        objc_msgSend(v6, "syncID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        UserInfoDictionaryWithAssociatedSessionID(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v8, v15);
        goto LABEL_16;
      }
      objc_msgSend(v11, "cancel");
    }
    objc_msgSend(v8, "setAccepted:", 1);
    -[SYService setNeedsResetSync](self, "setNeedsResetSync");
    objc_msgSend(v6, "syncID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UserInfoDictionaryWithAssociatedSessionID(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v15);
LABEL_16:

    goto LABEL_17;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, (os_log_type_t)0x90u))
    -[SYService _handleResetRequest:completion:].cold.1();
  v16 = [SYErrorInfo alloc];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2024, 0);
  v18 = -[SYErrorInfo initWithError:](v16, "initWithError:", v17);
  objc_msgSend(v8, "setError:", v18);

  objc_msgSend(v6, "syncID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UserInfoDictionaryWithAssociatedSessionID(v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8, v14);
LABEL_17:

  os_activity_scope_leave(&v24);
}

- (void)_v1_handleSyncAllObjects:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  SYIncomingSyncAllObjectsSession *v10;
  double Current;
  double v12;
  SYIncomingSyncAllObjectsSession *v13;
  SYIncomingSyncAllObjectsSession *v14;
  SYIncomingSyncAllObjectsSession *v15;
  id WeakRetained;
  uint64_t v17;
  NSObject *delegateQueue;
  id v19;
  _QWORD *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  SYErrorInfo *v26;
  void *v27;
  SYErrorInfo *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  SYErrorInfo *v34;
  SYErrorInfo *v35;
  void *v36;
  SYIncomingSyncAllObjectsSession *obj;
  id obja;
  _QWORD v39[4];
  id v40;
  id location;
  _QWORD v42[4];
  id v43;
  SYService *v44;
  SYIncomingSyncAllObjectsSession *v45;
  uint64_t *v46;
  __int128 *p_buf;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  __int128 buf;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE block[24];
  void *v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "syncID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSyncID:", v9);

  -[SYService currentSession](self, "currentSession");
  v10 = (SYIncomingSyncAllObjectsSession *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  Current = CFAbsoluteTimeGetCurrent();
  -[SYSession birthDate](v10, "birthDate");
  if (Current - v12 > 1800.0)
  {
    -[SYSession cancel](v10, "cancel");
LABEL_4:
    v13 = -[SYIncomingSyncAllObjectsSession initWithService:message:completion:]([SYIncomingSyncAllObjectsSession alloc], "initWithService:message:completion:", self, v6, v7);
    v14 = v10;
    v15 = v13;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__5;
    v55 = __Block_byref_object_dispose__5;
    v56 = 0;
    v17 = MEMORY[0x24BDAC760];
    delegateQueue = self->_delegateQueue;
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __71__SYService_CompanionSyncProtoV1___v1_handleSyncAllObjects_completion___block_invoke;
    v42[3] = &unk_24CC65CD8;
    v46 = &v48;
    v19 = WeakRetained;
    v43 = v19;
    v44 = self;
    obj = v15;
    v10 = v15;
    v45 = v10;
    p_buf = &buf;
    v20 = v42;
    *(_QWORD *)block = v17;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___dispatch_sync_autoreleased_block_invoke;
    v58 = &unk_24CC65FB8;
    v59 = v20;
    dispatch_sync(delegateQueue, block);

    if (*((_BYTE *)v49 + 24))
    {
      if (self->_currentSession)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v21 = (id)qword_253D84AB8;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          _SYObfuscate(self->_currentSession);
          objc_claimAutoreleasedReturnValue();
          -[SYService _handleStartSession:completion:].cold.5();
        }

      }
      -[SYSyncEngine beginSession](self->_syncEngine, "beginSession", obj);
      if (-[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended"))
      {
        _os_assumes_log();
        -[SYService _processPendingChanges].cold.1();
      }
      -[_SYMultiSuspendableQueue suspend](self->_sessionQueue, "suspend");
      if (!-[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended"))
      {
        _os_assumes_log();
        -[SYService _processPendingChanges].cold.3();
      }
      objc_storeStrong((id *)&self->_currentSession, obja);
      objc_initWeak(&location, self);
      v39[0] = v17;
      v39[1] = 3221225472;
      v39[2] = __71__SYService_CompanionSyncProtoV1___v1_handleSyncAllObjects_completion___block_invoke_455;
      v39[3] = &unk_24CC65F68;
      objc_copyWeak(&v40, &location);
      -[SYIncomingFullSyncSession start:](v10, "start:", v39);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v30 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        _SYObfuscate(v10);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        _SYObfuscate(*(void **)(*((_QWORD *)&buf + 1) + 40));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)block = 138543618;
        *(_QWORD *)&block[4] = v31;
        *(_WORD *)&block[12] = 2114;
        *(_QWORD *)&block[14] = v32;
        _os_log_impl(&dword_211704000, v30, OS_LOG_TYPE_DEFAULT, "Delegate rejected incoming sync session (%{public}@) with error %{public}@", block, 0x16u);

      }
      v33 = -[SYService _newMessageHeader](self, "_newMessageHeader", obj);
      objc_msgSend(v8, "setHeader:", v33);

      v34 = [SYErrorInfo alloc];
      v35 = -[SYErrorInfo initWithError:](v34, "initWithError:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      objc_msgSend(v8, "setError:", v35);

      -[SYSession wrappedUserContext](v10, "wrappedUserContext");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v8, v36);

    }
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v48, 8);
    goto LABEL_27;
  }
  v22 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v22);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v23 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    -[SYSession identifier](v10, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v25;
    _os_log_impl(&dword_211704000, v24, OS_LOG_TYPE_DEFAULT, "Rejecting sync-all-objects: session (%{public}@) in progress", (uint8_t *)&buf, 0xCu);

  }
  v26 = [SYErrorInfo alloc];
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2005, 0);
  v28 = -[SYErrorInfo initWithError:](v26, "initWithError:", v27);
  objc_msgSend(v8, "setError:", v28);

  objc_msgSend(v6, "syncID");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  UserInfoDictionaryWithAssociatedSessionID(v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8, v29);

LABEL_27:
}

void __71__SYService_CompanionSyncProtoV1___v1_handleSyncAllObjects_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error:", buf, 2u);
  }
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v9 = 0;
  v6 = objc_msgSend(v3, "service:startSession:error:", v4, v5, &v9);
  v7 = v9;
  v8 = v9;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v7);

}

void __71__SYService_CompanionSyncProtoV1___v1_handleSyncAllObjects_completion___block_invoke_455(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      _SYObfuscate(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Incoming v1 SyncAllObjects session failed to start: %{public}@. Error response message will be delivered by the session when it's completed.", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)_v1_handleBatchSyncStart:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *rejectingV1SyncSessions;
  SYIncomingBatchSyncSession *v10;
  double Current;
  double v12;
  SYIncomingBatchSyncSession *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  uint64_t v17;
  NSObject *delegateQueue;
  id v19;
  _QWORD *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSMutableSet *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSMutableSet *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  SYIncomingBatchSyncSession *v34;
  id v35;
  id v36;
  id location;
  _QWORD v38[4];
  id v39;
  SYService *v40;
  SYIncomingBatchSyncSession *v41;
  uint64_t *v42;
  __int128 *p_buf;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE block[24];
  void *v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_rejectingV1SyncSessions)
  {
    v8 = (NSMutableSet *)objc_opt_new();
    rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
    self->_rejectingV1SyncSessions = v8;

  }
  -[SYService currentSession](self, "currentSession");
  v10 = (SYIncomingBatchSyncSession *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_6;
  Current = CFAbsoluteTimeGetCurrent();
  -[SYSession birthDate](v10, "birthDate");
  if (Current - v12 > 1800.0)
  {
    -[SYSession cancel](v10, "cancel");
LABEL_6:
    v13 = -[SYIncomingBatchSyncSession initWithService:]([SYIncomingBatchSyncSession alloc], "initWithService:", self);

    objc_msgSend(v6, "syncID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession setIdentifier:](v13, "setIdentifier:", v14);

    objc_msgSend(v6, "header");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timestamp");
    -[SYSession setBirthDate:](v13, "setBirthDate:");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__5;
    v51 = __Block_byref_object_dispose__5;
    v52 = 0;
    v17 = MEMORY[0x24BDAC760];
    delegateQueue = self->_delegateQueue;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __71__SYService_CompanionSyncProtoV1___v1_handleBatchSyncStart_completion___block_invoke;
    v38[3] = &unk_24CC65CD8;
    v42 = &v44;
    v19 = WeakRetained;
    v39 = v19;
    v40 = self;
    v10 = v13;
    v41 = v10;
    p_buf = &buf;
    v20 = v38;
    *(_QWORD *)block = v17;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___dispatch_sync_autoreleased_block_invoke;
    v54 = &unk_24CC65FB8;
    v55 = v20;
    dispatch_sync(delegateQueue, block);

    if (*((_BYTE *)v45 + 24))
    {
      if (self->_currentSession)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v21 = (id)qword_253D84AB8;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          _SYObfuscate(self->_currentSession);
          objc_claimAutoreleasedReturnValue();
          -[SYService _handleStartSession:completion:].cold.5();
        }

      }
      -[SYSyncEngine beginSession](self->_syncEngine, "beginSession");
      if (-[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended"))
      {
        _os_assumes_log();
        -[SYService _processPendingChanges].cold.1();
      }
      -[_SYMultiSuspendableQueue suspend](self->_sessionQueue, "suspend");
      if (!-[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended"))
      {
        _os_assumes_log();
        -[SYService _processPendingChanges].cold.3();
      }
      objc_storeStrong((id *)&self->_currentSession, v13);
      objc_initWeak(&location, self);
      v32[0] = v17;
      v32[1] = 3221225472;
      v32[2] = __71__SYService_CompanionSyncProtoV1___v1_handleBatchSyncStart_completion___block_invoke_458;
      v32[3] = &unk_24CC65F90;
      objc_copyWeak(&v36, &location);
      v33 = v6;
      v35 = v7;
      v34 = v10;
      -[SYIncomingFullSyncSession start:](v34, "start:", v32);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v27 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        _SYObfuscate(v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)block = 138543618;
        *(_QWORD *)&block[4] = v28;
        *(_WORD *)&block[12] = 2112;
        *(_QWORD *)&block[14] = v29;
        _os_log_impl(&dword_211704000, v27, OS_LOG_TYPE_DEFAULT, "Delegate rejected incoming sync session (%{public}@) with error %@", block, 0x16u);

      }
      v30 = self->_rejectingV1SyncSessions;
      objc_msgSend(v6, "syncID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v30, "addObject:", v31);

      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v44, 8);

    goto LABEL_29;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v22 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    -[SYSession identifier](v10, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v24;
    _os_log_impl(&dword_211704000, v23, OS_LOG_TYPE_DEFAULT, "Rejecting full-sync start: session (%{public}@) in progress", (uint8_t *)&buf, 0xCu);

  }
  v25 = self->_rejectingV1SyncSessions;
  objc_msgSend(v6, "syncID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](v25, "addObject:", v26);

  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
LABEL_29:

}

void __71__SYService_CompanionSyncProtoV1___v1_handleBatchSyncStart_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error", buf, 2u);
  }
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v9 = 0;
  v6 = objc_msgSend(v3, "service:startSession:error:", v4, v5, &v9);
  v7 = v9;
  v8 = v9;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v7);

}

void __71__SYService_CompanionSyncProtoV1___v1_handleBatchSyncStart_completion___block_invoke_458(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((a2 & 1) == 0 && WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 16);
    objc_msgSend(*(id *)(a1 + 32), "syncID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    v6 = (void *)*((_QWORD *)WeakRetained + 5);
    *((_QWORD *)WeakRetained + 5) = 0;

    objc_msgSend(*((id *)WeakRetained + 10), "resume");
  }
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "wrappedUserContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

- (void)_v1_handleBatchSyncChunk:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  SYSession *v8;
  NSMutableSet *rejectingV1SyncSessions;
  void *v10;
  char isKindOfClass;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  SYErrorInfo *v18;
  void *v19;
  SYErrorInfo *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = self->_currentSession;
  rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
  objc_msgSend(v6, "syncID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](rejectingV1SyncSessions, "containsObject:", v10) & 1) != 0)
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SYSession _handleBatchChunk:completion:](v8, "_handleBatchChunk:completion:", v6, v7);
      goto LABEL_10;
    }
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v12 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[SYSession identifier](v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v14;
    _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, "Rejecting full-sync batch: session (%{public}@) in progress", (uint8_t *)&v23, 0xCu);

  }
  v15 = (void *)objc_opt_new();
  v16 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v15, "setHeader:", v16);

  objc_msgSend(v6, "syncID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSyncID:", v17);

  objc_msgSend(v15, "setChunkIndex:", objc_msgSend(v6, "chunkIndex"));
  v18 = [SYErrorInfo alloc];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1002, 0);
  v20 = -[SYErrorInfo initWithError:](v18, "initWithError:", v19);
  objc_msgSend(v15, "setError:", v20);

  objc_msgSend(v6, "syncID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UserInfoDictionaryWithAssociatedSessionID(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v15, v22);

LABEL_10:
}

- (void)_v1_handleBatchSyncEnd:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  SYSession *v8;
  NSMutableSet *rejectingV1SyncSessions;
  void *v10;
  char isKindOfClass;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  SYErrorInfo *v18;
  void *v19;
  SYErrorInfo *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = self->_currentSession;
  rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
  objc_msgSend(v6, "syncID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](rejectingV1SyncSessions, "containsObject:", v10) & 1) != 0)
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SYSession _handleEndSync:completion:](v8, "_handleEndSync:completion:", v6, v7);
      goto LABEL_10;
    }
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v12 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[SYSession identifier](v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v14;
    _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, "Rejecting full-sync end: session (%{public}@) in progress", (uint8_t *)&v23, 0xCu);

  }
  v15 = (void *)objc_opt_new();
  v16 = -[SYService _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v15, "setHeader:", v16);

  objc_msgSend(v6, "syncID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSyncID:", v17);

  v18 = [SYErrorInfo alloc];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1002, 0);
  v20 = -[SYErrorInfo initWithError:](v18, "initWithError:", v19);
  objc_msgSend(v15, "setError:", v20);

  objc_msgSend(v15, "setErrorResolution:", 0);
  objc_msgSend(v6, "syncID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UserInfoDictionaryWithAssociatedSessionID(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v15, v22);

LABEL_10:
}

- (void)_v1_handleChangeMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SYIncomingTransactionSession *v8;
  double Current;
  double v10;
  SYIncomingTransactionSession *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  NSObject *delegateQueue;
  id v17;
  _QWORD *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id location;
  _QWORD v29[4];
  id v30;
  SYService *v31;
  SYIncomingTransactionSession *v32;
  uint64_t *v33;
  __int128 *p_buf;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE block[24];
  void *v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SYService currentSession](self, "currentSession");
  v8 = (SYIncomingTransactionSession *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_4;
  Current = CFAbsoluteTimeGetCurrent();
  -[SYSession birthDate](v8, "birthDate");
  if (Current - v10 > 1800.0)
  {
    -[SYSession cancel](v8, "cancel");
LABEL_4:
    v11 = -[SYIncomingTransactionSession initWithService:transaction:completion:]([SYIncomingTransactionSession alloc], "initWithService:transaction:completion:", self, v6, v7);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession setIdentifier:](v11, "setIdentifier:", v13);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__5;
    v42 = __Block_byref_object_dispose__5;
    v43 = 0;
    v15 = MEMORY[0x24BDAC760];
    delegateQueue = self->_delegateQueue;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __70__SYService_CompanionSyncProtoV1___v1_handleChangeMessage_completion___block_invoke;
    v29[3] = &unk_24CC65CD8;
    v33 = &v35;
    v17 = WeakRetained;
    v30 = v17;
    v31 = self;
    v8 = v11;
    v32 = v8;
    p_buf = &buf;
    v18 = v29;
    *(_QWORD *)block = v15;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___dispatch_sync_autoreleased_block_invoke;
    v45 = &unk_24CC65FB8;
    v46 = v18;
    dispatch_sync(delegateQueue, block);

    if (*((_BYTE *)v36 + 24))
    {
      if (self->_currentSession)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v19 = (id)qword_253D84AB8;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          _SYObfuscate(self->_currentSession);
          objc_claimAutoreleasedReturnValue();
          -[SYService _handleStartSession:completion:].cold.5();
        }

      }
      -[SYSyncEngine beginSession](self->_syncEngine, "beginSession");
      if (-[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended"))
      {
        _os_assumes_log();
        -[SYService _processPendingChanges].cold.1();
      }
      -[_SYMultiSuspendableQueue suspend](self->_sessionQueue, "suspend");
      if (!-[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended"))
      {
        _os_assumes_log();
        -[SYService _processPendingChanges].cold.3();
      }
      objc_storeStrong((id *)&self->_currentSession, v11);
      objc_initWeak(&location, self);
      v26[0] = v15;
      v26[1] = 3221225472;
      v26[2] = __70__SYService_CompanionSyncProtoV1___v1_handleChangeMessage_completion___block_invoke_461;
      v26[3] = &unk_24CC65F68;
      objc_copyWeak(&v27, &location);
      -[SYIncomingTransactionSession start:](v8, "start:", v26);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v23 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        _SYObfuscate(v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)block = 138543618;
        *(_QWORD *)&block[4] = v24;
        *(_WORD *)&block[12] = 2112;
        *(_QWORD *)&block[14] = v25;
        _os_log_impl(&dword_211704000, v23, OS_LOG_TYPE_DEFAULT, "Delegate rejected incoming v1 transaction (%{public}@) with error %@", block, 0x16u);

      }
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v35, 8);

    goto LABEL_27;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v20 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    -[SYSession identifier](v8, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v22;
    _os_log_impl(&dword_211704000, v21, OS_LOG_TYPE_DEFAULT, "Rejecting delta change: session (%{public}@) in progress", (uint8_t *)&buf, 0xCu);

  }
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
LABEL_27:

}

void __70__SYService_CompanionSyncProtoV1___v1_handleChangeMessage_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error:", buf, 2u);
  }
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v9 = 0;
  v6 = objc_msgSend(v3, "service:startSession:error:", v4, v5, &v9);
  v7 = v9;
  v8 = v9;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v7);

}

void __70__SYService_CompanionSyncProtoV1___v1_handleChangeMessage_completion___block_invoke_461(uint64_t a1, char a2)
{
  id *WeakRetained;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0 && WeakRetained)
  {
    v4 = WeakRetained[5];
    WeakRetained[5] = 0;
    v5 = WeakRetained;

    objc_msgSend(v5[10], "resume");
    WeakRetained = v5;
  }

}

- (BOOL)_v1_handleFullSyncRequestAck:(id)a3 error:(id *)a4
{
  id v5;
  NSString *inFlightSyncRequestIdentifier;
  NSObject *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &v11);
  inFlightSyncRequestIdentifier = self->_inFlightSyncRequestIdentifier;
  self->_inFlightSyncRequestIdentifier = 0;

  if ((objc_msgSend(v5, "accepted") & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _SYObfuscate(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "Protocol v1 full-sync-request was DENIED with error %{public}@", buf, 0xCu);

    }
  }
  os_activity_scope_leave(&v11);

  return 1;
}

- (BOOL)_v1_handleBatchChunkAck:(id)a3 error:(id *)a4
{
  id v6;
  SYSession *v7;
  NSMutableSet *rejectingV1SyncSessions;
  void *v9;
  char isKindOfClass;
  char v11;
  NSObject *v12;
  uint8_t v14[16];

  v6 = a3;
  v7 = self->_currentSession;
  rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
  objc_msgSend(v6, "syncID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](rejectingV1SyncSessions, "containsObject:", v9) & 1) != 0)
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v11 = -[SYSession _handleBatchAck:error:](v7, "_handleBatchAck:error:", v6, a4);
      goto LABEL_11;
    }
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v12 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "Response received for rejected v1 session", v14, 2u);
  }
  v11 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1002, 0);
LABEL_11:

  return v11;
}

- (BOOL)_v1_handleBatchEndResponse:(id)a3 error:(id *)a4
{
  id v6;
  SYSession *v7;
  NSMutableSet *rejectingV1SyncSessions;
  void *v9;
  NSObject *v10;
  char v11;
  char isKindOfClass;
  uint8_t v14[16];

  v6 = a3;
  v7 = self->_currentSession;
  rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
  objc_msgSend(v6, "syncID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](rejectingV1SyncSessions, "containsObject:", v9) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_3;
    }
    v11 = -[SYSession _handleBatchSyncEndResponse:error:](v7, "_handleBatchSyncEndResponse:error:", v6, a4);
    goto LABEL_13;
  }

LABEL_3:
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v10 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Response received for rejected v1 session", v14, 2u);
  }
  v11 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1002, 0);
LABEL_13:

  return v11;
}

- (void)initWithService:priority:qos:asMasterStore:options:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (_sync_log_facilities_pred != -1)
    OUTLINED_FUNCTION_8();
  if (OUTLINED_FUNCTION_4_2())
    OUTLINED_FUNCTION_0_5(&dword_211704000, v0, v1, "Queue state assumption failed: _sessionQueue.suspended", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)_updateMetaProtocolInfoForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_211704000, v0, v1, "For some reason I have a pairing store path but no SYDevice??", v2);
  OUTLINED_FUNCTION_3_1();
}

void __41__SYService__deviceTargetabilityChanged___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_15_0(&dword_211704000, v4, v5, "Device info: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

void __41__SYService__deviceTargetabilityChanged___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_15_0(&dword_211704000, v4, v5, "Current device info: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

void __41__SYService__deviceTargetabilityChanged___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "_deviceTargetabilityChanged:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)resume:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "SYService resumed with no delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)resume:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "SYService resumed with no pairing store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)resume:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "SYService resumed while already running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __20__SYService_resume___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  if (_sync_log_facilities_pred != -1)
    OUTLINED_FUNCTION_8();
  if (OUTLINED_FUNCTION_4_2())
    OUTLINED_FUNCTION_0_5(&dword_211704000, v0, v1, "Queue state assumption failed: _sessionQueue.suspended == NO", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3_2();
}

void __20__SYService_resume___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_21_0(*MEMORY[0x24BDAC8D0]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_1(&dword_211704000, v1, v2, "Error initializing SYService messaging: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __20__SYService_resume___block_invoke_cold_3()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_21_0(*MEMORY[0x24BDAC8D0]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_1(&dword_211704000, v1, v2, "Error initializing SYService DB: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_initializeServiceDB:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v0, v1, "Nil data store path for SYService %p", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_initializeServiceDB:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "SYService has a nil persistent store!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_swapEngineTo:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_17_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_18_0(&dword_211704000, v3, v4, "Failed to restore original engine! I can only suspend the entire service now... %{public}@", v5);

  OUTLINED_FUNCTION_12_0();
}

- (void)_swapEngineTo:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_13_0();
  *(_DWORD *)v1 = 67109378;
  *(_DWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 8) = 2114;
  *(_QWORD *)(v1 + 10) = v3;
  OUTLINED_FUNCTION_22_0(&dword_211704000, v5, v2, "Failed to swap to engine type %{companionsync:SYServiceEngineType}d: %{public}@", v4);

  OUTLINED_FUNCTION_12_0();
}

- (void)sessionDidEnd:(void *)a1 withError:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v1, v4, "The ended session (%{public}@) is not the current session. Why is that?", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)_wrapUpCurrentSession:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = 138543618;
  v6 = a1;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_211704000, v3, OS_LOG_TYPE_ERROR, "Concluding session has birthDate in the future! birthDate = %{public}@, now = %{public}@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_12();
}

void __35__SYService__wrapUpCurrentSession___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  if (_sync_log_facilities_pred != -1)
    OUTLINED_FUNCTION_8();
  if (OUTLINED_FUNCTION_4_2())
    OUTLINED_FUNCTION_0_5(&dword_211704000, v0, v1, "Queue state assumption failed: service->_sessionQueue.isSuspended == YES", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)_chooseBetweenCollidingSessions:(void *)a1 :(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_211704000, v3, OS_LOG_TYPE_DEBUG, "Asking delegate about session collision preference. We have chosen %{public}@ as the winner", v5, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)willAcceptMessageWithHeader:(void *)a1 messageID:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3[0] = 67109120;
  v3[1] = objc_msgSend((id)OUTLINED_FUNCTION_13(), "version");
  _os_log_error_impl(&dword_211704000, v1, OS_LOG_TYPE_ERROR, "Received message from unknown protocol version '%u'", (uint8_t *)v3, 8u);

  OUTLINED_FUNCTION_3_2();
}

- (void)willAcceptMessageWithHeader:(os_log_t)log messageID:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_error_impl(&dword_211704000, log, (os_log_type_t)0x90u, "Message repeated (bubble): seqno = %llu, GUID = %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __47__SYService_handleSyncRequest_ofType_response___block_invoke_cold_1(unsigned __int16 *a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  int v4;
  id v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = a3;
  OUTLINED_FUNCTION_13();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 67109378;
  v9[1] = v4;
  v10 = 2114;
  v11 = v7;
  OUTLINED_FUNCTION_22_0(&dword_211704000, v3, v8, "Unknown message arrived with SYMessageID %d (PB class '%{public}@')", (uint8_t *)v9);

  OUTLINED_FUNCTION_12();
}

void __52__SYService_handleFileTransfer_metadata_completion___block_invoke_146_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v0, v1, "Failed to remove file used by file-transfer after read completion: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_enqueueIncomingStartSessionRequest:withCompletion:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  if (_sync_log_facilities_pred != -1)
    OUTLINED_FUNCTION_8();
  if (OUTLINED_FUNCTION_4_2())
    OUTLINED_FUNCTION_0_5(&dword_211704000, v0, v1, "Queue state assumption failed: _queuedStartSession == nil", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)_handleStartSession:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Reset sync session sent to master peer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_handleStartSession:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Notifying engine of incoming session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_handleStartSession:completion:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_17_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_211704000, v3, (uint64_t)v3, "About to build a new session, but there's already one running! Currently-running session is %{public}@", v4);

  OUTLINED_FUNCTION_12_0();
}

void __44__SYService__handleStartSession_completion___block_invoke_156_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Critical failure. Session start callback gave us a nil self.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_handleResetRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_211704000, v0, v1, "A SYResetRequest was received by a slave peer, which is invalid.", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)_handleSyncBatch:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Rejecting sync batch: no session in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_handleRestartSession:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Rejecting sync restart: no session in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_handleEndSession:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Rejecting sync end: no session in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_handleStartSessionResponse:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "No session in progress for incoming response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_peerRejectedVersion:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Unable to switch protocols -- peer doesn't support anything I know!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
