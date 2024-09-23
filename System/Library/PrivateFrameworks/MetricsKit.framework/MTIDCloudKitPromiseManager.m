@implementation MTIDCloudKitPromiseManager

- (MTIDCloudKitPromiseManager)initWithCallbackQueue:(id)a3
{
  id v4;
  MTIDCloudKitPromiseManager *v5;
  MTIDCloudKitPromiseManager *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTIDCloudKitPromiseManager;
  v5 = -[MTIDCloudKitPromiseManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MTIDCloudKitPromiseManager setCallbackQueue:](v5, "setCallbackQueue:", v4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDCloudKitPromiseManager setDict:](v6, "setDict:", v7);

  }
  return v6;
}

- (id)waitForRecordToSync:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MTPromiseWithTimeout *v10;
  void *v11;
  id v12;
  MTPromiseWithTimeout *v13;
  MTIDCloudKitPromiseManager *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id location;

  v6 = a3;
  if (objc_msgSend(v6, "mt_isSynchronized"))
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(v6, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [MTPromiseWithTimeout alloc];
    -[MTIDCloudKitPromiseManager callbackQueue](self, "callbackQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __58__MTIDCloudKitPromiseManager_waitForRecordToSync_timeout___block_invoke;
    v22 = &unk_24C7A1528;
    v23 = v6;
    objc_copyWeak(&v25, &location);
    v12 = v9;
    v24 = v12;
    v13 = -[MTPromiseWithTimeout initWithTimeout:queue:timeoutBlock:](v10, "initWithTimeout:queue:timeoutBlock:", v11, &v19, a4);

    v14 = self;
    objc_sync_enter(v14);
    -[MTIDCloudKitPromiseManager dict](v14, "dict", v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDCloudKitPromiseManager dict](v14, "dict");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v12);

    }
    objc_msgSend(v16, "addObject:", v13);

    objc_sync_exit(v14);
    -[MTPromiseWithTimeout promise](v13, "promise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __58__MTIDCloudKitPromiseManager_waitForRecordToSync_timeout___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "finishWithResult:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5, "dict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObject:", v8);
    objc_sync_exit(v5);

  }
}

- (void)finishPromisesOfRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTIDCloudKitPromiseManager *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self;
  objc_sync_enter(v7);
  -[MTIDCloudKitPromiseManager dict](v7, "dict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MTIDCloudKitPromiseManager dict](v7, "dict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v6);

    objc_sync_exit(v7);
    -[MTIDCloudKitPromiseManager callbackQueue](v7, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__MTIDCloudKitPromiseManager_finishPromisesOfRecord___block_invoke;
    v12[3] = &unk_24C7A0F90;
    v13 = v9;
    v14 = v4;
    dispatch_async(v11, v12);

  }
  else
  {
    objc_sync_exit(v7);

  }
}

void __53__MTIDCloudKitPromiseManager_finishPromisesOfRecord___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "finishWithResult:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
  objc_storeStrong((id *)&self->_dict, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
