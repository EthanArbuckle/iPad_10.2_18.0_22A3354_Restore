@implementation LiveFSFPUnlockServiceSource

- (LiveFSFPUnlockServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4
{
  id v7;
  id v8;
  LiveFSFPUnlockServiceSource *v9;
  LiveFSFPUnlockServiceSource *v10;
  uint64_t v11;
  NSHashTable *listeners;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LiveFSFPUnlockServiceSource;
  v9 = -[LiveFSFPUnlockServiceSource init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileProviderExtension, a3);
    objc_storeStrong((id *)&v10->_itemIdentifier, a4);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v11;

  }
  return v10;
}

- (NSString)serviceName
{
  return (NSString *)CFSTR("com.apple.filesystems.unlock");
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  LiveFSFPUnlockServiceSource *v6;

  objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");
  v6 = self;
  objc_sync_enter(v6);
  -[NSHashTable addObject:](v6->_listeners, "addObject:", v4);
  objc_sync_exit(v6);

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  LiveFSFPUnlockServiceSource *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255526C40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  v9 = self;
  objc_sync_enter(v9);
  -[NSHashTable removeObject:](v9->_listeners, "removeObject:", v6);
  objc_sync_exit(v9);

  objc_initWeak(&location, v7);
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__LiveFSFPUnlockServiceSource_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_24E46B2C0;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v7, "setInvalidationHandler:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __66__LiveFSFPUnlockServiceSource_listener_shouldAcceptNewConnection___block_invoke_2;
  v13[3] = &unk_24E46B2E8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v13);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return 1;
}

uint64_t __66__LiveFSFPUnlockServiceSource_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __66__LiveFSFPUnlockServiceSource_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)unlockWithPassword:(id)a3 saveToKeychain:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  LiveFSFPExtensionHelper *fileProviderExtension;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  livefs_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F8A5000, v10, OS_LOG_TYPE_INFO, "unlock starting", buf, 2u);
  }

  fileProviderExtension = self->_fileProviderExtension;
  v18 = 0;
  -[LiveFSFPExtensionHelper getVolumeManagerWithError:](fileProviderExtension, "getVolumeManagerWithError:", &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v12)
  {
    -[NSFileProviderExtension domain](self->_fileProviderExtension, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __83__LiveFSFPUnlockServiceSource_unlockWithPassword_saveToKeychain_completionHandler___block_invoke;
    v16[3] = &unk_24E46B558;
    v16[4] = self;
    v17 = v9;
    objc_msgSend(v12, "unlockVolume:password:saveToKeychain:completionHandler:", v15, v8, v6, v16);

  }
  else
  {
    (*((void (**)(id, id))v9 + 2))(v9, v13);
  }

}

void __83__LiveFSFPUnlockServiceSource_unlockWithPassword_saveToKeychain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_21F8A5000, v4, OS_LOG_TYPE_INFO, "unlockVolume on domain %@ returning %@", (uint8_t *)&v7, 0x16u);

  }
  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "refreshVolumeInfo");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateRootContainer");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderExtension, 0);
}

@end
