@implementation ACDDatabaseMigrator

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ACDDatabaseMigrator)init
{
  -[ACDDatabaseMigrator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)initForDatabaseAtURL:(id)a3 persistentStoreCoordinator:(id)a4 storeOptions:(id)a5
{
  id v9;
  id v10;
  id v11;
  ACDDatabaseMigrator *v12;
  ACDDatabaseMigrator *v13;
  uint64_t v14;
  NSDictionary *storeOptions;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ACDDatabaseMigrator;
  v12 = -[ACDDatabaseMigrator init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseURL, a3);
    objc_storeStrong((id *)&v13->_persistentStoreCoordinator, a4);
    v14 = objc_msgSend(v11, "copy");
    storeOptions = v13->_storeOptions;
    v13->_storeOptions = (NSDictionary *)v14;

  }
  return v13;
}

- (BOOL)runReturningError:(id *)a3
{
  NSObject *v5;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *migrationContext;
  NSManagedObjectContext *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSURL *databaseURL;
  void *v14;
  id v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseMigrator runReturningError:].cold.5();

  -[ACDDatabaseMigrator _setUpContextForMigration](self, "_setUpContextForMigration");
  v6 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue();
  migrationContext = self->_migrationContext;
  self->_migrationContext = v6;

  v8 = self->_migrationContext;
  if (!v8)
  {
    v16 = 0;
    goto LABEL_15;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __41__ACDDatabaseMigrator_runReturningError___block_invoke;
  v21[3] = &unk_24C7E22C0;
  v21[4] = self;
  v21[5] = &v28;
  v21[6] = &v22;
  -[NSManagedObjectContext performBlockAndWait:](v8, "performBlockAndWait:", v21);
  v9 = (void *)-[NSDictionary mutableCopy](self->_storeOptions, "mutableCopy");
  objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB488]);
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseMigrator runReturningError:].cold.4();

  v11 = *MEMORY[0x24BDBB580];
  databaseURL = self->_databaseURL;
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  v20 = 0;
  -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](persistentStoreCoordinator, "addPersistentStoreWithType:configuration:URL:options:error:", v11, 0, databaseURL, v9, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;
  if (v14)
  {

    -[ACDDatabaseMigrator _postProcessMigrationFromVersion:migrationData:](self, "_postProcessMigrationFromVersion:migrationData:", v29[3], v23[5]);
    v16 = 1;
    if (!a3)
      goto LABEL_14;
  }
  else
  {
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseMigrator runReturningError:].cold.2();

    v16 = 0;
    if (!a3)
      goto LABEL_14;
  }
  *a3 = objc_retainAutorelease(v15);
LABEL_14:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
LABEL_15:
  _ACDLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseMigrator runReturningError:].cold.1(v16);

  return v16;
}

void __41__ACDDatabaseMigrator_runReturningError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v1 = a1;
  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[2], "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = objc_msgSend(v2, "_versionForModel:", v3);

  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_3(v1 + 40);

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24);
  v6 = v5 < 9;
  if (v5 <= 8)
  {
    objc_msgSend(*(id *)(v1 + 32), "_migrateAccessAuthorizationsToTCCFromModelVersion:");
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24);
  }
  if (v5 == 2401802)
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v7, OS_LOG_TYPE_DEFAULT, "\"Performing bridge migration on a database that was created on 6.1 or earlier. Pray to the deity of your choosing that this will work.\", buf, 2u);
    }

    objc_msgSend(*(id *)(v1 + 32), "_migrateNameAttributeOfDataclassEntities");
    objc_msgSend(*(id *)(v1 + 32), "_migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24));
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24);
    v6 = 1;
  }
  if (v5 < 18 || v5 == 2401802)
  {
    objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("Account"), *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BDBB678]);
    objc_msgSend(v10, "setEntity:", v9);
    objc_msgSend(v10, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "executeFetchRequest:error:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ACDLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_2(v11);

    if (objc_msgSend(v11, "count"))
    {
      v27 = v10;
      v28 = v9;
      v29 = v1;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v26 = v11;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v19, "valueForKey:", CFSTR("accountProperties"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v35[0] = CFSTR("objectID");
              objc_msgSend(v19, "objectID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v35[1] = CFSTR("properties");
              v36[0] = v21;
              v36[1] = v20;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v22);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        }
        while (v16);
      }

      v1 = v29;
      v23 = *(_QWORD *)(*(_QWORD *)(v29 + 48) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v13;

      v10 = v27;
      v9 = v28;
      v11 = v26;
    }

  }
  _ACDLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_1();

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "save:", 0);
}

- (void)_migrateAccessAuthorizationsToTCCFromModelVersion:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseMigrator _migrateAccessAuthorizationsToTCCFromModelVersion:].cold.2();

  -[ACDDatabaseMigrator _fetchAllAuthorizationEntitiesForModelVersion:](self, "_fetchAllAuthorizationEntitiesForModelVersion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseMigrator _migrateAccessAuthorizationsToTCCFromModelVersion:].cold.1(v6);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v26;
    *(_QWORD *)&v10 = 138412290;
    v24 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "bundleID", v24, (_QWORD)v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _ACDLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v24;
          v30 = v15;
          _os_log_debug_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEBUG, "\"Found authorization for client: %@\", buf, 0xCu);
        }

        if (v15)
        {
          +[ACDClient clientWithBundleID:](ACDClient, "clientWithBundleID:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_alloc(MEMORY[0x24BDB43A8]);
          objc_msgSend(v14, "accountType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithManagedAccountType:", v19);

          objc_msgSend(v14, "valueForKey:", CFSTR("granted"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "BOOLValue");

          objc_msgSend(v20, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:](ACDTCCUtilities, "setTCCStateForClient:accountTypeID:toGranted:", v17, v23, v22);

        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v11);
  }

}

- (void)_migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint8_t v23;
  _BYTE v24[15];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseMigrator _fetchAllAuthorizationEntitiesForModelVersion:](self, "_fetchAllAuthorizationEntitiesForModelVersion:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v17, "valueForKey:", CFSTR("oldOptions"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        if (v19)
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v19, 0);
          objc_msgSend(v20, "decodeObjectOfClasses:forKey:", v11, CFSTR("options"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "finishDecoding");
          if (v21)
          {
            objc_msgSend(v17, "setValue:forKey:", v21, CFSTR("newOptions"));
          }
          else
          {
            _ACDLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[ACDDatabaseMigrator _migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:].cold.1(&v23, v24, v22);

          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

}

- (void)_migrateNameAttributeOfDataclassEntities
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseMigrator _fetchAllDataclassEntitles](self, "_fetchAllDataclassEntitles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "valueForKey:", CFSTR("oldName"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("newName"));

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)_fetchAllDataclassEntitles
{
  void *v3;
  id v4;
  NSManagedObjectContext *migrationContext;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("Dataclass"), self->_migrationContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB678]);
    objc_msgSend(v4, "setEntity:", v3);
    objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
    migrationContext = self->_migrationContext;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__ACDDatabaseMigrator__fetchAllDataclassEntitles__block_invoke;
    v9[3] = &unk_24C7E1E88;
    v11 = &v12;
    v9[4] = self;
    v6 = v4;
    v10 = v6;
    -[NSManagedObjectContext performBlockAndWait:](migrationContext, "performBlockAndWait:", v9);

  }
  else
  {
    _ACDLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ACDDatabaseMigrator _fetchAllDataclassEntitles].cold.1();
  }

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__ACDDatabaseMigrator__fetchAllDataclassEntitles__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "executeFetchRequest:error:", a1[5], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_fetchAllAuthorizationEntitiesForModelVersion:(int64_t)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  NSManagedObjectContext *migrationContext;
  NSObject *v9;
  id v10;
  _QWORD v12[5];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  v4 = CFSTR("Authorization");
  if (a3 < 8)
    v4 = CFSTR("Permission");
  if (a3 == 8)
    v5 = CFSTR("ClientAuthorization");
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", v5, self->_migrationContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBB678]);
    objc_msgSend(v7, "setEntity:", v6);
    objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
    migrationContext = self->_migrationContext;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__ACDDatabaseMigrator__fetchAllAuthorizationEntitiesForModelVersion___block_invoke;
    v12[3] = &unk_24C7E1E88;
    v14 = &v15;
    v12[4] = self;
    v9 = v7;
    v13 = v9;
    -[NSManagedObjectContext performBlockAndWait:](migrationContext, "performBlockAndWait:", v12);

  }
  else
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACDDatabaseMigrator _fetchAllAuthorizationEntitiesForModelVersion:].cold.1();
  }

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __69__ACDDatabaseMigrator__fetchAllAuthorizationEntitiesForModelVersion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "executeFetchRequest:error:", a1[5], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_setUpContextForMigration
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSPersistentStoreCoordinator *v6;
  NSPersistentStoreCoordinator *privateCoordinator;
  uint64_t v8;
  NSObject *v9;
  NSPersistentStoreCoordinator *v10;
  uint64_t v11;
  NSURL *databaseURL;
  id v13;
  id v14;
  NSObject *v15;
  NSManagedObjectContext *v16;
  NSManagedObjectContext *v17;
  NSManagedObjectContext *migrationContext;
  NSObject *v19;
  NSManagedObjectContext *v20;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseMigrator _setUpContextForMigration].cold.4((uint64_t)self, v3, v4);

  -[ACDDatabaseMigrator _compatibleModelForStoreAtURL:](self, "_compatibleModelForStoreAtURL:", self->_databaseURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseMigrator _setUpContextForMigration].cold.1();
    goto LABEL_10;
  }
  v6 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v5);
  privateCoordinator = self->_privateCoordinator;
  self->_privateCoordinator = v6;

  v8 = *MEMORY[0x24BDBB420];
  v24[0] = *MEMORY[0x24BDBB488];
  v24[1] = v8;
  v25[0] = MEMORY[0x24BDBD1C8];
  v25[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = self->_privateCoordinator;
  v11 = *MEMORY[0x24BDBB580];
  databaseURL = self->_databaseURL;
  v23 = 0;
  v13 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v10, "addPersistentStoreWithType:configuration:URL:options:error:", v11, 0, databaseURL, v9, &v23);
  v14 = v23;
  if (v14)
  {
    _ACDLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseMigrator _setUpContextForMigration].cold.3();

LABEL_10:
    v16 = 0;
    goto LABEL_14;
  }
  v17 = (NSManagedObjectContext *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
  migrationContext = self->_migrationContext;
  self->_migrationContext = v17;

  _ACDLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseMigrator _setUpContextForMigration].cold.2();

  v20 = self->_migrationContext;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __48__ACDDatabaseMigrator__setUpContextForMigration__block_invoke;
  v22[3] = &unk_24C7E2130;
  v22[4] = self;
  -[NSManagedObjectContext performBlockAndWait:](v20, "performBlockAndWait:", v22);
  v16 = self->_migrationContext;
LABEL_14:

  return v16;
}

uint64_t __48__ACDDatabaseMigrator__setUpContextForMigration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPersistentStoreCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)_compatibleModelForStoreAtURL:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v29;
  ACDDatabaseMigrator *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBB580];
  v35 = 0;
  objc_msgSend(MEMORY[0x24BDBB738], "metadataForPersistentStoreOfType:URL:options:error:", v5, a3, 0, &v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v35;
  v8 = 0;
  if (!v7)
  {
    v30 = self;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathForResource:ofType:", CFSTR("accounts"), CFSTR("momd"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "pathsForResourcesOfType:inDirectory:", CFSTR("mom"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ACDLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ACDDatabaseMigrator _compatibleModelForStoreAtURL:].cold.2(v11);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v14)
    {
      v15 = v14;
      v29 = v10;
      v16 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          _ACDLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v18;
            _os_log_debug_impl(&dword_20D8CB000, v19, OS_LOG_TYPE_DEBUG, "\"Checking MOM at path: %@\", buf, 0xCu);
          }

          v20 = objc_alloc(MEMORY[0x24BDBB6B0]);
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)objc_msgSend(v20, "initWithContentsOfURL:", v21);

          if (objc_msgSend(v8, "isConfiguration:compatibleWithStoreMetadata:", 0, v6))
          {
            _ACDLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              -[ACDDatabaseMigrator _compatibleModelForStoreAtURL:].cold.1();

            goto LABEL_18;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        if (v15)
          continue;
        break;
      }
      v8 = 0;
LABEL_18:
      v10 = v29;
      v7 = 0;
    }
    else
    {
      v8 = 0;
    }

    if (-[ACDDatabaseMigrator _versionForModel:](v30, "_versionForModel:", v8) == 9)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "pathForResource:ofType:inDirectory:", CFSTR("accounts-brighton-bridge"), CFSTR("mom"), v10);
      v23 = v10;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x24BDBB6B0]);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "initWithContentsOfURL:", v26);

      v10 = v23;
      v8 = (void *)v27;
    }

  }
  return v8;
}

- (int64_t)_versionForModel:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "versionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (void)_postProcessMigrationFromVersion:(int64_t)a3 migrationData:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ACDDatabaseMigrator *v12;
  id v13;

  v6 = a4;
  _ACDLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseMigrator _postProcessMigrationFromVersion:migrationData:].cold.1();

  if (a3 < 18 || a3 == 2401802)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__ACDDatabaseMigrator__postProcessMigrationFromVersion_migrationData___block_invoke;
    v10[3] = &unk_24C7E2248;
    v11 = v8;
    v12 = self;
    v13 = v6;
    v9 = v8;
    objc_msgSend(v9, "performBlockAndWait:", v10);

  }
}

void __70__ACDDatabaseMigrator__postProcessMigrationFromVersion_migrationData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setPersistentStoreCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6C8]), "initWithMergeType:", 2);
  objc_msgSend(v2, "setMergePolicy:", v3);

  v4 = *(id *)(a1 + 48);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v7 = *(void **)(a1 + 32);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("objectID"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "existingObjectWithID:error:", v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v24 = i;
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("properties"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v27 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x24BDBB658], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("AccountProperty"), *(_QWORD *)(a1 + 32));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setKey:", v15);
                objc_msgSend(v10, "objectForKeyedSubscript:", v15);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setValue:", v17);

                objc_msgSend(v16, "setOwner:", v9);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v12);
          }

          i = v24;
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }
  v18 = *(void **)(a1 + 32);
  v25 = 0;
  objc_msgSend(v18, "save:", &v25);
  v19 = v25;
  if (v19)
  {
    _ACDLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __70__ACDDatabaseMigrator__postProcessMigrationFromVersion_migrationData___block_invoke_cold_1();

  }
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (NSDictionary)storeOptions
{
  return self->_storeOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeOptions, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_privateCoordinator, 0);
  objc_storeStrong((id *)&self->_migrationContext, 0);
}

- (void)runReturningError:(char)a1 .cold.1(char a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_3(&dword_20D8CB000, v2, v3, "\"ACDDatabaseMigrator finished running! Result: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)runReturningError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Unable to open database post-migration: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)runReturningError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Caught an exception while opening the persistent store post-migration: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)runReturningError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Attempting to open the store with auto-migration on.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)runReturningError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"ACDDatabaseMigrator will begin running...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"All migrations are done. Saving context now.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_3(&dword_20D8CB000, v2, v3, "\"There are %@ accounts.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

void __41__ACDDatabaseMigrator_runReturningError___block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_3(&dword_20D8CB000, v2, v3, "\"The model version compatible with the pre-migration store is: %@.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)_migrateAccessAuthorizationsToTCCFromModelVersion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_3(&dword_20D8CB000, v2, v3, "\"Found %@ authorization entities.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)_migrateAccessAuthorizationsToTCCFromModelVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Moving all permission bits over to TCC...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_migrateOptionsAttributeOfAuthorizatinEntitiesFromModelVersion:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_26(&dword_20D8CB000, a3, (uint64_t)a3, "\"Failed to transform old options attribute!\", a1);
}

- (void)_fetchAllDataclassEntitles
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"No entity was found with name Dataclass.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_fetchAllAuthorizationEntitiesForModelVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, v0, v1, "\"No entity was found with name: %@\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_setUpContextForMigration
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 24);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, a3, "\"Setting up a context to migrate DB at path: %@\", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)_compatibleModelForStoreAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"That's the one!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_compatibleModelForStoreAtURL:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_3(&dword_20D8CB000, v2, v3, "\"Found %@ MOMs. Looking for match...\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)_postProcessMigrationFromVersion:migrationData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Post-processing migration.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __70__ACDDatabaseMigrator__postProcessMigrationFromVersion_migrationData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Unable to save database post-migration: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
