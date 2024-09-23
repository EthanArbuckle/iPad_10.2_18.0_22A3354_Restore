@implementation NMSInitialCloudLibraryImportObserver

- (NMSInitialCloudLibraryImportObserver)init
{
  NMSInitialCloudLibraryImportObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  NSMutableArray *v6;
  NSMutableArray *initialImportBlocks;
  id v8;
  void *v9;
  uint64_t v10;
  ICCloudClient *cloudClient;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NMSInitialCloudLibraryImportObserver;
  v2 = -[NMSInitialCloudLibraryImportObserver init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NanoMusicSync.InitialCloudLibraryImportObserver", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    initialImportBlocks = v2->_initialImportBlocks;
    v2->_initialImportBlocks = v6;

    v8 = objc_alloc(MEMORY[0x24BEC8778]);
    objc_msgSend(MEMORY[0x24BEC8A58], "autoupdatingActiveAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithUserIdentity:", v9);
    cloudClient = v2->_cloudClient;
    v2->_cloudClient = (ICCloudClient *)v10;

  }
  return v2;
}

- (void)performBlockWhenLibraryIsReady:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__NMSInitialCloudLibraryImportObserver_performBlockWhenLibraryIsReady___block_invoke;
  v7[3] = &unk_24D646F98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __71__NMSInitialCloudLibraryImportObserver_performBlockWhenLibraryIsReady___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)MEMORY[0x219A03B50](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 16))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_ICCloudClientInitialCloudLibraryImportCompletedNotification, (CFStringRef)*MEMORY[0x24BEC84E0], 0, (CFNotificationSuspensionBehavior)0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
    v4 = *(_QWORD *)(a1 + 32);
  }
  v6 = objc_msgSend(*(id *)(v4 + 24), "initialLibrarySyncsComplete");
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "[NMSInitialCloudLibraryImportObserver] Initial library syncs complete. Performing initial import blocks.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_performInitialImportBlocks");
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "[NMSInitialCloudLibraryImportObserver] Initial library syncs are not complete. Waiting for ICCloudClientInitialCloudLibraryImportCompletedNotification.", v9, 2u);
    }

  }
}

- (void)_handleInitialCloudLibraryImportCompleted
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NMSInitialCloudLibraryImportObserver__handleInitialCloudLibraryImportCompleted__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __81__NMSInitialCloudLibraryImportObserver__handleInitialCloudLibraryImportCompleted__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 16))
  {
    v1 = result;
    NMLogForCategory(5);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[NMSInitialCloudLibraryImportObserver] Received ICCloudClientInitialCloudLibraryImportCompletedNotification. Performing initial import blocks.", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "_performInitialImportBlocks");
  }
  return result;
}

- (void)_performInitialImportBlocks
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC84E0], 0);

  self->_isObserving = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_initialImportBlocks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_initialImportBlocks, "removeAllObjects", (_QWORD)v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
  objc_storeStrong((id *)&self->_initialImportBlocks, 0);
}

@end
