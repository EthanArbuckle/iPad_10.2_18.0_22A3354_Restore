@implementation CMContinuityCaptureRemoteCompositeDevice

- (CMContinuityCaptureRemoteCompositeDevice)initWithTransportServer:(id)a3 videoPreviewLayer:(id)a4
{
  id v6;
  id v7;
  CMContinuityCaptureRemoteCompositeDevice *v8;
  CMContinuityCaptureRemoteCompositeDevice *v9;
  NSMutableSet *v10;
  NSMutableSet *remoteClientDisconnectNotifiedByEntityType;
  NSMutableDictionary *v12;
  NSMutableDictionary *cmControlByName;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  id v17;
  CMContinuityCaptureEventQueue *v18;
  CMContinuityCaptureEventQueue *eventQueue;
  NSMutableDictionary *v20;
  NSMutableDictionary *captureDeviceByEntityType;
  NSMutableArray *v22;
  NSMutableArray *pendingEventToBePostedQueue;
  CMContinuityCaptureFrameRateManager *v24;
  CMContinuityCaptureFrameRateManager *frameRateManager;
  NSMutableSet *v26;
  NSMutableSet *activeVideoEntities;
  uint64_t v28;
  OS_os_transaction *transaction;
  id WeakRetained;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  CMContinuityCaptureRemoteCompositeDevice *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  CMContinuityCaptureRemoteCompositeDevice *v43;
  NSObject *v44;
  unsigned __int8 *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  CMContinuityCaptureRemoteCompositeDevice *v53;
  _QWORD v55[4];
  unsigned __int8 *v56;
  _QWORD v57[4];
  CMContinuityCaptureRemoteCompositeDevice *v58;
  _QWORD block[4];
  CMContinuityCaptureRemoteCompositeDevice *v60;
  objc_super v61;
  uint8_t buf[4];
  unsigned __int8 *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v61.receiver = self;
  v61.super_class = (Class)CMContinuityCaptureRemoteCompositeDevice;
  v8 = -[CMContinuityCaptureRemoteCompositeDevice init](&v61, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_11;
  objc_storeStrong((id *)&v8->_videoPreviewLayer, a4);
  v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  remoteClientDisconnectNotifiedByEntityType = v9->_remoteClientDisconnectNotifiedByEntityType;
  v9->_remoteClientDisconnectNotifiedByEntityType = v10;

  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  cmControlByName = v9->_cmControlByName;
  v9->_cmControlByName = v12;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("com.apple.continuity-capture", v14);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v15;

  v17 = objc_storeWeak((id *)&v9->_server, v6);
  objc_msgSend(v6, "setDelegate:", v9);

  v18 = -[CMContinuityCaptureEventQueue initWithActionDelegate:queue:]([CMContinuityCaptureEventQueue alloc], "initWithActionDelegate:queue:", v9, v9->_queue);
  eventQueue = v9->_eventQueue;
  v9->_eventQueue = v18;

  v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  captureDeviceByEntityType = v9->_captureDeviceByEntityType;
  v9->_captureDeviceByEntityType = v20;

  v9->_legacyConnectionResetDelay = FigGetCFPreferenceNumberWithDefault();
  v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  pendingEventToBePostedQueue = v9->_pendingEventToBePostedQueue;
  v9->_pendingEventToBePostedQueue = v22;

  v24 = objc_alloc_init(CMContinuityCaptureFrameRateManager);
  frameRateManager = v9->_frameRateManager;
  v9->_frameRateManager = v24;

  v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  activeVideoEntities = v9->_activeVideoEntities;
  v9->_activeVideoEntities = v26;

  v28 = os_transaction_create();
  transaction = v9->_transaction;
  v9->_transaction = (OS_os_transaction *)v28;

  -[CMContinuityCaptureRemoteCompositeDevice setupControls](v9, "setupControls");
  if (-[CMContinuityCaptureRemoteCompositeDevice setupCaptureDevices](v9, "setupCaptureDevices"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&v9->_server);
    objc_msgSend(WeakRetained, "localDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:forKeyPath:options:context:", v9, CFSTR("activeStreams"), 3, 0);

    v32 = objc_loadWeakRetained((id *)&v9->_server);
    objc_msgSend(v32, "addObserver:forKeyPath:options:context:", v9, CFSTR("timeSyncClock"), 3, 0);

    atomic_store(1u, (unsigned __int8 *)&v9->_observingTimeSyncState);
    atomic_store(1u, (unsigned __int8 *)&v9->_observingActiveStreamState);
    +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "queue");
    v34 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v34);

    +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "queue");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke;
    block[3] = &unk_24F06AEB0;
    v38 = v9;
    v60 = v38;
    dispatch_async_and_wait(v36, block);

    +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "queue");
    v40 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v40);

    +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "queue");
    v42 = objc_claimAutoreleasedReturnValue();
    v57[0] = v37;
    v57[1] = 3221225472;
    v57[2] = __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke_2;
    v57[3] = &unk_24F06AEB0;
    v43 = v38;
    v58 = v43;
    dispatch_async_and_wait(v42, v57);

    dispatch_assert_queue_not_V2((dispatch_queue_t)v9->_queue);
    v44 = v9->_queue;
    v55[0] = v37;
    v55[1] = 3221225472;
    v55[2] = __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke_3;
    v55[3] = &unk_24F06AEB0;
    v45 = v43;
    v56 = v45;
    dispatch_async_and_wait(v44, v55);

    -[NSMutableDictionary objectForKeyedSubscript:](v9->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v9->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "captureSession");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addObserver:forKeyPath:options:context:", v45, CFSTR("state"), 3, 0);

      atomic_store(1u, v45 + 97);
    }
    -[NSMutableDictionary objectForKeyedSubscript:](v9->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA38);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v9->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA38);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "captureSession");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObserver:forKeyPath:options:context:", v45, CFSTR("state"), 3, 0);

      atomic_store(1u, v45 + 98);
    }
    CMContinuityCaptureLog(2);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v63 = v45;
      v64 = 2080;
      v65 = "-[CMContinuityCaptureRemoteCompositeDevice initWithTransportServer:videoPreviewLayer:]";
      v66 = 2112;
      v67 = v6;
      _os_log_impl(&dword_227C5D000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ %s server: %@", buf, 0x20u);
    }

    v53 = v45;
  }
  else
  {
LABEL_11:
    v53 = 0;
  }

  return v53;
}

void __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("batteryState"), 3, 0);

  +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("batteryLevel"), 3, 0);

}

void __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke_2(uint64_t a1)
{
  id v2;

  +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("thermalLevel"), 3, 0);

}

uint64_t __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStreamConnectStatus");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)state
{
  return self->_state;
}

- (CMContinuityCaptureFrameRateManager)frameRateManager
{
  return self->_frameRateManager;
}

- (NSDate)currentSessionActivationStartTime
{
  void *v2;
  void *v3;
  void *v4;

  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sessionActivationStartTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

+ (void)setWombatMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543874;
    v7 = a1;
    v8 = 2080;
    v9 = "+[CMContinuityCaptureRemoteCompositeDevice setWombatMode:]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %d", (uint8_t *)&v6, 0x1Cu);
  }

  FigCaptureSessionRemoteSetWombatInUse();
  FigCaptureSessionRemoteSetWombatEnabled();
}

- (void)updateStreamConnectStatus
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSMutableSet *v8;
  NSMutableSet *pendingSidebandStreamIdentifiers;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableSet *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSMutableSet *remoteClientDisconnectNotifiedByEntityType;
  void *v22;
  NSMutableSet *v23;
  void *v24;
  BOOL v25;
  int64_t v26;
  NSObject *v27;
  int64_t currentTransport;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  _BOOL4 v49;
  NSObject *v50;
  NSMutableSet *v51;
  NSObject *v52;
  const char *v53;
  uint32_t v54;
  NSMutableSet *v55;
  void *v56;
  NSMutableSet *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  NSMutableSet *v61;
  void *v62;
  NSMutableSet *v63;
  uint64_t v64;
  int64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  char *v70;
  NSObject *v71;
  void *v72;
  id WeakRetained;
  void *v74;
  int v75;
  NSObject *v76;
  unsigned int legacyConnectionResetDelay;
  id v78;
  void *v79;
  dispatch_time_t v80;
  char v81;
  id obj;
  id v83;
  _QWORD block[4];
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id location;
  _BYTE v99[128];
  _QWORD v100[3];
  _QWORD v101[2];
  _QWORD v102[2];
  uint8_t v103[128];
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v105;
  __int16 v106;
  const char *v107;
  __int16 v108;
  int64_t v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  NSMutableSet *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v105 = self;
    v106 = 2080;
    v107 = "-[CMContinuityCaptureRemoteCompositeDevice updateStreamConnectStatus]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v83 = v4;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v6 = objc_alloc(MEMORY[0x24BDBCEF0]);
    CMContinuityCaptureGetListOfSupportedSidebandIdentifiers();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSMutableSet *)objc_msgSend(v6, "initWithArray:", v7);
    pendingSidebandStreamIdentifiers = self->_pendingSidebandStreamIdentifiers;
    self->_pendingSidebandStreamIdentifiers = v8;

    objc_msgSend(v83, "localDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v10);
    objc_msgSend(v83, "localDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeStreams");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v10);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v95 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          v17 = self->_pendingSidebandStreamIdentifiers;
          objc_msgSend(v16, "streamIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet removeObject:](v17, "removeObject:", v18);

          if (objc_msgSend(v16, "entity"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v16, "entity"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v19);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
      }
      while (v13);
    }

    CMContinuityCaptureLog(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      remoteClientDisconnectNotifiedByEntityType = self->_remoteClientDisconnectNotifiedByEntityType;
      objc_msgSend(v83, "timeSyncClock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = self->_pendingSidebandStreamIdentifiers;
      *(_DWORD *)buf = 138544386;
      v105 = self;
      v106 = 2114;
      v107 = (const char *)v5;
      v108 = 2114;
      v109 = (int64_t)remoteClientDisconnectNotifiedByEntityType;
      v110 = 2112;
      v111 = v22;
      v112 = 2112;
      v113 = v23;
      _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ active entities %{public}@ pendingReconnectEntities %{public}@ timeSync %@ pendingSidebandStreamIdentifiers %@", buf, 0x34u);

    }
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v83, "timeSyncClock");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (!v25)
      {
        v26 = objc_msgSend(v83, "currentTransport");
        CMContinuityCaptureLog(2);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          currentTransport = self->_currentTransport;
          *(_DWORD *)buf = 138543874;
          v105 = self;
          v106 = 2048;
          v107 = (const char *)currentTransport;
          v108 = 2048;
          v109 = v26;
          _os_log_impl(&dword_227C5D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ evaluate pong %ld -> %ld", buf, 0x20u);
        }

        if (v26 != self->_currentTransport)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "captureSession");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setTransport:", v26);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA38);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "captureSession");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setTransport:", v26);

          }
          self->_currentTransport = v26;
          if (v26 == 2)
          {
            CMContinuityCaptureLog(2);
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v105 = self;
              _os_log_impl(&dword_227C5D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ skip pong sound since device is wired", buf, 0xCu);
            }
          }
          else
          {
            v36 = objc_msgSend(v83, "clientDeviceModel");
            CMContinuityCaptureLog(2);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v105 = self;
              v106 = 1024;
              LODWORD(v107) = v36 == 2;
              _os_log_impl(&dword_227C5D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ play pong sound since device is wireless (consider pong history : %d)", buf, 0x12u);
            }

            +[CMContinuityCapturePongSoundManager sharedInstance](CMContinuityCapturePongSoundManager, "sharedInstance");
            v35 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "localDevice");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "deviceIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "UUIDString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject pongIfNeededWithShouldConsiderPongHistory:forIdentifier:](v35, "pongIfNeededWithShouldConsiderPongHistory:forIdentifier:", v36 == 2, v40);

          }
        }
      }
    }
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    -[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
    if (v42)
    {
      v81 = 0;
      v43 = *(_QWORD *)v91;
      while (1)
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v91 != v43)
            objc_enumerationMutation(v41);
          v45 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v44);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v45, "entity"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v5, "containsObject:", v46);

          if (!v47)
          {
            v55 = self->_remoteClientDisconnectNotifiedByEntityType;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v45, "entity"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v55) = -[NSMutableSet containsObject:](v55, "containsObject:", v56);

            if ((v55 & 1) != 0)
              goto LABEL_49;
            v57 = self->_remoteClientDisconnectNotifiedByEntityType;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v45, "entity"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v57, "addObject:", v58);

            v59 = objc_msgSend(v45, "entity");
            v102[0] = &unk_24F07FA50;
            v101[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption");
            v101[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
            v50 = objc_claimAutoreleasedReturnValue();
            v102[1] = v50;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect"), v59, v60);

            goto LABEL_48;
          }
          objc_msgSend(v83, "timeSyncClock");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48 == 0;

          if (v49)
          {
            CMContinuityCaptureLog(2);
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v105 = self;
              v52 = v50;
              v53 = "%{public}@ Wait for timesync clock";
              v54 = 12;
LABEL_45:
              _os_log_impl(&dword_227C5D000, v52, OS_LOG_TYPE_DEFAULT, v53, buf, v54);
            }
LABEL_48:

            goto LABEL_49;
          }
          if (-[NSMutableSet count](self->_pendingSidebandStreamIdentifiers, "count"))
          {
            CMContinuityCaptureLog(2);
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = self->_pendingSidebandStreamIdentifiers;
              *(_DWORD *)buf = 138543618;
              v105 = self;
              v106 = 2112;
              v107 = (const char *)v51;
              v52 = v50;
              v53 = "%{public}@ Wait for sideband identifiers %@";
              v54 = 22;
              goto LABEL_45;
            }
            goto LABEL_48;
          }
          v61 = self->_remoteClientDisconnectNotifiedByEntityType;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v45, "entity"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v61) = -[NSMutableSet containsObject:](v61, "containsObject:", v62);

          if ((_DWORD)v61)
          {
            -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientReconnect"), objc_msgSend(v45, "entity"), 0);
            v63 = self->_remoteClientDisconnectNotifiedByEntityType;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v45, "entity"));
            v50 = objc_claimAutoreleasedReturnValue();
            -[NSMutableSet removeObject:](v63, "removeObject:", v50);
            v81 = 1;
            goto LABEL_48;
          }
          v81 = 1;
LABEL_49:
          ++v44;
        }
        while (v42 != v44);
        v64 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
        v42 = v64;
        if (!v64)
          goto LABEL_55;
      }
    }
    v81 = 0;
LABEL_55:

    if (objc_msgSend(v5, "count"))
    {
      -[CMContinuityCaptureRemoteCompositeDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
      v65 = self->_state & 0xFFFFFFFFFFFFFFF7;
    }
    else
    {
      -[CMContinuityCaptureRemoteCompositeDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
      v65 = self->_state | 8;
    }
    self->_state = v65;
    -[CMContinuityCaptureRemoteCompositeDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
    if ((v81 & 1) != 0)
    {
      v100[0] = CFSTR("kCMContinuityCaptureControlSystemPressure");
      v100[1] = CFSTR("kCMContinuityCaptureControlBatteryLevel");
      v100[2] = CFSTR("kCMContinuityCaptureControlBatteryState");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 3);
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v66 = (id)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
      if (v67)
      {
        v68 = *(_QWORD *)v87;
        do
        {
          for (j = 0; j != v67; ++j)
          {
            if (*(_QWORD *)v87 != v68)
              objc_enumerationMutation(v66);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j));
            v70 = (char *)objc_claimAutoreleasedReturnValue();
            if (v70)
            {
              CMContinuityCaptureLog(2);
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v105 = self;
                v106 = 2112;
                v107 = v70;
                _os_log_impl(&dword_227C5D000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated %@", buf, 0x16u);
              }

              objc_msgSend(v83, "localDevice");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setValueForControl:completion:", v70, 0);

            }
          }
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        }
        while (v67);
      }

      if (!-[NSMutableSet count](self->_remoteClientDisconnectNotifiedByEntityType, "count"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_server);
        objc_msgSend(WeakRetained, "localDevice");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "legacyReconnectRecovery");

        if (v75)
        {
          CMContinuityCaptureLog(2);
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            legacyConnectionResetDelay = self->_legacyConnectionResetDelay;
            *(_DWORD *)buf = 138543618;
            v105 = self;
            v106 = 1024;
            LODWORD(v107) = legacyConnectionResetDelay;
            _os_log_impl(&dword_227C5D000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ Legacy Recovery after %u", buf, 0x12u);
          }

          v78 = objc_loadWeakRetained((id *)&self->_server);
          objc_msgSend(v78, "localDevice");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setLegacyReconnectRecovery:", 0);

          -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventUserPause"), 0, 0);
          v80 = dispatch_time(0, 1000000000 * self->_legacyConnectionResetDelay);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __69__CMContinuityCaptureRemoteCompositeDevice_updateStreamConnectStatus__block_invoke;
          block[3] = &unk_24F06AE60;
          objc_copyWeak(&v85, &location);
          dispatch_after(v80, MEMORY[0x24BDAC9B8], block);
          objc_destroyWeak(&v85);
        }
      }
      -[CMContinuityCaptureRemoteCompositeDevice postAggregatedCachedEventsIfApplicable](self, "postAggregatedCachedEventsIfApplicable");
      -[CMContinuityCaptureRemoteCompositeDevice updateSystemState](self, "updateSystemState");

    }
    v4 = v83;
  }

  objc_destroyWeak(&location);
}

void __69__CMContinuityCaptureRemoteCompositeDevice_updateStreamConnectStatus__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventUserResume"), 0, 0);
    objc_msgSend(v5, "server");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "localDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventUserResume"), 0, 0);

    }
    WeakRetained = v5;
  }

}

- (id)_aggregateEventPairInAnyState:(id)a3 entryEventName:(id)a4 exitEventName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v23 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((v15 & 1) != 0)
        {
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v15 = 1;
        }
        else if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "count")
               && (objc_msgSend(v18, "firstObject"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v20 = v19;
          if ((objc_msgSend(v19, "isEqualToString:", v9) & 1) != 0
            || objc_msgSend(v20, "isEqualToString:", v23))
          {
            v21 = v18;

            v15 = 0;
          }
          else
          {
            if (v14)
              objc_msgSend(v10, "addObject:", v14);

            objc_msgSend(v10, "addObject:", v18);
            v21 = 0;
            v15 = 1;
          }

          v14 = v21;
        }
        else
        {
          v15 = 0;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);

    if (v14)
      objc_msgSend(v10, "addObject:", v14);
  }
  else
  {

    v14 = 0;
  }

  return v10;
}

- (void)postAggregatedCachedEventsIfApplicable
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *pendingEventToBePostedQueue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableArray count](self->_pendingEventToBePostedQueue, "count"))
  {
    -[CMContinuityCaptureRemoteCompositeDevice _aggregateEventPairInAnyState:entryEventName:exitEventName:](self, "_aggregateEventPairInAnyState:entryEventName:exitEventName:", self->_pendingEventToBePostedQueue, CFSTR("kCMContinuityCaptureEventActiveCallStart"), CFSTR("kCMContinuityCaptureEventActiveCallEnd"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteCompositeDevice _aggregateEventPairInAnyState:entryEventName:exitEventName:](self, "_aggregateEventPairInAnyState:entryEventName:exitEventName:", v3, CFSTR("kCMContinuityCaptureEventUserPause"), CFSTR("kCMContinuityCaptureEventUserResume"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingEventToBePostedQueue = self->_pendingEventToBePostedQueue;
    self->_pendingEventToBePostedQueue = v5;

    if (v4 && objc_msgSend(v4, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = v4;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if ((unint64_t)objc_msgSend(v12, "count") >= 3)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "unsignedIntegerValue");

              objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              CMContinuityCaptureLog(2);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v24 = self;
                v25 = 2114;
                v26 = v13;
                v27 = 1024;
                v28 = v15;
                _os_log_impl(&dword_227C5D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Posting Cached event %{public}@ entity %d", buf, 0x1Cu);
              }

              -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", v13, v15, v16);
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        }
        while (v9);
      }

      v4 = v18;
    }

  }
}

- (void)terminateCompleteForDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke;
  block[3] = &unk_24F06CE00;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD block[5];
  id v38;
  id v39;
  uint8_t buf[4];
  _QWORD *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*((_QWORD *)a1[4] + 3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1[5], "entity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)*((_QWORD *)a1[4] + 3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1[5], "entity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v10 = a1[5];
      v11 = v9[3];
      v12 = a1[6];
      *(_DWORD *)buf = 138544130;
      v41 = v9;
      v42 = 2114;
      v43 = v10;
      v44 = 2114;
      v45 = v11;
      v46 = 2112;
      v47 = v12;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate complete for %{public}@ currentPending %{public}@ server %@", buf, 0x2Au);
    }

    if (objc_msgSend(a1[5], "entity") == 1)
    {
      objc_msgSend(v7, "captureSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_22;
      block[3] = &unk_24F06CE00;
      block[4] = a1[4];
      v38 = a1[6];
      v39 = v7;
      dispatch_async(v14, block);

    }
    if (objc_msgSend(a1[5], "entity") == 3)
    {
      objc_msgSend(v7, "captureSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "queue");
      v16 = objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_23;
      v34[3] = &unk_24F06CE00;
      v34[4] = a1[4];
      v35 = a1[6];
      v36 = v7;
      dispatch_async(v16, v34);

    }
    v17 = (void *)*((_QWORD *)a1[4] + 3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1[5], "entity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v18);

    if (!objc_msgSend(*((id *)a1[4] + 3), "count"))
    {
      CMContinuityCaptureLog(2);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = a1[4];
        *(_DWORD *)buf = 138543362;
        v41 = v20;
        _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Session termination complete", buf, 0xCu);
      }

      v21 = a1[6];
      if (v21)
      {
        objc_msgSend(v21, "queue");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = MEMORY[0x24BDAC760];
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_24;
        v32[3] = &unk_24F06ADE8;
        v32[4] = a1[4];
        v33 = a1[6];
        dispatch_async(v22, v32);

        objc_msgSend(a1[6], "localDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "queue");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v23;
        v27 = 3221225472;
        v28 = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_25;
        v29 = &unk_24F06ADE8;
        v30 = a1[4];
        v31 = a1[6];
        dispatch_async(v25, &v26);

        objc_msgSend(a1[6], "relayTerminationComplete", v26, v27, v28, v29, v30);
      }
      objc_msgSend(a1[4], "_invalidate");
      objc_msgSend(a1[4], "willChangeValueForKey:", CFSTR("state"));
      *((_QWORD *)a1[4] + 7) = 16;
      objc_msgSend(a1[4], "didChangeValueForKey:", CFSTR("state"));
    }

  }
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove video capture session kvo %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 97));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "captureSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("state"), 0);

    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 97));
  }
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_23(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove audio capture session kvo %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 98));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "captureSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("state"), 0);

    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 98));
  }
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove timesync kvo %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 100));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("timeSyncClock"), 0);
    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 100));
  }
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove active stream kvo %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 99));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "localDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("activeStreams"), 0);

    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 99));
  }
}

- (unint64_t)currentSessionID
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "currentSessionID");
  else
    v4 = 0;

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __91__CMContinuityCaptureRemoteCompositeDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_24F06AFA0;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21[1] = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __91__CMContinuityCaptureRemoteCompositeDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    WeakRetained = v3;
  }

}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureControlSystemPressure"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v34 = self;
        v35 = 2114;
        v36 = (unint64_t)v9;
        v37 = 2114;
        v38 = (uint64_t)v10;
        _os_log_debug_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEBUG, "%@ keypath:%{public}@ object:%{public}@", buf, 0x20u);
      }

    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("systemPressureState")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "level");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "value");
        v32 = v13;
        v18 = v9;
        v19 = v12;
        v20 = v15;
        v21 = v11;
        v22 = v10;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v16);

        v10 = v22;
        v11 = v21;
        v15 = v20;
        v12 = v19;
        v9 = v18;
        v13 = v32;

        if ((v24 & 1) != 0)
        {
LABEL_13:

          goto LABEL_21;
        }
        CMContinuityCaptureLog(2);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v34 = self;
          v35 = 2112;
          v36 = (unint64_t)v26;
          v37 = 2112;
          v38 = (uint64_t)v16;
          _os_log_impl(&dword_227C5D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ System Pressure state changed from %@ to %@.", buf, 0x20u);

        }
        objc_msgSend(v12, "setValue:", v16);
        objc_msgSend(v32, "localDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setValueForControl:completion:", v12, 0);
      }

      goto LABEL_13;
    }
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("activeStreams")) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("timeSyncClock")))
    {
      -[CMContinuityCaptureRemoteCompositeDevice updateStreamConnectStatus](self, "updateStreamConnectStatus");
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("batteryState")) & 1) != 0
           || (objc_msgSend(v9, "isEqualToString:", CFSTR("batteryLevel")) & 1) != 0
           || objc_msgSend(v9, "isEqualToString:", CFSTR("thermalLevel")))
    {
      -[CMContinuityCaptureRemoteCompositeDevice updateSystemState](self, "updateSystemState");
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("currentState")) & 1) == 0
           && objc_msgSend(v9, "isEqualToString:", CFSTR("state")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "integerValue");

      CMContinuityCaptureLog(2);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = -[CMContinuityCaptureRemoteCompositeDevice currentSessionID](self, "currentSessionID");
        *(_DWORD *)buf = 138543874;
        v34 = self;
        v35 = 2048;
        v36 = v30;
        v37 = 2048;
        v38 = v28;
        _os_log_impl(&dword_227C5D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] capture session state %ld", buf, 0x20u);
      }

      if (v28 == 3)
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1008, 0);
        -[CMContinuityCaptureRemoteCompositeDevice connectionInterrupted:forDevice:](self, "connectionInterrupted:forDevice:", v31, 0);

      }
    }
  }
LABEL_21:

}

- (void)connectionInterrupted:(id)a3 forDevice:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[3];
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6 && objc_msgSend(v5, "code"))
  {
    CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Interrupted, error %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time(), CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"), CFSTR("CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"), CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime"), &unk_24F07FA50, MEMORY[0x24BDBD1C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect"), 0, v10);

    objc_msgSend(v7, "localDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventConnectionDisconnect"), 0, 0);

  }
}

- (BOOL)setupCaptureDevices
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  BOOL v6;
  CMContinuityCaptureAVCaptureVideoSession *v7;
  void *v8;
  CMContinuityCaptureAVCaptureVideoSession *v9;
  CMContinuityCaptureAVCaptureAudioSession *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  __objc2_class **v21;
  CMContinuityCaptureAVCaptureAudioSession *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CMContinuityCaptureAVCaptureAudioSession *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v46;
  __int16 v47;
  NSObject *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[CMContinuityCaptureDeviceCapabilities capabilitiesForEntityType:](CMContinuityCaptureDeviceCapabilities, "capabilitiesForEntityType:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = objc_msgSend(v3, "clientDeviceModel") != 2;
    else
      v5 = 0;

    v7 = [CMContinuityCaptureAVCaptureVideoSession alloc];
    v8 = (void *)FigDispatchQueueCreateWithPriority();
    v9 = -[CMContinuityCaptureAVCaptureVideoSession initWithQueue:requiresMulticamSession:](v7, "initWithQueue:requiresMulticamSession:", v8, v5);

    -[CMContinuityCaptureAVCaptureVideoSession setVideoPreviewLayer:](v9, "setVideoPreviewLayer:", self->_videoPreviewLayer);
    -[CMContinuityCaptureAVCaptureBaseSession setTransport:](v9, "setTransport:", objc_msgSend(v3, "currentTransport"));
    -[CMContinuityCaptureAVCaptureBaseSession setClientDeviceModel:](v9, "setClientDeviceModel:", objc_msgSend(v3, "clientDeviceModel"));
    v10 = [CMContinuityCaptureAVCaptureAudioSession alloc];
    v11 = (void *)FigDispatchQueueCreateWithPriority();
    v39 = -[CMContinuityCaptureAVCaptureAudioSession initWithQueue:](v10, "initWithQueue:", v11);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v40 = v3;
    objc_msgSend(v3, "localDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "capabilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "devicesCapabilities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (objc_msgSend(v19, "entityType") != 2
            || (v20 = objc_msgSend(v40, "clientDeviceModel"),
                v21 = off_24F06A460,
                v22 = (CMContinuityCaptureAVCaptureAudioSession *)v9,
                v20 == 2))
          {
            v23 = objc_msgSend(v19, "entityType");
            v21 = off_24F06A468;
            v22 = (CMContinuityCaptureAVCaptureAudioSession *)v9;
            if (v23 != 1)
            {
              v24 = objc_msgSend(v19, "entityType");
              v21 = off_24F06A450;
              v22 = v39;
              if (v24 != 3)
                goto LABEL_19;
            }
          }
          v25 = objc_msgSend(objc_alloc(*v21), "initWithCapabilities:compositeDelegate:captureSession:", v19, self, v22);
          if (v25)
          {
            v26 = v25;
            CMContinuityCaptureLog(2);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v46 = self;
              v47 = 2114;
              v48 = v26;
              _os_log_impl(&dword_227C5D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Created %{public}@", buf, 0x16u);
            }

            captureDeviceByEntityType = self->_captureDeviceByEntityType;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v19, "entityType"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](captureDeviceByEntityType, "setObject:forKeyedSubscript:", v26, v29);

          }
          else
          {
LABEL_19:
            CMContinuityCaptureLog(2);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v30 = objc_msgSend(v19, "entityType");
              *(_DWORD *)buf = 138543618;
              v46 = self;
              v47 = 1024;
              LODWORD(v48) = v30;
              _os_log_impl(&dword_227C5D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to create capture device for entity %d", buf, 0x12u);
            }
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v16);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA68);
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA68);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setCompanionDevice:", v34);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA68);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setCompanionDevice:", v36);

      }
    }
    v6 = -[NSMutableDictionary count](self->_captureDeviceByEntityType, "count") != 0;

    v3 = v40;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ContinuityCaptureDeviceServer)server
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = WeakRetained;

  return (ContinuityCaptureDeviceServer *)v3;
}

- (NSArray)controls
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_cmControlByName, "allValues");
}

- (NSArray)continuityCaptureDevices
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues");
}

- (CMContinuityCaptureEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  CMContinuityCaptureRemoteCompositeDevice *v9;

  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke;
    v7[3] = &unk_24F06ADE8;
    v8 = v4;
    v9 = self;
    dispatch_async(queue, v7);

  }
}

void __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  int8x16_t v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  _QWORD block[4];
  int8x16_t v13;

  objc_msgSend(*(id *)(a1 + 32), "localDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke_2;
  block[3] = &unk_24F06ADE8;
  v8 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v8.i64[0];
  v13 = vextq_s8(v8, v8, 8uLL);
  dispatch_async(v3, block);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke_39;
  v10[3] = &unk_24F06ADE8;
  v9 = *(int8x16_t *)(a1 + 32);
  v7 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  dispatch_async(v6, v10);

  objc_msgSend(*(id *)(a1 + 32), "relayTerminationComplete");
  objc_msgSend(*(id *)(a1 + 40), "_invalidate");

}

void __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove active stream kvo %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 99));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "localDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("activeStreams"), 0);

    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 99));
  }
}

void __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove timesync kvo %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 100));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("timeSyncClock"), 0);
    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 100));
  }
}

- (void)_invalidate
{
  NSObject *v3;
  unsigned __int8 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  OS_os_transaction *transaction;
  void *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  _QWORD block[5];
  uint8_t v45[128];
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v47 = self;
    v48 = 2082;
    v49 = "-[CMContinuityCaptureRemoteCompositeDevice _invalidate]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = atomic_load((unsigned __int8 *)&self->_sessionInvalidated);
  if ((v4 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_sessionInvalidated);
    +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v6);

    +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke;
    block[3] = &unk_24F06AEB0;
    block[4] = self;
    dispatch_async_and_wait(v8, block);

    +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v11);

    +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v43[0] = v9;
    v43[1] = 3221225472;
    v43[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_2;
    v43[3] = &unk_24F06AEB0;
    v43[4] = self;
    dispatch_async_and_wait(v13, v43);

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    v17 = (const __CFString *)*MEMORY[0x24BE103E0];
    v18 = (const __CFString *)*MEMORY[0x24BE103D8];
    if (v16)
    {
      *(_DWORD *)buf = 138544130;
      v47 = self;
      v48 = 2112;
      v49 = (const char *)v18;
      v50 = 2112;
      v51 = v17;
      v52 = 2112;
      v53 = v14;
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting preference (%@) '%@' to %@", buf, 0x2Au);
    }

    v33 = v14;
    CFPreferencesSetValue(v17, v14, v18, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v24, "queue");
          v25 = objc_claimAutoreleasedReturnValue();
          v38[0] = v9;
          v38[1] = 3221225472;
          v38[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_41;
          v38[3] = &unk_24F06ADE8;
          v38[4] = self;
          v38[5] = v24;
          dispatch_async(v25, v38);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v21);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07FA38);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v26, "captureSession");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "queue");
      v29 = objc_claimAutoreleasedReturnValue();
      v36[0] = v9;
      v36[1] = 3221225472;
      v36[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_42;
      v36[3] = &unk_24F06ADE8;
      v36[4] = self;
      v37 = v26;
      dispatch_async(v29, v36);

    }
    if (v27)
    {
      objc_msgSend(v27, "captureSession");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "queue");
      v31 = objc_claimAutoreleasedReturnValue();
      v34[0] = v9;
      v34[1] = 3221225472;
      v34[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_43;
      v34[3] = &unk_24F06ADE8;
      v34[4] = self;
      v35 = v27;
      dispatch_async(v31, v34);

    }
    transaction = self->_transaction;
    self->_transaction = 0;

  }
}

void __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("batteryState"), 0);

  +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("batteryLevel"), 0);

}

void __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_2(uint64_t a1)
{
  id v2;

  +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("thermalLevel"), 0);

}

uint64_t __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidate %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "stopCameraCaptureStack:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_42(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove video capture session kvo %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 97));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "captureSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("state"), 0);

    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 97));
  }
}

void __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove audio capture session kvo %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 98));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "captureSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("state"), 0);

    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 98));
  }
}

- (void)setupControls
{
  CMContinuityCaptureControl *v3;
  uint64_t v4;
  CMContinuityCaptureControl *v5;
  CMContinuityCaptureControl *v6;
  CMContinuityCaptureControl *v7;
  CMContinuityCaptureControl *v8;
  void *v9;
  void *v10;
  CMContinuityCaptureControl *v11;
  CMContinuityCaptureControl *v12;
  void *v13;
  void *v14;
  void *v15;
  CMContinuityCaptureControl *v16;
  CMContinuityCaptureControl *v17;
  CMContinuityCaptureControl *v18;
  CMContinuityCaptureControl *v19;
  CMContinuityCaptureControl *v20;
  CMContinuityCaptureControl *v21;
  CMContinuityCaptureControl *v22;
  __int128 v23;
  uint64_t v24;

  v3 = [CMContinuityCaptureControl alloc];
  v4 = *MEMORY[0x24BDB1B78];
  v23 = xmmword_227CED748;
  v24 = 0;
  v5 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v3, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlSystemPressure"), 0, 4, &v23, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v5, CFSTR("kCMContinuityCaptureControlSystemPressure"));
  v6 = [CMContinuityCaptureControl alloc];
  v23 = xmmword_227CED748;
  v24 = 0;
  v7 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v6, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlIncomingCall"), 0, 4, &v23, 0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v7, CFSTR("kCMContinuityCaptureControlIncomingCall"));
  v8 = [CMContinuityCaptureControl alloc];
  +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "batteryLevel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = xmmword_227CED748;
  v24 = 0;
  v11 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v8, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlBatteryLevel"), 0, 4, &v23, v10);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v11, CFSTR("kCMContinuityCaptureControlBatteryLevel"));
  v12 = [CMContinuityCaptureControl alloc];
  v13 = (void *)MEMORY[0x24BDD16E0];
  +[CMContinuityCaptureBatteryStateMonitor sharedInstance](CMContinuityCaptureBatteryStateMonitor, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "batteryState"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = xmmword_227CED748;
  v24 = 0;
  v16 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v12, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlBatteryState"), 0, 4, &v23, v15);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v16, CFSTR("kCMContinuityCaptureControlBatteryState"));
  v17 = [CMContinuityCaptureControl alloc];
  v23 = xmmword_227CED748;
  v24 = 0;
  v18 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v17, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlIncomingCallComplete"), 0, 4, &v23, 0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v18, CFSTR("kCMContinuityCaptureControlIncomingCallComplete"));
  if (-[CMContinuityCaptureRemoteCompositeDevice _avcaptureDeviceSupportsDockKit](self, "_avcaptureDeviceSupportsDockKit"))
  {
    v19 = [CMContinuityCaptureControl alloc];
    v23 = xmmword_227CED748;
    v24 = 0;
    v20 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v19, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlDockedTrackingActive"), 0, 4, &v23, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v20, CFSTR("kCMContinuityCaptureControlDockedTrackingActive"));

  }
  v21 = [CMContinuityCaptureControl alloc];
  v23 = xmmword_227CED748;
  v24 = 0;
  v22 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v21, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlDebugInfo"), 0, 4, &v23, &stru_24F06D368);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v22, CFSTR("kCMContinuityCaptureControlDebugInfo"));

}

- (id)debugInfo
{
  return 0;
}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2080;
    v17 = "-[CMContinuityCaptureRemoteCompositeDevice handleAVCNegotiation:data:]";
    v18 = 1024;
    v19 = a3;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@  %s %d", buf, 0x1Cu);
  }

  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke;
  v10[3] = &unk_24F06B750;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v11 = v6;
  v9 = v6;
  dispatch_async(queue, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "handleAVCNegotiation:data:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    }
    else
    {
      CMContinuityCaptureLog(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke_cold_1(v2, v8);

    }
  }

}

- (void)handleSynchronizeAudioClockCompletion
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__CMContinuityCaptureRemoteCompositeDevice_handleSynchronizeAudioClockCompletion__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __81__CMContinuityCaptureRemoteCompositeDevice_handleSynchronizeAudioClockCompletion__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", &unk_24F07FA38);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "handleSynchronizeAudioClockCompletion");
    }
    else
    {
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke_cold_1(v1, v6);

    }
  }

}

- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__CMContinuityCaptureRemoteCompositeDevice_captureStillImage_entity_completion___block_invoke;
  block[3] = &unk_24F06CE28;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureRemoteCompositeDevice_captureStillImage_entity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "captureStillImage:entity:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1001, 0);
      CMContinuityCaptureLog(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 138543874;
        v10 = v3;
        v11 = 2112;
        v12 = v6;
        v13 = 2112;
        v14 = v7;
        _os_log_error_impl(&dword_227C5D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Invalid capture device %@ error %@", (uint8_t *)&v9, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, v10, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, 0, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v11;
}

- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__CMContinuityCaptureRemoteCompositeDevice_enqueueReactionEffect_entity___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a4;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __73__CMContinuityCaptureRemoteCompositeDevice_enqueueReactionEffect_entity___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", &unk_24F07FA20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "enqueueReactionEffect:entity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1001, 0);
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 138543874;
        v8 = v3;
        v9 = 2112;
        v10 = v4;
        v11 = 2112;
        v12 = v5;
        _os_log_error_impl(&dword_227C5D000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Invalid capture device %@ error %@", (uint8_t *)&v7, 0x20u);
      }

    }
  }

}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CMContinuityCaptureRemoteCompositeDevice *v15;
  id v16;
  id v17[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__CMContinuityCaptureRemoteCompositeDevice_postEvent_entity_data___block_invoke;
  v13[3] = &unk_24F06AFA0;
  objc_copyWeak(v17, &location);
  v14 = v8;
  v15 = self;
  v17[1] = (id)a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __66__CMContinuityCaptureRemoteCompositeDevice_postEvent_entity_data___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_34:

      goto LABEL_35;
    }
    CMContinuityCaptureRemoteEventToBeRelayedList();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*((id *)v4 + 10), "count")
      && objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      CMContinuityCaptureLog(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)*((_QWORD *)v4 + 10);
        v10 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v31 = v9;
        v32 = 2112;
        v33 = v8;
        v34 = 2114;
        v35 = v10;
        _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Wait for sideband identifiers %@, cache event %{public}@", buf, 0x20u);
      }

      v11 = (void *)*((_QWORD *)v4 + 11);
      v29[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = *(_QWORD *)(a1 + 48);
      if (!v14)
        v14 = MEMORY[0x24BDBD1B8];
      v29[1] = v12;
      v29[2] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);
      goto LABEL_31;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventUserPause")))
    {
      CMContinuityCaptureLog(2);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543362;
        v31 = v17;
        _os_log_impl(&dword_227C5D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ UserPause", buf, 0xCu);

      }
      objc_msgSend(v4, "willChangeValueForKey:", CFSTR("state"));
      v18 = *((_QWORD *)v4 + 7) | 1;
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventUserResume")))
      {
LABEL_19:
        if (*(_QWORD *)(a1 + 64) == 4
          && (objc_msgSend(*((id *)v4 + 4), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v21,
              v21))
        {
          if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureControlIncomingCall")) & 1) == 0
            && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureControlIncomingCallComplete")))
          {
            goto LABEL_33;
          }
          objc_msgSend(*((id *)v4 + 4), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v22;
          if (!v22)
            goto LABEL_32;
          objc_msgSend(v22, "setValue:", *(_QWORD *)(a1 + 48));
          CMContinuityCaptureLog(2);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v31 = v24;
            v32 = 2114;
            v33 = v13;
            _os_log_impl(&dword_227C5D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ SetValue %{public}@", buf, 0x16u);
          }

          objc_msgSend(v5, "localDevice");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setValueForControl:completion:", v13, 0);
        }
        else
        {
          if (!*(_QWORD *)(a1 + 32))
          {
LABEL_33:

            goto LABEL_34;
          }
          objc_msgSend(v4, "eventQueue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
          v25 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v25;
          v26 = *(_QWORD *)(a1 + 48);
          if (!v26)
            v26 = MEMORY[0x24BDBD1B8];
          v28[1] = v25;
          v28[2] = v26;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "enqueueEventAction:args:", 3, v27);

        }
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      CMContinuityCaptureLog(2);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543362;
        v31 = v20;
        _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ UserResume", buf, 0xCu);

      }
      objc_msgSend(v4, "willChangeValueForKey:", CFSTR("state"));
      v18 = *((_QWORD *)v4 + 7) & 0xFFFFFFFFFFFFFFFELL;
    }
    *((_QWORD *)v4 + 7) = v18;
    objc_msgSend(v4, "didChangeValueForKey:", CFSTR("state"));
    goto LABEL_19;
  }
LABEL_35:

}

- (void)postEventOnAllEntities:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "postEvent:entity:data:", v6, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "entity"), v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)postEventAction:(unint64_t)a3 args:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  char v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v51 = self;
      v52 = 2048;
      v53 = a3;
      v54 = 2112;
      v55 = v6;
      _os_log_debug_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEBUG, "%@ Perform %lu %@", buf, 0x20u);
    }

  }
  switch(a3)
  {
    case 3uLL:
      if ((unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v21 = objc_opt_isKindOfClass();

          if ((v21 & 1) != 0)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = objc_alloc(MEMORY[0x24BDBCED8]);
              objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = (id)objc_msgSend(v23, "initWithDictionary:", v24);

            }
            else
            {
              v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            }

            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_2;
            v40[3] = &unk_24F06AFC8;
            objc_copyWeak(&v41, &location);
            v35 = (void *)MEMORY[0x22E2A7CB0](v40);
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v35, CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));

            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[CMContinuityCaptureRemoteCompositeDevice _postEvent:entity:data:](self, "_postEvent:entity:data:", v36, objc_msgSend(v37, "unsignedIntValue"), v12);

            objc_destroyWeak(&v41);
            goto LABEL_23;
          }
        }
      }
      goto LABEL_26;
    case 2uLL:
      if (objc_msgSend(v6, "count") == 3)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v26 = objc_opt_isKindOfClass();

        if ((v26 & 1) != 0)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v28 = objc_opt_isKindOfClass();

          if ((v28 & 1) != 0)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "unsignedIntValue");

            objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "unsignedIntValue");

            objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = MEMORY[0x24BDAC760];
            v42[1] = 3221225472;
            v42[2] = __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_51;
            v42[3] = &unk_24F06B040;
            objc_copyWeak(&v44, &location);
            v34 = v30;
            v12 = v33;
            v43 = v12;
            -[CMContinuityCaptureRemoteCompositeDevice _stopStream:option:completion:](self, "_stopStream:option:completion:", v34, v32, v42);

            objc_destroyWeak(&v44);
            goto LABEL_23;
          }
        }
      }
LABEL_26:
      v38 = 0;
      goto LABEL_25;
    case 1uLL:
      if (objc_msgSend(v6, "count") == 3)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v9 = objc_opt_isKindOfClass();

        if ((v9 & 1) != 0)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v11 = objc_opt_isKindOfClass();

          if ((v11 & 1) != 0)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "unsignedIntValue");

            objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v45[0] = MEMORY[0x24BDAC760];
            v45[1] = 3221225472;
            v45[2] = __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke;
            v45[3] = &unk_24F06B3C8;
            objc_copyWeak(&v48, &location);
            v16 = v14;
            v46 = v6;
            v17 = v15;
            v47 = v17;
            -[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:](self, "_startStream:option:completion:", v12, v16, v45);

            objc_destroyWeak(&v48);
LABEL_23:

            break;
          }
        }
      }
      goto LABEL_26;
  }
  v38 = 1;
LABEL_25:
  objc_destroyWeak(&location);

  return v38;
}

void __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_cold_1(v4, a1, v6);

    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    objc_msgSend(WeakRetained, "eventQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notifyCompletion");

  }
}

void __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_51(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = WeakRetained;
    if (v5)
    {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
      WeakRetained = v7;
    }
    objc_msgSend(WeakRetained, "eventQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notifyCompletion");

    WeakRetained = v7;
  }

}

void __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "eventQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notifyCompletion");

    WeakRetained = v3;
  }

}

- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CMContinuityCaptureRemoteCompositeDevice server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (a4 == 4)
    {
      objc_msgSend(v9, "localDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postEvent:entity:data:", v18, 4, v8);

    }
    else if (a4)
    {
      captureDeviceByEntityType = self->_captureDeviceByEntityType;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](captureDeviceByEntityType, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = self->_captureDeviceByEntityType;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "postEvent:entity:data:", v18, a4, v8);

      }
    }
    else
    {
      -[CMContinuityCaptureRemoteCompositeDevice postEventOnAllEntities:data:](self, "postEventOnAllEntities:data:", v18, v8);
    }
  }

}

- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke;
  block[3] = &unk_24F06B068;
  objc_copyWeak(v16, &location);
  v14 = v8;
  v15 = v9;
  v16[1] = (id)a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "entity") == 3)
    {
      v4 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_2;
      v18[3] = &unk_24F06C608;
      v19 = *(id *)(a1 + 40);
      v5 = (void *)MEMORY[0x22E2A7CB0](v18);
      +[CMContinuityCapturePongSoundManager sharedInstance](CMContinuityCapturePongSoundManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v4;
      v14[1] = 3221225472;
      v14[2] = __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_3;
      v14[3] = &unk_24F06B068;
      objc_copyWeak(v17, v2);
      v7 = *(id *)(a1 + 32);
      v8 = *(void **)(a1 + 56);
      v15 = v7;
      v17[1] = v8;
      v9 = v5;
      v16 = v9;
      objc_msgSend(v6, "waitForPongCompletion:", v14);

      objc_destroyWeak(v17);
      v10 = v19;
    }
    else
    {
      objc_msgSend(WeakRetained, "eventQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v11;
      v12 = MEMORY[0x22E2A7CB0](v21, *(_QWORD *)(a1 + 40));
      v21[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "enqueueEventAction:args:", 1, v13);

    }
  }

}

uint64_t __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_2(uint64_t a1)
{
  void *v2;

  +[CMContinuityCapturePongSoundManager sharedInstance](CMContinuityCapturePongSoundManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseSystemPongAssertion");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_4;
    v7[3] = &unk_24F06C708;
    v7[4] = v3;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = v5;
    v10 = v6;
    v9 = *(id *)(a1 + 40);
    dispatch_async(v4, v7);

  }
}

void __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  +[CMContinuityCapturePongSoundManager sharedInstance](CMContinuityCapturePongSoundManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acquireSystemPongAssertion");

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  v5 = (void *)MEMORY[0x22E2A7CB0](*(_QWORD *)(a1 + 48));
  v7[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueEventAction:args:", 1, v6);

}

- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSMutableSet *activeVideoEntities;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v26 = self;
    v27 = 2080;
    v28 = "-[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:]";
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "entity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](captureDeviceByEntityType, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (self->_state != 1)
    {
      if (objc_msgSend(v8, "entity") == 1 || objc_msgSend(v8, "entity") == 2)
      {
        activeVideoEntities = self->_activeVideoEntities;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "entity"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](activeVideoEntities, "addObject:", v17);

      }
      -[CMContinuityCaptureRemoteCompositeDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
      v18 = objc_msgSend(v8, "entity");
      v19 = 4;
      if (v18 == 3)
        v19 = 2;
      self->_state |= v19;
      -[CMContinuityCaptureRemoteCompositeDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
      v20 = objc_msgSend(v13, "entity");
      v24[0] = v8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4, CFSTR("CMContinuityCaptureStateMachineEventDataKeyConfiguration"), CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v15;
      v23[2] = CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock");
      v21 = (void *)MEMORY[0x22E2A7CB0](v9);
      v24[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStartStream"), v20, v22);

      goto LABEL_17;
    }
    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:].cold.2();
  }
  else
  {
    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:].cold.1();
  }

  if (v9)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -12785, 0);
    v9[2](v9, v15);
LABEL_17:

  }
}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[3];
  _BYTE buf[12];
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  CMContinuityCaptureLog(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    v16 = 2080;
    v17 = "-[CMContinuityCaptureRemoteCompositeDevice stopStream:option:completion:]";
    v18 = 1024;
    v19 = a3;
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %d", buf, 0x1Cu);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__CMContinuityCaptureRemoteCompositeDevice_stopStream_option_completion___block_invoke;
  v12[3] = &unk_24F06B158;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = (id)a3;
  v14[2] = (id)a4;
  v13 = v8;
  v11 = v8;
  dispatch_async(queue, v12);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __73__CMContinuityCaptureRemoteCompositeDevice_stopStream_option_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 48) == 3)
    {
      +[CMContinuityCapturePongSoundManager sharedInstance](CMContinuityCapturePongSoundManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __73__CMContinuityCaptureRemoteCompositeDevice_stopStream_option_completion___block_invoke_2;
      v11[3] = &unk_24F06B158;
      objc_copyWeak(&v13, v2);
      v14 = *(_OWORD *)(a1 + 48);
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v5, "waitForPongCompletion:", v11);

      objc_destroyWeak(&v13);
    }
    else
    {
      objc_msgSend(WeakRetained, "eventQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v9 = MEMORY[0x22E2A7CB0](v16, *(_QWORD *)(a1 + 32));
      v16[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enqueueEventAction:args:", 2, v10);

    }
  }

}

void __73__CMContinuityCaptureRemoteCompositeDevice_stopStream_option_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "eventQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v6;
    v7 = (void *)MEMORY[0x22E2A7CB0](*(_QWORD *)(a1 + 32));
    v9[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueEventAction:args:", 2, v8);

  }
}

- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  NSMutableDictionary *captureDeviceByEntityType;
  void *v10;
  void *v11;
  NSMutableSet *activeVideoEntities;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](captureDeviceByEntityType, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((unint64_t)(a3 - 1) <= 1)
    {
      activeVideoEntities = self->_activeVideoEntities;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](activeVideoEntities, "removeObject:", v13);

    }
    if ((a4 & 1) != 0)
      goto LABEL_15;
    -[CMContinuityCaptureRemoteCompositeDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
    if (a3 == 3)
    {
      v14 = -3;
    }
    else
    {
      if (-[NSMutableSet count](self->_activeVideoEntities, "count"))
      {
LABEL_14:
        -[CMContinuityCaptureRemoteCompositeDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
LABEL_15:
        v17 = objc_msgSend(v11, "entity");
        v20[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v16;
        v20[1] = CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock");
        v18 = (void *)MEMORY[0x22E2A7CB0](v8);
        v21[1] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStopStream"), v17, v19);

        goto LABEL_16;
      }
      v14 = -5;
    }
    self->_state &= v14;
    goto LABEL_14;
  }
  CMContinuityCaptureLog(2);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:].cold.1();

  if (v8)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -12785, 0);
    v8[2](v8, v16);
LABEL_16:

  }
}

- (void)updateSystemState
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2080;
  v4 = "-[CMContinuityCaptureRemoteCompositeDevice updateSystemState]";
  OUTLINED_FUNCTION_3(&dword_227C5D000, v0, v1, "%{public}@ %s", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  CMContinuityCaptureRemoteCompositeDevice *v14;
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureRemoteCompositeDevice *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v19 = self;
    v20 = 2080;
    v21 = "-[CMContinuityCaptureRemoteCompositeDevice setValueForControl:completion:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CMContinuityCaptureRemoteCompositeDevice_setValueForControl_completion___block_invoke;
  block[3] = &unk_24F06C000;
  objc_copyWeak(&v16, &location);
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureRemoteCompositeDevice_setValueForControl_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "entity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "entity") == 4)
    {
      CMContinuityCaptureLog(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 40);
        v16 = 138412546;
        v17 = v9;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_INFO, "%@ system notification for %@", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("kCMContinuityCaptureControlDockedTrackingActive"));

      if (v12)
      {
        v13 = objc_loadWeakRetained(v4 + 5);
        objc_msgSend(v13, "localDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setValueForControl:completion:", *(_QWORD *)(a1 + 32), 0);

      }
    }
    else if (v7)
    {
      objc_msgSend(v7, "setValueForControl:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
    else
    {
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke_cold_1(v2, v15);

    }
  }

}

- (BOOL)_avcaptureDeviceSupportsDockKit
{
  if (GestaltGetDeviceClass() == 1)
    return MGGetBoolAnswer();
  else
    return 0;
}

- (id)controlWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CMContinuityCaptureRemoteCompositeDevice controls](self, "controls", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_activeVideoEntities, 0);
  objc_storeStrong((id *)&self->_frameRateManager, 0);
  objc_storeStrong((id *)&self->_pendingEventToBePostedQueue, 0);
  objc_storeStrong((id *)&self->_pendingSidebandStreamIdentifiers, 0);
  objc_storeStrong((id *)&self->_remoteClientDisconnectNotifiedByEntityType, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_cmControlByName, 0);
  objc_storeStrong((id *)&self->_captureDeviceByEntityType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_videoPreviewLayer, 0);
}

void __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke_cold_1(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_227C5D000, a2, v4, "%{public}@ Invalid capture device", v5);

  OUTLINED_FUNCTION_8();
}

void __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v4 = OUTLINED_FUNCTION_11(a1);
  OUTLINED_FUNCTION_2_0();
  v8 = 2112;
  v9 = v5;
  OUTLINED_FUNCTION_3(&dword_227C5D000, a3, v6, "%{public}@ completion for %@", v7);

}

- (void)_startStream:option:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_227C5D000, v0, v1, "%{public}@ Invalid capture device", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_startStream:option:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_227C5D000, v0, v1, "%{public}@ In pause state, skip action", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
