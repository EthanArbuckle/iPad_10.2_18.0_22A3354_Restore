@implementation CHCustomCategories

- (CHCustomCategories)init
{
  CHCustomCategories *v2;
  CHCoreDataController *v3;
  CHCoreDataController *coreDataController;
  uint64_t v5;
  NSPersistentContainer *persistentContainer;
  uint64_t v7;
  NSDictionary *intToUUIDMapping;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHCustomCategories;
  v2 = -[CHCustomCategories init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CHCoreDataController);
    coreDataController = v2->_coreDataController;
    v2->_coreDataController = v3;

    -[CHCoreDataController persistentContainer](v2->_coreDataController, "persistentContainer");
    v5 = objc_claimAutoreleasedReturnValue();
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = (NSPersistentContainer *)v5;

    -[CHCustomCategories loadMappingFromFile](v2, "loadMappingFromFile");
    v7 = objc_claimAutoreleasedReturnValue();
    intToUUIDMapping = v2->_intToUUIDMapping;
    v2->_intToUUIDMapping = (NSDictionary *)v7;

    -[CHCustomCategories resetTimer](v2, "resetTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)lockTimer;
    lockTimer = v9;

  }
  return v2;
}

- (id)customCategoryVersion
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  id v10;

  -[CHCustomCategories lockAssetAndReturnAssetPathForFile:withLockReason:](self, "lockAssetAndReturnAssetPathForFile:withLockReason:", CFSTR("version.txt"), CFSTR("Locking to load version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Custom category mapping path is %@"), v3);
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v3, 4, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  -[CHCustomCategories resetTimer](self, "resetTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)lockTimer;
  lockTimer = v6;

  if (v5)
  {
    NSLog(CFSTR("Error while reading version file %@"), v5);
    v8 = CFSTR("1.0.0");
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (void)categoriesForBundleId:(id)a3 completion:(id)a4
{
  void (**v6)(id, id, NSError *);
  id v7;

  v6 = (void (**)(id, id, NSError *))a4;
  -[CHCustomCategories categoryForBundleId:](self, "categoryForBundleId:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, self->_fetchError);

}

- (void)categoriesForBundleIdSet:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, NSError *);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, NSError *))a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[CHCustomCategories categoryForBundleId:](self, "categoryForBundleId:", v14, (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v7[2](v7, v8, self->_fetchError);
}

- (id)categoryForBundleId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CHCustomCategories fetchCategoriesForBundleId:](self, "fetchCategoriesForBundleId:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHCustomCategories extractDataFromCoreDataResult:](self, "extractDataFromCoreDataResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = &unk_250A00528;
  v7 = v6;

  return v7;
}

- (id)fetchCategoriesForBundleId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSError *v12;
  NSError *fetchError;
  NSError *v14;
  uint64_t v15;
  void *v16;
  id v18;

  v4 = a3;
  -[CHCustomCategories lockAssetWithLockReason:](self, "lockAssetWithLockReason:", CFSTR("Locking to fetch from CoreData"));
  v5 = objc_alloc_init(MEMORY[0x24BDBB678]);
  v6 = (void *)MEMORY[0x24BDBB658];
  -[NSPersistentContainer viewContext](self->_persistentContainer, "viewContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityForName:inManagedObjectContext:", CFSTR("CustomCategory"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntity:", v8);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bundleId == %@"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v9);
  -[NSPersistentContainer viewContext](self->_persistentContainer, "viewContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v5, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSError *)v18;

  fetchError = self->_fetchError;
  self->_fetchError = v12;
  v14 = v12;

  -[CHCustomCategories resetTimer](self, "resetTimer");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)lockTimer;
  lockTimer = v15;

  return v11;
}

- (id)extractDataFromCoreDataResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSDictionary *intToUUIDMapping;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        intToUUIDMapping = self->_intToUUIDMapping;
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "category", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](intToUUIDMapping, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)loadMappingFromFile
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHCustomCategories lockAssetAndReturnAssetPathForFile:withLockReason:](self, "lockAssetAndReturnAssetPathForFile:withLockReason:", CFSTR("uuid-int-mapping.csv"), CFSTR("Locking to load uuid to int mapping file"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Custom category mapping path is %@"), v4);
  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v4, 4, &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v23;
  v7 = v6;
  if (v6)
  {
    NSLog(CFSTR("Error while reading mapping csv %@"), v6);
  }
  else
  {
    v17 = v5;
    v18 = v4;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(","));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count") == 2)
          {
            objc_msgSend(v13, "objectAtIndex:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndex:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setValue:forKey:", v14, v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    v5 = v17;
    v4 = v18;
  }

  return v3;
}

- (id)lockAssetAndReturnAssetPathForFile:(id)a3 withLockReason:(id)a4
{
  id v5;
  id v6;
  CHMobileAssetBridge *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(CHMobileAssetBridge);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v8 = dispatch_semaphore_create(0);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __72__CHCustomCategories_lockAssetAndReturnAssetPathForFile_withLockReason___block_invoke;
  v17 = &unk_2509FEC10;
  v19 = &v20;
  v9 = v8;
  v18 = v9;
  -[CHMobileAssetBridge autoAssetLockContentForAssetType:assetSpecifier:lockReason:completion:](v7, "autoAssetLockContentForAssetType:assetSpecifier:lockReason:completion:", CFSTR("com.apple.MobileAsset.CognitiveHealth"), CFSTR("SupplementalCategoryDatabase"), v6, &v14);
  v10 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v9, v10);
  v11 = (void *)v21[5];
  if (v11)
  {
    objc_msgSend(v11, "stringByAppendingPathComponent:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Asset path for reason %@ is %@"), v6, v12, v14, v15, v16, v17);
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (void)lockAssetWithLockReason:(id)a3
{
  id v3;

  v3 = -[CHCustomCategories lockAssetAndReturnAssetPathForFile:withLockReason:](self, "lockAssetAndReturnAssetPathForFile:withLockReason:", &stru_2509FF310, a3);
}

- (id)resetTimer
{
  CHMobileAssetBridge *v2;
  void *v3;
  CHMobileAssetBridge *v4;
  void *v5;
  _QWORD v7[4];
  CHMobileAssetBridge *v8;

  v2 = objc_alloc_init(CHMobileAssetBridge);
  v3 = (void *)MEMORY[0x24BDBCF40];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__CHCustomCategories_resetTimer__block_invoke;
  v7[3] = &unk_2509FEB38;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_fetchError, a3);
}

- (CHCoreDataController)coreDataController
{
  return self->_coreDataController;
}

- (void)setCoreDataController:(id)a3
{
  objc_storeStrong((id *)&self->_coreDataController, a3);
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (NSDictionary)intToUUIDMapping
{
  return self->_intToUUIDMapping;
}

- (void)setIntToUUIDMapping:(id)a3
{
  objc_storeStrong((id *)&self->_intToUUIDMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intToUUIDMapping, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_coreDataController, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
}

void __32__CHCustomCategories_resetTimer__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "autoAssetEndAllLocksForAssetType:assetSpecifier:completion:", CFSTR("com.apple.MobileAsset.CognitiveHealth"), CFSTR("SupplementalCategoryDatabase"), &__block_literal_global_119);
  objc_msgSend((id)lockTimer, "invalidate");
  v1 = (void *)lockTimer;
  lockTimer = 0;

}

void __32__CHCustomCategories_resetTimer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Error ending all locks %@"), a2);
}

void __72__CHCustomCategories_lockAssetAndReturnAssetPathForFile_withLockReason___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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

+ (void)downloadDatabaseAssetIfNeeded
{
  +[CHCustomCategories downloadDatabaseAssetIfNeededWithCompletion:](CHCustomCategories, "downloadDatabaseAssetIfNeededWithCompletion:", &__block_literal_global_51);
}

+ (void)databaseAssetAvailableStatusWithCompletion:(id)a3
{
  id v3;
  CHMobileAssetBridge *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(CHMobileAssetBridge);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__CHCustomCategories_databaseAssetAvailableStatusWithCompletion___block_invoke;
  v6[3] = &unk_2509FEB80;
  v7 = v3;
  v5 = v3;
  -[CHMobileAssetBridge autoAssetAvailableForUseForAssetType:assetSpecifier:completion:](v4, "autoAssetAvailableForUseForAssetType:assetSpecifier:completion:", CFSTR("com.apple.MobileAsset.CognitiveHealth"), CFSTR("SupplementalCategoryDatabase"), v6);

}

+ (void)downloadDatabaseAssetIfNeededWithCompletion:(id)a3
{
  id v3;
  CHMobileAssetBridge *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(CHMobileAssetBridge);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__CHCustomCategories_downloadDatabaseAssetIfNeededWithCompletion___block_invoke;
  v6[3] = &unk_2509FEBA8;
  v7 = v3;
  v5 = v3;
  -[CHMobileAssetBridge autoAssetInterestInContentForAssetType:assetSpecifier:completion:](v4, "autoAssetInterestInContentForAssetType:assetSpecifier:completion:", CFSTR("com.apple.MobileAsset.CognitiveHealth"), CFSTR("SupplementalCategoryDatabase"), v6);

}

void __66__CHCustomCategories_downloadDatabaseAssetIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("Download error :%@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__CHCustomCategories_databaseAssetAvailableStatusWithCompletion___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;

  v5 = a3;
  NSLog(CFSTR("Status of auto asset: %d, with error: %@"), a2, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
