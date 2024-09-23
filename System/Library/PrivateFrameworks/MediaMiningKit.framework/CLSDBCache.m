@implementation CLSDBCache

- (CLSDBCache)initWithURL:(id)a3
{
  return -[CLSDBCache initWithURL:dataModelName:](self, "initWithURL:dataModelName:", a3, 0);
}

- (id)initForTesting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CLSDBCache *v9;

  v3 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CLSDBCache initWithURL:dataModelName:](self, "initWithURL:dataModelName:", v8, 0);

  return v9;
}

- (CLSDBCache)initWithURL:(id)a3 dataModelName:(id)a4
{
  id v7;
  id v8;
  CLSDBCache *v9;
  CLSDBCache *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend((id)objc_opt_class(), "locationIsValidForDatabaseAtURL:", v7))
  {
    v12.receiver = self;
    v12.super_class = (Class)CLSDBCache;
    v9 = -[CLSDBCache init](&v12, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_diskCacheURL, a3);
      objc_storeStrong((id *)&v10->_dataModelName, a4);
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (id)formatVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CLSDBCache dataModelName](self, "dataModelName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@Version"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSManagedObjectContext)managedObjectContext
{
  CLSDBCache *v2;
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *v4;
  void *v5;
  uint64_t v6;
  NSManagedObjectContext *v7;

  v2 = self;
  objc_sync_enter(v2);
  managedObjectContext = v2->_managedObjectContext;
  if (managedObjectContext)
  {
    v4 = managedObjectContext;
  }
  else
  {
    -[CLSDBCache persistentStoreCoordinator](v2, "persistentStoreCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
      v7 = v2->_managedObjectContext;
      v2->_managedObjectContext = (NSManagedObjectContext *)v6;

      -[NSManagedObjectContext setUndoManager:](v2->_managedObjectContext, "setUndoManager:", 0);
      -[NSManagedObjectContext setPersistentStoreCoordinator:](v2->_managedObjectContext, "setPersistentStoreCoordinator:", v5);
    }
    v4 = v2->_managedObjectContext;

  }
  objc_sync_exit(v2);

  return v4;
}

- (NSManagedObjectModel)managedObjectModel
{
  CLSDBCache *v2;
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectModel *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSManagedObjectModel *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  managedObjectModel = v2->_managedObjectModel;
  if (managedObjectModel)
  {
    v4 = managedObjectModel;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSDBCache dataModelName](v2, "dataModelName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", v6, CFSTR("momd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C97B98]);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithContentsOfURL:", v9);
      v11 = v2->_managedObjectModel;
      v2->_managedObjectModel = (NSManagedObjectModel *)v10;

    }
    else
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loggingConnection");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[CLSDBCache dataModelName](v2, "dataModelName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v15;
        _os_log_error_impl(&dword_1CAB79000, v13, OS_LOG_TYPE_ERROR, "Failed to load a bundle containing \"%@\".", (uint8_t *)&v16, 0xCu);

      }
    }
    v4 = v2->_managedObjectModel;

  }
  objc_sync_exit(v2);

  return v4;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  CLSDBCache *v2;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSPersistentStoreCoordinator *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSPersistentStoreCoordinator *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  int v22;
  NSPersistentStoreCoordinator *v23;
  uint64_t v24;
  NSURL *diskCacheURL;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *p_super;
  void *v35;
  void *v36;
  NSObject *v37;
  NSPersistentStoreCoordinator *v38;
  NSURL *v39;
  id v40;
  NSPersistentStoreCoordinator *v41;
  NSURL *v42;
  void *v43;
  NSObject *v44;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  persistentStoreCoordinator = v2->_persistentStoreCoordinator;
  if (!persistentStoreCoordinator)
  {
    v5 = MEMORY[0x1E0C9AAB0];
    v6 = *MEMORY[0x1E0C97868];
    v53[0] = *MEMORY[0x1E0C978D0];
    v53[1] = v6;
    v54[0] = MEMORY[0x1E0C9AAB0];
    v54[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSDBCache managedObjectModel](v2, "managedObjectModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAB79000, v14, OS_LOG_TYPE_ERROR, "An error occured when we get the managedObjectModel", buf, 2u);
      }
      v27 = 0;
      v4 = 0;
      goto LABEL_26;
    }
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v8);
    v10 = v2->_persistentStoreCoordinator;
    v2->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    -[CLSDBCache dataModelName](v2, "dataModelName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL lastPathComponent](v2->_diskCacheURL, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.formatVersion.%@"), v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSDBCache formatVersion](v2, "formatVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    -[CLSDBCache formatVersion](v2, "formatVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19
      && (v20 = -[CLSDBCache supportsVersioning](v2, "supportsVersioning"), v19, ((v18 ^ 1) & v20) == 1))
    {
      v51 = *MEMORY[0x1E0C97858];
      v52 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = 1;
      v7 = (void *)v21;
    }
    else
    {
      v22 = 0;
    }
    v23 = v2->_persistentStoreCoordinator;
    v24 = *MEMORY[0x1E0C979E8];
    diskCacheURL = v2->_diskCacheURL;
    v48 = 0;
    -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v23, "addPersistentStoreWithType:configuration:URL:options:error:", v24, 0, diskCacheURL, v7, &v48);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v48;
    if (v26)
    {
      if (v22)
      {
        -[CLSDBCache invalidateDiskCaches](v2, "invalidateDiskCaches");
        -[CLSDBCache invalidateMemoryCaches](v2, "invalidateMemoryCaches");
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSDBCache formatVersion](v2, "formatVersion");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v29, v14);

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "synchronize");

        +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "loggingConnection");
        v32 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAB79000, v32, OS_LOG_TYPE_INFO, "Core Data database successfully cleared", buf, 2u);
        }

      }
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "loggingConnection");
      p_super = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAB79000, p_super, OS_LOG_TYPE_INFO, "Core Data database successfully initialized", buf, 2u);
      }
    }
    else
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "loggingConnection");
      v37 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v27;
        _os_log_error_impl(&dword_1CAB79000, v37, OS_LOG_TYPE_ERROR, "Cannot initialize Core Data database: \"%@\". Removing store", buf, 0xCu);
      }

      v38 = v2->_persistentStoreCoordinator;
      v39 = v2->_diskCacheURL;
      v47 = v27;
      -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:](v38, "destroyPersistentStoreAtURL:withType:options:error:", v39, v24, 0, &v47);
      v40 = v47;

      v41 = v2->_persistentStoreCoordinator;
      v42 = v2->_diskCacheURL;
      v46 = v40;
      -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v41, "addPersistentStoreWithType:configuration:URL:options:error:", v24, 0, v42, v7, &v46);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v46;

      if (v26)
        goto LABEL_25;
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "loggingConnection");
      v44 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v27;
        _os_log_error_impl(&dword_1CAB79000, v44, OS_LOG_TYPE_ERROR, "Cannot initialize Core Data database even after removing store: \"%@\".", buf, 0xCu);
      }

      v26 = 0;
      p_super = &v2->_persistentStoreCoordinator->super;
      v2->_persistentStoreCoordinator = 0;
    }

LABEL_25:
    v4 = v2->_persistentStoreCoordinator;

LABEL_26:
    goto LABEL_27;
  }
  v4 = persistentStoreCoordinator;
LABEL_27:
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)_save
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "save:", &v9);
  v4 = v9;

  if ((v3 & 1) == 0)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_1CAB79000, v6, OS_LOG_TYPE_ERROR, "An error occured saving parent context to the database: \"%@\", buf, 0xCu);

    }
  }

  return 1;
}

- (BOOL)save
{
  CLSDBCache *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__CLSDBCache_save__block_invoke;
  v5[3] = &unk_1E84F7A70;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_saveAsync
{
  void *v3;
  _QWORD v4[5];

  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__CLSDBCache__saveAsync__block_invoke;
  v4[3] = &unk_1E84F8F20;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)_resetCoreDataStack
{
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSManagedObjectContext *managedObjectContext;
  CLSDBCache *obj;

  obj = self;
  objc_sync_enter(obj);
  persistentStoreCoordinator = obj->_persistentStoreCoordinator;
  obj->_persistentStoreCoordinator = 0;

  managedObjectContext = obj->_managedObjectContext;
  obj->_managedObjectContext = 0;

  objc_sync_exit(obj);
}

- (void)invalidateDiskCaches
{
  void *v3;
  _QWORD v4[5];

  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__CLSDBCache_invalidateDiskCaches__block_invoke;
  v4[3] = &unk_1E84F8F20;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

- (void)invalidateMemoryCaches
{
  void *v3;
  _QWORD v4[5];

  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__CLSDBCache_invalidateMemoryCaches__block_invoke;
  v4[3] = &unk_1E84F8F20;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

- (NSString)dataModelName
{
  return self->_dataModelName;
}

- (NSURL)diskCacheURL
{
  return self->_diskCacheURL;
}

- (BOOL)supportsVersioning
{
  return self->_supportsVersioning;
}

- (void)setSupportsVersioning:(BOOL)a3
{
  self->_supportsVersioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_dataModelName, 0);
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
}

void __36__CLSDBCache_invalidateMemoryCaches__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

}

void __34__CLSDBCache_invalidateDiskCaches__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id obj;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C978D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, v4, v5, *MEMORY[0x1E0C97868], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v26 = a1;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v7, "persistentStores");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    v10 = *MEMORY[0x1E0C979E8];
    if (v9)
    {
      v11 = v9;
      v12 = 0;
      v13 = *(_QWORD *)v31;
      do
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v14), "URL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v15;
          v17 = objc_msgSend(v8, "destroyPersistentStoreAtURL:withType:options:error:", v16, v10, v6, &v29);
          v12 = v29;

          if ((v17 & 1) == 0)
          {
            +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "loggingConnection");
            v19 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v12;
              _os_log_error_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_ERROR, "Could not destroy persistent store for DBCache, %@", buf, 0xCu);
            }

          }
          ++v14;
          v15 = v12;
        }
        while (v11 != v14);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(*(id *)(v26 + 32), "diskCacheURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    objc_msgSend(v8, "addPersistentStoreWithType:configuration:URL:options:error:", v10, 0, v20, v6, &v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v28;

    if (!v21)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "loggingConnection");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v25;
        _os_log_error_impl(&dword_1CAB79000, v24, OS_LOG_TYPE_ERROR, "An error occured creating database store: \"%@\", buf, 0xCu);

      }
      objc_msgSend(*(id *)(v26 + 32), "_resetCoreDataStack");
    }

  }
}

void __24__CLSDBCache__saveAsync__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __18__CLSDBCache_save__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_save");
}

+ (id)defaultCacheName
{
  abort();
}

+ (id)urlWithParentURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "defaultCacheName", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v8 = v4;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v16;
    v8 = v4;
    do
    {
      v11 = 0;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(v12, "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v8;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("sqlite"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)locationIsValidForDatabaseAtURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;
  char v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v15 = 0;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v15);

  if ((v6 & 1) != 0)
  {
    if (!v15)
    {
      v9 = 1;
      goto LABEL_12;
    }
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_error_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_ERROR, "Path \"%@\" specified for database already exists as a directory", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v9 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v14);
    v8 = v14;
    if ((v9 & 1) == 0)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v3;
        v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_ERROR, "Failed to create intermediate cache directories \"%@\": \"%@\", buf, 0x16u);
      }

    }
  }

LABEL_12:
  return v9;
}

@end
