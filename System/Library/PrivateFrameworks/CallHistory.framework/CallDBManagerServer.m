@implementation CallDBManagerServer

+ (id)getDestinationModelForVersion:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@/%@ %@"), CFSTR("CallHistory"), CFSTR("momd"), CFSTR("CallHistory"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("mom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int64_t)getNextVersionToMigrateToCurrentVersion:(int64_t)a3
{
  int64_t *v3;

  if ((unint64_t)(a3 - 5) >= 0x1E)
    v3 = &kCHUnknownDBVersion;
  else
    v3 = (int64_t *)((char *)&unk_1B3FDFA58 + 8 * a3 - 40);
  return *v3;
}

+ (int64_t)getNextVersionToDowngradeTo:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) > 0x1A)
    return 5;
  else
    return qword_1B3FDFB48[a3 - 8];
}

+ (int64_t)getNextVersionToDowngradeTo:(int64_t)a3 withSourceVersion:(int64_t)a4
{
  if (a4 == a3)
    return a4;
  else
    return +[CallDBManagerServer getNextVersionToDowngradeTo:](CallDBManagerServer, "getNextVersionToDowngradeTo:", a4);
}

+ (id)getDestinationModel:(int64_t)a3
{
  return (id)objc_msgSend(a1, "getDestinationModelForVersion:", +[CallDBManagerServer getNextVersionToMigrateToCurrentVersion:](CallDBManagerServer, "getNextVersionToMigrateToCurrentVersion:", a3));
}

+ (id)downgradeDatabaseAtLocation:(id)a3 toVersion:(int64_t)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__CallDBManagerServer_downgradeDatabaseAtLocation_toVersion___block_invoke;
  v5[3] = &__block_descriptor_40_e15___NSURL_16__0q8l;
  v5[4] = a4;
  +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:](DBManager, "migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:", a3, v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __61__CallDBManagerServer_downgradeDatabaseAtLocation_toVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CallDBManagerServer getDestinationModelForVersion:](CallDBManagerServer, "getDestinationModelForVersion:", +[CallDBManagerServer getNextVersionToDowngradeTo:withSourceVersion:](CallDBManagerServer, "getNextVersionToDowngradeTo:withSourceVersion:", *(_QWORD *)(a1 + 32), a2));
}

- (CallDBManagerServer)init
{
  CHDeviceObserver *v3;
  CallDBManagerServer *v4;

  v3 = objc_alloc_init(CHDeviceObserver);
  v4 = -[CallDBManagerServer initWithDeviceObserver:](self, "initWithDeviceObserver:", v3);

  return v4;
}

- (CallDBManagerServer)initWithDeviceObserver:(id)a3
{
  CallDBManagerServer *v3;
  CHFeatureFlags *v4;
  CHFeatureFlags *featureFlags;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CallDBManagerServer;
  v3 = -[CallDBManager initWithDeviceObserver:](&v7, sel_initWithDeviceObserver_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(CHFeatureFlags);
    featureFlags = v3->_featureFlags;
    v3->_featureFlags = v4;

  }
  return v3;
}

- (void)createPermanent
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  CallDBMetaInfo *v9;
  void *v10;
  CallDBMetaInfo *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CallDBManagerServer permDBLocation:](self, "permDBLocation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 34;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logHandleForDomain:", "ch.calldbm");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v3;
    v14 = 2048;
    v15 = 34;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Creating permanent data store: %{public}@ for version: %ld", (uint8_t *)&v12, 0x16u);
  }

  if (-[CallDBManagerServer bootUpDBAtLocationWithRecovery:isEncrypted:](self, "bootUpDBAtLocationWithRecovery:isEncrypted:", v3, 1))
  {
    -[CallDBManager handlePermanentCreated](self, "handlePermanentCreated");
    if (!-[CallDBManagerServer createCallDBProperties](self, "createCallDBProperties"))
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logHandleForDomain:", "ch.calldbm");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create call db properties object for permanent store", (uint8_t *)&v12, 2u);
      }

    }
  }
  else
  {
    v4 = 0;
  }
  v9 = [CallDBMetaInfo alloc];
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CallDBMetaInfo initWithURL:](v9, "initWithURL:", v10);

  -[CallDBMetaInfo writeDatabaseVersion:isTemp:](v11, "writeDatabaseVersion:isTemp:", v4, 0);
}

- (void)createTemporary
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  CallDBMetaInfo *v9;
  void *v10;
  CallDBMetaInfo *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CallDBManagerServer tempDBLocation:](self, "tempDBLocation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "ch.calldbm");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Creating temporary data store: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  if (-[CallDBManagerServer bootUpDBAtLocationWithRecovery:isEncrypted:](self, "bootUpDBAtLocationWithRecovery:isEncrypted:", v3, 0))
  {
    v6 = 34;
    -[CallDBManager handleTemporaryCreated](self, "handleTemporaryCreated");
    if (!-[CallDBManagerServer createCallDBProperties](self, "createCallDBProperties"))
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logHandleForDomain:", "ch.calldbm");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create call db properties object for temporary store", (uint8_t *)&v12, 2u);
      }

    }
  }
  else
  {
    v6 = 0;
  }
  v9 = [CallDBMetaInfo alloc];
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CallDBMetaInfo initWithURL:](v9, "initWithURL:", v10);

  -[CallDBMetaInfo writeDatabaseVersion:isTemp:](v11, "writeDatabaseVersion:isTemp:", v6, 1);
}

- (id)tempDBLocation:(unsigned __int8 *)a3
{
  return +[CallDBManager getDBLocationIsSandboxed:isTemporary:error:](CallDBManager, "getDBLocationIsSandboxed:isTemporary:error:", 0, 1, a3);
}

- (id)permDBLocation:(unsigned __int8 *)a3
{
  return +[CallDBManager getDBLocationIsSandboxed:isTemporary:error:](CallDBManager, "getDBLocationIsSandboxed:isTemporary:error:", 0, 0, a3);
}

- (void)moveCallsFromTempDatabase
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("kMoveCallRecordsFromTemporaryStoreNotitification"), self);

}

- (BOOL)bootUpDBAtLocationWithRecovery:(id)a3 isEncrypted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;

  v4 = a4;
  v6 = a3;
  if (-[CallDBManagerServer bootUpDBAtLocation:isEncrypted:](self, "bootUpDBAtLocation:isEncrypted:", v6, v4))
  {
    v7 = 1;
  }
  else
  {
    v8 = -[CallDBManagerServer handleBootUpFailure:](self, "handleBootUpFailure:", v6);
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logHandleForDomain:", "ch.calldbm");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11)
        -[CallDBManagerServer bootUpDBAtLocationWithRecovery:isEncrypted:].cold.1();

      v7 = -[CallDBManagerServer bootUpDBAtLocation:isEncrypted:](self, "bootUpDBAtLocation:isEncrypted:", v6, v4);
    }
    else
    {
      if (v11)
        -[CallDBManagerServer bootUpDBAtLocationWithRecovery:isEncrypted:].cold.2();

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)handleBootUpFailure:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("backup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  v8 = (!v7
     || +[DBManager destroyDBAtLocation:withModelAtLocation:](DBManager, "destroyDBAtLocation:withModelAtLocation:", v4, 0))&& +[DBManager moveDBAtLocation:toLocation:withModelAtLocation:](DBManager, "moveDBAtLocation:toLocation:withModelAtLocation:", v3, v4, 0)&& +[DBManager destroyDBAtLocation:withModelAtLocation:](DBManager, "destroyDBAtLocation:withModelAtLocation:", v3, 0);

  return v8;
}

+ (id)getObjectIdsForDuplicateRecordsWithUniqueIds:(id)a3 andHavingObjectIds:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(v5, "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v22;
      v14 = -1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v16, "length", (_QWORD)v21))
          {
            if ((objc_msgSend(v16, "isEqualToString:", v12) & 1) != 0)
            {
              objc_msgSend(v6, "objectAtIndex:", v14 + i + 1);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v17);
            }
            else
            {
              v18 = v16;
              v17 = v12;
              v12 = v18;
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v14 += i;
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logHandleForDomain:", "ch.calldbm");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CallDBManagerServer getObjectIdsForDuplicateRecordsWithUniqueIds:andHavingObjectIds:].cold.1();
    v8 = 0;
  }

  return v8;
}

+ (id)getUniqueIdsForAllRecords:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __CFString *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CallRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultType:", 2);
  v5 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("unique_id"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", CFSTR("CallRecord"), v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "propertiesByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("unique_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v10);

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "executeFetchRequest:error:", v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "objectForKey:", CFSTR("unique_id"));
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
          v18 = (__CFString *)v17;
        else
          v18 = &stru_1E6747850;
        objc_msgSend(v11, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  return v11;
}

+ (id)getObjectIdsForAllRecords:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C97B48];
  v4 = a3;
  objc_msgSend(v3, "fetchRequestWithEntityName:", CFSTR("CallRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("unique_id"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithObjects:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v8);

  objc_msgSend(v5, "setResultType:", 1);
  objc_msgSend(v4, "executeFetchRequest:error:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)createMOCForDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v5 = a5;
  v7 = a3;
  +[CallDBManagerServer getDestinationModelForVersion:](CallDBManagerServer, "getDestinationModelForVersion:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DBManager instanceWithModelURL:](DBManager, "instanceWithModelURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "addDataStoreAtLocation:isEncrypted:", v7, v5) & 1) != 0)
  {
    objc_msgSend(v9, "createManagedObjectContext");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v11 = v10;
      v12 = v11;
    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logHandleForDomain:", "ch.calldbm");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:].cold.1();

      v12 = 0;
    }
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logHandleForDomain:", "ch.calldbm");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:].cold.2();
    v12 = 0;
  }

  return v12;
}

- (BOOL)removeDuplicatesFromDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandleForDomain:", "ch.calldbm");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Removing the records with duplicate unique ids", buf, 2u);
  }

  -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:](self, "createMOCForDBAtLocation:dbVersion:isEncrypted:", v8, a4, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[CallDBManagerServer getUniqueIdsForAllRecords:](CallDBManagerServer, "getUniqueIdsForAllRecords:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CallDBManagerServer getObjectIdsForAllRecords:](CallDBManagerServer, "getObjectIdsForAllRecords:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CallDBManagerServer getObjectIdsForDuplicateRecordsWithUniqueIds:andHavingObjectIds:](CallDBManagerServer, "getObjectIdsForDuplicateRecordsWithUniqueIds:andHavingObjectIds:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithObjectIDs:", v14);
      -[NSObject setResultType:](v15, "setResultType:", 2);
      v25 = 0;
      objc_msgSend(v11, "executeRequest:error:", v15, &v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v25;
      v18 = v17 == 0;
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logHandleForDomain:", "ch.calldbm");
      v20 = objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CallDBManagerServer removeDuplicatesFromDBAtLocation:dbVersion:isEncrypted:].cold.1();
      }
      else
      {
        v22 = v20;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "result");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v24;
          _os_log_impl(&dword_1B3FA4000, v22, OS_LOG_TYPE_DEFAULT, "Number of records deleted: %{public}@", buf, 0xCu);

        }
      }

    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logHandleForDomain:", "ch.calldbm");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3FA4000, v15, OS_LOG_TYPE_DEFAULT, "There exist no duplicate records in the database", buf, 2u);
      }
      v18 = 1;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)modifyCallRecordForDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5 modifyCallRecord:(id)a6
{
  _BOOL8 v6;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, _QWORD))a6;
  -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:](self, "createMOCForDBAtLocation:dbVersion:isEncrypted:", a3, a4, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CallRecord"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v11, "executeFetchRequest:error:", v12, &v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v30;
    if (v14)
    {
      v15 = v14;
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logHandleForDomain:", "ch.calldbm");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:].cold.2();
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v27;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v27 != v21)
              objc_enumerationMutation(v18);
            v10[2](v10, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22++));
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v20);
      }

      v25 = 0;
      v23 = objc_msgSend(v11, "save:", &v25);
      v15 = v25;
      if ((v23 & 1) != 0)
        goto LABEL_16;
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logHandleForDomain:", "ch.calldbm");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:].cold.1();
    }

LABEL_16:
  }

}

- (void)populateServiceProviderAndCallCategory:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a5;
  v8 = a3;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandleForDomain:", "ch.calldbm");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Populating service provider and call category information", v11, 2u);
  }

  -[CallDBManagerServer modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:](self, "modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:", v8, a4, v5, &__block_literal_global_9);
}

void __84__CallDBManagerServer_populateServiceProviderAndCallCategory_dbVersion_isEncrypted___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "calltype");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  +[CHRecentCall serviceProviderForCallType:](CHRecentCall, "serviceProviderForCallType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setService_provider:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[CHRecentCall categoryForCallType:](CHRecentCall, "categoryForCallType:", v4));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCall_category:", v6);

}

- (void)populateRecentCallRemoteParticipantHandles:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a5;
  v8 = a3;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandleForDomain:", "ch.calldbm");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Populating remote participant handles", v11, 2u);
  }

  -[CallDBManagerServer modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:](self, "modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:", v8, a4, v5, &__block_literal_global_32);
}

void __88__CallDBManagerServer_populateRecentCallRemoteParticipantHandles_dbVersion_isEncrypted___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  CHPhoneNumber *v5;
  void *v6;
  CHPhoneNumber *v7;
  void *v8;
  void *v9;
  CHHandle *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handle_type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 && v2)
  {
    if (v4 == 2)
    {
      v5 = [CHPhoneNumber alloc];
      objc_msgSend(v14, "iso_country_code");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CHPhoneNumber initWithDigits:isoCountryCode:](v5, "initWithDigits:isoCountryCode:", v2, v6);

      -[CHPhoneNumber normalizedRepresentation](v7, "normalizedRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = -[CHHandle initWithType:value:normalizedValue:]([CHHandle alloc], "initWithType:value:normalizedValue:", v4, v2, v8);
    objc_msgSend(v9, "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHManagedHandle managedHandlesForHandles:inManagedObjectContext:](CHManagedHandle, "managedHandlesForHandles:inManagedObjectContext:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRemoteParticipantHandles:", v13);

  }
}

- (void)populateHandleType:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a5;
  v8 = a3;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandleForDomain:", "ch.calldbm");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Populating handle type", v11, 2u);
  }

  -[CallDBManagerServer modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:](self, "modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:", v8, a4, v5, &__block_literal_global_37);
}

void __64__CallDBManagerServer_populateHandleType_dbVersion_isEncrypted___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  objc_msgSend(v3, "address");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", +[CHHandle handleTypeForValue:](CHHandle, "handleTypeForValue:", v5));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandle_type:", v4);

}

- (void)prepareDatabaseForNextStepInMigration:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a3;
  switch(a4)
  {
    case 17:
      v8 = (void *)MEMORY[0x1B5E33064]();
      -[CallDBManagerServer populateRecentCallRemoteParticipantHandles:dbVersion:isEncrypted:](self, "populateRecentCallRemoteParticipantHandles:dbVersion:isEncrypted:", v9, 17, v5);
      goto LABEL_7;
    case 13:
      v8 = (void *)MEMORY[0x1B5E33064]();
      -[CallDBManagerServer populateHandleType:dbVersion:isEncrypted:](self, "populateHandleType:dbVersion:isEncrypted:", v9, 13, v5);
      goto LABEL_7;
    case 12:
      v8 = (void *)MEMORY[0x1B5E33064]();
      -[CallDBManagerServer populateServiceProviderAndCallCategory:dbVersion:isEncrypted:](self, "populateServiceProviderAndCallCategory:dbVersion:isEncrypted:", v9, 12, v5);
LABEL_7:
      objc_autoreleasePoolPop(v8);
      break;
  }

}

- (BOOL)handleDatabaseMigration:(id)a3 isEncrypted:(BOOL)a4 isRetry:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandleForDomain:", "ch.calldbm");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Performing necessary steps for migration", buf, 2u);
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __67__CallDBManagerServer_handleDatabaseMigration_isEncrypted_isRetry___block_invoke;
  v22[3] = &unk_1E6747088;
  v22[4] = self;
  v11 = v8;
  v23 = v11;
  v24 = v6;
  v12 = (void *)MEMORY[0x1B5E33208](v22);
  +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:](DBManager, "migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:", v11, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logHandleForDomain:", "ch.calldbm");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    getDBMErrorCodeAsString(objc_msgSend(v13, "errorCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v17;
    _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "Migration result is: %{public}@", buf, 0xCu);

  }
  if (objc_msgSend(v13, "errorCode"))
  {
    v18 = 0;
    if (objc_msgSend(v13, "errorCode") == 4 && !a5)
    {
      if (-[CallDBManagerServer removeDuplicatesFromDBAtLocation:dbVersion:isEncrypted:](self, "removeDuplicatesFromDBAtLocation:dbVersion:isEncrypted:", v11, objc_msgSend(v13, "dbVersion"), v6))
      {
        v18 = -[CallDBManagerServer handleDatabaseMigration:isEncrypted:isRetry:](self, "handleDatabaseMigration:isEncrypted:isRetry:", v11, v6, 1);
      }
      else
      {
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logHandleForDomain:", "ch.calldbm");
        v20 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CallDBManagerServer handleDatabaseMigration:isEncrypted:isRetry:].cold.1();

        v18 = 0;
      }
    }
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

id __67__CallDBManagerServer_handleDatabaseMigration_isEncrypted_isRetry___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareDatabaseForNextStepInMigration:dbVersion:isEncrypted:", *(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 48));
  return +[CallDBManagerServer getDestinationModel:](CallDBManagerServer, "getDestinationModel:", a2);
}

- (id)getUUIDsOfNMostRecentRecords:(unint64_t)a3 fromManagedObjectContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  __CFString *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CallRecord"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithObjects:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v9);

  objc_msgSend(v6, "setFetchLimit:", a3);
  +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", CFSTR("CallRecord"), v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "propertiesByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("unique_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v12);

  objc_msgSend(v6, "setResultType:", 2);
  objc_msgSend(v5, "executeFetchRequest:error:", v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "objectForKey:", CFSTR("unique_id"));
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
          v21 = (__CFString *)v20;
        else
          v21 = &stru_1E6747850;
        objc_msgSend(v14, "addObject:", v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  return v14;
}

- (void)prepareForMigrationDBAtURL:(id)a3 withModelAtURL:(id)a4 andIsEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v33;
  id v34;
  char *v35;
  void *v36;
  uint8_t v37;
  char v38[7];
  uint64_t v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v5 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logHandleForDomain:");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v41 = v8;
    v42 = 2114;
    v43 = v9;
    _os_log_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_DEFAULT, "Restricting number of records before performing migration: %{public}@ %{public}@", buf, 0x16u);
  }

  +[DBManager instanceWithModelURL:](DBManager, "instanceWithModelURL:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "addDataStoreAtLocation:isEncrypted:", v8, v5) & 1) != 0)
  {
    objc_msgSend(v12, "createManagedObjectContext");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logHandleForDomain:", "ch.calldbm");
      v29 = objc_claimAutoreleasedReturnValue();

      v36 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:].cold.1();
LABEL_23:

      goto LABEL_24;
    }
    -[CallDBManagerServer featureFlags](self, "featureFlags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "increaseCallHistoryEnabled");

    if ((v15 & 1) == 0)
    {
      v33 = v9;
      v34 = v8;
      -[CallDBManagerServer getUUIDsOfNMostRecentRecords:fromManagedObjectContext:](self, "getUUIDsOfNMostRecentRecords:fromManagedObjectContext:", 1000, v13);
      v35 = 0;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CallRecord"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("unique_id"), v36);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPredicate:", v18);

        objc_msgSend(v17, "setFetchLimit:", 1000);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v17);
        objc_msgSend(v19, "setResultType:", 2);
        v39 = 0;
        -[NSObject executeRequest:error:](v13, "executeRequest:error:", v19, &v39);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = v39;
        if (v39)
        {
          +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "logHandleForDomain:", "ch.calldbm");
          v24 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[CallDBManagerServer prepareForMigrationDBAtURL:withModelAtURL:andIsEncrypted:].cold.2(&v37, v38, v24);

        }
        else
        {
          objc_msgSend(v20, "result");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v25, "unsignedIntegerValue");

          v35 += v16;
        }

        if (v22)
          break;
        v26 = v16 == 1000;
        v16 = 1000;
        if (!v26)
        {
          +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "logHandleForDomain:", "ch.calldbm");
          v31 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v41 = v35;
            _os_log_impl(&dword_1B3FA4000, v31, OS_LOG_TYPE_DEFAULT, "Total number of records deleted are: %lu", buf, 0xCu);
          }

          break;
        }
      }
      v9 = v33;
      v8 = v34;
      goto LABEL_23;
    }
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logHandleForDomain:", "ch.calldbm");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:].cold.2();
  }
LABEL_24:

}

- (BOOL)createCallDBProperties
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  CallDBProperties *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[8];
  id v23;

  -[CallDBManager dbManager](self, "dbManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", CFSTR("CallDBProperties"), v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logHandleForDomain:", "ch.calldbm");
      v5 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer createCallDBProperties].cold.2();
      v11 = 0;
      goto LABEL_29;
    }
    v5 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    -[NSObject setEntity:](v5, "setEntity:", v4);
    v23 = 0;
    objc_msgSend(v3, "executeFetchRequest:error:", v5, &v23);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v23;
    if (v7)
    {
      v8 = v7;
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logHandleForDomain:", "ch.calldbm");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer createCallDBProperties].cold.5();

      v11 = 0;
      goto LABEL_28;
    }
    if (v6 && objc_msgSend(v6, "count"))
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logHandleForDomain:", "ch.calldbm");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Call DB properties object already exist, not creating again", buf, 2u);
      }
      v11 = 1;
      goto LABEL_28;
    }
    v15 = -[CallDBProperties initWithEntity:insertIntoManagedObjectContext:]([CallDBProperties alloc], "initWithEntity:insertIntoManagedObjectContext:", v4, v3);
    if (v15)
    {
      v21 = 0;
      v16 = objc_msgSend(v3, "save:", &v21);
      v8 = v21;
      if ((v16 & 1) != 0)
      {
        v11 = 1;
LABEL_27:

LABEL_28:
LABEL_29:

        goto LABEL_30;
      }
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logHandleForDomain:", "ch.calldbm");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer createCallDBProperties].cold.4();
    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logHandleForDomain:", "ch.calldbm");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer createCallDBProperties].cold.3();
      v8 = 0;
    }

    v11 = 0;
    goto LABEL_27;
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logHandleForDomain:", "ch.calldbm");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:].cold.1();
  v11 = 0;
LABEL_30:

  return v11;
}

- (BOOL)bootUpDBAtLocation:(id)a3 isEncrypted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  NSObject *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  NSObject *v31;
  uint8_t v32[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = +[DBManager versionForDBAtLocation:](DBManager, "versionForDBAtLocation:", v6);
  +[CallDBManager modelURL](CallDBManager, "modelURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = +[DBManager isDataStoreAtURLInitialized:withModelAtURL:](DBManager, "isDataStoreAtURLInitialized:withModelAtURL:", v6, v8);
  if (v9 == 3)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logHandleForDomain:", "ch.calldbm");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CallDBManagerServer bootUpDBAtLocation:isEncrypted:].cold.4();
    goto LABEL_24;
  }
  v10 = v9;
  if (v9 == 2)
  {
    +[CallDBManagerServer getDestinationModelForVersion:](CallDBManagerServer, "getDestinationModelForVersion:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CallDBManagerServer prepareForMigrationDBAtURL:withModelAtURL:andIsEncrypted:](self, "prepareForMigrationDBAtURL:withModelAtURL:andIsEncrypted:", v6, v15, v4);
    v16 = -[CallDBManagerServer handleDatabaseMigration:isEncrypted:isRetry:](self, "handleDatabaseMigration:isEncrypted:isRetry:", v6, v4, 0);

    v17 = 0;
    if (!v16)
      goto LABEL_27;
    goto LABEL_13;
  }
  if (!v9)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logHandleForDomain:", "ch.calldbm");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v12, OS_LOG_TYPE_DEFAULT, "No data store intialization required", buf, 2u);
    }

    goto LABEL_13;
  }
  -[CallDBManager dbManager](self, "dbManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "addDataStoreAtLocation:isEncrypted:", v6, v4);

  if ((v19 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logHandleForDomain:", "ch.calldbm");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:].cold.2();
LABEL_24:

LABEL_25:
    v17 = 0;
LABEL_26:

    goto LABEL_27;
  }

  if (v10)
    goto LABEL_21;
LABEL_13:
  -[CallDBManager dbManager](self, "dbManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "addDataStoreAtLocation:isEncrypted:", v6, v4);

  if ((v21 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logHandleForDomain:", "ch.calldbm");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:].cold.2();
    goto LABEL_25;
  }
  -[CallDBManagerServer featureFlags](self, "featureFlags");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "increaseCallHistoryEnabled");

  if (v23)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logHandleForDomain:", "ch.calldbm");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1B3FA4000, v25, OS_LOG_TYPE_DEFAULT, "Received success from migration. Checking if we need to prune", v32, 2u);
    }

    -[CallDBManager dbManager](self, "dbManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "createManagedObjectContext");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CallDBManagerServer pruneDBFromManagedContext:version:](self, "pruneDBFromManagedContext:version:", v8, v7);
    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "logHandleForDomain:", "ch.calldbm");
      v31 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:].cold.1();

    }
    v17 = 1;
    goto LABEL_26;
  }
LABEL_21:
  v17 = 1;
LABEL_27:

  return v17;
}

- (void)pruneDBFromManagedContext:(id)a3 version:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CallDBManagerServer dbShouldBePrunedForVersion:](self, "dbShouldBePrunedForVersion:", a4))
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForDomain:", "ch.calldbm");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = a4;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "DB needs to be pruned for version: %lu", (uint8_t *)&v24, 0xCu);
    }

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CallDBManagerServer uniqueIDsOfCallsToKeepFromManagedObjectContext:forFaceTimeCalls:](self, "uniqueIDsOfCallsToKeepFromManagedObjectContext:forFaceTimeCalls:", v6, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logHandleForDomain:", "ch.calldbm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v10, "count");
      v24 = 134217984;
      v25 = v14;
      _os_log_impl(&dword_1B3FA4000, v13, OS_LOG_TYPE_DEFAULT, "Calls visible in FT App to user: %lu", (uint8_t *)&v24, 0xCu);
    }

    -[CallDBManagerServer uniqueIDsOfCallsToKeepFromManagedObjectContext:forFaceTimeCalls:](self, "uniqueIDsOfCallsToKeepFromManagedObjectContext:forFaceTimeCalls:", v6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v15);
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logHandleForDomain:", "ch.calldbm");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v15, "count");
      v24 = 134217984;
      v25 = v19;
      _os_log_impl(&dword_1B3FA4000, v18, OS_LOG_TYPE_DEFAULT, "Calls visible in Phone App to user: %lu", (uint8_t *)&v24, 0xCu);
    }

    v20 = (void *)MEMORY[0x1E0CB3528];
    +[CHRecentCall predicateForCallsWithAnyUniqueIDs:](CHRecentCall, "predicateForCallsWithAnyUniqueIDs:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "notPredicateWithSubpredicate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[CallDBManagerServer deleteObjectsWithPredicate:fromManagedObjectContext:](self, "deleteObjectsWithPredicate:fromManagedObjectContext:", v22, v6);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBool:forKey:", 1, CFSTR("CHDBLimitIncreasedPruned"));

  }
}

- (id)uniqueIDsOfCallsToKeepFromManagedObjectContext:(id)a3 forFaceTimeCalls:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[3];

  v4 = a4;
  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  objc_msgSend(v6, "fetchRequestWithEntityName:", CFSTR("CallRecord"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("service_provider == %@"), CFSTR("com.apple.FaceTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v9);

  }
  v17[0] = CFSTR("remoteParticipantHandles");
  v17[1] = CFSTR("emergencyMediaItems");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v16 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v12);

  objc_msgSend(v8, "setFetchLimit:", 200);
  objc_msgSend(v7, "executeFetchRequest:error:", v8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CallDBManagerServer uniqueIDsFromCallRecords:forFaceTimeCalls:](self, "uniqueIDsFromCallRecords:forFaceTimeCalls:", v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)uniqueIDsFromCallRecords:(id)a3 forFaceTimeCalls:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  __CFString **v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id obj;
  __CFString *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = kCHCoalescingStrategyCollapseIfEqual;
  if (!v4)
    v6 = kCHCoalescingStrategyRecents;
  v28 = *v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v30;
    obj = v8;
    while (2)
    {
      v14 = 0;
      v15 = v11;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        v17 = (void *)MEMORY[0x1B5E33064]();
        objc_msgSend(v16, "chRecentCall");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v15)
        {
          objc_msgSend(v15, "coalescedCallWithCall:usingStrategy:", v18, v28);
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = v18;
        }
        v21 = v20;
        if (v20)
        {
          v22 = v20;
        }
        else
        {
          ++v12;
          v22 = v19;
          if (v12 == 100)
          {
            v24 = v7;

            objc_autoreleasePoolPop(v17);
            v8 = obj;

            goto LABEL_20;
          }
        }
        v11 = v22;

        objc_msgSend(v19, "uniqueId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v23);

        objc_autoreleasePoolPop(v17);
        ++v14;
        v15 = v11;
      }
      while (v10 != v14);
      v8 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  v25 = v7;
  v15 = v11;
LABEL_20:

  return v7;
}

- (void)deleteObjectsWithPredicate:(id)a3 fromManagedObjectContext:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "fetchRequestWithEntityName:", CFSTR("CallRecord"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v8);
  objc_msgSend(v9, "setResultType:", 2);
  v16 = 0;
  objc_msgSend(v6, "executeRequest:error:", v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logHandleForDomain:", "ch.calldbm");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CallDBManagerServer deleteObjectsWithPredicate:fromManagedObjectContext:].cold.1();
  }
  else
  {
    objc_msgSend(v10, "result");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logHandleForDomain:", "ch.calldbm");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v14;
      _os_log_impl(&dword_1B3FA4000, v12, OS_LOG_TYPE_DEFAULT, "Deleted %ld calls from the data store.", buf, 0xCu);
    }
  }

}

- (BOOL)dbShouldBePrunedForVersion:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 < 27)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject BOOLForKey:](v5, "BOOLForKey:", CFSTR("CHDBLimitIncreasedPruned")) ^ 1;
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForDomain:", "ch.calldbm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = (int64_t)v10;
      _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "DB version was eligible for pruning. shouldBePruned: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logHandleForDomain:", "ch.calldbm");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a3;
      _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "DB does not need to be pruned as version: %lu is greater than kCHDBVersionTwentySeven", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

- (void)bootUpDBAtLocationWithRecovery:isEncrypted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Booting up the database after taking the backup of the bootless one", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bootUpDBAtLocationWithRecovery:isEncrypted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Call history database is not recoverable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)getObjectIdsForDuplicateRecordsWithUniqueIds:andHavingObjectIds:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_1B3FA4000, v1, OS_LOG_TYPE_ERROR, "Objects ids(%lu) and unique ids(%lu) count mismatch", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)createMOCForDBAtLocation:dbVersion:isEncrypted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to create the managed context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)createMOCForDBAtLocation:dbVersion:isEncrypted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to add data store at location: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeDuplicatesFromDBAtLocation:dbVersion:isEncrypted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to execute the delete request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to perform save on the managed context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to execute fetch request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleDatabaseMigration:isEncrypted:isRetry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to remove duplicates from the database at location: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)prepareForMigrationDBAtURL:(uint8_t *)buf withModelAtURL:(_BYTE *)a2 andIsEncrypted:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_ERROR, "Failed to execute the delete request", buf, 2u);
}

- (void)createCallDBProperties
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to get the records with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)bootUpDBAtLocation:isEncrypted:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Error occured", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteObjectsWithPredicate:fromManagedObjectContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to execute the delete request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
