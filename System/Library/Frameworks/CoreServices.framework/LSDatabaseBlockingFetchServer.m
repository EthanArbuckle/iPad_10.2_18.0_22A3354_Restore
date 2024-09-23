@implementation LSDatabaseBlockingFetchServer

- (id)_init
{
  LSDatabaseBlockingFetchServer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSXPCListener *listener;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LSDatabaseBlockingFetchServer;
  v2 = -[LSDatabaseBlockingFetchServer init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.lsd.LSDatabaseBlockingFetchServer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v6 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    v2->_running = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__LSDatabaseBlockingFetchServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance_sharedServer;
}

void __47__LSDatabaseBlockingFetchServer_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedInstance_sharedServer;
  sharedInstance_sharedServer = v1;

}

- (void)startRunningIfNecessary
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__LSDatabaseBlockingFetchServer_startRunningIfNecessary__block_invoke;
  block[3] = &unk_1E1040478;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__LSDatabaseBlockingFetchServer_startRunningIfNecessary__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 16), "resume");
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 24) = 1;
  }
  return result;
}

- (id)getEndpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (void)setBlockingIsForManualRebuild:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_forManualRebuild);
}

- (BOOL)isForManualRebuild
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_forManualRebuild);
  return v2 & 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  LSDatabaseBlockingFetchClient *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id from;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "_setQueue:", self->_queue);
  LSDatabaseBlockingFetchInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  v9 = -[LSDatabaseBlockingFetchClient initWithXPCConnection:]([LSDatabaseBlockingFetchClient alloc], "initWithXPCConnection:", v7);
  objc_msgSend(v7, "setExportedObject:", v9);

  from = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __68__LSDatabaseBlockingFetchServer_listener_shouldAcceptNewConnection___block_invoke;
  v14 = &unk_1E10403D8;
  objc_copyWeak(&v15, &from);
  objc_msgSend(v7, "setInvalidationHandler:", &v11);
  objc_msgSend(v7, "resume", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);

  return 1;
}

void __68__LSDatabaseBlockingFetchServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExportedObject:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
