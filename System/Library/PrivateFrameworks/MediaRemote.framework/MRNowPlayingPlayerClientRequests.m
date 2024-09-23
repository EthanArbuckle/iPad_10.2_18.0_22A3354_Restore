@implementation MRNowPlayingPlayerClientRequests

- (void)setSupportedCommands:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

- (void)setPlayerProperties:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRPlaybackQueueSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (MRNowPlayingPlayerClientRequests)initWithPlayerPath:(id)a3
{
  id v6;
  MRNowPlayingPlayerClientRequests *v7;
  objc_class *v8;
  const char *Name;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *responseQueue;
  MRPlaybackQueueSubscriptionController *v16;
  MRPlaybackQueueSubscriptionController *subscriptionController;
  void *v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MRNowPlayingPlayerClientRequests;
  v7 = -[MRNowPlayingPlayerClientRequests init](&v20, sel_init);
  if (v7)
  {
    if ((objc_msgSend(v6, "isResolved") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MRNowPlayingPlayerClientRequests.m"), 45, CFSTR("Trying to instantiate an unresolved MRNowPlayingPlayerClientRequests %@"), v6);

    }
    objc_storeStrong((id *)&v7->_playerPath, a3);
    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(Name, v10);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.MRNowPlayingPlayerClientRequests.response", v13);
    responseQueue = v7->_responseQueue;
    v7->_responseQueue = (OS_dispatch_queue *)v14;

    v16 = -[MRPlaybackQueueSubscriptionController initWithPlayerPath:]([MRPlaybackQueueSubscriptionController alloc], "initWithPlayerPath:", v6);
    subscriptionController = v7->_subscriptionController;
    v7->_subscriptionController = v16;

  }
  return v7;
}

- (void)handlePlaybackStateRequestWithCompletion:(id)a3
{
  id v5;
  NSObject *serialQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingPlayerClientRequests.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MRNowPlayingPlayerClientRequests_handlePlaybackStateRequestWithCompletion___block_invoke;
  block[3] = &unk_1E30C5B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(serialQueue, block);

}

- (void)enqueuePlaybackQueueRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MRNowPlayingPlayerClientRequests *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MRNowPlayingPlayerClientRequests_enqueuePlaybackQueueRequest_completion___block_invoke;
  block[3] = &unk_1E30CA5C0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(serialQueue, block);

}

void __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
    -[MRNowPlayingPlayerClientRequests updatePlaybackQueue:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

- (void)updatePlaybackQueue:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 40);
    block[1] = 3221225472;
    block[2] = __56__MRNowPlayingPlayerClientRequests_updatePlaybackQueue___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

void __56__MRNowPlayingPlayerClientRequests_updatePlaybackQueue___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  MRPlaybackQueue *v5;
  void *v6;
  MRPlaybackQueue *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3[1])
  {
    objc_msgSend(v2, "contentItems");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateContentItems:");

  }
  else if (v2 && objc_msgSend(v2, "hasLocation"))
  {
    objc_msgSend(*(id *)(a1 + 40), "contentItemWithOffset:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [MRPlaybackQueue alloc];
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MRPlaybackQueue initWithContentItems:location:withPropertiesFromPlaybackQueue:](v5, "initWithContentItems:location:withPropertiesFromPlaybackQueue:", v6, 0, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "setPlaybackQueue:", v7);

    }
  }
}

- (void)setPlaybackQueue:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __75__MRNowPlayingPlayerClientRequests_enqueuePlaybackQueueRequest_completion___block_invoke(id *a1)
{
  void *v2;
  int v3;
  _QWORD *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v2 = (void *)objc_msgSend(a1[4], "copy");
  v3 = objc_msgSend(v2, "containsNonDefaultAssets");
  v4 = a1[5];
  if (v3)
  {
    v5 = (void *)v4[12];
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      v7 = a1[5];
      v8 = (void *)v7[12];
      v7[12] = v6;
      v9 = 96;
LABEL_6:

      objc_msgSend(*(id *)((char *)a1[5] + v9), "setMaxConcurrentOperationCount:", 1);
      v5 = *(void **)((char *)a1[5] + v9);
    }
  }
  else
  {
    v5 = (void *)v4[11];
    if (!v5)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      v11 = a1[5];
      v8 = (void *)v11[11];
      v11[11] = v10;
      v9 = 88;
      goto LABEL_6;
    }
  }
  v12 = v5;
  objc_initWeak(&location, a1[5]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__MRNowPlayingPlayerClientRequests_enqueuePlaybackQueueRequest_completion___block_invoke_2;
  v14[3] = &unk_1E30CED18;
  objc_copyWeak(&v17, &location);
  v13 = v2;
  v15 = v13;
  v16 = a1[6];
  objc_msgSend(v12, "addOperationWithBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __77__MRNowPlayingPlayerClientRequests_handlePlaybackStateRequestWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v6 + 16))
  {
    objc_msgSend((id)v6, "setPlaybackState:", a2);
    v6 = *(_QWORD *)(a1 + 32);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(v6 + 72);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects", (_QWORD)v12);
}

- (void)setPlaybackState:(unsigned int)a3
{
  msv_dispatch_sync_on_queue();
}

void __57__MRNowPlayingPlayerClientRequests_setSupportedCommands___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  _MRLogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__MRNowPlayingPlayerClientRequests_setSupportedCommands___block_invoke_cold_1();

  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

}

void __53__MRNowPlayingPlayerClientRequests_setPlaybackQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  _MRLogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__MRNowPlayingPlayerClientRequests_setPlaybackQueue___block_invoke_cold_1(a1, v2);

  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

}

void __49__MRNowPlayingPlayerClientRequests_playbackQueue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__MRNowPlayingPlayerClientRequests_setPlaybackState___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _MRLogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__MRNowPlayingPlayerClientRequests_setPlaybackState___block_invoke_cold_1(a1, v2);

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_DWORD *)(a1 + 40);
}

void __75__MRNowPlayingPlayerClientRequests_enqueuePlaybackQueueRequest_completion___block_invoke_2(void **a1)
{
  void *Error;
  void (**v3)(void *, _QWORD, void *);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    -[MRNowPlayingPlayerClientRequests _handleEnqueuedPlaybackQueueRequest:completion:]((uint64_t)WeakRetained, a1[4], a1[5]);
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(1);
    v3 = (void (**)(void *, _QWORD, void *))a1[5];
    if (v3)
      v3[2](v3, 0, Error);

  }
}

- (void)_handleEnqueuedPlaybackQueueRequest:(void *)a3 completion:
{
  id v5;
  void (**v6)(id, uint64_t, uint64_t);
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD v20[5];
  NSObject *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__40;
    v37 = __Block_byref_object_dispose__40;
    v38 = 0;
    objc_msgSend((id)a1, "playbackQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__40;
    v31 = __Block_byref_object_dispose__40;
    MRPlaybackQueueCreateFromCache(v7, v5, 0, *(void **)(a1 + 104));
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (v28[5])
    {
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v8 = dispatch_semaphore_create(0);
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x2020000000;
      v26 = 1;
      v9 = (void *)MRGetSharedService();
      v10 = *(void **)(a1 + 104);
      v11 = *(void **)(a1 + 48);
      v12 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke;
      v20[3] = &unk_1E30CED40;
      v23 = &v27;
      v24 = &v33;
      v22 = v25;
      v20[4] = a1;
      v13 = v8;
      v21 = v13;
      MRMediaRemoteServiceRequestNowPlayingPlaybackQueue(v9, v5, v10, v11, v20);
      v14 = dispatch_time(0, 3000000000);
      if (dispatch_semaphore_wait(v13, v14))
      {
        v15 = *(NSObject **)(a1 + 48);
        block[0] = v12;
        block[1] = 3221225472;
        block[2] = __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke_2;
        block[3] = &unk_1E30C9F28;
        v18 = v25;
        v17 = v5;
        v19 = &v33;
        dispatch_sync(v15, block);

      }
      _Block_object_dispose(v25, 8);

      if (!v6)
        goto LABEL_9;
    }
    v6[2](v6, v28[5], v34[5]);
LABEL_9:
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }

}

- (MRPlaybackQueue)playbackQueue
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MRNowPlayingPlayerClientRequests_playbackQueue__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlaybackQueue *)v3;
}

void __56__MRNowPlayingPlayerClientRequests_setPlayerProperties___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  _MRLogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__MRNowPlayingPlayerClientRequests_setPlayerProperties___block_invoke_cold_1();

  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

}

void __77__MRNowPlayingPlayerClientRequests_handlePlaybackStateRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 16))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(v2 + 72);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 72);
      *(_QWORD *)(v5 + 72) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v3, "addObject:", v8);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count") == 1)
    {
      v9 = (void *)MRGetSharedService();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 104);
      v12 = *(void **)(v10 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __77__MRNowPlayingPlayerClientRequests_handlePlaybackStateRequestWithCompletion___block_invoke_2;
      v13[3] = &unk_1E30CED68;
      v13[4] = v10;
      MRMediaRemoteServiceGetPlaybackState(v9, v11, v12, v13);
    }
  }
}

void __55__MRNowPlayingPlayerClientRequests_updateContentItems___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v16;
      *(_QWORD *)&v4 = 138543618;
      v14 = v4;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(v8, "identifier", v14, (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "contentItemForIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            _MRLogForCategory(1uLL);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
              *(_DWORD *)buf = v14;
              v20 = v13;
              v21 = 2114;
              v22 = v8;
              _os_log_debug_impl(&dword_193827000, v12, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: contentItem %{public}@", buf, 0x16u);
            }

            MRContentItemMerge(v11, v8);
          }

        }
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v5);
    }

  }
}

- (void)updateContentItems:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRNowPlayingPlayerClientRequests;
  -[MRNowPlayingPlayerClientRequests dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
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
  v7 = __Block_byref_object_copy__40;
  v8 = __Block_byref_object_dispose__40;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __52__MRNowPlayingPlayerClientRequests_debugDescription__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;

  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 104);
  v6 = *(_QWORD *)(v4 + 32);
  v11 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(*(_DWORD *)(v4 + 16));
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("    playerPath = %@\n    playerProperties = %@\n    playbackState = %@\n    playbackQueue = %@\n    supportedCommands = %@\n"), v5, v6, v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  MRCreateFormattedDebugDescriptionFromClass(v2, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (unsigned)playbackState
{
  NSObject *serialQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MRNowPlayingPlayerClientRequests_playbackState__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRNowPlayingPlayerClientRequests_playbackState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (NSArray)supportedCommands
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MRNowPlayingPlayerClientRequests_supportedCommands__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __53__MRNowPlayingPlayerClientRequests_supportedCommands__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (MRPlayer)playerProperties
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__MRNowPlayingPlayerClientRequests_playerProperties__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayer *)v3;
}

void __52__MRNowPlayingPlayerClientRequests_playerProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)updateContentItemArtwork:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRNowPlayingPlayerClientRequests_updateContentItemArtwork___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __61__MRNowPlayingPlayerClientRequests_updateContentItemArtwork___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v26;
      *(_QWORD *)&v4 = 138543618;
      v24 = v4;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v7), "identifier", v24, (_QWORD)v25);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "contentItemForIdentifier:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            if (MRContentItemGetArtworkData(v10))
            {
              _MRLogForCategory(1uLL);
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
                v19 = MRContentItemCopyMinimalReadableDescription(v10);
                *(_DWORD *)buf = v24;
                v30 = v18;
                v31 = 2114;
                v32 = v19;
                _os_log_debug_impl(&dword_193827000, v11, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: clearing contentItemArtwork for %{public}@", buf, 0x16u);

              }
              MRContentItemSetArtworkData(v10, 0);
            }
            objc_msgSend(v10, "artworks");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count");

            if (v13)
            {
              _MRLogForCategory(1uLL);
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
                v21 = MRContentItemCopyMinimalReadableDescription(v10);
                *(_DWORD *)buf = v24;
                v30 = v20;
                v31 = 2114;
                v32 = v21;
                _os_log_debug_impl(&dword_193827000, v14, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: clearing formatted data artworks for %{public}@", buf, 0x16u);

              }
              objc_msgSend(v10, "setArtworks:", 0);
            }
            objc_msgSend(v10, "remoteArtworks");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count");

            if (v16)
            {
              _MRLogForCategory(1uLL);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
                v23 = MRContentItemCopyMinimalReadableDescription(v10);
                *(_DWORD *)buf = v24;
                v30 = v22;
                v31 = 2114;
                v32 = v23;
                _os_log_debug_impl(&dword_193827000, v17, OS_LOG_TYPE_DEBUG, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: clearing formatted remote artworks for %{public}@", buf, 0x16u);

              }
              objc_msgSend(v10, "setRemoteArtworks:", 0);
            }
          }

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v5);
    }

  }
}

- (void)updatePlaybackQueueIfUninitialized:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MRNowPlayingPlayerClientRequests_updatePlaybackQueueIfUninitialized___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __71__MRNowPlayingPlayerClientRequests_updatePlaybackQueueIfUninitialized___block_invoke(uint64_t a1)
{
  -[MRNowPlayingPlayerClientRequests _onSerialQueue_updatePlaybackQueueIfUninitialized:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_onSerialQueue_updatePlaybackQueueIfUninitialized:(_QWORD *)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1 && !a1[1])
  {
    v4 = v3;
    objc_msgSend(a1, "setPlaybackQueue:", v3);
    v3 = v4;
  }

}

- (void)updatePlaybackStateIfUninitialized:(unsigned int)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  unsigned int v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__MRNowPlayingPlayerClientRequests_updatePlaybackStateIfUninitialized___block_invoke;
  v4[3] = &unk_1E30C9E38;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(serialQueue, v4);
}

_DWORD *__71__MRNowPlayingPlayerClientRequests_updatePlaybackStateIfUninitialized___block_invoke(uint64_t a1)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result)
  {
    if (!result[4])
      return (_DWORD *)objc_msgSend(result, "setPlaybackState:", *(unsigned int *)(a1 + 40));
  }
  return result;
}

- (void)updateSupportedCommandsIfUninitialized:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MRNowPlayingPlayerClientRequests_updateSupportedCommandsIfUninitialized___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __75__MRNowPlayingPlayerClientRequests_updateSupportedCommandsIfUninitialized___block_invoke(uint64_t a1)
{
  -[MRNowPlayingPlayerClientRequests _onSerialQueue_updateSupportedCommandsIfUninitialized:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_onSerialQueue_updateSupportedCommandsIfUninitialized:(_QWORD *)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1 && !a1[3])
  {
    v4 = v3;
    objc_msgSend(a1, "setSupportedCommands:", v3);
    v3 = v4;
  }

}

void __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t Error;
  uint64_t v5;
  void *v6;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 0;
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke_2_cold_1(a1, v3);

    Error = MRMediaRemoteCreateError(26);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = Error;

  }
}

- (void)handleSupportedCommandsRequestWithCompletion:(id)a3
{
  id v5;
  NSObject *serialQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingPlayerClientRequests.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MRNowPlayingPlayerClientRequests_handleSupportedCommandsRequestWithCompletion___block_invoke;
  block[3] = &unk_1E30C5B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(serialQueue, block);

}

void __81__MRNowPlayingPlayerClientRequests_handleSupportedCommandsRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(v2 + 64);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 64);
      *(_QWORD *)(v5 + 64) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v3, "addObject:", v8);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count") == 1)
    {
      v9 = (void *)MRGetSharedService();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 104);
      v12 = *(void **)(v10 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __81__MRNowPlayingPlayerClientRequests_handleSupportedCommandsRequestWithCompletion___block_invoke_2;
      v13[3] = &unk_1E30C7CE8;
      v13[4] = v10;
      MRMediaRemoteServiceGetSupportedCommands(v9, v11, v12, v13);
    }
  }
}

void __81__MRNowPlayingPlayerClientRequests_handleSupportedCommandsRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MRNowPlayingPlayerClientRequests _onSerialQueue_updateSupportedCommandsIfUninitialized:](*(_QWORD **)(a1 + 32), a2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects", (_QWORD)v11);
}

- (void)handlePlayerPropertiesRequestWithCompletion:(id)a3
{
  id v5;
  NSObject *serialQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingPlayerClientRequests.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MRNowPlayingPlayerClientRequests_handlePlayerPropertiesRequestWithCompletion___block_invoke;
  block[3] = &unk_1E30C5B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(serialQueue, block);

}

void __80__MRNowPlayingPlayerClientRequests_handlePlayerPropertiesRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(v2 + 80);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 80);
      *(_QWORD *)(v5 + 80) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v3, "addObject:", v8);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count") == 1)
    {
      v9 = (void *)MRGetSharedService();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 104);
      v12 = *(void **)(v10 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __80__MRNowPlayingPlayerClientRequests_handlePlayerPropertiesRequestWithCompletion___block_invoke_2;
      v13[3] = &unk_1E30CED90;
      v13[4] = v10;
      MRMediaRemoteServiceGetPlayerProperties(v9, v11, v12, v13);
    }
  }
}

void __80__MRNowPlayingPlayerClientRequests_handlePlayerPropertiesRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v7 + 32))
  {
    objc_msgSend((id)v7, "setPlayerProperties:", v5);
    v7 = *(_QWORD *)(a1 + 32);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(v7 + 80);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects", (_QWORD)v13);
}

- (void)restoreNowPlayingClientState
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRNowPlayingPlayerClientRequests_restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __64__MRNowPlayingPlayerClientRequests_restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    MRMediaRemotePlaybackQueueResetRequestsWithDataForPlayer(*(void **)(*(_QWORD *)(a1 + 32) + 104), v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_enquedNowPlayingInfoAssetRequests, 0);
  objc_storeStrong((id *)&self->_enquedNowPlayingInfoRequests, 0);
  objc_storeStrong((id *)&self->_playerPropertiesCompletions, 0);
  objc_storeStrong((id *)&self->_playbackStateCompletions, 0);
  objc_storeStrong((id *)&self->_supportedCommandsCompletions, 0);
  objc_storeStrong((id *)&self->_playbackQueueCompletions, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_playerProperties, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
}

void __53__MRNowPlayingPlayerClientRequests_setPlaybackState___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  __CFString *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(*(_DWORD *)(a1 + 40));
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_13(&dword_193827000, a2, v4, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: playbackState %{public}@", v5);

  OUTLINED_FUNCTION_2_1();
}

void __57__MRNowPlayingPlayerClientRequests_setSupportedCommands___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_13(&dword_193827000, v0, v1, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: supportedCommands %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __53__MRNowPlayingPlayerClientRequests_setPlaybackQueue___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "minimalReadableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_13(&dword_193827000, a2, v4, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: playbackQueue %{public}@", v5);

  OUTLINED_FUNCTION_2_1();
}

void __56__MRNowPlayingPlayerClientRequests_setPlayerProperties___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_13(&dword_193827000, v0, v1, "[MRNowPlayingPlayerClientRequests] %{public}@ UpdatingCache: playerProperties %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __83__MRNowPlayingPlayerClientRequests__handleEnqueuedPlaybackQueueRequest_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "Timed out getting playback queue for now playing request: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_8();
}

@end
