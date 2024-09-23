@implementation MRPlaybackQueueClient

- (MRPlaybackQueueClient)initWithQueue:(id)a3
{
  id v6;
  MRPlaybackQueueClient *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *controllers;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRPlaybackQueueClient.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v15.receiver = self;
  v15.super_class = (Class)MRPlaybackQueueClient;
  v7 = -[MRPlaybackQueueClient init](&v15, sel_init);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    controllers = v7->_controllers;
    v7->_controllers = v8;

    objc_storeStrong((id *)&v7->_queue, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__handlePlayerPathRemovedNotification_, CFSTR("kMRMediaRemoteNowPlayingPlayerDidUnregister"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__handleApplicationRemovedNotification_, CFSTR("kMRMediaRemoteNowPlayingApplicationDidUnregister"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__handleOriginRemovedNotification_, CFSTR("kMRMediaRemoteOriginDidUnregisterNotification"), 0);

  }
  return v7;
}

void __69__MRPlaybackQueueClient_existingSubscriptionControllerForPlayerPath___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__MRPlaybackQueueClient_subscriptionControllerForPlayerPath___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  MRPlaybackQueueSubscriptionController *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v5 = -[MRPlaybackQueueSubscriptionController initWithPlayerPath:]([MRPlaybackQueueSubscriptionController alloc], "initWithPlayerPath:", a1[5]);
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
  }
}

- (id)existingSubscriptionControllerForPlayerPath:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__37;
  v15 = __Block_byref_object_dispose__37;
  v16 = 0;
  if (objc_msgSend(v4, "isResolved"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MRPlaybackQueueClient_existingSubscriptionControllerForPlayerPath___block_invoke;
    block[3] = &unk_1E30C74D0;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(queue, block);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)subscriptionControllerForPlayerPath:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__37;
  v15 = __Block_byref_object_dispose__37;
  v16 = 0;
  if (objc_msgSend(v4, "isResolved"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__MRPlaybackQueueClient_subscriptionControllerForPlayerPath___block_invoke;
    block[3] = &unk_1E30C74D0;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(queue, block);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRPlaybackQueueClient;
  -[MRPlaybackQueueClient dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[NSMutableDictionary allValues](self->_controllers, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p {\n %@ \n}"), v4, self, v6);

  return v7;
}

- (void)_handlePlayerPathRemovedNotification:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MRPlaybackQueueClient__handlePlayerPathRemovedNotification___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(queue, block);

}

uint64_t __62__MRPlaybackQueueClient__handlePlayerPathRemovedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (void)_handleApplicationRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetOriginFromUserInfo(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MRGetClientFromUserInfo(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRPlaybackQueueClient__handleApplicationRemovedNotification___block_invoke;
  block[3] = &unk_1E30C7328;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_sync(queue, block);

}

void __63__MRPlaybackQueueClient__handleApplicationRemovedNotification___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1[4] + 8), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v8 = (void *)a1[5];
        objc_msgSend(v7, "origin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

        v10 = (void *)a1[6];
        objc_msgSend(v7, "client");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((_DWORD)v8)
          v13 = v12 == 0;
        else
          v13 = 1;
        if (!v13)
          objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", 0, v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (void)_handleOriginRemovedNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetOriginFromUserInfo(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MRPlaybackQueueClient__handleOriginRemovedNotification___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __58__MRPlaybackQueueClient__handleOriginRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "origin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

        if ((_DWORD)v8)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
}

@end
