@implementation BBXPCSyncService

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_1);
  return (id)clientInterface___interface;
}

void __35__BBXPCSyncService_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A9E68);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface___interface;
  clientInterface___interface = v0;

}

- (BBXPCSyncService)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  BBXPCSyncService *v8;
  BBXPCSyncService *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *connectionQueue;
  id v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BBXPCSyncService;
  v8 = -[BBXPCSyncService init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = dispatch_queue_create("com.apple.bulletinboard.BBXPCSyncService.connectionQueue", 0);
    connectionQueue = v9->_connectionQueue;
    v9->_connectionQueue = (OS_dispatch_queue *)v10;

    v12 = -[BBXPCSyncService _ensureConnection](v9, "_ensureConnection");
  }

  return v9;
}

- (id)_ensureConnection
{
  NSObject *connectionQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__BBXPCSyncService__ensureConnection__block_invoke;
  v5[3] = &unk_24C563008;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__BBXPCSyncService__ensureConnection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1988]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:options:", *MEMORY[0x24BEBF508], 0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(MEMORY[0x24BEBF498], "serverInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(MEMORY[0x24BEBF498], "clientInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedInterface:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInterruptionHandler:", &__block_literal_global_45);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __37__BBXPCSyncService__ensureConnection__block_invoke_46;
    v17 = &unk_24C562FE0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v11, "setInvalidationHandler:", &v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume", v14, v15, v16, v17);
    v12 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Created IDS XPC SyncService connection %@", buf, 0xCu);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __37__BBXPCSyncService__ensureConnection__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20CCB9000, v0, OS_LOG_TYPE_DEFAULT, "IDS XPC SyncService connection interrupted", v1, 2u);
  }
}

void __37__BBXPCSyncService__ensureConnection__block_invoke_46(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "IDS XPC SyncService connection invalidated", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetConnection");

}

- (void)_resetConnection
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__BBXPCSyncService__resetConnection__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __36__BBXPCSyncService__resetConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

- (id)serverProxyObject
{
  void *v2;
  void *v3;

  -[BBXPCSyncService _ensureConnection](self, "_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __37__BBXPCSyncService_serverProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR))
    __37__BBXPCSyncService_serverProxyObject__block_invoke_cold_1((uint64_t)v2, v3);

}

- (unint64_t)pairedDeviceCount
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[BBXPCSyncService serverProxyObject](self, "serverProxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__BBXPCSyncService_pairedDeviceCount__block_invoke;
  v5[3] = &unk_24C563050;
  v5[4] = &v6;
  objc_msgSend(v2, "pairedSyncDeviceCountWithHandler:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__BBXPCSyncService_pairedDeviceCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)enqueueSyncedRemovalForBulletin:(id)a3 feeds:(unint64_t)a4
{
  BBSyncServiceDelegate **p_delegate;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v7, "sectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "syncService:universalSectionIdentifierForSectionIdentifier:", self, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[BBXPCSyncService serverProxyObject](self, "serverProxyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BBUNCoreConversion toUNCBulletin:](BBUNCoreConversion, "toUNCBulletin:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "enqueueSyncedRemovalForBulletin:universalSectionID:feeds:", v11, v12, +[BBUNCoreConversion toUNCFeed:](BBUNCoreConversion, "toUNCFeed:", a4));
}

- (void)syncServiceDidReceiveMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("dismissals"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("dismissalIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sectionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("universalSectionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("feeds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syncService:receivedDismissalDictionaries:dismissalIDs:inSection:universalSectionID:forFeeds:", self, v11, v5, v6, v7, v9);

}

- (BBSyncServiceDelegate)delegate
{
  return (BBSyncServiceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __37__BBXPCSyncService_serverProxyObject__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20CCB9000, a2, OS_LOG_TYPE_ERROR, "BBXPCSyncService: Error getting remote proxy %@", (uint8_t *)&v2, 0xCu);
}

@end
