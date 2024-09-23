@implementation SPDeviceConnection

+ (id)sharedDeviceConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SPDeviceConnection_sharedDeviceConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDeviceConnection_onceToken != -1)
    dispatch_once(&sharedDeviceConnection_onceToken, block);
  return (id)sharedDeviceConnection___sharedDeviceConnection;
}

void __44__SPDeviceConnection_sharedDeviceConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___SPDeviceConnection;
  v1 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedDeviceConnection___sharedDeviceConnection;
  sharedDeviceConnection___sharedDeviceConnection = v1;

  objc_msgSend((id)sharedDeviceConnection___sharedDeviceConnection, "connectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_3);

}

uint64_t __44__SPDeviceConnection_sharedDeviceConnection__block_invoke_2()
{
  return objc_msgSend((id)sharedDeviceConnection___sharedDeviceConnection, "createXPCConnectionIfNecessary");
}

- (SPDeviceConnection)init
{
  SPDeviceConnection *v2;
  uint64_t v3;
  NSHashTable *observers;
  dispatch_queue_t v5;
  OS_dispatch_queue *connectionQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPDeviceConnection;
  v2 = -[SPDeviceConnection init](&v8, sel_init);
  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
  v3 = objc_claimAutoreleasedReturnValue();
  observers = v2->_observers;
  v2->_observers = (NSHashTable *)v3;

  v5 = dispatch_queue_create("com.apple.WatchKit.connectionQueue", 0);
  connectionQueue = v2->_connectionQueue;
  v2->_connectionQueue = (OS_dispatch_queue *)v5;

  return v2;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "sharedDeviceConnection", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)createXPCConnectionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[SPDeviceConnection serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.companionappd"), 4096);
    -[SPDeviceConnection setServerConnection:](self, "setServerConnection:", v4);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DF3C60);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPDeviceConnection serverConnection](self, "serverConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v5);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DF2D88);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPDeviceConnection serverConnection](self, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v7);

    -[SPDeviceConnection serverConnection](self, "serverConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedObject:", self);

    objc_initWeak(&location, self);
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __52__SPDeviceConnection_createXPCConnectionIfNecessary__block_invoke;
    v16[3] = &unk_24D3BC090;
    objc_copyWeak(&v17, &location);
    -[SPDeviceConnection serverConnection](self, "serverConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInterruptionHandler:", v16);

    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __52__SPDeviceConnection_createXPCConnectionIfNecessary__block_invoke_79;
    v14[3] = &unk_24D3BC090;
    objc_copyWeak(&v15, &location);
    -[SPDeviceConnection serverConnection](self, "serverConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInvalidationHandler:", v14);

    -[SPDeviceConnection serverConnection](self, "serverConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __52__SPDeviceConnection_createXPCConnectionIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[SPDeviceConnection createXPCConnectionIfNecessary]_block_invoke";
    v6 = 1024;
    v7 = 124;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: SPDeviceConnection, createXPCConnection, interruptionHandler", (uint8_t *)&v4, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateXPCConnection");

}

void __52__SPDeviceConnection_createXPCConnectionIfNecessary__block_invoke_79(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[SPDeviceConnection createXPCConnectionIfNecessary]_block_invoke";
    v6 = 1024;
    v7 = 129;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: SPDeviceConnection, createXPCConnection, invalidationHandler", (uint8_t *)&v4, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateXPCConnection");

}

- (void)invalidateXPCConnection
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SPDeviceConnection_invalidateXPCConnection__block_invoke;
  block[3] = &unk_24D3BB2A0;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

uint64_t __45__SPDeviceConnection_invalidateXPCConnection__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setServerConnection:", 0);
}

- (id)connectionProxy:(id)a3 caller:(const char *)a4
{
  id v6;
  NSObject *connectionQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  const char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  connectionQueue = self->_connectionQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__SPDeviceConnection_connectionProxy_caller___block_invoke;
  v11[3] = &unk_24D3BC0E0;
  v13 = &v15;
  v14 = a4;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  dispatch_sync(connectionQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __45__SPDeviceConnection_connectionProxy_caller___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "createXPCConnectionIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __45__SPDeviceConnection_connectionProxy_caller___block_invoke_2;
  v8[3] = &unk_24D3BC0B8;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 56);
  v8[4] = v3;
  v8[1] = 3221225472;
  v9 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __45__SPDeviceConnection_connectionProxy_caller___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  wk_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__SPDeviceConnection_connectionProxy_caller___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidateXPCConnection");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchInstalledApplicationsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__SPDeviceConnection_fetchInstalledApplicationsWithCompletion___block_invoke;
  v6[3] = &unk_24D3BC108;
  v7 = v4;
  v5 = v4;
  -[SPDeviceConnection fetchInstalledApplicationsWithErrorCompletion:](self, "fetchInstalledApplicationsWithErrorCompletion:", v6);

}

uint64_t __63__SPDeviceConnection_fetchInstalledApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInstalledApplicationsWithErrorCompletion:(id)a3
{
  -[SPDeviceConnection fetchInstalledApplicationsForPairedDevice:completion:](self, "fetchInstalledApplicationsForPairedDevice:completion:", 0, a3);
}

- (void)fetchInstalledApplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchInstalledApplicationsForPairedDevice:completion:", v7, v6);

}

- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__SPDeviceConnection_fetchInstalledCompatibleApplicationsWithDevice_withCompletion___block_invoke;
  v8[3] = &unk_24D3BC108;
  v9 = v6;
  v7 = v6;
  -[SPDeviceConnection fetchInstalledCompatibleApplicationsWithDevice:withErrorCompletion:](self, "fetchInstalledCompatibleApplicationsWithDevice:withErrorCompletion:", a3, v8);

}

uint64_t __84__SPDeviceConnection_fetchInstalledCompatibleApplicationsWithDevice_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withErrorCompletion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchInstalledCompatibleApplicationsWithDevice:withErrorCompletion:", v7, v6);

}

- (void)fetchInstalledComplicationsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__SPDeviceConnection_fetchInstalledComplicationsWithCompletion___block_invoke;
  v6[3] = &unk_24D3BC108;
  v7 = v4;
  v5 = v4;
  -[SPDeviceConnection fetchInstalledComplicationsWithErrorCompletion:](self, "fetchInstalledComplicationsWithErrorCompletion:", v6);

}

uint64_t __64__SPDeviceConnection_fetchInstalledComplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInstalledComplicationsWithErrorCompletion:(id)a3
{
  -[SPDeviceConnection fetchInstalledComplicationsForPairedDevice:completion:](self, "fetchInstalledComplicationsForPairedDevice:completion:", 0, a3);
}

- (void)fetchInstalledComplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchInstalledComplicationsForPairedDevice:completion:", v7, v6);

}

- (void)activeComplicationsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__SPDeviceConnection_activeComplicationsWithCompletion___block_invoke;
  v6[3] = &unk_24D3BC130;
  v7 = v4;
  v5 = v4;
  -[SPDeviceConnection activeComplicationsWithErrorCompletion:](self, "activeComplicationsWithErrorCompletion:", v6);

}

uint64_t __56__SPDeviceConnection_activeComplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activeComplicationsWithErrorCompletion:(id)a3
{
  -[SPDeviceConnection activeComplicationsForPairedDevice:completion:](self, "activeComplicationsForPairedDevice:completion:", 0, a3);
}

- (void)activeComplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeComplicationsForPairedDevice:completion:", v7, v6);

}

- (void)installAllApplications
{
  id v2;

  objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installAllApplications");

}

- (void)cancelPendingInstallations
{
  id v2;

  objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPendingInstallations");

}

- (void)installApplication:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SPDeviceConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__SPDeviceConnection_installApplication_completion___block_invoke;
  v11[3] = &unk_24D3BC158;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "installApplication:onPairedDevice:completion:", v10, 0, v11);

}

void __52__SPDeviceConnection_installApplication_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    wk_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__SPDeviceConnection_installApplication_completion___block_invoke_cold_1();

  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "appInstallStateForAppConduitInstallState:", a2));

}

- (void)installApplication:(id)a3 completionWithError:(id)a4
{
  -[SPDeviceConnection installApplication:onPairedDevice:completion:](self, "installApplication:onPairedDevice:completion:", a3, 0, a4);
}

- (void)installApplication:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  v9 = (void *)MEMORY[0x24BE03DE0];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "sharedDeviceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__SPDeviceConnection_installApplication_onPairedDevice_completion___block_invoke;
  v14[3] = &unk_24D3BC180;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "installApplication:onPairedDevice:completion:", v11, v10, v14);

}

void __67__SPDeviceConnection_installApplication_onPairedDevice_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(v5, "appInstallStateForAppConduitInstallState:", a2), v6);

}

- (void)removeApplication:(id)a3 completion:(id)a4
{
  -[SPDeviceConnection removeApplication:fromPairedDevice:completion:](self, "removeApplication:fromPairedDevice:completion:", a3, 0, a4);
}

- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  v9 = (void *)MEMORY[0x24BE03DE0];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "sharedDeviceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__SPDeviceConnection_removeApplication_fromPairedDevice_completion___block_invoke;
  v14[3] = &unk_24D3BC1A8;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "removeApplication:fromPairedDevice:completion:", v11, v10, v14);

}

uint64_t __68__SPDeviceConnection_removeApplication_fromPairedDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "appInstallStateForAppConduitInstallState:", a2));
}

- (void)fetchApplicationWithContainingApplicationBundleID:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchApplicationWithContainingApplicationBundleID:completion:", v7, v6);

}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 completion:(id)a4
{
  -[SPDeviceConnection fetchInfoForApplicationWithBundleID:forPairedDevice:completion:](self, "fetchInfoForApplicationWithBundleID:forPairedDevice:completion:", a3, 0, a4);
}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x24BE03DE0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedDeviceConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchInfoForApplicationWithBundleID:forPairedDevice:completion:", v10, v9, v8);

}

- (void)fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:completion:", v7, v6);

}

- (void)fetchWatchAppBundleIDForCompanionAppBundleID:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v7, v6);

}

- (void)setAlwaysInstall:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE03DE0];
  v4 = a3;
  objc_msgSend(v3, "sharedDeviceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlwaysInstall:", v4);

}

- (void)setAlwaysInstall:(id)a3 forDevice:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlwaysInstall:forDevice:", v7, v6);

}

- (void)getAlwaysInstallWithCompletion:(id)a3
{
  -[SPDeviceConnection getAlwaysInstallForPairedDevice:completion:](self, "getAlwaysInstallForPairedDevice:completion:", 0, a3);
}

- (void)getAlwaysInstallForPairedDevice:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getAlwaysInstallForPairedDevice:completion:", v7, v6);

}

- (void)showUserNotification:(int64_t)a3 bundleID:(id)a4
{
  id v6;
  NSObject *v7;

  v6 = a4;
  if (v6)
  {
    -[SPDeviceConnection connectionProxy:caller:](self, "connectionProxy:caller:", &__block_literal_global_86, "-[SPDeviceConnection showUserNotification:bundleID:]");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject showUserNotification:applicationName:](v7, "showUserNotification:applicationName:", a3, v6);
  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPDeviceConnection showUserNotification:bundleID:].cold.1();
  }

}

- (void)showUserNotification:(int64_t)a3 applicationName:(id)a4 extensionBundleID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    -[SPDeviceConnection connectionProxy:caller:](self, "connectionProxy:caller:", &__block_literal_global_87, "-[SPDeviceConnection showUserNotification:applicationName:extensionBundleID:]");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __77__SPDeviceConnection_showUserNotification_applicationName_extensionBundleID___block_invoke_2;
      v12[3] = &unk_24D3BC210;
      v13 = v9;
      v11 = v11;
      v14 = v11;
      v16 = a3;
      v15 = v8;
      -[NSObject fetchInstalledApplicationsWithCompletion:](v11, "fetchInstalledApplicationsWithCompletion:", v12);

    }
    else
    {
      -[NSObject showUserNotification:applicationName:](v10, "showUserNotification:applicationName:", a3, v8);
    }
  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SPDeviceConnection showUserNotification:applicationName:extensionBundleID:].cold.1();
  }

}

void __77__SPDeviceConnection_showUserNotification_applicationName_extensionBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SPPluginBundleIdKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v10)
          objc_msgSend(*(id *)(a1 + 40), "showUserNotification:applicationName:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)hideUserNotification
{
  id v2;

  -[SPDeviceConnection connectionProxy:caller:](self, "connectionProxy:caller:", &__block_literal_global_91, "-[SPDeviceConnection hideUserNotification]");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideUserNotification");

}

- (id)localeForUserNotification
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v2 = (void *)getNRPairedDeviceRegistryClass_softClass_0;
  v23 = getNRPairedDeviceRegistryClass_softClass_0;
  if (!getNRPairedDeviceRegistryClass_softClass_0)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = (uint64_t)__getNRPairedDeviceRegistryClass_block_invoke_0;
    v18 = &unk_24D3BB130;
    v19 = &v20;
    __getNRPairedDeviceRegistryClass_block_invoke_0((uint64_t)&v15);
    v2 = (void *)v21[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = (uint64_t)&v15;
  v17 = 0x2020000000;
  v7 = (_QWORD *)getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr;
  v18 = (void *)getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr;
  if (!getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr)
  {
    v8 = (void *)NanoRegistryLibrary_0();
    v7 = dlsym(v8, "NRDevicePropertyCurrentUserLocale");
    *(_QWORD *)(v16 + 24) = v7;
    getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v15, 8);
  if (!v7)
    -[SPDeviceConnection localeForUserNotification].cold.1();
  objc_msgSend(v6, "valueForProperty:", *v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (void)wakeExtensionForWatchApp:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPDeviceConnection connectionProxy:caller:](self, "connectionProxy:caller:", &__block_literal_global_93, "-[SPDeviceConnection wakeExtensionForWatchApp:]");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wakeExtensionForWatchApp:", v4);

}

- (void)addObserver:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE03DE0];
  v4 = a3;
  objc_msgSend(v3, "sharedDeviceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE03DE0];
  v4 = a3;
  objc_msgSend(v3, "sharedDeviceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)_enumerateObserversSafely:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SPDeviceConnection *v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BE03DE0];
  v11 = a4;
  objc_msgSend(v10, "sharedDeviceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__SPDeviceConnection_installApplication_withProvisioningProfiles_completion___block_invoke;
  v15[3] = &unk_24D3BC158;
  v17 = self;
  v18 = v9;
  v16 = v8;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "installApplication:withProvisioningProfiles:onPairedDevice:completion:", v14, v11, 0, v15);

}

void __77__SPDeviceConnection_installApplication_withProvisioningProfiles_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    wk_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __77__SPDeviceConnection_installApplication_withProvisioningProfiles_completion___block_invoke_cold_1();

  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "appInstallStateForAppConduitInstallState:", a2));

}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SPDeviceConnection *v20;
  id v21;

  v10 = a3;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BE03DE0];
  v13 = a5;
  v14 = a4;
  objc_msgSend(v12, "sharedDeviceConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke;
  v18[3] = &unk_24D3BC158;
  v20 = self;
  v21 = v11;
  v19 = v10;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v15, "installApplication:withProvisioningProfiles:onPairedDevice:completion:", v17, v14, v13, v18);

}

void __92__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    wk_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __92__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke_cold_1();

  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "appInstallStateForAppConduitInstallState:", a2));

}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completionWithError:(id)a5
{
  -[SPDeviceConnection installApplication:withProvisioningProfiles:onPairedDevice:completionWithError:](self, "installApplication:withProvisioningProfiles:onPairedDevice:completionWithError:", a3, a4, 0, a5);
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completionWithError:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v10 = a6;
  v11 = (void *)MEMORY[0x24BE03DE0];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "sharedDeviceConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __101__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completionWithError___block_invoke;
  v17[3] = &unk_24D3BC180;
  v17[4] = self;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "installApplication:withProvisioningProfiles:onPairedDevice:completion:", v14, v13, v12, v17);

}

void __101__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completionWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(v5, "appInstallStateForAppConduitInstallState:", a2), v6);

}

- (void)installProvisioningProfileWithURL:(id)a3 completion:(id)a4
{
  -[SPDeviceConnection installProvisioningProfileWithURL:onPairedDevice:completion:](self, "installProvisioningProfileWithURL:onPairedDevice:completion:", a3, 0, a4);
}

- (void)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x24BE03DE0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedDeviceConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "installProvisioningProfileWithURL:onPairedDevice:completion:", v10, v9, v8);

}

- (void)removeProvisioningProfileWithID:(id)a3 completion:(id)a4
{
  -[SPDeviceConnection removeProvisioningProfileWithID:fromPairedDevice:completion:](self, "removeProvisioningProfileWithID:fromPairedDevice:completion:", a3, 0, a4);
}

- (void)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x24BE03DE0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedDeviceConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeProvisioningProfileWithID:fromPairedDevice:completion:", v10, v9, v8);

}

- (void)fetchProvisioningProfilesWithCompletion:(id)a3
{
  -[SPDeviceConnection fetchProvisioningProfilesForPairedDevice:completion:](self, "fetchProvisioningProfilesForPairedDevice:completion:", 0, a3);
}

- (void)fetchProvisioningProfilesForPairedDevice:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE03DE0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDeviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchProvisioningProfilesForPairedDevice:completion:", v7, v6);

}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 completion:(id)a4
{
  -[SPDeviceConnection fetchProvisioningProfilesForApplicationWithBundleID:forPairedDevice:completion:](self, "fetchProvisioningProfilesForApplicationWithBundleID:forPairedDevice:completion:", a3, 0, a4);
}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x24BE03DE0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedDeviceConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchProvisioningProfilesForApplicationWithBundleID:forPairedDevice:completion:", v10, v9, v8);

}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 completion:(id)a5
{
  -[SPDeviceConnection updatePreferencesForApplicationWithIdentifier:preferences:forPairedDevice:completion:](self, "updatePreferencesForApplicationWithIdentifier:preferences:forPairedDevice:completion:", a3, a4, 0, a5);
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 forPairedDevice:(id)a5 completion:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = (void *)MEMORY[0x24BE03DE0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "sharedDeviceConnection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updatePreferencesForApplicationWithIdentifier:preferences:forPairedDevice:completion:", v13, v12, v11, v10);

}

- (int64_t)appInstallStateForAppConduitInstallState:(int64_t)a3
{
  int64_t v3;
  NSObject *v4;

  v3 = a3;
  if ((unint64_t)a3 >= 0xF)
  {
    wk_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SPDeviceConnection appInstallStateForAppConduitInstallState:].cold.1();

    return 0;
  }
  return v3;
}

- (SPDeviceConnectionDelegate)delegate
{
  return (SPDeviceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)serverConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServerConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __45__SPDeviceConnection_connectionProxy_caller___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s - error: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __52__SPDeviceConnection_installApplication_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: installApplication for %{public}@, failed with: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)showUserNotification:bundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_215918000, v0, v1, "%{public}s:%d: SPDeviceConnection, nil application name for notification %d", v2, v3, v4, v5, 2u);
}

- (void)showUserNotification:applicationName:extensionBundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_215918000, v0, v1, "%{public}s:%d: SPDeviceConnection, nil application name for notification %d", v2, v3, v4, v5, 2u);
}

- (void)localeForUserNotification
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertyCurrentUserLocale(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPDeviceConnection.m"), 53, CFSTR("%s"), dlerror());

  __break(1u);
}

void __77__SPDeviceConnection_installApplication_withProvisioningProfiles_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: installApplication for %{public}@, withProfiles, failed with: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __92__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: installApplication for %{public}@, withProfiles, failed with: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)appInstallStateForAppConduitInstallState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  _WORD v2[10];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v2 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v2[7] = 568;
  v2[9] = 2048;
  v3 = v0;
  _os_log_error_impl(&dword_215918000, v1, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to map ACXApplicationInstallState : %ld, returning SPApplicationInstallStateError", (uint8_t *)v2, 0x1Cu);
  OUTLINED_FUNCTION_2_0();
}

@end
