@implementation IRMobileAssetManager

- (IRMobileAssetManager)initWithBackgroundActivitiesManager:(id)a3
{
  id v4;
  IRMobileAssetManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  IRMobileAssetManager *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  IRMobileAssetClient *v12;
  void *v13;
  _QWORD v15[4];
  IRMobileAssetManager *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IRMobileAssetManager;
  v5 = -[IRMobileAssetManager init](&v17, sel_init);
  if (v5)
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadMobileAssetXPCActivityInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longLongValue");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__IRMobileAssetManager_initWithBackgroundActivitiesManager___block_invoke;
    v15[3] = &unk_251044310;
    v9 = v5;
    v16 = v9;
    objc_msgSend(v4, "registerForRepeatingBackgroundXPCActivityWithIdentifier:interval:isDiskIntensive:isMemoryIntensive:handler:", CFSTR("com.apple.intelligentroutingd.MALoaderXPCActivityIdentifier"), v8, 1, 1, v15);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.intelligentroutingd.mobileAssetLoader", v10);
    -[IRMobileAssetManager setQueue:](v9, "setQueue:", v11);

    -[IRMobileAssetManager setBackgroundActivitiesManager:](v9, "setBackgroundActivitiesManager:", v4);
    v12 = objc_alloc_init(IRMobileAssetClient);
    -[IRMobileAssetManager setMobileAssetClient:](v9, "setMobileAssetClient:", v12);

    -[IRMobileAssetManager mobileAssetClient](v9, "mobileAssetClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[IRMobileAssetManager _loadAvailableMobileAsset](v9, "_loadAvailableMobileAsset");

  }
  return v5;
}

uint64_t __60__IRMobileAssetManager_initWithBackgroundActivitiesManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMobileAssetLoadXPCActivity");
}

- (void)_handleMobileAssetLoadXPCActivity
{
  id v3;

  -[IRMobileAssetManager queue](self, "queue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_10);

}

void __57__IRMobileAssetManager__handleMobileAssetLoadXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  IRMobileAssetClient *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v2 = a2;
  v3 = (void *)os_transaction_create();
  objc_msgSend(v2, "mobileAssetClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(IRMobileAssetClient);
    objc_msgSend(v2, "setMobileAssetClient:", v5);

  }
  objc_msgSend(v2, "mobileAssetClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v2, "_loadAvailableMobileAsset");
  }
  else
  {
    v7 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_INFO, "#mobile-asset-manager, Skipping MobileAsset load since MobileAsset client failed to initialize", v8, 2u);
    }
  }

}

- (void)_loadAvailableMobileAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[IRMobileAssetManager mobileAssetClient](self, "mobileAssetClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockAssetContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IRMobileAssetManager mobileAssetClient](self, "mobileAssetClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getLockedAssetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      && (+[IRPreferences shared](IRPreferences, "shared"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "mobileAssetVersion"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v6, "isEqual:", v8),
          v8,
          v7,
          (v9 & 1) == 0))
    {
      -[IRMobileAssetManager _loadMobileAssetAtPath:assetVersion:](self, "_loadMobileAssetAtPath:assetVersion:", v4, v6);
    }
    else
    {
      v10 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_23FFBA000, v10, OS_LOG_TYPE_INFO, "#mobile-asset-manager, Locked Mobile Asset is same as current version or nil: %@. Skipping load", (uint8_t *)&v12, 0xCu);
      }
    }
    -[IRMobileAssetManager mobileAssetClient](self, "mobileAssetClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unlockAssetContent");

  }
}

- (void)_loadMobileAssetAtPath:(id)a3 assetVersion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BE5B278];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B278], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#mobile-asset-manager, Loading MobileAsset. Version %@", (uint8_t *)&v13, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("settings.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "fileExistsAtPath:", v9) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRPreferences shared](IRPreferences, "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMobileAssetSettingsWithMobileAssetDict:assetVersion:", v10, v6);

  }
  else
  {
    v12 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRMobileAssetManager _loadMobileAssetAtPath:assetVersion:].cold.1((uint64_t)v6, v12);
  }

}

- (IRBackgroundActivitiesManager)backgroundActivitiesManager
{
  return (IRBackgroundActivitiesManager *)objc_loadWeakRetained((id *)&self->_backgroundActivitiesManager);
}

- (void)setBackgroundActivitiesManager:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundActivitiesManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IRMobileAssetClient)mobileAssetClient
{
  return self->_mobileAssetClient;
}

- (void)setMobileAssetClient:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_backgroundActivitiesManager);
}

- (void)_loadMobileAssetAtPath:(uint64_t)a1 assetVersion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23FFBA000, a2, OS_LOG_TYPE_ERROR, "#mobile-asset-manager, [ErrorId - load MobileAsset error] Could not find content of MobileAsset version %@", (uint8_t *)&v2, 0xCu);
}

@end
