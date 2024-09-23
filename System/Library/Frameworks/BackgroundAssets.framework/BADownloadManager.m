@implementation BADownloadManager

- (id)extensionConnection
{
  id WeakRetained;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    WeakRetained = 0;
  }
  return WeakRetained;
}

- (void)setExtensionConnection:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 8);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_storeWeak((id *)(a1 + 16), v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

+ (BADownloadManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_4);
  return (BADownloadManager *)(id)sharedManager_sDownloader;
}

void __34__BADownloadManager_sharedManager__block_invoke()
{
  BADownloadManager *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  v0 = [BADownloadManager alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[BADownloadManager initWithApplicationIdentifier:](v0, v1);
  v2 = (void *)sharedManager_sDownloader;
  sharedManager_sDownloader = v3;

}

- (void)initWithApplicationIdentifier:(void *)a1
{
  id v3;
  id v4;
  dispatch_queue_t v5;
  SEL v6;
  dispatch_queue_t v7;
  SEL v8;
  SEL v9;
  id v10;
  SEL v11;
  BAAgentClientProxy *v12;
  SEL v13;
  id Property;
  id *v15;
  SEL v16;
  SEL v17;
  id *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  objc_super v29;

  v3 = a2;
  if (!a1)
    goto LABEL_5;
  v29.receiver = a1;
  v29.super_class = (Class)BADownloadManager;
  v4 = objc_msgSendSuper2(&v29, sel_init);
  if (!v4)
    goto LABEL_5;
  if (v3)
  {
    +[BADownloadManager _enforceCallerConformsToRequirements]();
    *((_DWORD *)v4 + 2) = 0;
    objc_storeWeak((id *)v4 + 2, 0);
    v5 = dispatch_queue_create("com.apple.backgroundassets.BADownloadManager.CallbackQueue", 0);
    objc_setProperty_atomic(v4, v6, v5, 40);

    v7 = dispatch_queue_create("com.apple.backgroundassets.BADownloadManager.Completion", 0);
    objc_setProperty_atomic(v4, v8, v7, 48);

    objc_setProperty_atomic(v4, v9, v3, 64);
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_setProperty_atomic(v4, v11, v10, 72);

    v12 = [BAAgentClientProxy alloc];
    Property = objc_getProperty(v4, v13, 64, 1);
    v15 = -[BAAgentClientProxy initWithApplicationIdentifier:downloadManager:]((id *)&v12->super.isa, Property, v4);
    objc_setProperty_atomic(v4, v16, v15, 56);

    v18 = (id *)objc_getProperty(v4, v17, 56, 1);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __51__BADownloadManager_initWithApplicationIdentifier___block_invoke;
    v27[3] = &unk_24DDBF290;
    v28 = v4;
    -[BAAgentClientProxy currentDownloadsWithCompletion:](v18, v27);

LABEL_5:
    return;
  }
  v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if (v19)
    -[BADownloadManager initWithApplicationIdentifier:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BADownloadManager requires the app and extension to have"
                             " a valid bundle identifier";
  __break(1u);
}

+ (void)_enforceCallerConformsToRequirements
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (BADownloadManager)init
{
  BADownloadManager *result;
  int v3;
  const char *v4;

  result = (BADownloadManager *)os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BADownloadManager cannot be constructed using -init.";
    _os_log_fault_impl(&dword_21ABD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BADownloadManager cannot be constructed using -init.";
  __break(1u);
  return result;
}

void __51__BADownloadManager_initWithApplicationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  id Property;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v4, 72, 1);
  objc_msgSend(Property, "removeAllObjects");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = *(id *)(a1 + 32);
        if (v13)
          v13 = objc_getProperty(v13, v8, 72, 1);
        v14 = v13;
        objc_msgSend(v12, "uniqueIdentifier", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v12, v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)scheduleDownload:(BADownload *)download error:(NSError *)error
{
  os_unfair_lock_s *p_stateLock;
  BADownload *v7;
  const char *v8;
  id *Property;
  const char *v10;
  id v11;
  id v12;
  void *v13;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v7 = download;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v15)
      -[BADownloadManager scheduleDownload:error:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);
    __break(1u);
    goto LABEL_14;
  }
  if (-[BADownload necessity](v7, "necessity") == 1)
  {
LABEL_14:
    v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v23)
      -[BADownloadManager scheduleDownload:error:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    __break(1u);
    goto LABEL_17;
  }
  if (!self)
  {
LABEL_17:
    Property = 0;
    goto LABEL_6;
  }
  if (self->_scheduleLocked)
  {
    v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v31)
      -[BADownloadManager scheduleDownload:error:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);
                               "s method context.";
    __break(1u);
    goto LABEL_21;
  }
  Property = (id *)objc_getProperty(self, v8, 56, 1);
LABEL_6:
  LODWORD(error) = -[BAAgentClientProxy scheduleDownload:error:](Property, v7, error);
  if ((_DWORD)error)
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    if (self)
    {
      v11 = objc_getProperty(self, v10, 72, 1);
LABEL_9:
      v12 = v11;
      -[BADownload uniqueIdentifier](v7, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v7, v13);

      os_unfair_lock_unlock(p_stateLock);
      goto LABEL_10;
    }
LABEL_21:
    v11 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return (char)error;
}

- (void)performWithExclusiveControl:(void *)performHandler
{
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id Property;
  void *v11;
  void *v12;
  const char *v13;
  id *v14;
  id v15;
  id v16;
  id *v17;
  id v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = performHandler;
  if (!v4)
  {
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v19)
      -[BADownloadManager performWithExclusiveControl:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Calling 'performWithExclusiveControl' must be called w"
                               "ith a valid performHandler.";
    __break(1u);
  }
  v5 = v4;
  -[BADownloadManager extensionConnection]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    BAClientLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (self)
        Property = objc_getProperty(self, v9, 64, 1);
      else
        Property = 0;
      *(_DWORD *)buf = 138543362;
      v33 = Property;
      _os_log_impl(&dword_21ABD8000, v8, OS_LOG_TYPE_INFO, "Acquiring exclusive control extension wake assertion for: %{public}@", buf, 0xCu);
    }

    -[BADownloadManager extensionConnection]((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "acquireWakeAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v14 = (id *)objc_getProperty(self, v13, 56, 1);
    else
      v14 = 0;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __49__BADownloadManager_performWithExclusiveControl___block_invoke;
    v29[3] = &unk_24DDBF2E0;
    v29[4] = self;
    v30 = v5;
    v31 = v12;
    v15 = v12;
    v16 = v5;
    -[BAAgentClientProxy acquireExclusiveControlWithHandler:](v14, v29);

  }
  else
  {
    if (self)
      v17 = (id *)objc_getProperty(self, v6, 56, 1);
    else
      v17 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __49__BADownloadManager_performWithExclusiveControl___block_invoke_43;
    v27[3] = &unk_24DDBF308;
    v27[4] = self;
    v28 = v5;
    v18 = v5;
    -[BAAgentClientProxy acquireExclusiveControlWithHandler:](v17, v27);

  }
}

void __49__BADownloadManager_performWithExclusiveControl___block_invoke(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  id v6;
  void *v7;
  NSObject *Property;
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
    Property = objc_getProperty(v7, v5, 48, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BADownloadManager_performWithExclusiveControl___block_invoke_2;
  block[3] = &unk_24DDBF2B8;
  v15 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = v6;
  v14 = v9;
  dispatch_sync(Property, block);
  BAClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = *(id *)(a1 + 32);
    if (v12)
      v12 = objc_getProperty(v12, v11, 64, 1);
    *(_DWORD *)buf = 138543362;
    v18 = v12;
    _os_log_impl(&dword_21ABD8000, v10, OS_LOG_TYPE_INFO, "Releasing exclusive control extension wake assertion for: %{public}@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __49__BADownloadManager_performWithExclusiveControl___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __49__BADownloadManager_performWithExclusiveControl___block_invoke_43(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  id v6;
  void *v7;
  NSObject *Property;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
    Property = objc_getProperty(v7, v5, 48, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BADownloadManager_performWithExclusiveControl___block_invoke_2_44;
  block[3] = &unk_24DDBF2B8;
  v9 = *(id *)(a1 + 40);
  v14 = a2;
  v12 = v6;
  v13 = v9;
  v10 = v6;
  dispatch_sync(Property, block);

}

uint64_t __49__BADownloadManager_performWithExclusiveControl___block_invoke_2_44(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)performWithExclusiveControlBeforeDate:(NSDate *)date performHandler:(void *)performHandler
{
  NSDate *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  id Property;
  void *v14;
  void *v15;
  const char *v16;
  id *v17;
  id v18;
  id v19;
  id *v20;
  id v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = date;
  v7 = performHandler;
  if (!v7)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v22)
      -[BADownloadManager performWithExclusiveControlBeforeDate:performHandler:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Calling 'performWithExclusiveControlBeforeDate' must b"
                               "e called with a valid performHandler.";
    __break(1u);
LABEL_18:
    v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v30)
      -[BADownloadManager performWithExclusiveControlBeforeDate:performHandler:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Calling 'performWithExclusiveControlBeforeDate' must b"
                               "e called with a valid date.";
    __break(1u);
  }
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_18;
  -[BADownloadManager extensionConnection]((uint64_t)self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    BAClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (self)
        Property = objc_getProperty(self, v12, 64, 1);
      else
        Property = 0;
      *(_DWORD *)buf = 138543362;
      v44 = Property;
      _os_log_impl(&dword_21ABD8000, v11, OS_LOG_TYPE_INFO, "Acquiring exclusive control extension wake assertion for: %{public}@", buf, 0xCu);
    }

    -[BADownloadManager extensionConnection]((uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "acquireWakeAssertion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v17 = (id *)objc_getProperty(self, v16, 56, 1);
    else
      v17 = 0;
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke;
    v40[3] = &unk_24DDBF2E0;
    v40[4] = self;
    v41 = v8;
    v42 = v15;
    v18 = v15;
    v19 = v8;
    -[BAAgentClientProxy acquireExclusiveControlBeforeDate:handler:](v17, v6, v40);

  }
  else
  {
    if (self)
      v20 = (id *)objc_getProperty(self, v9, 56, 1);
    else
      v20 = 0;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_50;
    v38[3] = &unk_24DDBF308;
    v38[4] = self;
    v39 = v8;
    v21 = v8;
    -[BAAgentClientProxy acquireExclusiveControlBeforeDate:handler:](v20, v6, v38);

  }
}

void __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  id v6;
  void *v7;
  NSObject *Property;
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
    Property = objc_getProperty(v7, v5, 48, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_2;
  block[3] = &unk_24DDBF2B8;
  v15 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = v6;
  v14 = v9;
  dispatch_sync(Property, block);
  BAClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = *(id *)(a1 + 32);
    if (v12)
      v12 = objc_getProperty(v12, v11, 64, 1);
    *(_DWORD *)buf = 138543362;
    v18 = v12;
    _os_log_impl(&dword_21ABD8000, v10, OS_LOG_TYPE_INFO, "Releasing exclusive control extension wake assertion for: %{public}@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_50(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  id v6;
  void *v7;
  NSObject *Property;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
    Property = objc_getProperty(v7, v5, 48, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_2_51;
  block[3] = &unk_24DDBF2B8;
  v9 = *(id *)(a1 + 40);
  v14 = a2;
  v12 = v6;
  v13 = v9;
  v10 = v6;
  dispatch_sync(Property, block);

}

uint64_t __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_2_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)startForegroundDownload:(BADownload *)download error:(NSError *)error
{
  BADownload *v6;
  const char *v7;
  id *Property;
  BOOL v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = download;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v11)
      -[BADownloadManager startForegroundDownload:error:].cold.3(v11, v12, v13, v14, v15, v16, v17, v18);
    __break(1u);
    goto LABEL_10;
  }
  if (-[BADownload necessity](v6, "necessity") == 1)
  {
LABEL_10:
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v19)
      -[BADownloadManager startForegroundDownload:error:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    __break(1u);
    goto LABEL_13;
  }
  if (!self)
  {
LABEL_13:
    Property = 0;
    goto LABEL_6;
  }
  if (!self->_scheduleLocked)
  {
    Property = (id *)objc_getProperty(self, v7, 56, 1);
LABEL_6:
    v9 = -[BAAgentClientProxy startForegroundDownload:error:](Property, v6, error);

    LOBYTE(v10) = v9;
    return v10;
  }
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if (v10)
    -[BADownloadManager startForegroundDownload:error:].cold.2(v10, v27, v28, v29, v30, v31, v32, v33);
  __break(1u);
  return v10;
}

- (BOOL)cancelDownload:(BADownload *)download error:(NSError *)error
{
  BADownload *v6;
  const char *v7;
  id *Property;
  BOOL v9;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = download;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v11)
      -[BADownloadManager cancelDownload:error:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    __break(1u);
    goto LABEL_8;
  }
  if (!self)
  {
LABEL_8:
    Property = 0;
    goto LABEL_4;
  }
  Property = (id *)objc_getProperty(self, v7, 56, 1);
LABEL_4:
  v9 = -[BAAgentClientProxy cancelDownload:error:](Property, v6, error);

  return v9;
}

- (NSArray)fetchCurrentDownloads:(NSError *)error
{
  if (self)
    self = (BADownloadManager *)objc_getProperty(self, a2, 56, 1);
  return (NSArray *)-[BAAgentClientProxy currentDownloads:]((id *)&self->super.isa, (char *)error);
}

- (void)fetchCurrentDownloadsWithCompletionHandler:(void *)completionHandler
{
  const char *v4;
  void *v5;
  id *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = completionHandler;
  if (self)
    Property = (id *)objc_getProperty(self, v4, 56, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__BADownloadManager_fetchCurrentDownloadsWithCompletionHandler___block_invoke;
  v8[3] = &unk_24DDBF330;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[BAAgentClientProxy currentDownloadsWithCompletion:](Property, v8);

}

void __64__BADownloadManager_fetchCurrentDownloadsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  NSObject *Property;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v7 = a3;
  v8 = *(void **)(a1 + 32);
  if (v8)
    Property = objc_getProperty(v8, v6, 48, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__BADownloadManager_fetchCurrentDownloadsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24DDBF1B0;
  v10 = *(id *)(a1 + 40);
  v15 = v7;
  v16 = v10;
  v14 = v5;
  v11 = v7;
  v12 = v5;
  dispatch_async(Property, block);

}

uint64_t __64__BADownloadManager_fetchCurrentDownloadsWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (uint64_t)setScheduleLocked:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_completionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_delegateCallbackQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_extensionConnection);
}

- (void)syncDownloads:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id Property;
  id v13;
  void *v14;
  void *v15;
  const char *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        if (self)
          Property = objc_getProperty(self, v7, 72, 1);
        else
          Property = 0;
        v13 = Property;
        objc_msgSend(v11, "uniqueIdentifier", (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "syncTo:", v11);
        }
        else
        {
          if (self)
            v17 = objc_getProperty(self, v16, 72, 1);
          else
            v17 = 0;
          v18 = v17;
          objc_msgSend(v11, "uniqueIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v11, v19);

        }
        ++v10;
      }
      while (v8 != v10);
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v8 = v20;
    }
    while (v20);
  }

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)downloadIdentifierDidBegin:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  const char *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self)
    Property = objc_getProperty(self, v5, 72, 1);
  else
    Property = 0;
  objc_msgSend(Property, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_stateLock);
  if (v7)
  {
    -[BADownloadManager delegate](self, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[BADownloadManager delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        if (self)
          v13 = objc_getProperty(self, v12, 40, 1);
        else
          v13 = 0;
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __65__BADownloadManager_XPCDownloadSync__downloadIdentifierDidBegin___block_invoke;
        v14[3] = &unk_24DDBF358;
        v14[4] = self;
        v15 = v7;
        dispatch_async(v13, v14);

      }
    }
  }

}

void __65__BADownloadManager_XPCDownloadSync__downloadIdentifierDidBegin___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadDidBegin:", *(_QWORD *)(a1 + 40));

}

- (void)downloadIdentifierDidPause:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  const char *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self)
    Property = objc_getProperty(self, v5, 72, 1);
  else
    Property = 0;
  objc_msgSend(Property, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_stateLock);
  if (v7)
  {
    -[BADownloadManager delegate](self, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[BADownloadManager delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        if (self)
          v13 = objc_getProperty(self, v12, 40, 1);
        else
          v13 = 0;
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __65__BADownloadManager_XPCDownloadSync__downloadIdentifierDidPause___block_invoke;
        v14[3] = &unk_24DDBF358;
        v14[4] = self;
        v15 = v7;
        dispatch_async(v13, v14);

      }
    }
  }

}

void __65__BADownloadManager_XPCDownloadSync__downloadIdentifierDidPause___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadDidPause:", *(_QWORD *)(a1 + 40));

}

- (void)downloadIdentifier:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  const char *v10;
  id Property;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self)
    Property = objc_getProperty(self, v10, 72, 1);
  else
    Property = 0;
  objc_msgSend(Property, "objectForKey:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_stateLock);
  if (v12)
  {
    -[BADownloadManager delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[BADownloadManager delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[BADownloadManager delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "download:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:", v12, a4, a5, a6);

      }
    }
  }

}

- (void)downloadIdentifier:(id)a3 didReceiveChallenge:(id)a4 authChallengeHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  id Property;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  const char *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_stateLock);
  if (self)
    Property = objc_getProperty(self, v11, 72, 1);
  else
    Property = 0;
  objc_msgSend(Property, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_stateLock);
  if (v13)
  {
    -[BADownloadManager delegate](self, "delegate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14
      && (v15 = (void *)v14,
          -[BADownloadManager delegate](self, "delegate"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_opt_respondsToSelector(),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      if (self)
        v19 = objc_getProperty(self, v18, 40, 1);
      else
        v19 = 0;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __98__BADownloadManager_XPCDownloadSync__downloadIdentifier_didReceiveChallenge_authChallengeHandler___block_invoke;
      v20[3] = &unk_24DDBEDC0;
      v20[4] = self;
      v21 = v13;
      v22 = v9;
      v23 = v10;
      dispatch_async(v19, v20);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 2, 0);
  }

}

void __98__BADownloadManager_XPCDownloadSync__downloadIdentifier_didReceiveChallenge_authChallengeHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "download:didReceiveChallenge:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)downloadIdentifier:(id)a3 didFailWithError:(id)a4 wasHandled:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  const char *v11;
  id Property;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[5];
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  os_unfair_lock_lock(&self->_stateLock);
  if (self)
    Property = objc_getProperty(self, v11, 72, 1);
  else
    Property = 0;
  objc_msgSend(Property, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_stateLock);
  if (!v13)
    goto LABEL_9;
  -[BADownloadManager delegate](self, "delegate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_9;
  v15 = (void *)v14;
  -[BADownloadManager delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    if (self)
      v19 = objc_getProperty(self, v18, 40, 1);
    else
      v19 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__BADownloadManager_XPCDownloadSync__downloadIdentifier_didFailWithError_wasHandled___block_invoke;
    block[3] = &unk_24DDBF380;
    block[4] = self;
    v22 = v13;
    v23 = v9;
    dispatch_async(v19, block);

    v20 = 1;
  }
  else
  {
LABEL_9:
    v20 = 0;
  }
  v10[2](v10, v20);

}

void __85__BADownloadManager_XPCDownloadSync__downloadIdentifier_didFailWithError_wasHandled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "download:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)downloadIdentifierDidFinish:(id)a3 sandboxExtensionToken:(id)a4 wasHandled:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  const char *v11;
  id Property;
  void *v13;
  char v14;
  id v15;
  const char *v16;
  id v17;
  id *v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  const char *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  char v62;
  const char *v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  char v70;
  const char *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  char v75;
  id v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  char v81;
  const char *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  _QWORD v86[4];
  id v87;
  id v88;
  _QWORD block[5];
  id v90;
  id v91;
  _QWORD v92[5];
  id v93;
  id v94;
  id v95;
  id v96;
  _QWORD v97[5];
  id v98;
  id v99;
  id v100;
  id v101;
  _QWORD v102[5];
  id v103;
  _QWORD v104[5];
  id v105;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  os_unfair_lock_lock(&self->_stateLock);
  if (self)
    Property = objc_getProperty(self, v11, 72, 1);
  else
    Property = 0;
  objc_msgSend(Property, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_stateLock);
  if (!v13)
  {
    BASystemLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);

    goto LABEL_33;
  }
  if (!v9)
  {
    BASystemLogObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.2(v36, v37, v38, v39, v40, v41, v42, v43);

    -[BADownloadManager delegate](self, "delegate");
    v44 = objc_claimAutoreleasedReturnValue();
    if (!v44)
      goto LABEL_33;
    v45 = (void *)v44;
    -[BADownloadManager delegate](self, "delegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_opt_respondsToSelector();

    if ((v47 & 1) == 0)
      goto LABEL_33;
    if (self)
      v49 = objc_getProperty(self, v48, 40, 1);
    else
      v49 = 0;
    v104[0] = MEMORY[0x24BDAC760];
    v104[1] = 3221225472;
    v104[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke;
    v104[3] = &unk_24DDBF358;
    v104[4] = self;
    v105 = v13;
    dispatch_async(v49, v104);
    v50 = v105;
    goto LABEL_32;
  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  if (sandbox_extension_consume() == -1)
  {
    BASystemLogObject();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.3(v51, v52, v53, v54, v55, v56, v57, v58);

    -[BADownloadManager delegate](self, "delegate");
    v59 = objc_claimAutoreleasedReturnValue();
    if (!v59)
      goto LABEL_33;
    v60 = (void *)v59;
    -[BADownloadManager delegate](self, "delegate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_opt_respondsToSelector();

    if ((v62 & 1) == 0)
      goto LABEL_33;
    if (self)
      v64 = objc_getProperty(self, v63, 40, 1);
    else
      v64 = 0;
    v102[0] = MEMORY[0x24BDAC760];
    v102[1] = 3221225472;
    v102[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_109;
    v102[3] = &unk_24DDBF358;
    v102[4] = self;
    v103 = v13;
    dispatch_async(v64, v102);
    v50 = v103;
LABEL_32:

LABEL_33:
    v10[2](v10, 0);
    goto LABEL_60;
  }
  v100 = 0;
  v101 = 0;
  v14 = objc_msgSend(v13, "cloneDownloadToFinalDestinationURL:error:", &v101, &v100);
  v15 = v101;
  v17 = v100;
  if ((v14 & 1) != 0)
  {
    if (self)
      v18 = (id *)objc_getProperty(self, v16, 56, 1);
    else
      v18 = 0;
    v96 = v17;
    v85 = v15;
    v19 = -[BAAgentClientProxy markPurgeableWithFileURL:error:](v18, v15, &v96);
    v20 = v96;

    if (v19)
    {
      -[BADownloadManager delegate](self, "delegate");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21
        && (v23 = (void *)v21,
            -[BADownloadManager delegate](self, "delegate"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_opt_respondsToSelector(),
            v24,
            v23,
            (v25 & 1) != 0))
      {
        v15 = v85;
        if (self)
          v26 = objc_getProperty(self, v22, 40, 1);
        else
          v26 = 0;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_2;
        block[3] = &unk_24DDBF380;
        block[4] = self;
        v90 = v13;
        v91 = v85;
        dispatch_async(v26, block);

        v27 = 1;
      }
      else
      {
        v27 = 0;
        v15 = v85;
      }
      if (self)
        self = (BADownloadManager *)objc_getProperty(self, v22, 40, 1);
      v86[0] = MEMORY[0x24BDAC760];
      v86[1] = 3221225472;
      v86[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_3;
      v86[3] = &unk_24DDBF358;
      v87 = v15;
      v88 = v13;
      dispatch_async(&self->super, v86);

    }
    else
    {
      BAClientLogObject();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.5();

      -[BADownload setInternalState:](v13, -1);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = 0;
      v75 = objc_msgSend(v74, "removeItemAtURL:error:", v85, &v95);
      v76 = v95;

      if ((v75 & 1) == 0)
      {
        BAClientLogObject();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.4();

      }
      -[BADownloadManager delegate](self, "delegate", v76);
      v78 = objc_claimAutoreleasedReturnValue();
      if (v78)
      {
        v79 = (void *)v78;
        -[BADownloadManager delegate](self, "delegate");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_opt_respondsToSelector();

        if ((v81 & 1) != 0)
        {
          if (self)
            v83 = objc_getProperty(self, v82, 40, 1);
          else
            v83 = 0;
          v92[0] = MEMORY[0x24BDAC760];
          v92[1] = 3221225472;
          v92[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_112;
          v92[3] = &unk_24DDBF380;
          v92[4] = self;
          v93 = v13;
          v94 = v20;
          dispatch_async(v83, v92);

        }
      }

      v27 = 0;
      v15 = v85;
    }
  }
  else
  {
    BAClientLogObject();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.6();

    -[BADownload setInternalState:](v13, -1);
    -[BADownloadManager delegate](self, "delegate");
    v66 = objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      v67 = (void *)v66;
      v68 = v15;
      -[BADownloadManager delegate](self, "delegate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_opt_respondsToSelector();

      if ((v70 & 1) != 0)
      {
        if (self)
          v72 = objc_getProperty(self, v71, 40, 1);
        else
          v72 = 0;
        v15 = v68;
        v97[0] = MEMORY[0x24BDAC760];
        v97[1] = 3221225472;
        v97[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_110;
        v97[3] = &unk_24DDBF380;
        v97[4] = self;
        v98 = v13;
        v20 = v17;
        v99 = v20;
        dispatch_async(v72, v97);

        v27 = 0;
      }
      else
      {
        v27 = 0;
        v20 = v17;
        v15 = v68;
      }
    }
    else
    {
      v27 = 0;
      v20 = v17;
    }
  }
  sandbox_extension_release();
  v10[2](v10, v27);

LABEL_60:
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  NSErrorWithBAErrorCode(-108);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "download:failedWithError:", *(_QWORD *)(a1 + 40), v3);

}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_109(uint64_t a1)
{
  void *v2;
  id v3;

  NSErrorWithBAErrorCode(-108);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "download:failedWithError:", *(_QWORD *)(a1 + 40), v3);

}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_110(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "download:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_112(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "download:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "download:finishedWithFileURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v10);
    v8 = v10;

    if ((v7 & 1) == 0)
    {
      BAClientLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_3_cold_1();

    }
  }
}

- (void)removeDownloadIdentifier:(id)a3
{
  const char *v4;
  id Property;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self)
    Property = objc_getProperty(self, v4, 72, 1);
  else
    Property = 0;
  objc_msgSend(Property, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_stateLock);

}

- (void)initWithApplicationIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)scheduleDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)scheduleDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)scheduleDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)performWithExclusiveControl:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)performWithExclusiveControlBeforeDate:(uint64_t)a3 performHandler:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)performWithExclusiveControlBeforeDate:(uint64_t)a3 performHandler:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)startForegroundDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)startForegroundDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)startForegroundDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)cancelDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend(*(id *)(v1 + 40), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v3, v4, "Download %{public}@ failed to remove cloned file after the client serviced the download. Error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
