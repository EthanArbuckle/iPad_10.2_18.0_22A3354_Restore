@implementation MRMediaRemoteServiceClient

void __50__MRMediaRemoteServiceClient_setActivePlayerPath___block_invoke(uint64_t a1)
{
  -[MRMediaRemoteServiceClient _onQueue_setActivePlayerPath:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __77__MRMediaRemoteServiceClient_processPlayerPathInvalidationHandlersWithBlock___block_invoke(uint64_t a1)
{
  -[MRMediaRemoteServiceClient _onQueue_processPlayerPathInvalidationHandlersWithBlock:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)processPlayerPathInvalidationHandlersWithBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__MRMediaRemoteServiceClient_processPlayerPathInvalidationHandlersWithBlock___block_invoke;
  v7[3] = &unk_1E30C5B40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)setActivePlayerPath:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MRMediaRemoteServiceClient_setActivePlayerPath___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (MRNotificationClient)notificationClient
{
  return self->_notificationClient;
}

- (void)_onQueue_setActivePlayerPath:(uint64_t)a1
{
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (a1)
  {
    v5 = *(void **)(a1 + 24);
    v4 = (uint64_t *)(a1 + 24);
    v6 = v5;
    if (v6 == v3)
    {

    }
    else
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "isEqual:", v3);

      if ((v8 & 1) == 0)
      {
        _MRLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[MRMediaRemoteServiceClient _onQueue_setActivePlayerPath:].cold.1(v4, (uint64_t)v3, v9);

        v10 = objc_msgSend(v3, "copy");
        v11 = (void *)*v4;
        *v4 = v10;

      }
    }
  }

}

- (void)_onQueue_processPlayerPathInvalidationHandlersWithBlock:(uint64_t)a1
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v3 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __86__MRMediaRemoteServiceClient__onQueue_processPlayerPathInvalidationHandlersWithBlock___block_invoke;
    v5[3] = &unk_1E30CAF80;
    v5[4] = a1;
    v6 = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  }
}

- (OS_dispatch_queue)playbackQueueDispatchQueue
{
  return self->_playbackQueueDispatchQueue;
}

void __49__MRMediaRemoteServiceClient_sharedServiceClient__block_invoke()
{
  MRMediaRemoteServiceClient *v0;
  void *v1;

  v0 = objc_alloc_init(MRMediaRemoteServiceClient);
  v1 = (void *)sharedServiceClient___sharedServiceClient;
  sharedServiceClient___sharedServiceClient = (uint64_t)v0;

}

- (MRMediaRemoteServiceClient)init
{
  id v2;
  MRMediaRemoteService *v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  MRAVRoutingClientController *v8;
  void *v9;
  MRNotificationServiceClient *v10;
  void *v11;
  MRNotificationClient *v12;
  void *v13;
  MRNowPlayingSessionServiceClient *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)MRMediaRemoteServiceClient;
  v2 = -[MRMediaRemoteServiceClient init](&v33, sel_init);
  if (v2)
  {
    v3 = MRMediaRemoteServiceCreate();
    v4 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.MediaRemote.MRMediaRemoteServiceClient.accessQueue", v5);
    v7 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v6;

    v8 = -[MRAVRoutingClientController initWithMediaRemoteService:]([MRAVRoutingClientController alloc], "initWithMediaRemoteService:", *((_QWORD *)v2 + 13));
    v9 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v8;

    v10 = -[MRNotificationServiceClient initWithServiceClient:]([MRNotificationServiceClient alloc], "initWithServiceClient:", v2);
    v11 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v10;

    v12 = objc_alloc_init(MRNotificationClient);
    v13 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v12;

    v14 = -[MRNowPlayingSessionServiceClient initWithService:]([MRNowPlayingSessionServiceClient alloc], "initWithService:", v2);
    v15 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v18;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v20;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v22;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v24;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("com.apple.MediaRemote.PlaybackQueue.serialQueue", v26);
    objc_msgSend(v2, "setPlaybackQueueDispatchQueue:", v27);

    qword_1ECF90680 = (uint64_t)v2;
    MRMediaRemoteServiceSetClientModule(*((_QWORD *)v2 + 13), (uint64_t)init___clientModule);
    -[MRMediaRemoteServiceClient _registerCallbacks]((void **)v2);
    objc_initWeak(&location, v2);
    v28 = (void *)*((_QWORD *)v2 + 13);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __34__MRMediaRemoteServiceClient_init__block_invoke;
    v30[3] = &unk_1E30C6AA0;
    objc_copyWeak(&v31, &location);
    MRMediaRemoteServiceStart(v28, v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return (MRMediaRemoteServiceClient *)v2;
}

void __34__MRMediaRemoteServiceClient_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRMediaRemoteServiceClient _initializeConnectionWithCompletion:](WeakRetained, 0);

}

- (void)setPlaybackQueueDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueDispatchQueue, a3);
}

- (void)_initializeConnectionWithCompletion:(_QWORD *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  id v13;
  uint8_t buf[16];

  v3 = a2;
  if (a1)
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "MediaRemote server initializing", buf, 2u);
    }

    objc_msgSend(a1, "activePlayerPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = (void *)a1[13];
    objc_msgSend(a1, "workerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__MRMediaRemoteServiceClient__initializeConnectionWithCompletion___block_invoke;
    v10[3] = &unk_1E30CAF08;
    v11 = v6;
    v12 = a1;
    v13 = v3;
    v9 = v6;
    MRMediaRemoteServiceResolvePlayerPath(v7, 0, v8, v10);

  }
}

- (MRPlayerPath)activePlayerPath
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__24;
  v8 = __Block_byref_object_dispose__24;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRPlayerPath *)v2;
}

+ (id)sharedServiceClient
{
  if (sharedServiceClient___once != -1)
    dispatch_once(&sharedServiceClient___once, &__block_literal_global_55);
  return (id)sharedServiceClient___sharedServiceClient;
}

- (MRMediaRemoteService)service
{
  return self->_service;
}

- (void)removeDistantEndpoint:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakEndpoints;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_weakEndpoints, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (OS_dispatch_queue)workerQueue
{
  return (OS_dispatch_queue *)dispatch_get_global_queue(0, 0);
}

- (void)_registerCallbacks
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v2 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke;
    v17[3] = &unk_1E30C6AA0;
    objc_copyWeak(&v18, &location);
    v3 = (void *)MEMORY[0x194036C44](v17);
    v15[0] = v2;
    v15[1] = 3221225472;
    v15[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_2;
    v15[3] = &unk_1E30C6AA0;
    objc_copyWeak(&v16, &location);
    v4 = (void *)MEMORY[0x194036C44](v15);
    MRMediaRemoteServiceSetInvalidationHandler(val[13], v3);
    MRMediaRemoteServiceSetResumeHandler(val[13], v4);
    objc_msgSend(val[13], "mrXPCConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v2;
    v11 = 3221225472;
    v12 = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_3;
    v13 = &unk_1E30CAE98;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "addCustomXPCHandler:forKey:", &v10, 0x700000000000009);

    objc_msgSend(val[13], "mrXPCConnection", v10, v11, v12, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addCustomXPCHandler:forKey:", &__block_literal_global_19_0, 0x20000000000002FLL);

    objc_msgSend(val[13], "mrXPCConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addCustomXPCHandler:forKey:", &__block_literal_global_22_0, 0x400000000000007);

    objc_msgSend(val[13], "mrXPCConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addCustomXPCHandler:forKey:", &__block_literal_global_25, 0x400000000000008);

    objc_msgSend(val[13], "mrXPCConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addCustomXPCHandler:forKey:", &__block_literal_global_28_0, 0x400000000000009);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __63__MRMediaRemoteServiceClient_addPlayerPathInvalidationHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id location;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  objc_msgSend(*(id *)(a1 + 40), "playerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v6, "isLocal") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "invalidateImmediatlyIfInvalid"))
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "playerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __63__MRMediaRemoteServiceClient_addPlayerPathInvalidationHandler___block_invoke_2;
    v14 = &unk_1E30CAF30;
    objc_copyWeak(&v17, &location);
    v9 = v6;
    v10 = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v16 = v10;
    MRMediaRemoteNowPlayingResolvePlayerPath(v7, v8, &v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40), v11, v12, v13, v14);

}

void __86__MRMediaRemoteServiceClient__onQueue_processPlayerPathInvalidationHandlersWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  if (!v4
    || (objc_msgSend(v3, "playerPath"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5),
        v5,
        v7 = v8,
        v6))
  {
    -[MRMediaRemoteServiceClient _callInvalidationHandler:](*(_QWORD *)(a1 + 32), v8);
    v7 = v8;
  }

}

void __46__MRMediaRemoteServiceClient_activePlayerPath__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)fetchPickableRoutesWithCategory:(id)a3 completion:(id)a4
{
  -[MRAVRoutingClientController fetchPickableRoutesForCategory:completion:](self->_routingClientController, "fetchPickableRoutesForCategory:completion:", a3, a4);
}

void __66__MRMediaRemoteServiceClient__initializeConnectionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a2;
  if (*(id *)(a1 + 32) != v5)
    objc_msgSend(*(id *)(a1 + 40), "setActivePlayerPath:", v5);
  objc_msgSend(*(id *)(a1 + 40), "processPlayerPathInvalidationHandlersWithBlock:", &__block_literal_global_30);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

- (void)addDiscoverySession:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakDiscoverySessions;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_weakDiscoverySessions, "addObject:", v5);
  objc_sync_exit(v4);

}

- (id)addPlayerPathInvalidationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *accessQueue;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MRLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "playerPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v15 = v4;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Added PlayerPathInvalidationHandler %p for %{public}@", buf, 0x16u);

  }
  accessQueue = self->_accessQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__MRMediaRemoteServiceClient_addPlayerPathInvalidationHandler___block_invoke;
  v12[3] = &unk_1E30C5F40;
  v12[4] = self;
  v8 = v4;
  v13 = v8;
  dispatch_async(accessQueue, v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  MRMediaRemoteServiceDestroy(self->_service);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRMediaRemoteServiceClient;
  -[MRMediaRemoteServiceClient dealloc](&v4, sel_dealloc);
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRMediaRemoteServiceClient _invalidateConnection](WeakRetained);

}

- (void)_invalidateConnection
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (a1 && (MRProcessIsMediaRemoteDaemon() & 1) == 0)
  {
    _MRLogForCategory(8uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "MediaRemote server disconnected", buf, 2u);
    }

    v3 = a1[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MRMediaRemoteServiceClient__invalidateConnection__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = a1;
    dispatch_async(v3, block);
    objc_msgSend(a1, "notificationClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dispatchNotification:userInfo:object:", CFSTR("kMRMediaRemoteAvailableOriginsDidChangeNotification"), 0, 0);

  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRMediaRemoteServiceClient _resumeConnection](WeakRetained);

}

- (void)_resumeConnection
{
  NSObject *v2;
  _QWORD v3[5];
  uint8_t buf[16];

  if (a1 && (MRProcessIsMediaRemoteDaemon() & 1) == 0)
  {
    _MRLogForCategory(8uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "MediaRemote server restarted", buf, 2u);
    }

    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke;
    v3[3] = &unk_1E30C6918;
    v3[4] = a1;
    -[MRMediaRemoteServiceClient _initializeConnectionWithCompletion:](a1, v3);
  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "processPlayerPathInvalidationHandlersWithBlock:", 0);
    WeakRetained = v2;
  }

}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_5;
  v8[3] = &unk_1E30C7FA0;
  v9 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x194036C44](v8);
  MRCreateProtobufFromXPCMessage(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRServiceClientPlaybackSessionCallback((uint64_t)v6, (uint64_t)v7, v4);

}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _xpc_connection_s *v6;
  xpc_object_t reply;
  MRPlaybackSessionResponseMessage *v8;
  _xpc_connection_s *connection;

  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    connection = v6;
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      v8 = -[MRPlaybackSessionResponseMessage initWithPlaybackSession:]([MRPlaybackSessionResponseMessage alloc], "initWithPlaybackSession:", a2);
      -[MRProtocolMessage setError:](v8, "setError:", a3);
      MRAddProtobufToXPCMessage(reply, v8);
      xpc_connection_send_message(connection, reply);

    }
    v6 = connection;
  }

}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_7;
  v9[3] = &unk_1E30CAEC0;
  v10 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x194036C44](v9);
  MRCreatePlayerPathFromXPCMessage(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateProtobufFromXPCMessage(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRServiceClientPlaybackSessionMigrateRequestCallback(v5, v7, v8, v4);

}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _xpc_connection_s *v6;
  xpc_object_t reply;
  MRPlaybackSessionMigrateResponseMessage *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      v8 = -[MRPlaybackSessionMigrateResponseMessage initWithRequest:]([MRPlaybackSessionMigrateResponseMessage alloc], "initWithRequest:", v9);
      -[MRProtocolMessage setError:](v8, "setError:", v5);
      MRAddProtobufToXPCMessage(reply, v8);
      xpc_connection_send_message(v6, reply);

    }
  }

}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  MRCreateProtobufFromXPCMessage(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_9;
  v7[3] = &unk_1E30C6918;
  v8 = v2;
  v6 = v2;
  MRServiceClientPlaybackSessionMigrateBeginCallback(v4, v5, v7);

}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_9(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  xpc_object_t reply;
  MRProtocolMessage *v5;
  id v6;

  v6 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      v5 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:]([MRProtocolMessage alloc], "initWithUnderlyingCodableMessage:error:", 0, v6);
      MRAddProtobufToXPCMessage(reply, v5);

      xpc_connection_send_message(v3, reply);
    }

  }
}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  MRCreateProtobufFromXPCMessage(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_11;
  v8[3] = &unk_1E30C6918;
  v9 = v2;
  v7 = v2;
  MRServiceClientPlaybackSessionMigrateEndCallback(v4, v5, v6, v8);

}

void __48__MRMediaRemoteServiceClient__registerCallbacks__block_invoke_11(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  xpc_object_t reply;
  MRProtocolMessage *v5;
  id v6;

  v6 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      v5 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:]([MRProtocolMessage alloc], "initWithUnderlyingCodableMessage:error:", 0, v6);
      MRAddProtobufToXPCMessage(reply, v5);

      xpc_connection_send_message(v3, reply);
    }

  }
}

uint64_t __66__MRMediaRemoteServiceClient__initializeConnectionWithCompletion___block_invoke_2()
{
  return 1;
}

void __51__MRMediaRemoteServiceClient__invalidateConnection__block_invoke(uint64_t a1)
{
  MRPlayerPath *v2;
  void *v3;
  MRPlayerPath *v4;

  v2 = [MRPlayerPath alloc];
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MRPlayerPath initWithOrigin:client:player:](v2, "initWithOrigin:client:player:", v3, 0, 0);

  -[MRMediaRemoteServiceClient _onQueue_setActivePlayerPath:](*(_QWORD *)(a1 + 32), v4);
  -[MRMediaRemoteServiceClient _onQueue_processPlayerPathInvalidationHandlersWithBlock:](*(_QWORD *)(a1 + 32), 0);

}

void __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v3 = a2;
  if (v3)
  {
    _MRLogForCategory(8uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke_cold_1((uint64_t)v3, v4);

    v5 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke_33;
    block[3] = &unk_1E30C5CA8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[MRMediaRemoteServiceClient _restoreConnection](*(id **)(a1 + 32));
  }

}

- (void)_restoreConnection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    objc_msgSend(a1[14], "restoreNowPlayingClientState");
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "clearActiveSystemEndpoints");

    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restoreNowPlayingClientState");

    +[MRGroupSessionRequestManager sharedManager](MRGroupSessionRequestManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restoreState");

    -[MRMediaRemoteServiceClient _restoreRestrictedCommandClientsState]((uint64_t)a1);
    objc_msgSend(a1, "currentSessionPlayerPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(a1, "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mrXPCConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendMessageWithType:queue:reply:", 0x30000000000002DLL, 0, 0);

    }
    objc_msgSend(a1, "notificationClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchNotification:userInfo:object:", CFSTR("kMRMediaRemoteServiceClientDidRestoreConnectionNotification"), 0, 0);

  }
}

uint64_t __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke_33(uint64_t a1)
{
  return -[MRMediaRemoteServiceClient _resumeConnection](*(_QWORD *)(a1 + 32));
}

- (void)_restoreRestrictedCommandClientsState
{
  id v1;

  if (a1)
  {
    if ((MRProcessIsMediaRemoteDaemon() & 1) == 0)
    {
      +[MRRestrictedCommandClientsManager sharedManager](MRRestrictedCommandClientsManager, "sharedManager");
      v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "republishStateIfNeeded");

    }
  }
}

- (id)debugDescription
{
  id v3;
  id v4;
  NSHashTable *v5;
  void *v6;
  void *v7;
  NSHashTable *v8;
  void *v9;
  void *v10;
  NSHashTable *v11;
  void *v12;
  void *v13;
  NSHashTable *v14;
  void *v15;
  NSHashTable *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  MRMediaRemoteServiceClient *v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __46__MRMediaRemoteServiceClient_debugDescription__block_invoke;
  v39 = &unk_1E30C5F40;
  v40 = self;
  v4 = v3;
  v41 = v4;
  msv_dispatch_sync_on_queue();
  v5 = self->_weakEndpointObservers;
  objc_sync_enter(v5);
  -[NSHashTable allObjects](self->_weakEndpointObservers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    MRCreateIndentedDebugDescriptionFromArray(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("endpointObservers = %@\n"), v7);

  }
  objc_sync_exit(v5);

  v8 = self->_weakNowPlayingControllers;
  objc_sync_enter(v8);
  -[NSHashTable allObjects](self->_weakNowPlayingControllers, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSHashTable count](self->_weakNowPlayingControllers, "count"))
  {
    MRCreateIndentedDebugDescriptionFromArray(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("nowPlayingControllers = %@\n"), v10);

  }
  objc_sync_exit(v8);

  v11 = self->_weakDiscoverySessions;
  objc_sync_enter(v11);
  -[NSHashTable allObjects](self->_weakDiscoverySessions, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v11);

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "mr_formattedDebugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("discoverySessions = %@\n"), v13);

  }
  v14 = self->_weakEndpoints;
  objc_sync_enter(v14);
  -[NSHashTable allObjects](self->_weakEndpoints, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v14);

  v16 = self->_weakExternalDevices;
  objc_sync_enter(v16);
  -[NSHashTable allObjects](self->_weakExternalDevices, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_sync_exit(v16);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v22), "externalDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "mr_formattedDebugDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("distantEndpoints = %@\n"), v24);

  }
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "mr_formattedDebugDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("remaining distantExternalDevices = %@\n"), v25);

  }
  +[MRAVDistantEndpoint externalDeviceFactory](MRAVDistantEndpoint, "externalDeviceFactory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("external device cache = %@\n"), v26);

  -[MRNotificationClient debugDescription](self->_notificationClient, "debugDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v27);

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "debugDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v29);

  v30 = v4;
  return v30;
}

uint64_t __46__MRMediaRemoteServiceClient_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("activePlayerPath = %@\n"), *(_QWORD *)(v2 + 24));
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (objc_msgSend(*(id *)(v2 + 40), "count"))
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("playerPathInvalidationHandlers = %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("currentSessionPlayerPath = %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (MRPlayerPath)currentSessionPlayerPath
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MRMediaRemoteServiceClient_currentSessionPlayerPath__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayerPath *)v3;
}

void __54__MRMediaRemoteServiceClient_currentSessionPlayerPath__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setCurrentSessionPlayerPath:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MRMediaRemoteServiceClient_setCurrentSessionPlayerPath___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

void __58__MRMediaRemoteServiceClient_setCurrentSessionPlayerPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __63__MRMediaRemoteServiceClient_addPlayerPathInvalidationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v7 = WeakRetained;
    objc_msgSend(a2, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "isEqual:", v6);

    WeakRetained = v7;
    if ((v5 & 1) == 0)
    {
      -[MRMediaRemoteServiceClient _callInvalidationHandler:](*(_QWORD *)(a1 + 40), v7);
      WeakRetained = v7;
    }
  }

}

- (void)_callInvalidationHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRMediaRemoteServiceClient _callInvalidationHandler:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MRMediaRemoteServiceClient.m"), 520, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler"));

    }
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "playerPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v15 = v4;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Calling PlayerPathInvalidationHandler %p for %{public}@", buf, 0x16u);

    }
    objc_msgSend(v4, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__MRMediaRemoteServiceClient__callInvalidationHandler___block_invoke;
    block[3] = &unk_1E30C5CA8;
    v13 = v4;
    dispatch_async(v8, block);

  }
}

- (void)removeInvalidationHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MRMediaRemoteServiceClient *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MRMediaRemoteServiceClient_removeInvalidationHandler___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __56__MRMediaRemoteServiceClient_removeInvalidationHandler___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "containsObject:", v2))
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "playerPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218242;
      v6 = v2;
      v7 = 2114;
      v8 = v4;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "Removing PlayerPathInvalidationHandler %p for %{public}@", (uint8_t *)&v5, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", v2);
  }

}

- (void)processPlayerPathInvalidationHandlersWithInvalidOrigin:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__MRMediaRemoteServiceClient_processPlayerPathInvalidationHandlersWithInvalidOrigin___block_invoke;
  v6[3] = &unk_1E30CAF58;
  v7 = v4;
  v5 = v4;
  -[MRMediaRemoteServiceClient processPlayerPathInvalidationHandlersWithBlock:](self, "processPlayerPathInvalidationHandlersWithBlock:", v6);

}

uint64_t __85__MRMediaRemoteServiceClient_processPlayerPathInvalidationHandlersWithInvalidOrigin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __55__MRMediaRemoteServiceClient__callInvalidationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2);

}

- (void)addEndpointObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakEndpointObservers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_weakEndpointObservers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeEndpointObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakEndpointObservers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_weakEndpointObservers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)addNowPlayingController:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakNowPlayingControllers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_weakNowPlayingControllers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeNowPlayingController:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakNowPlayingControllers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_weakNowPlayingControllers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeDiscoverySession:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakDiscoverySessions;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_weakDiscoverySessions, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)addDistantEndpoint:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakEndpoints;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_weakEndpoints, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)addDistantExternalDevice:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakExternalDevices;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_weakExternalDevices, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeDistantExternalDevice:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_weakExternalDevices;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_weakExternalDevices, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (NSArray)registeredOrigins
{
  return self->_registeredOrigins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueDispatchQueue, 0);
  objc_storeStrong((id *)&self->_registeredOrigins, 0);
  objc_storeStrong((id *)&self->_notificationClient, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_nowPlayingSessionService, 0);
  objc_storeStrong((id *)&self->_notificationService, 0);
  objc_storeStrong((id *)&self->_weakExternalDevices, 0);
  objc_storeStrong((id *)&self->_weakEndpoints, 0);
  objc_storeStrong((id *)&self->_weakDiscoverySessions, 0);
  objc_storeStrong((id *)&self->_weakNowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_weakEndpointObservers, 0);
  objc_storeStrong((id *)&self->_playerPathInvalidationHandlers, 0);
  objc_storeStrong((id *)&self->_currentSessionPlayerPath, 0);
  objc_storeStrong((id *)&self->_activePlayerPath, 0);
  objc_storeStrong((id *)&self->_routingClientController, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_onQueue_setActivePlayerPath:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_debug_impl(&dword_193827000, log, OS_LOG_TYPE_DEBUG, "Setting cached activePlayerPath %{public}@ -> %{public}@", (uint8_t *)&v4, 0x16u);
}

void __47__MRMediaRemoteServiceClient__resumeConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "Error %@ initializing Connection. Trying again...", (uint8_t *)&v2, 0xCu);
}

@end
