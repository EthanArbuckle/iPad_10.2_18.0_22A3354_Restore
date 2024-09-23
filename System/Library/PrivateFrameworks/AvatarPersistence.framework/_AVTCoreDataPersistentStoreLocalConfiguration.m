@implementation _AVTCoreDataPersistentStoreLocalConfiguration

- (_AVTCoreDataPersistentStoreLocalConfiguration)initWithStoreLocation:(id)a3 copiedAside:(BOOL)a4 environment:(id)a5
{
  id v9;
  id v10;
  _AVTCoreDataPersistentStoreLocalConfiguration *v11;
  uint64_t v12;
  AVTUILogger *logger;
  void *v14;
  void *v15;
  uint64_t v16;
  void *folderLocation;
  uint64_t v18;
  NSURL *v19;
  uint64_t v20;
  NSURL *databaseLocation;
  id v22;
  void *v23;
  uint64_t v24;
  NSPersistentStoreCoordinator *coordinator;
  uint64_t v26;
  NSPersistentStoreDescription *storeDescription;
  objc_super v29;

  v9 = a3;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_AVTCoreDataPersistentStoreLocalConfiguration;
  v11 = -[_AVTCoreDataPersistentStoreLocalConfiguration init](&v29, sel_init);
  if (v11)
  {
    objc_msgSend(v10, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    logger = v11->_logger;
    v11->_logger = (AVTUILogger *)v12;

    objc_storeStrong((id *)&v11->_storeLocation, a3);
    v14 = (void *)objc_opt_class();
    v15 = v14;
    if (a4)
    {
      objc_msgSend(v14, "sideDatabaseFolderForStoreLocation:", v9);
      v16 = objc_claimAutoreleasedReturnValue();
      folderLocation = v11->_folderLocation;
      v11->_folderLocation = (NSURL *)v16;
    }
    else
    {
      -[_AVTCoreDataPersistentStoreLocalConfiguration storeLocation](v11, "storeLocation");
      folderLocation = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "databaseFolderForStoreLocation:", folderLocation);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v11->_folderLocation;
      v11->_folderLocation = (NSURL *)v18;

    }
    objc_msgSend((id)objc_opt_class(), "databaseLocationForFolderLocation:", v11->_folderLocation);
    v20 = objc_claimAutoreleasedReturnValue();
    databaseLocation = v11->_databaseLocation;
    v11->_databaseLocation = (NSURL *)v20;

    v22 = objc_alloc(MEMORY[0x24BDBB738]);
    +[AVTCoreDataPersistentStoreConfiguration createModel](AVTCoreDataPersistentStoreConfiguration, "createModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithManagedObjectModel:", v23);
    coordinator = v11->_coordinator;
    v11->_coordinator = (NSPersistentStoreCoordinator *)v24;

    objc_msgSend((id)objc_opt_class(), "createStoreDescriptionWithDatabaseLocation:logger:", v11->_databaseLocation, v11->_logger);
    v26 = objc_claimAutoreleasedReturnValue();
    storeDescription = v11->_storeDescription;
    v11->_storeDescription = (NSPersistentStoreDescription *)v26;

    if (!a4
      && +[AVTCoreDataCloudKitMirroringConfiguration cloudKitMirroringEnabled](AVTCoreDataCloudKitMirroringConfiguration, "cloudKitMirroringEnabled"))
    {
      -[AVTUILogger logSyncEnabled](v11->_logger, "logSyncEnabled");
      +[AVTCoreDataCloudKitMirroringConfiguration configureStoreDescriptionForMirroring:logger:](AVTCoreDataCloudKitMirroringConfiguration, "configureStoreDescriptionForMirroring:logger:", v11->_storeDescription, v11->_logger);
    }
    objc_storeStrong((id *)&v11->_environment, a5);
  }

  return v11;
}

+ (id)createStoreDescriptionWithDatabaseLocation:(id)a3 logger:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x24BDBB740];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setType:", *MEMORY[0x24BDBB580]);
  objc_msgSend(v6, "setURL:", v5);

  objc_msgSend(v6, "setShouldAddStoreAsynchronously:", 0);
  v7 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v6, "setOption:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB518]);
  objc_msgSend(v6, "setOption:forKey:", *MEMORY[0x24BDD0CE0], *MEMORY[0x24BDBB4F8]);
  objc_msgSend(v6, "setOption:forKey:", v7, *MEMORY[0x24BDBB4C8]);
  return v6;
}

+ (id)databaseFolderForStoreLocation:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("CoreDataBackend"));
}

+ (id)sideDatabaseFolderForStoreLocation:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "databaseFolderForStoreLocation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("movedaside"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)databaseLocationForFolderLocation:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("avatars.db"));
}

- (id)migratableSources
{
  AVTArchiverBasedStoreMigratableSource *v3;
  void *v4;
  void *v5;
  AVTArchiverBasedStoreMigratableSource *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = [AVTArchiverBasedStoreMigratableSource alloc];
  -[_AVTCoreDataPersistentStoreLocalConfiguration storeLocation](self, "storeLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_AVTCoreDataPersistentStoreLocalConfiguration environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTArchiverBasedStoreMigratableSource initWithStoreLocation:environment:](v3, "initWithStoreLocation:environment:", v4, v5);
  v10[0] = v6;
  -[_AVTCoreDataPersistentStoreLocalConfiguration copiedAsideMigratableSource](self, "copiedAsideMigratableSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copiedAsideMigratableSource
{
  _AVTCoreDataPersistentStoreLocalConfiguration *v3;
  void *v4;
  void *v5;
  _AVTCoreDataPersistentStoreLocalConfiguration *v6;
  AVTSideCoreDataStoreMigratableSource *v7;
  void *v8;
  AVTSideCoreDataStoreMigratableSource *v9;

  v3 = [_AVTCoreDataPersistentStoreLocalConfiguration alloc];
  -[_AVTCoreDataPersistentStoreLocalConfiguration storeLocation](self, "storeLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_AVTCoreDataPersistentStoreLocalConfiguration environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_AVTCoreDataPersistentStoreLocalConfiguration initWithStoreLocation:copiedAside:environment:](v3, "initWithStoreLocation:copiedAside:environment:", v4, 1, v5);

  v7 = [AVTSideCoreDataStoreMigratableSource alloc];
  -[_AVTCoreDataPersistentStoreLocalConfiguration environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTSideCoreDataStoreMigratableSource initWithConfiguration:environment:](v7, "initWithConfiguration:environment:", v6, v8);

  return v9;
}

- (BOOL)createDatabaseDirectoryIfNeeded:(id *)a3 usingFileManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;

  v6 = a4;
  -[_AVTCoreDataPersistentStoreLocalConfiguration folderLocation](self, "folderLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, a3);

  return v10;
}

- (BOOL)setupIfNeeded:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  id obj;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  -[_AVTCoreDataPersistentStoreLocalConfiguration coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = 1;
  if (!v7)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__7;
    v28 = __Block_byref_object_dispose__7;
    v29 = 0;
    -[_AVTCoreDataPersistentStoreLocalConfiguration logger](self, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AVTCoreDataPersistentStoreLocalConfiguration folderLocation](self, "folderLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logReadingBackendAtPath:", v11);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id *)(v25 + 5);
    obj = (id)v25[5];
    LOBYTE(v11) = -[_AVTCoreDataPersistentStoreLocalConfiguration createDatabaseDirectoryIfNeeded:usingFileManager:](self, "createDatabaseDirectoryIfNeeded:usingFileManager:", &obj, v12);
    objc_storeStrong(v13, obj);
    *((_BYTE *)v31 + 24) = v11;
    if ((v11 & 1) != 0)
    {
      -[_AVTCoreDataPersistentStoreLocalConfiguration logger](self, "logger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_AVTCoreDataPersistentStoreLocalConfiguration coordinator](self, "coordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_AVTCoreDataPersistentStoreLocalConfiguration storeDescription](self, "storeDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __63___AVTCoreDataPersistentStoreLocalConfiguration_setupIfNeeded___block_invoke;
      v19[3] = &unk_24DD32C10;
      v21 = &v30;
      v22 = &v24;
      v17 = v14;
      v20 = v17;
      objc_msgSend(v15, "addPersistentStoreWithDescription:completionHandler:", v16, v19);

      v8 = *((_BYTE *)v31 + 24) != 0;
      if (a3 && !*((_BYTE *)v31 + 24))
        *a3 = objc_retainAutorelease((id)v25[5]);

    }
    else
    {
      v8 = 0;
      if (a3)
        *a3 = objc_retainAutorelease((id)v25[5]);
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  return v8;
}

- (id)createManagedObjectContext
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
  -[_AVTCoreDataPersistentStoreLocalConfiguration coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentStoreCoordinator:", v4);

  objc_msgSend(v3, "setTransactionAuthor:", CFSTR("AvatarUIClient"));
  return v3;
}

- (id)createStoreServerWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  +[AVTCoreDataPersistentStoreConfiguration currentManagedObjectModel](AVTCoreDataPersistentStoreConfiguration, "currentManagedObjectModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1580]);
    if (-[_AVTCoreDataPersistentStoreLocalConfiguration createDatabaseDirectoryIfNeeded:usingFileManager:](self, "createDatabaseDirectoryIfNeeded:usingFileManager:", a3, v7))
    {
      v8 = *MEMORY[0x24BDBB5D0];
      v16[0] = *MEMORY[0x24BDBB5B8];
      v16[1] = v8;
      v17[0] = MEMORY[0x24BDBD1C8];
      v17[1] = CFSTR("com.apple.avatar.service");
      v9 = *MEMORY[0x24BDBB4F8];
      v16[2] = *MEMORY[0x24BDBB518];
      v16[3] = v9;
      v10 = *MEMORY[0x24BDD0CE0];
      v17[2] = MEMORY[0x24BDBD1C8];
      v17[3] = v10;
      v16[4] = *MEMORY[0x24BDBB4C8];
      v17[4] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x24BDBB770]);
      -[_AVTCoreDataPersistentStoreLocalConfiguration databaseLocation](self, "databaseLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initForStoreWithURL:usingModel:options:policy:", v13, v5, v11, 0);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)tearDownAndEraseAllContent:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[_AVTCoreDataPersistentStoreLocalConfiguration logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_AVTCoreDataPersistentStoreLocalConfiguration folderLocation](self, "folderLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logTearingDownCoreDataStack:", v7);

  -[_AVTCoreDataPersistentStoreLocalConfiguration coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentStores");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v32;
    while (2)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v15);
        -[_AVTCoreDataPersistentStoreLocalConfiguration coordinator](self, "coordinator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v16;
        v19 = objc_msgSend(v18, "removePersistentStore:error:", v17, &v30);
        v13 = v30;

        if (!v19)
        {
          -[_AVTCoreDataPersistentStoreLocalConfiguration logger](self, "logger");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "logErrorTearingDownCoreDataStack:", v21);

          if (a3)
          {
            v13 = objc_retainAutorelease(v13);
            v22 = 0;
            *a3 = v13;
          }
          else
          {
            v22 = 0;
          }
          goto LABEL_19;
        }
        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
  v23 = v13;

  v24 = objc_alloc_init(MEMORY[0x24BDD1580]);
  -[_AVTCoreDataPersistentStoreLocalConfiguration folderLocation](self, "folderLocation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  v22 = objc_msgSend(v24, "removeItemAtURL:error:", v25, &v29);
  v13 = v29;

  if ((v22 & 1) == 0)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v13);
    -[_AVTCoreDataPersistentStoreLocalConfiguration logger](self, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logErrorRemovingStoreFolder:", v27);

  }
LABEL_19:

  return v22;
}

- (BOOL)copyStorageAside:(id *)a3
{
  void *v5;
  int v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = 0;
  -[_AVTCoreDataPersistentStoreLocalConfiguration logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66___AVTCoreDataPersistentStoreLocalConfiguration_copyStorageAside___block_invoke;
  v8[3] = &unk_24DD32C38;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  objc_msgSend(v5, "copyingStorageAside:", v8);

  v6 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((_BYTE *)v16 + 24))
    *a3 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6 != 0;
}

- (BOOL)contentExists
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = objc_alloc_init(MEMORY[0x24BDD1580]);
  -[_AVTCoreDataPersistentStoreLocalConfiguration databaseLocation](self, "databaseLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  return v6;
}

- (void)updateBackupInclusionStatusOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _AVTCoreDataPersistentStoreLocalConfiguration *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[_AVTCoreDataPersistentStoreLocalConfiguration logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke;
  v11[3] = &unk_24DD32CB0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  +[AVTCoreDataCloudKitMirroringConfiguration deviceConfigurationSupportsCloudKitMirroringWithLogger:completionHandler:](AVTCoreDataCloudKitMirroringConfiguration, "deviceConfigurationSupportsCloudKitMirroringWithLogger:completionHandler:", v8, v11);

}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

- (NSURL)storeLocation
{
  return self->_storeLocation;
}

- (NSURL)folderLocation
{
  return self->_folderLocation;
}

- (NSURL)databaseLocation
{
  return self->_databaseLocation;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_databaseLocation, 0);
  objc_storeStrong((id *)&self->_folderLocation, 0);
  objc_storeStrong((id *)&self->_storeLocation, 0);
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
