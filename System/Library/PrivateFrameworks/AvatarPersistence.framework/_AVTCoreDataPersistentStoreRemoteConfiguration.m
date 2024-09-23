@implementation _AVTCoreDataPersistentStoreRemoteConfiguration

- (_AVTCoreDataPersistentStoreRemoteConfiguration)initWithDaemonClient:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  _AVTCoreDataPersistentStoreRemoteConfiguration *v9;
  uint64_t v10;
  AVTUILogger *logger;
  uint64_t v12;
  NSPersistentContainer *container;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_AVTCoreDataPersistentStoreRemoteConfiguration;
  v9 = -[_AVTCoreDataPersistentStoreRemoteConfiguration init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    logger = v9->_logger;
    v9->_logger = (AVTUILogger *)v10;

    objc_storeStrong((id *)&v9->_daemonClient, a3);
    objc_msgSend((id)objc_opt_class(), "createContainerForRemoteConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    container = v9->_container;
    v9->_container = (NSPersistentContainer *)v12;

  }
  return v9;
}

+ (id)createContainerForRemoteConfiguration
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[AVTCoreDataPersistentStoreConfiguration currentManagedObjectModel](AVTCoreDataPersistentStoreConfiguration, "currentManagedObjectModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB700]), "initWithName:managedObjectModel:", CFSTR("AVTCoreDataContainer"), v2);
  v4 = objc_alloc_init(MEMORY[0x24BDBB740]);
  objc_msgSend(v4, "setType:", *MEMORY[0x24BDBB5D8]);
  objc_msgSend(v4, "setOption:forKey:", CFSTR("com.apple.avatar.service"), *MEMORY[0x24BDBB5D0]);
  v5 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v4, "setOption:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB5B8]);
  objc_msgSend(v4, "setShouldAddStoreAsynchronously:", 0);
  objc_msgSend(v4, "setOption:forKey:", v5, *MEMORY[0x24BDBB518]);
  objc_msgSend(v4, "setOption:forKey:", v5, *MEMORY[0x24BDBB5C8]);
  objc_msgSend(v4, "setOption:forKey:", v5, *MEMORY[0x24BDBB4C8]);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentStoreDescriptions:", v6);

  return v3;
}

- (BOOL)setupIfNeeded:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  -[_AVTCoreDataPersistentStoreRemoteConfiguration container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = 1;
  if (!v8)
  {
    -[_AVTCoreDataPersistentStoreRemoteConfiguration daemonClient](self, "daemonClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "checkIn");

    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__7;
    v18 = __Block_byref_object_dispose__7;
    v19 = 0;
    -[_AVTCoreDataPersistentStoreRemoteConfiguration container](self, "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64___AVTCoreDataPersistentStoreRemoteConfiguration_setupIfNeeded___block_invoke;
    v13[3] = &unk_24DD32BE8;
    v13[4] = &v14;
    v13[5] = &v20;
    objc_msgSend(v11, "loadPersistentStoresWithCompletionHandler:", v13);

    v9 = *((_BYTE *)v21 + 24) != 0;
    if (a3 && !*((_BYTE *)v21 + 24))
      *a3 = objc_retainAutorelease((id)v15[5]);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  return v9;
}

- (id)createManagedObjectContext
{
  void *v2;
  void *v3;

  -[_AVTCoreDataPersistentStoreRemoteConfiguration container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBackgroundContext");

  objc_msgSend(v3, "setTransactionAuthor:", CFSTR("AvatarUIClient"));
  return v3;
}

- (id)persistentStoreCoordinator
{
  void *v2;
  void *v3;

  -[_AVTCoreDataPersistentStoreRemoteConfiguration container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)storeDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[_AVTCoreDataPersistentStoreRemoteConfiguration container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatarsDaemon)daemonClient
{
  return self->_daemonClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonClient, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
