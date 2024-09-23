@implementation ACDTransientDatabase

- (ACDTransientDatabase)init
{
  ACDTransientDatabase *v2;
  void *v3;
  uint64_t v4;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  uint64_t v6;
  id v7;
  void *v8;
  ACDDatabaseInitializer *v9;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ACDTransientDatabase;
  v2 = -[ACDTransientDatabase init](&v12, sel_init);
  if (v2)
  {
    _ACDManagedObjectModel();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v3);
    persistentStoreCoordinator = v2->_persistentStoreCoordinator;
    v2->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v4;

    v6 = *MEMORY[0x24BDBB418];
    v11 = 0;
    v7 = -[ACDTransientDatabase _addPersistentStoreWithType:configuration:URL:options:error:](v2, "_addPersistentStoreWithType:configuration:URL:options:error:", v6, 0, 0, 0, &v11);
    -[ACDTransientDatabase createConnection](v2, "createConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ACDDatabaseInitializer initWithDatabaseConnection:]([ACDDatabaseInitializer alloc], "initWithDatabaseConnection:", v8);
    -[ACDDatabaseInitializer updateDefaultContentIfNecessary:](v9, "updateDefaultContentIfNecessary:", 0);

  }
  return v2;
}

- (id)_addPersistentStoreWithType:(id)a3 configuration:(id)a4 URL:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](self->_persistentStoreCoordinator, "addPersistentStoreWithType:configuration:URL:options:error:", v12, v13, v14, v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)createConnection
{
  return -[ACDDatabaseConnection initWithPersistentStoreCoordinator:]([ACDDatabaseConnection alloc], "initWithPersistentStoreCoordinator:", self->_persistentStoreCoordinator);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
}

@end
