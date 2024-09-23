@implementation SLDatabase

- (SLDatabase)initWithStoreName:(id)a3 modelPath:(id)a4
{
  id v6;
  id v7;
  SLDatabase *v8;
  SLDatabase *v9;
  void *v10;
  uint64_t v11;
  NSString *storePath;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDatabase;
  v8 = -[SLDatabase init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelPath, a4);
    SLUserDataDirectory();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    storePath = v9->_storePath;
    v9->_storePath = (NSString *)v11;

    -[SLDatabase _setUpManagedObjectContext](v9, "_setUpManagedObjectContext");
  }

  return v9;
}

- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", a3, self->_managedObjectContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v8, "setEntity:", v7);
  if (v6)
    objc_msgSend(v8, "setPredicate:", v6);
  -[NSManagedObjectContext executeFetchRequest:error:](self->_managedObjectContext, "executeFetchRequest:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)newObjectForEntityNamed:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", a3, self->_managedObjectContext);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)save:(id *)a3
{
  return -[NSManagedObjectContext save:](self->_managedObjectContext, "save:", a3);
}

- (void)_setUpManagedObjectContext
{
  NSManagedObjectContext *v3;
  NSManagedObjectContext *managedObjectContext;
  id v5;

  if (!self->_managedObjectContext)
  {
    -[SLDatabase _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = (NSManagedObjectContext *)objc_alloc_init(MEMORY[0x1E0C97B88]);
      managedObjectContext = self->_managedObjectContext;
      self->_managedObjectContext = v3;

      -[NSManagedObjectContext setPersistentStoreCoordinator:](self->_managedObjectContext, "setPersistentStoreCoordinator:", v5);
    }

  }
}

- (id)_persistentStoreCoordinator
{
  uint64_t v2;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  void *v6;
  id v7;
  void *v8;
  NSPersistentStoreCoordinator *v9;
  NSPersistentStoreCoordinator *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSPersistentStoreCoordinator *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSPersistentStoreCoordinator *v20;
  void *v21;
  NSPersistentStoreCoordinator *v22;
  void *v23;
  id v24;
  id v25;

  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
    return persistentStoreCoordinator;
  SLUserDataDirectory();
  CPFileBuildDirectoriesToPath();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_storePath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C97C00]);
  -[SLDatabase _managedObjectModel](self, "_managedObjectModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSPersistentStoreCoordinator *)objc_msgSend(v7, "initWithManagedObjectModel:", v8);
  v10 = self->_persistentStoreCoordinator;
  self->_persistentStoreCoordinator = v9;

  v11 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C978D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, v13, v14, *MEMORY[0x1E0C97868], 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKey:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0C97940]);
  v16 = self->_persistentStoreCoordinator;
  v17 = *MEMORY[0x1E0C979E8];
  v25 = 0;
  -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v16, "addPersistentStoreWithType:configuration:URL:options:error:", v17, 0, v6, v15, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v25;

  if (!v18)
  {
    objc_msgSend(v19, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v2, 3, CFSTR("Error while opening database %@, %@\n\nCreating new database..."));

    -[SLDatabase _removeFilesAtURL:forStoreCoordinator:](self, "_removeFilesAtURL:forStoreCoordinator:", v6, self->_persistentStoreCoordinator, v19, v23);
    v20 = self->_persistentStoreCoordinator;
    v24 = 0;
    -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v20, "addPersistentStoreWithType:configuration:URL:options:error:", v17, 0, v6, v15, &v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;

    if (!v21)
      -[SLDatabase _persistentStoreCoordinator].cold.1(v19);
    _SLLog(v2, 3, CFSTR("Created new database successfully."));
  }
  v22 = self->_persistentStoreCoordinator;

  return v22;
}

- (id)_managedObjectModel
{
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectModel *v3;
  void *v5;
  NSManagedObjectModel *v6;
  NSManagedObjectModel *v7;

  managedObjectModel = self->_managedObjectModel;
  if (managedObjectModel)
  {
    v3 = managedObjectModel;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_modelPath);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSManagedObjectModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v5);
    v7 = self->_managedObjectModel;
    self->_managedObjectModel = v6;

    v3 = self->_managedObjectModel;
  }
  return v3;
}

- (void)_removeFilesAtURL:(id)a3 forStoreCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C97C00]);
    -[SLDatabase _managedObjectModel](self, "_managedObjectModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "initWithManagedObjectModel:", v9);

  }
  v10 = *MEMORY[0x1E0C979E8];
  v13 = 0;
  v11 = objc_msgSend(v7, "_destroyPersistentStoreAtURL:withType:options:error:", v6, v10, 0, &v13);
  v12 = v13;
  if ((v11 & 1) == 0)
    -[SLDatabase _removeFilesAtURL:forStoreCoordinator:].cold.1(v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_storePath, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
}

- (void)_persistentStoreCoordinator
{
  uint64_t v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0((uint64_t)v2, v1, CFSTR("Second Error while creating new database %@, %@\n\n"));

  abort();
}

- (void)_removeFilesAtURL:(void *)a1 forStoreCoordinator:.cold.1(void *a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0((uint64_t)v2, v1, CFSTR("Unable to recover by deleting old database! %@, %@\n\n"));

  abort();
}

@end
