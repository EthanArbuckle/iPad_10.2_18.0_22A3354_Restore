@implementation _CDUserContextServerClient

- (void)propertiesOfPath:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _CDUserContextService *service;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_CDUserContextService remoteDevicesHaveBeenActivated](self->_service, "remoteDevicesHaveBeenActivated")
    || !-[_CDUserContextServerClient isMDCSNeededForKeyPath:](self, "isMDCSNeededForKeyPath:", v6))
  {
    -[_CDUserContextServerClient _propertiesOfPath:handler:](self, "_propertiesOfPath:handler:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18DD73000, v8, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", buf, 0xCu);
    }

    service = self->_service;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55___CDUserContextServerClient_propertiesOfPath_handler___block_invoke;
    v10[3] = &unk_1E26D5660;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[_CDUserContextService requestActivateDevicesFromAllSubscribersWithHandler:](service, "requestActivateDevicesFromAllSubscribersWithHandler:", v10);

  }
}

- (void)_propertiesOfPath:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___CDUserContextServerClient__propertiesOfPath_handler___block_invoke;
  v8[3] = &unk_1E26D5688;
  v9 = v6;
  v7 = v6;
  -[_CDUserContextServerClient _valueForPath:handler:](self, "_valueForPath:handler:", a3, v8);

}

- (void)_valueForPath:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *activateMonitorQueue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _CDUserContextServerClient *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  activateMonitorQueue = self->_activateMonitorQueue;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52___CDUserContextServerClient__valueForPath_handler___block_invoke;
  v16[3] = &unk_1E26D5660;
  v17 = v6;
  v18 = self;
  v19 = v7;
  v10 = v16;
  v11 = activateMonitorQueue;
  v12 = v7;
  v13 = v6;
  v14 = (void *)os_transaction_create();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_1E26D4F60;
  v21 = v14;
  v22 = v10;
  v15 = v14;
  dispatch_async(v11, block);

}

- (BOOL)isMDCSNeededForKeyPath:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[_CDContextQueries isMDCSKeyPath:](_CDContextQueries, "isMDCSKeyPath:", v3))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    +[_CDDevice localDevice](_CDDevice, "localDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", v7) ^ 1;

  }
  return v4;
}

- (void)setObject:(id)a3 forPath:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, BOOL);
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, BOOL))a5;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_CDUserContextServerClient setObject:forPath:handler:].cold.1(v9, v8);

  +[_CDContextQueries keyPathForAppWebUsageDataDictionaries](_CDContextQueries, "keyPathForAppWebUsageDataDictionaries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v12))
  {
    v13 = -[_CDUserContextServerClient _shouldUpdateWebUsageForCurrentUser](self, "_shouldUpdateWebUsageForCurrentUser");

    if (!v13)
      goto LABEL_10;
  }
  else
  {

  }
  -[_CDInMemoryUserContext setObject:returningMetadataForContextualKeyPath:](self->_userContext, "setObject:returningMetadataForContextualKeyPath:", v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[_CDUserContextService persistence](self->_service, "persistence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveValue:forKeyPath:", v14, v9);

  }
  v10[2](v10, v14 != 0);

LABEL_10:
}

- (void)performRegistrationCallbackWithRegistration:(id)a3 info:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke;
  block[3] = &unk_1E26D4680;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

+ (id)clientOfService:(id)a3 withConnection:(id)a4 andContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForService:withConnection:andContext:", v9, v8, v7);

  return v10;
}

- (id)initForService:(id)a3 withConnection:(id)a4 andContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  _CDUserContextServerClient *v12;
  _CDUserContextServerClient *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  NSMutableSet *wakingRegistrations;
  uint64_t v18;
  NSMutableSet *nonWakingRegistration;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *activateMonitorQueue;
  void *v23;
  void *v24;
  NSXPCConnection *clientConnection;
  NSXPCConnection *v26;
  void *v27;
  uint64_t v28;
  NSMutableDictionary *devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  id from;
  id location;
  objc_super v40;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v40.receiver = self;
  v40.super_class = (Class)_CDUserContextServerClient;
  v12 = -[_CDUserContextServerClient init](&v40, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    objc_storeStrong((id *)&v13->_userContext, a5);
    v14 = dispatch_queue_create("com.apple.coreduetd.service.client.workQueue", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    wakingRegistrations = v13->_wakingRegistrations;
    v13->_wakingRegistrations = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    nonWakingRegistration = v13->_nonWakingRegistration;
    v13->_nonWakingRegistration = (NSMutableSet *)v18;

    objc_storeStrong((id *)&v13->_clientConnection, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.coreduetd.contextserverclient.activateMonitorQueue", v20);
    activateMonitorQueue = v13->_activateMonitorQueue;
    v13->_activateMonitorQueue = (OS_dispatch_queue *)v21;

    objc_msgSend((id)objc_opt_class(), "clientInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v13->_clientConnection, "setRemoteObjectInterface:", v23);

    objc_msgSend((id)objc_opt_class(), "serverInterface");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v13->_clientConnection, "setExportedInterface:", v24);

    -[NSXPCConnection setExportedObject:](v13->_clientConnection, "setExportedObject:", v13);
    objc_initWeak(&location, v9);
    objc_initWeak(&from, v13);
    clientConnection = v13->_clientConnection;
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __71___CDUserContextServerClient_initForService_withConnection_andContext___block_invoke;
    v35 = &unk_1E26D5638;
    objc_copyWeak(&v36, &location);
    objc_copyWeak(&v37, &from);
    -[NSXPCConnection setInterruptionHandler:](clientConnection, "setInterruptionHandler:", &v32);
    v26 = v13->_clientConnection;
    -[NSXPCConnection interruptionHandler](v26, "interruptionHandler", v32, v33, v34, v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setInvalidationHandler:](v26, "setInvalidationHandler:", v27);

    -[NSXPCConnection resume](v13->_clientConnection, "resume");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v28 = objc_claimAutoreleasedReturnValue();
    devicesToActivateByRemoteUserContextProxySourceDeviceUUID = v13->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
    v13->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID = (NSMutableDictionary *)v28;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v13, sel_proxyTokenDidUpdate, CFSTR("_CDMDCSProxyTokenUpdated"), 0);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v13;
}

+ (id)serverInterface
{
  if (serverInterface_onceToken_0 != -1)
    dispatch_once(&serverInterface_onceToken_0, &__block_literal_global_34);
  return (id)serverInterface_serverInterface_0;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken_0 != -1)
    dispatch_once(&clientInterface_onceToken_0, &__block_literal_global_95_0);
  return (id)clientInterface_clientInterface_0;
}

- (void)deregisterCallback:(id)a3
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMultiDeviceRegistration"))
    v5 = !-[_CDInMemoryUserContext hasMultiDeviceRegistrations](self->_userContext, "hasMultiDeviceRegistrations");
  else
    v5 = 1;
  v6 = objc_msgSend(v4, "mustWake");
  v7 = 56;
  if (v6)
    v7 = 48;
  v8 = *(id *)((char *)&self->super.isa + v7);
  objc_sync_enter(v8);
  objc_msgSend(v8, "removeObject:", v4);
  -[_CDUserContextService persistence](self->_service, "persistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteRegistration:", v4);

  -[_CDInMemoryUserContext deregisterCallback:](self->_userContext, "deregisterCallback:", v4);
  objc_sync_exit(v8);

  if (objc_msgSend(v4, "isMultiDeviceRegistration"))
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_CDUserContextServerClient deregisterCallback:].cold.1();

    if (((v5 | -[_CDInMemoryUserContext hasMultiDeviceRegistrations](self->_userContext, "hasMultiDeviceRegistrations")) & 1) == 0)
    {
      -[_CDUserContextServerClient subscribeToDeviceStatusChangeNotificationsForDeviceTypes:](self, "subscribeToDeviceStatusChangeNotificationsForDeviceTypes:", 0);
      -[_CDUserContextServerClient deviceIDsForDeviceTypes:](self, "deviceIDsForDeviceTypes:", objc_msgSend(v4, "deviceTypes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
        -[_CDUserContextServerClient unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:](self, "unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:", v4, v11);

    }
  }

}

- (void)addObjects:(id)a3 andRemoveObjects:(id)a4 forArrayAtPath:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _BOOL8);
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _BOOL8))a6;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    _CDRedactedObjectForKeyPath(v12, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CDRedactedObjectForKeyPath(v12, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v12;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_18DD73000, v14, OS_LOG_TYPE_DEFAULT, "CDUserContext: %@ => ADD %@, REMOVE %@", (uint8_t *)&v23, 0x20u);

  }
  +[_CDContextQueries keyPathForAppWebUsageDataDictionaries](_CDContextQueries, "keyPathForAppWebUsageDataDictionaries");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "isEqual:", v17);
  if (v10 && v18)
  {
    v19 = -[_CDUserContextServerClient _shouldUpdateWebUsageForCurrentUser](self, "_shouldUpdateWebUsageForCurrentUser");

    if (!v19)
      goto LABEL_12;
  }
  else
  {

  }
  LOBYTE(v23) = 0;
  -[_CDInMemoryUserContext addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:](self->_userContext, "addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", v10, v11, v12, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v23)
  {
    -[_CDUserContextService persistence](self->_service, "persistence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "saveValue:forKeyPath:", v20, v12);

    v22 = (_BYTE)v23 != 0;
  }
  else
  {
    v22 = 0;
  }
  v13[2](v13, v22);

LABEL_12:
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_CDMDCSProxyTokenUpdated"), 0);

  -[NSXPCConnection invalidate](self->_clientConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)_CDUserContextServerClient;
  -[_CDUserContextServerClient dealloc](&v4, sel_dealloc);
}

- (void)hasKnowledgeOfPath:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _CDUserContextService *service;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_CDUserContextService remoteDevicesHaveBeenActivated](self->_service, "remoteDevicesHaveBeenActivated")
    || !-[_CDUserContextServerClient isMDCSNeededForKeyPath:](self, "isMDCSNeededForKeyPath:", v6))
  {
    -[_CDUserContextServerClient _hasKnowledgeOfPath:handler:](self, "_hasKnowledgeOfPath:handler:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18DD73000, v8, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", buf, 0xCu);
    }

    service = self->_service;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57___CDUserContextServerClient_hasKnowledgeOfPath_handler___block_invoke;
    v10[3] = &unk_1E26D5660;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[_CDUserContextService requestActivateDevicesFromAllSubscribersWithHandler:](service, "requestActivateDevicesFromAllSubscribersWithHandler:", v10);

  }
}

- (void)_hasKnowledgeOfPath:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *activateMonitorQueue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _CDUserContextServerClient *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  activateMonitorQueue = self->_activateMonitorQueue;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58___CDUserContextServerClient__hasKnowledgeOfPath_handler___block_invoke;
  v16[3] = &unk_1E26D56B0;
  v18 = self;
  v19 = v7;
  v17 = v6;
  v10 = v16;
  v11 = activateMonitorQueue;
  v12 = v7;
  v13 = v6;
  v14 = (void *)os_transaction_create();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_1E26D4F60;
  v21 = v14;
  v22 = v10;
  v15 = v14;
  dispatch_async(v11, block);

}

- (void)propertiesOfRemotePath:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _CDUserContextService *service;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_CDUserContextService remoteDevicesHaveBeenActivated](self->_service, "remoteDevicesHaveBeenActivated")
    || !-[_CDUserContextServerClient isMDCSNeededForKeyPath:](self, "isMDCSNeededForKeyPath:", v6))
  {
    -[_CDUserContextServerClient _propertiesOfRemotePath:handler:](self, "_propertiesOfRemotePath:handler:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18DD73000, v8, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", buf, 0xCu);
    }

    service = self->_service;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61___CDUserContextServerClient_propertiesOfRemotePath_handler___block_invoke;
    v10[3] = &unk_1E26D5660;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[_CDUserContextService requestActivateDevicesFromAllSubscribersWithHandler:](service, "requestActivateDevicesFromAllSubscribersWithHandler:", v10);

  }
}

- (void)_propertiesOfRemotePath:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___CDUserContextServerClient__propertiesOfRemotePath_handler___block_invoke;
  v8[3] = &unk_1E26D5688;
  v9 = v6;
  v7 = v6;
  -[_CDUserContextServerClient _valueForRemotePath:handler:](self, "_valueForRemotePath:handler:", a3, v8);

}

- (void)_valueForRemotePath:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(id, void *);
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "isMultiDeviceKeyPath"))
  {
    -[_CDInMemoryUserContext propertiesForContextualKeyPath:](self->_userContext, "propertiesForContextualKeyPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "lastModifiedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceNow");
      v12 = v11;

      if (v12 > -0.2)
      {
        objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[_CDUserContextServerClient _valueForRemotePath:handler:].cold.1(v6, v9);

        v7[2](v7, v9);
        goto LABEL_12;
      }

    }
    v18[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke;
    v15[3] = &unk_1E26D56D8;
    v15[4] = self;
    v16 = v6;
    v17 = v7;
    -[_CDUserContextServerClient fetchPropertiesOfRemoteKeyPaths:handler:](self, "fetchPropertiesOfRemoteKeyPaths:handler:", v9, v15);

LABEL_12:
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_CDUserContextServerClient _valueForRemotePath:handler:].cold.2();

  v7[2](v7, 0);
LABEL_13:

}

- (void)handlePreviouslyFiredRegistration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)os_transaction_create();
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke;
  v15[3] = &unk_1E26D4F10;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v18 = v8;
  v11 = v18;
  v12 = v15;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_1E26D4F60;
  v20 = v11;
  v21 = v12;
  v13 = v7;
  v14 = v6;
  dispatch_async(queue, block);

}

- (void)registerCallback:(id)a3
{
  id v4;
  int v5;
  _BOOL4 v6;
  _CDUserContextService *service;
  void *v8;
  id v9;
  NSMutableSet *v10;
  uint64_t v11;
  OS_dispatch_queue *activateMonitorQueue;
  id v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  _CDUserContextServerClient *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id from;
  id v28;
  id location;
  __int128 block;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isMultiDeviceRegistration");
  if (v5)
    v6 = -[_CDInMemoryUserContext hasMultiDeviceRegistrations](self->_userContext, "hasMultiDeviceRegistrations");
  else
    v6 = 0;
  objc_initWeak(&location, v4);
  -[_CDUserContextService removeOpenRegistration:](self->_service, "removeOpenRegistration:", v4);
  service = self->_service;
  v28 = 0;
  -[_CDUserContextService obtainFiredRegistrationMatchingRegistration:info:](service, "obtainFiredRegistrationMatchingRegistration:info:", v4, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;
  if (v8)
  {
    -[_CDUserContextServerClient handlePreviouslyFiredRegistration:info:](self, "handlePreviouslyFiredRegistration:info:", v4, v9);
  }
  else
  {
    if (objc_msgSend(v4, "mustWake"))
    {
      v10 = self->_wakingRegistrations;
      objc_sync_enter(v10);
      -[NSMutableSet addObject:](self->_wakingRegistrations, "addObject:", v4);
    }
    else
    {
      v10 = self->_nonWakingRegistration;
      objc_sync_enter(v10);
      -[NSMutableSet addObject:](self->_nonWakingRegistration, "addObject:", v4);
    }
    objc_sync_exit(v10);

    objc_initWeak(&from, self);
    v11 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __47___CDUserContextServerClient_registerCallback___block_invoke;
    v24[3] = &unk_1E26D5790;
    objc_copyWeak(&v25, &from);
    objc_copyWeak(&v26, &location);
    objc_msgSend(v4, "setInformativeCallback:", v24);
    activateMonitorQueue = self->_activateMonitorQueue;
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __47___CDUserContextServerClient_registerCallback___block_invoke_2;
    v21[3] = &unk_1E26D46A8;
    v13 = v4;
    v22 = v13;
    v23 = self;
    v14 = v21;
    v15 = activateMonitorQueue;
    v16 = (void *)os_transaction_create();
    *(_QWORD *)&block = v11;
    *((_QWORD *)&block + 1) = 3221225472;
    v31 = __cd_dispatch_async_capture_tx_block_invoke_1;
    v32 = &unk_1E26D4F60;
    v33 = v16;
    v34 = v14;
    v17 = v16;
    dispatch_async(v15, &block);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[_CDUserContextServerClient registerCallback:].cold.1();

      if (!v6)
        -[_CDUserContextServerClient subscribeToDeviceStatusChangeNotificationsForDeviceTypes:](self, "subscribeToDeviceStatusChangeNotificationsForDeviceTypes:", 0xFFFFLL);
      -[_CDUserContextServerClient deviceIDsForDeviceTypes:](self, "deviceIDsForDeviceTypes:", objc_msgSend(v13, "deviceTypes"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDUserContextServerClient subscribeToContextValueNotificationsWithRegistration:deviceIDs:](self, "subscribeToContextValueNotificationsWithRegistration:deviceIDs:", v13, v19);
      if (!-[_CDUserContextService remoteDevicesHaveBeenActivated](self->_service, "remoteDevicesHaveBeenActivated"))
      {
        objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(block) = 138412290;
          *(_QWORD *)((char *)&block + 4) = v13;
          _os_log_impl(&dword_18DD73000, v20, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", (uint8_t *)&block, 0xCu);
        }

        -[_CDUserContextService requestActivateDevicesFromAllSubscribersWithHandler:](self->_service, "requestActivateDevicesFromAllSubscribersWithHandler:", &__block_literal_global_129);
      }

    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&location);
}

- (void)deregisterAllCallbacks:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = -[_CDInMemoryUserContext hasMultiDeviceRegistrations](self->_userContext, "hasMultiDeviceRegistrations");
  v6 = 56;
  if (v3)
    v6 = 48;
  v7 = *(id *)((char *)&self->super.isa + v6);
  objc_sync_enter(v7);
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "removeAllObjects");
  objc_sync_exit(v7);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    v12 = !v5;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[_CDUserContextService persistence](self->_service, "persistence");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deleteRegistration:", v14);

        -[_CDInMemoryUserContext deregisterCallback:](self->_userContext, "deregisterCallback:", v14);
        if (objc_msgSend(v14, "isMultiDeviceRegistration"))
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v14;
            _os_log_debug_impl(&dword_18DD73000, v16, OS_LOG_TYPE_DEBUG, "Deregistering multi-device callback: %@", buf, 0xCu);
          }

          if (((v12 | -[_CDInMemoryUserContext hasMultiDeviceRegistrations](self->_userContext, "hasMultiDeviceRegistrations")) & 1) == 0)-[_CDUserContextServerClient subscribeToDeviceStatusChangeNotificationsForDeviceTypes:](self, "subscribeToDeviceStatusChangeNotificationsForDeviceTypes:", 0);
          -[_CDUserContextServerClient deviceIDsForDeviceTypes:](self, "deviceIDsForDeviceTypes:", objc_msgSend(v14, "deviceTypes"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count"))
            -[_CDUserContextServerClient unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:](self, "unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:", v14, v17);

        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

}

- (void)evaluatePredicate:(id)a3 handler:(id)a4
{
  _CDInMemoryUserContext *userContext;
  id v7;

  userContext = self->_userContext;
  v7 = a4;
  (*((void (**)(id, BOOL))a4 + 2))(v7, -[_CDInMemoryUserContext evaluatePredicate:](userContext, "evaluatePredicate:", a3));

}

- (void)setObject:(id)a3 lastModifiedDate:(id)a4 forContextualKeyPath:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, BOOL);
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, BOOL))a6;
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    _CDRedactedObjectForKeyPath(v12, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v12;
    v21 = 2112;
    v22 = v18;
    v23 = 2112;
    v24 = v11;
    _os_log_debug_impl(&dword_18DD73000, v14, OS_LOG_TYPE_DEBUG, "CDUserContext: SET %@ => %@ / %@", (uint8_t *)&v19, 0x20u);

  }
  -[_CDInMemoryUserContext setObject:returningMetadataForContextualKeyPath:](self->_userContext, "setObject:returningMetadataForContextualKeyPath:", v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (v11)
      objc_msgSend(v15, "setLastModifiedDate:", v11);
    -[_CDUserContextService persistence](self->_service, "persistence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveValue:forKeyPath:", v16, v12);

  }
  v13[2](v13, v16 != 0);

}

- (void)proxyTokenDidUpdate
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableDictionary copy](self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID, "copy");
  objc_sync_exit(v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v9, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDUserContextServerClient activateDevices:remoteUserContextProxySourceDeviceUUID:](self, "activateDevices:remoteUserContextProxySourceDeviceUUID:", v10, v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  uid_t v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  uint8_t v47[128];
  uint8_t v48[32];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v35 = a4;
  v32 = -[NSXPCConnection effectiveUserIdentifier](self->_clientConnection, "effectiveUserIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
  objc_sync_enter(v6);
  +[_CDContextQueries keyPathForMDCSProxyTokenWithUserID:](_CDContextQueries, "keyPathForMDCSProxyTokenWithUserID:", v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v35, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDUserContextServerClient activateDevices:remoteUserContextProxySourceDeviceUUID:].cold.3(v11, objc_msgSend(v34, "count"), v48, v10);
    }

    v9 = v34;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID, "setObject:forKeyedSubscript:", v9, v35);

  objc_sync_exit(v6);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[_CDUserContextServerClient activateDevices:remoteUserContextProxySourceDeviceUUID:].cold.2(v34);

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v15 = v34;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v41;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v41 != v17)
              objc_enumerationMutation(v15);
            v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v18);
            objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v46 = v19;
              _os_log_debug_impl(&dword_18DD73000, v20, OS_LOG_TYPE_DEBUG, "Activating device %{public}@", buf, 0xCu);
            }

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        }
        while (v16);
      }

    }
    -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v21);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v22 = v34;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "deviceID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v23);
    }

    -[_CDUserContextService setRemoteDevicesHaveBeenActivated:](self->_service, "setRemoteDevicesHaveBeenActivated:", 1);
    objc_sync_exit(v21);

    -[_CDUserContextService proxySourceDeviceUUIDForUserID:](self->_service, "proxySourceDeviceUUIDForUserID:", v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[_CDUserContextServerClient activateDevices:remoteUserContextProxySourceDeviceUUID:].cold.1(v35);

      -[_CDUserContextService setProxySourceDeviceUUID:forUserID:](self->_service, "setProxySourceDeviceUUID:forUserID:", v35, v32);
    }
    -[_CDInMemoryUserContext activateDevices:remoteUserContextProxySourceDeviceUUID:](self->_userContext, "activateDevices:remoteUserContextProxySourceDeviceUUID:", v22, v35);
  }

}

- (void)deactivateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _CDUserContextServerClient *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    v18 = v7;
    v19 = self;
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_CDUserContextServerClient deactivateDevices:remoteUserContextProxySourceDeviceUUID:].cold.1(v6);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v25 = v16;
            _os_log_debug_impl(&dword_18DD73000, v17, OS_LOG_TYPE_DEBUG, "Deactivating device %{public}@", buf, 0xCu);
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v13);
    }

    v7 = v18;
    self = v19;
  }
  -[_CDInMemoryUserContext deactivateDevices:remoteUserContextProxySourceDeviceUUID:](self->_userContext, "deactivateDevices:remoteUserContextProxySourceDeviceUUID:", v6, v7);

}

- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void (**v32)(_QWORD, _QWORD);
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_CDUserContextServerClient fetchPropertiesOfRemoteKeyPaths:handler:].cold.1();

  -[_CDUserContextServerClient keyPathsSortedByDeviceID:](self, "keyPathsSortedByDeviceID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    v7[2](v7, 0);
    goto LABEL_20;
  }
  v26 = (void (**)(_QWORD, _QWORD))v7;
  v24 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v9;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (!v12)
    goto LABEL_18;
  v13 = v12;
  v14 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v34 != v14)
        objc_enumerationMutation(v11);
      v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v11, "objectForKeyedSubscript:", v16, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDUserContextServerClient remoteUserContextProxySourceDeviceUUIDForKeyPath:](self, "remoteUserContextProxySourceDeviceUUIDForKeyPath:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __70___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_handler___block_invoke;
        v27[3] = &unk_1E26D57F8;
        v28 = v25;
        v29 = v10;
        v30 = v16;
        v31 = v11;
        v32 = v26;
        -[_CDUserContextServerClient fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:](self, "fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:", v17, v19, v27);

        v20 = v28;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v16;
        _os_log_debug_impl(&dword_18DD73000, v21, OS_LOG_TYPE_DEBUG, "CDUserContext: Unknown device specified: %@", buf, 0xCu);
      }

      objc_msgSend(v10, "addObject:", v16);
      v22 = objc_msgSend(v10, "count");
      if (v22 == objc_msgSend(v11, "count"))
      {
        objc_msgSend(v25, "anyObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v26)[2](v26, v20);
        goto LABEL_15;
      }
LABEL_16:

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  }
  while (v13);
LABEL_18:

  v9 = v23;
  v6 = v24;
  v7 = (void (**)(id, _QWORD))v26;
LABEL_20:

}

- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _CDUserContextService *service;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_CDUserContextServerClient fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:].cold.2();

  v19 = 0;
  +[_CDXPCContextCodecs fetchPropertiesEventWithRemoteKeyPaths:error:](_CDXPCContextCodecs, "fetchPropertiesEventWithRemoteKeyPaths:error:", v8, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (v12)
  {
    service = self->_service;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke;
    v16[3] = &unk_1E26D5820;
    v17 = v8;
    v18 = v10;
    -[_CDUserContextService sendEvent:toProxy:replyHandler:](service, "sendEvent:toProxy:replyHandler:", v12, v9, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_CDUserContextServerClient fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:].cold.1((uint64_t)v8, v15);

    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }

}

- (void)subscribeToContextValueNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _CDUserContextService *service;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint8_t v27;
  _BYTE v28[15];
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_CDUserContextServerClient subscribeToContextValueNotificationsWithRegistration:deviceIDs:].cold.3();

  -[_CDUserContextServerClient deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:](self, "deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        v14 = v9;
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        +[_CDXPCContextCodecs subscribeToContextValueNotificationsEventWithRegistration:deviceIDs:error:](_CDXPCContextCodecs, "subscribeToContextValueNotificationsEventWithRegistration:deviceIDs:error:", v26, v16, &v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v31;
        if (v17)
        {
          service = self->_service;
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke;
          v29[3] = &unk_1E26D5848;
          v30 = v16;
          -[_CDUserContextService sendEvent:toProxy:replyHandler:](service, "sendEvent:toProxy:replyHandler:", v17, v15, v29);
          v20 = v30;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[_CDUserContextServerClient subscribeToContextValueNotificationsWithRegistration:deviceIDs:].cold.2(&v27, v28, v20);
        }
        v9 = v14;

        objc_msgSend(v14, "addObjectsFromArray:", v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  v21 = objc_msgSend(v9, "count");
  if (v21 != objc_msgSend(v24, "count"))
  {
    v22 = (void *)objc_msgSend(v24, "mutableCopy");
    objc_msgSend(v22, "minusSet:", v9);
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[_CDUserContextServerClient subscribeToContextValueNotificationsWithRegistration:deviceIDs:].cold.1((uint64_t)v22, v23);

  }
}

- (void)unsubscribeFromContextValueNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _CDUserContextService *service;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _CDUserContextServerClient *v26;
  uint64_t v27;
  id v28;
  uint8_t v29;
  _BYTE v30[7];
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_CDUserContextServerClient unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:].cold.3();

  v26 = self;
  -[_CDUserContextServerClient deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:](self, "deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v27 = *(_QWORD *)v36;
    v28 = v6;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        v15 = v10;
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        +[_CDXPCContextCodecs unsubscribeFromContextValueNotificationsEventWithRegistration:deviceIDs:error:](_CDXPCContextCodecs, "unsubscribeFromContextValueNotificationsEventWithRegistration:deviceIDs:error:", v6, v17, &v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v34;
        if (v18)
        {
          service = v26->_service;
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke;
          v31[3] = &unk_1E26D5870;
          v32 = v17;
          v33 = v6;
          -[_CDUserContextService sendEvent:toProxy:replyHandler:](service, "sendEvent:toProxy:replyHandler:", v18, v16, v31);

          v21 = v32;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[_CDUserContextServerClient unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:].cold.2(&v29, v30, v21);
        }
        v10 = v15;

        objc_msgSend(v15, "addObjectsFromArray:", v17);
        v6 = v28;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v13);
  }

  v22 = objc_msgSend(v10, "count");
  if (v22 != objc_msgSend(v25, "count"))
  {
    v23 = (void *)objc_msgSend(v25, "mutableCopy");
    objc_msgSend(v23, "minusSet:", v10);
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_CDUserContextServerClient unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:].cold.1();

  }
}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_CDUserContextServerClient subscribeToDeviceStatusChangeNotificationsForDeviceTypes:].cold.2();

  v20 = 0;
  +[_CDXPCCodecs keepAliveEventWithKeepAlive:error:](_CDXPCContextCodecs, "keepAliveEventWithKeepAlive:error:", a3 != 0, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (v6)
  {
    +[_CDContextQueries keyPathForMDCSProxies](_CDContextQueries, "keyPathForMDCSProxies");
    v8 = objc_claimAutoreleasedReturnValue();
    -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
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
          -[_CDUserContextService sendEvent:toProxy:replyHandler:](self->_service, "sendEvent:toProxy:replyHandler:", v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), &__block_literal_global_136_0, (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v13);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_CDUserContextServerClient subscribeToDeviceStatusChangeNotificationsForDeviceTypes:].cold.1();
  }

}

- (id)remoteUserContextProxySourceDeviceUUIDForKeyPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_CDContextQueries keyPathForMDCSProxies](_CDContextQueries, "keyPathForMDCSProxies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v19;
LABEL_4:
      v13 = 0;
      v14 = v11;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v11 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v13);

        -[_CDUserContextServerClient remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:](self, "remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:", v11, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v4);

        if ((v16 & 1) != 0)
          break;
        ++v13;
        v14 = v11;
        if (v10 == v13)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v10)
            goto LABEL_4;

          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)remoteDevices
{
  void *v3;
  void *v4;
  void *v5;

  -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v5;
}

- (id)remoteDeviceIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v5;
}

- (id)remoteDevicesForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDUserContextServerClient remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:](self, "remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:", v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        -[_CDUserContextService remoteDevicesByDeviceID](self->_service, "remoteDevicesByDeviceID", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v8, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  objc_sync_exit(v5);

  return v16;
}

- (id)remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[_CDContextQueries keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:](_CDContextQueries, "keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)deviceIDsForDeviceTypes:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  int v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[_CDUserContextServerClient remoteDevices](self, "remoteDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "matchesDeviceTypes:", a3, (_QWORD)v18))
        {
          objc_msgSend(v11, "deviceID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = objc_msgSend(v5, "count");
    v16 = objc_msgSend(v6, "count");
    _CDPrettyPrintCollection();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v23 = v15;
    v24 = 1024;
    v25 = v16;
    v26 = 1024;
    v27 = a3;
    v28 = 2114;
    v29 = v17;
    _os_log_debug_impl(&dword_18DD73000, v13, OS_LOG_TYPE_DEBUG, "Found %d out of %d device IDs for device types %X: %{public}@", buf, 0x1Eu);

  }
  return v5;
}

- (id)keyPathsSortedByDeviceID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "deviceID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
          }
          objc_msgSend(v12, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)remoteUserContextProxySourceDeviceUUIDByDeviceID
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForMDCSProxies](_CDContextQueries, "keyPathForMDCSProxies");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[_CDUserContextServerClient remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:](self, "remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDUserContextServerClient remoteUserContextProxySourceDeviceUUIDByDeviceID](self, "remoteUserContextProxySourceDeviceUUIDByDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v19;
    *(_QWORD *)&v9 = 138543362;
    v17 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, v17, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);
          }
          -[NSObject addObject:](v15, "addObject:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = v13;
            _os_log_error_impl(&dword_18DD73000, v15, OS_LOG_TYPE_ERROR, "Unknown device id: %{public}@", buf, 0xCu);
          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isMDCSNeededForKeyPathInKeyPaths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[_CDUserContextServerClient isMDCSNeededForKeyPath:](self, "isMDCSNeededForKeyPath:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)addObjects:(id)a3 toArrayAtPath:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _BOOL8);
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _BOOL8))a5;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    _CDRedactedObjectForKeyPath(v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v9;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_18DD73000, v11, OS_LOG_TYPE_DEFAULT, "CDUserContext: ADD %@ => %@", (uint8_t *)&v18, 0x16u);

  }
  +[_CDContextQueries keyPathForAppWebUsageDataDictionaries](_CDContextQueries, "keyPathForAppWebUsageDataDictionaries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v13))
  {
    v14 = -[_CDUserContextServerClient _shouldUpdateWebUsageForCurrentUser](self, "_shouldUpdateWebUsageForCurrentUser");

    if (!v14)
      goto LABEL_11;
  }
  else
  {

  }
  LOBYTE(v18) = 0;
  -[_CDInMemoryUserContext addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:](self->_userContext, "addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", v8, 0, v9, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v18)
  {
    -[_CDUserContextService persistence](self->_service, "persistence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "saveValue:forKeyPath:", v15, v9);

    v17 = (_BYTE)v18 != 0;
  }
  else
  {
    v17 = 0;
  }
  v10[2](v10, v17);

LABEL_11:
}

- (void)removeObjects:(id)a3 fromArrayAtPath:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _BOOL8);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _BOOL8))a5;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    _CDRedactedObjectForKeyPath(v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_18DD73000, v11, OS_LOG_TYPE_DEFAULT, "CDUserContext: REMOVE %@ => %@", (uint8_t *)&v16, 0x16u);

  }
  LOBYTE(v16) = 0;
  -[_CDInMemoryUserContext addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:](self->_userContext, "addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", 0, v8, v9, &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v16)
  {
    -[_CDUserContextService persistence](self->_service, "persistence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "saveValue:forKeyPath:", v13, v9);

    v15 = (_BYTE)v16 != 0;
  }
  else
  {
    v15 = 0;
  }
  v10[2](v10, v15);

}

- (void)removeObjectsMatchingPredicate:(id)a3 fromArrayAtPath:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  _CDInMemoryUserContext *userContext;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_18DD73000, v11, OS_LOG_TYPE_DEFAULT, "CDUserContext: Remove object matching predicate %@ => %@", buf, 0x16u);
  }

  if (!+[_CDPredicateValidator validatePredicate:allowedKeys:error:](_CDPredicateValidator, "validatePredicate:allowedKeys:error:", v8, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[_CDUserContextServerClient removeObjectsMatchingPredicate:fromArrayAtPath:handler:].cold.2();
    goto LABEL_14;
  }
  if (v8)
  {
    if (+[_CDPredicateValidator validatePredicate:allowedKeys:error:](_CDPredicateValidator, "validatePredicate:allowedKeys:error:", v8, 0, 0))
    {
      objc_msgSend(v8, "allowEvaluation");
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[_CDUserContextServerClient removeObjectsMatchingPredicate:fromArrayAtPath:handler:].cold.1();
LABEL_14:

    v10[2](v10, MEMORY[0x1E0C9AA60]);
    goto LABEL_15;
  }
LABEL_7:
  userContext = self->_userContext;
  v17 = 0;
  -[_CDInMemoryUserContext removeObjectsMatchingPredicate:fromArrayAtKeyPath:removedObjects:](userContext, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:removedObjects:", v8, v9, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;
  if (objc_msgSend(v14, "count"))
  {
    -[_CDUserContextService persistence](self->_service, "persistence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveValue:forKeyPath:", v13, v9);

  }
  ((void (**)(id, id))v10)[2](v10, v14);

LABEL_15:
}

- (BOOL)_shouldUpdateWebUsageForCurrentUser
{
  return 1;
}

- (void)valuesForPaths:(id)a3 inContextsMatching:(id)a4 handler:(id)a5
{
  _CDInMemoryUserContext *userContext;
  id v9;
  id v10;

  userContext = self->_userContext;
  v9 = a5;
  -[_CDInMemoryUserContext valuesForKeyPaths:inContextsMatchingPredicate:](userContext, "valuesForKeyPaths:inContextsMatchingPredicate:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v9, v10);

}

- (void)valuesForPaths:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _CDUserContextService *service;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_CDUserContextService remoteDevicesHaveBeenActivated](self->_service, "remoteDevicesHaveBeenActivated")
    || !-[_CDUserContextServerClient isMDCSNeededForKeyPathInKeyPaths:](self, "isMDCSNeededForKeyPathInKeyPaths:", v6))
  {
    -[_CDUserContextServerClient _valuesForPaths:handler:](self, "_valuesForPaths:handler:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18DD73000, v8, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", buf, 0xCu);
    }

    service = self->_service;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53___CDUserContextServerClient_valuesForPaths_handler___block_invoke;
    v10[3] = &unk_1E26D5660;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[_CDUserContextService requestActivateDevicesFromAllSubscribersWithHandler:](service, "requestActivateDevicesFromAllSubscribersWithHandler:", v10);

  }
}

- (void)_valuesForPaths:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *queue;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id obj;
  _QWORD v20[6];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[4];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  _QWORD v38[5];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = v6;
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v17 = v7;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__2;
    v38[4] = __Block_byref_object_dispose__2;
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v8);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__2;
    v35[4] = __Block_byref_object_dispose__2;
    v36 = (id)os_transaction_create();
    v10 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke;
    block[3] = &unk_1E26D58D8;
    v32 = v38;
    v34 = v9;
    v12 = v7;
    v31 = v12;
    v33 = v35;
    dispatch_after(v10, queue, block);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v18;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v27;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_139;
          v20[3] = &unk_1E26D5928;
          v20[4] = self;
          v20[5] = v16;
          v22 = v38;
          v23 = v37;
          v25 = v9;
          v21 = v12;
          v24 = v35;
          -[_CDUserContextServerClient _valueForPath:handler:](self, "_valueForPath:handler:", v16, v20);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v13);
    }

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v38, 8);

    v7 = v17;
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)activateMonitorQueue
{
  return self->_activateMonitorQueue;
}

- (void)setActivateMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activateMonitorQueue, a3);
}

- (_CDUserContextService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (_CDInMemoryUserContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (NSMutableSet)wakingRegistrations
{
  return self->_wakingRegistrations;
}

- (void)setWakingRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_wakingRegistrations, a3);
}

- (NSMutableSet)nonWakingRegistration
{
  return self->_nonWakingRegistration;
}

- (void)setNonWakingRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_nonWakingRegistration, a3);
}

- (NSMutableDictionary)devicesToActivateByRemoteUserContextProxySourceDeviceUUID
{
  return self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
}

- (void)setDevicesToActivateByRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID, 0);
  objc_storeStrong((id *)&self->_nonWakingRegistration, 0);
  objc_storeStrong((id *)&self->_wakingRegistrations, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_activateMonitorQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_valueForRemotePath:(void *)a1 handler:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  _CDRedactedObjectForKeyPath(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_3(&dword_18DD73000, v3, v4, "CDUserContext: GET %@ = %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_valueForRemotePath:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_18DD73000, v0, v1, "Illegal GET of remote key path: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)registerCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_18DD73000, v0, v1, "Registering multi-device callback: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)deregisterCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_18DD73000, v0, v1, "Deregistering multi-device callback: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)activateDevices:(void *)a1 remoteUserContextProxySourceDeviceUUID:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_1(&dword_18DD73000, v2, v3, "Registering remote user context proxy %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)activateDevices:(void *)a1 remoteUserContextProxySourceDeviceUUID:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_15_0(&dword_18DD73000, v1, v2, "Activating %u devices:", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)activateDevices:(uint8_t *)buf remoteUserContextProxySourceDeviceUUID:(os_log_t)log .cold.3(void *a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEBUG, "Waiting for proxy token for remote user context proxy %{public}@ before activating %u devices", buf, 0x12u);

}

- (void)deactivateDevices:(void *)a1 remoteUserContextProxySourceDeviceUUID:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_15_0(&dword_18DD73000, v1, v2, "Deactivating %u devices:", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)fetchPropertiesOfRemoteKeyPaths:handler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_1(&dword_18DD73000, v1, v2, "Fetching properties of remote key paths: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

- (void)fetchPropertiesOfRemoteKeyPaths:(uint64_t)a1 remoteUserContextProxySourceDeviceUUID:(NSObject *)a2 handler:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, a2, v4, "Invalid key paths: %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3(&dword_18DD73000, v0, v1, "Fetching properties of remote key paths from %{public}@: %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)subscribeToContextValueNotificationsWithRegistration:(uint64_t)a1 deviceIDs:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, a2, v4, "Unable to subscribe to user context value notifications on remote devices: %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)subscribeToContextValueNotificationsWithRegistration:(NSObject *)a3 deviceIDs:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_12_0(&dword_18DD73000, a3, (uint64_t)a3, "Invalid registration or remote deviceIDs", a1);
}

- (void)subscribeToContextValueNotificationsWithRegistration:deviceIDs:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_3(&dword_18DD73000, v1, v2, "Subscribing to context value change notifications on devices %{public}@ with registration: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14_0(&dword_18DD73000, v1, v2, "Unable to unsubscribe from  user context value notifications on devices %{public}@ with registration: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)unsubscribeFromContextValueNotificationsWithRegistration:(NSObject *)a3 deviceIDs:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_12_0(&dword_18DD73000, a3, (uint64_t)a3, "Invalid registration or deviceIDs", a1);
}

- (void)unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2_3();
  _CDPrettyPrintCollection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_3(&dword_18DD73000, v1, v2, "Unsubscribing from context value change notifications on devices %{public}@ with registration: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_12_0(&dword_18DD73000, v0, v1, "Unable to instantiate keep alive event", v2);
  OUTLINED_FUNCTION_13();
}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_10(&dword_18DD73000, v0, v1, "Requesting to subscribe to device status change notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)setObject:(void *)a1 forPath:(void *)a2 handler:.cold.1(void *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  _CDRedactedObjectForKeyPath(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_3(&dword_18DD73000, v3, v4, "CDUserContext: SET %@ => %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)removeObjectsMatchingPredicate:fromArrayAtPath:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_18(&dword_18DD73000, v0, v1, "Client provided invalid predicate %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeObjectsMatchingPredicate:fromArrayAtPath:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_18(&dword_18DD73000, v0, v1, "Client provided invalid predicate to removeObjectsMatchingPredicate:fromArrayAtPath:handler: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
