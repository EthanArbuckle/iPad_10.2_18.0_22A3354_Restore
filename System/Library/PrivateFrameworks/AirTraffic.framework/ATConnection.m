@implementation ATConnection

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)connection:(id)a3 updatedAssets:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__ATConnection_connection_updatedAssets___block_invoke;
  v7[3] = &unk_24C4CA350;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__ATConnection_connection_updatedProgress___block_invoke;
  v7[3] = &unk_24C4CA350;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __41__ATConnection_connection_updatedAssets___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "connection:updatedAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __43__ATConnection_connection_updatedProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "connection:updatedProgress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (ATConnectionDelegate)delegate
{
  return (ATConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)registerForAssetProgressForDataclass:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_registeredDataclasses, "containsObject:") & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_registeredDataclasses, "addObject:", v4);
    if (self->_atcRunning)
      -[ATConnection _sendStatusRegistrationWithCompletion:](self, "_sendStatusRegistrationWithCompletion:", &__block_literal_global_133);
    else
      -[ATConnection connection:updatedAssets:](self, "connection:updatedAssets:", self, MEMORY[0x24BDBD1A8]);
  }

}

- (void)_sendStatusRegistrationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *registeredDataclasses;
  const char *v7;
  NSXPCConnection *xpcConnection;
  uint64_t v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NSMutableArray *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    registeredDataclasses = self->_registeredDataclasses;
    if (self->_registerForStatus)
      v7 = "enabled";
    else
      v7 = "disabled";
    *(_DWORD *)buf = 136315394;
    v20 = v7;
    v21 = 2114;
    v22 = registeredDataclasses;
    _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "sending async registration %s message, dataclasses %{public}@", buf, 0x16u);
  }

  xpcConnection = self->_xpcConnection;
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__ATConnection__sendStatusRegistrationWithCompletion___block_invoke;
  v17[3] = &unk_24C4CA098;
  v10 = v4;
  v18 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_registeredDataclasses;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_registerForStatus);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __54__ATConnection__sendStatusRegistrationWithCompletion___block_invoke_132;
  v15[3] = &unk_24C4CA098;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v11, "registerForStatusOfDataclasses:enabled:withCompletion:", v12, v13, v15);

}

- (ATConnection)init
{
  ATConnection *v2;
  NSObject *v3;
  id v4;
  NSMutableArray *v5;
  NSMutableArray *registeredDataclasses;
  uint64_t v7;
  NSXPCConnection *xpcConnection;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSXPCConnection *v21;
  uint64_t v22;
  NSXPCConnection *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t state64;
  _QWORD handler[4];
  id v31;
  id location;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)ATConnection;
  v2 = -[ATConnection init](&v33, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __20__ATConnection_init__block_invoke;
    handler[3] = &unk_24C4C9F08;
    objc_copyWeak(&v31, &location);
    notify_register_dispatch("com.apple.atc.started", &v2->_atcRunningToken, v3, handler);

    state64 = 0;
    notify_get_state(v2->_atcRunningToken, &state64);
    if (state64)
      v2->_atcRunning = 1;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    registeredDataclasses = v2->_registeredDataclasses;
    v2->_registeredDataclasses = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.atc.xpc"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v7;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473B180);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v9);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2547386F0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_connection_updatedProgress_, 1, 0);

    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_connection_updatedAssets_, 1, 0);

    -[NSXPCConnection setExportedInterface:](v2->_xpcConnection, "setExportedInterface:", v10);
    objc_msgSend(MEMORY[0x24BE65CD0], "proxyWithObject:protocol:", v2, &unk_2547386F0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", v20);

    v21 = v2->_xpcConnection;
    v22 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __20__ATConnection_init__block_invoke_105;
    v27[3] = &unk_24C4C9F30;
    objc_copyWeak(&v28, &location);
    -[NSXPCConnection setInterruptionHandler:](v21, "setInterruptionHandler:", v27);
    v23 = v2->_xpcConnection;
    v25[0] = v22;
    v25[1] = 3221225472;
    v25[2] = __20__ATConnection_init__block_invoke_107;
    v25[3] = &unk_24C4C9F30;
    objc_copyWeak(&v26, &location);
    -[NSXPCConnection setInvalidationHandler:](v23, "setInvalidationHandler:", v25);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  int atcRunningToken;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  objc_super v6;

  atcRunningToken = self->_atcRunningToken;
  if (atcRunningToken)
  {
    notify_cancel(atcRunningToken);
    self->_atcRunningToken = 0;
  }
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection invalidate](xpcConnection, "invalidate");
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)ATConnection;
  -[ATConnection dealloc](&v6, sel_dealloc);
}

- (void)_handleDisconnect
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "connectionWasInterrupted:", self);

}

- (void)requestSyncForLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "Sync request for library %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_1155);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestSyncForLibrary:withCompletion:", v4, &__block_literal_global_112);

}

- (void)requestSyncForPairedDeviceWithPriority:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = *(_QWORD *)&a3;
  v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "sync request for paired device", v7, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_113);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestSyncForPairedDeviceWithPriority:withCompletion:", v3, &__block_literal_global_115);

}

- (void)requestKeybagSyncToPairedDevice
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "requesting keybag sync to paired device", v5, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_116);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestKeybagSyncToPairedDeviceWithCompletion:", &__block_literal_global_118);

}

- (void)cancelSync
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "Cancel sync", v5, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_119);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSyncWithCompletion:", &__block_literal_global_121);

}

- (void)prioritizeAsset:(id)a3 forDataclass:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_20BB5D000, v8, OS_LOG_TYPE_DEFAULT, "prioritize asset - %{public}@ %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_122);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prioritizeAsset:forDataclass:withCompletion:", v6, v7, &__block_literal_global_124);

}

- (void)purgePartialAsset:(id)a3 forDataclass:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_20BB5D000, v8, OS_LOG_TYPE_DEFAULT, "purge partial asset:%{public}@ for data class:%{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_125);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purgePartialAsset:forDataclass:withCompletion:", v6, v7, &__block_literal_global_127);

}

- (void)registerForStatus
{
  if (!self->_registerForStatus)
  {
    self->_registerForStatus = 1;
    if (self->_atcRunning)
      -[ATConnection _sendStatusRegistrationWithCompletion:](self, "_sendStatusRegistrationWithCompletion:", &__block_literal_global_128);
  }
}

- (void)unregisterForStatus
{
  if (self->_registerForStatus)
  {
    self->_registerForStatus = 0;
    if (self->_atcRunning)
      -[ATConnection _sendStatusRegistrationWithCompletion:](self, "_sendStatusRegistrationWithCompletion:", &__block_literal_global_129);
  }
}

- (void)clearSyncData
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "clear sync data", v5, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_134);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSyncDataWithCompletion:", &__block_literal_global_136);

}

- (void)lowBatteryNotification
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "low battery notification", v5, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_137);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowBatteryNotificationWithCompletion:", &__block_literal_global_139);

}

- (void)keepATCAlive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "keep ATC alive, enabled:%d", (uint8_t *)v7, 8u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_140);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keepATCAlive:withCompletion:", v3, &__block_literal_global_142);

}

- (BOOL)isSyncing:(BOOL *)a3 automatically:(BOOL *)a4 wirelessly:(BOOL *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1137;
  v19 = __Block_byref_object_dispose__1138;
  v20 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_143);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__ATConnection_isSyncing_automatically_wirelessly___block_invoke_144;
  v14[3] = &unk_24C4CA160;
  v14[4] = &v15;
  objc_msgSend(v8, "getSyncStateWithCompletion:", v14);

  if (a3)
  {
    objc_msgSend((id)v16[5], "objectForKey:", CFSTR("Syncing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v9, "BOOLValue");

  }
  if (a4)
  {
    objc_msgSend((id)v16[5], "objectForKey:", CFSTR("Automatic"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend(v10, "BOOLValue");

  }
  if (a5)
  {
    objc_msgSend((id)v16[5], "objectForKey:", CFSTR("Wireless"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v11, "BOOLValue");

  }
  v12 = v16[5] != 0;
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (void)openDeviceMessageLink
{
  -[ATConnection openDeviceMessageLinkWithPriority:](self, "openDeviceMessageLinkWithPriority:", 0);
}

- (void)openDeviceMessageLinkWithPriority:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  NSXPCConnection *xpcConnection;
  void *v8;
  _QWORD v9[4];
  int v10;
  _QWORD v11[4];
  int v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = v3;
    _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "Open device message link with priority %d", buf, 8u);
  }

  v6 = MEMORY[0x24BDAC760];
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__ATConnection_openDeviceMessageLinkWithPriority___block_invoke;
  v11[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
  v12 = v3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __50__ATConnection_openDeviceMessageLinkWithPriority___block_invoke_153;
  v9[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
  v10 = v3;
  objc_msgSend(v8, "openDeviceMessageLinkWithPriority:withCompletion:", v3, v9);

}

- (id)restoreDeviceWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *xpcConnection;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1137;
  v16 = __Block_byref_object_dispose__1138;
  v17 = 0;
  v5 = MEMORY[0x24BDAC760];
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__ATConnection_restoreDeviceWithIdentifier___block_invoke;
  v11[3] = &unk_24C4CA1A8;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __44__ATConnection_restoreDeviceWithIdentifier___block_invoke_2;
  v10[3] = &unk_24C4CA1A8;
  v10[4] = &v12;
  objc_msgSend(v7, "restoreFromDeviceWithIdentifier:completion:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)getAssetMetrics
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1137;
  v13 = __Block_byref_object_dispose__1138;
  v14 = 0;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "get asset metrics", buf, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_154);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__ATConnection_getAssetMetrics__block_invoke_155;
  v7[3] = &unk_24C4CA160;
  v7[4] = &v9;
  objc_msgSend(v4, "getAssetMetricswithCompletion:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (BOOL)getDataRestoreIsComplete
{
  NSObject *v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[16];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "check data restore state", buf, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_156);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__ATConnection_getDataRestoreIsComplete__block_invoke_157;
  v6[3] = &unk_24C4CA210;
  v6[4] = &v8;
  objc_msgSend(v4, "getDataRestoreIsCompleteWithCompletion:", v6);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (void)initiateAssetDownloadSessionsWithCompletion:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__ATConnection_initiateAssetDownloadSessionsWithCompletion___block_invoke;
  v12[3] = &unk_24C4CA098;
  v7 = v4;
  v13 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __60__ATConnection_initiateAssetDownloadSessionsWithCompletion___block_invoke_2;
  v10[3] = &unk_24C4CA098;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "initiateAssetDownloadSessionsWithCompletion:", v10);

}

- (void)connectionWasInterrupted:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ATConnection_connectionWasInterrupted___block_invoke;
  block[3] = &unk_24C4CA300;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registeredDataclasses, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __41__ATConnection_connectionWasInterrupted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "connectionWasInterrupted:", *(_QWORD *)(a1 + 32));

}

uint64_t __60__ATConnection_initiateAssetDownloadSessionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__ATConnection_initiateAssetDownloadSessionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __40__ATConnection_getDataRestoreIsComplete__block_invoke_157(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_ERROR, "check data restore state failed. err=%{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

void __40__ATConnection_getDataRestoreIsComplete__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "check data restore state - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __31__ATConnection_getAssetMetrics__block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_20BB5D000, v7, OS_LOG_TYPE_ERROR, "get asset metrics failed. err=%{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

void __31__ATConnection_getAssetMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "get asset metrics - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __44__ATConnection_restoreDeviceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __44__ATConnection_restoreDeviceWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__ATConnection_openDeviceMessageLinkWithPriority___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "Open device message link with priority %d - failed to obtain remote proxy. err=%{public}@", (uint8_t *)v6, 0x12u);
  }

}

void __50__ATConnection_openDeviceMessageLinkWithPriority___block_invoke_153(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_DWORD *)(a1 + 32);
      v6[0] = 67109378;
      v6[1] = v5;
      v7 = 2114;
      v8 = v3;
      _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "Open device message link with priority %d failed. err=%{public}@", (uint8_t *)v6, 0x12u);
    }

  }
}

void __51__ATConnection_isSyncing_automatically_wirelessly___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_20BB5D000, v7, OS_LOG_TYPE_ERROR, "failed to get sync state. err=%{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

void __51__ATConnection_isSyncing_automatically_wirelessly___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "isSyncing - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __29__ATConnection_keepATCAlive___block_invoke_141(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "keep ATC alive failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __29__ATConnection_keepATCAlive___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "keep ATC alive - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __38__ATConnection_lowBatteryNotification__block_invoke_138(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "low battery notification failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __38__ATConnection_lowBatteryNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "low battery notification - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __29__ATConnection_clearSyncData__block_invoke_135(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "clear sync data failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __29__ATConnection_clearSyncData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "clear sync data - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __54__ATConnection__sendStatusRegistrationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "sending async registration - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __54__ATConnection__sendStatusRegistrationWithCompletion___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __47__ATConnection_purgePartialAsset_forDataclass___block_invoke_126(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "purge partial asset failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __47__ATConnection_purgePartialAsset_forDataclass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "purge partial asset - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __45__ATConnection_prioritizeAsset_forDataclass___block_invoke_123(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "prioritize asset failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __45__ATConnection_prioritizeAsset_forDataclass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "prioritize asset - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __26__ATConnection_cancelSync__block_invoke_120(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "cancel sync failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __26__ATConnection_cancelSync__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "cancel sync - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __47__ATConnection_requestKeybagSyncToPairedDevice__block_invoke_117(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "requesting keybag sync to paired device failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __47__ATConnection_requestKeybagSyncToPairedDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "requesting keybag sync to paired device - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __55__ATConnection_requestSyncForPairedDeviceWithPriority___block_invoke_114(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "request sync for paired device failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __55__ATConnection_requestSyncForPairedDeviceWithPriority___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "request sync for paired device - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __38__ATConnection_requestSyncForLibrary___block_invoke_111(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "request sync for library failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __38__ATConnection_requestSyncForLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "request sync for library - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __20__ATConnection_init__block_invoke(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  NSObject *v4;
  uint32_t state;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  _BYTE *v9;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_DEFAULT, "Got ATC startup notification", buf, 2u);
    }

    state64 = 0;
    state = notify_get_state(a2, &state64);
    if (state || !state64)
    {
      v7 = os_log_create("com.apple.amp.AirTraffic", "XPC");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v12 = state;
        v13 = 2048;
        v14 = state64;
        _os_log_impl(&dword_20BB5D000, v7, OS_LOG_TYPE_DEFAULT, "Error getting state - startupState %u, state %llu", buf, 0x12u);
      }

      WeakRetained[36] = 0;
    }
    else if (WeakRetained[36])
    {
      v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_DEFAULT, "Not sending status registration", buf, 2u);
      }

    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __20__ATConnection_init__block_invoke_2;
      v8[3] = &unk_24C4C9EE0;
      v9 = WeakRetained;
      objc_msgSend(v9, "_sendStatusRegistrationWithCompletion:", v8);

    }
  }

}

void __20__ATConnection_init__block_invoke_105(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20BB5D000, v2, OS_LOG_TYPE_DEFAULT, "xpc connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDisconnect");

}

void __20__ATConnection_init__block_invoke_107(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20BB5D000, v2, OS_LOG_TYPE_DEFAULT, "xpc connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDisconnect");

}

void __20__ATConnection_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_DEFAULT, "sending async registration finished with err=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) = 1;
}

@end
