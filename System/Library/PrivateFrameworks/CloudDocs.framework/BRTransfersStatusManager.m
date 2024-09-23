@implementation BRTransfersStatusManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend((id)objc_opt_new(), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 2);
    v3 = (void *)g_transferManagerForPersona;
    g_transferManagerForPersona = v2;

  }
}

- (BRTransfersStatusManager)initWithPersonaIdentifier:(id)a3
{
  id v5;
  BRTransfersStatusManager *v6;
  NSMutableArray *v7;
  NSMutableArray *transfers;
  NSOperationQueue *v9;
  NSOperationQueue *operationQueue;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRTransfersStatusManager;
  v6 = -[BRTransfersStatusManager init](&v16, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transfers = v6->_transfers;
    v6->_transfers = v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("status-manager", v12);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v6->_personaIdentifier, a3);
    -[BRTransfersStatusManager _progressSubscription](v6, "_progressSubscription");
  }

  return v6;
}

- (void)dealloc
{
  id v3;
  BRTransfersStatusManager *v4;
  id globalProgressSubscriber;
  objc_super v6;

  v3 = (id)g_transferManagerForPersona;
  objc_sync_enter(v3);
  objc_msgSend((id)g_transferManagerForPersona, "removeObjectForKey:", self->_personaIdentifier);
  objc_sync_exit(v3);

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_globalProgressSubscriber)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:");
    globalProgressSubscriber = v4->_globalProgressSubscriber;
    v4->_globalProgressSubscriber = 0;

  }
  objc_sync_exit(v4);

  v6.receiver = v4;
  v6.super_class = (Class)BRTransfersStatusManager;
  -[BRTransfersStatusManager dealloc](&v6, sel_dealloc);
}

+ (id)defaultManager
{
  void *v2;
  id v3;
  BRTransfersStatusManager *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)g_transferManagerForPersona;
  objc_sync_enter(v3);
  objc_msgSend((id)g_transferManagerForPersona, "objectForKey:", v2);
  v4 = (BRTransfersStatusManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[BRTransfersStatusManager initWithPersonaIdentifier:]([BRTransfersStatusManager alloc], "initWithPersonaIdentifier:", v2);
    objc_msgSend((id)g_transferManagerForPersona, "setObject:forKey:", v4, v2);
  }
  objc_sync_exit(v3);

  return v4;
}

- (NSArray)transfers
{
  BRTransfersStatusManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_transfers, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)downloadAndObserveItemAtURL:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  BRFileProvidingOperation *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BRFileProvidingOperation *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  BRFileProvidingOperation *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = -[BRFileProvidingOperation initWithURL:readingOptions:]([BRFileProvidingOperation alloc], "initWithURL:readingOptions:", v7, 131073);
  -[BRTransfersStatusManager startObservingItemDownloadProgressAtURL:](self, "startObservingItemDownloadProgressAtURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCancellable:", 1);
  objc_msgSend(v9, "cancellationHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__BRTransfersStatusManager_downloadAndObserveItemAtURL_handler___block_invoke;
  v19[3] = &unk_1E3DA5150;
  v20 = v8;
  v21 = v10;
  v12 = v8;
  v13 = v10;
  objc_msgSend(v9, "setCancellationHandler:", v19);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __64__BRTransfersStatusManager_downloadAndObserveItemAtURL_handler___block_invoke_2;
  v16[3] = &unk_1E3DA6350;
  v17 = v9;
  v18 = v6;
  v16[4] = self;
  v14 = v9;
  v15 = v6;
  -[BRFileProvidingOperation setFileProvidingCompletion:](v12, "setFileProvidingCompletion:", v16);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12);

}

uint64_t __64__BRTransfersStatusManager_downloadAndObserveItemAtURL_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __64__BRTransfersStatusManager_downloadAndObserveItemAtURL_handler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stopObservingItemDownloadProgress:", *(_QWORD *)(a1 + 40));
}

- (id)startObservingItemDownloadProgressAtURL:(id)a3
{
  id v4;
  BRDownloadProgressProxy *v5;
  BRTransfersStatusManager *v6;
  unint64_t shouldHideGlobalDownloadProgressCount;

  v4 = a3;
  v5 = -[BRDownloadProgressProxy initWithURL:]([BRDownloadProgressProxy alloc], "initWithURL:", v4);
  -[BRDownloadProgressProxy start](v5, "start");
  v6 = self;
  objc_sync_enter(v6);
  shouldHideGlobalDownloadProgressCount = v6->_shouldHideGlobalDownloadProgressCount;
  if (!shouldHideGlobalDownloadProgressCount)
  {
    if (v6->_globalDownloadProgress)
    {
      -[BRTransfersStatusManager removeTransfer:](v6, "removeTransfer:");
      shouldHideGlobalDownloadProgressCount = v6->_shouldHideGlobalDownloadProgressCount;
    }
    else
    {
      shouldHideGlobalDownloadProgressCount = 0;
    }
  }
  v6->_shouldHideGlobalDownloadProgressCount = shouldHideGlobalDownloadProgressCount + 1;
  -[BRTransfersStatusManager addTransfer:](v6, "addTransfer:", v5);
  objc_sync_exit(v6);

  return v5;
}

- (void)stopObservingItemDownloadProgress:(id)a3
{
  id v4;
  BRTransfersStatusManager *v5;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  --v5->_shouldHideGlobalDownloadProgressCount;
  -[BRTransfersStatusManager removeTransfer:](v5, "removeTransfer:", v4);
  queue = v5->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__BRTransfersStatusManager_stopObservingItemDownloadProgress___block_invoke;
  block[3] = &unk_1E3DA4738;
  block[4] = v5;
  dispatch_async(queue, block);
  objc_sync_exit(v5);

  objc_msgSend(v4, "stop");
}

uint64_t __62__BRTransfersStatusManager_stopObservingItemDownloadProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupTimerToDisplayGlobalProgress");
}

- (void)showGlobalProgressIfNeeded
{
  NSProgress *globalDownloadProgress;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_shouldHideGlobalDownloadProgressCount)
  {
    globalDownloadProgress = self->_globalDownloadProgress;
    if (globalDownloadProgress)
      -[BRTransfersStatusManager insertTransfer:atIndex:](self, "insertTransfer:atIndex:", globalDownloadProgress, 0);
  }
}

- (void)_setupTimerToDisplayGlobalProgress
{
  NSObject *timerToDisplayGlobalProgress;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  NSObject *v6;
  dispatch_time_t v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  _QWORD *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  dispatch_block_t v15;
  _QWORD v16[4];
  id v17;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timerToDisplayGlobalProgress = self->_timerToDisplayGlobalProgress;
  if (timerToDisplayGlobalProgress)
    dispatch_source_cancel(timerToDisplayGlobalProgress);
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v5 = self->_timerToDisplayGlobalProgress;
  self->_timerToDisplayGlobalProgress = v4;

  v6 = self->_timerToDisplayGlobalProgress;
  v7 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x2CB41780uLL);
  objc_initWeak(&location, self);
  v8 = self->_timerToDisplayGlobalProgress;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__BRTransfersStatusManager__setupTimerToDisplayGlobalProgress__block_invoke;
  v16[3] = &unk_1E3DA5870;
  objc_copyWeak(&v17, &location);
  v9 = v8;
  v10 = v16;
  v11 = v9;
  v12 = v10;
  v13 = v12;
  v14 = v12;
  if (brc_block_remember_persona)
  {
    brc_block_remember_persona(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v14);
  dispatch_source_set_event_handler(v11, v15);

  dispatch_resume((dispatch_object_t)self->_timerToDisplayGlobalProgress);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __62__BRTransfersStatusManager__setupTimerToDisplayGlobalProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showGlobalProgressIfNeeded");

}

- (void)removeTransfer:(id)a3
{
  BRTransfersStatusManager *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableArray indexOfObject:](v4->_transfers, "indexOfObject:", v7);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRTransfersStatusManager willChange:valuesAtIndexes:forKey:](v4, "willChange:valuesAtIndexes:forKey:", 3, v6, CFSTR("transfers"));
    -[NSMutableArray removeObject:](v4->_transfers, "removeObject:", v7);
    -[BRTransfersStatusManager didChange:valuesAtIndexes:forKey:](v4, "didChange:valuesAtIndexes:forKey:", 3, v6, CFSTR("transfers"));

  }
  objc_sync_exit(v4);

}

- (void)addTransfer:(id)a3
{
  BRTransfersStatusManager *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableArray count](v4->_transfers, "count");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRTransfersStatusManager willChange:valuesAtIndexes:forKey:](v4, "willChange:valuesAtIndexes:forKey:", 2, v6, CFSTR("transfers"));
  -[NSMutableArray addObject:](v4->_transfers, "addObject:", v7);
  -[BRTransfersStatusManager didChange:valuesAtIndexes:forKey:](v4, "didChange:valuesAtIndexes:forKey:", 2, v6, CFSTR("transfers"));

  objc_sync_exit(v4);
}

- (void)insertTransfer:(id)a3 atIndex:(unint64_t)a4
{
  BRTransfersStatusManager *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRTransfersStatusManager willChange:valuesAtIndexes:forKey:](v6, "willChange:valuesAtIndexes:forKey:", 2, v7, CFSTR("transfers"));
  -[NSMutableArray insertObject:atIndex:](v6->_transfers, "insertObject:atIndex:", v8, 0);
  -[BRTransfersStatusManager didChange:valuesAtIndexes:forKey:](v6, "didChange:valuesAtIndexes:forKey:", 2, v7, CFSTR("transfers"));

  objc_sync_exit(v6);
}

- (void)_setGlobalProgress:(id)a3 forIvar:(id *)a4
{
  BRTransfersStatusManager *v7;
  id v8;

  v8 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (*a4)
    -[BRTransfersStatusManager removeTransfer:](v7, "removeTransfer:");
  objc_storeStrong(a4, a3);
  if (v8 && (!v7->_shouldHideGlobalDownloadProgressCount || &v7->_globalDownloadProgress != (NSProgress **)a4))
    -[BRTransfersStatusManager insertTransfer:atIndex:](v7, "insertTransfer:atIndex:", v8, 0);
  objc_sync_exit(v7);

}

- (void)_progressSubscription
{
  void *v3;
  BRTransfersStatusManager *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id globalProgressSubscriber;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__BRTransfersStatusManager__progressSubscription__block_invoke;
  v9[3] = &unk_1E3DA6378;
  v9[4] = self;
  v3 = (void *)MEMORY[0x1A1AD85E4](v9, a2);
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x1E0CB38A8];
  +[BRDaemonConnection mobileDocumentsURL](BRDaemonConnection, "mobileDocumentsURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addSubscriberForFileURL:withPublishingHandler:", v6, v3);
  v7 = objc_claimAutoreleasedReturnValue();
  globalProgressSubscriber = v4->_globalProgressSubscriber;
  v4->_globalProgressSubscriber = (id)v7;

  objc_sync_exit(v4);
}

id __49__BRTransfersStatusManager__progressSubscription__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char *v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB30B8]))
  {
    v7 = *(char **)(a1 + 32);
    v8 = v7 + 32;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB30E0]))
    {
      objc_sync_exit(v6);

      v15 = 0;
      goto LABEL_7;
    }
    v7 = *(char **)(a1 + 32);
    v8 = v7 + 24;
  }
  objc_msgSend(v7, "_setGlobalProgress:forIvar:", v3, v8);
  objc_sync_exit(v6);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__BRTransfersStatusManager__progressSubscription__block_invoke_2;
  v17[3] = &unk_1E3DA4A70;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v19 = v10;
  v11 = (void *)objc_msgSend(v17, "copy");
  v15 = (void *)MEMORY[0x1A1AD85E4](v11, v12, v13, v14);

LABEL_7:
  return v15;
}

uint64_t __49__BRTransfersStatusManager__progressSubscription__block_invoke_2(uint64_t a1)
{
  char *v2;
  char *v3;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CB30B8]))
  {
    v2 = *(char **)(a1 + 40);
    v3 = v2 + 32;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CB30E0]);
    if (!(_DWORD)result)
      return result;
    v2 = *(char **)(a1 + 40);
    v3 = v2 + 24;
  }
  return objc_msgSend(v2, "_setGlobalProgress:forIvar:", 0, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerToDisplayGlobalProgress, 0);
  objc_storeStrong(&self->_globalProgressSubscriber, 0);
  objc_storeStrong((id *)&self->_globalDownloadProgress, 0);
  objc_storeStrong((id *)&self->_globalUploadProgress, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_transfers, 0);
}

@end
