@implementation MRAVRoutingClientController

uint64_t __68__MRAVRoutingClientController__pickableRoutesDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

- (MRAVRoutingClientController)initWithMediaRemoteService:(id)a3
{
  id v6;
  MRAVRoutingClientController *v7;
  objc_class *v8;
  const char *Name;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *callbackQueue;
  NSMutableDictionary *v16;
  NSMutableDictionary *pendingCompletionHandlersForCategories;
  NSMutableDictionary *v18;
  NSMutableDictionary *cachedRoutesForCategories;
  void *v20;
  void *v22;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MRAVRoutingClientController;
  v7 = -[MRAVRoutingClientController init](&v23, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MRAVRoutingClientController.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

    }
    objc_storeStrong((id *)&v7->_mediaRemoteService, a3);
    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(Name, v10);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.mediaremote.MRAVRoutingClientController.callbackQueue", v13);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingCompletionHandlersForCategories = v7->_pendingCompletionHandlersForCategories;
    v7->_pendingCompletionHandlersForCategories = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedRoutesForCategories = v7->_cachedRoutesForCategories;
    v7->_cachedRoutesForCategories = v18;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, sel__pickableRoutesDidChangeNotification_, CFSTR("kMRMediaRemotePickableRoutesDidChangeNotification"), 0);

  }
  return v7;
}

- (void)_pickableRoutesDidChangeNotification:(id)a3
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MRAVRoutingClientController__pickableRoutesDidChangeNotification___block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __71__MRAVRoutingClientController__cacheFetchedPickableRoutes_forCategory___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 40);
  if (v2)
    return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
  else
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
}

- (void)fetchPickableRoutesForCategory:(id)a3 completion:(id)a4
{
  __CFString *v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  __CFString *v10;
  _QWORD block[5];
  __CFString *v12;
  id v13;

  v6 = (__CFString *)a3;
  v7 = a4;
  if (!v6)
    v6 = CFSTR("MRAVRoutingActiveCategoryName");
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke;
  block[3] = &unk_1E30CA5C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(serialQueue, block);

}

void __93__MRAVRoutingClientController__flushPendingCompletionHandlersWithPickableRoutes_forCategory___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(v5, "removeAllObjects");
}

void __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke_2(uint64_t a1, void *a2)
{
  -[MRAVRoutingClientController _cacheFetchedPickableRoutes:forCategory:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));
  -[MRAVRoutingClientController _flushPendingCompletionHandlersWithPickableRoutes:forCategory:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));

}

- (void)_flushPendingCompletionHandlersWithPickableRoutes:(void *)a3 forCategory:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__29;
    v24 = __Block_byref_object_dispose__29;
    v25 = 0;
    v8 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__MRAVRoutingClientController__flushPendingCompletionHandlersWithPickableRoutes_forCategory___block_invoke;
    block[3] = &unk_1E30C8C28;
    block[4] = a1;
    v18 = v6;
    v19 = &v20;
    dispatch_sync(v8, block);
    if (!v5)
      v5 = (id)MEMORY[0x1E0C9AA60];
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = (id)v21[5];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
      }
      while (v10);
    }

    _Block_object_dispose(&v20, 8);
  }

}

- (void)_cacheFetchedPickableRoutes:(void *)a3 forCategory:
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__MRAVRoutingClientController__cacheFetchedPickableRoutes_forCategory___block_invoke;
    block[3] = &unk_1E30C7328;
    v9 = v7;
    v10 = a1;
    v11 = v5;
    dispatch_sync(v6, block);

  }
}

void __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  _QWORD v18[5];
  __CFString *v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  }
  v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "addObject:", v4);

  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke_3;
      block[3] = &unk_1E30C7328;
      block[4] = v7;
      v16 = v5;
      v17 = *(id *)(a1 + 40);
      dispatch_async(v8, block);

    }
    else
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(__CFString **)(a1 + 40);
      if (v9 == CFSTR("MRAVRoutingActiveCategoryName"))
        v11 = 0;
      else
        v11 = *(void **)(a1 + 40);
      v12 = *(void **)(v10 + 8);
      v13 = *(void **)(v10 + 24);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke_2;
      v18[3] = &unk_1E30CC1A8;
      v18[4] = v10;
      v19 = v9;
      v14 = v11;
      MRMediaRemoteServiceCopyPickableRoutes(v12, v14, v13, v18);

    }
  }

}

void __73__MRAVRoutingClientController_fetchPickableRoutesForCategory_completion___block_invoke_3(uint64_t a1)
{
  -[MRAVRoutingClientController _flushPendingCompletionHandlersWithPickableRoutes:forCategory:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (MRAVRoutingClientController)init
{
  return -[MRAVRoutingClientController initWithMediaRemoteService:](self, "initWithMediaRemoteService:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRAVRoutingClientController;
  -[MRAVRoutingClientController dealloc](&v4, sel_dealloc);
}

- (MRMediaRemoteService)mediaRemoteService
{
  return self->_mediaRemoteService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRoutesForCategories, 0);
  objc_storeStrong((id *)&self->_pendingCompletionHandlersForCategories, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_mediaRemoteService, 0);
}

@end
