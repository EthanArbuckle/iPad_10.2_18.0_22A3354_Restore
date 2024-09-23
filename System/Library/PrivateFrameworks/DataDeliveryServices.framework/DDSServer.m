@implementation DDSServer

+ (id)setUpAssertionStorageDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library/DataDeliveryServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
  v7 = v11;

  DefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1DA990000, v9, OS_LOG_TYPE_DEFAULT, "Verified the DDS folder is present at %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    +[DDSServer setUpAssertionStorageDirectory].cold.1((uint64_t)v7, (uint64_t)v4, v9);
  }

  return v4;
}

+ (id)sharedInstance
{
  DDSServerConfiguration *v2;
  void *v3;
  DDSServerConfiguration *v4;
  void *v5;

  v2 = [DDSServerConfiguration alloc];
  +[DDSServer setUpAssertionStorageDirectory](DDSServer, "setUpAssertionStorageDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DDSServerConfiguration initWithXPCServiceName:assertionStorageDirectoryURL:](v2, "initWithXPCServiceName:assertionStorageDirectoryURL:", CFSTR("com.apple.DataDeliveryServices.AssetService"), v3);

  +[DDSServer sharedInstanceWithConfiguration:](DDSServer, "sharedInstanceWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharedInstanceWithConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DDSServer_sharedInstanceWithConfiguration___block_invoke;
  block[3] = &unk_1EA141158;
  v9 = v3;
  v4 = sharedInstanceWithConfiguration__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&sharedInstanceWithConfiguration__onceToken, block);
  v6 = (id)sharedInstanceWithConfiguration__sharedInstance;

  return v6;
}

void __45__DDSServer_sharedInstanceWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  DDSServer *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;

  objc_msgSend(*(id *)(a1 + 32), "xpcServiceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("plist"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "xpcServiceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.DataDeliveryServices.AssetService"));

  if (v4)
  {

    v11 = CFSTR("ddsassertiondata.plist");
  }
  objc_msgSend(*(id *)(a1 + 32), "assertionStorageDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [DDSServer alloc];
  objc_msgSend(*(id *)(a1 + 32), "xpcServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DDSServer initWithXPCServiceName:assertionStorageFileURL:](v7, "initWithXPCServiceName:assertionStorageFileURL:", v8, v6);
  v10 = (void *)sharedInstanceWithConfiguration__sharedInstance;
  sharedInstanceWithConfiguration__sharedInstance = v9;

  objc_msgSend((id)sharedInstanceWithConfiguration__sharedInstance, "start");
}

- (DDSServer)initWithXPCServiceName:(id)a3 assertionStorageFileURL:(id)a4
{
  id v6;
  id v7;
  DDSServer *v8;
  DDSMobileAssetv2Provider *v9;
  DDSAssetProviding *provider;
  DDSAssertionDataHandler *v11;
  DDSAssertionTracker *v12;
  DDSManager *v13;
  DDSManaging *manager;
  NSMutableSet *v15;
  NSMutableSet *clientConnections;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  NSXPCListener *listener;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DDSServer;
  v8 = -[DDSServer init](&v23, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(DDSMobileAssetv2Provider);
    provider = v8->_provider;
    v8->_provider = (DDSAssetProviding *)v9;

    v11 = -[DDSAssertionDataHandler initWithAssertionStorageFileURL:]([DDSAssertionDataHandler alloc], "initWithAssertionStorageFileURL:", v7);
    v12 = -[DDSAssertionTracker initWithDataHandler:]([DDSAssertionTracker alloc], "initWithDataHandler:", v11);
    v13 = -[DDSManager initWithProvider:tracker:]([DDSManager alloc], "initWithProvider:tracker:", v8->_provider, v12);
    manager = v8->_manager;
    v8->_manager = (DDSManaging *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    clientConnections = v8->_clientConnections;
    v8->_clientConnections = v15;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.DataDeliveryServices.ddsserver.queue"), "cStringUsingEncoding:", 4), v17);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v6);
    listener = v8->_listener;
    v8->_listener = (NSXPCListener *)v20;

    -[NSXPCListener _setQueue:](v8->_listener, "_setQueue:", v8->_queue);
  }

  return v8;
}

- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[DDSServer provider](self, "provider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompatabilityVersion:forAssetType:", a3, v6);

}

- (void)start
{
  -[DDSManaging setDelegate:](self->_manager, "setDelegate:", self);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  DDSServer *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v7;
    _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Server shouldAcceptNewConnection: (%{public}@)", buf, 0xCu);
  }

  -[DDSServer manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedObject:", v9);

  objc_msgSend((id)objc_opt_class(), "interface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v10);

  +[DDSInterface interface](DDSInterface, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v11);

  -[DDSServer queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setQueue:", v12);

  objc_initWeak((id *)buf, v7);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke;
  v22[3] = &unk_1EA141180;
  objc_copyWeak(&v23, (id *)buf);
  v22[4] = self;
  objc_msgSend(v7, "setInvalidationHandler:", v22);
  v16 = v13;
  v17 = 3221225472;
  v18 = __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke_198;
  v19 = &unk_1EA141180;
  objc_copyWeak(&v21, (id *)buf);
  v20 = self;
  objc_msgSend(v7, "setInterruptionHandler:", &v16);
  -[DDSServer clientConnections](self, "clientConnections", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v7);

  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    DefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = WeakRetained;
      _os_log_impl(&dword_1DA990000, v3, OS_LOG_TYPE_DEFAULT, "Client connection invalidated: %{public}@", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "handleEndedConnection:", WeakRetained);
  }

}

void __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke_198(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    DefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke_198_cold_1((uint64_t)WeakRetained, v3);

    objc_msgSend(*(id *)(a1 + 32), "handleEndedConnection:", WeakRetained);
  }

}

- (void)handleEndedConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDSServer clientConnections](self, "clientConnections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

+ (id)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global);
  return (id)interface_xpcClientInterface;
}

uint64_t __22__DDSServer_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0288CD8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_xpcClientInterface;
  interface_xpcClientInterface = v0;

  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addAssertionForQuery_policy_assertionID_clientID_, 0, 0);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addAssertionForQuery_policy_assertionID_clientID_, 1, 0);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addAssertionForQuery_policy_assertionID_clientID_, 2, 0);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addAssertionForQuery_policy_assertionID_clientID_, 3, 0);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeAssertionWithID_, 0, 0);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_assertionIDsForClientID_reply_, 0, 0);
  v2 = (void *)interface_xpcClientInterface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_assertionIDsForClientID_reply_, 0, 1);

  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchAssetUpdateStatusForQuery_callback_, 0, 0);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchAssetUpdateStatusForQuery_callback_, 0, 1);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchAssetUpdateStatusForQuery_callback_, 1, 1);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateAssetForQuery_callback_, 0, 0);
  objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateAssetForQuery_callback_, 0, 1);
  return objc_msgSend((id)interface_xpcClientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateAssetForQuery_callback_, 1, 1);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DDSServer;
  -[DDSServer dealloc](&v3, sel_dealloc);
}

- (DDSManaging)manager
{
  return self->_manager;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (DDSAssetProviding)provider
{
  return (DDSAssetProviding *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

+ (void)setUpAssertionStorageDirectory
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1DA990000, log, OS_LOG_TYPE_ERROR, "Failed to create directory at url %{public}@:(%{public}@)", (uint8_t *)&v3, 0x16u);
}

void __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke_198_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DA990000, a2, OS_LOG_TYPE_ERROR, "Client connection interrupted: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
