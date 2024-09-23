@implementation DPCManager

- (DPCManager)initWithDelegate:(id)a3
{
  id v4;
  DPCManager *v5;
  DPCManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DPCManager;
  v5 = -[DPCManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[DPCManager setupXPCConnection](v6, "setupXPCConnection");
    -[DPCManager setupWatchPresenceDetection](v6, "setupWatchPresenceDetection");
  }

  return v6;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0(&dword_21CCEF000, a1, a3, "Deallocing the DPCManager", a5, a6, a7, a8, 0);
}

- (void)setupXPCConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  DPCDaemonClient *v7;
  id WeakRetained;
  DPCDaemonClient *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.watchpresenced"), 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255324BE8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553248B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v6);

  v7 = [DPCDaemonClient alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = -[DPCDaemonClient initWithDelegate:](v7, "initWithDelegate:", WeakRetained);
  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", v9);

  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __32__DPCManager_setupXPCConnection__block_invoke;
  v13[3] = &unk_24E0C5300;
  objc_copyWeak(&v14, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v13);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __32__DPCManager_setupXPCConnection__block_invoke_61;
  v11[3] = &unk_24E0C5300;
  objc_copyWeak(&v12, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v11);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __32__DPCManager_setupXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  uint8_t v7[16];

  _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21CCEF000, v2, OS_LOG_TYPE_INFO, "Connection to watchpresenced invalidated", v7, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 2);

    if (v5)
    {
      v6 = objc_loadWeakRetained(v4 + 2);
      objc_msgSend(v6, "managerDidFindError:", 1);

    }
  }

}

void __32__DPCManager_setupXPCConnection__block_invoke_61(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  uint8_t v7[16];

  _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21CCEF000, v2, OS_LOG_TYPE_INFO, "Connection to watchpresenced interrupted", v7, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 2);

    if (v5)
    {
      v6 = objc_loadWeakRetained(v4 + 2);
      objc_msgSend(v6, "managerDidFindError:", 1);

    }
  }

}

- (void)registerForWatchPresence
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
    -[DPCManager startWatchPresenceUpdate](self, "startWatchPresenceUpdate");
}

- (void)unregisterForWatchPresence
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
    -[DPCManager stopWatchPresenceUpdate](self, "stopWatchPresenceUpdate");
}

- (void)updateWatchPresenceStatus
{
  NSXPCConnection *xpcConnection;
  id v3;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection remoteObjectProxy](xpcConnection, "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getCurrentWatchPresenceStatus");

  }
}

- (void)setupWatchPresenceDetection
{
  NSXPCConnection *xpcConnection;
  id v3;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection remoteObjectProxy](xpcConnection, "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setupWatchPresenceDetection");

  }
}

- (void)startWatchPresenceUpdate
{
  NSXPCConnection *xpcConnection;
  id v3;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection remoteObjectProxy](xpcConnection, "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startWatchPresenceDetection");

  }
}

- (void)stopWatchPresenceUpdate
{
  NSXPCConnection *xpcConnection;
  id v3;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection remoteObjectProxy](xpcConnection, "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopWatchPresenceDetection");

  }
}

- (void)setWatchNewEvent:(unint64_t)a3
{
  NSXPCConnection *xpcConnection;
  id v5;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection remoteObjectProxy](xpcConnection, "remoteObjectProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCurrentWatchPresenceStatus:", a3);

  }
}

- (void)setStreamingMode:(BOOL)a3
{
  NSXPCConnection *xpcConnection;
  _BOOL8 v4;
  id v5;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = a3;
    -[NSXPCConnection remoteObjectProxy](xpcConnection, "remoteObjectProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStreamingMode:", v4);

  }
}

- (DPCWatchPresenceDelegate)delegate
{
  return (DPCWatchPresenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
