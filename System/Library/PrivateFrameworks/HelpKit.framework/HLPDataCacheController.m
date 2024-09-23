@implementation HLPDataCacheController

+ (void)setAppGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&kHLPDataCacheAppGroupIdentifier, a3);
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_2);
  return (id)sharedInstance_gHLPDataCacheController;
}

void __40__HLPDataCacheController_sharedInstance__block_invoke()
{
  HLPDataCacheController *v0;
  void *v1;

  v0 = -[HLPDataCacheController initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:]([HLPDataCacheController alloc], "initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:", CFSTR("HLPDataCacheIdentifier"), CFSTR("com.apple.helpkit.Data"), 5242880, 0);
  v1 = (void *)sharedInstance_gHLPDataCacheController;
  sharedInstance_gHLPDataCacheController = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[HLPDataCacheController cancelAllOriginSessionItems](self, "cancelAllOriginSessionItems");
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateCacheDelay, 0);
  v3.receiver = self;
  v3.super_class = (Class)HLPDataCacheController;
  -[HLPDataCacheController dealloc](&v3, sel_dealloc);
}

- (void)commonInit
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *dataCacheSerialQueue;
  NSMutableArray *v5;
  NSMutableArray *dataCacheArray;
  NSMutableDictionary *v7;
  NSMutableDictionary *dataCacheMap;
  NSMutableArray *v9;
  NSMutableArray *originFetchItems;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.IPDataCacheControllerSerialQueue", 0);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  self->_dataCacheSerialQueue = v3;

  self->_defaultPriority = *(float *)MEMORY[0x24BDD1348];
  self->_cacheSize = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  dataCacheArray = self->_dataCacheArray;
  self->_dataCacheArray = v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  dataCacheMap = self->_dataCacheMap;
  self->_dataCacheMap = v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  originFetchItems = self->_originFetchItems;
  self->_originFetchItems = v9;

}

- (HLPDataCacheController)init
{
  HLPDataCacheController *v2;
  HLPDataCacheController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HLPDataCacheController;
  v2 = -[HLPDataCacheController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HLPDataCacheController commonInit](v2, "commonInit");
  return v3;
}

- (HLPDataCacheController)initWithIdentifier:(id)a3 directoryName:(id)a4 maxCacheSize:(unint64_t)a5 URLSessionDataType:(int64_t)a6
{
  id v11;
  id v12;
  HLPDataCacheController *v13;
  HLPDataCacheController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSUserDefaults *userDefaults;
  void *v24;
  uint64_t v25;
  NSUserDefaults *v26;
  uint64_t v27;
  NSString *cacheDirectory;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HLPDataCacheController;
  v13 = -[HLPDataCacheController init](&v30, sel_init);
  v14 = v13;
  if (v13)
  {
    -[HLPDataCacheController commonInit](v13, "commonInit");
    objc_storeStrong((id *)&v14->_identifier, a3);
    v14->_dataType = a6;
    v14->_maxDataCacheSize = a5;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v14->_cacheDirectory)
    {
      if (!kHLPDataCacheAppGroupIdentifier)
        goto LABEL_6;
      objc_msgSend(v15, "containerURLForSecurityApplicationGroupIdentifier:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_6;
      v18 = v17;
      objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("Library/Caches"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x24BDBCF50]);
      v22 = objc_msgSend(v21, "initWithSuiteName:", kHLPDataCacheAppGroupIdentifier);
      userDefaults = v14->_userDefaults;
      v14->_userDefaults = (NSUserDefaults *)v22;

      if (!v20)
      {
LABEL_6:
        NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v14->_userDefaults;
        v14->_userDefaults = (NSUserDefaults *)v25;

      }
      objc_msgSend(v20, "stringByAppendingPathComponent:", v12);
      v27 = objc_claimAutoreleasedReturnValue();
      cacheDirectory = v14->_cacheDirectory;
      v14->_cacheDirectory = (NSString *)v27;

    }
    -[HLPDataCacheController reloadDataCache](v14, "reloadDataCache");

  }
  return v14;
}

- (void)syncCacheImmediately
{
  -[HLPDataCacheController updateCacheDelay](self, "updateCacheDelay");
  -[HLPDataCacheController cancelAllOriginSessionItems](self, "cancelAllOriginSessionItems");
}

- (id)dataCacheForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataCacheForIdentifier:(id)a3
{
  id v4;
  NSObject *dataCacheSerialQueue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  objc_initWeak(&location, self);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__HLPDataCacheController_dataCacheForIdentifier___block_invoke;
  v9[3] = &unk_24D32ED30;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = &v14;
  v6 = v4;
  dispatch_sync(dataCacheSerialQueue, v9);
  v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __49__HLPDataCacheController_dataCacheForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dataCacheMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)createCacheDirectory
{
  void *v3;
  void *v4;
  id v5;
  id *v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  id v10;
  id obj;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:", self->_cacheDirectory) & 1) == 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_cacheDirectory);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x24BDD1570]);
    objc_initWeak(&location, self);
    v6 = (id *)(v14 + 5);
    obj = (id)v14[5];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__HLPDataCacheController_createCacheDirectory__block_invoke;
    v7[3] = &unk_24D32ED58;
    v8 = v3;
    v9 = &v13;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "coordinateWritingItemAtURL:options:error:byAccessor:", v4, 8, &obj, v7);
    objc_storeStrong(v6, obj);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
    _Block_object_dispose(&v13, 8);

  }
}

void __46__HLPDataCacheController_createCacheDirectory__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  id obj;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    HLPLogForCategory(2uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "cacheDirectory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_2153AA000, v6, OS_LOG_TYPE_DEFAULT, "Unable to create path %@", buf, 0xCu);

    }
  }
}

- (BOOL)cacheValidForIdentifier:(id)a3 path:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  -[HLPDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPDataCacheController cacheFileURLForDataCache:](self, "cacheFileURLForDataCache:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "fileExistsAtPath:", v9))
      v10 = objc_msgSend(v5, "expired") ^ 1;
    else
      LOBYTE(v10) = 0;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)cacheFileURLForDataCache:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPDataCacheController cacheFileURLForIdentifier:](self, "cacheFileURLForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cacheFileURLForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[NSString stringByAppendingPathComponent:](self->_cacheDirectory, "stringByAppendingPathComponent:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setLanguageCode:(id)a3
{
  id v5;
  NSObject *dataCacheSerialQueue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSString isEqualToString:](self->_languageCode, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_languageCode, a3);
    objc_initWeak(&location, self);
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    v24 = 0;
    dataCacheSerialQueue = self->_dataCacheSerialQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__HLPDataCacheController_setLanguageCode___block_invoke;
    block[3] = &unk_24D32ED80;
    block[4] = &v19;
    objc_copyWeak(&v18, &location);
    dispatch_sync(dataCacheSerialQueue, block);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (id)v20[5];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "languageCode", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v5);

          if ((v12 & 1) == 0)
          {

            -[HLPDataCacheController removeAllDataCache](self, "removeAllDataCache");
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
        if (v8)
          continue;
        break;
      }
    }

LABEL_12:
    objc_destroyWeak(&v18);
    _Block_object_dispose(&v19, 8);

    objc_destroyWeak(&location);
  }

}

void __42__HLPDataCacheController_setLanguageCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataCacheArray");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)reloadDataCache
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_1(&dword_2153AA000, a3, (uint64_t)a3, "Unable to unarchive %@, error: %@", (uint8_t *)&v4);
}

void __41__HLPDataCacheController_reloadDataCache__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataCacheArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "dataCacheMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

void __41__HLPDataCacheController_reloadDataCache__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "cacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __41__HLPDataCacheController_reloadDataCache__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dataCacheMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "dataCacheArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

}

void __41__HLPDataCacheController_reloadDataCache__block_invoke_25(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "path");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

}

- (void)updateCache
{
  _QWORD block[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HLPDataCacheController_updateCache__block_invoke;
  block[3] = &unk_24D32EAB8;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __37__HLPDataCacheController_updateCache__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDataCacheDirty:", 1);

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_updateCacheDelay, 0);
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "performSelector:withObject:afterDelay:", sel_updateCacheDelay, 0, 2.0);

}

- (void)updateCacheDelay
{
  NSObject *dataCacheSerialQueue;
  uint64_t v4;
  _QWORD v5[6];
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD v9[5];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__1;
  v9[4] = __Block_byref_object_dispose__1;
  v10 = 0;
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HLPDataCacheController_updateCacheDelay__block_invoke;
  block[3] = &unk_24D32ED80;
  block[4] = v9;
  objc_copyWeak(&v8, &location);
  dispatch_sync(dataCacheSerialQueue, block);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __42__HLPDataCacheController_updateCacheDelay__block_invoke_2;
  v5[3] = &unk_24D32EE48;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v5[5] = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  _Block_object_dispose(v9, 8);

  objc_destroyWeak(&location);
}

void __42__HLPDataCacheController_updateCacheDelay__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataCacheArray");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__HLPDataCacheController_updateCacheDelay__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "dataCacheDirty");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_updateCacheDelay, 0);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v7)
    {
      HLPLogForCategory(2uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __42__HLPDataCacheController_updateCacheDelay__block_invoke_2_cold_1(v2, (uint64_t)v7, v8);
    }
    else
    {
      v9 = objc_loadWeakRetained(v2);
      objc_msgSend(v9, "userDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained(v2);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v6, v12);

      v8 = objc_loadWeakRetained(v2);
      -[NSObject userDefaults](v8, "userDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "synchronize");

    }
    v14 = objc_loadWeakRetained(v2);
    objc_msgSend(v14, "setDataCacheDirty:", 0);

  }
}

- (void)addDataCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *dataCacheSerialQueue;
  id v8;
  uint64_t v9;
  unint64_t maxDataCacheSize;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  id *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    dataCacheSerialQueue = self->_dataCacheSerialQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__HLPDataCacheController_addDataCache___block_invoke;
    block[3] = &unk_24D32EDF8;
    objc_copyWeak(&v30, location);
    v28 = v5;
    v8 = v4;
    v29 = v8;
    dispatch_sync(dataCacheSerialQueue, block);
    v9 = objc_msgSend(v8, "fileSize");
    maxDataCacheSize = self->_maxDataCacheSize;
    v11 = self->_cacheSize + v9;
    self->_cacheSize = v11;
    if (v11 > maxDataCacheSize && objc_msgSend(v8, "fileSize") < self->_maxDataCacheSize)
    {
      v18 = &v30;
      v12 = 0;
      do
      {
        v21 = 0;
        v22 = &v21;
        v23 = 0x3032000000;
        v24 = __Block_byref_object_copy__1;
        v25 = __Block_byref_object_dispose__1;
        v26 = 0;
        v13 = self->_dataCacheSerialQueue;
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __39__HLPDataCacheController_addDataCache___block_invoke_2;
        v19[3] = &unk_24D32ED80;
        v19[4] = &v21;
        objc_copyWeak(&v20, location);
        dispatch_sync(v13, v19);
        -[HLPDataCacheController removeDataCache:updateCache:](self, "removeDataCache:updateCache:", v22[5], 0);
        v14 = (id)v22[5];

        objc_destroyWeak(&v20);
        _Block_object_dispose(&v21, 8);

        v15 = -[HLPDataCacheController cacheSize](self, "cacheSize");
        if (v15 <= -[HLPDataCacheController maxDataCacheSize](self, "maxDataCacheSize"))
          break;
        -[HLPDataCacheController dataCacheArray](self, "dataCacheArray");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17 < 2)
          break;
        v12 = v14;
      }
      while (v14 != v8);

    }
    objc_destroyWeak(&v30);
  }
  -[HLPDataCacheController updateCache](self, "updateCache", v18);

  objc_destroyWeak(location);
}

void __39__HLPDataCacheController_addDataCache___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dataCacheMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "dataCacheArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

}

void __39__HLPDataCacheController_addDataCache___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataCacheArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)cancelAllOriginSessionItems
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *dataCacheSerialQueue;
  _QWORD v12[4];
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSMutableArray copy](self->_originFetchItems, "copy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cancelSessionItem:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_initWeak(&location, self);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__HLPDataCacheController_cancelAllOriginSessionItems__block_invoke;
  v12[3] = &unk_24D32EDA8;
  objc_copyWeak(&v13, &location);
  dispatch_sync(dataCacheSerialQueue, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __53__HLPDataCacheController_cancelAllOriginSessionItems__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "originFetchItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)removeAllDataCache
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *dataCacheSerialQueue;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  id v22;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", self->_cacheDirectory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDD1570]);
  objc_msgSend(v4, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = 0;
    do
    {
      -[NSString stringByAppendingPathComponent:](self->_cacheDirectory, "stringByAppendingPathComponent:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v8;
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __44__HLPDataCacheController_removeAllDataCache__block_invoke;
        v20[3] = &unk_24D32EE20;
        v21 = v3;
        objc_msgSend(v5, "coordinateWritingItemAtURL:options:error:byAccessor:", v10, 1, &v22, v20);
        v11 = v22;

        v8 = v11;
      }

      objc_msgSend(v4, "nextObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
    while (v12);
  }
  else
  {
    v8 = 0;
  }
  objc_initWeak(&location, self);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __44__HLPDataCacheController_removeAllDataCache__block_invoke_2;
  v17 = &unk_24D32EDA8;
  objc_copyWeak(&v18, &location);
  dispatch_sync(dataCacheSerialQueue, &v14);
  self->_cacheSize = 0;
  -[HLPDataCacheController updateCacheDelay](self, "updateCacheDelay", v14, v15, v16, v17);
  -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", self->_identifier);
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __44__HLPDataCacheController_removeAllDataCache__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "path");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

}

void __44__HLPDataCacheController_removeAllDataCache__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataCacheMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "dataCacheArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)removeCacheForIdentifier:(id)a3
{
  id v4;

  -[HLPDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HLPDataCacheController removeDataCache:](self, "removeDataCache:", v4);

}

- (void)removeDataCache:(id)a3
{
  -[HLPDataCacheController removeDataCache:updateCache:](self, "removeDataCache:updateCache:", a3, 1);
}

- (void)removeDataCache:(id)a3 updateCache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *dataCacheSerialQueue;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  uint64_t *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  id location[2];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__1;
    v38 = __Block_byref_object_dispose__1;
    v39 = 0;
    dataCacheSerialQueue = self->_dataCacheSerialQueue;
    v10 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke;
    block[3] = &unk_24D32EE70;
    v32 = &v34;
    objc_copyWeak(&v33, location);
    v11 = v8;
    v31 = v11;
    dispatch_sync(dataCacheSerialQueue, block);
    if (v35[5])
    {
      -[HLPDataCacheController cacheFileURLForDataCache:](self, "cacheFileURLForDataCache:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v12, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "fileExistsAtPath:", v15);

        if (v16)
        {
          v17 = objc_alloc_init(MEMORY[0x24BDD1570]);
          v29 = 0;
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_2;
          v27[3] = &unk_24D32EE20;
          v28 = v13;
          objc_msgSend(v17, "coordinateWritingItemAtURL:options:error:byAccessor:", v12, 1, &v29, v27);
          v18 = v29;

        }
      }
      v19 = self->_dataCacheSerialQueue;
      v10 = MEMORY[0x24BDAC760];
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_3;
      v24[3] = &unk_24D32EAB8;
      objc_copyWeak(&v26, location);
      v25 = v11;
      dispatch_sync(v19, v24);

      objc_destroyWeak(&v26);
    }
    self->_cacheSize -= objc_msgSend(v7, "fileSize");
    v20 = self->_dataCacheSerialQueue;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_4;
    v21[3] = &unk_24D32EAB8;
    objc_copyWeak(&v23, location);
    v22 = v7;
    dispatch_sync(v20, v21);
    if (v4)
      -[HLPDataCacheController updateCache](self, "updateCache");

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v33);
    _Block_object_dispose(&v34, 8);

    objc_destroyWeak(location);
  }

}

void __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dataCacheMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "path");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

}

void __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataCacheMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

void __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataCacheArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (id)newDataCache
{
  HLPDataCache *v2;

  v2 = objc_alloc_init(HLPDataCache);
  -[HLPDataCache setCacheType:](v2, "setCacheType:", 0);
  -[HLPDataCache setMaxAge:](v2, "setMaxAge:", 259200);
  return v2;
}

- (id)saveFileURL:(id)a3 identifier:(id)a4 fileSize:(unint64_t)a5 lastModified:(id)a6 dataCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  HLPDataCacheController *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  id *v34;
  void *v35;
  void *v36;
  unint64_t v38;
  int v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  char v48;
  id obj;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  v17 = 0;
  if (v12 && v13)
  {
    v38 = a5;
    v18 = v15;
    objc_msgSend(v18, "lastModified");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v14);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPDataCacheController cacheFileURLForIdentifier:](self, "cacheFileURLForIdentifier:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v23 = objc_claimAutoreleasedReturnValue();
    v41 = v21;
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v22, "path");
      v39 = v20;
      v25 = v18;
      v26 = self;
      v27 = v13;
      v28 = v12;
      v29 = v14;
      v30 = v22;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v21, "fileExistsAtPath:", v31);

      v22 = v30;
      v14 = v29;
      v12 = v28;
      v13 = v27;
      self = v26;
      v18 = v25;

      if ((v39 & v32 & 1) != 0)
      {
        v17 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      LOBYTE(v32) = 0;
    }
    v33 = v22;
    -[HLPDataCacheController createCacheDirectory](self, "createCacheDirectory");
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__1;
    v54 = __Block_byref_object_dispose__1;
    v55 = 0;
    v40 = objc_alloc_init(MEMORY[0x24BDD1570]);
    v34 = (id *)(v51 + 5);
    obj = (id)v51[5];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __81__HLPDataCacheController_saveFileURL_identifier_fileSize_lastModified_dataCache___block_invoke;
    v42[3] = &unk_24D32EE98;
    v48 = v32;
    v43 = v41;
    v46 = &v50;
    v17 = v33;
    v44 = v17;
    v45 = v12;
    v47 = &v56;
    objc_msgSend(v40, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v17, 1, v17, 2, &obj, v42);
    objc_storeStrong(v34, obj);
    if (v18)
    {
      if (*((_BYTE *)v57 + 24))
      {
        -[HLPDataCacheController setCacheSize:](self, "setCacheSize:", -[HLPDataCacheController cacheSize](self, "cacheSize") - objc_msgSend(v18, "fileSize"));
        -[HLPDataCacheController setCacheSize:](self, "setCacheSize:", -[HLPDataCacheController cacheSize](self, "cacheSize") + v38);
LABEL_14:
        objc_msgSend(v18, "setLastModified:", v14);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setUpdatedDate:", v36);

        objc_msgSend(v18, "setFileSize:", v38);
        if (v18)
          -[HLPDataCacheController addDataCache:](self, "addDataCache:", v18);

        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(&v56, 8);
        goto LABEL_17;
      }
      -[HLPDataCacheController removeDataCache:](self, "removeDataCache:", v18);

    }
    else if (*((_BYTE *)v57 + 24))
    {
      v18 = -[HLPDataCacheController newDataCache](self, "newDataCache");
      -[HLPDataCacheController languageCode](self, "languageCode");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLanguageCode:", v35);

      objc_msgSend(v18, "setIdentifier:", v13);
      goto LABEL_14;
    }
    v18 = 0;
    goto LABEL_14;
  }
LABEL_18:

  return v17;
}

void __81__HLPDataCacheController_saveFileURL_identifier_fileSize_lastModified_dataCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id obj;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 72))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    objc_msgSend(v7, "removeItemAtURL:error:", v5, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      HLPLogForCategory(2uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_2153AA000, v9, OS_LOG_TYPE_DEFAULT, "Unable to delete %@. Error: %@", buf, 0x16u);
      }

    }
  }
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "moveItemAtURL:toURL:error:", v13, v6, &v18);
  objc_storeStrong((id *)(v14 + 40), v18);
  if (v15 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    HLPLogForCategory(2uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_2153AA000, v16, OS_LOG_TYPE_DEFAULT, "Unable to save cache image %@", buf, 0xCu);
    }

  }
}

- (id)formattedDataForRequest:(id)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int64_t dataType;
  void *v29;
  void *v30;
  double v31;
  NSObject *dataCacheSerialQueue;
  int64_t v33;
  void *v34;
  float defaultPriority;
  void *v36;
  double v37;
  void *v39;
  void *v40;
  _QWORD block[5];
  id v42;
  _QWORD v43[5];
  id v44;
  id location;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  HLPDataCacheController *v59;
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    if (!v9)
    {
      objc_msgSend(v40, "lastPathComponent");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 1;
    if (objc_msgSend(v8, "cachePolicy") == 1)
    {
      v12 = 0;
    }
    else
    {
      v39 = v10;
      -[HLPDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPDataCacheController cacheFileURLForDataCache:](self, "cacheFileURLForDataCache:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "fileExistsAtPath:", v19);

      if (v20)
      {
        objc_msgSend(v15, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPDataCacheController cacheFileURLForIdentifier:](self, "cacheFileURLForIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 && -[HLPDataCacheController isURLValid:](self, "isURLValid:", v22))
        {
          v56[0] = MEMORY[0x24BDAC760];
          v56[1] = 3221225472;
          v56[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke;
          v56[3] = &unk_24D32EEC0;
          v60 = v39;
          v57 = v15;
          v61 = &v62;
          v58 = v40;
          v59 = self;
          -[HLPDataCacheController formattedDataWithFileURL:completionHandler:](self, "formattedDataWithFileURL:completionHandler:", v22, v56);

          v12 = 1;
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
LABEL_12:
        if (v15)
          -[HLPDataCacheController removeDataCache:](self, "removeDataCache:", v15);
        v12 = 0;
        v22 = v16;
      }

      v10 = v39;
    }
    if (!*((_BYTE *)v63 + 24) && !-[HLPDataCacheController backgroundOriginUpdate](self, "backgroundOriginUpdate"))
      goto LABEL_21;
    if (objc_msgSend(v11, "isFileURL"))
    {
      if ((v12 & 1) != 0)
      {
LABEL_21:
        v14 = 0;
LABEL_27:
        _Block_object_dispose(&v62, 8);
        goto LABEL_28;
      }
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_33;
      v54[3] = &unk_24D32EEE8;
      v55 = v10;
      -[HLPDataCacheController formattedDataWithFileURL:completionHandler:](self, "formattedDataWithFileURL:completionHandler:", v11, v54);
      v14 = 0;
      v23 = v55;
    }
    else
    {
      +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) != 0)
      {
        v24 = v10;
        v46 = 0;
        v47 = &v46;
        v48 = 0x3032000000;
        v49 = __Block_byref_object_copy__1;
        v50 = __Block_byref_object_dispose__1;
        v51 = 0;
        objc_initWeak(&location, self);
        v25 = MEMORY[0x24BDAC760];
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_3;
        v43[3] = &unk_24D32EF38;
        objc_copyWeak(&v44, &location);
        v43[4] = &v46;
        v26 = objc_msgSend(v23, "newURLSessionItemWithRequest:identifier:completionHandler:", v8, v9, v43);
        v27 = (void *)v47[5];
        v47[5] = v26;

        dataType = self->_dataType;
        objc_msgSend((id)v47[5], "sessionTask");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setDataType:", dataType);

        objc_msgSend((id)v47[5], "sessionTask");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v31) = *MEMORY[0x24BDD1358];
        objc_msgSend(v30, "setPriority:", v31);

        objc_msgSend(v23, "resumeSessionItem:", v47[5]);
        dataCacheSerialQueue = self->_dataCacheSerialQueue;
        block[0] = v25;
        block[1] = 3221225472;
        block[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_4;
        block[3] = &unk_24D32EF60;
        objc_copyWeak(&v42, &location);
        block[4] = &v46;
        dispatch_sync(dataCacheSerialQueue, block);
        objc_destroyWeak(&v42);
        objc_destroyWeak(&v44);
        objc_destroyWeak(&location);
        _Block_object_dispose(&v46, 8);

        v14 = 0;
        v10 = v24;
      }
      else
      {
        v52[0] = MEMORY[0x24BDAC760];
        v52[1] = 3221225472;
        v52[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_2;
        v52[3] = &unk_24D32EF10;
        v53 = v10;
        v14 = (void *)objc_msgSend(v23, "newURLSessionItemWithRequest:identifier:completionHandler:", v8, v9, v52);
        v33 = self->_dataType;
        objc_msgSend(v14, "sessionTask");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setDataType:", v33);

        defaultPriority = self->_defaultPriority;
        objc_msgSend(v14, "sessionTask");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v37 = defaultPriority;
        objc_msgSend(v36, "setPriority:", v37);

        objc_msgSend(v23, "resumeSessionItem:", v14);
      }
    }

    goto LABEL_27;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Empty data path"), -1, 0);
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, 0, 0, v13);

  v14 = 0;
LABEL_28:

  return v14;
}

void __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "lastModified");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id, uint64_t, void *, _QWORD))(v7 + 16))(v7, v5, v6, 1, v8, 0);

    HLPLogForCategory(2uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_2153AA000, v9, OS_LOG_TYPE_DEFAULT, "Data cache exists for %@", (uint8_t *)&v14, 0xCu);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "expired") & 1) != 0)
    {
      HLPLogForCategory(2uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_cold_1(a1, (id *)(a1 + 32), v11);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 48), "removeDataCache:", *(_QWORD *)(a1 + 32));
    v12 = *(_QWORD *)(a1 + 56);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Invalid data cache"), -1, 0);
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, 0, 0, v13);

  }
}

uint64_t __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "originFetchItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "originFetchItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

- (id)formattedDataForPath:(id)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8
    && (v11 = (void *)MEMORY[0x24BDD1840],
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "requestWithURL:", v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    -[HLPDataCacheController formattedDataForRequest:identifier:completionHandler:](self, "formattedDataForRequest:identifier:completionHandler:", v13, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Invalid request"), -1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, 0, 0, v13);
    v14 = 0;
  }

  return v14;
}

- (BOOL)isURLValid:(id)a3
{
  return a3 != 0;
}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, id, _QWORD))a4 + 2))(a4, a3, 0);
}

- (id)formattedDataWithData:(id)a3
{
  return a3;
}

- (id)formattedDataWithFileURL:(id)a3
{
  return a3;
}

- (float)defaultPriority
{
  return self->_defaultPriority;
}

- (void)setDefaultPriority:(float)a3
{
  self->_defaultPriority = a3;
}

- (BOOL)backgroundOriginUpdate
{
  return self->_backgroundOriginUpdate;
}

- (void)setBackgroundOriginUpdate:(BOOL)a3
{
  self->_backgroundOriginUpdate = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSMutableArray)dataCacheArray
{
  return self->_dataCacheArray;
}

- (void)setDataCacheArray:(id)a3
{
  objc_storeStrong((id *)&self->_dataCacheArray, a3);
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(unint64_t)a3
{
  self->_cacheSize = a3;
}

- (unint64_t)maxDataCacheSize
{
  return self->_maxDataCacheSize;
}

- (void)setMaxDataCacheSize:(unint64_t)a3
{
  self->_maxDataCacheSize = a3;
}

- (BOOL)dataCacheDirty
{
  return self->_dataCacheDirty;
}

- (void)setDataCacheDirty:(BOOL)a3
{
  self->_dataCacheDirty = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (NSMutableDictionary)dataCacheMap
{
  return self->_dataCacheMap;
}

- (void)setDataCacheMap:(id)a3
{
  objc_storeStrong((id *)&self->_dataCacheMap, a3);
}

- (NSString)cacheDirectory
{
  return self->_cacheDirectory;
}

- (void)setCacheDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDirectory, a3);
}

- (NSMutableArray)originFetchItems
{
  return self->_originFetchItems;
}

- (void)setOriginFetchItems:(id)a3
{
  objc_storeStrong((id *)&self->_originFetchItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originFetchItems, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_dataCacheMap, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dataCacheArray, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_dataCacheSerialQueue, 0);
}

void __42__HLPDataCacheController_updateCacheDelay__block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "dataCacheArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  OUTLINED_FUNCTION_1(&dword_2153AA000, a3, v7, "Unable to archive %@, error: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_0();
}

void __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*a2, "updatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_2153AA000, a3, OS_LOG_TYPE_DEBUG, "Data cache expired for %@.  Last update on %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_0();
}

@end
