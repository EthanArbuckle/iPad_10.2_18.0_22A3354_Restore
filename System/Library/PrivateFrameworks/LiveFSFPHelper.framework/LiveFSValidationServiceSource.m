@implementation LiveFSValidationServiceSource

- (LiveFSValidationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4
{
  id v7;
  id v8;
  LiveFSValidationServiceSource *v9;
  LiveFSValidationServiceSource *v10;
  uint64_t v11;
  NSHashTable *listeners;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LiveFSValidationServiceSource;
  v9 = -[LiveFSValidationServiceSource init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemIdentifier, a4);
    objc_storeStrong((id *)&v10->_fileProviderExtension, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v11;

  }
  return v10;
}

- (NSString)serviceName
{
  return (NSString *)CFSTR("com.apple.FileProvider.ValidationV1");
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  LiveFSValidationServiceSource *v6;

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
  LiveFSValidationServiceSource *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255526B90);
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
  v15[2] = __68__LiveFSValidationServiceSource_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_24E46B2C0;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v7, "setInvalidationHandler:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __68__LiveFSValidationServiceSource_listener_shouldAcceptNewConnection___block_invoke_2;
  v13[3] = &unk_24E46B2E8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v13);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return 1;
}

uint64_t __68__LiveFSValidationServiceSource_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __68__LiveFSValidationServiceSource_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)validation_evictDocumentWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0B88];
  v6 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3328, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v6, v7);

}

- (void)validation_shareDocumentWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0B88];
  v6 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3328, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v6, v7);

}

- (void)validation_allowValidation:(id)a3
{
  void (**v4)(id, uint64_t, void *);
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, void *))a3;
  -[LiveFSFPExtensionHelper mountPath](self->_fileProviderExtension, "mountPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Validation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  if (v8
    && (-[LiveFSFPExtensionHelper persistentIdentifierForItemAtURL:](self->_fileProviderExtension, "persistentIdentifierForItemAtURL:", v6), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    v4[2](v4, 1, &unk_24E470B98);

  }
  else
  {
    livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[LiveFSValidationServiceSource validation_allowValidation:]";
      _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s: about to return no", (uint8_t *)&v12, 0xCu);
    }

    v4[2](v4, 0, &unk_24E470BC0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderExtension, 0);
}

@end
