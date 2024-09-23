@implementation MCDMediaRemoteSerialQueueManager

+ (MCDMediaRemoteSerialQueueManager)sharedInstance
{
  if (sharedInstance_isDispatched_0 != -1)
    dispatch_once(&sharedInstance_isDispatched_0, &__block_literal_global_1);
  return (MCDMediaRemoteSerialQueueManager *)(id)sharedInstance_sharedMRInstance;
}

void __50__MCDMediaRemoteSerialQueueManager_sharedInstance__block_invoke()
{
  MCDMediaRemoteSerialQueueManager *v0;
  void *v1;

  v0 = objc_alloc_init(MCDMediaRemoteSerialQueueManager);
  v1 = (void *)sharedInstance_sharedMRInstance;
  sharedInstance_sharedMRInstance = (uint64_t)v0;

}

- (MCDMediaRemoteSerialQueueManager)init
{
  MCDMediaRemoteSerialQueueManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *mediaRemoteSerialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDMediaRemoteSerialQueueManager;
  v2 = -[MCDMediaRemoteSerialQueueManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    mediaRemoteSerialQueue = v2->_mediaRemoteSerialQueue;
    v2->_mediaRemoteSerialQueue = v3;

    -[NSOperationQueue setName:](v2->_mediaRemoteSerialQueue, "setName:", CFSTR("com.apple.MCDSerialProcessingQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_mediaRemoteSerialQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v2;
}

- (void)cancelAllOperations
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  MCDGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FBAA000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all operations on MCDMediaRemoteSerialQueueManager", v5, 2u);
  }

  -[MCDMediaRemoteSerialQueueManager mediaRemoteSerialQueue](self, "mediaRemoteSerialQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

}

- (void)addOperation:(id)a3 cancelAllOperations:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDD1478]);
  objc_initWeak(&location, v7);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__MCDMediaRemoteSerialQueueManager_addOperation_cancelAllOperations___block_invoke;
  v10[3] = &unk_24FD78958;
  objc_copyWeak(&v12, &location);
  v13 = a4;
  v10[4] = self;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "addExecutionBlock:", v10);
  -[MCDMediaRemoteSerialQueueManager mediaRemoteSerialQueue](self, "mediaRemoteSerialQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __69__MCDMediaRemoteSerialQueueManager_addOperation_cancelAllOperations___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if (v3)
  {
    MCDGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Operation is cancelled, not executing", v5, 2u);
    }

  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 32), "cancelAllOperations");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (NSOperationQueue)mediaRemoteSerialQueue
{
  return self->_mediaRemoteSerialQueue;
}

- (void)setMediaRemoteSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteSerialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteSerialQueue, 0);
}

@end
