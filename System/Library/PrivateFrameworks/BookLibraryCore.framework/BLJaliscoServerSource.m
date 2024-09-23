@implementation BLJaliscoServerSource

- (BOOL)p_databaseExistsAtSharediBooksContainerLocation
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoServerSource p_persistentStoreFullPathAtSharediBooksLocation](self, "p_persistentStoreFullPathAtSharediBooksLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_setupCoreDataStack
{
  id v3;
  id v4;
  id v5;
  id v7[7];

  v7[6] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = -[BLJaliscoServerSource managedObjectModel](self, "managedObjectModel");
  v7[0] = 0;
  v4 = -[BLJaliscoServerSource persistentStoreCoordinatorWithError:](self, "persistentStoreCoordinatorWithError:", v7);
  v5 = v7[0];

  return v5 == 0;
}

- (id)managedObjectModel
{
  int64_t *p_modelSentinel;
  int64_t modelSentinel;
  _QWORD block[5];

  modelSentinel = self->_modelSentinel;
  p_modelSentinel = &self->_modelSentinel;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212C7ABE0;
  block[3] = &unk_24CE8B1F0;
  block[4] = self;
  if (modelSentinel != -1)
    dispatch_once(p_modelSentinel, block);
  return self->_model;
}

- (BOOL)p_databaseExistsAtPrivateiBooksContainerLocation
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoServerSource p_persistentStoreFullPathAtPrivateiBooksLocation](self, "p_persistentStoreFullPathAtPrivateiBooksLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (id)newManagedObjectContext
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  -[BLJaliscoServerSource persistentStoreCoordinatorWithError:](self, "persistentStoreCoordinatorWithError:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 0);
    objc_msgSend(v4, "setPersistentStoreCoordinator:", v2);
    objc_msgSend(v4, "setUndoManager:", 0);
    objc_msgSend(v4, "setMergePolicy:", *MEMORY[0x24BDBB478]);
  }
  else
  {
    BLJaliscoLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "[BLJaliscoServerSource newManagedObjectContext] Failed to create newManagedObjectContext %@", buf, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (id)newManagedObjectContextWithPrivateQueueConcurrency
{
  void *v2;
  id v3;
  void *v4;
  id v6;

  v6 = 0;
  -[BLJaliscoServerSource persistentStoreCoordinatorWithError:](self, "persistentStoreCoordinatorWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    objc_msgSend(v4, "setPersistentStoreCoordinator:", v2);
    objc_msgSend(v4, "setUndoManager:", 0);
    objc_msgSend(v4, "setMergePolicy:", *MEMORY[0x24BDBB478]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)preWarmSync
{
  id v2;
  id v3;

  kdebug_trace();
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "persistentStoreCoordinator");
  kdebug_trace();

}

- (id)p_persistentStoreFullPathAtPrivateiBooksLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[BLJaliscoServerSource p_oldPersistentStoreDirectory](self, "p_oldPersistentStoreDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLJaliscoVersion persistentStoreFileName](BLJaliscoVersion, "persistentStoreFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)persistentStoreCoordinatorWithError:(id *)a3
{
  int64_t *p_pscSentinel;
  int64_t pscSentinel;
  _QWORD v7[6];

  pscSentinel = self->_pscSentinel;
  p_pscSentinel = &self->_pscSentinel;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212C7BA28;
  v7[3] = &unk_24CE8B9F0;
  v7[4] = self;
  v7[5] = a3;
  if (pscSentinel != -1)
    dispatch_once(p_pscSentinel, v7);
  return self->_psc;
}

- (BLJaliscoServerSource)initWithIdentifier:(id)a3 databaseContainerPath:(id)a4
{
  id v6;
  id v7;
  BLJaliscoServerSource *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *databaseContainerPath;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BLJaliscoServerSource;
  v8 = -[BLJaliscoServerSource init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    databaseContainerPath = v8->_databaseContainerPath;
    v8->_databaseContainerPath = (NSString *)v11;

    if (!-[BLJaliscoServerSource _setupCoreDataStack](v8, "_setupCoreDataStack"))
    {
      BLJaliscoLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_ERROR, "Unable to initialize BLJaliscoServerSource", v15, 2u);
      }

      v8 = 0;
    }
  }
  __dmb(0xBu);

  return v8;
}

- (id)p_oldPersistentStoreDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BLJaliscoServerSource databaseContainerPath](self, "databaseContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BLJaliscoServerSource databaseContainerPath](self, "databaseContainerPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("BKJaliscoServerSource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)p_createPersistentDirectoryIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;

  -[BLJaliscoServerSource p_persistentStoreDirectory](self, "p_persistentStoreDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relativePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v8);

  return v6;
}

+ (id)sharedSource
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_254B61C88);
  if (!qword_253DB1FB0)
  {
    v3 = objc_alloc((Class)a1);
    +[BLJaliscoVersion defaultIdentifier](BLJaliscoVersion, "defaultIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithIdentifier:databaseContainerPath:", v4, 0);
    v6 = (void *)qword_253DB1FB0;
    qword_253DB1FB0 = v5;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_254B61C88);
  return (id)qword_253DB1FB0;
}

- (BOOL)workaround_18397698
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  BOOL v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  uint8_t buf[4];
  id v48;
  _BYTE v49[128];
  const __CFString *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x2199A4330](self, a2);
  v4 = -[BLJaliscoServerSource newManagedObjectContext](self, "newManagedObjectContext");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("BLJaliscoServerItem"));
  objc_msgSend(v5, "setResultType:", 4);
  v46 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v46);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v46;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("BLJaliscoServerItem"));
    objc_msgSend(v9, "setReturnsDistinctResults:", 1);
    objc_msgSend(v9, "setResultType:", 2);
    v51[0] = CFSTR("storeID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPropertiesToGroupBy:", v10);

    v50 = CFSTR("storeID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPropertiesToFetch:", v11);

    v45 = v7;
    objc_msgSend(v4, "executeFetchRequest:error:", v9, &v45);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v45;

    if (v9)
    {
      v14 = objc_msgSend(v8, "integerValue");
      v15 = objc_msgSend(v12, "count");
      v16 = 0;
      if (v14 < 2001 || v14 <= 3 * v15)
        goto LABEL_29;
      v33 = v12;
      v34 = v9;
      v35 = v8;
      v36 = v5;
      v37 = v4;
      v38 = v3;
      objc_msgSend(v4, "persistentStoreCoordinator");
      v17 = objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[NSObject persistentStores](v17, "persistentStores");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "copy");

      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v20)
      {
        v21 = v20;
        v39 = 0;
        v22 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v24, "URL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "type");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v40 = v13;
              v27 = -[NSObject destroyPersistentStoreAtURL:withType:options:error:](v17, "destroyPersistentStoreAtURL:withType:options:error:", v25, v26, 0, &v40);
              v28 = v40;

              if ((v27 & 1) != 0)
              {
                v39 = 1;
              }
              else
              {
                BLJaliscoLog();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v48 = v28;
                  _os_log_impl(&dword_212C78000, v29, OS_LOG_TYPE_ERROR, "Failed to delete database:  %@", buf, 0xCu);
                }

              }
              v13 = v28;
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        }
        while (v21);
      }
      else
      {
        v39 = 0;
      }

      v4 = v37;
      v3 = v38;
      v8 = v35;
      v5 = v36;
      v12 = v33;
      v9 = v34;
      v16 = v39;
    }
    else
    {
      BLJaliscoLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v13;
        _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch distinct items count:  %@", buf, 0xCu);
      }
      v16 = 0;
    }

LABEL_29:
    v31 = v16 & 1;
    v7 = v13;
    goto LABEL_30;
  }
  BLJaliscoLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v7;
    _os_log_impl(&dword_212C78000, v30, OS_LOG_TYPE_ERROR, "Failed to fetch all items count:  %@", buf, 0xCu);
  }

  v31 = 0;
LABEL_30:

  objc_autoreleasePoolPop(v3);
  return v31;
}

- (id)p_persistentStoreFullPathAtSharediBooksLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[BLJaliscoServerSource p_persistentStoreDirectory](self, "p_persistentStoreDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLJaliscoVersion persistentStoreFileName](BLJaliscoVersion, "persistentStoreFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)p_persistentStoreDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BLJaliscoServerSource databaseContainerPath](self, "databaseContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BLJaliscoServerSource databaseContainerPath](self, "databaseContainerPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "bu_booksGroupContainerDocumentsURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("BKJaliscoServerSource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSString)databaseContainerPath
{
  return self->_databaseContainerPath;
}

- (id)persistentStoreCoordinator
{
  return -[BLJaliscoServerSource persistentStoreCoordinatorWithError:](self, "persistentStoreCoordinatorWithError:", 0);
}

- (id)_persistentStoreOptions
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBB488];
  v5[0] = *MEMORY[0x24BDBB420];
  v5[1] = v2;
  v6[0] = MEMORY[0x24BDBD1C8];
  v6[1] = MEMORY[0x24BDBD1C8];
  v3 = *MEMORY[0x24BDBB4C8];
  v5[2] = *MEMORY[0x24BDBB520];
  v5[3] = v3;
  v6[2] = MEMORY[0x24BDBD1C8];
  v6[3] = MEMORY[0x24BDBD1C8];
  v5[4] = *MEMORY[0x24BDBB4F8];
  v6[4] = *MEMORY[0x24BDD0CF8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setSharedSource:(id)a3
{
  objc_storeStrong((id *)&qword_253DB1FB0, a3);
}

- (BLJaliscoServerSource)init
{
  void *v3;
  BLJaliscoServerSource *v4;

  +[BLJaliscoVersion defaultIdentifier](BLJaliscoVersion, "defaultIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BLJaliscoServerSource initWithIdentifier:databaseContainerPath:](self, "initWithIdentifier:databaseContainerPath:", v3, 0);

  return v4;
}

- (void)dealloc
{
  NSManagedObjectModel *model;
  NSPersistentStoreCoordinator *psc;
  objc_super v5;

  model = self->_model;
  self->_model = 0;

  psc = self->_psc;
  self->_psc = 0;

  v5.receiver = self;
  v5.super_class = (Class)BLJaliscoServerSource;
  -[BLJaliscoServerSource dealloc](&v5, sel_dealloc);
}

- (NSPersistentHistoryToken)currentJaliscoHistoryToken
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  -[BLJaliscoServerSource persistentStoreCoordinatorWithError:](self, "persistentStoreCoordinatorWithError:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    objc_msgSend(v2, "currentPersistentHistoryTokenFromStores:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BLJaliscoLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[BLJaliscoServerSource currentJaliscoHistoryToken] token:(%@) from psc:(%@)", buf, 0x16u);
    }
  }
  else
  {
    BLJaliscoLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "[BLJaliscoServerSource currentJaliscoHistoryToken] Failed to get currentJaliscoHistoryToken %@", buf, 0xCu);
    }
    v4 = 0;
  }

  return (NSPersistentHistoryToken *)v4;
}

- (id)serverInfoForDSID:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v8 = (void *)MEMORY[0x24BDD1758];
  v9 = a4;
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("userUID = %@"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[BLJaliscoServerSource existingServerInfoWithPredicate:fromManagedObjectContext:error:](self, "existingServerInfoWithPredicate:fromManagedObjectContext:error:", v10, v9, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (a5 && !v11)
    *a5 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)truncateDatabaseError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = -[BLJaliscoServerSource newManagedObjectContext](self, "newManagedObjectContext");
  -[BLJaliscoServerSource _persistentStoreOptions](self, "_persistentStoreOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoServerSource persistentStoreCoordinatorWithError:](self, "persistentStoreCoordinatorWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentStores");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF48];
  -[BLJaliscoServerSource p_persistentStoreFullPathAtSharediBooksLocation](self, "p_persistentStoreFullPathAtSharediBooksLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "URLForPersistentStore:", v9);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removePersistentStore:error:", v9, 0);
    objc_msgSend(v5, "reset");
    v14 = *MEMORY[0x24BDBB580];
    v15 = objc_msgSend(v7, "destroyPersistentStoreAtURL:withType:options:error:", v13, *MEMORY[0x24BDBB580], v6, a3);
    BLJaliscoLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412546;
      v28 = v13;
      v29 = 1024;
      LODWORD(v30) = v15;
      _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_DEFAULT, "[BLJaliscoServerSource truncateDatabaseError] Removing store:%@ destroyed:%{BOOL}d", (uint8_t *)&v27, 0x12u);
    }

    if (!v15)
    {
      v23 = 0;
      v12 = (void *)v13;
      goto LABEL_15;
    }
    v12 = (void *)v13;
  }
  else
  {
    BLJaliscoLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_ERROR, "[BLJaliscoServerSource truncateDatabaseError] There's nothing to truncate!", (uint8_t *)&v27, 2u);
    }

    v14 = *MEMORY[0x24BDBB580];
  }
  -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](self->_psc, "addPersistentStoreWithType:configuration:URL:options:error:", v14, 0, v12, v6, a3);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    BLJaliscoLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLJaliscoServerSource currentJaliscoHistoryToken](self, "currentJaliscoHistoryToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138413058;
      v28 = (uint64_t)v12;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v6;
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_DEFAULT, "Added new store at storeURL:(%@), persistentstoreID:(%@), storeOptions:(%@) Setup jalisco stack with history token after truncate:(%@)", (uint8_t *)&v27, 0x2Au);

    }
    v23 = 1;
  }
  else
  {
    v23 = 0;
  }
LABEL_15:
  +[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "resetPoliteTimers");

  return v23 & v25;
}

- (void)refreshStoreWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSPersistentStoreCoordinator *psc;
  uint64_t v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void (**v25)(_QWORD, _QWORD);
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v4 = a3;
  -[BLJaliscoServerSource persistentStoreCoordinatorWithError:](self, "persistentStoreCoordinatorWithError:", &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  objc_msgSend(v5, "persistentStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF48];
  -[BLJaliscoServerSource p_persistentStoreFullPathAtSharediBooksLocation](self, "p_persistentStoreFullPathAtSharediBooksLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:isDirectory:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLJaliscoServerSource _persistentStoreOptions](self, "_persistentStoreOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BLJaliscoLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v11;
    v30 = 2112;
    v31 = v14;
    _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_DEFAULT, "Trying to refresh store at storeURL:(%@), persistentstoreID:(%@)", buf, 0x16u);

  }
  if (v8)
  {
    objc_msgSend(v5, "URLForPersistentStore:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "removePersistentStore:error:", v8, 0);
    psc = self->_psc;
    v17 = *MEMORY[0x24BDBB580];
    v26 = v6;
    -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](psc, "addPersistentStoreWithType:configuration:URL:options:error:", v17, 0, v15, v12, &v26);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v26;

    BLJaliscoLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject identifier](v18, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[BLJaliscoServerSource currentJaliscoHistoryToken](self, "currentJaliscoHistoryToken");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v29 = v15;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v12;
        v34 = 2112;
        v35 = v23;
        _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_DEFAULT, "Refreshed store at storeURL:(%@), persistentstoreID:(%@) storeOptions:(%@) History token(%@)", buf, 0x2Au);

      }
      v24 = v18;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v19;
        _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_ERROR, "Refresh store Failed to re-add store %@", buf, 0xCu);
      }
      v24 = 0;
      v18 = v21;
    }
  }
  else
  {
    BLJaliscoLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "Refresh store failed - no store to refresh %@", buf, 0xCu);
    }
    v24 = 0;
    v15 = v11;
    v19 = v6;
  }

  v25 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A44E0](v4);
  if (v25)
    ((void (**)(_QWORD, BOOL))v25)[2](v25, v24 != 0);

}

- (id)serverDatabaseForDSID:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v8 = (void *)MEMORY[0x24BDD1758];
  v9 = a4;
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("server.userUID = %@"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[BLJaliscoServerSource existingServerDatabaseWithPredicate:fromManagedObjectContext:error:](self, "existingServerDatabaseWithPredicate:fromManagedObjectContext:error:", v10, v9, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (a5 && !v11)
    *a5 = objc_retainAutorelease(v12);

  return v11;
}

- (id)serverDatabaseForDSID:(id)a3 withIdentifier:(id)a4 fromManagedObjectContext:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v16;

  v10 = (void *)MEMORY[0x24BDD1758];
  v11 = a5;
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("identifier = %@ AND server.userUID = %@"), a4, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  -[BLJaliscoServerSource existingServerDatabaseWithPredicate:fromManagedObjectContext:error:](self, "existingServerDatabaseWithPredicate:fromManagedObjectContext:error:", v12, v11, &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (a6 && !v13)
    *a6 = objc_retainAutorelease(v14);

  return v13;
}

- (id)existingEntitiesWithName:(id)a3 matchingPredicate:(id)a4 fromManagedObjectContext:(id)a5 limit:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)MEMORY[0x2199A4330]();
  v15 = objc_alloc_init(MEMORY[0x24BDBB678]);
  objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", v11, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEntity:", v16);

  objc_msgSend(v15, "setPredicate:", v12);
  objc_msgSend(v15, "setResultType:", 1);
  if (a6)
    objc_msgSend(v15, "setFetchLimit:", a6);
  v21 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v15, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;
  v19 = v18;
  if (v18)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v18);
    objc_msgSend(v19, "logRecursively");
  }

  objc_autoreleasePoolPop(v14);
  return v17;
}

- (id)existingServerInfoWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v8 = a4;
  v15 = 0;
  -[BLJaliscoServerSource existingEntitiesWithName:matchingPredicate:fromManagedObjectContext:limit:error:](self, "existingEntitiesWithName:matchingPredicate:fromManagedObjectContext:limit:error:", CFSTR("BLJaliscoServerInfo"), a3, v8, 1, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  objc_msgSend(v9, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "existingObjectWithID:error:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v13;
}

- (id)existingServerDatabaseWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v8 = a4;
  v15 = 0;
  -[BLJaliscoServerSource existingEntitiesWithName:matchingPredicate:fromManagedObjectContext:limit:error:](self, "existingEntitiesWithName:matchingPredicate:fromManagedObjectContext:limit:error:", CFSTR("BLJaliscoServerDatabase"), a3, v8, 1, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  objc_msgSend(v9, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "existingObjectWithID:error:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v13;
}

- (id)existingServerItemWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v8 = a4;
  v15 = 0;
  -[BLJaliscoServerSource existingEntitiesWithName:matchingPredicate:fromManagedObjectContext:limit:error:](self, "existingEntitiesWithName:matchingPredicate:fromManagedObjectContext:limit:error:", CFSTR("BLJaliscoServerItem"), a3, v8, 1, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  objc_msgSend(v9, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "existingObjectWithID:error:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v13;
}

- (id)serverItemWithStoreID:(id)a3 inDatabaseWithIdentifier:(id)a4 forDSID:(id)a5 fromManagedObjectContext:(id)a6 error:(id *)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v21;

  v12 = (void *)MEMORY[0x24BDD1758];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("storeID = %@ AND database.identifier = %@ and database.server.userUID = %@"), v16, v15, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  -[BLJaliscoServerSource existingServerItemWithPredicate:fromManagedObjectContext:error:](self, "existingServerItemWithPredicate:fromManagedObjectContext:error:", v17, v13, &v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v21;
  if (a7 && !v18)
    *a7 = objc_retainAutorelease(v19);

  return v18;
}

- (id)allItemsFetchRequestForDSIDs:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel__itemsFetchRequestIncludingHiddenItems_dsids_);
}

- (id)itemsFetchRequestForDSIDs:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel__itemsFetchRequestIncludingHiddenItems_dsids_);
}

- (id)_itemsFetchRequestIncludingHiddenItems:(BOOL)a3 dsids:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BE0FBE8];
  v7 = a4;
  objc_msgSend(v6, "sharedProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeStoreAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDBB678];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLJaliscoServerSource predicateForItems:dsids:](self, "predicateForItems:dsids:", v4, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPredicate:", v15);
  if (v10)
  {
    v16 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("artist"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSortDescriptors:", v18);

  }
  return v14;
}

- (id)platformPredicatesForItemsWithActiveUserID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v3, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(((database.server.userUID == %@) AND (%K == NO OR %K == NULL)) OR ((database.server.userUID != %@) AND (%K == YES)))"), v6, CFSTR("isAudiobook"), CFSTR("isAudiobook"), v7, CFSTR("isAudiobook"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  return v4;
}

- (id)predicateForItems:(BOOL)a3 dsids:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeStoreAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("stringValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x24BDBD1A8];
    if (v10)
      v12 = (void *)v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("database.server.userUID IN %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLJaliscoServerSource platformPredicatesForItemsWithActiveUserID:](self, "platformPredicatesForItemsWithActiveUserID:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v16);

    if (!a3)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == NO OR %K == NULL)"), CFSTR("isHidden"), CFSTR("isHidden"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v17);

    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)predicateForBookletItems:(BOOL)a3 dsids:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeStoreAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("stringValue"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x24BDBD1A8];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("parentItem.database.server.userUID IN %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(parentItem.%K == NO OR parentItem.%K == NULL)"), CFSTR("isHidden"), CFSTR("isHidden"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)fetchRequestForAllCloudIDs:(id)a3 dsids:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[BLJaliscoServerSource itemsFetchRequestForDSIDs:](self, "itemsFetchRequestForDSIDs:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v6, "count");

  objc_msgSend(v8, "setFetchLimit:", v10 * v9);
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v8, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("cloudID IN %@"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "arrayWithObjects:", v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v14);
  objc_msgSend(v8, "setPredicate:", v15);

  return v8;
}

- (id)fetchRequestForStoreIDs:(id)a3 dsids:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[BLJaliscoServerSource itemsFetchRequestForDSIDs:](self, "itemsFetchRequestForDSIDs:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v6, "count");

  objc_msgSend(v8, "setFetchLimit:", v10 * v9);
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v8, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeID IN %@"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "arrayWithObjects:", v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v14);
  objc_msgSend(v8, "setPredicate:", v15);

  return v8;
}

- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[BLJaliscoServerSource allItemsFetchRequestForDSIDs:](self, "allItemsFetchRequestForDSIDs:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v6, "count");

  objc_msgSend(v8, "setFetchLimit:", v10 * v9);
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v8, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeID IN %@"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "arrayWithObjects:", v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v14);
  objc_msgSend(v8, "setPredicate:", v15);

  return v8;
}

- (id)fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:(id)a3 dsids:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  -[BLJaliscoServerSource allItemsFetchRequestForDSIDs:](self, "allItemsFetchRequestForDSIDs:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v6, "count");

  objc_msgSend(v8, "setFetchLimit:", v10 * v9);
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v8, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeID IN %@"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("purchasedTokenCode != NULL and purchasedTokenCode != 0"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "arrayWithObjects:", v12, v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v15);
  objc_msgSend(v8, "setPredicate:", v16);

  return v8;
}

- (id)fetchRequestForAllStoreIDs:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBB678];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeStoreAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("artist"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSortDescriptors:", v13);

  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeID IN %@"), v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v14);

  return v7;
}

- (id)fetchRequestForNeedsImport:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BDBB678];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLJaliscoServerSource predicateForNeedsImport:](self, "predicateForNeedsImport:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  return v8;
}

- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4 isImported:(BOOL)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel_fetchRequestForAllStoreIDs_dsids_isImported_includeHidden_);
}

- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4 isImported:(BOOL)a5 includeHidden:(BOOL)a6
{
  _BOOL4 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a5;
  -[BLJaliscoServerSource fetchRequestForAllStoreIDs:dsids:](self, "fetchRequestForAllStoreIDs:dsids:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v9, "predicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoServerSource predicateForNeedsImport:](self, "predicateForNeedsImport:", !v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a6)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == NO OR %K == NULL)"), CFSTR("isHidden"), CFSTR("isHidden"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v13);
  objc_msgSend(v9, "setPredicate:", v15);

  return v9;
}

- (id)predicateForNeedsImport:(BOOL)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  if (a3)
    v4 = CFSTR("(%K == YES)");
  else
    v4 = CFSTR("(%K == NO OR %K == NULL)");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v4, CFSTR("needsImport"), CFSTR("needsImport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeStoreAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_DSID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &unk_24CEA08B0;
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  -[BLJaliscoServerSource platformPredicatesForItemsWithActiveUserID:](self, "platformPredicatesForItemsWithActiveUserID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v13);
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fetchRequestForBuyParameters:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBB678];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeDownloadParameters == %@"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  return v7;
}

- (id)fetchRequestForNotInStoreAccountIDs:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDBB678];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKey:", CFSTR("stringValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (storeAccountID IN %@)"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v9);

  return v7;
}

- (id)predicateForStoreAccountID:(id)a3 storeIDs:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1758];
  v7 = a4;
  objc_msgSend(a3, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("storeAccountID = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeID IN %@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeStoreAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ams_DSID");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &unk_24CEA08B0;
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  -[BLJaliscoServerSource platformPredicatesForItemsWithActiveUserID:](self, "platformPredicatesForItemsWithActiveUserID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObjectsFromArray:", v19);
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)fetchRequestForBookletItemsForStoreIDs:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBB678];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeID IN %@"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v11);

  return v7;
}

- (id)fetchRequestForAllBookletsIDsWithParentStoreIDs:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBB678];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("parentItem.storeID IN %@"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v7, "setReturnsDistinctResults:", 1);
  objc_msgSend(v7, "setResultType:", 2);
  v13[0] = CFSTR("storeID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToGroupBy:", v9);

  v12 = CFSTR("storeID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v10);

  return v7;
}

- (id)fetchRequestForHiddenItemsWithAccountIDs:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBB678];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKey:", CFSTR("stringValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("database.server.userUID IN %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == YES)"), CFSTR("isHidden"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD14C0];
  v15[0] = v9;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v13);

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDatabaseContainerPath:(id)a3
{
  objc_storeStrong((id *)&self->_databaseContainerPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseContainerPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_psc, 0);
}

@end
