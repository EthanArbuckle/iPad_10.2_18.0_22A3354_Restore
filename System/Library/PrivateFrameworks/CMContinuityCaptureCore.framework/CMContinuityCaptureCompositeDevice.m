@implementation CMContinuityCaptureCompositeDevice

- (CMContinuityCaptureCompositeDevice)initWithDevice:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CMContinuityCaptureCompositeDevice *v12;
  CMContinuityCaptureNWClient *v13;
  CMContinuityCaptureNWClient *v14;
  NSObject *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *captureDeviceByEntityType;
  NSMutableDictionary *v18;
  NSMutableDictionary *cmControlByName;
  CMContinuityCaptureEventQueue *v20;
  CMContinuityCaptureEventQueue *eventQueue;
  NSMutableArray *v22;
  NSMutableArray *connectionSwitchLogs;
  NSMutableArray *v24;
  NSMutableArray *remoteSessionLogs;
  uint64_t v26;
  NSString *publishTime;
  NSMutableSet *v28;
  NSMutableSet *streamingIntentEntities;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id *v35;
  CMContinuityCaptureCompositeDevice *v36;
  NSObject *v38;
  _QWORD block[4];
  id v40;
  id *v41;
  objc_super v42;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v44;
  __int16 v45;
  CMContinuityCaptureNWClient *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.CMContinuityCompositeDevice.%@"), v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v11 = (void *)FigDispatchQueueCreateWithPriority();

  v42.receiver = self;
  v42.super_class = (Class)CMContinuityCaptureCompositeDevice;
  v12 = -[CMContinuityCaptureCompositeDevice init](&v42, sel_init);
  if (v12
    && (v13 = -[CMContinuityCaptureNWClient initWithDevice:queue:taskDelegate:]([CMContinuityCaptureNWClient alloc], "initWithDevice:queue:taskDelegate:", v6, v11, v12)) != 0)
  {
    v14 = v13;
    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v44 = v12;
      v45 = 2114;
      v46 = v14;
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ create with client %{public}@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v12->_provider, v7);
    objc_storeStrong((id *)&v12->_client, v14);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    captureDeviceByEntityType = v12->_captureDeviceByEntityType;
    v12->_captureDeviceByEntityType = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cmControlByName = v12->_cmControlByName;
    v12->_cmControlByName = v18;

    objc_storeStrong((id *)&v12->_queue, v11);
    v20 = -[CMContinuityCaptureEventQueue initWithActionDelegate:queue:]([CMContinuityCaptureEventQueue alloc], "initWithActionDelegate:queue:", v12, v12->_queue);
    eventQueue = v12->_eventQueue;
    v12->_eventQueue = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    connectionSwitchLogs = v12->_connectionSwitchLogs;
    v12->_connectionSwitchLogs = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    remoteSessionLogs = v12->_remoteSessionLogs;
    v12->_remoteSessionLogs = v24;

    CMContinuityCaptureGetCurrentTimeString();
    v26 = objc_claimAutoreleasedReturnValue();
    publishTime = v12->_publishTime;
    v12->_publishTime = (NSString *)v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    streamingIntentEntities = v12->_streamingIntentEntities;
    v12->_streamingIntentEntities = v28;

    -[CMContinuityCaptureCompositeDevice setupControls](v12, "setupControls");
    if (-[CMContinuityCaptureCompositeDevice setupCaptureDevices](v12, "setupCaptureDevices"))
    {
      +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "queue");
      v31 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_not_V2(v31);

      +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "queue");
      v33 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__CMContinuityCaptureCompositeDevice_initWithDevice_provider___block_invoke;
      block[3] = &unk_24F06ADE8;
      v34 = v6;
      v40 = v34;
      v35 = v12;
      v41 = v35;
      dispatch_async_and_wait(v33, block);

      objc_storeWeak(v35 + 11, v34);
      objc_msgSend(v35, "setupSidebandMessageNotificationHandler");
      v36 = v35;
    }
    else
    {
      CMContinuityCaptureLog(2);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v12;
        _os_log_impl(&dword_227C5D000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to setup capture devices", buf, 0xCu);
      }

      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

uint64_t __62__CMContinuityCaptureCompositeDevice_initWithDevice_provider___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("deviceStatus"), 3, 0);
  objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("placementStepSkipped"), 3, 0);
  return objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("terminationDeferred"), 3, 0);
}

- (void)setupSidebandMessageNotificationHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke;
  v7[3] = &unk_24F06AE38;
  objc_copyWeak(&v8, &location);
  -[ContinuityCaptureDeviceClient device](self->_client, "device", v7[0], 3221225472, __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke, &unk_24F06AE38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSidebandMessageNotificationHandler:forDeviceIdentifier:", v7, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  NSObject **v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[1];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke_2;
    v11[3] = &unk_24F06AE10;
    objc_copyWeak(&v15, v7);
    v12 = v6;
    v13 = v5;
    v14 = v9;
    dispatch_async(v10, v11);

    objc_destroyWeak(&v15);
  }

}

void __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _UNKNOWN **v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  _UNKNOWN **v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  id *v53;
  id *location;
  uint64_t v55;
  uint64_t v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  location = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_45;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerValue") == 7
    && (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientTransportSessionIDKey")), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientTransportSessionIDKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientTransportSessionIDKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedLongValue");

      CMContinuityCaptureLog(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_loadWeakRetained(location);
        v12 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v70 = v11;
        v71 = 2114;
        v72 = v12;
        v73 = 2048;
        v74 = v9;
        v13 = "%@ Received remote termination complete for %{public}@ transportSessionID : %llx";
LABEL_15:
        _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, v13, buf, 0x20u);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "integerValue") != 3)
    goto LABEL_18;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ContinuityCaptureRapportClientEventNameKey"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_18;
  v16 = (void *)v15;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientEventNameKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("kCMContinuityCaptureEventUserDisconnect"))
    || (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientTransportSessionIDKey")), (v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_18:
    goto LABEL_19;
  }
  v19 = (void *)v18;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientTransportSessionIDKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();

  if ((v21 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientTransportSessionIDKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v22, "unsignedLongValue");

    CMContinuityCaptureLog(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_loadWeakRetained(location);
      v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v70 = v11;
      v71 = 2114;
      v72 = v23;
      v73 = 2048;
      v74 = v9;
      v13 = "%@ Received user disconnect for %{public}@ transportSessionID : %llx";
      goto LABEL_15;
    }
LABEL_16:

    objc_msgSend(WeakRetained[8], "remoteSessionTerminationForIdentfier:", v9);
    goto LABEL_45;
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "integerValue") != 9
    || (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSystemControlsKey")), (v25 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_45;
  }
  v26 = (void *)v25;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSystemControlsKey"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v28 = objc_opt_isKindOfClass();

  if ((v28 & 1) != 0)
  {
    v53 = WeakRetained;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v55 = a1;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientSystemControlsKey"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (!v29)
      goto LABEL_43;
    v30 = v29;
    v31 = *(_QWORD *)v64;
    v32 = 0x24BDD1000uLL;
    v33 = &off_24F06A000;
    while (1)
    {
      v34 = 0;
      v56 = v30;
      do
      {
        if (*(_QWORD *)v64 != v31)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v34);
        v36 = *(void **)(v32 + 1568);
        v37 = objc_opt_class();
        v62 = 0;
        objc_msgSend(v36, "unarchivedObjectOfClass:fromData:error:", v37, v35, &v62);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v62;
        if (v38)
        {
          CMContinuityCaptureLog(0);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = objc_loadWeakRetained(location);
            *(_DWORD *)buf = 138412546;
            v70 = v41;
            v71 = 2114;
            v72 = v38;
            _os_log_impl(&dword_227C5D000, v40, OS_LOG_TYPE_DEFAULT, "%@ Recieved control %{public}@ update", buf, 0x16u);

          }
          objc_msgSend(v38, "name");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v42, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryLevel")))
          {

          }
          else
          {
            objc_msgSend(v38, "name");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryState"));

            if (!v44)
              goto LABEL_41;
          }
          v45 = v31;
          v46 = v33;
          v47 = v32;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          objc_msgSend(*(id *)(*(_QWORD *)(v55 + 48) + 16), "allValues");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v50; ++i)
              {
                if (*(_QWORD *)v59 != v51)
                  objc_enumerationMutation(v48);
                objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "setValueForControl:completion:", v38, 0);
              }
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
            }
            while (v50);
          }

          v32 = v47;
          v33 = v46;
          v31 = v45;
          v30 = v56;
        }
LABEL_41:

        ++v34;
      }
      while (v34 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (!v30)
      {
LABEL_43:

        WeakRetained = v53;
        break;
      }
    }
  }
LABEL_45:

}

- (void)relayUserDisconnect
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
  v4[2] = __57__CMContinuityCaptureCompositeDevice_relayUserDisconnect__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__CMContinuityCaptureCompositeDevice_relayUserDisconnect__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_loadWeakRetained(v1);
      *(_DWORD *)buf = 138543618;
      v17 = v4;
      v18 = 2082;
      v19 = "-[CMContinuityCaptureCompositeDevice relayUserDisconnect]_block_invoke";
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s", buf, 0x16u);

    }
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shieldSessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activeSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shieldSessionID");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained[8], "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "relayUserDisconnectForTransport:reason:shieldSessionID:", objc_msgSend(WeakRetained, "currentPreferredAvailableTransport"), CFSTR("User disconnect"), v10);

      +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__CMContinuityCaptureCompositeDevice_relayUserDisconnect__block_invoke_16;
      block[3] = &unk_24F06AE60;
      objc_copyWeak(&v15, v1);
      dispatch_async(v13, block);

      objc_destroyWeak(&v15);
    }
    else
    {
      v10 = CFSTR("Unknown");
    }

  }
}

void __57__CMContinuityCaptureCompositeDevice_relayUserDisconnect__block_invoke_16(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[8], "device");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setUserDisconnected:", 1);

    WeakRetained = v3;
  }

}

- (void)relayEvent:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _BYTE location[12];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((os_variant_allows_internal_security_policies() & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStateMismatched")) & 1) != 0)
  {
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__CMContinuityCaptureCompositeDevice_relayEvent___block_invoke;
    v7[3] = &unk_24F06AE88;
    objc_copyWeak(&v9, (id *)location);
    v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = self;
      v11 = 2080;
      v12 = "-[CMContinuityCaptureCompositeDevice relayEvent:]";
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s not allowed for %{public}@", location, 0x20u);
    }

  }
}

void __49__CMContinuityCaptureCompositeDevice_relayEvent___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v2);
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v5;
      v10 = 2082;
      v11 = "-[CMContinuityCaptureCompositeDevice relayEvent:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s name %@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(WeakRetained[8], "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:entity:data:forTransport:", *(_QWORD *)(a1 + 32), 0, 0, objc_msgSend(WeakRetained, "currentPreferredAvailableTransport"));

  }
}

- (NSDate)currentSessionActivationStartTime
{
  return (NSDate *)-[ContinuityCaptureDeviceClient sessionActivationStartTime](self->_client, "sessionActivationStartTime");
}

- (void)terminateCompleteForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  ContinuityCaptureDeviceClient *client;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke;
  v14[3] = &unk_24F06AE88;
  objc_copyWeak(&v16, &location);
  v6 = v4;
  v15 = v6;
  v7 = (void *)MEMORY[0x22E2A7CB0](v14);
  client = self->_client;
  v9 = objc_msgSend(v6, "entity");
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_3;
  v11[3] = &unk_24F06AED8;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  -[ContinuityCaptureDeviceClient terminateEntity:option:completion:](client, "terminateEntity:option:completion:", v9, 512, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD block[4];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "provider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_loadWeakRetained(v2);
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v31 = v7;
        v32 = 2114;
        v33 = v8;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate complete for %{public}@", buf, 0x16u);

      }
      v9 = (void *)*((_QWORD *)v4 + 2);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "entity"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)*((_QWORD *)v4 + 2);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "entity"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v13);

        objc_msgSend(v5, "queue");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_17;
        block[3] = &unk_24F06AEB0;
        v29 = *(id *)(a1 + 32);
        dispatch_async(v14, block);

        if (!objc_msgSend(*((id *)v4 + 2), "count"))
        {
          v16 = (void *)*((_QWORD *)v4 + 9);
          if (v16)
          {
            dispatch_block_cancel(v16);
            v17 = (void *)*((_QWORD *)v4 + 9);
            *((_QWORD *)v4 + 9) = 0;

          }
          +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "queue");
          v19 = objc_claimAutoreleasedReturnValue();
          dispatch_assert_queue_not_V2(v19);

          +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "queue");
          v21 = objc_claimAutoreleasedReturnValue();
          v27[0] = v15;
          v27[1] = 3221225472;
          v27[2] = __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_2;
          v27[3] = &unk_24F06AEB0;
          v27[4] = v4;
          dispatch_async_and_wait(v21, v27);

          objc_msgSend(*((id *)v4 + 3), "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureControlCameraHidden"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObserver:forKeyPath:context:", v4, CFSTR("value"), 0);
          objc_storeWeak((id *)v4 + 11, 0);
          +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v4 + 8), "device");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "deviceIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeSidebandMessageNotificationHandlerForDeviceIdentifier:", v26);

          objc_msgSend(*((id *)v4 + 8), "invalidate");
          objc_msgSend(v5, "terminateCompleteForDevice:", v4);

        }
      }
    }

  }
}

uint64_t __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceDeviceRemoval");
}

void __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("deviceStatus"), 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("placementStepSkipped"), 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "device");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("terminationDeferred"), 0);

}

void __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_3(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v3;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_async(WeakRetained[1], *(dispatch_block_t *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)device:(id)a3 updatedValueForControl:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = (void *)objc_msgSend(v7, "copy");
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__CMContinuityCaptureCompositeDevice_device_updatedValueForControl___block_invoke;
  v12[3] = &unk_24F06AF00;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __68__CMContinuityCaptureCompositeDevice_device_updatedValueForControl___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_device:updatedValueForControl:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_device:(id)a3 updatedValueForControl:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  CMContinuityCaptureCompositeDevice *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07F768);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (!v10)
    goto LABEL_14;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("kCMContinuityCaptureControlCameraHidden")))
  {
    v18 = CFSTR("kCMContinuityCaptureControlCameraReadyToUnhide");
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCMContinuityCaptureControlCameraReadyToUnhide"))
      || (v18 = CFSTR("kCMContinuityCaptureControlBatteryState"),
          objc_msgSend(v8, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryState")))
      || (v18 = CFSTR("kCMContinuityCaptureControlBatteryLevel"),
          objc_msgSend(v8, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryLevel"))))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:", v19);

LABEL_12:
      v12 = 0;
      v13 = 0;
      goto LABEL_13;
    }
LABEL_14:
    v11 = 0;
    goto LABEL_12;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureControlCameraHidden"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToNumber:", v13) & 1) == 0)
  {
    objc_msgSend(v11, "setValue:", v13);
    if (objc_msgSend(v13, "isEqualToNumber:", MEMORY[0x24BDBD1C0]))
    {
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[ContinuityCaptureDeviceClient device](self->_client, "device");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = self;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ relay skip placement step message on device %@", (uint8_t *)&v20, 0x16u);

      }
      -[ContinuityCaptureDeviceClient device](self->_client, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPlacementStepSkipped:", 1);

      -[ContinuityCaptureDeviceClient device](self->_client, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "relaySkipPlacementStepForTranport:", -[CMContinuityCaptureCompositeDevice currentPreferredAvailableTransport](self, "currentPreferredAvailableTransport"));

    }
  }
LABEL_13:

}

- (ContinuityCaptureDeviceClient)client
{
  return self->_client;
}

- (void)logConnectionSwitch:(id)a3
{
  NSMutableArray *connectionSwitchLogs;
  id v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  id v9;

  connectionSwitchLogs = self->_connectionSwitchLogs;
  v5 = a3;
  if ((unint64_t)-[NSMutableArray count](connectionSwitchLogs, "count") >= 0xB)
    -[NSMutableArray removeObjectAtIndex:](self->_connectionSwitchLogs, "removeObjectAtIndex:", 0);
  v6 = self->_connectionSwitchLogs;
  v7 = (void *)MEMORY[0x24BDD17C8];
  CMContinuityCaptureGetCurrentTimeString();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), v5, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](v6, "addObject:", v8);
}

- (void)resetTransportDevice:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  CMContinuityCaptureCompositeDevice *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureCompositeDevice_resetTransportDevice___block_invoke;
  block[3] = &unk_24F06ADE8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async_and_wait(queue, block);

}

void __59__CMContinuityCaptureCompositeDevice_resetTransportDevice___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int8x16_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[4];
  int8x16_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[2].i64[0];
  objc_msgSend(*(id *)(a1[2].i64[1] + 64), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((v2 & 1) == 0)
  {
    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v5);

    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__CMContinuityCaptureCompositeDevice_resetTransportDevice___block_invoke_2;
    block[3] = &unk_24F06ADE8;
    v14 = a1[2];
    v8 = (id)v14.i64[0];
    v20 = vextq_s8(v14, v14, 8uLL);
    dispatch_async_and_wait(v7, block);

    objc_storeWeak((id *)(a1[2].i64[1] + 88), (id)a1[2].i64[0]);
  }
  objc_msgSend(*(id *)(a1[2].i64[1] + 64), "resetTransportDevice:", a1[2].i64[0], *(_OWORD *)&v14);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1[2].i64[1] + 16), "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "resetTransportDevice:", a1[2].i64[0]);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v11);
  }

}

uint64_t __59__CMContinuityCaptureCompositeDevice_resetTransportDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("deviceStatus"), 0);

    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("placementStepSkipped"), 0);

    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("terminationDeferred"), 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("deviceStatus"), 3, 0);
  objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("placementStepSkipped"), 3, 0);
  return objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("terminationDeferred"), 3, 0);
}

- (void)logRemoteSessionSummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    if ((unint64_t)-[NSMutableArray count](self->_remoteSessionLogs, "count") >= 6)
      -[NSMutableArray removeObjectAtIndex:](self->_remoteSessionLogs, "removeObjectAtIndex:", 0);
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v8 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 1, &v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (v6)
      {
        -[NSMutableArray addObject:](self->_remoteSessionLogs, "addObject:", v6);

      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v5 = 0;
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
  CMContinuityCaptureControl *v9;
  CMContinuityCaptureControl *v10;
  CMContinuityCaptureControl *v11;
  __int128 v12;
  uint64_t v13;

  v3 = [CMContinuityCaptureControl alloc];
  v4 = *MEMORY[0x24BDB1B78];
  v12 = xmmword_227CED4C0;
  v13 = 0;
  v5 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v3, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlSystemPressure"), 0, 4, &v12, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v5, CFSTR("kCMContinuityCaptureControlSystemPressure"));
  v6 = [CMContinuityCaptureControl alloc];
  v12 = xmmword_227CED4C0;
  v13 = 0;
  v7 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v6, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlBatteryLevel"), 0, 4, &v12, &unk_24F07FC78);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v7, CFSTR("kCMContinuityCaptureControlBatteryLevel"));
  v8 = [CMContinuityCaptureControl alloc];
  v12 = xmmword_227CED4C0;
  v13 = 0;
  v9 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v8, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlBatteryState"), 0, 4, &v12, &unk_24F07F780);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v9, CFSTR("kCMContinuityCaptureControlBatteryState"));
  v10 = [CMContinuityCaptureControl alloc];
  v12 = xmmword_227CED4C0;
  v13 = 0;
  v11 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v10, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("kCMContinuityCaptureControlDockedTrackingActive"), 0, 4, &v12, MEMORY[0x24BDBD1C0]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v11, CFSTR("kCMContinuityCaptureControlDockedTrackingActive"));

}

- (NSArray)controls
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_cmControlByName, "allValues");
}

- (NSArray)continuityCaptureDevices
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues");
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

- (BOOL)setupCaptureDevices
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CMContinuityCaptureVideoDevice *v12;
  NSObject *p_super;
  NSObject *v14;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v32;
  __int16 v33;
  NSObject *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ContinuityCaptureDeviceClient device](self->_client, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devicesCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v28;
    *(_QWORD *)&v7 = 138543618;
    v26 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v11, "entityType", v26) == 1)
        {
          v12 = -[CMContinuityCaptureVideoDevice initWithCapabilities:compositeDelegate:]([CMContinuityCaptureVideoDevice alloc], "initWithCapabilities:compositeDelegate:", v11, self);
          if (v12)
          {
            p_super = &v12->super.super;
            CMContinuityCaptureLog(2);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              v32 = self;
              v33 = 2114;
              v34 = p_super;
              _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Created %{public}@", buf, 0x16u);
            }

            captureDeviceByEntityType = self->_captureDeviceByEntityType;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "entityType"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](captureDeviceByEntityType, "setObject:forKeyedSubscript:", p_super, v16);

            goto LABEL_14;
          }
        }
        else
        {
          objc_msgSend(v11, "entityType");
        }
        CMContinuityCaptureLog(2);
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_msgSend(v11, "entityType");
          *(_DWORD *)buf = v26;
          v32 = self;
          v33 = 1024;
          LODWORD(v34) = v17;
          _os_log_impl(&dword_227C5D000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to create capture device for entity %d", buf, 0x12u);
        }
LABEL_14:

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07F798);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07F768);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07F768);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07F798);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCompanionDevice:", v21);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07F798);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_captureDeviceByEntityType, "objectForKeyedSubscript:", &unk_24F07F768);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCompanionDevice:", v23);

    }
  }
  return -[NSMutableDictionary count](self->_captureDeviceByEntityType, "count") != 0;
}

- (void)connectionInterrupted:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "code") && (objc_msgSend(v7, "terminationDeferred") & 1) == 0)
  {
    CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Interrupted, error %{public}@", buf, 0x16u);
    }

    if (objc_msgSend(v6, "code") == -1012)
    {
      -[CMContinuityCaptureCompositeDevice relayEvent:](self, "relayEvent:", CFSTR("kCMContinuityCaptureEventStateMismatched"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time(), CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventConnectionDisconnect"), 0, v10);

    }
  }

}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  NSMutableDictionary *captureDeviceByEntityType;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](captureDeviceByEntityType, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "handleAVCNegotiation:data:", a3, v9);

}

- (int64_t)currentPreferredAvailableTransport
{
  void *v3;
  char v4;
  void *v6;
  unsigned int v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ContinuityCaptureDeviceClient device](self->_client, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wired");

  if ((v4 & 1) != 0)
    return 2;
  -[ContinuityCaptureDeviceClient device](self->_client, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wifiP2pActive");

  return v7;
}

- (void)notifyTransportError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[7];
  _QWORD v26[9];

  v26[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4 && objc_msgSend(v4, "code") != -1010 && objc_msgSend(v4, "code") != -1011 && objc_msgSend(v4, "code") == -1005)
  {
    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = CFSTR("kContinuityCaptureNotificationKeyTitle");
    v25[1] = CFSTR("kContinuityCaptureNotificationKeyBody");
    v26[0] = CFSTR("MULTIDEVICE_NOTIFICATION_TITLE");
    v26[1] = CFSTR("MULTIDEVICE_NOTIFICATION_BODY");
    v25[2] = CFSTR("kContinuityCaptureNotificationKeyBodyArgs");
    v24[0] = &stru_24F06D368;
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deviceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v20;
    v25[3] = CFSTR("kContinuityCaptureNotificationKeyIdentifier");
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), CFSTR("CMContinuityCaptureMultiDeviceNotification"), v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v15;
    v26[4] = MEMORY[0x24BDBD1C0];
    v25[4] = CFSTR("kContinuityCaptureNotificationKeyOneTime");
    v25[5] = CFSTR("kContinuityCaptureNotificationKeyDeviceModel");
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v8;
    v25[6] = CFSTR("kContinuityCaptureNotificationKeyDeviceIdentifier");
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[6] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleNotification:data:", 2, v13);

    -[CMContinuityCaptureCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStreamDisableForMultipleStream"), 0, 0);
  }

}

- (void)registerStreamIntentForCaptureDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v18 = self;
    v19 = 2080;
    v20 = "-[CMContinuityCaptureCompositeDevice registerStreamIntentForCaptureDevice:completion:]";
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke;
  v12[3] = &unk_24F06AF50;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke(id *a1)
{
  id *v2;
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void (**v16)(id, void *);
  id v17;
  uint64_t v18;
  void (**v19)(id, void *);
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26[2];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 6;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v8 = objc_msgSend(v4, "startSessionWithDevice:forTransportType:validateTransport:initiatedOnCommunalDevice:outError:", v6, 0, 1, objc_msgSend(v7, "isSessionInitiatedOnCommunalDevice"), &v27);
    v9 = v27;

    if ((v8 & 1) != 0)
    {
      v10 = (void *)objc_msgSend(WeakRetained, "currentPreferredAvailableTransport");
      if (v10)
      {
        v11 = objc_msgSend(WeakRetained[7], "count") == 0;
        v12 = WeakRetained[7];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1[4], "entity"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        if (v11)
        {
          v22 = WeakRetained[8];
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke_50;
          v23[3] = &unk_24F06AF28;
          objc_copyWeak(v26, v2);
          v24 = a1[4];
          v26[1] = v10;
          v25 = a1[5];
          objc_msgSend(v22, "setPreferredTransport:resetConnection:completion:", v10, 0, v23);

          objc_destroyWeak(v26);
        }
        else
        {
          (*((void (**)(void))a1[5] + 2))();
        }
      }
      else
      {
        v19 = (void (**)(id, void *))a1[5];
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870185, 0);
        v19[2](v19, v20);

      }
    }
    else
    {
      CMContinuityCaptureLog(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2114;
        v31 = v9;
        _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ startSessionWithDevice returned %{public}@", buf, 0x16u);

      }
      objc_msgSend(WeakRetained, "notifyTransportError:", v9);
      v16 = (void (**)(id, void *))a1[5];
      v17 = objc_alloc(MEMORY[0x24BDD1540]);
      if (v9)
        v18 = objc_msgSend(v9, "code");
      else
        v18 = -536870185;
      v21 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), v18, 0);
      v16[2](v16, v21);

    }
  }

}

void __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke_50(uint64_t a1, void *a2)
{
  id *v4;
  id *WeakRetained;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2 && objc_msgSend(a2, "code"))
    {
      CMContinuityCaptureLog(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_loadWeakRetained(v4);
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        v19 = v7;
        v20 = 2114;
        v21 = v8;
        v22 = 1024;
        v23 = v9;
        v24 = 2114;
        v25 = a2;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ registerStreamIntentForDevice setPreferredTransport %{public}@ transport %d error %{public}@", buf, 0x26u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v10 = objc_loadWeakRetained(WeakRetained + 15);
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 56);
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke_51;
        v14[3] = &unk_24F06AF28;
        objc_copyWeak(v17, v4);
        v12 = *(id *)(a1 + 32);
        v13 = *(void **)(a1 + 56);
        v15 = v12;
        v17[1] = v13;
        v16 = *(id *)(a1 + 40);
        objc_msgSend(v10, "registerStreamIntentForDevice:forTransportType:completion:", WeakRetained, v11, v14);

        objc_destroyWeak(v17);
      }

    }
  }

}

void __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke_51(uint64_t a1, void *a2)
{
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a2 && objc_msgSend(a2, "code"))
  {
    CMContinuityCaptureLog(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      v15 = WeakRetained;
      v16 = 2114;
      v17 = v6;
      v18 = 1024;
      v19 = v7;
      v20 = 2114;
      v21 = a2;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ registerStreamIntentForDevice %{public}@ transport %d error %{public}@", buf, 0x26u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (v8)
    {
      v13 = v8;
      objc_msgSend(v8[8], "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "magicStateMonitor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "holdMagicStateAssertion:", 1);

      objc_msgSend(v13[8], "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "magicStateMonitor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "releaseMagicStateAssertion:stateTransitionCoolDownTime:", 2, 0);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v8 = v13;
    }

  }
}

- (void)unregisterStreamIntentForCaptureDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  char v13;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2080;
    v17 = "-[CMContinuityCaptureCompositeDevice unregisterStreamIntentForCaptureDevice:]";
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", dispatch_get_specific(v7)) ^ 1;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CMContinuityCaptureCompositeDevice_unregisterStreamIntentForCaptureDevice___block_invoke;
  block[3] = &unk_24F06AF78;
  block[4] = self;
  v12 = v4;
  v13 = v8;
  v10 = v4;
  dispatch_async_and_wait(queue, block);

}

void __77__CMContinuityCaptureCompositeDevice_unregisterStreamIntentForCaptureDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count") == 1
      && (v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56),
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "entity")),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5),
          v5,
          (_DWORD)v4))
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));

      CMContinuityCaptureLog(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(unsigned __int8 *)(a1 + 48);
        v15 = 138543874;
        v16 = v8;
        v17 = 2080;
        v18 = "-[CMContinuityCaptureCompositeDevice unregisterStreamIntentForCaptureDevice:]_block_invoke";
        v19 = 1024;
        v20 = v9;
        _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s syncOnSessionQueue:%d", (uint8_t *)&v15, 0x1Cu);
      }

      if (v6)
        objc_msgSend(v6, "unregisterStreamIntentForDevice:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "magicStateMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "releaseMagicStateAssertion:stateTransitionCoolDownTime:", 1, 5);

    }
    else
    {
      v6 = v3;
    }
    v12 = *(void **)(a1 + 40);
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "entity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v14);

  }
}

- (void)disableAutoTransportSwitch:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  CMContinuityCaptureCompositeDevice *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "Off";
    if (v3)
      v6 = "On";
    v7 = 138543618;
    v8 = self;
    v9 = 2080;
    v10 = v6;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ turn %s transport switch guard", (uint8_t *)&v7, 0x16u);
  }

  atomic_store(v3, (unsigned __int8 *)&self->autoTransportSwitchDisabled);
}

- (BOOL)shouldSwitchConnection
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  BOOL v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int v19;
  CMContinuityCaptureCompositeDevice *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = atomic_load((unsigned __int8 *)&self->autoTransportSwitchDisabled);
  if ((v3 & 1) != 0)
  {
    CMContinuityCaptureLog(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = self;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ skip transport switch since auto switch is disabled", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    -[ContinuityCaptureDeviceClient device](self->_client, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    -[ContinuityCaptureDeviceClient device](self->_client, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeStreams");
    v6 = objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v4);
    v7 = -[NSObject count](v6, "count");
    v8 = -[ContinuityCaptureDeviceClient preferredTransport](self->_client, "preferredTransport");
    v9 = -[CMContinuityCaptureCompositeDevice currentPreferredAvailableTransport](self, "currentPreferredAvailableTransport");
    if (v7)
    {
      v10 = v9;
      if (v8 == v9)
      {
        CMContinuityCaptureLog(2);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138543618;
          v20 = self;
          v21 = 1024;
          LODWORD(v22) = v8;
          v12 = "%{public}@ Transport status unchanged %d";
          v13 = v11;
          v14 = 18;
LABEL_15:
          _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, v14);
        }
      }
      else
      {
        v16 = v9 == 0;
        CMContinuityCaptureLog(2);
        v11 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (!v16)
        {
          if (v17)
          {
            v19 = 138544130;
            v20 = self;
            v21 = 2048;
            v22 = -[CMContinuityCaptureCompositeDevice currentSessionID](self, "currentSessionID");
            v23 = 1024;
            v24 = v8;
            v25 = 1024;
            v26 = v10;
            _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Transport Switch from %d -> %d", (uint8_t *)&v19, 0x22u);
          }
          v15 = 1;
          goto LABEL_17;
        }
        if (v17)
        {
          v19 = 138543362;
          v20 = self;
          v12 = "%{public}@  No valid transport available for switch";
          v13 = v11;
          v14 = 12;
          goto LABEL_15;
        }
      }
      v15 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (void)deferDevice:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMContinuityCaptureCompositeDevice *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v22[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption");
    v22[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
    v23[0] = &unk_24F07F7B0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect"), 0, v5);

    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activeSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v10 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "isEqualToString:", v14);

    if (!v15)
      return;
    -[CMContinuityCaptureCompositeDevice client](v10, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "abortRemoteSession");
  }
  else
  {
    if (self->_undeferBlockForSidecarClient)
      return;
    v20[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v16;
    v20[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CMContinuityCaptureCompositeDevice hasValidStreamState](self, "hasValidStreamState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventConnectionDisconnect"), 0, v18);

  }
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
  v17[2] = __85__CMContinuityCaptureCompositeDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
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

void __85__CMContinuityCaptureCompositeDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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
  NSObject *v11;
  id v12;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  id v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  NSObject *v44;
  CMContinuityCaptureCompositeDevice *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  id v54;
  id v55;
  CMContinuityCaptureCompositeDevice *v56;
  id obj;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint8_t v65[128];
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  CMContinuityCaptureLog(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v67 = self;
    v68 = 2080;
    v69 = "-[CMContinuityCaptureCompositeDevice _observeValueForKeyPath:ofObject:change:context:]";
    v70 = 2112;
    v71 = v9;
    _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("currentState")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("deviceStatus"))
      && -[CMContinuityCaptureCompositeDevice shouldSwitchConnection](self, "shouldSwitchConnection"))
    {
      v63[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeySessionID");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ContinuityCaptureDeviceClient currentSessionID](self->_client, "currentSessionID"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v37;
      v63[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventConnectionChange"), 0, v39);

LABEL_51:
      v47 = 0;
      v17 = 0;
      v26 = 0;
      v28 = 0;
      goto LABEL_52;
    }
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("terminationDeferred")))
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("placementStepSkipped")))
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "BOOLValue");

        if (v49)
          -[CMContinuityCaptureCompositeDevice _handlePlacementStepSkipped](self, "_handlePlacementStepSkipped");
      }
      goto LABEL_51;
    }
    v40 = *MEMORY[0x24BDD0E70];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "BOOLValue");

      if ((v43 & 1) == 0)
      {
        CMContinuityCaptureLog(2);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v67 = self;
          _os_log_impl(&dword_227C5D000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ Defer device", buf, 0xCu);
        }

        v45 = self;
        v46 = 1;
        goto LABEL_50;
      }
    }
    else
    {

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", v40);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "BOOLValue"))
    {

      goto LABEL_51;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLValue");

    if (!v52)
      goto LABEL_51;
    CMContinuityCaptureLog(2);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v67 = self;
      _os_log_impl(&dword_227C5D000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Un-Defer device", buf, 0xCu);
    }

    v45 = self;
    v46 = 0;
LABEL_50:
    -[CMContinuityCaptureCompositeDevice deferDevice:](v45, "deferDevice:", v46);
    goto LABEL_51;
  }
  v12 = a6;
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  v58 = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "entity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](captureDeviceByEntityType, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_37:
    v17 = 0;
    goto LABEL_38;
  }
  v16 = *MEMORY[0x24BDD0E70];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v20 = *MEMORY[0x24BDD0E80];
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        objc_msgSend(v10, "objectForKeyedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v24 = objc_opt_isKindOfClass();

        if ((v24 & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKeyedSubscript:", v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v28 = (char *)objc_claimAutoreleasedReturnValue();

          CMContinuityCaptureLog(2);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138544130;
            v67 = self;
            v68 = 2112;
            v69 = v28;
            v70 = 2112;
            v71 = v26;
            v72 = 2112;
            v73 = v58;
            _os_log_impl(&dword_227C5D000, v29, OS_LOG_TYPE_INFO, "%{public}@ Change of state from %@ to %@ for %@", buf, 0x2Au);
          }

          -[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v30;
          if (v30)
          {
            v56 = self;
            if (objc_msgSend(v30, "count"))
            {
              v54 = v10;
              v55 = v9;
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              obj = v17;
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
              if (v31)
              {
                v32 = v31;
                v33 = *(_QWORD *)v60;
                do
                {
                  for (i = 0; i != v32; ++i)
                  {
                    if (*(_QWORD *)v60 != v33)
                      objc_enumerationMutation(obj);
                    v35 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * i);
                    if (v35 != v58)
                    {
                      if (((objc_msgSend(v28, "isEqualToString:", CFSTR("kCMContinuityCaptureStatePaused")) & 1) != 0
                         || objc_msgSend(v28, "isEqualToString:", CFSTR("kCMContinuityCaptureStateDisabled")))&& ((v36 = CFSTR("kCMContinuityCaptureEventAssociatedDeviceResume"), (objc_msgSend(v26, "isEqualToString:", CFSTR("kCMContinuityCaptureStateStreaming"), v54, v55) & 1) != 0)|| (v36 = CFSTR("kCMContinuityCaptureEventAssociatedDeviceResume"), (objc_msgSend(v26, "isEqualToString:", CFSTR("kCMContinuityCaptureStateInit")) & 1) != 0))|| (v36 = CFSTR("kCMContinuityCaptureEventAssociatedDevicePause"), objc_msgSend(v26, "isEqualToString:", CFSTR("kCMContinuityCaptureStatePaused"), v54, v55)))
                      {
                        -[CMContinuityCaptureCompositeDevice postEvent:entity:data:](v56, "postEvent:entity:data:", v36, objc_msgSend(v35, "entity"), 0);
                      }
                    }
                  }
                  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
                }
                while (v32);
              }
              v17 = obj;

              v10 = v54;
              v9 = v55;
            }
          }
          goto LABEL_39;
        }
      }
    }
    goto LABEL_37;
  }
LABEL_38:
  v26 = 0;
  v28 = 0;
LABEL_39:
  v47 = v58;
LABEL_52:

}

- (CMContinuityCaptureEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (unint64_t)lastSessionID
{
  return self->_lastSessionID;
}

- (BOOL)hasValidStreamState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  -[CMContinuityCaptureCompositeDevice client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasStreamIntent"))
  {
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "userDisconnected") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[CMContinuityCaptureCompositeDevice client](self, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "capabilities");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[CMContinuityCaptureCompositeDevice client](self, "client");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "device");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "capabilities");
        v15 = v8;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v13, "userDisabled");

        v8 = v15;
      }
      else
      {
        v7 = 1;
      }

    }
  }
  else
  {
    v7 = 1;
  }

  return v7 ^ 1;
}

- (BOOL)validConnectionResetEventForData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  if (!-[ContinuityCaptureDeviceClient lastActivationTime](self->_client, "lastActivationTime"))
    goto LABEL_7;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedLongLongValue");
      v9 = -[ContinuityCaptureDeviceClient lastActivationTime](self->_client, "lastActivationTime");

      if (v8 < v9)
        goto LABEL_7;
    }
  }
  if (!-[CMContinuityCaptureCompositeDevice hasValidStreamState](self, "hasValidStreamState"))
  {
LABEL_7:
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  return v11;
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  CMContinuityCaptureCompositeDevice *v16;
  id v17;
  id v18[2];
  _BYTE buf[12];
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    v20 = 2080;
    v21 = "-[CMContinuityCaptureCompositeDevice postEvent:entity:data:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2048;
    v25 = a4;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@ %ld", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke;
  block[3] = &unk_24F06AFA0;
  objc_copyWeak(v18, (id *)buf);
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18[1] = (id)a4;
  v12 = v9;
  v13 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  dispatch_block_t v4;
  void *v5;
  dispatch_time_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _QWORD block[4];
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  uint64_t v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventTerminate")))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_2;
      block[3] = &unk_24F06AE60;
      objc_copyWeak(&v46, v2);
      v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
      v5 = (void *)*((_QWORD *)WeakRetained + 9);
      *((_QWORD *)WeakRetained + 9) = v4;

      v6 = dispatch_time(0, 4000000000);
      dispatch_after(v6, *((dispatch_queue_t *)WeakRetained + 1), *((dispatch_block_t *)WeakRetained + 9));
      objc_destroyWeak(&v46);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventUserDisconnect")))
    {
      +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_3;
      v43[3] = &unk_24F06AE60;
      objc_copyWeak(&v44, v2);
      dispatch_async(v8, v43);

      CMContinuityCaptureLog(2);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v48 = WeakRetained;
        _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ User Disconnect", buf, 0xCu);
      }

      objc_destroyWeak(&v44);
      goto LABEL_8;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamDisableForWifiContention")))
    {
      objc_msgSend(*(id *)(a1 + 40), "client");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "wired");

      if (v15)
      {
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_loadWeakRetained(v2);
          *(_DWORD *)buf = 138543362;
          v48 = v17;
          _os_log_impl(&dword_227C5D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip kCMContinuityCaptureEventStreamDisableForWifiContention since we have active session on USB", buf, 0xCu);

        }
        goto LABEL_8;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventConnectionChange")))
    {
      v18 = *(void **)(a1 + 48);
      if (v18
        && (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport")), v19 = (void *)objc_claimAutoreleasedReturnValue(), v20 = v19 == 0, v19, !v20)|| objc_msgSend(WeakRetained, "shouldSwitchConnection")&& (objc_msgSend(WeakRetained, "validConnectionResetEventForData:", *(_QWORD *)(a1 + 48)) & 1) != 0)
      {
LABEL_31:
        if (*(_QWORD *)(a1 + 64))
        {
          objc_msgSend(WeakRetained, "eventQueue");
          v10 = objc_claimAutoreleasedReturnValue();
          v51[0] = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v51[1] = v28;
          v29 = MEMORY[0x24BDBD1B8];
          if (*(_QWORD *)(a1 + 48))
            v29 = *(_QWORD *)(a1 + 48);
          v51[2] = v29;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject enqueueEventAction:args:](v10, "enqueueEventAction:args:", 3, v30);

        }
        else
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(*((id *)WeakRetained + 2), "allKeys", 0);
          v10 = objc_claimAutoreleasedReturnValue();
          v31 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
          if (v31)
          {
            v32 = *(_QWORD *)v40;
            v33 = MEMORY[0x24BDBD1B8];
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v40 != v32)
                  objc_enumerationMutation(v10);
                v35 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(WeakRetained, "eventQueue");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v52[0] = *(_QWORD *)(a1 + 32);
                v52[1] = v35;
                v37 = *(_QWORD *)(a1 + 48);
                if (!v37)
                  v37 = v33;
                v52[2] = v37;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 3);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "enqueueEventAction:args:", 3, v38);

              }
              v31 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
            }
            while (v31);
          }
        }
        goto LABEL_44;
      }
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventConnectionDisconnect")) & 1) == 0
        && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamInterrupted")))
      {
        goto LABEL_31;
      }
      objc_msgSend(*((id *)WeakRetained + 8), "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v21);
      objc_msgSend(*((id *)WeakRetained + 8), "device");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activeStreams");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_sync_exit(v21);
      v24 = !objc_msgSend(v23, "count")
         || (objc_msgSend(WeakRetained, "validConnectionResetEventForData:", *(_QWORD *)(a1 + 48)) & 1) == 0;
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "BOOLValue");

        if ((v27 | !v24) == 1)
          goto LABEL_31;
      }
      else
      {

        if (!v24)
          goto LABEL_31;
      }
    }
LABEL_8:
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_loadWeakRetained(v2);
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v48 = v11;
      v49 = 2114;
      v50 = v12;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@  skip event %{public}@", buf, 0x16u);

    }
LABEL_44:

  }
}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id *v4;
  id *v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id obj;
  _QWORD block[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138543362;
    v23 = WeakRetained;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ termination timeout", buf, 0xCu);

  }
  v4 = (id *)(a1 + 32);
  v5 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = v5;
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5[2], "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v6[2], "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "queue");
          v13 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_58;
          block[3] = &unk_24F06AE88;
          objc_copyWeak(&v16, v4);
          block[4] = v11;
          dispatch_async(v13, block);

          objc_destroyWeak(&v16);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

  }
}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_58(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_2_59;
    v6[3] = &unk_24F06AE88;
    objc_copyWeak(&v7, v2);
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "terminateComplete:", v6);

    objc_destroyWeak(&v7);
  }

}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_2_59(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "terminateCompleteForDevice:", v3);

    WeakRetained = v4;
  }

}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[8], "device");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setUserDisconnected:", 1);

    WeakRetained = v3;
  }

}

- (void)performConnectionDisconnectEventIfApplicable:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  ContinuityCaptureDeviceClient *client;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v37 = self;
    v38 = 2080;
    v39 = "-[CMContinuityCaptureCompositeDevice performConnectionDisconnectEventIfApplicable:]";
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s data %@", buf, 0x20u);
  }

  v6 = -[CMContinuityCaptureCompositeDevice currentPreferredAvailableTransport](self, "currentPreferredAvailableTransport");
  -[ContinuityCaptureDeviceClient device](self->_client, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[ContinuityCaptureDeviceClient device](self->_client, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeStreams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  v10 = objc_msgSend(v9, "count");
  if (!v4)
    goto LABEL_16;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_16;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");
  v14 = v6 ? v13 : 0;

  if (v14)
  {
    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = self;
      v38 = 2080;
      v39 = "-[CMContinuityCaptureCompositeDevice performConnectionDisconnectEventIfApplicable:]";
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %s force reset", buf, 0x16u);
    }

  }
  else
  {
LABEL_16:
    if (!v10
      || ((v16 = -[CMContinuityCaptureCompositeDevice validConnectionResetEventForData:](self, "validConnectionResetEventForData:", v4), v6)? (v17 = v16): (v17 = 0), !v17))
    {
      -[CMContinuityCaptureCompositeDevice eventQueue](self, "eventQueue");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "notifyCompletion");
      goto LABEL_30;
    }
  }
  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureCompositeDevice client](self, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v22 = objc_msgSend(v18, "startSessionWithDevice:forTransportType:validateTransport:initiatedOnCommunalDevice:outError:", v20, v6, 1, objc_msgSend(v21, "isSessionInitiatedOnCommunalDevice"), &v32);
  v23 = v32;

  if ((v22 & 1) != 0)
  {
    v34[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption");
    v34[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
    v35[0] = &unk_24F07F7B0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureCompositeDevice _postEvent:entity:data:](self, "_postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect"), 0, v25);

    if (-[CMContinuityCaptureCompositeDevice currentPreferredAvailableTransport](self, "currentPreferredAvailableTransport"))
    {
      client = self->_client;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __83__CMContinuityCaptureCompositeDevice_performConnectionDisconnectEventIfApplicable___block_invoke;
      v30[3] = &unk_24F06AFC8;
      objc_copyWeak(&v31, &location);
      -[ContinuityCaptureDeviceClient resetSession:](client, "resetSession:", v30);
      objc_destroyWeak(&v31);
    }
    else
    {
      CMContinuityCaptureLog(2);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v37 = self;
        _os_log_impl(&dword_227C5D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ No valid transport for reset", buf, 0xCu);
      }

      -[CMContinuityCaptureCompositeDevice eventQueue](self, "eventQueue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "notifyCompletion");

    }
  }
  else
  {
    if (v23
      && (objc_msgSend(v23, "code") == -1011 || objc_msgSend(v23, "code") == -1010 || objc_msgSend(v23, "code") == -1013))
    {
      -[CMContinuityCaptureCompositeDevice notifyTransportError:](self, "notifyTransportError:", v23);
    }
    -[CMContinuityCaptureCompositeDevice eventQueue](self, "eventQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "notifyCompletion");

  }
LABEL_30:

  objc_destroyWeak(&location);
}

void __83__CMContinuityCaptureCompositeDevice_performConnectionDisconnectEventIfApplicable___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id *WeakRetained;
  NSObject *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_loadWeakRetained(v3);
      v7 = objc_msgSend(WeakRetained[8], "preferredTransport");
      *(_DWORD *)buf = 138543874;
      v27 = v6;
      v28 = 1024;
      v29 = v7;
      v30 = 2114;
      v31 = a2;
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resetSession %d error %{public}@", buf, 0x1Cu);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(WeakRetained[2], "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(obj);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "integerValue");
          v23 = CFSTR("CMContinuityCaptureStateMachineEventDataKeySessionID");
          v13 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(WeakRetained, "client");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "currentSessionID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientReconnect"), v12, v16);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(WeakRetained, "eventQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "notifyCompletion");

  }
}

- (void)performConnectionChangeEventIfApplicable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29[2];
  id v30;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureCompositeDevice provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport")), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = v6 == 0, v6, v7))
    {
      if (!-[CMContinuityCaptureCompositeDevice shouldSwitchConnection](self, "shouldSwitchConnection")
        || !-[CMContinuityCaptureCompositeDevice validConnectionResetEventForData:](self, "validConnectionResetEventForData:", v4))
      {
        -[CMContinuityCaptureCompositeDevice eventQueue](self, "eventQueue");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "notifyCompletion");
LABEL_25:

        goto LABEL_26;
      }
      if (!v4)
        goto LABEL_14;
    }
    else
    {
      CMContinuityCaptureLog(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = self;
        v34 = 2112;
        v35 = v9;
        _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Force Connection Switch to %@", buf, 0x16u);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (!v11)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "integerValue");

      goto LABEL_15;
    }
LABEL_14:
    v13 = -[CMContinuityCaptureCompositeDevice currentPreferredAvailableTransport](self, "currentPreferredAvailableTransport");
LABEL_15:
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v19 = objc_msgSend(v15, "startSessionWithDevice:forTransportType:validateTransport:initiatedOnCommunalDevice:outError:", v17, v13, 1, objc_msgSend(v18, "isSessionInitiatedOnCommunalDevice"), &v30);
    v14 = v30;

    if ((v19 & 1) != 0)
    {
      v20 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke;
      v28[3] = &unk_24F06AFF0;
      objc_copyWeak(v29, &location);
      v29[1] = v13;
      v21 = (void *)MEMORY[0x22E2A7CB0](v28);
      CMContinuityCaptureLog(2);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = self;
        _os_log_impl(&dword_227C5D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ go ahead with connection switch", buf, 0xCu);
      }

      v25[0] = v20;
      v25[1] = 3221225472;
      v25[2] = __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_61;
      v25[3] = &unk_24F06B040;
      objc_copyWeak(&v27, &location);
      v23 = v21;
      v26 = v23;
      objc_msgSend(v5, "registerStreamIntentForDevice:forTransportType:completion:", self, v13, v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak(v29);
    }
    else
    {
      if (v14
        && (objc_msgSend(v14, "code") == -1011
         || objc_msgSend(v14, "code") == -1010
         || objc_msgSend(v14, "code") == -1013))
      {
        -[CMContinuityCaptureCompositeDevice notifyTransportError:](self, "notifyTransportError:", v14);
      }
      -[CMContinuityCaptureCompositeDevice eventQueue](self, "eventQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "notifyCompletion");

    }
    goto LABEL_25;
  }
LABEL_26:

  objc_destroyWeak(&location);
}

void __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  id WeakRetained;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138543618;
    v17 = WeakRetained;
    v18 = 2114;
    v19 = a2;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ registerStreamIntentForDevice (performConnectionChangeEventIfApplicable) error %{public}@", buf, 0x16u);

  }
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    if (a2 && objc_msgSend(a2, "code"))
    {
      objc_msgSend(v6, "eventQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "notifyCompletion");

    }
    else
    {
      v6[12] = objc_msgSend(v6, "currentSessionID");
      v14[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption");
      v14[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
      v15[0] = &unk_24F07F7B0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect"), 0, v9);

      v10 = (void *)v6[8];
      v11 = *(_QWORD *)(a1 + 40);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_60;
      v12[3] = &unk_24F06AFF0;
      objc_copyWeak(v13, (id *)(a1 + 32));
      v13[1] = *(id *)(a1 + 40);
      objc_msgSend(v10, "setPreferredTransport:resetConnection:completion:", v11, 1, v12);
      objc_destroyWeak(v13);
    }
  }

}

void __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_60(uint64_t a1, uint64_t a2)
{
  id *v4;
  id *WeakRetained;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v4);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v29 = v7;
      v30 = 1024;
      v31 = v8;
      v32 = 2114;
      v33 = a2;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setPreferredTransport %d error %{public}@", buf, 0x1Cu);

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(WeakRetained[2], "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v9)
    {
      v10 = v9;
      v20 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v20)
            objc_enumerationMutation(obj);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "integerValue");
          v25[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeySessionID");
          v13 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(WeakRetained, "client");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "currentSessionID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption");
          v26[0] = v15;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26[1] = v16;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientReconnect"), v12, v17);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v10);
    }

    objc_msgSend(WeakRetained, "eventQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notifyCompletion");

  }
}

void __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_2;
    v7[3] = &unk_24F06B018;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)postEventAction:(unint64_t)a3 args:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
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
      v34 = self;
      v35 = 2048;
      v36 = a3;
      v37 = 2112;
      v38 = v6;
      _os_log_debug_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEBUG, "%@ Perform %lu %@", buf, 0x20u);
    }

  }
  if (a3 == 3)
  {
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
      goto LABEL_22;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      || (objc_msgSend(v6, "objectAtIndexedSubscript:", 1),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v11 = objc_opt_isKindOfClass(),
          v10,
          (v11 & 1) == 0))
    {
LABEL_22:
      v25 = 0;
      goto LABEL_21;
    }
    CMContinuityCaptureLog(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = self;
      v35 = 2114;
      v36 = (unint64_t)v13;
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ Perform event %{public}@", buf, 0x16u);

    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("kCMContinuityCaptureEventConnectionChange"));

    if (v15)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureCompositeDevice performConnectionChangeEventIfApplicable:](self, "performConnectionChangeEventIfApplicable:", v16);
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("kCMContinuityCaptureEventConnectionDisconnect"));

      if (v18)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        -[CMContinuityCaptureCompositeDevice performConnectionDisconnectEventIfApplicable:](self, "performConnectionDisconnectEventIfApplicable:", v16);
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = objc_alloc(MEMORY[0x24BDBCED8]);
          objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (id)objc_msgSend(v20, "initWithDictionary:", v21);

        }
        else
        {
          v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        }

        v27 = MEMORY[0x24BDAC760];
        v28 = 3221225472;
        v29 = __59__CMContinuityCaptureCompositeDevice_postEventAction_args___block_invoke;
        v30 = &unk_24F06AFC8;
        objc_copyWeak(&v31, &location);
        v22 = (void *)MEMORY[0x22E2A7CB0](&v27);
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"), v27, v28, v29, v30);

        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMContinuityCaptureCompositeDevice _postEvent:entity:data:](self, "_postEvent:entity:data:", v23, objc_msgSend(v24, "unsignedIntValue"), v16);

        objc_destroyWeak(&v31);
      }
    }

  }
  v25 = 1;
LABEL_21:
  objc_destroyWeak(&location);

  return v25;
}

void __59__CMContinuityCaptureCompositeDevice_postEventAction_args___block_invoke(uint64_t a1)
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
  id v9;
  NSObject *v10;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  int v20;
  CMContinuityCaptureCompositeDevice *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543874;
    v21 = self;
    v22 = 2114;
    v23 = v8;
    v24 = 1024;
    v25 = a4;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ postEvent : %{public}@ entity : %d", (uint8_t *)&v20, 0x1Cu);
  }

  if (a4)
  {
    captureDeviceByEntityType = self->_captureDeviceByEntityType;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](captureDeviceByEntityType, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = self->_captureDeviceByEntityType;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postEvent:entity:data:", v8, a4, v9);

    }
    else if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));
        v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870911, 0);
        ((void (**)(_QWORD, void *))v18)[2](v18, v19);

      }
    }
  }
  else
  {
    -[CMContinuityCaptureCompositeDevice postEventOnAllEntities:data:](self, "postEventOnAllEntities:data:", v8, v9);
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
  block[2] = __68__CMContinuityCaptureCompositeDevice_startStream_option_completion___block_invoke;
  block[3] = &unk_24F06B068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __68__CMContinuityCaptureCompositeDevice_startStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startStream:option:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  void *v8;
  NSObject *v9;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  id v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  ContinuityCaptureDeviceClient *client;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *queue;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  _QWORD block[4];
  uint64_t (*v30)(uint64_t, uint64_t);
  id v31;
  id v32;
  _QWORD *v33;
  _BYTE *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  uint64_t (*v41)(uint64_t, uint64_t);
  _QWORD *v42;
  _BYTE *v43;
  id v44;
  _QWORD v45[4];
  uint64_t (*v46)(uint64_t, uint64_t);
  id v47;
  _BYTE *v48;
  _QWORD *v49;
  id v50[2];
  _QWORD v51[5];
  id v52;
  id location;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v28 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v27 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureCompositeDevice provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy_;
    v51[4] = __Block_byref_object_dispose_;
    v52 = 0;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    v25 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[CMContinuityCaptureCompositeDevice _startStream:option:completion:]";
      *(_WORD *)&buf[22] = 2114;
      v55 = v28;
      LOWORD(v56) = 2048;
      *(_QWORD *)((char *)&v56 + 2) = a4;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s starting stream with configuration %{public}@, option '%lu'", buf, 0x2Au);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v55 = __Block_byref_object_copy_;
    *(_QWORD *)&v56 = __Block_byref_object_dispose_;
    *((_QWORD *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v56 + 1) = dispatch_group_create();
    captureDeviceByEntityType = self->_captureDeviceByEntityType;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v28, "entity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](captureDeviceByEntityType, "objectForKeyedSubscript:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)&buf[8] + 40));
      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)&buf[8] + 40));
      v12 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke;
      v45[3] = &unk_24F06B0E0;
      objc_copyWeak(v50, &location);
      v13 = v28;
      v46 = v13;
      v48 = buf;
      v49 = v51;
      v14 = v26;
      v47 = v14;
      v50[1] = (id)a4;
      v15 = (void *)MEMORY[0x22E2A7CB0](v45);
      v40[0] = v12;
      v40[1] = 3221225472;
      v40[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2_64;
      v40[3] = &unk_24F06B0B8;
      objc_copyWeak(&v44, &location);
      v16 = v13;
      v41 = v16;
      v42 = v51;
      v43 = buf;
      v17 = (void *)MEMORY[0x22E2A7CB0](v40);
      client = self->_client;
      v19 = objc_msgSend(v16, "entity");
      v38[0] = v12;
      v38[1] = 3221225472;
      v38[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2_66;
      v38[3] = &unk_24F06B108;
      v24 = v15;
      v39 = v24;
      v36[0] = v12;
      v36[1] = 3221225472;
      v36[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_3;
      v36[3] = &unk_24F06B108;
      v20 = v17;
      v37 = v20;
      -[ContinuityCaptureDeviceClient activateEntity:configuration:option:entityCompletion:overallCompletion:](client, "activateEntity:configuration:option:entityCompletion:overallCompletion:", v19, v16, a4, v38, v36);
      v21 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
      queue = self->_queue;
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_4;
      block[3] = &unk_24F06B130;
      objc_copyWeak(&v35, &location);
      v33 = v51;
      v30 = v16;
      v31 = v14;
      v32 = v27;
      v34 = buf;
      dispatch_group_notify(v21, queue, block);

      objc_destroyWeak(&v35);
      objc_destroyWeak(&v44);

      objc_destroyWeak(v50);
    }
    else
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870911, 0);
      (*((void (**)(id, void *))v27 + 2))(v27, v23);

    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v51, 8);
    v8 = v25;
  }

  objc_destroyWeak(&location);
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  _QWORD v20[4];
  id v21;
  int8x16_t v22;
  id v23;
  _QWORD block[5];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_loadWeakRetained(v4);
        objc_msgSend(WeakRetained, "client");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "currentSessionID");
        v19 = objc_msgSend(*(id *)(a1 + 32), "entity");
        *(_DWORD *)buf = 138544130;
        v26 = v16;
        v27 = 2048;
        v28 = v18;
        v29 = 1024;
        v30 = v19;
        v31 = 2114;
        v32 = a2;
        _os_log_error_impl(&dword_227C5D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [sessionID:%llx] Activation failure for entity %d error %{public}@", buf, 0x26u);

      }
      if (objc_msgSend(a2, "code"))
      {
        v8 = WeakRetained[1];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_62;
        block[3] = &unk_24F06B090;
        block[4] = *(_QWORD *)(a1 + 48);
        dispatch_async(v8, block);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
        goto LABEL_11;
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_loadWeakRetained(v4);
        objc_msgSend(WeakRetained, "client");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "currentSessionID");
        v12 = objc_msgSend(*(id *)(a1 + 32), "entity");
        *(_DWORD *)buf = 138543874;
        v26 = v9;
        v27 = 2048;
        v28 = v11;
        v29 = 1024;
        v30 = v12;
        _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Activation complete for entity %d", buf, 0x1Cu);

      }
    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 72);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2;
    v20[3] = &unk_24F06B0B8;
    objc_copyWeak(&v23, v4);
    v21 = *(id *)(a1 + 32);
    v22 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    objc_msgSend(v14, "startStream:option:completion:", v13, v15, v20);

    objc_destroyWeak(&v23);
  }
LABEL_11:

}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_62(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
    dispatch_group_leave(v1);
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_loadWeakRetained(v4);
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v14 = v8;
        v15 = 2112;
        v16 = v9;
        v17 = 2112;
        v18 = a2;
        _os_log_error_impl(&dword_227C5D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ start stream failure for %@ error %@", buf, 0x20u);
LABEL_7:

      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained(v4);
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ start stream complete for %@", buf, 0x16u);
      goto LABEL_7;
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v11 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_63;
    block[3] = &unk_24F06B090;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(v11, block);
  }

}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_63(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
    dispatch_group_leave(v1);
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2_64(uint64_t a1, void *a2)
{
  id v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  int v18;
  _QWORD block[5];
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(WeakRetained, "client");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "currentSessionID");
        v18 = objc_msgSend(*(id *)(a1 + 32), "entity");
        *(_DWORD *)buf = 138544130;
        v23 = v15;
        v24 = 2048;
        v25 = v17;
        v26 = 1024;
        v27 = v18;
        v28 = 2114;
        v29 = v4;
        _os_log_error_impl(&dword_227C5D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [sessionID:%llx] Overall activation failure for entity %d error %{public}@", buf, 0x26u);

      }
      WeakRetained[12] = objc_msgSend(WeakRetained, "currentSessionID");
      if (objc_msgSend(v4, "code"))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        v20[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart");
        v20[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
        v21[0] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStreamInterrupted"), 0, v9);

      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(WeakRetained, "client");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "currentSessionID");
        v13 = objc_msgSend(*(id *)(a1 + 32), "entity");
        *(_DWORD *)buf = 138543874;
        v23 = v10;
        v24 = 2048;
        v25 = v12;
        v26 = 1024;
        v27 = v13;
        _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Overall activation complete for entity %d", buf, 0x1Cu);

      }
      WeakRetained[12] = objc_msgSend(WeakRetained, "currentSessionID");
    }
    v14 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_65;
    block[3] = &unk_24F06B090;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(v14, block);
  }

}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_65(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
    dispatch_group_leave(v1);
}

uint64_t __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
    goto LABEL_17;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      goto LABEL_8;
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "currentSessionID");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    v32 = v7;
    v33 = 2048;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    v12 = "%{public}@ [sessionID:%llx] Overall start stream failure for configuration %@ with error %@";
    v13 = v5;
    v14 = 42;
  }
  else
  {
    if (!v6)
      goto LABEL_8;
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "currentSessionID");
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v32 = v7;
    v33 = 2048;
    v34 = v15;
    v35 = 2112;
    v36 = v16;
    v12 = "%{public}@ [sessionID:%llx] Overall start stream completion for configuration %@";
    v13 = v5;
    v14 = 32;
  }
  _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);

LABEL_8:
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v17)
  {
    if (objc_msgSend(v17, "code"))
    {
      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "shouldResetConnectionForDevice:", *(_QWORD *)(a1 + 40));

      if (v19)
      {
        CMContinuityCaptureLog(2);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_loadWeakRetained(v2);
          *(_DWORD *)buf = 138543362;
          v32 = v21;
          _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ stream failed try reset", buf, 0xCu);

        }
        v22 = objc_msgSend(*(id *)(a1 + 40), "entity");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time(), CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v23;
        v29[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(WeakRetained, "hasValidStreamState"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventConnectionDisconnect"), v22, v25);

      }
    }
  }
  v26 = *(_QWORD *)(a1 + 48);
  if (v26)
    (*(void (**)(uint64_t, _QWORD))(v26 + 16))(v26, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = 0;

LABEL_17:
}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[3];
  id location;

  v8 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CMContinuityCaptureCompositeDevice_stopStream_option_completion___block_invoke;
  block[3] = &unk_24F06B158;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v13[2] = (id)a4;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __67__CMContinuityCaptureCompositeDevice_stopStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_stopStream:option:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17[3];
  id location;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CMContinuityCaptureCompositeDevice provider](self, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2080;
    v22 = "-[CMContinuityCaptureCompositeDevice _stopStream:option:completion:]";
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](captureDeviceByEntityType, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v9)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke;
    v15[3] = &unk_24F06B1D0;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a4;
    v17[2] = (id)a3;
    v16 = v8;
    objc_msgSend(v13, "stopStream:option:completion:", a3, a4, v15);

    objc_destroyWeak(v17);
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870911, 0);
    (*((void (**)(id, void *))v8 + 2))(v8, v14);

  }
  objc_destroyWeak(&location);

}

void __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  __int128 v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke_2;
    block[3] = &unk_24F06B1A8;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v11 = *(_OWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
  }

}

void __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      v5 = (*(_QWORD *)(a1 + 56) & 0x200) == 0;
    else
      v5 = 0;
    if (v5)
    {
      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
        (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }
    else
    {
      v6 = (void *)*((_QWORD *)WeakRetained + 8);
      v7 = *(_QWORD *)(a1 + 64);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke_3;
      v9[3] = &unk_24F06B180;
      v11 = *(id *)(a1 + 40);
      v10 = *(id *)(a1 + 32);
      objc_msgSend(v6, "terminateEntity:option:completion:", v7, v4, v9);

    }
  }

}

uint64_t __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)scheduleSystemPressureNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureControlSystemPressure"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:", v6);

  }
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB1B88]);

  if (v8)
  {
    -[ContinuityCaptureDeviceClient device](self->_client, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = continuityCaptureNotificationCenter_isiPhone(v10);

    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("SYSTEM_PRESSURE_TITLE_IPAD");
    if (v11)
      v13 = CFSTR("SYSTEM_PRESSURE_TITLE_IPHONE");
    v28[0] = CFSTR("kContinuityCaptureNotificationKeyTitle");
    v28[1] = CFSTR("kContinuityCaptureNotificationKeyBody");
    v14 = CFSTR("SYSTEM_PRESSURE_SHUTDOWN_IPAD");
    if (v11)
      v14 = CFSTR("SYSTEM_PRESSURE_SHUTDOWN_IPHONE");
    v29[0] = v13;
    v29[1] = v14;
    v28[2] = CFSTR("kContinuityCaptureNotificationKeyBodyArgs");
    -[ContinuityCaptureDeviceClient device](self->_client, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "deviceName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v24;
    v29[3] = MEMORY[0x24BDBD1C0];
    v28[3] = CFSTR("kContinuityCaptureNotificationKeyOneTime");
    v28[4] = CFSTR("kContinuityCaptureNotificationKeyIdentifier");
    v15 = (void *)MEMORY[0x24BDD17C8];
    -[ContinuityCaptureDeviceClient device](self->_client, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@"), CFSTR("CMContinuityCaptureSystemPressueNotification"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v19;
    v28[5] = CFSTR("kContinuityCaptureNotificationKeyDeviceModel");
    -[ContinuityCaptureDeviceClient device](self->_client, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deviceModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[5] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scheduleNotification:data:", 7, v22);

  }
  else
  {
    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unscheduleNotification:", 7);

  }
}

- (void)scheduleBatteryLevelNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  NSObject *v49;
  _BOOL4 v50;
  int v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[4];

  v64[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureControlBatteryLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureControlBatteryState"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
    goto LABEL_39;
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryLevel"));

  if (!v11)
    goto LABEL_39;
  objc_msgSend(v6, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  objc_msgSend(v4, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  v52 = v8;
  objc_msgSend(v8, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v18, "intValue");

  -[CMContinuityCaptureCompositeDevice client](self, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deviceModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = continuityCaptureNotificationCenter_isiPhone(v21);

  v50 = v22;
  if (v14 > 0.05 && v17 <= 0.05 && v17 > 0.0)
  {
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "deviceName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v25;
    objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24F07FC88, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("kContinuityCaptureNotificationKeyBodyArgs"));

LABEL_19:
    goto LABEL_20;
  }
  if (v14 > 0.1 && v17 <= 0.1 && v17 > 0.05)
  {
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "deviceName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v28;
    objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24F07FC98, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v29;
    v30 = (void *)MEMORY[0x24BDBCE30];
    v31 = v63;
LABEL_18:
    objc_msgSend(v30, "arrayWithObjects:count:", v31, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("kContinuityCaptureNotificationKeyBodyArgs"));

    goto LABEL_19;
  }
  if (v14 > 0.2 && v17 <= 0.2 && v17 > 0.1)
  {
    -[CMContinuityCaptureCompositeDevice client](self, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "deviceName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v28;
    objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24F07FCA8, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v29;
    v30 = (void *)MEMORY[0x24BDBCE30];
    v31 = v62;
    goto LABEL_18;
  }
LABEL_20:
  v8 = v52;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kContinuityCaptureNotificationKeyBodyArgs"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33 || v51 != 4 && v51 != 1)
  {
LABEL_28:

    goto LABEL_29;
  }

  if (v17 < v14)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("CONTINUITY_CAPTURE_TITLE"), CFSTR("kContinuityCaptureNotificationKeyTitle"));
    if (v50)
      v35 = CFSTR("BATTERY_LEVEL_BODY_IPHONE");
    else
      v35 = CFSTR("BATTERY_LEVEL_BODY_IPAD");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("kContinuityCaptureNotificationKeyBody"));
    v36 = (void *)MEMORY[0x24BDD17C8];
    -[ContinuityCaptureDeviceClient device](self->_client, "device");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "deviceIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "UUIDString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("%@%@"), CFSTR("CMContinuityCaptureBatteryNotification"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("kContinuityCaptureNotificationKeyIdentifier"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("kContinuityCaptureNotificationKeyOneTime"));
    -[ContinuityCaptureDeviceClient device](self->_client, "device");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "deviceModel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("kContinuityCaptureNotificationKeyDeviceModel"));

    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "scheduleNotification:data:", 6, v5);
    goto LABEL_28;
  }
LABEL_29:
  objc_msgSend(v4, "value");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v43);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v54 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "setValueForControl:completion:", v4, 0);
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v46);
  }

  CMContinuityCaptureLog(2);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v58 = self;
    v59 = 2112;
    v60 = v6;
    _os_log_impl(&dword_227C5D000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ Battery Level %@ updated", buf, 0x16u);
  }

LABEL_39:
}

- (void)handleBatteryState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureControlBatteryState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v7 == 2)
    {
      +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unscheduleNotification:", 6);

    }
    objc_msgSend(v4, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:", v9);

    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Battery state %@ updated", buf, 0x16u);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "setValueForControl:completion:", v4, 0);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (void)handleRemoteSystemNotificationControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  char isKindOfClass;
  NSObject *v27;
  int v28;
  CMContinuityCaptureCompositeDevice *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      objc_msgSend(v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("kCMContinuityCaptureControlSystemPressure"));

      if (v8)
      {
        -[CMContinuityCaptureCompositeDevice scheduleSystemPressureNotification:](self, "scheduleSystemPressureNotification:", v5);
        goto LABEL_24;
      }
      objc_msgSend(v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryLevel"));

      if (v10)
      {
        -[CMContinuityCaptureCompositeDevice scheduleBatteryLevelNotification:](self, "scheduleBatteryLevelNotification:", v5);
        goto LABEL_24;
      }
      objc_msgSend(v5, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryState"));

      if (v12)
      {
        -[CMContinuityCaptureCompositeDevice handleBatteryState:](self, "handleBatteryState:", v5);
        goto LABEL_24;
      }
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("kCMContinuityCaptureControlIncomingCall"));

      if (v14)
      {
        objc_msgSend(v5, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          goto LABEL_24;
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138543362;
          v29 = self;
          v17 = "%{public}@ Invalid call data";
LABEL_29:
          _os_log_impl(&dword_227C5D000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v28, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v5, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("kCMContinuityCaptureControlIncomingCallComplete"));

        if (v19)
        {
          objc_msgSend(v5, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "unscheduleNotification:", 4);

            +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "unscheduleNotification:", 5);

            goto LABEL_24;
          }
          CMContinuityCaptureLog(2);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v28 = 138543362;
            v29 = self;
            v17 = "%{public}@ Invalid call data";
            goto LABEL_29;
          }
        }
        else
        {
          objc_msgSend(v5, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("kCMContinuityCaptureControlDebugInfo"));

          if (!v24)
            goto LABEL_24;
          objc_msgSend(v5, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            if (CMContinityCaptureDebugLogEnabled())
            {
              CMContinuityCaptureLog(2);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                -[CMContinuityCaptureCompositeDevice handleRemoteSystemNotificationControl:].cold.1((uint64_t)self, v5, v27);

            }
            objc_msgSend(v5, "value");
            v16 = objc_claimAutoreleasedReturnValue();
            -[CMContinuityCaptureCompositeDevice logRemoteSessionSummary:](self, "logRemoteSessionSummary:", v16);
            goto LABEL_23;
          }
          CMContinuityCaptureLog(2);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v28 = 138543362;
            v29 = self;
            v17 = "%{public}@ Invalid control data";
            goto LABEL_29;
          }
        }
      }
LABEL_23:

    }
  }
LABEL_24:

}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *captureDeviceByEntityType;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  CMContinuityCaptureCompositeDevice *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "entity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](captureDeviceByEntityType, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v6, "entity") == 4)
  {
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_INFO, "%@ system notification for %@", (uint8_t *)&v12, 0x16u);
    }

    -[CMContinuityCaptureCompositeDevice handleRemoteSystemNotificationControl:](self, "handleRemoteSystemNotificationControl:", v6);
  }
  else if (v10)
  {
    objc_msgSend(v10, "setValueForControl:completion:", v6, v7);
  }

}

- (void)postValueChangeForControl:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CMContinuityCaptureCompositeDevice_postValueChangeForControl___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__CMContinuityCaptureCompositeDevice_postValueChangeForControl___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setValueForControl:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global);
    WeakRetained = v3;
  }

}

- (void)synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  NSMutableDictionary *captureDeviceByEntityType;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](captureDeviceByEntityType, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "didCaptureStillImage:entity:", v9, a4);
  }

}

- (unint64_t)currentSessionID
{
  return -[ContinuityCaptureDeviceClient currentSessionID](self->_client, "currentSessionID");
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContinuityCaptureDeviceClient device](self->_client, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)debugInfo
{
  return 0;
}

- (void)_handlePlacementStepSkipped
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  CMContinuityCaptureCompositeDevice *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureControlCameraReadyToUnhide"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToNumber:", MEMORY[0x24BDBD1C8]) & 1) == 0)
    {
      objc_msgSend(v4, "setValue:", MEMORY[0x24BDBD1C8]);
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v18 = self;
        v19 = 2082;
        v20 = "-[CMContinuityCaptureCompositeDevice _handlePlacementStepSkipped]";
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s updated value for %@", buf, 0x20u);
      }

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[NSMutableDictionary allValues](self->_captureDeviceByEntityType, "allValues", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setValueForControl:completion:", v4, 0);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
  }
  else
  {
    v5 = 0;
  }

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
  -[CMContinuityCaptureCompositeDevice controls](self, "controls", 0);
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

- (CMContinuityCaptureProvider)provider
{
  return (CMContinuityCaptureProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (NSString)publishTime
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishTime, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong(&self->_undeferBlockForSidecarClient, 0);
  objc_destroyWeak((id *)&self->_deviceStatusObserverDevice);
  objc_storeStrong(&self->_pendingTerminationTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_streamingIntentEntities, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_remoteSessionLogs, 0);
  objc_storeStrong((id *)&self->_connectionSwitchLogs, 0);
  objc_storeStrong((id *)&self->_cmControlByName, 0);
  objc_storeStrong((id *)&self->_captureDeviceByEntityType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)handleRemoteSystemNotificationControl:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_227C5D000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ RemoteSessionSummary %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
