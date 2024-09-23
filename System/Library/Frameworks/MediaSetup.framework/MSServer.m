@implementation MSServer

- (MSServer)initWithMediator:(id)a3
{
  id v5;
  MSServer *v6;
  NSObject *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSServer;
  v6 = -[MSServer init](&v10, sel_init);
  if (v6)
  {
    _MSLogingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[MSServer initWithMediator:]";
      _os_log_impl(&dword_219CD8000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_mediator, a3);
    -[MSServerMediator setConnectionDelegate:](v6->_mediator, "setConnectionDelegate:", v6);
    +[MSServiceUpdatedHandler shared](MSServiceUpdatedHandler, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v6);

    -[MSServer _initializeServer](v6, "_initializeServer");
  }

  return v6;
}

- (void)_initializeServer
{
  NSMutableSet *v3;
  NSMutableSet *connections;
  NSXPCListener *v5;
  NSXPCListener *serverListener;

  v3 = (NSMutableSet *)objc_opt_new();
  connections = self->_connections;
  self->_connections = v3;

  v5 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.mediasetupd.server"));
  serverListener = self->_serverListener;
  self->_serverListener = v5;

  -[NSXPCListener setDelegate:](self->_serverListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_serverListener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  MSServer *v59;
  uint8_t buf[8];
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id from;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = -[MSServer _isConnectionEntitled:](self, "_isConnectionEntitled:", v7);
  v9 = v8;
  if (v8)
  {
    v58 = v8;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550CD5F0);
    v59 = self;
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_addMediaService_usingSetupBundles_completion_, 1, 0);

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:");
    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:");
    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
    v25 = objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_getResolvedServiceInfo_sharedUserID_completion_, 0, 1);
    v55 = (void *)v25;
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_getResolvedServiceInfo_completion_, 0, 1);
    v26 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_getServiceConfigurationInfo_serviceID_completion_, 0, 1);
    v32 = (void *)MEMORY[0x24BDBCF20];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_getServiceConfigurationInfo_serviceID_completion_, 0, 0);

    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_getDefaultMediaServiceForAllUsers_, 0, 1);
    -[NSObject setClass:forSelector:argumentIndex:ofReply:](v10, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getCachedServiceInfo_homeUserID_endpointID_completion_, 0, 1);
    -[NSObject setClass:forSelector:argumentIndex:ofReply:](v10, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDefaultMediaService_homeUserID_completion_, 0, 1);
    -[NSObject setClass:forSelector:argumentIndex:ofReply:](v10, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion_, 0, 1);
    v35 = (void *)MEMORY[0x24BDBCF20];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_getPublicInfoForBundleID_completion_, 0, 1);

    v39 = (void *)MEMORY[0x24BDBCF20];
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    objc_msgSend(v39, "setWithObjects:", v40, v41, v42, v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_activeServiceApplicationInformationForSharedUserID_completionHandler_, 0, 1);

    v45 = (void *)MEMORY[0x24BDBCF20];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_getSupportedThirdPartyMediaServices_, 0, 1);

    v48 = (void *)MEMORY[0x24BDBCF20];
    v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_getMediaServiceChoicesForSharedUser_completion_, 0, 1);

    objc_msgSend(v7, "setExportedInterface:", v10);
    objc_msgSend(v7, "setExportedObject:", v59->_mediator);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550B4598);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v51);

    objc_initWeak(location, v7);
    objc_initWeak(&from, v59);
    v52 = MEMORY[0x24BDAC760];
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = __47__MSServer_listener_shouldAcceptNewConnection___block_invoke;
    v64[3] = &unk_24DBD5510;
    objc_copyWeak(&v65, &from);
    objc_copyWeak(&v66, location);
    objc_msgSend(v7, "setInterruptionHandler:", v64);
    v61[0] = v52;
    v61[1] = 3221225472;
    v61[2] = __47__MSServer_listener_shouldAcceptNewConnection___block_invoke_130;
    v61[3] = &unk_24DBD5510;
    objc_copyWeak(&v62, &from);
    objc_copyWeak(&v63, location);
    objc_msgSend(v7, "setInvalidationHandler:", v61);
    objc_msgSend(v7, "resume");
    _MSLogingFacility();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219CD8000, v53, OS_LOG_TYPE_DEFAULT, "Connection accepted", buf, 2u);
    }

    objc_destroyWeak(&v63);
    objc_destroyWeak(&v62);
    objc_destroyWeak(&v66);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

    v9 = v58;
  }
  else
  {
    _MSLogingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MSServer listener:shouldAcceptNewConnection:].cold.1(v10);
  }

  return v9;
}

void __47__MSServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  uint8_t v5[16];

  _MSLogingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219CD8000, v2, OS_LOG_TYPE_DEFAULT, "MSD Server Connection interrupted", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeConnection:", v4);

}

void __47__MSServer_listener_shouldAcceptNewConnection___block_invoke_130(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  uint8_t v5[16];

  _MSLogingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219CD8000, v2, OS_LOG_TYPE_DEFAULT, "MSD Server Connection invalidated", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeConnection:", v4);

}

- (void)openConnection
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _MSLogingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_219CD8000, v4, OS_LOG_TYPE_DEFAULT, "Registering client connection, %@", (uint8_t *)&v5, 0xCu);
  }

  -[MSServer _addConnection:](self, "_addConnection:", v3);
}

- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MSServer connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MSServer connections](self, "connections", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "remoteObjectProxy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "serviceSettingDidUpdate:homeUserID:", v6, v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
  ICSiriPostDynamiteClientStateChangedNotification();

}

- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MSServer connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MSServer connections](self, "connections", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "remoteObjectProxy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userDidRemoveService:homeUserID:", v6, v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
  ICSiriPostDynamiteClientStateChangedNotification();

}

- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MSServer connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MSServer connections](self, "connections", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "remoteObjectProxy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userDidUpdateDefaultService:homeUserID:", v6, v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
  ICSiriPostDynamiteClientStateChangedNotification();

}

- (BOOL)_isConnectionEntitled:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.mediasetupd.client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.developer.mediasetup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v6, "BOOLValue");
  return v5 | v3;
}

- (void)_addConnection:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MSServer connections](self, "connections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MSServer connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MSServer connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[MSServer connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  _MSLogingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_219CD8000, v7, OS_LOG_TYPE_DEFAULT, "Removed Connection: (%@)", (uint8_t *)&v8, 0xCu);
  }

  objc_sync_exit(v5);
}

- (NSMutableSet)connections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MSServerMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
  objc_storeStrong((id *)&self->_mediator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_serverListener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219CD8000, log, OS_LOG_TYPE_ERROR, "Missing required entitlement to connect to MediaSetup", v1, 2u);
}

@end
