@implementation IRPersistenceManager

- (IRPersistenceManager)init
{
  void *v3;
  void *v4;
  IRPersistenceManager *v5;

  +[IRPersistenceManager defaultModelsDirectory](IRPersistenceManager, "defaultModelsDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPersistenceManager _getDefaultStoresDirectory](self, "_getDefaultStoresDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IRPersistenceManager initWithModelsDirectory:storesDirectory:](self, "initWithModelsDirectory:storesDirectory:", v3, v4);

  return v5;
}

- (IRPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSURL *v10;
  NSURL *modelsDirectory;
  void *v12;
  void *v13;
  NSURL *v14;
  NSURL *storesDirectory;
  NSManagedObjectModel *v16;
  NSManagedObjectModel *managedObjectModel;
  void *v18;
  NSManagedObjectModel *v19;
  NSObject *v20;
  void *v21;
  NSPersistentStoreCoordinator *v22;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  IRPersistenceManager *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isFileURL") || !objc_msgSend(v7, "isFileURL"))
    goto LABEL_9;
  v26.receiver = self;
  v26.super_class = (Class)IRPersistenceManager;
  self = -[IRPersistenceManager init](&v26, sel_init);
  if (self)
  {
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    modelsDirectory = self->_modelsDirectory;
    self->_modelsDirectory = v10;

    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v7, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, 1);
    v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
    storesDirectory = self->_storesDirectory;
    self->_storesDirectory = v14;

    -[IRPersistenceManager _enableConcurrencyDebug](self, "_enableConcurrencyDebug");
    v16 = (NSManagedObjectModel *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", self->_modelsDirectory);
    managedObjectModel = self->_managedObjectModel;
    self->_managedObjectModel = v16;

    if (self->_managedObjectModel)
    {
      v18 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_managedObjectModel;
        v20 = v18;
        -[NSManagedObjectModel versionIdentifiers](v19, "versionIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v21;
        _os_log_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_DEFAULT, "#persistence-manager, Loaded ManagedObjectModel Version: %@", buf, 0xCu);

      }
      v22 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", self->_managedObjectModel);
      persistentStoreCoordinator = self->_persistentStoreCoordinator;
      self->_persistentStoreCoordinator = v22;

      self->_lock._os_unfair_lock_opaque = 0;
      goto LABEL_8;
    }
LABEL_9:
    v24 = 0;
    goto LABEL_10;
  }
LABEL_8:
  self = self;
  v24 = self;
LABEL_10:

  return v24;
}

- (id)getLocalStoreURL
{
  void *v2;
  void *v3;

  -[NSURL URLByAppendingPathComponent:](self->_storesDirectory, "URLByAppendingPathComponent:", CFSTR("intelligentRouting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)connectToStore
{
  os_unfair_lock_s *p_lock;
  BOOL v4;
  IRPersistenceStore *v5;
  void *v6;
  IRPersistenceStore *v7;
  IRPersistenceStore *persistenceStore;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[IRPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    v4 = 1;
  }
  else
  {
    v5 = [IRPersistenceStore alloc];
    -[IRPersistenceManager getLocalStoreURL](self, "getLocalStoreURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IRPersistenceStore initWithURL:](v5, "initWithURL:", v6);
    persistenceStore = self->_persistenceStore;
    self->_persistenceStore = v7;

    v4 = -[IRPersistenceStore loadWithCoordinator:](self->_persistenceStore, "loadWithCoordinator:", self->_persistentStoreCoordinator);
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)disconnectFromStore
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  char v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[IRPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    -[NSPersistentStoreCoordinator persistentStores](self->_persistentStoreCoordinator, "persistentStores");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    persistentStoreCoordinator = self->_persistentStoreCoordinator;
    v14 = 0;
    -[NSPersistentStoreCoordinator removePersistentStore:error:](persistentStoreCoordinator, "removePersistentStore:error:", v5, &v14);
    v7 = v14;
    if (v7)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v16 = "#persistence-manager, ";
        v17 = 2112;
        v18 = v8;
        v19 = 2112;
        v20 = v10;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Persistence manager disconnect error] Failed to disconnect from store %@ with error %@", buf, 0x2Au);

      }
    }
    v11 = -[IRPersistenceManager _isStoreConnected](self, "_isStoreConnected");

    v12 = !v11;
  }
  else
  {
    v12 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)createManagedObjectContext
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[IRPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    objc_msgSend(MEMORY[0x24BDBB6C8], "errorMergePolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMergePolicy:", v5);

    -[IRPersistenceManager persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPersistentStoreCoordinator:", v6);

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v8);

    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTransactionAuthor:", v9);

    objc_msgSend(v4, "setUndoManager:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)defaultModelsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "IRFrameworkBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("intelligentRouting"), CFSTR("momd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_getDefaultStoresDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;

  objc_msgSend(MEMORY[0x24BDD1580], "userLibraryDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v11 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRPersistenceManager _getDefaultStoresDirectory].cold.1(v11);
    goto LABEL_11;
  }
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.intelligentroutingd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v14);
    v9 = v14;

    if (!v8 || v9)
    {
      v12 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        -[IRPersistenceManager _getDefaultStoresDirectory].cold.2((uint64_t)v4, (uint64_t)v9, v12);

LABEL_11:
      v10 = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v10;
}

- (BOOL)_isStoreConnected
{
  void *v2;
  BOOL v3;

  -[NSPersistentStoreCoordinator persistentStores](self->_persistentStoreCoordinator, "persistentStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (IRPersistenceStore)persistenceStore
{
  return self->_persistenceStore;
}

- (void)setPersistenceStore:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceStore, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);
  objc_storeStrong((id *)&self->_modelsDirectory, 0);
}

- (void)_getDefaultStoresDirectory
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_23FFBA000, log, OS_LOG_TYPE_ERROR, "#persistence-manager, [ErrorId - Store directory create error] Failed to create %@, error, %@", (uint8_t *)&v3, 0x16u);
}

@end
