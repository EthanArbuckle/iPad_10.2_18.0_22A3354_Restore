@implementation FMNSXPCConnectionCache

void __37__FMNSXPCConnectionCache_sharedCache__block_invoke()
{
  FMNSXPCConnectionCache *v0;
  void *v1;

  v0 = objc_alloc_init(FMNSXPCConnectionCache);
  v1 = (void *)sharedCache__instance;
  sharedCache__instance = (uint64_t)v0;

}

- (FMNSXPCConnectionCache)init
{
  FMNSXPCConnectionCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *modsSerialQueue;
  uint64_t v5;
  NSMutableDictionary *connectionsByServiceName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMNSXPCConnectionCache;
  v2 = -[FMNSXPCConnectionCache init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("FMD-NSXPC-Mods-Queue", 0);
    modsSerialQueue = v2->_modsSerialQueue;
    v2->_modsSerialQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    connectionsByServiceName = v2->_connectionsByServiceName;
    v2->_connectionsByServiceName = (NSMutableDictionary *)v5;

  }
  return v2;
}

void __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FMNSXPCConnection *v4;
  void *v5;
  FMNSXPCCachedConnection *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "connectionsByServiceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || objc_msgSend(v3, "state") != 1)
  {
    v4 = -[FMNSXPCConnection initWithConfiguration:]([FMNSXPCConnection alloc], "initWithConfiguration:", *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "connectionsByServiceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

    objc_initWeak(&location, *(id *)(a1 + 32));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke_2;
    v9[3] = &unk_1E829C228;
    objc_copyWeak(&v11, &location);
    v10 = *(id *)(a1 + 40);
    -[FMNSXPCConnection addFailureBlock:](v4, "addFailureBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    v3 = v4;
  }
  v6 = -[FMNSXPCCachedConnection initWithFMNSXPCConnection:]([FMNSXPCCachedConnection alloc], "initWithFMNSXPCConnection:", v3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (NSMutableDictionary)connectionsByServiceName
{
  return self->_connectionsByServiceName;
}

- (id)resumeConnectionWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
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
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FMNSXPCConnectionCache modsSerialQueue](self, "modsSerialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke;
    v10[3] = &unk_1E829C250;
    v10[4] = self;
    v11 = v5;
    v12 = v4;
    v13 = &v14;
    dispatch_sync(v6, v10);

    v7 = (id)v15[5];
  }
  else
  {
    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FMNSXPCConnectionCache resumeConnectionWithConfiguration:].cold.1(v8);

    v7 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (OS_dispatch_queue)modsSerialQueue
{
  return self->_modsSerialQueue;
}

+ (FMNSXPCConnectionCache)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global);
  return (FMNSXPCConnectionCache *)(id)sharedCache__instance;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[FMNSXPCConnectionCache modsSerialQueue](self, "modsSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FMNSXPCConnectionCache_dealloc__block_invoke;
  block[3] = &unk_1E829C1D8;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)FMNSXPCConnectionCache;
  -[FMNSXPCConnectionCache dealloc](&v4, sel_dealloc);
}

void __33__FMNSXPCConnectionCache_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connectionsByServiceName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &__block_literal_global_4);

}

uint64_t __33__FMNSXPCConnectionCache_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

void __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "modsSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, WeakRetained);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke_3;
    block[3] = &unk_1E829C200;
    objc_copyWeak(&v6, &location);
    v5 = *(id *)(a1 + 32);
    dispatch_async(v3, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "connectionsByServiceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (void)setModsSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_modsSerialQueue, a3);
}

- (void)setConnectionsByServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_connectionsByServiceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionsByServiceName, 0);
  objc_storeStrong((id *)&self->_modsSerialQueue, 0);
}

- (void)resumeConnectionWithConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9939000, log, OS_LOG_TYPE_ERROR, "FMDNSXPCConnectionCache Invalid configuration", v1, 2u);
}

@end
