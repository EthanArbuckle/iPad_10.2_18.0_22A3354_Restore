@implementation _KSTextReplacementCKStore

- (void)queryCloudIfFirstPullOrAccountChanged:(BOOL)a3
{
  NSObject *dataQueue;
  _QWORD v6[5];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  dataQueue = self->_dataQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke;
  v6[3] = &unk_24E2052B8;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v6[4] = self;
  dispatch_async(dataQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)queryTextReplacementsWithCallback:(id)a3
{
  id v4;
  NSObject *dataQueue;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__0;
  v10[4] = __Block_byref_object_dispose__0;
  v11 = 0;
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63___KSTextReplacementCKStore_queryTextReplacementsWithCallback___block_invoke;
  block[3] = &unk_24E205398;
  v8 = v4;
  v9 = v10;
  block[4] = self;
  v6 = v4;
  dispatch_async(dataQueue, block);

  _Block_object_dispose(v10, 8);
}

- (_KSTextReplacementCoreDataStore)coreDataStore
{
  return self->_coreDataStore;
}

- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  char v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *dataQueue;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD v17[2];
  _QWORD block[5];
  _QWORD v19[3];
  _QWORD v20[5];
  _QWORD v21[2];
  uint8_t v22[4];
  const char *v23;
  __int128 buf;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  -[_KSTextReplacementCKStore cloudKitManager](self, "cloudKitManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAccountAvailable");

  if ((v8 & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v25 = 0x2020000000;
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_KSTextReplacementCKStore decayedSyncCountForTime:](self, "decayedSyncCountForTime:", v9);

    v26 = v10;
    if (a3)
    {
      v11 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
      if (v11 >= -[_KSTextReplacementCKStore getSyncCountThrottleThreshold](self, "getSyncCountThrottleThreshold"))
      {
        KSCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v22 = 136315138;
          v23 = "-[_KSTextReplacementCKStore requestSync:withCompletionBlock:]";
          _os_log_impl(&dword_21DFEB000, v15, OS_LOG_TYPE_INFO, "%s  Skipping syncing, reached threshold", v22, 0xCu);
        }

        if (v6)
          v6[2](v6, 0);
        goto LABEL_17;
      }
      if (a3 == 2)
      {
        dataQueue = self->_dataQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_2;
        block[3] = &unk_24E205450;
        v19[2] = 2;
        block[4] = self;
        v19[1] = &buf;
        v13 = (id *)v19;
        v19[0] = v6;
        dispatch_async(dataQueue, block);
      }
      else
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_69;
        v16[3] = &unk_24E205428;
        v16[4] = self;
        v17[1] = &buf;
        v17[0] = v6;
        -[_KSTextReplacementCKStore _requestSync:completionBlock:](self, "_requestSync:completionBlock:", a3, v16);
        v13 = (id *)v17;
      }
    }
    else
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke;
      v20[3] = &unk_24E205428;
      v20[4] = self;
      v21[1] = &buf;
      v21[0] = v6;
      -[_KSTextReplacementCKStore _requestSync:completionBlock:](self, "_requestSync:completionBlock:", 0, v20);
      v13 = (id *)v21;
    }

LABEL_17:
    _Block_object_dispose(&buf, 8);
    goto LABEL_18;
  }
  KSCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[_KSTextReplacementCKStore requestSync:withCompletionBlock:]";
    _os_log_impl(&dword_21DFEB000, v14, OS_LOG_TYPE_INFO, "%s  User is not logged in, not syncing", (uint8_t *)&buf, 0xCu);
  }

  if (v6)
    v6[2](v6, 0);
LABEL_18:

}

- (void)accountDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *dataQueue;
  _QWORD block[6];
  char v12;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("KSCloudKitAccountDidChangeStatusKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("KSCloudKitAccountDidChangeUserChangedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "BOOLValue");

  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46___KSTextReplacementCKStore_accountDidChange___block_invoke;
  block[3] = &unk_24E2052E0;
  v12 = (char)v6;
  block[4] = self;
  block[5] = v7;
  dispatch_async(dataQueue, block);
}

- (_KSTextReplacementCKStore)initWithDirectoryPath:(id)a3
{
  id v4;
  _KSTextReplacementCKStore *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *syncQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *dataQueue;
  _KSTextReplacementCoreDataStore *v13;
  _KSTextReplacementCoreDataStore *coreDataStore;
  _KSCloudKitManager *v15;
  _KSCloudKitManager *cloudKitManager;
  void *v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_KSTextReplacementCKStore;
  v5 = -[_KSTextReplacementCKStore init](&v19, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("com.apple.keyboardServices.ckStore.syncWork", v7);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.keyboardServices.ckStore.dataQueue", v10);
    dataQueue = v5->_dataQueue;
    v5->_dataQueue = (OS_dispatch_queue *)v11;

    v13 = -[_KSTextReplacementCoreDataStore initWithDirectoryPath:]([_KSTextReplacementCoreDataStore alloc], "initWithDirectoryPath:", v4);
    coreDataStore = v5->_coreDataStore;
    v5->_coreDataStore = v13;

    -[_KSTextReplacementCKStore importSampleShortcutsIfNecessary](v5, "importSampleShortcutsIfNecessary");
    v15 = -[_KSCloudKitManager initWithRecordZoneName:]([_KSCloudKitManager alloc], "initWithRecordZoneName:", CFSTR("TextReplacements"));
    cloudKitManager = v5->_cloudKitManager;
    v5->_cloudKitManager = v15;

    -[_KSCloudKitManager setDelegate:](v5->_cloudKitManager, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_accountDidChange_, CFSTR("KSCloudKitAccountDidChange"), v5->_cloudKitManager);

    -[_KSTextReplacementCKStore queryCloudIfFirstPullOrAccountChanged:](v5, "queryCloudIfFirstPullOrAccountChanged:", 0);
  }

  return v5;
}

- (void)importSampleShortcutsIfNecessary
{
  NSObject *dataQueue;
  _QWORD block[5];

  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___KSTextReplacementCKStore_importSampleShortcutsIfNecessary__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(dataQueue, block);
}

- (_KSCloudKitManager)cloudKitManager
{
  return self->_cloudKitManager;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_KSTextReplacementCKStore;
  -[_KSTextReplacementCKStore dealloc](&v4, sel_dealloc);
}

- (void)pushAllLocalData
{
  id v3;

  -[_KSTextReplacementCKStore textReplacementEntries](self, "textReplacementEntries");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementCKStore addEntries:removeEntries:withCompletionHandler:](self, "addEntries:removeEntries:withCompletionHandler:", v3, MEMORY[0x24BDBD1A8], &__block_literal_global_51);

}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *dataQueue;
  id v19;
  id v20;
  id v21;
  void *context;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  context = (void *)MEMORY[0x2207A8B6C]();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "setNeedsSaveToCloud:", 1);
        objc_msgSend(v15, "timestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setTimestamp:", v17);

        }
      }
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76___KSTextReplacementCKStore_addEntries_removeEntries_withCompletionHandler___block_invoke;
  block[3] = &unk_24E205348;
  block[4] = self;
  v19 = v9;
  v24 = v19;
  v20 = v8;
  v25 = v20;
  v21 = v10;
  v26 = v21;
  dispatch_async(dataQueue, block);

  objc_autoreleasePoolPop(context);
}

- (void)removeAllEntries
{
  NSObject *dataQueue;
  _QWORD block[5];

  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45___KSTextReplacementCKStore_removeAllEntries__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(dataQueue, block);
}

- (void)removeAllEntriesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dataQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dataQueue = self->_dataQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67___KSTextReplacementCKStore_removeAllEntriesWithCompletionHandler___block_invoke;
  v7[3] = &unk_24E204BB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dataQueue, v7);

}

- (id)textReplacementEntries
{
  void *v3;
  NSObject *dataQueue;
  id v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_dataQueue);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("wasDeleted == %@ || wasDeleted == nil"), MEMORY[0x24BDBD1C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = (id)MEMORY[0x24BDBD1A8];
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51___KSTextReplacementCKStore_textReplacementEntries__block_invoke;
  block[3] = &unk_24E205370;
  v9 = v3;
  v10 = &v11;
  block[4] = self;
  v5 = v3;
  dispatch_sync(dataQueue, block);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *dataQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _KSTextReplacementCKStore *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__0;
  v19[4] = __Block_byref_object_dispose__0;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("wasDeleted == %@ || wasDeleted == nil"), MEMORY[0x24BDBD1C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73___KSTextReplacementCKStore_queryTextReplacementsWithPredicate_callback___block_invoke;
  block[3] = &unk_24E2053C0;
  v14 = v6;
  v15 = v8;
  v17 = v7;
  v18 = v19;
  v16 = self;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(dataQueue, block);

  _Block_object_dispose(v19, 8);
}

+ (BOOL)isMigrationCompleted
{
  return 0;
}

- (void)pushMigrationStatusToCloud:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x24BDAC8D0];
  -[_KSTextReplacementCKStore cloudKitManager](self, "cloudKitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("didMigrate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordWithName:type:attributes:", CFSTR("migrationStatus"), CFSTR("TextReplacementMigration"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_KSTextReplacementCKStore cloudKitManager](self, "cloudKitManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateRecords:deleteRecordIDs:withPriority:completionHandler:", v10, 0, 1, &__block_literal_global_66);

  }
}

- (void)queryMigrationStatusOnCloudWithCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void (**v8)(id, _BOOL8);

  v8 = (void (**)(id, _BOOL8))a3;
  v4 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSuiteName:", v5);

  v7 = (objc_msgSend(v6, "BOOLForKey:", CFSTR("KSDidMigrateToCloudKitOnCloud")) & 1) != 0
    || -[_KSTextReplacementCKStore ckMigrationStatusOnCloud](self, "ckMigrationStatusOnCloud");
  v8[2](v8, v7);

}

- (BOOL)isAccountAvailable
{
  void *v2;
  char v3;

  -[_KSTextReplacementCKStore cloudKitManager](self, "cloudKitManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccountAvailable");

  return v3;
}

- (unint64_t)getSyncCount
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSuiteName:", v3);

  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("kTRCKSyncCount"));
  v6 = v5 & ~(v5 >> 63);

  return v6;
}

- (unint64_t)getSyncCountThresholdHalfLifeHours
{
  id v2;
  void *v3;
  void *v4;
  float v5;
  BOOL v6;
  unint64_t v7;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSuiteName:", v3);

  objc_msgSend(v4, "floatForKey:", CFSTR("TRCKSyncCountHalflifeInHours"));
  v6 = v5 != 0.0 && v5 <= 46.0;
  if (!v6 || v5 < 0.1)
    v5 = 10.0;
  v7 = (unint64_t)v5;

  return v7;
}

- (unint64_t)getSyncCountThrottleThreshold
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSuiteName:", v3);

  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("TRCKSyncMaxCountThreshold"));
  if ((unint64_t)(v5 - 1001) >= 0xFFFFFFFFFFFFFC1BLL)
    v6 = v5;
  else
    v6 = 100;

  return v6;
}

- (unint64_t)decayedSyncCountForTime:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  unint64_t v13;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSuiteName:", v6);

  objc_msgSend(v7, "objectForKey:", CFSTR("kTRCKLastSyncTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_KSTextReplacementCKStore getSyncCount](self, "getSyncCount");
  v10 = -[_KSTextReplacementCKStore getSyncCountThresholdHalfLifeHours](self, "getSyncCountThresholdHalfLifeHours");
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:", v4);
    v12 = fabs(v11);
  }
  else
  {
    v12 = 0.0;
  }
  v13 = (unint64_t)(exp2(v12 / (float)((float)v10 * -3600.0)) * (double)v9);

  return v13;
}

- (void)_updateSyncCount:(unint64_t)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v6, "initWithSuiteName:", v7);

  v8 = 1;
  if (!v4)
    v8 = 2;
  v9 = v8 + a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("kTRCKLastSyncTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("kTRCKSyncCount"));

}

- (void)_requestSync:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  NSObject *syncQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke;
  block[3] = &unk_24E204C30;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(syncQueue, block);

}

- (void)requestSyncWithCompletionBlock:(id)a3
{
  -[_KSTextReplacementCKStore _requestSync:completionBlock:](self, "_requestSync:completionBlock:", 5, a3);
}

- (void)pushLocalChangesWithPriority:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *syncQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke;
  block[3] = &unk_24E204C30;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(syncQueue, block);

}

- (void)pullRemoteDataWithPriority:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dataQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke;
  block[3] = &unk_24E204C30;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(dataQueue, block);

}

- (void)recordSyncStatus
{
  NSObject *dataQueue;
  _QWORD block[5];

  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45___KSTextReplacementCKStore_recordSyncStatus__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(dataQueue, block);
}

- (unint64_t)countLocalEntriesToBeSynced
{
  void *v3;
  void *v4;
  unint64_t v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataQueue);
  -[_KSTextReplacementCKStore coreDataStore](self, "coreDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("needsSaveToCloud == TRUE OR wasDeleted == TRUE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "countEntriesWithPredicate:", v4);

  return v5;
}

- (id)queryUpdatedLocalEntries
{
  NSObject *dataQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  dataQueue = self->_dataQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53___KSTextReplacementCKStore_queryUpdatedLocalEntries__block_invoke;
  v6[3] = &unk_24E2055B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dataQueue, v6);
  -[_KSTextReplacementCKStore cloudEntriesFromLocalEntries:](self, "cloudEntriesFromLocalEntries:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)queryDeletedEntries
{
  NSObject *dataQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  dataQueue = self->_dataQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48___KSTextReplacementCKStore_queryDeletedEntries__block_invoke;
  v6[3] = &unk_24E2055B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dataQueue, v6);
  -[_KSTextReplacementCKStore cloudRecordIDsForLocalEntries:](self, "cloudRecordIDsForLocalEntries:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)cloudEntriesFromLocalEntries:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  id obj;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v24;
    *(_QWORD *)&v5 = 136315394;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "cloudData", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[_KSTextReplacementCKStore cloudKitManager](self, "cloudKitManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cloudID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "cloudData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "unEncryptedFields");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "encryptedFields");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "recordWithName:type:cloudData:attributes:encryptedFields:", v12, CFSTR("TextReplacementEntry"), v13, v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v9, "unEncryptedFields");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "encryptedFields");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "recordWithName:type:attributes:encryptedFields:", v12, CFSTR("TextReplacementEntry"), v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v16)
        {
          objc_msgSend(v21, "addObject:", v16);
        }
        else
        {
          KSCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v28 = "-[_KSTextReplacementCKStore cloudEntriesFromLocalEntries:]";
            v29 = 2112;
            v30 = v9;
            _os_log_error_impl(&dword_21DFEB000, v17, OS_LOG_TYPE_ERROR, "%s  >>> no CKRecord for TextreplacementEntry: %@", buf, 0x16u);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v6);
  }

  return v21;
}

- (id)cloudRecordIDsForLocalEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v21;
    *(_QWORD *)&v8 = 136315650;
    v19 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        -[_KSTextReplacementCKStore cloudKitManager](self, "cloudKitManager", v19, (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cloudID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "recordIDForName:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v5, "addObject:", v15);
        }
        else
        {
          KSCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "cloudID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = "-[_KSTextReplacementCKStore cloudRecordIDsForLocalEntries:]";
            v26 = 2112;
            v27 = v12;
            v28 = 2112;
            v29 = v17;
            _os_log_error_impl(&dword_21DFEB000, v16, OS_LOG_TYPE_ERROR, "%s  >>> ERROR couldn't create recordID for entry: %@, cloudID: %@", buf, 0x20u);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)localEntriesFromCloudEntries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  _KSTextReplacementCKStore *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __int128 v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v27;
    *(_QWORD *)&v7 = 136315394;
    v24 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "recordType", v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("TextReplacementEntry"));

        if (v12)
        {
          +[_KSTextReplacementEntry localEntryFromCloudEntry:](_KSTextReplacementEntry, "localEntryFromCloudEntry:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);
        }
        else
        {
          objc_msgSend(v10, "recordType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("TextReplacementMigration"));

          if (!v15)
            continue;
          objc_msgSend(v10, "objectForKey:", CFSTR("didMigrate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "BOOLValue");
          v17 = self;
          objc_sync_enter(v17);
          -[_KSTextReplacementCKStore setCkMigrationStatusOnCloud:](v17, "setCkMigrationStatusOnCloud:", v16);
          objc_sync_exit(v17);

          v18 = objc_alloc(MEMORY[0x24BDBCF50]);
          +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithSuiteName:", v19);

          objc_msgSend(v20, "setBool:forKey:", v16, CFSTR("KSDidMigrateToCloudKitOnCloud"));
          KSCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v31 = "-[_KSTextReplacementCKStore localEntriesFromCloudEntries:]";
            v32 = 2112;
            v33 = v22;
            _os_log_impl(&dword_21DFEB000, v21, OS_LOG_TYPE_INFO, "%s  cloud migration status: %@", buf, 0x16u);

          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)userDidDeleteRecordZone:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("TextReplacements")))
    -[_KSTextReplacementCKStore removeAllEntries](self, "removeAllEntries");
}

- (void)setCloudKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitManager, a3);
}

- (void)setCoreDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_coreDataStore, a3);
}

- (BOOL)ckMigrationStatusOnCloud
{
  return self->_ckMigrationStatusOnCloud;
}

- (void)setCkMigrationStatusOnCloud:(BOOL)a3
{
  self->_ckMigrationStatusOnCloud = a3;
}

- (unint64_t)numPullRequests
{
  return self->_numPullRequests;
}

- (void)setNumPullRequests:(unint64_t)a3
{
  self->_numPullRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataStore, 0);
  objc_storeStrong((id *)&self->_cloudKitManager, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end
