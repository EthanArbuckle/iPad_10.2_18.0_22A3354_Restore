@implementation CHCoreDataController

- (NSPersistentContainer)persistentContainer
{
  CHCoreDataController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSPersistentContainer *persistentContainer;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_persistentContainer)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("CustomCategoryModel"), CFSTR("momd"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v4);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB700]), "initWithName:managedObjectModel:", CFSTR("CSVToCoreData"), v5);
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = (NSPersistentContainer *)v6;

    -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v2->_persistentContainer, "loadPersistentStoresWithCompletionHandler:", &__block_literal_global_167);
  }
  -[CHCoreDataController addPersistentStoreFromDatabase](v2, "addPersistentStoreFromDatabase");
  objc_sync_exit(v2);

  return v2->_persistentContainer;
}

- (void)addPersistentStoreFromDatabase
{
  void *v2;
  CHMobileAssetBridge *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[NSPersistentContainer persistentStoreCoordinator](self->_persistentContainer, "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(CHMobileAssetBridge);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__153;
  v23 = __Block_byref_object_dispose__154;
  v24 = 0;
  v4 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__CHCoreDataController_addPersistentStoreFromDatabase__block_invoke;
  v16[3] = &unk_2509FEC10;
  v18 = &v19;
  v5 = v4;
  v17 = v5;
  -[CHMobileAssetBridge autoAssetLockContentForAssetType:assetSpecifier:lockReason:completion:](v3, "autoAssetLockContentForAssetType:assetSpecifier:lockReason:completion:", CFSTR("com.apple.MobileAsset.CognitiveHealth"), CFSTR("SupplementalCategoryDatabase"), CFSTR("Locking to load sqlite file into CoreData"), v16);
  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  if (v20[5])
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("CustomCategoryMapping.sqlite"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR("Custom cateogry sqlite URL is %@"), v8);
    objc_msgSend(v2, "persistentStoreForURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = v9 == 0;

    if ((_DWORD)v7)
    {
      v25 = *MEMORY[0x24BDBB550];
      v26[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BDBB580];
      v15 = 0;
      objc_msgSend(v2, "addPersistentStoreWithType:configuration:URL:options:error:", v11, 0, v8, v10, &v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;

      if (!v12)
      {
        objc_msgSend(v13, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Unresolved error %@, %@"), v13, v14);

      }
    }
    else
    {
      NSLog(CFSTR("Persistent store exists"));
    }

  }
  _Block_object_dispose(&v19, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

void __54__CHCoreDataController_addPersistentStoreFromDatabase__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a2;
  v8 = a4;
  NSLog(CFSTR("Asset directory %@ with %lu files: with error: %@"), v7, objc_msgSend(a3, "count"), v8);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v11 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __43__CHCoreDataController_persistentContainer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unresolved error %@, %@"), v5, v6);

    abort();
  }

}

@end
