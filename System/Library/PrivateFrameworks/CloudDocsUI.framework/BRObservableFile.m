@implementation BRObservableFile

+ (void)_registerForApplicationLifecycleNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BRObservableFile__registerForApplicationLifecycleNotifications__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerForApplicationLifecycleNotifications_onceToken != -1)
    dispatch_once(&_registerForApplicationLifecycleNotifications_onceToken, block);
}

void __65__BRObservableFile__registerForApplicationLifecycleNotifications__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__applicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);
  v2 = objc_alloc(MEMORY[0x24BDD15C0]);
  objc_msgSend(MEMORY[0x24BDD1750], "pointerFunctionsWithOptions:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithPointerFunctions:capacity:", v3, 0);
  v5 = (void *)_BRObservableFileInstances;
  _BRObservableFileInstances = v4;

}

+ (void)_registerInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)_BRObservableFileInstances;
  objc_sync_enter(v3);
  objc_msgSend((id)_BRObservableFileInstances, "addObject:", v4);
  objc_sync_exit(v3);

}

+ (void)_deregisterInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)_BRObservableFileInstances;
  objc_sync_enter(v3);
  objc_msgSend((id)_BRObservableFileInstances, "removeObject:", v4);
  objc_sync_exit(v3);

}

+ (void)_applicationWillResignActive:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performExpiringActivityWithReason:usingBlock:", CFSTR("Deregister file presenters"), &__block_literal_global_5);

}

void __49__BRObservableFile__applicationWillResignActive___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    cdui_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      __49__BRObservableFile__applicationWillResignActive___block_invoke_cold_1(v2);
      v3 = v2;
    }
  }
  else
  {
    v15 = (id)_BRObservableFileInstances;
    objc_sync_enter(v15);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)_BRObservableFileInstances;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v18 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          cdui_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            v9 = (id)objc_opt_class();
            objc_msgSend(v7, "presenter");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "presentedItemURL");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "path");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v22 = v9;
            v23 = 2048;
            v24 = v7;
            v25 = 2112;
            v26 = v12;
            _os_log_impl(&dword_21F506000, v8, OS_LOG_TYPE_INFO, "[INFO] Removing (<%@: %p>, %@) as file presenter due to application deactivation", buf, 0x20u);

          }
          v13 = (void *)MEMORY[0x24BDD1570];
          objc_msgSend(v7, "presenter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeFilePresenter:", v14);

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      }
      while (v4);
    }

    v3 = v15;
    objc_sync_exit(v15);
  }

}

+ (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = (id)_BRObservableFileInstances;
  objc_sync_enter(v15);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)_BRObservableFileInstances;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        cdui_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = (id)objc_opt_class();
          objc_msgSend(v6, "presenter", v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "presentedItemURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v22 = v8;
          v23 = 2048;
          v24 = v6;
          v25 = 2112;
          v26 = v11;
          _os_log_impl(&dword_21F506000, v7, OS_LOG_TYPE_INFO, "[INFO] Re-adding (<%@: %p>, %@) as file presenter due to application activation", buf, 0x20u);

        }
        v12 = (void *)MEMORY[0x24BDD1570];
        objc_msgSend(v6, "presenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addFilePresenter:", v13);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v3);
  }

  objc_sync_exit(v15);
}

+ (id)observerForKey:(id)a3 onFileURL:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:fileURL:", v7, v6);

  return v8;
}

- (BRObservableFile)initWithKey:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  BRObservableFile *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  BRObservableFile *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BRObservableFile;
  v8 = -[BRObservableFile init](&v23, sel_init);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_registerForApplicationLifecycleNotifications");
    -[BRObservableFile setKey:](v8, "setKey:", v6);
    v9 = (void *)objc_opt_new();
    -[BRObservableFile setPresenter:](v8, "setPresenter:", v9);

    -[BRObservableFile presenter](v8, "presenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPresentedItemURL:", v7);

    v11 = (void *)objc_opt_new();
    -[BRObservableFile presenter](v8, "presenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPresentedItemOperationQueue:", v11);

    -[BRObservableFile presenter](v8, "presenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setParent:", v8);

    objc_msgSend((id)objc_opt_class(), "_registerInstance:", v8);
    v14 = (void *)MEMORY[0x24BDD1570];
    -[BRObservableFile presenter](v8, "presenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addFilePresenter:", v15);

    cdui_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      -[BRObservableFile presenter](v8, "presenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentedItemURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v17;
      v26 = 2048;
      v27 = v8;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_21F506000, v16, OS_LOG_TYPE_INFO, "[INFO] Adding (<%@: %p>, %@) as file presenter", buf, 0x20u);

    }
    -[BRObservableFile _presenterDidChange](v8, "_presenterDidChange");
  }

  return v8;
}

- (id)addObserverBlock:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRObservableFile;
  -[BRObservableFile addObserverBlock:](&v6, sel_addObserverBlock_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRObservableFile _presenterDidChange](self, "_presenterDidChange");
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  BRObservableFile *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_deregisterInstance:", self);
  cdui_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    -[BRObservableFile presenter](self, "presenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedItemURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v4;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_21F506000, v3, OS_LOG_TYPE_INFO, "[INFO] Removing (<%@: %p>, %@) as file presenter due to dealloc", buf, 0x20u);

  }
  v9 = (void *)MEMORY[0x24BDD1570];
  -[BRObservableFile presenter](self, "presenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFilePresenter:", v10);

  v11.receiver = self;
  v11.super_class = (Class)BRObservableFile;
  -[BRObservableFile dealloc](&v11, sel_dealloc);
}

- (void)_presenterDidChange
{
  NSString *key;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  key = self->_key;
  -[BRObservableFile presenter](self, "presenter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentedItemURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (key)
  {
    -[BRObservableFile key](self, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeCachedResourceValueForKey:", v5);

    -[BRObservableFile presenter](self, "presenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedItemURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    -[BRObservableFile key](self, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v7, "getPromisedItemResourceValue:forKey:error:", &v14, v8, &v13);
    v10 = v14;
    v11 = v13;

    if (v9)
      -[BRObservableFile receiveObservedValue:](self, "receiveObservedValue:", v10);
    else
      -[BRObservableFile receiveObservedError:](self, "receiveObservedError:", v11);

  }
  else
  {
    -[BRObservableFile receiveObservedValue:](self, "receiveObservedValue:", v4);

  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_BRObservableFilePresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

void __49__BRObservableFile__applicationWillResignActive___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21F506000, log, OS_LOG_TYPE_FAULT, "[ERROR] Background activity for deregistering file presenters expired. This may result in the app being jetsamed while in the background.", v1, 2u);
}

@end
