@implementation _KSTextReplacementCoreDataStore

- (BOOL)didMakeInitialPull
{
  _KSTextReplacementCoreDataStore *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53___KSTextReplacementCoreDataStore_didMakeInitialPull__block_invoke;
  v5[3] = &unk_24E205770;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return (char)v2;
}

- (id)queryEntriesWithPredicate:(id)a3 limit:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  -[_KSTextReplacementCoreDataStore queryManagedObjectsWithPredicate:limit:](self, "queryManagedObjectsWithPredicate:limit:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67___KSTextReplacementCoreDataStore_queryEntriesWithPredicate_limit___block_invoke;
  v13[3] = &unk_24E205838;
  v14 = v5;
  v8 = v6;
  v15 = v8;
  v9 = v5;
  objc_msgSend(v7, "performBlockAndWait:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

- (id)persistentStore
{
  void *v2;
  void *v3;
  void *v4;

  -[_KSTextReplacementCoreDataStore persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSManagedObjectModel)managedObjectModel
{
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectModel *v3;
  void *v5;
  void *v6;
  NSManagedObjectModel *v7;
  NSManagedObjectModel *v8;

  managedObjectModel = self->_managedObjectModel;
  if (managedObjectModel)
  {
    v3 = managedObjectModel;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", dataModelName, CFSTR("mom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (NSManagedObjectModel *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v6);
      v8 = self->_managedObjectModel;
      self->_managedObjectModel = v7;

    }
    v3 = self->_managedObjectModel;

  }
  return v3;
}

- (id)queryManagedObjectsWithPredicate:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  id v14[2];
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74___KSTextReplacementCoreDataStore_queryManagedObjectsWithPredicate_limit___block_invoke;
  v11[3] = &unk_24E205860;
  objc_copyWeak(v14, &location);
  v8 = v6;
  v14[1] = (id)a4;
  v12 = v8;
  v13 = &v16;
  objc_msgSend(v7, "performWithOptions:andBlock:", 4, v11);

  v9 = (id)v17[5];
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  NSObject *queuePSC;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queuePSC);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  queuePSC = self->_queuePSC;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61___KSTextReplacementCoreDataStore_persistentStoreCoordinator__block_invoke;
  v6[3] = &unk_24E205770;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queuePSC, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSPersistentStoreCoordinator *)v4;
}

+ (id)localCloudEntryFromMocObject:(id)a3
{
  id v3;
  _KSTextReplacementEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(_KSTextReplacementEntry);
  objc_msgSend(v3, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setPhrase:](v4, "setPhrase:", v5);

  objc_msgSend(v3, "shortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setShortcut:](v4, "setShortcut:", v6);

  -[_KSTextReplacementEntry phrase](v4, "phrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[_KSTextReplacementEntry setPhrase:](v4, "setPhrase:", &stru_24E206F98);
  -[_KSTextReplacementEntry shortcut](v4, "shortcut");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[_KSTextReplacementEntry phrase](v4, "phrase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSTextReplacementEntry setShortcut:](v4, "setShortcut:", v9);

  }
  objc_msgSend(v3, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setTimestamp:](v4, "setTimestamp:", v10);

  objc_msgSend(v3, "remoteRecordInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setCloudData:](v4, "setCloudData:", v11);

  -[_KSTextReplacementEntry setNeedsSaveToCloud:](v4, "setNeedsSaveToCloud:", objc_msgSend(v3, "needsSaveToCloud"));
  -[_KSTextReplacementEntry setWasDeleted:](v4, "setWasDeleted:", objc_msgSend(v3, "wasDeleted"));
  objc_msgSend(v3, "uniqueName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(v3, "uniqueName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSTextReplacementEntry setCloudID:](v4, "setCloudID:", v14);

  }
  return v4;
}

- (id)syncStateEntryShouldSave:(BOOL)a3 fetchToken:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  id v14;
  BOOL v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  objc_initWeak(&location, self);
  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71___KSTextReplacementCoreDataStore_syncStateEntryShouldSave_fetchToken___block_invoke;
  v11[3] = &unk_24E205888;
  objc_copyWeak(&v14, &location);
  v13 = &v17;
  v15 = a3;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "performBlockAndWait:", v11);

  v9 = (id)v18[5];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (_KSTextReplacementCoreDataStore)initWithDirectoryPath:(id)a3
{
  id v5;
  _KSTextReplacementCoreDataStore *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queueMOC;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queuePSC;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_KSTextReplacementCoreDataStore;
  v6 = -[_KSTextReplacementCoreDataStore init](&v15, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.keyboardServices.cdStore.queueMOC", v7);
    queueMOC = v6->_queueMOC;
    v6->_queueMOC = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.keyboardServices.cdStore.queuePSC", v10);
    queuePSC = v6->_queuePSC;
    v6->_queuePSC = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_directoryPath, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_cleanup, CFSTR("_KSTRShouldCleanupResources"), 0);

  }
  return v6;
}

- (NSManagedObjectContext)managedObjectContext
{
  NSObject *queueMOC;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queueMOC);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  queueMOC = self->_queueMOC;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55___KSTextReplacementCoreDataStore_managedObjectContext__block_invoke;
  v6[3] = &unk_24E205770;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queueMOC, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSManagedObjectContext *)v4;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (_KSTextReplacementCoreDataStore)init
{
  void *v3;
  _KSTextReplacementCoreDataStore *v4;

  +[_KSUtilities unitTestDirectoryPath](_KSUtilities, "unitTestDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_KSTextReplacementCoreDataStore initWithDirectoryPath:](self, "initWithDirectoryPath:", v3);

  return v4;
}

- (void)cleanup
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42___KSTextReplacementCoreDataStore_cleanup__block_invoke;
  v6[3] = &unk_24E204790;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v6);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_KSTextReplacementCoreDataStore;
  -[_KSTextReplacementCoreDataStore dealloc](&v4, sel_dealloc);
}

- (BOOL)recordTextReplacementEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x2207A8B6C]();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_KSTextReplacementCoreDataStore fetchAndMergeTextReplacementEntry:context:](self, "fetchAndMergeTextReplacementEntry:context:", v10, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  -[_KSTextReplacementCoreDataStore persistentStore](self, "persistentStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__2;
    v19[4] = __Block_byref_object_dispose__2;
    v20 = 0;
    -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __64___KSTextReplacementCoreDataStore_recordTextReplacementEntries___block_invoke;
    v16[3] = &unk_24E205770;
    v14 = v13;
    v17 = v14;
    v18 = v19;
    objc_msgSend(v14, "performBlockAndWait:", v16);

    _Block_object_dispose(v19, 8);
  }
  objc_autoreleasePoolPop(v5);

  return v12 != 0;
}

- (void)fetchAndMergeTextReplacementEntry:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__2;
  v13[4] = __Block_byref_object_dispose__2;
  v14 = 0;
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __77___KSTextReplacementCoreDataStore_fetchAndMergeTextReplacementEntry_context___block_invoke;
    v8[3] = &unk_24E205798;
    objc_copyWeak(&v12, &location);
    v9 = v6;
    v10 = v7;
    v11 = v13;
    objc_msgSend(v10, "performWithOptions:andBlock:", 4, v8);

    objc_destroyWeak(&v12);
  }
  _Block_object_dispose(v13, 8);

  objc_destroyWeak(&location);
}

- (id)fetchTextReplacementEntry:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v5, "shortcut");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "phrase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("shortcut == %@ AND phrase == %@ "), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_KSTextReplacementCoreDataStore queryManagedObjectsWithPredicate:limit:](self, "queryManagedObjectsWithPredicate:limit:", v10, 0x7FFFFFFFLL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    KSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_KSTextReplacementCoreDataStore fetchTextReplacementEntry:context:].cold.1(v12);

    v11 = 0;
  }

  return v11;
}

- (id)fetchTextReplacementWithUniqueName:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("uniqueName == %@"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementCoreDataStore queryManagedObjectsWithPredicate:limit:](self, "queryManagedObjectsWithPredicate:limit:", v5, 0x7FFFFFFFLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)markDeletesForTextReplacementEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x2207A8B6C]();
  -[_KSTextReplacementCoreDataStore persistentStore](self, "persistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v4, "count");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWasDeleted:", 1);
        objc_msgSend(v10, "timestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTimestamp:", v12);

        }
      }
    }
    -[_KSTextReplacementCoreDataStore recordTextReplacementEntries:](self, "recordTextReplacementEntries:", v4);
  }
  objc_autoreleasePoolPop(v5);

  return v6 != 0;
}

- (BOOL)deleteTextReplacementsFromLocalStoreWithNames:(id)a3 excludeSavesToCloud:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *context;
  id v14;
  void *v15;
  id obj;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id location;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  context = (void *)MEMORY[0x2207A8B6C]();
  -[_KSTextReplacementCoreDataStore persistentStore](self, "persistentStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_initWeak(&location, self);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v14;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke;
          v19[3] = &unk_24E2052B8;
          objc_copyWeak(&v20, &location);
          v21 = a4;
          v19[4] = v9;
          objc_msgSend(v10, "performWithOptions:andBlock:", 4, v19);

          objc_destroyWeak(&v20);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke_55;
    v17[3] = &unk_24E2057C0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v11, "performBlockAndWait:", v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(context);
  }
  else
  {
    objc_autoreleasePoolPop(context);
  }

  return v15 != 0;
}

- (BOOL)deleteTextReplacementsWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  __CFString *v10;
  id v11;
  id v12[2];
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x2207A8B6C]();
  -[_KSTextReplacementCoreDataStore persistentStore](self, "persistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, self);
    -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __71___KSTextReplacementCoreDataStore_deleteTextReplacementsWithPredicate___block_invoke;
    v9[3] = &unk_24E2057E8;
    v10 = CFSTR("TextReplacementEntry");
    objc_copyWeak(v12, &location);
    v12[1] = 0;
    v11 = v4;
    objc_msgSend(v7, "performWithOptions:andBlock:", 4, v9);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
  objc_autoreleasePoolPop(v5);

  return v6 != 0;
}

- (id)textReplacementEntriesWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13[2];
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67___KSTextReplacementCoreDataStore_textReplacementEntriesWithLimit___block_invoke;
  v11[3] = &unk_24E2057E8;
  v11[4] = self;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "performWithOptions:andBlock:", 4, v11);

  v8 = v12;
  v9 = v7;

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v9;
}

- (unint64_t)countEntriesWithPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61___KSTextReplacementCoreDataStore_countEntriesWithPredicate___block_invoke;
  v9[3] = &unk_24E205810;
  objc_copyWeak(&v12, &location);
  v6 = v4;
  v10 = v6;
  v11 = &v13;
  objc_msgSend(v5, "performWithOptions:andBlock:", 4, v9);

  v7 = v14[3];
  objc_destroyWeak(&v12);
  _Block_object_dispose(&v13, 8);
  objc_destroyWeak(&location);

  return v7;
}

- (void)saveCKFetchToken:(id)a3
{
  id v3;

  v3 = -[_KSTextReplacementCoreDataStore syncStateEntryShouldSave:fetchToken:](self, "syncStateEntryShouldSave:fetchToken:", 1, a3);
}

- (id)getCKFetchToken
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[_KSTextReplacementCoreDataStore managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50___KSTextReplacementCoreDataStore_getCKFetchToken__block_invoke;
  v6[3] = &unk_24E205770;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setDirectoryPath:(id)a3
{
  objc_storeStrong((id *)&self->_directoryPath, a3);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (void)setManagedObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectModel, a3);
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_queuePSC, 0);
  objc_storeStrong((id *)&self->_queueMOC, 0);
}

- (void)fetchTextReplacementEntry:(os_log_t)log context:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[_KSTextReplacementCoreDataStore fetchTextReplacementEntry:context:]";
  _os_log_error_impl(&dword_21DFEB000, log, OS_LOG_TYPE_ERROR, "%s  >>> entry is nil, returning", (uint8_t *)&v1, 0xCu);
}

@end
