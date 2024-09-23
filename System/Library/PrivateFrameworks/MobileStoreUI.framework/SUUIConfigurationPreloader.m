@implementation SUUIConfigurationPreloader

- (void)preloadConfigurationForPurpose:(int64_t)a3 withCompletionBlock:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  SUUIURLBag *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIConfigurationPreloader.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  -[SUUIConfigurationPreloader loadedConfiguration](self, "loadedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_3;
    v22[3] = &unk_2511F4930;
    v22[4] = self;
    v23 = v7;
    objc_msgSend(v9, "addOperationWithBlock:", v22);

  }
  else if (a3 || !-[SUUIConfigurationPreloader hasExistingConfigurationCache](self, "hasExistingConfigurationCache"))
  {
    -[SUUIConfigurationPreloader completionBlocks](self, "completionBlocks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "copy");
    v12 = _Block_copy(v11);
    objc_msgSend(v10, "addObject:", v12);

    -[SUUIConfigurationPreloader pendingReloadOperation](self, "pendingReloadOperation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = -[SUUIConfigurationPreloader newReloadConfigurationOperation](self, "newReloadConfigurationOperation");
      -[SUUIConfigurationPreloader setPendingReloadOperation:](self, "setPendingReloadOperation:", v14);

      if (a3 == 2)
      {
        objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        SSVDefaultUserAgent();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setValue:forHTTPHeaderField:", v16, *MEMORY[0x24BEB2518]);

        v17 = -[SSURLBag initWithURLBagContext:]([SUUIURLBag alloc], "initWithURLBagContext:", v15);
        -[SUUIReloadConfigurationOperation setURLBag:](self->_pendingReloadOperation, "setURLBag:", v17);

      }
      objc_initWeak(&location, self);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke;
      v24[3] = &unk_2511F9E00;
      objc_copyWeak(&v25, &location);
      -[SUUIConfigurationPreloader pendingReloadOperation](self, "pendingReloadOperation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setOutputBlock:", v24);

      -[SUUIConfigurationPreloader workQueue](self, "workQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIConfigurationPreloader pendingReloadOperation](self, "pendingReloadOperation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addOperation:", v20);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1B8], 0);
  }

}

- (NSDictionary)loadedConfiguration
{
  return self->_loadedConfiguration;
}

- (BOOL)hasExistingConfigurationCache
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIConfigurationPreloader configurationCachePath](self, "configurationCachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (NSString)configurationCachePath
{
  return self->_configurationCachePath;
}

- (SUUIConfigurationPreloader)init
{
  void *v3;
  SUUIConfigurationPreloader *v4;

  +[SUUIReloadConfigurationOperation cachePath](SUUIReloadConfigurationOperation, "cachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUUIConfigurationPreloader initWithConfigurationCachePath:](self, "initWithConfigurationCachePath:", v3);

  return v4;
}

- (SUUIConfigurationPreloader)initWithConfigurationCachePath:(id)a3
{
  id v4;
  SUUIConfigurationPreloader *v5;
  uint64_t v6;
  NSString *configurationCachePath;
  NSOperationQueue *v8;
  NSOperationQueue *workQueue;
  NSMutableArray *v10;
  NSMutableArray *completionBlocks;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIConfigurationPreloader;
  v5 = -[SUUIConfigurationPreloader init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configurationCachePath = v5->_configurationCachePath;
    v5->_configurationCachePath = (NSString *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    workQueue = v5->_workQueue;
    v5->_workQueue = v8;

    -[NSOperationQueue setName:](v5->_workQueue, "setName:", CFSTR("com.apple.storekit.configurationpreloader"));
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    completionBlocks = v5->_completionBlocks;
    v5->_completionBlocks = v10;

  }
  return v5;
}

- (id)newReloadConfigurationOperation
{
  return objc_alloc_init(SUUIReloadConfigurationOperation);
}

void __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_2;
    v9[3] = &unk_2511F4798;
    v9[4] = WeakRetained;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "addOperationWithBlock:", v9);

  }
}

uint64_t __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishPreloadingConfiguration:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __81__SUUIConfigurationPreloader_preloadConfigurationForPurpose_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "loadedConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)finishPreloadingConfiguration:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUUIConfigurationPreloader setLoadedConfiguration:](self, "setLoadedConfiguration:", v6);
  -[SUUIConfigurationPreloader setPendingReloadOperation:](self, "setPendingReloadOperation:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SUUIConfigurationPreloader completionBlocks](self, "completionBlocks", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[SUUIConfigurationPreloader completionBlocks](self, "completionBlocks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (SUUIReloadConfigurationOperation)pendingReloadOperation
{
  return self->_pendingReloadOperation;
}

- (void)setPendingReloadOperation:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReloadOperation, a3);
}

- (void)setLoadedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_loadedConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedConfiguration, 0);
  objc_storeStrong((id *)&self->_pendingReloadOperation, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_configurationCachePath, 0);
}

@end
