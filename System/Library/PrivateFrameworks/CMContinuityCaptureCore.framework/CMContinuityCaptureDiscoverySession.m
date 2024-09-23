@implementation CMContinuityCaptureDiscoverySession

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  return (id)_discoverySession;
}

uint64_t __53__CMContinuityCaptureDiscoverySession_sharedInstance__block_invoke()
{
  CMContinuityCaptureDiscoverySession *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;

  v0 = [CMContinuityCaptureDiscoverySession alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.continuitycapture.discoverysession", v1);
  v3 = -[CMContinuityCaptureDiscoverySession initWithQueue:](v0, "initWithQueue:", v2);
  v4 = (void *)_discoverySession;
  _discoverySession = v3;

  return objc_msgSend((id)_discoverySession, "activate");
}

+ (void)invalidate
{
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (_discoverySession && (objc_msgSend((id)_discoverySession, "invalidated") & 1) == 0)
    dispatch_async(*(dispatch_queue_t *)(_discoverySession + 24), &__block_literal_global_7);
  objc_sync_exit(obj);

}

uint64_t __49__CMContinuityCaptureDiscoverySession_invalidate__block_invoke()
{
  return objc_msgSend((id)_discoverySession, "cancel");
}

- (CMContinuityCaptureDiscoverySession)initWithQueue:(id)a3
{
  id v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CMContinuityCaptureDiscoverySession *v22;
  NSObject *v24;
  objc_super v25;
  uint8_t buf[4];
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CMContinuityCaptureDiscoverySession;
  v6 = -[CMContinuityCaptureDiscoverySession init](&v25, sel_init);
  if (!v6)
  {
LABEL_8:
    v22 = 0;
    goto LABEL_4;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v8 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v7;

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v9;

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = (void *)*((_QWORD *)v6 + 18);
  *((_QWORD *)v6 + 18) = v11;

  objc_storeStrong((id *)v6 + 3, a3);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = (void *)*((_QWORD *)v6 + 12);
  *((_QWORD *)v6 + 12) = v13;

  v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v16 = (void *)*((_QWORD *)v6 + 17);
  *((_QWORD *)v6 + 17) = v15;

  if ((objc_msgSend(v6, "setupRPClient") & 1) == 0)
  {
    CMContinuityCaptureLog(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_227C5D000, v24, OS_LOG_TYPE_DEFAULT, "%@ rpCompanionclient setup failed", buf, 0xCu);
    }

    goto LABEL_8;
  }
  objc_msgSend(v6, "setupRPRemoteDisplayDiscovery");
  objc_msgSend(v6, "setupProxyMonitoring");
  v17 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CMContinuityCaptureCore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pathForResource:ofType:", CFSTR("UnsupportedDeviceModels_iOS15"), CFSTR("plist"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithContentsOfFile:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v6 + 8);
  *((_QWORD *)v6 + 8) = v20;

  *((_QWORD *)v6 + 11) = 1;
  *(_OWORD *)(v6 + 72) = xmmword_227CED518;
  v6[128] = FigGetCFPreferenceBooleanWithDefault() != 0;
  v22 = v6;
LABEL_4:

  return v22;
}

- (unint64_t)transportErrorFlags
{
  CMContinuityCaptureDiscoverySession *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[RPCompanionLinkClient errorFlags](v2->_rpCompanionLinkClient, "errorFlags");
  objc_sync_exit(v2);

  return v3;
}

- (id)currentUserSelectedInSessionDeviceIdentifier
{
  CMContinuityCaptureDiscoverySession *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentUserSelectedInSessionDeviceIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (id)rpRemoteDisplayDiscovery
{
  CMContinuityCaptureDiscoverySession *v2;
  RPRemoteDisplayDiscovery *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_rpRemoteDisplayDiscovery;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSessionInitiatedOnCommunalDevice
{
  return 0;
}

- (void)discardUserSelectedDeviceIfApplicableWithReason:(id)a3
{
  NSString *currentUserSelectedInSessionDeviceIdentifier;
  RPRemoteDisplayDevice *currentUserSelectedInSessionDevice;
  CMContinuityCaptureDiscoverySession *obj;

  obj = self;
  objc_sync_enter(obj);
  currentUserSelectedInSessionDeviceIdentifier = obj->_currentUserSelectedInSessionDeviceIdentifier;
  obj->_currentUserSelectedInSessionDeviceIdentifier = 0;

  currentUserSelectedInSessionDevice = obj->_currentUserSelectedInSessionDevice;
  obj->_currentUserSelectedInSessionDevice = 0;

  objc_sync_exit(obj);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%p]"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)boostDiscoveryForReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RPCompanionLinkClient *rpCompanionLinkClient;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  rpCompanionLinkClient = self->_rpCompanionLinkClient;
  if (rpCompanionLinkClient)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __74__CMContinuityCaptureDiscoverySession_boostDiscoveryForReason_completion___block_invoke;
    v10[3] = &unk_24F06B3C8;
    objc_copyWeak(&v13, &location);
    v11 = v6;
    v12 = v7;
    -[RPCompanionLinkClient triggerEnhancedDiscoveryForReason:useCase:completion:](rpCompanionLinkClient, "triggerEnhancedDiscoveryForReason:useCase:completion:", v11, 131079, v10);

    objc_destroyWeak(&v13);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870911, 0);
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
  objc_destroyWeak(&location);

}

void __74__CMContinuityCaptureDiscoverySession_boostDiscoveryForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CMContinuityCaptureLog(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543874;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ triggerEnhancedDiscovery ForReason %@ Error %@", (uint8_t *)&v7, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setupProxyMonitoring
{
  CMContinuityCaptureProximityMonitor *v3;
  CMContinuityCaptureProximityMonitor *proximityMonitor;

  v3 = -[CMContinuityCaptureProximityMonitor initWithQueue:delegate:]([CMContinuityCaptureProximityMonitor alloc], "initWithQueue:delegate:", self->_queue, self);
  proximityMonitor = self->_proximityMonitor;
  self->_proximityMonitor = v3;

}

- (void)setupRPRemoteDisplayDiscovery
{
  id v3;
  CMContinuityCaptureDiscoverySession *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x24BE7CC40]);
  v4 = self;
  objc_sync_enter(v4);
  objc_storeStrong((id *)&v4->_rpRemoteDisplayDiscovery, v3);
  objc_sync_exit(v4);

  objc_msgSend(v3, "setDispatchQueue:", v4->_queue);
  objc_msgSend(v3, "setDiscoveryFlags:", objc_msgSend(v3, "discoveryFlags") | 3);
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke;
  v16[3] = &unk_24F06B3F0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "setDeviceFoundHandler:", v16);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_33;
  v14[3] = &unk_24F06B3F0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "setDeviceLostHandler:", v14);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_34;
  v12[3] = &unk_24F06B418;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v3, "setDeviceChangedHandler:", v12);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_36;
  v10[3] = &unk_24F06B3F0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setDedicatedDeviceChangedHandler:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_37;
  v8[3] = &unk_24F06B3F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setDeviceSelectedHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_38;
  v6[3] = &unk_24F06B440;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setDiscoverySessionStateChangedHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v4);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ New Device %{public}@ added", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(WeakRetained, "updateState");
  }

}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v4);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Current Device %{public}@ lost", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(WeakRetained, "updateState");
  }

}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_34(uint64_t a1, void *a2, int a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_loadWeakRetained(v6);
      v10 = 138543874;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      v14 = 1024;
      v15 = a3;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Device %{public}@ device state changed %x", (uint8_t *)&v10, 0x1Cu);

    }
    objc_msgSend(WeakRetained, "updateState");
  }

}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v4);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Dedicated Device changed %{public}@", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(WeakRetained, "updateState");
  }

}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v4);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Device Selected %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_38(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id *v19;
  void *v20;
  id v21;
  int v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_13;
  CMContinuityCaptureLog(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_loadWeakRetained(v6);
    *(_DWORD *)buf = 138543874;
    v24 = v9;
    v25 = 1024;
    v26 = a2;
    v27 = 2114;
    v28 = v5;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Session state changed to %d for device %{public}@", buf, 0x1Cu);

  }
  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_8;
  v12 = (void *)v11;
  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
  v22 = a2;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", v5);

  a2 = v22;
  if (v22 == 1 && (v18 & 1) == 0)
  {
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopCurrentSession:syncOnOwnedQueue:", CFSTR("Device switch"), 1);
LABEL_8:

  }
  v19 = (id *)WeakRetained;
  objc_sync_enter(v19);
  if (a2 == 1)
    v20 = v5;
  else
    v20 = 0;
  objc_storeStrong(v19 + 14, v20);
  v21 = v19[15];
  v19[15] = 0;

  objc_sync_exit(v19);
  objc_msgSend(v19, "updateState");
LABEL_13:

}

- (void)addSidebandMessageNotificationHandler:(id)a3 forDeviceIdentifier:(id)a4
{
  id v6;
  CMContinuityCaptureDiscoverySession *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9 && v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = (void *)MEMORY[0x22E2A7CB0](v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_sidebandNotificationHandlersForIdentifier, "setObject:forKeyedSubscript:", v8, v6);

    objc_sync_exit(v7);
  }

}

- (void)removeSidebandMessageNotificationHandlerForDeviceIdentifier:(id)a3
{
  CMContinuityCaptureDiscoverySession *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](v4->_sidebandNotificationHandlersForIdentifier, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (BOOL)validateSessionInfoForEvent:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  char v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  CMContinuityCaptureDiscoverySession *v32;
  uint8_t buf[4];
  CMContinuityCaptureDiscoverySession *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientShieldSessionIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientEventOriginTimeInNativeClockKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureLog(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v34 = self;
    v35 = 2114;
    v36 = v11;
    v37 = 2114;
    v38 = v7;
    v39 = 2114;
    v40 = v8;
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ received shield sessionID %{public}@ originTime %{public}@", buf, 0x2Au);

  }
  v32 = self;

  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject activeSession](v12, "activeSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activeSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shieldSessionID");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

      v25 = 1;
LABEL_20:

      goto LABEL_21;
    }
    v4 = (void *)v15;
    v30 = v14;
    if (!v7)
      goto LABEL_15;
  }
  else if (!v7)
  {
    goto LABEL_16;
  }
  v31 = v8;
  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shieldSessionID");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    v8 = v31;
    if (v13)
    {
LABEL_15:

    }
LABEL_16:

LABEL_17:
    CMContinuityCaptureLog(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v32;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ out of session event %@", buf, 0x16u);
    }
    v25 = 0;
    goto LABEL_20;
  }
  v19 = (void *)v18;
  v29 = v6;
  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activeSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "shieldSessionID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  v24 = v22;
  v28 = v23;
  v27 = objc_msgSend(v22, "isEqualToString:");

  if (v13)
  {

  }
  v7 = v28;
  v6 = v29;
  v8 = v31;
  if ((v27 & 1) == 0)
    goto LABEL_17;
  v25 = 1;
LABEL_21:

  return v25;
}

- (BOOL)setupRPClient
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  CMContinuityCaptureDiscoverySession *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location[2];

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v3 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
  v4 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke;
  v18[3] = &unk_24F06AE60;
  objc_copyWeak(&v19, location);
  v5 = (void *)MEMORY[0x22E2A7CB0](v18);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_42;
  v16[3] = &unk_24F06AE60;
  objc_copyWeak(&v17, location);
  v6 = (void *)MEMORY[0x22E2A7CB0](v16);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_43;
  v13[3] = &unk_24F06AE88;
  objc_copyWeak(&v15, location);
  v7 = v3;
  v14 = v7;
  v8 = (void *)MEMORY[0x22E2A7CB0](v13);
  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    objc_storeStrong((id *)&v9->_rpCompanionLinkClient, v3);
    objc_sync_exit(v9);

    objc_msgSend(v7, "setDispatchQueue:", v9->_queue);
    objc_msgSend(v7, "setInvalidationHandler:", v5);
    objc_msgSend(v7, "setInterruptionHandler:", v6);
    objc_msgSend(v7, "setErrorFlagsChangedHandler:", v8);
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_44;
    v11[3] = &unk_24F06B468;
    objc_copyWeak(&v12, location);
    objc_msgSend(v7, "registerEventID:options:handler:", CFSTR("ContinuityCaptureCompanionSessionEventID"), 0, v11);
    objc_destroyWeak(&v12);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
  return v7 != 0;
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%@ Client Invalidated", (uint8_t *)&v4, 0xCu);

  }
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_42(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%@ Rapport Client Interrupted", (uint8_t *)&v4, 0xCu);

  }
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_msgSend(*(id *)(a1 + 32), "errorFlags");
    v7 = 138412546;
    v8 = WeakRetained;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%@ Client ErrorChange, newError %llu", (uint8_t *)&v7, 0x16u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "updateState");

}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  id *v7;
  id *WeakRetained;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  NSObject *v26;
  id *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  id *v31;
  NSObject *v32;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  BOOL v66;
  void *v67;
  void *v68;
  BOOL v69;
  char v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id *v76;
  void *v77;
  BOOL v78;
  void (**v79)(_QWORD, _QWORD, _QWORD);
  id *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  int v85;
  const __CFString *v86;
  void *v87;
  __CFString *v88;
  _QWORD v89[4];
  id v90;
  _QWORD block[4];
  id v92;
  _QWORD v93[4];
  id v94;
  uint8_t buf[4];
  id *v96;
  __int16 v97;
  __CFString *v98;
  __int16 v99;
  const __CFString *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  int v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      CMContinuityCaptureLog(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v80 = (id *)objc_loadWeakRetained(v7);
        *(_DWORD *)buf = 138412802;
        v96 = v80;
        v97 = 2112;
        v98 = v5;
        v99 = 2112;
        v100 = v6;
        _os_log_debug_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEBUG, "%@ Client Event %@ Option %@", buf, 0x20u);

      }
    }
    -[__CFString objectForKey:](v5, "objectForKey:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v6)
      {
        v11 = *MEMORY[0x24BE7CD00];
        -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x24BE7CD00]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11);
          v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v88 = 0;
        }

      }
      else
      {
        v88 = 0;
      }
      CMContinuityCaptureLog(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (id *)objc_loadWeakRetained(v7);
        *(_DWORD *)buf = 138412546;
        v96 = v14;
        v97 = 2112;
        v98 = v88;
        _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%@ deviceIdentifier %@", buf, 0x16u);

      }
      objc_msgSend(WeakRetained, "_deviceForIdentifier:", v88);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "integerValue") == 3)
      {
        -[__CFString objectForKey:](v5, "objectForKey:", CFSTR("ContinuityCaptureRapportClientEventNameKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (!v17)
        {
          -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientEventNameKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("kCMContinuityCaptureEventUserDisconnect"));

          if (!v19)
            goto LABEL_80;
          -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientUserDisconnectReasonKey"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientUserDisconnectReasonKey"));
            v86 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v86 = CFSTR("Unknown");
          }
          CMContinuityCaptureLog(0);
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = (id *)objc_loadWeakRetained(v7);
            *(_DWORD *)buf = 138412802;
            v96 = v42;
            v97 = 2114;
            v98 = v88;
            v99 = 2114;
            v100 = v86;
            _os_log_impl(&dword_227C5D000, v41, OS_LOG_TYPE_DEFAULT, "%@ User Disconnect for %{public}@ reason %{public}@", buf, 0x20u);

          }
          v85 = objc_msgSend(WeakRetained, "validateSessionInfoForEvent:", v5);
          +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "activeSession");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "activeSession");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "device");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "deviceIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "UUIDString");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v49, "isEqualToString:", v88);

            if (!v81)
              goto LABEL_49;
            +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stopCurrentSession:syncOnOwnedQueue:", v86, 1);
          }

LABEL_49:
          if (v87)
            v50 = v85;
          else
            v50 = 0;
          if (v50 == 1)
          {
            objc_msgSend(WeakRetained, "queue");
            v51 = objc_claimAutoreleasedReturnValue();
            v93[0] = MEMORY[0x24BDAC760];
            v93[1] = 3221225472;
            v93[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_47;
            v93[3] = &unk_24F06AEB0;
            v94 = v87;
            dispatch_async(v51, v93);

          }
          goto LABEL_78;
        }
      }
      else
      {

      }
      -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "integerValue") == 6
        && (-[__CFString objectForKey:](v5, "objectForKey:", CFSTR("ContinuityCaptureRapportClientEventCapabilitiesPayloadKey")), (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientEventCapabilitiesPayloadKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientEventCapabilitiesPayloadKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          CMContinuityCaptureLog(0);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = (id *)objc_loadWeakRetained(v7);
            *(_DWORD *)buf = 138412546;
            v96 = v27;
            v97 = 2114;
            v98 = v88;
            _os_log_impl(&dword_227C5D000, v26, OS_LOG_TYPE_DEFAULT, "%@ Received camera capabilities for %{public}@", buf, 0x16u);

          }
          if (v88)
          {
            objc_msgSend(WeakRetained[2], "objectForKey:");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28 == 0;

            if (!v29)
            {
              CMContinuityCaptureLog(0);
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v31 = (id *)objc_loadWeakRetained(v7);
                *(_DWORD *)buf = 138412290;
                v96 = v31;
                _os_log_impl(&dword_227C5D000, v30, OS_LOG_TYPE_DEFAULT, "%@ update device state with new set of capabilities", buf, 0xCu);

              }
              objc_msgSend(WeakRetained[2], "setObject:forKeyedSubscript:", v25, v88);
              objc_msgSend(WeakRetained, "queue");
              v32 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_48;
              block[3] = &unk_24F06AE60;
              objc_copyWeak(&v92, v7);
              dispatch_async(v32, block);

              objc_destroyWeak(&v92);
            }
          }
          goto LABEL_79;
        }
      }
      else
      {

      }
      -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "integerValue") == 4;

      if (v34)
      {
        CMContinuityCaptureLog(0);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v96 = WeakRetained;
          v97 = 2114;
          v98 = v88;
          _os_log_impl(&dword_227C5D000, v35, OS_LOG_TYPE_DEFAULT, "%@ Received skip placement step for %{public}@", buf, 0x16u);
        }

        if (!v87)
          goto LABEL_80;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || !objc_msgSend(WeakRetained, "validateSessionInfoForEvent:", v5))
        {
          goto LABEL_80;
        }
        objc_msgSend(v87, "queue");
        v36 = objc_claimAutoreleasedReturnValue();
        v89[0] = MEMORY[0x24BDAC760];
        v89[1] = 3221225472;
        v89[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_50;
        v89[3] = &unk_24F06AEB0;
        v90 = v87;
        dispatch_async(v36, v89);

        v25 = v90;
        goto LABEL_79;
      }
      -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientMessageTypeKey"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "integerValue") == 2;

      if (!v38)
        goto LABEL_80;
      -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientShieldSessionIDKey"));
      v86 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureRapportClientEventOriginTimeInNativeClockKey"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v39;
      if (v39)
      {
        CMContinuityCaptureGetDateFromTimeString(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = 0;
      }
      v52 = *MEMORY[0x24BE7CD08];
      -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x24BE7CD08]);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {

      }
      else
      {
        -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54 == 0;

        if (v55)
        {
          +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance", 0);
          goto LABEL_62;
        }
      }
      -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v52);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
        v57 = v6;
      else
        v57 = v5;
      -[__CFString objectForKeyedSubscript:](v57, "objectForKeyedSubscript:", v52);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = CMContinuityCaptureDeviceModelFromModelString();

      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance", v82);
LABEL_62:
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "activeSession");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "shieldSessionID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "activeSession");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "shieldSessionIDGeneratedTime");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      CMContinuityCaptureLog(0);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413826;
        v96 = WeakRetained;
        v97 = 2114;
        v98 = v88;
        v99 = 2114;
        v100 = v86;
        v101 = 2114;
        v102 = v40;
        v103 = 1024;
        v104 = v83;
        v105 = 2114;
        v106 = v61;
        v107 = 2114;
        v108 = v64;
        _os_log_impl(&dword_227C5D000, v65, OS_LOG_TYPE_DEFAULT, "%@ Received shield launched event for %{public}@ shieldID %{public}@ generatedTime %{public}@ deviceModel %d. activeSession shieldID %{public}@ generatedTime %{public}@", buf, 0x44u);
      }

      v66 = 0;
      if (v64 && v40)
        v66 = objc_msgSend(v64, "compare:", v40) == 1;
      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "activeSession");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
        v69 = v86 == 0;
      else
        v69 = 1;
      v70 = v69 || v66;
      if ((v70 & 1) == 0)
      {
        v71 = objc_msgSend(v61, "isEqualToString:");

        if ((v71 & 1) != 0)
        {
LABEL_77:

LABEL_78:
          v25 = (void *)v86;
LABEL_79:

LABEL_80:
          v76 = WeakRetained;
          objc_sync_enter(v76);
          if (v88)
          {
            objc_msgSend(v76[18], "objectForKey:", v88);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v77 == 0;

            if (!v78)
            {
              objc_msgSend(v76[18], "objectForKeyedSubscript:", v88);
              v79 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, __CFString *, __CFString *))v79)[2](v79, v88, v5);

            }
          }
          objc_sync_exit(v76);

          goto LABEL_84;
        }
        +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "activeSession");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setShieldSessionID:", v86);

        +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "activeSession");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setShieldSessionIDGeneratedTime:", v40);

        +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "activeSession");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setDeviceModel:", v83);
      }

      goto LABEL_77;
    }
  }
LABEL_84:

}

uint64_t __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserDisconnected:", 1);
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_48(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateState");
    WeakRetained = v2;
  }

}

uint64_t __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlacementStepSkipped:", 1);
}

- (NSArray)availableClientDevices
{
  CMContinuityCaptureDiscoverySession *v2;
  NSDictionary *availableClientDeviceByIdentifiers;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  availableClientDeviceByIdentifiers = v2->_availableClientDeviceByIdentifiers;
  if (availableClientDeviceByIdentifiers)
  {
    -[NSDictionary allValues](availableClientDeviceByIdentifiers, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (id)_deviceForIdentifier:(id)a3
{
  id v4;
  CMContinuityCaptureDiscoverySession *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSDictionary objectForKey:](v5->_availableClientDeviceByIdentifiers, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)device:(id)a3 isNearby:(BOOL)a4
{
  int v4;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  CMContinuityCaptureDiscoverySession *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CMContinuityCaptureDiscoverySession _deviceForIdentifier:](self, "_deviceForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureDiscoverySession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v7 || objc_msgSend(v7, "nearby") != v4)
  {
    CMContinuityCaptureLog(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "LEFT";
      v11 = 138412802;
      v12 = self;
      if (v4)
        v10 = "ENTERED";
      v13 = 2114;
      v14 = v6;
      v15 = 2082;
      v16 = v10;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%@ device %{public}@ %{public}s nearby range", (uint8_t *)&v11, 0x20u);
    }

    -[CMContinuityCaptureDiscoverySession updateState](self, "updateState");
  }

}

- (void)activate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDiscoverySession *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureDiscoverySession activate]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CMContinuityCaptureDiscoverySession_activate__block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__CMContinuityCaptureDiscoverySession_activate__block_invoke(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  _BYTE *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[32])
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ ContinuityCapture error : discovery client already activated"), *(_QWORD *)(a1 + 32));
    v4[32] = 1;
    v5 = (void *)*((_QWORD *)v4 + 5);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__CMContinuityCaptureDiscoverySession_activate__block_invoke_2;
    v7[3] = &unk_24F06AFC8;
    objc_copyWeak(&v8, v2);
    objc_msgSend(v5, "activateWithCompletion:", v7);
    +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v4, CFSTR("state"), 3, 0);

    objc_destroyWeak(&v8);
  }

}

void __47__CMContinuityCaptureDiscoverySession_activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v3 && objc_msgSend(v3, "code"))
    {
      CMContinuityCaptureLog(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v3;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ RPClient ActivateWithCompletion error %@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(WeakRetained, "rpRemoteDisplayDiscovery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __47__CMContinuityCaptureDiscoverySession_activate__block_invoke_57;
      v9[3] = &unk_24F06AFC8;
      objc_copyWeak(&v10, v4);
      objc_msgSend(v8, "activateWithCompletion:", v9);

      objc_destroyWeak(&v10);
    }
  }

}

void __47__CMContinuityCaptureDiscoverySession_activate__block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v4);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ RPRemoteDisplayDiscovery ActivateWithCompletion error %@", (uint8_t *)&v9, 0x16u);

    }
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopCurrentSession:syncOnOwnedQueue:", CFSTR("ContinuityCaptureAgent launch"), 1);

    objc_msgSend(WeakRetained, "updateState");
  }

}

- (void)cancel
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDiscoverySession *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureDiscoverySession cancel]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CMContinuityCaptureDiscoverySession_cancel__block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __45__CMContinuityCaptureDiscoverySession_cancel__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    if (!WeakRetained[32])
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ ContinuityCapture error : discovery client already cancelled"), *(_QWORD *)(a1 + 32));
      WeakRetained = v10;
    }
    WeakRetained[32] = 0;
    v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = (void *)v3[5];
    if (v4)
    {
      objc_msgSend(v4, "invalidate");
      v5 = (void *)v3[5];
      v3[5] = 0;

    }
    objc_sync_exit(v3);

    v6 = v3;
    objc_sync_enter(v6);
    v7 = (void *)v6[6];
    if (v7)
    {
      objc_msgSend(v7, "invalidate");
      v8 = (void *)v6[6];
      v6[6] = 0;

    }
    objc_sync_exit(v6);

    +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:forKeyPath:context:", v6, CFSTR("state"), 0);

    *((_BYTE *)v6 + 104) = 1;
    WeakRetained = v10;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *queue;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  void *v46;
  _QWORD v47[6];
  _QWORD v48[6];
  _BYTE buf[12];
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  CMContinuityCaptureLog(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = self;
    v50 = 2080;
    v51 = "-[CMContinuityCaptureDiscoverySession observeValueForKeyPath:ofObject:change:context:]";
    v52 = 2114;
    v53 = v9;
    v54 = 2114;
    v55 = v10;
    _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@ %{public}@", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("state")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue") == 1;

    if (v14)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_24F06AE60;
      objc_copyWeak(&v45, (id *)buf);
      dispatch_async(queue, block);
      objc_destroyWeak(&v45);
    }
    goto LABEL_20;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("userDisconnected")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if ((v18 & 1) == 0)
      {
        v19 = self->_queue;
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v41[3] = &unk_24F06AE88;
        objc_copyWeak(&v43, (id *)buf);
        v20 = v10;
        v42 = v20;
        dispatch_async(v19, v41);
        objc_msgSend(v20, "deviceModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = continuityCaptureNotificationCenter_isiPhone(v21);

        +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("DISCONNECT_NOTIFICATION_TITLE_IPAD");
        if (v22)
          v23 = CFSTR("DISCONNECT_NOTIFICATION_TITLE_IPHONE");
        v48[0] = v23;
        v47[0] = CFSTR("kContinuityCaptureNotificationKeyTitle");
        v47[1] = CFSTR("kContinuityCaptureNotificationKeyTitleArgs");
        objc_msgSend(v20, "deviceName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = CFSTR("DISCONNECT_NOTIFICATION_BODY_IPAD");
        if (v22)
          v27 = CFSTR("DISCONNECT_NOTIFICATION_BODY_IPHONE");
        v48[1] = v25;
        v48[2] = v27;
        v47[2] = CFSTR("kContinuityCaptureNotificationKeyBody");
        v47[3] = CFSTR("kContinuityCaptureNotificationKeyIdentifier");
        v28 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v20, "deviceIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("%@%@"), CFSTR("CMContinuityCaptureDisconnectNotification"), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v48[3] = v31;
        v48[4] = MEMORY[0x24BDBD1C8];
        v47[4] = CFSTR("kContinuityCaptureNotificationKeyOneTime");
        v47[5] = CFSTR("kContinuityCaptureNotificationKeyDeviceModel");
        objc_msgSend(v20, "deviceModel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v48[5] = v32;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 6);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "scheduleNotification:data:", 1, v33);

        objc_destroyWeak(&v43);
        goto LABEL_20;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("streamIntent")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "BOOLValue");

      if (v36)
      {
        v37 = self->_queue;
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
        v39[3] = &unk_24F06AE60;
        objc_copyWeak(&v40, (id *)buf);
        dispatch_async(v37, v39);
        objc_destroyWeak(&v40);
      }
    }
  }
LABEL_20:
  objc_destroyWeak((id *)buf);

}

void __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "showIncompatableDeviceNotificationIfApplicable");
    WeakRetained = v2;
  }

}

void __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeSession");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activeSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToString:", v12);

      if (!v13)
      {
LABEL_6:
        objc_msgSend(v14, "updateState");
        WeakRetained = v14;
        goto LABEL_7;
      }
      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stopCurrentSession:syncOnOwnedQueue:", CFSTR("User disconnect"), 1);
    }

    goto LABEL_6;
  }
LABEL_7:

}

void __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateState");
    WeakRetained = v2;
  }

}

+ (id)rapportDeviceIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "idsDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "idsDeviceIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(v4, "idsDeviceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_5;
LABEL_6:

  return v6;
}

- (BOOL)isUserSelectedDeviceIfApplicable:(id)a3
{
  return 1;
}

- (id)currentDeviceList
{
  int CFPreferenceBooleanWithDefault;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v27;
  CMContinuityCaptureDiscoverySession *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  uint8_t buf[4];
  CMContinuityCaptureDiscoverySession *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  CFPreferenceBooleanWithDefault = FigGetCFPreferenceBooleanWithDefault();
  -[CMContinuityCaptureDiscoverySession rpRemoteDisplayDiscovery](self, "rpRemoteDisplayDiscovery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (CFPreferenceBooleanWithDefault)
  {
    v6 = objc_msgSend(v4, "currentState");

    if (v6)
    {
      -[CMContinuityCaptureDiscoverySession currentUserSelectedInSessionDeviceIdentifier](self, "currentUserSelectedInSessionDeviceIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_17;
      v8 = (void *)v7;
      -[CMContinuityCaptureDiscoverySession currentUserSelectedInSessionDeviceIdentifier](self, "currentUserSelectedInSessionDeviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureDiscoverySession rpRemoteDisplayDiscovery](self, "rpRemoteDisplayDiscovery");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "peerDeviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        -[CMContinuityCaptureDiscoverySession rpRemoteDisplayDiscovery](self, "rpRemoteDisplayDiscovery", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "discoveredDevices");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v30;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v30 != v16)
                objc_enumerationMutation(v5);
              v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v18, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[CMContinuityCaptureDiscoverySession rpRemoteDisplayDiscovery](self, "rpRemoteDisplayDiscovery");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "peerDeviceIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v19, "isEqualToString:", v21);

              if (v22)
              {
                CMContinuityCaptureLog(0);
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v35 = self;
                  v36 = 2114;
                  v37 = v18;
                  _os_log_impl(&dword_227C5D000, v27, OS_LOG_TYPE_DEFAULT, "%@ found selected device %{public}@", buf, 0x16u);
                }

                v28 = self;
                objc_sync_enter(v28);
                objc_storeStrong((id *)&v28->_currentUserSelectedInSessionDevice, v18);
                objc_sync_exit(v28);

                v33 = v18;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
                v24 = objc_claimAutoreleasedReturnValue();
                goto LABEL_16;
              }
            }
            v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
            if (v15)
              continue;
            break;
          }
        }

        CMContinuityCaptureLog(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureDiscoverySession currentDeviceList].cold.3(self);
      }
      else
      {
LABEL_17:
        CMContinuityCaptureLog(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureDiscoverySession currentDeviceList].cold.2(self);
      }
    }
    else
    {
      CMContinuityCaptureLog(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureDiscoverySession currentDeviceList].cold.1(self);
    }

    v25 = 0;
  }
  else
  {
    objc_msgSend(v4, "discoveredDevices");
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v25 = (void *)v24;

  }
  return v25;
}

- (id)discoveredLocalDevices
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (discoveredLocalDevices_onceToken != -1)
    dispatch_once(&discoveredLocalDevices_onceToken, &__block_literal_global_74);
  v3 = discoveredLocalDevices_localDevice;
  if (discoveredLocalDevices_localDevice)
  {
    objc_msgSend((id)discoveredLocalDevices_identifier, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

  }
  return v2;
}

void __61__CMContinuityCaptureDiscoverySession_discoveredLocalDevices__block_invoke()
{
  uint64_t v0;
  void *v1;
  CMContinuityCaptureCapabilities *v2;
  CMContinuityCaptureTransportNWDevice *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_opt_new();
  v1 = (void *)discoveredLocalDevices_identifier;
  discoveredLocalDevices_identifier = v0;

  objc_msgSend(MEMORY[0x24BDB2460], "continuityCaptureCameraCapabilities");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = -[CMContinuityCaptureCapabilities initWithDictionaryRepresentation:]([CMContinuityCaptureCapabilities alloc], "initWithDictionaryRepresentation:", v6);
    v3 = [CMContinuityCaptureTransportNWDevice alloc];
    v4 = -[CMContinuityCaptureTransportNWDevice initWithCapabilities:identifier:remote:](v3, "initWithCapabilities:identifier:remote:", v2, discoveredLocalDevices_identifier, 1);
    v5 = (void *)discoveredLocalDevices_localDevice;
    discoveredLocalDevices_localDevice = v4;

  }
}

- (id)discoveredRapportDevices
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  __int16 v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  CMContinuityCaptureTransportRapportDevice *v63;
  CMContinuityCaptureTransportRapportDevice *v64;
  void *v65;
  uint64_t v66;
  CMContinuityCaptureTransportRapportDevice *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL8 v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  int v91;
  void *v92;
  void *v93;
  id v94;
  _BOOL4 v95;
  _BOOL4 v96;
  id obj;
  _BOOL4 v98;
  int v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  void *v109;
  void *v110;
  CMContinuityCaptureTransportRapportDevice *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t buf[4];
  CMContinuityCaptureDiscoverySession *v136;
  __int16 v137;
  void *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  uint64_t v142;
  __int16 v143;
  int v144;
  __int16 v145;
  int v146;
  __int16 v147;
  _BOOL4 v148;
  __int16 v149;
  _BOOL4 v150;
  __int16 v151;
  _BOOL4 v152;
  __int16 v153;
  uint64_t v154;
  __int16 v155;
  uint64_t v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  int v162;
  _BYTE v163[128];
  _BYTE v164[128];
  uint64_t v165;

  v165 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CMContinuityCaptureDiscoverySession currentDeviceList](self, "currentDeviceList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v116 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v118 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  CMContinuityCaptureLog(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v136 = self;
    v137 = 2114;
    v138 = v3;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%@ RapportDevices : %{public}@", buf, 0x16u);
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v131, v164, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v132;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v132 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BDD16E0];
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * i), "operatingSystemVersion");
          v12 = v128;
        }
        else
        {
          v12 = 0;
          v128 = 0;
          v129 = 0;
          v130 = 0;
        }
        objc_msgSend(v11, "numberWithInteger:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "idsDeviceIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setObject:forKeyedSubscript:", v13, v14);

        v15 = (void *)MEMORY[0x24BDD16E0];
        if (v10)
        {
          objc_msgSend(v10, "operatingSystemVersion");
          v16 = v126;
        }
        else
        {
          v16 = 0;
          v125 = 0;
          v126 = 0;
          v127 = 0;
        }
        objc_msgSend(v15, "numberWithInteger:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "idsDeviceIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setObject:forKeyedSubscript:", v17, v18);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v131, v164, 16);
    }
    while (v7);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  obj = v5;
  v19 = v116;
  v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v163, 16);
  if (v112)
  {
    v107 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v112; ++j)
      {
        if (*(_QWORD *)v122 != v107)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
        +[CMContinuityCaptureDiscoverySession rapportDeviceIdentifier:](CMContinuityCaptureDiscoverySession, "rapportDeviceIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "statusFlags");
        v25 = objc_msgSend(v21, "statusFlags");
        v26 = objc_msgSend(v21, "cameraState");
        objc_msgSend(v21, "model");
        v119 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v117 = v23;
          objc_msgSend(v19, "objectForKey:", v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
          {
            CMContinuityCaptureLog(0);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v136 = self;
              v137 = 2114;
              v138 = v22;
              _os_log_impl(&dword_227C5D000, v28, OS_LOG_TYPE_DEFAULT, "%@ (%{public}@) Missing device from rp display device list", buf, 0x16u);
            }

          }
          v113 = v24 & 0x1000000;
          v114 = j;
          v108 = v25 & 0x200;
          -[CMContinuityCaptureDiscoverySession rpRemoteDisplayDiscovery](self, "rpRemoteDisplayDiscovery");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "dedicatedDevice");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "idsDeviceIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v31, "isEqual:", v22);

          v32 = -[CMContinuityCaptureProximityMonitor isDeviceNearby:](self->_proximityMonitor, "isDeviceNearby:", v22);
          objc_msgSend(v19, "objectForKeyedSubscript:", v22);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_msgSend(v33, "unsignedLongValue");

          objc_msgSend(v118, "objectForKeyedSubscript:", v22);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v34, "unsignedLongValue");

          CMContinuityCaptureLog(0);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v98 = v26 == 1;
            objc_msgSend(v21, "cameraCapabilities");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v21, "statusFlags");
            *(_DWORD *)buf = 138415618;
            v136 = self;
            v137 = 2114;
            v138 = v22;
            v139 = 2114;
            v140 = v117;
            v141 = 2114;
            v142 = v119;
            v143 = 1024;
            v144 = v113 >> 24;
            v145 = 1024;
            v146 = v108 >> 9;
            v147 = 1024;
            v148 = v98;
            v149 = 1024;
            v150 = v32;
            v151 = 1024;
            v152 = v36 != 0;
            v19 = v116;
            v153 = 2048;
            v154 = v115;
            v155 = 2048;
            v156 = v106;
            v157 = 2048;
            v158 = v21;
            v159 = 2048;
            v160 = v37;
            v161 = 1024;
            v162 = v102;
            _os_log_impl(&dword_227C5D000, v35, OS_LOG_TYPE_DEFAULT, "%@ Client Device Identifier:%{public}@ Name:%{public}@ Model:%{public}@ Wired:%d Wireless:%d Magic:%d Nearby:%d Capabilities:%d Version:%llu.%llu devicePtr:%p status:%lx isDedicated:%d", buf, 0x76u);

          }
          v38 = (void *)v119;
          if (GestaltProductTypeStringToDeviceClass() == 11)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_availableCapabilitiesByIdentifiers, "removeObjectForKey:", v22);
LABEL_104:
            j = v114;
            v23 = v117;
            goto LABEL_105;
          }
          -[CMContinuityCaptureDiscoverySession validateCapabilitiesAndCacheIncompatibleNotificationIfApplicable:majorVersion:](self, "validateCapabilitiesAndCacheIncompatibleNotificationIfApplicable:majorVersion:", v21, v115);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMContinuityCaptureDiscoverySession _deviceForIdentifier:](self, "_deviceForIdentifier:", v22);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v40)
              {
                objc_msgSend(v41, "setCapabilities:", v40);
                goto LABEL_38;
              }
            }
          }
          if (v40)
          {
LABEL_38:
            objc_msgSend(v40, "capabilitiesVersion");
            if (v120 <= 300)
            {
              CMContinuityCaptureLog(0);
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v136 = self;
                v137 = 2114;
                v138 = v22;
                v43 = v42;
                v44 = "%@ Support with sidecar for %{public}@";
                goto LABEL_87;
              }
LABEL_88:

              -[NSMutableDictionary removeObjectForKey:](self->_availableCapabilitiesByIdentifiers, "removeObjectForKey:", v22);
LABEL_103:

              goto LABEL_104;
            }
            if (objc_msgSend(v40, "userDisabled"))
            {
              CMContinuityCaptureLog(0);
              v42 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                goto LABEL_88;
              *(_DWORD *)buf = 138412546;
              v136 = self;
              v137 = 2114;
              v138 = v22;
              v43 = v42;
              v44 = "%@ skip %{public}@ device since it's disabled by user";
LABEL_87:
              _os_log_impl(&dword_227C5D000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 0x16u);
              goto LABEL_88;
            }
            v99 = 1;
          }
          else
          {
            v99 = 0;
          }
          if (!v113
            && ((-[RPCompanionLinkClient errorFlags](self->_rpCompanionLinkClient, "errorFlags") & 4) != 0 || !v108))
          {
            CMContinuityCaptureLog(0);
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v136 = self;
              v137 = 2114;
              v138 = v22;
              _os_log_impl(&dword_227C5D000, v45, OS_LOG_TYPE_DEFAULT, "%@ (%{public}@) RPError : USB inactive and WifiOff", buf, 0x16u);
            }

            if (!v108)
            {
              CMContinuityCaptureLog(0);
              v42 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                goto LABEL_88;
              *(_DWORD *)buf = 138412546;
              v136 = self;
              v137 = 2114;
              v138 = v22;
              v43 = v42;
              v44 = "%@ (%{public}@) non wired with wifip2p2 disabled";
              goto LABEL_87;
            }
          }
          +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v22, 14, 0);

          if (v41)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v95 = v32;
              CMContinuityCaptureLog(0);
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v136 = self;
                v137 = 2114;
                v138 = v41;
                v139 = 2114;
                v140 = v117;
                _os_log_impl(&dword_227C5D000, v47, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ name %{public}@ present", buf, 0x20u);
              }
              v109 = v22;

              +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "activeSession");
              v49 = objc_claimAutoreleasedReturnValue();
              if (v49)
              {
                v103 = (void *)v49;
                +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "activeSession");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "device");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "deviceIdentifier");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "UUIDString");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v91 = objc_msgSend(v53, "isEqualToString:", v109);

                if (v91)
                {
                  if (v113)
                    v54 = 2;
                  else
                    v54 = 1;
                  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "activeSession");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "setTransport:", v54);

                  goto LABEL_64;
                }
              }
              else
              {
LABEL_64:

              }
              objc_msgSend(v41, "device");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v21, "isEqual:", v56);

              if ((v57 & 1) == 0)
                objc_msgSend(v41, "resetDevice:", v21);
              v22 = v109;
              objc_msgSend(v94, "setObject:forKeyedSubscript:", v41, v109);
              objc_msgSend(v94, "objectForKeyedSubscript:", v109);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "setNearby:", v95);

              objc_msgSend(v94, "objectForKeyedSubscript:", v109);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setDeviceMajorVersion:", v115);

              objc_msgSend(v94, "objectForKeyedSubscript:", v109);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setDeviceMinorVersion:", v106);

              objc_msgSend(v94, "objectForKeyedSubscript:", v109);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "notifyDeviceStateChange");

              v19 = v116;
            }
            if (!v99)
              goto LABEL_103;
LABEL_102:
            -[CMContinuityCaptureProximityMonitor beginTracking:](self->_proximityMonitor, "beginTracking:", v22);
            goto LABEL_103;
          }
          if (!v99)
          {
            -[NSMutableDictionary objectForKey:](self->_availableCapabilitiesByIdentifiers, "objectForKey:", v22);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v73)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_availableCapabilitiesByIdentifiers, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1B8], v22);
              if (v113)
                v74 = 2;
              else
                v74 = 1;
              +[CMContinuityCaptureTransportRapportDevice queryCameraCapabilitiesFromRemoteDevice:transport:](CMContinuityCaptureTransportRapportDevice, "queryCameraCapabilitiesFromRemoteDevice:transport:", v21, v74);
            }
            goto LABEL_103;
          }
          CMContinuityCaptureLog(0);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413314;
            v136 = self;
            v137 = 2114;
            v138 = v22;
            v139 = 2114;
            v140 = v117;
            v141 = 2048;
            v142 = (uint64_t)v40;
            v143 = 1024;
            v144 = v102;
            _os_log_impl(&dword_227C5D000, v62, OS_LOG_TYPE_DEFAULT, "%@ New rapport client device %{public}@ name %{public}@ capabilities %p isDedicated: %d", buf, 0x30u);
          }

          v63 = -[CMContinuityCaptureTransportRapportDevice initWithRapportDevice:capabilities:remote:]([CMContinuityCaptureTransportRapportDevice alloc], "initWithRapportDevice:capabilities:remote:", v21, v40, 1);
          v64 = v63;
          if (v102)
            -[CMContinuityCaptureTransportRapportDevice setPlacementStepSkipped:](v63, "setPlacementStepSkipped:", 1);
          if (!v64)
          {
            CMContinuityCaptureLog(0);
            v42 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              goto LABEL_88;
            *(_DWORD *)buf = 138412546;
            v136 = self;
            v137 = 2114;
            v138 = v22;
            v43 = v42;
            v44 = "%@ Failed to create for device %{public}@";
            goto LABEL_87;
          }
          +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "activeSession");
          v66 = objc_claimAutoreleasedReturnValue();
          v96 = v32;
          if (v66)
          {
            v110 = (void *)v66;
            v104 = v65;
            v67 = v64;
            +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "activeSession");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "device");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "deviceIdentifier");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "UUIDString");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v69, "isEqualToString:", v22))
            {
              v87 = v68;
              v70 = v22;
              +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "activeSession");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "device");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = objc_msgSend(v72, "isEqual:", v67);

              v64 = v67;
              if ((v86 & 1) == 0)
              {
                +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "activeSession");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "setDevice:", v64);
                v22 = v70;
                goto LABEL_91;
              }
LABEL_93:
              +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "activeSession");
              v76 = objc_claimAutoreleasedReturnValue();
              if (v76)
              {
                v105 = (void *)v76;
                +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "activeSession");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "device");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "deviceIdentifier");
                v111 = v64;
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "UUIDString");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = objc_msgSend(v79, "isEqualToString:", v70);

                v22 = v70;
                v64 = v111;

                v80 = v96;
                if (v90)
                {
                  if (v113)
                    v81 = 2;
                  else
                    v81 = 1;
                  +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "activeSession");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "setTransport:", v81);

                  v64 = v111;
LABEL_100:

                }
                -[CMContinuityCaptureTransportRapportDevice setDeviceMajorVersion:](v64, "setDeviceMajorVersion:", v115);
                -[CMContinuityCaptureTransportRapportDevice setDeviceMinorVersion:](v64, "setDeviceMinorVersion:", v106);
                -[CMContinuityCaptureTransportRapportDevice setNearby:](v64, "setNearby:", v80);
                -[NSMutableDictionary removeObjectForKey:](self->_availableCapabilitiesByIdentifiers, "removeObjectForKey:", v22);
                objc_msgSend(v94, "setObject:forKeyedSubscript:", v64, v22);
                objc_msgSend(v94, "objectForKeyedSubscript:", v22);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "notifyDeviceStateChange");

                goto LABEL_102;
              }
              v22 = v70;
              v80 = v96;
              goto LABEL_100;
            }

            v64 = v67;
            v65 = v104;
LABEL_91:
            v70 = v22;

          }
          else
          {
            v70 = v22;
          }

          goto LABEL_93;
        }
        CMContinuityCaptureLog(0);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v136 = self;
          _os_log_impl(&dword_227C5D000, v39, OS_LOG_TYPE_DEFAULT, "%@ Missing device identifier", buf, 0xCu);
        }

        v38 = (void *)v119;
LABEL_105:

      }
      v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v163, 16);
    }
    while (v112);
  }

  return v94;
}

- (id)validateCapabilitiesAndCacheIncompatibleNotificationIfApplicable:(id)a3 majorVersion:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  CMContinuityCaptureCapabilities *v8;
  void *v9;
  CMContinuityCaptureCapabilities *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CMContinuityCaptureCapabilities *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  int v24;
  CMContinuityCaptureDiscoverySession *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CMContinuityCaptureDiscoverySession rapportDeviceIdentifier:](CMContinuityCaptureDiscoverySession, "rapportDeviceIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "cameraCapabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [CMContinuityCaptureCapabilities alloc];
      objc_msgSend(v5, "cameraCapabilities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CMContinuityCaptureCapabilities initWithDictionaryRepresentation:](v8, "initWithDictionaryRepresentation:", v9);

      if (v10)
      {
        -[NSMutableSet removeAllObjects](self->_incompatibleDeviceByNotificationData, "removeAllObjects");
LABEL_10:
        -[CMContinuityCaptureCapabilities devicesCapabilities](v10, "devicesCapabilities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {

LABEL_19:
          +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v6, 8, 1);

          +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v6, 9, 1);
LABEL_20:

          goto LABEL_21;
        }
        v21 = -[CMContinuityCaptureCapabilities userDisabled](v10, "userDisabled");

        if (v21)
          goto LABEL_19;
        v19 = v10;
LABEL_15:
        CMContinuityCaptureLog(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412802;
          v25 = self;
          v26 = 2114;
          v27 = v6;
          v28 = 2114;
          v29 = v19;
          _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%@ skip %{public}@ device since it's missing camera capabilities %{public}@", (uint8_t *)&v24, 0x20u);
        }

        v10 = 0;
        goto LABEL_20;
      }
    }
    -[NSMutableDictionary objectForKey:](self->_availableCapabilitiesByIdentifiers, "objectForKey:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11
      && (v12 = (void *)v11,
          -[NSMutableDictionary objectForKeyedSubscript:](self->_availableCapabilitiesByIdentifiers, "objectForKeyedSubscript:", v6), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "count"), v13, v12, v14))
    {
      v15 = [CMContinuityCaptureCapabilities alloc];
      -[NSMutableDictionary objectForKeyedSubscript:](self->_availableCapabilitiesByIdentifiers, "objectForKeyedSubscript:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CMContinuityCaptureCapabilities initWithDictionaryRepresentation:](v15, "initWithDictionaryRepresentation:", v16);

      CMContinuityCaptureLog(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138412546;
        v25 = self;
        v26 = 2114;
        v27 = v6;
        _os_log_impl(&dword_227C5D000, v17, OS_LOG_TYPE_DEFAULT, "%@ Use queried capabilities for %{public}@", (uint8_t *)&v24, 0x16u);
      }

      -[NSMutableSet removeAllObjects](self->_incompatibleDeviceByNotificationData, "removeAllObjects");
      if (v10)
        goto LABEL_10;
    }
    else
    {
      -[NSMutableSet removeAllObjects](self->_incompatibleDeviceByNotificationData, "removeAllObjects");
    }
    v19 = 0;
    goto LABEL_15;
  }
  v10 = 0;
LABEL_21:

  return v10;
}

- (id)discoveredCompatibleDevices:(id)a3 rapportDevices:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  CMContinuityCaptureDiscoverySession *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = objc_alloc(MEMORY[0x24BDBCEF0]);
  v9 = v5;
  objc_msgSend(v5, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithArray:", v10);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v6, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        CMContinuityCaptureLog(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v40 = self;
          v41 = 2114;
          v42 = v17;
          _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%@ Support with rapport for %{public}@", buf, 0x16u);
        }

        objc_msgSend(v11, "removeObject:", v17);
        objc_msgSend(v6, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v14);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v11, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        CMContinuityCaptureLog(0);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v40 = self;
          v41 = 2114;
          v42 = v25;
          _os_log_impl(&dword_227C5D000, v26, OS_LOG_TYPE_DEFAULT, "%@ Support with sidecar for %{public}@", buf, 0x16u);
        }

        objc_msgSend(v9, "objectForKeyedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v22);
  }

  return v7;
}

+ (void)unscheduleAllNotificationForDeviceIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v3, 8, 0);

  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v3, 9, 0);

  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v3, 13, 0);

  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v3, 14, 0);

  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v3, 2, 0);

  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v3, 3, 0);

  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v3, 1, 0);

  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unscheduleNotificationForDeviceIdentifier:type:clearHistory:", v3, 11, 0);

}

- (void)updateState
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSDictionary *availableClientDeviceByIdentifiers;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  NSDictionary *v40;
  NSDictionary *v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  NSDictionary *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  CMContinuityCaptureDiscoverySession *obj;
  void *v71;
  _QWORD v72[4];
  id v73;
  CMContinuityCaptureDiscoverySession *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD block[6];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  CMContinuityCaptureDiscoverySession *v92;
  __int16 v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[RPCompanionLinkClient errorFlags](self->_rpCompanionLinkClient, "errorFlags");
    *(_DWORD *)buf = 138412546;
    v92 = self;
    v93 = 2048;
    v94 = v4;
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ RapportErrorFlags : %llu", buf, 0x16u);
  }

  -[CMContinuityCaptureDiscoverySession discoveredLocalDevices](self, "discoveredLocalDevices");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend(v71, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v85 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        availableClientDeviceByIdentifiers = self->_availableClientDeviceByIdentifiers;
        objc_msgSend(v9, "deviceIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](availableClientDeviceByIdentifiers, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {

        }
        else
        {
          v14 = -[NSMutableSet containsObject:](self->_observedDevices, "containsObject:", v9);

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v9, "magicStateMonitor");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setupMagicStateListener");

            +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "queue");
            v17 = objc_claimAutoreleasedReturnValue();
            dispatch_assert_queue_not_V2(v17);

            +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "queue");
            v19 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __50__CMContinuityCaptureDiscoverySession_updateState__block_invoke;
            block[3] = &unk_24F06ADE8;
            block[4] = v9;
            block[5] = self;
            dispatch_async_and_wait(v19, block);

            objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("userDisconnected"), 3, 0);
            -[NSMutableSet addObject:](self->_observedDevices, "addObject:", v9);
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    }
    while (v6);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[NSDictionary allKeys](self->_availableClientDeviceByIdentifiers, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v80 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
        -[NSDictionary objectForKeyedSubscript:](self->_availableClientDeviceByIdentifiers, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "canDeferTermination") & 1) != 0)
        {
          objc_msgSend(v71, "objectForKey:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26 == 0;

          if (v27)
          {
            CMContinuityCaptureLog(0);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              -[NSDictionary objectForKeyedSubscript:](self->_availableClientDeviceByIdentifiers, "objectForKeyedSubscript:", v24);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v92 = self;
              v93 = 2114;
              v94 = (uint64_t)v29;
              _os_log_impl(&dword_227C5D000, v28, OS_LOG_TYPE_DEFAULT, "%@ mark %{public}@ as deferred", buf, 0x16u);

            }
            -[NSDictionary objectForKeyedSubscript:](self->_availableClientDeviceByIdentifiers, "objectForKeyedSubscript:", v24);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setTerminationDeferred:", 1);

            -[NSDictionary objectForKeyedSubscript:](self->_availableClientDeviceByIdentifiers, "objectForKeyedSubscript:", v24);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v31, v24);
            goto LABEL_30;
          }
        }
        else
        {

        }
        -[NSDictionary objectForKeyedSubscript:](self->_availableClientDeviceByIdentifiers, "objectForKeyedSubscript:", v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "terminationDeferred"))
        {
          objc_msgSend(v71, "objectForKey:", v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32 == 0;

          if (v33)
            goto LABEL_31;
          CMContinuityCaptureLog(0);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            -[NSDictionary objectForKeyedSubscript:](self->_availableClientDeviceByIdentifiers, "objectForKeyedSubscript:", v24);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v92 = self;
            v93 = 2114;
            v94 = (uint64_t)v35;
            _os_log_impl(&dword_227C5D000, v34, OS_LOG_TYPE_DEFAULT, "%@ mark %{public}@ as un-deferred", buf, 0x16u);

          }
          objc_msgSend(v71, "objectForKeyedSubscript:", v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setTerminationDeferred:", 0);
        }
LABEL_30:

LABEL_31:
        -[NSDictionary objectForKeyedSubscript:](self->_availableClientDeviceByIdentifiers, "objectForKeyedSubscript:", v24);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "userDisconnected"))
        {
          -[NSDictionary objectForKeyedSubscript:](self->_availableClientDeviceByIdentifiers, "objectForKeyedSubscript:", v24);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v37, "canReconnect") & 1) != 0)
          {
            objc_msgSend(v71, "objectForKey:", v24);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38 == 0;

            if (v39)
              continue;
            objc_msgSend(v71, "objectForKeyedSubscript:", v24);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setUserDisconnected:", 0);
          }
          else
          {

          }
        }

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    }
    while (v21);
  }

  -[CMContinuityCaptureDiscoverySession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("availableClientDevices"));
  obj = self;
  objc_sync_enter(obj);
  v66 = self->_availableClientDeviceByIdentifiers;
  v40 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v71);
  v41 = self->_availableClientDeviceByIdentifiers;
  self->_availableClientDeviceByIdentifiers = v40;

  objc_sync_exit(obj);
  -[CMContinuityCaptureDiscoverySession didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("availableClientDevices"));
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[NSDictionary allKeys](v66, "allKeys");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
  if (v68)
  {
    v67 = *(_QWORD *)v76;
    do
    {
      for (k = 0; k != v68; ++k)
      {
        if (*(_QWORD *)v76 != v67)
          objc_enumerationMutation(v65);
        v43 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
        objc_msgSend(v71, "objectForKey:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44 == 0;

        if (v45)
        {
          -[NSDictionary objectForKeyedSubscript:](v66, "objectForKeyedSubscript:", v43);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          CMContinuityCaptureLog(0);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v92 = obj;
            v93 = 2114;
            v94 = (uint64_t)v69;
            _os_log_impl(&dword_227C5D000, v46, OS_LOG_TYPE_DEFAULT, "%@ terminate %{public}@", buf, 0x16u);
          }

          +[CMContinuityCaptureDiscoverySession unscheduleAllNotificationForDeviceIdentifier:](CMContinuityCaptureDiscoverySession, "unscheduleAllNotificationForDeviceIdentifier:", v43);
          +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "activeSession");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "activeSession");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "device");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "deviceIdentifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "UUIDString");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "isEqualToString:", v43);

            if (v54)
            {
              objc_msgSend(v69, "capabilities");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v55
                && (objc_msgSend(v69, "capabilities"),
                    v56 = (void *)objc_claimAutoreleasedReturnValue(),
                    v57 = objc_msgSend(v56, "userDisabled"),
                    v56,
                    v55,
                    v57))
              {
                +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "stopCurrentSession:syncOnOwnedQueue:", CFSTR("User disabled Continuity Camera in Settings"), 1);
              }
              else
              {
                +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "stopCurrentSession:syncOnOwnedQueue:", CFSTR("Device lost"), 1);
              }
              goto LABEL_53;
            }
          }
          else
          {
LABEL_53:

          }
          if (-[NSMutableSet containsObject:](obj->_observedDevices, "containsObject:", v69))
          {
            +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "queue");
            v59 = objc_claimAutoreleasedReturnValue();
            dispatch_assert_queue_not_V2(v59);

            +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "queue");
            v61 = objc_claimAutoreleasedReturnValue();
            v72[0] = MEMORY[0x24BDAC760];
            v72[1] = 3221225472;
            v72[2] = __50__CMContinuityCaptureDiscoverySession_updateState__block_invoke_80;
            v72[3] = &unk_24F06ADE8;
            v62 = v69;
            v73 = v62;
            v74 = obj;
            dispatch_async_and_wait(v61, v72);

            objc_msgSend(v62, "removeObserver:forKeyPath:context:", obj, CFSTR("userDisconnected"), 0);
            -[NSMutableSet removeObject:](obj->_observedDevices, "removeObject:", v62);
          }
          -[CMContinuityCaptureProximityMonitor endTracking:](obj->_proximityMonitor, "endTracking:", v43);
          -[NSDictionary objectForKeyedSubscript:](v66, "objectForKeyedSubscript:", v43);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "magicStateMonitor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "invalidate");

          -[NSMutableDictionary removeObjectForKey:](obj->_availableCapabilitiesByIdentifiers, "removeObjectForKey:", v43);
          continue;
        }
      }
      v68 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
    }
    while (v68);
  }

}

uint64_t __50__CMContinuityCaptureDiscoverySession_updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("streamIntent"), 3, 0);
}

uint64_t __50__CMContinuityCaptureDiscoverySession_updateState__block_invoke_80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("streamIntent"), 0);
}

- (void)showIncompatableDeviceNotificationIfApplicable
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_incompatibleDeviceByNotificationData;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "scheduleNotification:data:", objc_msgSend(v10, "integerValue"), v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebandNotificationHandlersForIdentifier, 0);
  objc_storeStrong((id *)&self->_observedDevices, 0);
  objc_storeStrong((id *)&self->_currentUserSelectedInSessionDevice, 0);
  objc_storeStrong((id *)&self->_currentUserSelectedInSessionDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_incompatibleDeviceByNotificationData, 0);
  objc_storeStrong((id *)&self->_incompatibleOSMajorVersion15Devices, 0);
  objc_storeStrong((id *)&self->_proximityMonitor, 0);
  objc_storeStrong((id *)&self->_rpRemoteDisplayDiscovery, 0);
  objc_storeStrong((id *)&self->_rpCompanionLinkClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_availableCapabilitiesByIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableClientDeviceByIdentifiers, 0);
}

- (void)currentDeviceList
{
  void *v2;
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;
  void *v9;

  objc_msgSend(a1, "rpRemoteDisplayDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  objc_msgSend(a1, "rpRemoteDisplayDiscovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peerDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x1Cu);

  OUTLINED_FUNCTION_0();
}

@end
