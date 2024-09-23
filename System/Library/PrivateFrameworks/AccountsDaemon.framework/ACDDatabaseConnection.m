@implementation ACDDatabaseConnection

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACDDatabaseConnection)initWithPersistentStoreCoordinator:(id)a3
{
  id v5;
  ACDDatabaseConnection *v6;
  ACDDatabaseConnection *v7;
  uint64_t v8;
  NSCache *cache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACDDatabaseConnection;
  v6 = -[ACDDatabaseConnection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistentStoreCoordinator, a3);
    v8 = objc_opt_new();
    cache = v7->_cache;
    v7->_cache = (NSCache *)v8;

    -[NSCache setName:](v7->_cache, "setName:", CFSTR("ACDDabaseConnectionCache"));
    -[ACDDatabaseConnection _setupManagedObjectContextWithPersistentStoreCoodinator:](v7, "_setupManagedObjectContextWithPersistentStoreCoodinator:", v5);
    -[ACDDatabaseConnection _beginObservingManagedObjectContextDidSaveNotifications](v7, "_beginObservingManagedObjectContextDidSaveNotifications");
  }

  return v7;
}

- (void)_setupManagedObjectContextWithPersistentStoreCoodinator:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (NSManagedObjectContext *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v5;

  v7 = self->_managedObjectContext;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__ACDDatabaseConnection__setupManagedObjectContextWithPersistentStoreCoodinator___block_invoke;
  v9[3] = &unk_24C7E2180;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v9);

}

- (void)_beginObservingManagedObjectContextDidSaveNotifications
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *managedObjectContextDidSaveObserver;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (self->_managedObjectContextDidSaveObserver)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabaseConnection.m"), 442, CFSTR("Attempt to begin observing MoC notifications with an existing observer!"));

  }
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDBB458];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__ACDDatabaseConnection__beginObservingManagedObjectContextDidSaveNotifications__block_invoke;
  v9[3] = &unk_24C7E3320;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  managedObjectContextDidSaveObserver = self->_managedObjectContextDidSaveObserver;
  self->_managedObjectContextDidSaveObserver = v5;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)existingObjectWithURI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v16;

  v4 = a3;
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectIDForURIRepresentation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v8, "existingObjectWithID:error:", v7, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;

    if (!v9)
      -[ACDDatabaseConnection _handleManagedObjectContextError:](self, "_handleManagedObjectContextError:", v10);
    if (v10)
    {
      _ACDLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ACDDatabaseConnection existingObjectWithURI:].cold.1();

    }
    -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deletedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v9);

    if (v14)
    {

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4 sortDescriptor:(id)a5 prefetchKeypaths:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x24BDBB658];
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entityForName:inManagedObjectContext:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBB678]);
    -[NSObject setEntity:](v15, "setEntity:", v14);
    -[NSObject setReturnsObjectsAsFaults:](v15, "setReturnsObjectsAsFaults:", 0);
    if (v10)
      -[NSObject setPredicate:](v15, "setPredicate:", v10);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setSortDescriptors:](v15, "setSortDescriptors:", v16);

    }
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "predicateFormat");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@:%@:%@%d"), v9, v18, v19, objc_msgSend(v11, "ascending"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCache objectForKey:](self->_cache, "objectForKey:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(v22, "executeFetchRequest:error:", v15, &v39);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v23 = v39;

      if (v21)
      {
        v31 = v23;
        v32 = v20;
        v33 = v10;
        v34 = v9;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v21 = v21;
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v36;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v36 != v26)
                objc_enumerationMutation(v21);
              v28 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v27);
              -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "refreshObject:mergeChanges:", v28, 1);

              ++v27;
            }
            while (v25 != v27);
            v25 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          }
          while (v25);
        }

        v20 = v32;
        -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v21, v32);
        v10 = v33;
        v9 = v34;
        v23 = v31;
      }
      else
      {
        -[ACDDatabaseConnection _handleManagedObjectContextError:](self, "_handleManagedObjectContextError:", v23);
      }

    }
  }
  else
  {
    _ACDLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:].cold.1();
    v21 = 0;
  }

  return v21;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

void __81__ACDDatabaseConnection__setupManagedObjectContextWithPersistentStoreCoodinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6C8]), "initWithMergeType:", 2);
  objc_msgSend(v2, "setMergePolicy:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPersistentStoreCoordinator:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("ACDManagedObjectContextIsAccountsContext"));

}

- (id)managedObjectIDForURI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectIDForURIRepresentation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4
{
  return -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:](self, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", a3, a4, 0, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_managedObjectContextDidSaveObserver, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[ACDDatabaseConnection _endObservingManagedObjectContextDidSaveNotifications](self, "_endObservingManagedObjectContextDidSaveNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ACDDatabaseConnection;
  -[ACDDatabaseConnection dealloc](&v3, sel_dealloc);
}

- (void)_endObservingManagedObjectContextDidSaveNotifications
{
  void *v4;
  id v5;

  if (!self->_managedObjectContextDidSaveObserver)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabaseConnection.m"), 480, CFSTR("Attempt to end observing MoC notifications without an observer!"));

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self->_managedObjectContextDidSaveObserver);

}

+ (ACDDatabaseConnection)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ACDDatabaseConnection)init
{
  -[ACDDatabaseConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (NSNumber)version
{
  void *v2;
  void *v3;
  void *v4;

  -[ACDDatabaseConnection _persistentStore](self, "_persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ACAccountTypeVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)keychainVersion
{
  void *v2;
  void *v3;
  void *v4;

  -[ACDDatabaseConnection _persistentStore](self, "_persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ACKeychainVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (id)_managedObjectModel
{
  return -[NSPersistentStoreCoordinator managedObjectModel](self->_persistentStoreCoordinator, "managedObjectModel");
}

- (id)_persistentStore
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  -[NSPersistentStoreCoordinator persistentStores](self->_persistentStoreCoordinator, "persistentStores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabaseConnection.m"), 95, CFSTR("Unexpected number of persistent stores (%@), expected 1"), v8);

  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setVersion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabaseConnection.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version"));

  }
  -[ACDDatabaseConnection _persistentStore](self, "_persistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("ACAccountTypeVersion"));
  -[ACDDatabaseConnection _persistentStore](self, "_persistentStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetadata:", v7);

}

- (void)setKeychainVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ACDDatabaseConnection _persistentStore](self, "_persistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("ACKeychainVersion"));
  -[ACDDatabaseConnection _persistentStore](self, "_persistentStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMetadata:", v8);

}

- (id)fetchObjectsForEntityNamed:(id)a3
{
  return -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:](self, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", a3, 0, 0, 0);
}

- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4 sortDescriptor:(id)a5
{
  return -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:](self, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", a3, a4, a5, 0);
}

- (id)objectForObjectURI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectIDForURIRepresentation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectWithID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)countOfEntityNamed:(id)a3 withPredicate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  id v16;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBB658];
  v8 = a3;
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entityForName:inManagedObjectContext:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BDBB678]);
  objc_msgSend(v11, "setEntity:", v10);
  if (v6)
    objc_msgSend(v11, "setPredicate:", v6);
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v13 = objc_msgSend(v12, "countForFetchRequest:error:", v11, &v16);
  v14 = v16;

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    -[ACDDatabaseConnection _handleManagedObjectContextError:](self, "_handleManagedObjectContextError:", v14);

  return v13;
}

- (id)_accountPropertyWithKey:(id)a3 owner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("key = %@ AND owner = %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:](self, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("AccountProperty"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      _ACDLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ACDDatabaseConnection _accountPropertyWithKey:owner:].cold.1((uint64_t)v6, v7, v10);

      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        v11 = 1;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDDatabaseConnection deleteObject:](self, "deleteObject:", v12);

          objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeCustomPropertiesObject:", v13);

          ++v11;
        }
        while (objc_msgSend(v9, "count") > v11);
      }
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)insertNewObjectForEntityForName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
  return v7;
}

- (void)deleteObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteObject:", v4);

  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

- (void)deleteAccountPropertyWithKey:(id)a3 owner:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[ACDDatabaseConnection _accountPropertyWithKey:owner:](self, "_accountPropertyWithKey:owner:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ACDDatabaseConnection deleteObject:](self, "deleteObject:", v6);
    objc_msgSend(v7, "removeCustomPropertiesObject:", v6);
  }

}

- (void)setAccountPropertyWithKey:(id)a3 value:(id)a4 owner:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[ACDDatabaseConnection _accountPropertyWithKey:owner:](self, "_accountPropertyWithKey:owner:", v11, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (-[ACDDatabaseConnection insertNewObjectForEntityForName:](self, "insertNewObjectForEntityForName:", CFSTR("AccountProperty")), v10 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("key")), objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("owner")), objc_msgSend(v9, "addCustomPropertiesObject:", v10), v10))
  {
    objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("value"));

  }
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");

}

- (BOOL)saveWithError:(id *)a3
{
  return -[ACDDatabaseConnection saveWithError:rollbackOnFailure:](self, "saveWithError:rollbackOnFailure:", a3, 0);
}

- (BOOL)saveWithError:(id *)a3 rollbackOnFailure:(BOOL)a4
{
  _BOOL4 v4;
  NSManagedObjectContext *managedObjectContext;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v12[4];

  v4 = a4;
  v12[3] = *(id *)MEMORY[0x24BDAC8D0];
  -[ACDDatabaseConnection _traceDatabaseEvents](self, "_traceDatabaseEvents");
  managedObjectContext = self->_managedObjectContext;
  v12[0] = 0;
  v8 = -[NSManagedObjectContext save:](managedObjectContext, "save:", v12);
  v9 = v12[0];
  if (v9)
  {
    _ACDLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseConnection saveWithError:rollbackOnFailure:].cold.1(v9, v10);

    -[ACDDatabaseConnection _handleManagedObjectContextError:](self, "_handleManagedObjectContextError:", v9);
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    if (v4)
      -[NSManagedObjectContext rollback](self->_managedObjectContext, "rollback");
  }
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");

  return v8;
}

- (void)rollback
{
  void *v3;

  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rollback");

  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

- (void)_handleManagedObjectContextError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "ac_isUnrecoverableDatabaseError"))
  {
    objc_msgSend(v5, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACDAutoBugCapture triggerAutoBugCaptureWithType:subType:subtypeContext:detectedProcess:](ACDAutoBugCapture, "triggerAutoBugCaptureWithType:subType:subtypeContext:detectedProcess:", 0x24C7E6BD8, 0x24C7E6C18, v4, 0);

    -[ACDDatabaseConnection _delegate_databaseConnectionEncounteredUnrecoverableError:](self, "_delegate_databaseConnectionEncounteredUnrecoverableError:", v5);
  }

}

- (void)_traceDatabaseEvents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection _managedObjectContextModificationDescription](self, "_managedObjectContextModificationDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordEvent:", v4);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSManagedObjectContext deletedObjects](self->_managedObjectContext, "deletedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(MEMORY[0x24BDB43A8], "allIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "containsObject:", v13);

          if (v14)
          {
            objc_msgSend(v11, "accounts");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count");

            if (v16)
            {
              v17 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v11, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringWithFormat:", CFSTR("Attempted to remove account type '%@' while an account with that type still exists"), v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "simulateCrashWithMessage:", v19);

            }
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

- (id)_managedObjectContextModificationDescription
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  -[NSManagedObjectContext insertedObjects](self->_managedObjectContext, "insertedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("Inserted:\n"));
    if (objc_msgSend(v5, "count"))
    {
      v6 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACDDatabaseConnection _managedObjectModificationDescription:](self, "_managedObjectModificationDescription:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v8);

        if (objc_msgSend(v5, "count") - 1 > v6)
          objc_msgSend(v3, "appendString:", CFSTR(",\n"));
        ++v6;
      }
      while (objc_msgSend(v5, "count") > v6);
    }
  }
  -[NSManagedObjectContext deletedObjects](self->_managedObjectContext, "deletedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v3, "appendString:", CFSTR("\n"));
    objc_msgSend(v3, "appendString:", CFSTR("Deleted:\n"));
    if (objc_msgSend(v10, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACDDatabaseConnection _managedObjectModificationDescription:](self, "_managedObjectModificationDescription:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v13);

        if (objc_msgSend(v10, "count") - 1 > v11)
          objc_msgSend(v3, "appendString:", CFSTR(", "));
        ++v11;
      }
      while (objc_msgSend(v10, "count") > v11);
    }
  }
  -[NSManagedObjectContext updatedObjects](self->_managedObjectContext, "updatedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v3, "appendString:", CFSTR("\n"));
    objc_msgSend(v3, "appendString:", CFSTR("Updated:\n"));
    if (objc_msgSend(v15, "count"))
    {
      v16 = 0;
      do
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACDDatabaseConnection _managedObjectModificationDescription:](self, "_managedObjectModificationDescription:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v18);

        if (objc_msgSend(v15, "count") - 1 > v16)
          objc_msgSend(v3, "appendString:", CFSTR(",\n"));
        ++v16;
      }
      while (objc_msgSend(v15, "count") > v16);
    }
  }

  return v3;
}

- (id)_managedObjectModificationDescription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URIRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = ACIsInternal();
  objc_msgSend(v4, "changedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@> changes:(%@)"), v6, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@> changes:(%@)"), v6, v9, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

void __80__ACDDatabaseConnection__beginObservingManagedObjectContextDidSaveNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_managedObjectContextDidSave:", v3);

}

- (void)_managedObjectContextDidSave:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  char v22;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabaseConnection.m"), 452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

  }
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(v5, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("ACDManagedObjectContextIsAccountsContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
    {
      objc_msgSend(v5, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDBB430]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {

      }
      else
      {
        objc_msgSend(v5, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDBB400]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (!v16)
        {
          v17 = 0;
          goto LABEL_9;
        }
      }
      -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
      v17 = 1;
LABEL_9:
      -[ACDDatabaseConnection managedObjectContext](self, "managedObjectContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __54__ACDDatabaseConnection__managedObjectContextDidSave___block_invoke;
      v20[3] = &unk_24C7E3348;
      v20[4] = self;
      v22 = v17;
      v21 = v5;
      objc_msgSend(v18, "performBlock:", v20);

    }
  }

}

void __54__ACDDatabaseConnection__managedObjectContextDidSave___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mergeChangesFromContextDidSaveNotification:", *(_QWORD *)(a1 + 40));

  }
}

- (void)_delegate_databaseConnectionEncounteredUnrecoverableError:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabaseConnection.m"), 488, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  -[ACDDatabaseConnection delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "databaseConnection:encounteredUnrecoverableError:", self, v7);

}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (ACDDatabaseConnectionDelegate)delegate
{
  return (ACDDatabaseConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, v0, v1, "\"Got nil entityDescription for %@\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)existingObjectWithURI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, v0, v1, "\"-[ACDDatabaseConnection existingObjectWithURI:] failed to fetch managed object at %@\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)existingObjectWithURI:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, v0, v1, "\"-[ACDDatabaseConnection existingObjectWithURI:] called with an invalid URI %@. \", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_accountPropertyWithKey:(NSObject *)a3 owner:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URIRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_20D8CB000, a3, OS_LOG_TYPE_ERROR, "\"There are more than one account property with the key '%@' for object '%@'. Deleting duplicates...\", (uint8_t *)&v7, 0x16u);

}

- (void)saveWithError:(void *)a1 rollbackOnFailure:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, v4, "\"Could not save context: %@\", v5);

}

@end
