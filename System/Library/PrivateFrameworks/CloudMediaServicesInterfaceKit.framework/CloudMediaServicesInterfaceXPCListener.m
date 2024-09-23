@implementation CloudMediaServicesInterfaceXPCListener

- (CloudMediaServicesInterfaceXPCListener)initWithDelegate:(id)a3
{
  id v4;
  CloudMediaServicesInterfaceXPCListener *v5;
  uint64_t v6;
  NSXPCListener *xpcListener;
  uint64_t v8;
  NSMutableArray *clients;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CloudMediaServicesInterfaceXPCListener;
  v5 = -[CloudMediaServicesInterfaceXPCListener init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.agora.server"));
    xpcListener = v5->_xpcListener;
    v5->_xpcListener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v5->_xpcListener, "setDelegate:", v5);
    objc_storeWeak((id *)&v5->_playbackCommandDelegate, v4);
    v8 = objc_opt_new();
    clients = v5->_clients;
    v5->_clients = (NSMutableArray *)v8;

    -[NSXPCListener resume](v5->_xpcListener, "resume");
  }

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.agora.client"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) != 0)
  {
    v20 = v6;
    +[CMSClient clientWithConnection:](CMSClient, "clientWithConnection:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553B1880);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "classesForSelector:argumentIndex:ofReply:", sel_sendPlaybackQueueWithUserActivityDictionary_forIntentID_toDestination_withIntentData_prepareQueue_withCompletion_, 3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "addObject:", objc_opt_class());
    objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_sendPlaybackQueueWithUserActivityDictionary_forIntentID_toDestination_withIntentData_prepareQueue_withCompletion_, 3, 0);
    objc_msgSend(v7, "setExportedInterface:", v11);
    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v14 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __77__CloudMediaServicesInterfaceXPCListener_listener_shouldAcceptNewConnection___block_invoke;
    v24[3] = &unk_24E1CD0C0;
    objc_copyWeak(&v26, &location);
    v15 = v7;
    v25 = v15;
    objc_msgSend(v15, "setInterruptionHandler:", v24);
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __77__CloudMediaServicesInterfaceXPCListener_listener_shouldAcceptNewConnection___block_invoke_67;
    v21[3] = &unk_24E1CD0C0;
    objc_copyWeak(&v23, &location);
    v16 = v15;
    v22 = v16;
    objc_msgSend(v16, "setInvalidationHandler:", v21);
    -[CloudMediaServicesInterfaceXPCListener clients](self, "clients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v17);
    -[CloudMediaServicesInterfaceXPCListener clients](self, "clients");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v10);

    objc_sync_exit(v17);
    objc_msgSend(v16, "resume");

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    v6 = v20;
  }
  else
  {
    _CMSILogingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CloudMediaServicesInterfaceXPCListener listener:shouldAcceptNewConnection:].cold.1(v10);
  }

  return v9;
}

void __77__CloudMediaServicesInterfaceXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _CMSILogingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21DE4E000, v2, OS_LOG_TYPE_DEFAULT, "Interruption Handler called", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleClientDisconnection:", *(_QWORD *)(a1 + 32));

}

void __77__CloudMediaServicesInterfaceXPCListener_listener_shouldAcceptNewConnection___block_invoke_67(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _CMSILogingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21DE4E000, v2, OS_LOG_TYPE_DEFAULT, "Invalidation Handler called", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleClientDisconnection:", *(_QWORD *)(a1 + 32));

}

- (void)handleClientDisconnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CloudMediaServicesInterfaceXPCListener clients](self, "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[CloudMediaServicesInterfaceXPCListener clients](self, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__CloudMediaServicesInterfaceXPCListener_handleClientDisconnection___block_invoke;
  v10[3] = &unk_24E1CD0E8;
  v9 = v4;
  v11 = v9;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CloudMediaServicesInterfaceXPCListener clients](self, "clients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v7);

  }
  objc_sync_exit(v5);

}

uint64_t __68__CloudMediaServicesInterfaceXPCListener_handleClientDisconnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)playSample:(id)a3
{
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v6, "playSample:", v7);

  }
}

- (void)sendPlaybackQueueToRemoteDestination:(id)a3 withCompletion:(id)a4
{
  id v6;
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v9, "sendPlaybackQueueToRemoteDestination:withCompletion:", v10, v6);

  }
}

- (void)sendPlaybackQueueWithUserActivityDictionary:(id)a3 forIntentID:(id)a4 toDestination:(id)a5 withIntentData:(id)a6 prepareQueue:(BOOL)a7 withCompletion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v20;
  id v21;

  v9 = a7;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    v20 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v20, "sendPlaybackQueueWithUserActivityDictionary:forIntentID:toDestination:withIntentData:prepareQueue:withCompletion:", v21, v14, v15, v16, v9, v17);

  }
}

- (void)pauseSample
{
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v4;

  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackCommandDelegate);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v4, "pauseSample");

  }
}

- (void)setServerEnvironment:(id)a3
{
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v6, "setServerEnvironment:", v7);

  }
}

- (void)setOverrideURL:(id)a3
{
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v6, "setOverrideURL:", v7);

  }
}

- (void)getCloudExtensionConfigurationFor:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    v15 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v15, "getCloudExtensionConfigurationFor:homeUserID:endpointID:withCompletion:", v16, v10, v11, v12);

  }
}

- (void)submitAnalyticsForType:(id)a3 andIdentifier:(id)a4 eventType:(id)a5 atTime:(id)a6 withMetadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    v18 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v18, "submitAnalyticsForType:andIdentifier:eventType:atTime:withMetadata:", v19, v12, v13, v14, v15);

  }
}

- (void)stopAnalyticsWithIdentifier:(id)a3
{
  CloudMediaServicesInterfaceProtocol **p_playbackCommandDelegate;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    objc_msgSend(v6, "stopAnalyticsWithIdentifier:", v7);

  }
}

- (CloudMediaServicesInterfaceProtocol)playbackCommandDelegate
{
  return (CloudMediaServicesInterfaceProtocol *)objc_loadWeakRetained((id *)&self->_playbackCommandDelegate);
}

- (void)setPlaybackCommandDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_playbackCommandDelegate, a3);
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_destroyWeak((id *)&self->_playbackCommandDelegate);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21DE4E000, log, OS_LOG_TYPE_ERROR, "Missing Required Entitlement to connect to CloudMediaServicesInterface Server", v1, 2u);
}

@end
