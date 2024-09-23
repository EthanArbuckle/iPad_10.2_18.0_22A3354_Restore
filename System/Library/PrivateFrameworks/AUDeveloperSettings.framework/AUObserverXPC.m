@implementation AUObserverXPC

- (AUObserverXPC)init
{
  AUObserverXPC *v2;
  uint64_t v3;
  NSUUID *uuid;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  uint64_t v9;
  NSXPCListener *xpcListener;
  void *v11;
  NSUUID *v12;
  void *v13;
  NSXPCConnection *xpcConnection;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AUObserverXPC;
  v2 = -[AUObserverXPC init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v9 = objc_claimAutoreleasedReturnValue();
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (NSXPCListener *)v9;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_xpcListener, "resume");
    -[AUObserverXPC remoteObject](v2, "remoteObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v2->_uuid;
    -[NSXPCListener endpoint](v2->_xpcListener, "endpoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:withEndpoint:", v12, v13);

    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = 0;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AUObserverXPC removeObserver](self, "removeObserver");
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AUObserverXPC;
  -[AUObserverXPC dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD block[4];
  id v10;
  AUObserverXPC *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_24DFEE868;
  v10 = v5;
  v11 = self;
  v12 = &v13;
  v7 = v5;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)internalQueue;
}

void __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  _QWORD v5[4];
  int v6;
  _QWORD v7[4];
  int v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2551FB808);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExportedInterface:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", *(_QWORD *)(a1 + 40));
  LODWORD(v2) = objc_msgSend(*(id *)(a1 + 32), "processIdentifier");
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_2;
  v7[3] = &__block_descriptor_36_e5_v8__0l;
  v8 = (int)v2;
  objc_msgSend(*(id *)(a1 + 32), "setInterruptionHandler:", v7);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_60;
  v5[3] = &__block_descriptor_36_e5_v8__0l;
  v6 = (int)v2;
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(a1 + 32), "resume");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "processIdentifier");
    *(_DWORD *)buf = 67109120;
    v10 = v4;
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "New connection from PID %d", buf, 8u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

void __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(a1);
}

void __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_60(uint64_t a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v2 = *(_DWORD *)(a1 + 32);
    v3[0] = 67109120;
    v3[1] = v2;
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Connection from PID %d invalidated", (uint8_t *)v3, 8u);
  }
}

- (id)remoteObject
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[AUObserverXPC xpcConnectionToDaemon](AUObserverXPC, "xpcConnectionToDaemon");
  v3 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  v5 = self->_xpcConnection;
  if (v5)
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[AUObserverXPC remoteObject]";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: remoteObject: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void __29__AUObserverXPC_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __29__AUObserverXPC_remoteObject__block_invoke_cold_1(a2);
}

+ (id)xpcConnectionToDaemon
{
  void *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.accessoryupdater.observer"), 4096);
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v3)
      +[AUObserverXPC xpcConnectionToDaemon].cold.2(v3, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25521C398);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v11);
    objc_msgSend(v2, "resume");
    v12 = v2;

  }
  else if (v3)
  {
    +[AUObserverXPC xpcConnectionToDaemon].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return v2;
}

- (void)registerClient:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__AUObserverXPC_registerClient___block_invoke;
  v7[3] = &unk_24DFEE8D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __32__AUObserverXPC_registerClient___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (void)unregisterClient
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__AUObserverXPC_unregisterClient__block_invoke;
  block[3] = &unk_24DFEE8F8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __33__AUObserverXPC_unregisterClient__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)stopMonitoring
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__AUObserverXPC_stopMonitoring__block_invoke;
  block[3] = &unk_24DFEE8F8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __31__AUObserverXPC_stopMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver");
}

- (void)removeObserver
{
  void *v3;
  NSXPCConnection *xpcConnection;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[AUObserverXPC removeObserver]";
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }
  -[AUObserverXPC remoteObject](self, "remoteObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_uuid);

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)clearDropboxForModelNumber:(id)a3 withFusing:(id)a4
{
  id v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[AUObserverXPC clearDropboxForModelNumber:withFusing:]";
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }
  -[AUObserverXPC remoteObject](self, "remoteObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearDropboxForModelNumber:withFusing:", v5, 0);

}

- (void)settingsChangedForSerialNumber:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[AUObserverXPC settingsChangedForSerialNumber:]";
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }
  -[AUObserverXPC remoteObject](self, "remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settingsChangedForSerialNumber:", v4);

}

- (void)addAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__AUObserverXPC_addAccessoryID_assetID___block_invoke;
  block[3] = &unk_24DFEE920;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

_QWORD *__40__AUObserverXPC_addAccessoryID_assetID___block_invoke(_QWORD *result)
{
  if (*(_QWORD *)(result[4] + 40))
    return (_QWORD *)objc_msgSend(*(id *)(result[4] + 40), "addAccessoryID:assetID:", result[5], result[6]);
  return result;
}

- (void)removeAccessoryID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__AUObserverXPC_removeAccessoryID___block_invoke;
  v7[3] = &unk_24DFEE8D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __35__AUObserverXPC_removeAccessoryID___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 40), "removeAccessoryID:", *(_QWORD *)(result + 40));
  return result;
}

- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v10 = a3;
  v11 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__AUObserverXPC_firmwareUpdateProgressForAccessoryID_assetID_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_24DFEE948;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(internalQueue, block);

}

_QWORD *__83__AUObserverXPC_firmwareUpdateProgressForAccessoryID_assetID_bytesSent_bytesTotal___block_invoke(_QWORD *result)
{
  if (*(_QWORD *)(result[4] + 40))
    return (_QWORD *)objc_msgSend(*(id *)(result[4] + 40), "firmwareUpdateProgressForAccessoryID:assetID:bytesSent:bytesTotal:", result[5], result[6], result[7], result[8]);
  return result;
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__AUObserverXPC_stagingCompleteForAccessoryID_assetID_status___block_invoke;
  v13[3] = &unk_24DFEE970;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

_QWORD *__62__AUObserverXPC_stagingCompleteForAccessoryID_assetID_status___block_invoke(_QWORD *result)
{
  if (*(_QWORD *)(result[4] + 40))
    return (_QWORD *)objc_msgSend(*(id *)(result[4] + 40), "stagingCompleteForAccessoryID:assetID:status:", result[5], result[6], result[7]);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredClient, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(uint64_t a1)
{
  int v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 32);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Connection to PID %d interrupted", (uint8_t *)v2, 8u);
}

void __29__AUObserverXPC_remoteObject__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[AUObserverXPC remoteObject]_block_invoke";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Failed to get remote object: %@", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)xpcConnectionToDaemon
{
  OUTLINED_FUNCTION_0(&dword_21BF1C000, MEMORY[0x24BDACB70], a3, "%s: Got xpc connection", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
