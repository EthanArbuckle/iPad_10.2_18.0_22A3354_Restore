@implementation MRNowPlayingPlayerClient

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRNowPlayingPlayerClient)initWithPlayerPath:(id)a3
{
  id v5;
  MRNowPlayingPlayerClient *v6;
  uint64_t v7;
  MRPlayerPath *playerPath;
  objc_class *v9;
  const char *Name;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *replayQueue;
  MRPlaybackQueueSubscriptionController *v17;
  MRPlaybackQueueSubscriptionController *subscriptionController;
  MRNowPlayingPlayerClientCallbacks *v19;
  MRNowPlayingPlayerClientCallbacks *clientCallbacks;
  double v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MRNowPlayingPlayerClient;
  v6 = -[MRNowPlayingPlayerClient init](&v28, sel_init);
  if (v6)
  {
    if ((objc_msgSend(v5, "isResolved") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MRNowPlayingPlayerClient.m"), 72, CFSTR("Trying to instantiate an unresolved MRNowPlayingPlayerClient %@"), v5);

    }
    v7 = objc_msgSend(v5, "copy");
    playerPath = v6->_playerPath;
    v6->_playerPath = (MRPlayerPath *)v7;

    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(Name, v11);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("replayQueue", v14);
    replayQueue = v6->_replayQueue;
    v6->_replayQueue = (OS_dispatch_queue *)v15;

    v17 = -[MRPlaybackQueueSubscriptionController initWithPlayerPath:]([MRPlaybackQueueSubscriptionController alloc], "initWithPlayerPath:", v6->_playerPath);
    subscriptionController = v6->_subscriptionController;
    v6->_subscriptionController = v17;

    v19 = -[MRNowPlayingPlayerClientCallbacks initWithPlayerPath:queue:]([MRNowPlayingPlayerClientCallbacks alloc], "initWithPlayerPath:queue:", v6->_playerPath, v6->_serialQueue);
    clientCallbacks = v6->_clientCallbacks;
    v6->_clientCallbacks = v19;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v6->_invalidatationTimestamp = v21;
    -[MRPlayerPath origin](v6->_playerPath, "origin");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v22, "isLocallyHosted");

    if ((_DWORD)v11)
    {
      objc_initWeak(&location, v6);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__MRNowPlayingPlayerClient_initWithPlayerPath___block_invoke;
      v25[3] = &unk_1E30CF078;
      objc_copyWeak(&v26, &location);
      -[MRNowPlayingPlayerClientCallbacks setPlaybackSessionMigrateRequestCallback:](v6->_clientCallbacks, "setPlaybackSessionMigrateRequestCallback:", v25);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

- (NSDate)activeRequestedDate
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
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MRNowPlayingPlayerClient_activeRequestedDate__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (MRNowPlayingPlayerClientCallbacks)clientCallbacks
{
  return self->_clientCallbacks;
}

void *__66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return MRMediaRemoteCopyCommandDescription(objc_msgSend(a2, "intValue"));
}

uint64_t __44__MRNowPlayingPlayerClient_setCapabilities___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 88) = *(_QWORD *)(result + 40);
  return result;
}

double __51__MRNowPlayingPlayerClient_invalidatationTimestamp__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 120);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)homeUserIdentifiers
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
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MRNowPlayingPlayerClient_homeUserIdentifiers__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (double)invalidatationTimestamp
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setSupportedCommands:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *serialQueue;
  uint64_t v12;
  id v13;
  void **p_playerPath;
  MRPlayerPath *playerPath;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD block[4];
  id v38;
  MRNowPlayingPlayerClient *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__43;
  v64 = __Block_byref_object_dispose__43;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__43;
  v58 = __Block_byref_object_dispose__43;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__43;
  v52 = __Block_byref_object_dispose__43;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  serialQueue = self->_serialQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke;
  block[3] = &unk_1E30CF1D8;
  v13 = v8;
  v38 = v13;
  v39 = self;
  v40 = &v60;
  v41 = &v54;
  v42 = &v48;
  v43 = &v44;
  dispatch_sync(serialQueue, block);
  playerPath = self->_playerPath;
  p_playerPath = (void **)&self->_playerPath;
  if (-[MRPlayerPath isLocal](playerPath, "isLocal"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    MRAddPlayerPathToUserInfo(v16, *p_playerPath);
    _MRLogForCategory(1uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[MRNowPlayingPlayerClient setSupportedCommands:queue:completion:].cold.1((uint64_t *)p_playerPath, v17, v18);

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "notificationClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    MRCreateDecodedUserInfo(v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dispatchNotification:userInfo:object:", CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification"), v21, 0);

  }
  if (*((_BYTE *)v45 + 24))
  {
    v22 = (void *)MRGetSharedService();
    v23 = *p_playerPath;
    v35[0] = v12;
    v35[1] = 3221225472;
    v35[2] = __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_49;
    v35[3] = &unk_1E30C6748;
    v36 = v10;
    MRMediaRemoteServiceSetSupportedCommands(v22, (uint64_t)v13, v23, v9, v35);
    if (objc_msgSend((id)v61[5], "count"))
    {
      _MRLogForCategory(1uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v61[5], "allKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "msv_map:", &__block_literal_global_51_0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v67 = v26;
        _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Added SupportedCommands: %@", buf, 0xCu);

      }
    }
    if (objc_msgSend((id)v55[5], "count"))
    {
      _MRLogForCategory(1uLL);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v55[5], "allKeys");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "msv_map:", &__block_literal_global_53);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v67 = v29;
        _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Removed SupportedCommands: %@", buf, 0xCu);

      }
    }
    if (objc_msgSend((id)v49[5], "count"))
    {
      _MRLogForCategory(1uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v49[5], "allKeys");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "msv_map:", &__block_literal_global_55);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v67 = v32;
        _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Changed SupportedCommands: %@", buf, 0xCu);

      }
    }
    v33 = v36;
  }
  else
  {
    _MRLogForCategory(1uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *p_playerPath;
      *(_DWORD *)buf = 138543362;
      v67 = v34;
      _os_log_impl(&dword_193827000, v33, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Setting identical supportedCommands for %{public}@. Skipping update", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

}

void __47__MRNowPlayingPlayerClient_activeRequestedDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

void __83__MRNowPlayingPlayerClient_updatePlaybackQueueWithCachedUpdates_forPendingRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  id obj;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "objectForKey:", *(_QWORD *)(a1 + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    _MRLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __83__MRNowPlayingPlayerClient_updatePlaybackQueueWithCachedUpdates_forPendingRequest___block_invoke_cold_1(a1, v2);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "contentItems", a1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v21 = v3;
        v4 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v3);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v5 = v19;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v23 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_msgSend(v4, "identifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "item");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v11, "isEqualToString:", v13);

              if (v14)
              {
                objc_msgSend(v10, "item");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                MRContentItemMerge(v4, v15);

              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v7);
        }

        v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v16 + 32) + 136), "removeObjectForKey:", *(_QWORD *)(v16 + 40));
}

void __84__MRNowPlayingPlayerClient_startCachingContentItemUpdatesForItem_forPendingRequest___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MRContentItemRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "objectForKey:", *(_QWORD *)(a1 + 40));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
      v8 = *(void **)(a1 + 48);
      objc_msgSend(v7, "item", (_QWORD)v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = MRContentItemIdentifierIsEqual(v8, v9);

      if ((v8 & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v7;

    if (!v10)
      goto LABEL_12;
    v11 = MRContentItemCreateFromRequest(*(void **)(a1 + 48), *(void **)(a1 + 56));
    -[MRContentItemRequest item](v10, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MRContentItemMerge(v12, v11);

    -[MRContentItemRequest request](v10, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mergeFrom:", *(_QWORD *)(a1 + 56));

  }
  else
  {
LABEL_9:

LABEL_12:
    v10 = -[MRContentItemRequest initWithItem:request:]([MRContentItemRequest alloc], "initWithItem:request:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(v2, "addObject:", v10);
  }

}

void __46__MRNowPlayingPlayerClient_addPendingRequest___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = v2;

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setValue:forKey:", v5, *(_QWORD *)(a1 + 40));

}

void __47__MRNowPlayingPlayerClient_homeUserIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __41__MRNowPlayingPlayerClient_playbackState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)setCapabilities:(unint64_t)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__MRNowPlayingPlayerClient_setCapabilities___block_invoke;
  v4[3] = &unk_1E30C78E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (void)addPendingRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *serialQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;

  v4 = a3;
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingPlayerClient addPendingRequest:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MRNowPlayingPlayerClient.m"), 522, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    v4 = 0;
  }
  objc_msgSend(v4, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingPlayerClient addPendingRequest:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MRNowPlayingPlayerClient.m"), 525, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestID"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MRNowPlayingPlayerClient_addPendingRequest___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v14 = v5;
  v7 = v5;
  dispatch_sync(serialQueue, block);

}

- (MRPlaybackQueueSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
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
  v5[2] = __41__MRNowPlayingPlayerClient_playbackState__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startCachingContentItemUpdatesForItem:(id)a3 forPendingRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *serialQueue;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingPlayerClient startCachingContentItemUpdatesForItem:forPendingRequest:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("MRNowPlayingPlayerClient.m"), 539, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  objc_msgSend(v7, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingPlayerClient startCachingContentItemUpdatesForItem:forPendingRequest:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("MRNowPlayingPlayerClient.m"), 542, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestID"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__MRNowPlayingPlayerClient_startCachingContentItemUpdatesForItem_forPendingRequest___block_invoke;
  block[3] = &unk_1E30C9008;
  block[4] = self;
  v18 = v8;
  v19 = v6;
  v20 = v7;
  v10 = v7;
  v11 = v6;
  v16 = v8;
  dispatch_sync(serialQueue, block);

}

void __45__MRNowPlayingPlayerClient_setPlaybackQueue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

double __55__MRNowPlayingPlayerClient_setInvalidatationTimestamp___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 120) = result;
  return result;
}

void __45__MRNowPlayingPlayerClient_supportedCommands__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __53__MRNowPlayingPlayerClient_setCanBeNowPlayingPlayer___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 24))
  {
    v3 = result;
    *(_BYTE *)(v2 + 24) = v1;
    if (*(_BYTE *)(result + 40))
    {
      result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      *(_QWORD *)(*(_QWORD *)(v3 + 32) + 32) = v4;
    }
  }
  return result;
}

- (BOOL)canBeNowPlayingPlayer
{
  return self->_canBeNowPlayingPlayer;
}

- (void)setCanBeNowPlayingPlayer:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  BOOL v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__MRNowPlayingPlayerClient_setCanBeNowPlayingPlayer___block_invoke;
  v4[3] = &unk_1E30C74F8;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(serialQueue, v4);
}

- (void)updatePlaybackQueueWithCachedUpdates:(id)a3 forPendingRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *serialQueue;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingPlayerClient updatePlaybackQueueWithCachedUpdates:forPendingRequest:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("MRNowPlayingPlayerClient.m"), 604, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  objc_msgSend(v7, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingPlayerClient updatePlaybackQueueWithCachedUpdates:forPendingRequest:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("MRNowPlayingPlayerClient.m"), 607, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestID"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MRNowPlayingPlayerClient_updatePlaybackQueueWithCachedUpdates_forPendingRequest___block_invoke;
  block[3] = &unk_1E30C9008;
  block[4] = self;
  v18 = v8;
  v19 = v6;
  v20 = v7;
  v10 = v7;
  v11 = v6;
  v16 = v8;
  dispatch_sync(serialQueue, block);

}

- (MRPlaybackQueue)playbackQueue
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
  v7 = __Block_byref_object_copy__43;
  v8 = __Block_byref_object_dispose__43;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRPlaybackQueue *)v2;
}

- (void)setPlaybackQueue:(id)a3
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
  block[2] = __45__MRNowPlayingPlayerClient_setPlaybackQueue___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)setInvalidatationTimestamp:(double)a3
{
  msv_dispatch_sync_on_queue();
}

void __41__MRNowPlayingPlayerClient_playbackQueue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id obj;

  if ((MRSupportedCommandsIsEqual(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 40) + 48)) & 1) == 0)
  {
    if (MSVDeviceOSIsInternalInstall())
    {
      v2 = *(void **)(a1 + 32);
      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(id *)(v6 + 40);
      obj = v5;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v11 = *(id *)(v7 + 40);
      MRSupportedCommandsCalculateDeltas(v3, v2, &obj, &v12, &v11);
      objc_storeStrong((id *)(v4 + 40), obj);
      objc_storeStrong((id *)(v6 + 40), v12);
      objc_storeStrong((id *)(v7 + 40), v11);
    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v8;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
}

void __53__MRNowPlayingPlayerClient_updatePlaybackState_date___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 48);
  if (*(_DWORD *)(v1 + 72) != v2)
  {
    *(_DWORD *)(v1 + 72) = v2;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  }
}

- (NSArray)supportedCommands
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
  v7 = __Block_byref_object_copy__43;
  v8 = __Block_byref_object_dispose__43;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (void)invalidatePlaybackQueueWithPlaybackQueue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRNowPlayingPlayerClient playerPath](self, "playerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteSetPlaybackQueue((uint64_t)v5, v4, 0, 0);

}

- (void)updatePlaybackState:(unsigned int)a3 date:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MRNowPlayingPlayerClient_updatePlaybackState_date___block_invoke;
  block[3] = &unk_1E30C7610;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(serialQueue, block);

}

void __51__MRNowPlayingPlayerClient_sendContentItemChanges___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _QWORD v53[2];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v1 = (uint64_t *)a1;
  v56 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "playbackQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v34 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v48;
    v4 = 0x1E30C1000uLL;
    v36 = v1;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v48 != v33)
          objc_enumerationMutation(obj);
        v35 = v5;
        v6 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v5);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v39 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v1[5] + 8) + 40), "copy");
        v7 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v44;
          v37 = *(_QWORD *)v44;
          do
          {
            v10 = 0;
            v38 = v8;
            do
            {
              if (*(_QWORD *)v44 != v9)
                objc_enumerationMutation(v39);
              v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
              objc_msgSend(v6, "identifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "isEqualToString:", v13);

              if (v14)
              {
                v15 = *(void **)(v4 + 2672);
                v53[0] = v6;
                v53[1] = v11;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "mergeContentItems:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "firstObject");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v6, "isEffectivelyEqual:", v18))
                {
                  v19 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v1[5] + 8) + 40), "mutableCopy");
                  objc_msgSend(v19, "removeObject:", v11);
                  objc_storeStrong((id *)(*(_QWORD *)(v1[5] + 8) + 40), v19);
                  _MRLogForCategory(1uLL);
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    v21 = MRContentItemCopyMinimalReadableDescription(v11);
                    *(_DWORD *)buf = 138412290;
                    v52 = v21;
                    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Sending identical contentItemChange for %@. Skipping update", buf, 0xCu);

                  }
                }
                else
                {
                  objc_msgSend(v6, "metadata");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "dictionaryRepresentation");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "metadata");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "dictionaryRepresentation");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = 0;
                  v42 = 0;
                  v40 = 0;
                  MRDictionaryCalculateDeltas(v23, v25, &v42, &v41, &v40);
                  v19 = v42;
                  v20 = v41;
                  v26 = v40;

                  if (objc_msgSend(v19, "count"))
                  {
                    _MRLogForCategory(1uLL);
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v19, "description");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v52 = v28;
                      _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Added Fields: %@", buf, 0xCu);

                    }
                  }
                  v1 = v36;
                  v4 = 0x1E30C1000;
                  v9 = v37;
                  if (objc_msgSend(v26, "count"))
                  {
                    _MRLogForCategory(1uLL);
                    v29 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v26, "description");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v52 = v30;
                      _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Updated Values: %@", buf, 0xCu);

                      v9 = v37;
                    }

                  }
                }

                v8 = v38;
              }
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
          }
          while (v8);
        }

        v5 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v34);
  }

  -[MRNowPlayingPlayerClient _onQueue_updateCacheWithContentItems:](v1[4], *(void **)(*(_QWORD *)(v1[5] + 8) + 40));
  -[MRNowPlayingPlayerClient _onQueue_cacheContentItemChangesForPendingRequests:](v1[4], *(void **)(*(_QWORD *)(v1[5] + 8) + 40));
  v31 = v1[4];
  if (*(_BYTE *)(v31 + 113))
    -[MRNowPlayingPlayerClient _onQueue_enqueueContentItemChangesForPendingPlaybackQueueInvalidation:](v31, *(void **)(*(_QWORD *)(v1[5] + 8) + 40));
  else
    *(_BYTE *)(*(_QWORD *)(v1[6] + 8) + 24) = 1;
}

- (void)sendContentItemChanges:(id)a3
{
  id v4;
  NSObject *v5;
  MRPlayerPath *playerPath;
  __CFString *v7;
  NSObject *serialQueue;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__43;
  v18 = __Block_byref_object_dispose__43;
  +[MRContentItem mergeContentItems:](MRContentItem, "mergeContentItems:", v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    playerPath = self->_playerPath;
    v7 = (__CFString *)MRContentItemsCopyMinimalReadableDescription((void *)v15[5], 0);
    -[MRNowPlayingPlayerClient sendContentItemChanges:].cold.1((uint64_t)playerPath, v7, (uint64_t)v20, v5);
  }

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MRNowPlayingPlayerClient_sendContentItemChanges___block_invoke;
  block[3] = &unk_1E30C78B8;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v11 + 24))
    MRMediaRemotePlaybackQueueDataSourceSendContentItemsChangedForPlayer((void *)v15[5], self);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

- (void)_onQueue_updateCacheWithContentItems:(uint64_t)a1
{
  MRPlaybackQueue *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (v4)
    {
      if (objc_msgSend(v4, "count"))
      {
        v3 = -[MRPlaybackQueue initWithContentItems:]([MRPlaybackQueue alloc], "initWithContentItems:", v4);
        -[MRNowPlayingPlayerClient _onQueue_updateCacheWithPlaybackQueue:](a1, v3);

      }
    }
  }

}

- (void)_onQueue_updateCacheWithPlaybackQueue:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "contentItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v21)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        v3 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(obj);
          v22 = v3;
          v4 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v3);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v20, "contentItems");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v24;
            do
            {
              for (i = 0; i != v7; ++i)
              {
                if (*(_QWORD *)v24 != v8)
                  objc_enumerationMutation(v5);
                v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
                objc_msgSend(v10, "identifier");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "identifier");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v11, "isEqualToString:", v12);

                if (v13)
                {
                  v14 = objc_msgSend(*(id *)(a1 + 40), "range");
                  +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:](MRPlaybackQueueRequest, "defaultPlaybackQueueRequestWithRange:", v14, v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = MRContentItemCreateFromRequest(v10, v16);
                  MRContentItemMerge(v4, v17);

                }
              }
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v7);
          }

          v3 = v22 + 1;
        }
        while (v22 + 1 != v21);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v21);
    }

  }
}

- (void)_onQueue_cacheContentItemChangesForPendingRequests:(uint64_t)a1
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v3 = *(void **)(a1 + 136);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __79__MRNowPlayingPlayerClient__onQueue_cacheContentItemChangesForPendingRequests___block_invoke;
    v5[3] = &unk_1E30C8B60;
    v6 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __79__MRNowPlayingPlayerClient__onQueue_cacheContentItemChangesForPendingRequests___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  int IsEqual;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = v21;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v13, "item");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              IsEqual = MRContentItemIdentifierIsEqual(v7, v14);

              if (IsEqual)
              {
                objc_msgSend(v13, "request");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = MRContentItemCreateFromRequest(v7, v16);

                objc_msgSend(v13, "item");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                MRContentItemMerge(v18, v17);

                goto LABEL_16;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v10)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

}

void __47__MRNowPlayingPlayerClient_initWithPlayerPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *Error;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    -[MRNowPlayingPlayerClient _handePlaybackSessionMigrateRequest:request:completion:](WeakRetained, v12, v7, v8);
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(4);
    (*((void (**)(id, id, void *))v8 + 2))(v8, v7, Error);

  }
}

- (void)_handePlaybackSessionMigrateRequest:(void *)a3 request:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  void *v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  void *v80;
  id v81;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    v47 = v9;
    objc_msgSend(a1, "supportedCommands");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke;
    v77[3] = &unk_1E30CF240;
    v49 = v7;
    v13 = v7;
    v78 = v13;
    v14 = v11;
    v79 = v14;
    v80 = a1;
    v48 = v8;
    v15 = v8;
    v81 = v15;
    v45 = MEMORY[0x194036C44](v77);
    v73[0] = v12;
    v73[1] = 3221225472;
    v73[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_3;
    v73[3] = &unk_1E30C92F0;
    v16 = v15;
    v74 = v16;
    v75 = a1;
    v17 = v14;
    v76 = v17;
    v18 = (void *)MEMORY[0x194036C44](v73);
    v69[0] = v12;
    v69[1] = 3221225472;
    v69[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_7;
    v69[3] = &unk_1E30C92F0;
    v19 = v16;
    v70 = v19;
    v20 = v17;
    v71 = v20;
    v72 = a1;
    v21 = (void *)MEMORY[0x194036C44](v69);
    v65[0] = v12;
    v65[1] = 3221225472;
    v65[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_9;
    v65[3] = &unk_1E30C92F0;
    v22 = v19;
    v66 = v22;
    v23 = v20;
    v67 = v23;
    v68 = a1;
    v24 = MEMORY[0x194036C44](v65);
    v62[0] = v12;
    v62[1] = 3221225472;
    v62[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_11;
    v62[3] = &unk_1E30CF290;
    v25 = v22;
    v63 = v25;
    v64 = a1;
    v51 = (void *)MEMORY[0x194036C44](v62);
    v58[0] = v12;
    v58[1] = 3221225472;
    v58[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_82;
    v58[3] = &unk_1E30C92F0;
    v26 = v25;
    v59 = v26;
    v46 = v23;
    v60 = v46;
    v61 = a1;
    v50 = (void *)MEMORY[0x194036C44](v58);
    v55[0] = v12;
    v55[1] = 3221225472;
    v55[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_3_86;
    v55[3] = &unk_1E30CF290;
    v27 = (void *)v45;
    v28 = (void *)v24;
    v29 = v26;
    v56 = v29;
    v57 = a1;
    v30 = (void *)MEMORY[0x194036C44](v55);
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = (void *)v45;
    if (!v13)
    {
      v33 = (void *)objc_msgSend(v51, "copy");
      v34 = (void *)MEMORY[0x194036C44]();
      objc_msgSend(v31, "addObject:", v34);

      v35 = (void *)objc_msgSend(v18, "copy");
      v36 = (void *)MEMORY[0x194036C44]();
      objc_msgSend(v31, "addObject:", v36);

      v37 = (void *)objc_msgSend(v21, "copy");
      v38 = (void *)MEMORY[0x194036C44]();
      objc_msgSend(v31, "addObject:", v38);

      v39 = (void *)objc_msgSend(v30, "copy");
      v40 = (void *)MEMORY[0x194036C44]();
      objc_msgSend(v31, "addObject:", v40);

      v41 = (void *)objc_msgSend(v50, "copy");
      v42 = (void *)MEMORY[0x194036C44]();
      objc_msgSend(v31, "addObject:", v42);

      v32 = (void *)v24;
    }
    v43 = (void *)objc_msgSend(v32, "copy", v45);
    v44 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v31, "addObject:", v44);

    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_5_90;
    v52[3] = &unk_1E30C6590;
    v10 = v47;
    v54 = v47;
    v53 = v29;
    MRPerformAsyncOperationsUntilError(v31, v52);

    v8 = v48;
    v7 = v49;
  }

}

- (BOOL)invalidatingPlaybackQueue
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __53__MRNowPlayingPlayerClient_invalidatingPlaybackQueue__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 113);
  return result;
}

- (void)setInvalidatingPlaybackQueue:(BOOL)a3
{
  NSObject *serialQueue;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD block[6];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__43;
  v13 = __Block_byref_object_dispose__43;
  v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MRNowPlayingPlayerClient_setInvalidatingPlaybackQueue___block_invoke;
  block[3] = &unk_1E30CF0A0;
  v8 = a3;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(serialQueue, block);
  if (objc_msgSend((id)v10[5], "count"))
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Sending enqueued contentItemChanges due to finished PlaybackQueueInvalidation", v6, 2u);
    }

    MRMediaRemotePlaybackQueueDataSourceSendContentItemsChangedForPlayer((void *)v10[5], self);
  }
  _Block_object_dispose(&v9, 8);

}

void __57__MRNowPlayingPlayerClient_setInvalidatingPlaybackQueue___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 113))
  {
    *(_BYTE *)(v2 + 113) = v1;
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 144));
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 144);
      *(_QWORD *)(v4 + 144) = 0;

    }
  }
}

- (void)setNowPlayingInfo:(id)a3
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
  block[2] = __46__MRNowPlayingPlayerClient_setNowPlayingInfo___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __46__MRNowPlayingPlayerClient_setNowPlayingInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "registerNowPlayingInfoBackedPlaybackQueueDataSourceCallbacks");
}

- (NSDictionary)nowPlayingInfo
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
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__MRNowPlayingPlayerClient_nowPlayingInfo__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __42__MRNowPlayingPlayerClient_nowPlayingInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setNowPlayingArtwork:(id)a3
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
  block[2] = __49__MRNowPlayingPlayerClient_setNowPlayingArtwork___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __49__MRNowPlayingPlayerClient_setNowPlayingArtwork___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "registerNowPlayingInfoBackedPlaybackQueueDataSourceCallbacks");
}

- (MRNowPlayingArtwork)nowPlayingArtwork
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
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MRNowPlayingPlayerClient_nowPlayingArtwork__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRNowPlayingArtwork *)v3;
}

void __45__MRNowPlayingPlayerClient_nowPlayingArtwork__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)setPlayerPath:(id)a3
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
  block[2] = __42__MRNowPlayingPlayerClient_setPlayerPath___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __42__MRNowPlayingPlayerClient_setPlayerPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "player");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setPlayer:", v2);

}

- (void)updatePlayer:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  MRNowPlayingPlayerClient *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRNowPlayingPlayerClient_updatePlayer___block_invoke;
  block[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __41__MRNowPlayingPlayerClient_updatePlayer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mergeFrom:", v4);

}

- (unint64_t)capabilities
{
  NSObject *serialQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MRNowPlayingPlayerClient_capabilities__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRNowPlayingPlayerClient_capabilities__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (MRContentItem)nowPlayingContentItem
{
  void *v2;
  void *v3;
  void *v4;

  -[MRNowPlayingPlayerClient playbackQueue](self, "playbackQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItemWithOffset:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (MRContentItem *)v4;
}

- (BOOL)isPictureInPictureEnabled
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MRNowPlayingPlayerClient_isPictureInPictureEnabled__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__MRNowPlayingPlayerClient_isPictureInPictureEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 112);
  return result;
}

- (void)setPictureInPictureEnabled:(BOOL)a3
{
  NSObject *serialQueue;
  MRPlayerPath *playerPath;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  BOOL v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MRNowPlayingPlayerClient_setPictureInPictureEnabled___block_invoke;
  block[3] = &unk_1E30C74F8;
  block[4] = self;
  v11 = a3;
  dispatch_sync(serialQueue, block);
  playerPath = self->_playerPath;
  v12 = CFSTR("kMRNowPlayingPlayerPathUserInfoKey");
  v13[0] = playerPath;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateDecodedUserInfo(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchNotification:userInfo:object:", CFSTR("kMRMediaRemotePlayerPictureInPictureDidChange"), v9, 0);

}

uint64_t __55__MRNowPlayingPlayerClient_setPictureInPictureEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 112) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setActiveRequestedDate:(id)a3
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
  block[2] = __51__MRNowPlayingPlayerClient_setActiveRequestedDate___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __51__MRNowPlayingPlayerClient_setActiveRequestedDate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

- (void)preProcessChangePlaybackRateCommandWithOptions:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  id v10;
  id v11;
  float (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  float v14;
  float v15;
  void *v16;
  double v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke;
    v28[3] = &unk_1E30CF0C8;
    v6 = v3;
    v29 = v6;
    v7 = (void *)MEMORY[0x194036C44](v28);
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_2;
    v27[3] = &unk_1E30CF0F0;
    v27[4] = a1;
    v8 = (void (**)(_QWORD))MEMORY[0x194036C44](v27);
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_3;
    v26[3] = &unk_1E30CF118;
    v26[4] = a1;
    v9 = (void (**)(_QWORD))MEMORY[0x194036C44](v26);
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_4;
    v23[3] = &unk_1E30CF140;
    v10 = v6;
    v24 = v10;
    v11 = v7;
    v25 = v11;
    v12 = (float (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v23);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionPlaybackRate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionPredefinedPlaybackRate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v22 = v4;
      v8[2](v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      if (v19 == 0.0)
      {
        v15 = (*((float (**)(id, uint64_t))v11 + 2))(v11, objc_msgSend(v16, "intValue"));
      }
      else
      {
        v9[2](v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = ((float (**)(_QWORD, void *, void *))v12)[2](v12, v18, v20);

      }
      v4 = v22;
    }
    *(float *)&v17 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("kMRMediaRemoteOptionPlaybackRate"));

  }
}

float __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke(uint64_t a1, int a2)
{
  float v2;
  float v3;
  void *v4;
  void *v5;
  float v6;

  if (a2)
  {
    v2 = 0.0;
    if (a2 == 1)
      v2 = 2.0;
    if (a2 == 2)
      return 0.5;
    else
      return v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "floatValue");
      v3 = v6;
    }
    else
    {
      v3 = 1.0;
    }

  }
  return v3;
}

id __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "nowPlayingContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v3 = MRContentItemGetPlaybackRate(v2);
  objc_msgSend(v1, "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_3(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v2 = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v5, "command", (_QWORD)v9) == 19)
        {
          objc_msgSend(v5, "options");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackRates"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
          v2 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v2 = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

float __75__MRNowPlayingPlayerClient_preProcessChangePlaybackRateCommandWithOptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  float v9;
  float v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");
  if (v8 == 2)
  {
    objc_msgSend(v5, "floatValue");
    v9 = v10;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v6, "reverseObjectEnumerator", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
LABEL_7:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "floatValue");
        if (v9 > v16)
          goto LABEL_23;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v13)
            goto LABEL_7;
          break;
        }
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v8 == 1)
  {
    objc_msgSend(v5, "floatValue");
    v9 = v17;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v6;
    v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
LABEL_16:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v21), "floatValue");
        if (v9 < v16)
          break;
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          if (v19)
            goto LABEL_16;
          goto LABEL_24;
        }
      }
LABEL_23:
      v9 = v16;
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  v9 = 0.0;
  if (!v8)
    v9 = (*(float (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_25:

  return v9;
}

- (unsigned)resolveCommand:(unsigned int)a3
{
  NSObject *serialQueue;
  unsigned int v6;
  _QWORD block[6];
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = a3;
  if (MRMediaRemoteCommandIsContextual(a3))
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__MRNowPlayingPlayerClient_resolveCommand___block_invoke;
    block[3] = &unk_1E30CF168;
    v9 = a3;
    block[4] = self;
    block[5] = &v10;
    dispatch_sync(serialQueue, block);
  }
  v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __43__MRNowPlayingPlayerClient_resolveCommand___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "nowPlayingInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoTotalChapterCount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v3, "intValue") > 1;

    v2 = v9;
  }
  else
  {
    v4 = 0;
  }
  v5 = *(_DWORD *)(a1 + 48);
  if (v5 == 110)
  {
    v6 = 5;
    if (v4)
    {
      v7 = MRMediaRemoteSupportsCommand(*(void **)(*(_QWORD *)(a1 + 32) + 48), 110) == 0;
      v2 = v9;
      v8 = 101;
LABEL_10:
      if (!v7)
        v6 = v8;
    }
LABEL_12:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
    goto LABEL_13;
  }
  if (v5 == 109)
  {
    v6 = 4;
    if (v4)
    {
      v7 = MRMediaRemoteSupportsCommand(*(void **)(*(_QWORD *)(a1 + 32) + 48), 109) == 0;
      v2 = v9;
      v8 = 100;
      goto LABEL_10;
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (id)resolveCommandOptions:(unsigned int)a3 options:(id)a4
{
  void *v6;
  NSObject *serialQueue;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  unsigned int v14;

  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MRNowPlayingPlayerClient_resolveCommandOptions_options___block_invoke;
  block[3] = &unk_1E30C7610;
  v14 = a3;
  block[4] = self;
  v8 = v6;
  v13 = v8;
  dispatch_sync(serialQueue, block);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __58__MRNowPlayingPlayerClient_resolveCommandOptions_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_DWORD *)(a1 + 48) == 19)
    -[MRNowPlayingPlayerClient preProcessChangePlaybackRateCommandWithOptions:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

}

- (BOOL)hasReceivedCommandRecently
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MRNowPlayingPlayerClient_hasReceivedCommandRecently__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__54__MRNowPlayingPlayerClient_hasReceivedCommandRecently__block_invoke(uint64_t a1)
{
  void *result;
  double v3;
  BOOL v4;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (result)
  {
    result = (void *)objc_msgSend(result, "timeIntervalSinceNow");
    v4 = fabs(v3) < 5.0;
  }
  else
  {
    v4 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (void)setHomeUserIdentifier:(id)a3
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
  block[2] = __50__MRNowPlayingPlayerClient_setHomeUserIdentifier___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __50__MRNowPlayingPlayerClient_setHomeUserIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (void)appendHomeUserIdentifier:(id)a3
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
  block[2] = __53__MRNowPlayingPlayerClient_appendHomeUserIdentifier___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __53__MRNowPlayingPlayerClient_appendHomeUserIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(_QWORD *)(v4 + 152) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)clearHomeUserIdentifiers
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRNowPlayingPlayerClient_clearHomeUserIdentifiers__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __52__MRNowPlayingPlayerClient_clearHomeUserIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 152);
  *(_QWORD *)(v1 + 152) = 0;

}

- (void)restoreNowPlayingClientState
{
  uint64_t v3;
  NSObject *serialQueue;
  _QWORD v5[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MRNowPlayingPlayerClient_restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __56__MRNowPlayingPlayerClient_restoreNowPlayingClientState__block_invoke_2;
  v5[3] = &unk_1E30CF1B0;
  v5[4] = self;
  -[MRNowPlayingPlayerClient flushPendingPlaybackSessionMigrateEvents:](self, "flushPendingPlaybackSessionMigrateEvents:", v5);
}

void __56__MRNowPlayingPlayerClient_restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetCanBeNowPlayingAppForPlayer(v3, 1, *(void **)(*(_QWORD *)(a1 + 32) + 160), *(double *)(*(_QWORD *)(a1 + 32) + 32));
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 88))
  {
    v4 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetNowPlayingPlaybackQueueCapabilities(v4, *(void **)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 0, 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 40))
  {
    v5 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetNowPlayingPlaybackQueue(v5, *(void **)(*(_QWORD *)(a1 + 32) + 160), *(void **)(*(_QWORD *)(a1 + 32) + 40), 0, 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 48))
  {
    v6 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetSupportedCommands(v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(void **)(*(_QWORD *)(a1 + 32) + 160), 0, 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_DWORD *)(v2 + 72))
  {
    v7 = (void *)MRGetSharedService();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 160);
    v10 = *(_DWORD *)(v8 + 72);
    objc_msgSend(*(id *)(v8 + 80), "timeIntervalSinceReferenceDate");
    MRMediaRemoteServiceSetPlaybackState(v7, v9, v10, 0, 0, v11);
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 112))
  {
    v12 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetPictureInPictureEnabledForPlayer(v12, *(void **)(*(_QWORD *)(a1 + 32) + 160), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 112), 0, 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 160), "player");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "hasAuxiliaryProperties"))
  {
    v13 = (void *)MRGetSharedService();
    MRMediaRemoteServiceUpdatePlayerProperties(v13, *(void **)(*(_QWORD *)(a1 + 32) + 160), 0, 0);
  }

}

void __56__MRNowPlayingPlayerClient_restoreNowPlayingClientState__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void (**v5)(id, id, void *, void *);

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v3 = a2;
  objc_msgSend(v2, "playbackSessionMigrateEndCallback");
  v5 = (void (**)(id, id, void *, void *))objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 1, CFSTR("mediaremoted exited in the middle of a migration attempt"));
  v5[2](v5, v3, v4, &__block_literal_global_97);

}

- (void)clearCachedContentItemArtworkForItems:(id)a3
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
  block[2] = __66__MRNowPlayingPlayerClient_clearCachedContentItemArtworkForItems___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __66__MRNowPlayingPlayerClient_clearCachedContentItemArtworkForItems___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__MRNowPlayingPlayerClient_clearCachedContentItemArtworkForItems___block_invoke_2;
  v3[3] = &unk_1E30C8B60;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __66__MRNowPlayingPlayerClient_clearCachedContentItemArtworkForItems___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  int IsEqual;
  void *v16;
  id obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v8 = v19;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v13, "item");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              IsEqual = MRContentItemIdentifierIsEqual(v7, v14);

              if (IsEqual)
              {
                objc_msgSend(v13, "item");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                MRContentItemSetArtworkData(v16, 0);

                goto LABEL_16;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v10)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

}

- (void)addPendingPlaybackSessionMigrateEvent:(id)a3
{
  id v5;
  void *v6;
  NSObject *serialQueue;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingPlayerClient.m"), 631, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  objc_msgSend(v5, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingPlayerClient.m"), 632, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.requestIdentifier"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRNowPlayingPlayerClient_addPendingPlaybackSessionMigrateEvent___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_sync(serialQueue, block);

}

void __66__MRNowPlayingPlayerClient_addPendingPlaybackSessionMigrateEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "requestIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, v7);

}

- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3
{
  id v5;
  void *v6;
  NSObject *serialQueue;
  id v8;
  char v9;
  void *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingPlayerClient.m"), 646, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  objc_msgSend(v5, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingPlayerClient.m"), 647, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.requestIdentifier"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MRNowPlayingPlayerClient_removePendingPlaybackSessionMigrateEvent___block_invoke;
  block[3] = &unk_1E30C8C28;
  block[4] = self;
  v14 = v5;
  v15 = &v16;
  v8 = v5;
  dispatch_sync(serialQueue, block);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __69__MRNowPlayingPlayerClient_removePendingPlaybackSessionMigrateEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *serialQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__43;
    v19 = __Block_byref_object_dispose__43;
    v20 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MRNowPlayingPlayerClient_flushPendingPlaybackSessionMigrateEvents___block_invoke;
    block[3] = &unk_1E30C5D20;
    block[4] = self;
    block[5] = &v15;
    dispatch_sync(serialQueue, block);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = (id)v16[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
      }
      while (v7);
    }

    _Block_object_dispose(&v15, 8);
  }

}

uint64_t __69__MRNowPlayingPlayerClient_flushPendingPlaybackSessionMigrateEvents___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeAllObjects");
}

- (void)invalidatePlaybackQueue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MRPlayerPath *playerPath;
  void *v8;
  void *v9;
  _QWORD v10[5];

  kdebug_trace();
  -[MRNowPlayingPlayerClient setInvalidatingPlaybackQueue:](self, "setInvalidatingPlaybackQueue:", 1);
  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("PlaybackQueueInvalidation-"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestIdentifier:", v6);

  playerPath = self->_playerPath;
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playbackQueueDispatchQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__MRNowPlayingPlayerClient_invalidatePlaybackQueue__block_invoke;
  v10[3] = &unk_1E30C7FA0;
  v10[4] = self;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v3, playerPath, v9, v10);

}

uint64_t __51__MRNowPlayingPlayerClient_invalidatePlaybackQueue__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidatePlaybackQueueWithPlaybackQueue:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "setInvalidatingPlaybackQueue:", 0);
}

- (void)_onQueue_enqueueContentItemChangesForPendingPlaybackQueueInvalidation:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (!*(_BYTE *)(a1 + 113))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__onQueue_enqueueContentItemChangesForPendingPlaybackQueueInvalidation_, a1, CFSTR("MRNowPlayingPlayerClient.m"), 799, CFSTR("Cannot enqueue contentItemChanges when the playback queue is not invalidating"));

    }
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingPlayerClient] Enqueing contentItemChange due to pending PlaybackQueueInvalidation", v8, 2u);
    }

    if (objc_msgSend(v3, "count") && !*(_QWORD *)(a1 + 144))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v5;

    }
    objc_msgSend(*(id *)(a1 + 144), "addObjectsFromArray:", v3);
  }

}

uint64_t __66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_49(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void *__66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_52(uint64_t a1, void *a2)
{
  return MRMediaRemoteCopyCommandDescription(objc_msgSend(a2, "intValue"));
}

void *__66__MRNowPlayingPlayerClient_setSupportedCommands_queue_completion___block_invoke_54(uint64_t a1, void *a2)
{
  return MRMediaRemoteCopyCommandDescription(objc_msgSend(a2, "intValue"));
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  void (**v33)(_QWORD, _QWORD);

  v3 = a2;
  v4 = (void (**)(_QWORD, _QWORD))v3;
  if (a1[4])
  {
    if (!MRMediaRemoteCommandInfoSupportedCommandIsEnabled(a1[5], 133))
    {
      v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v29 = MRMediaRemoteCopyCommandDescription(133);
      objc_msgSend(a1[6], "playerPath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v28, "initWithMRError:format:", 3, CFSTR("%@ not supported and/or enabled for %@"), v29, v30);

      ((void (**)(_QWORD, id))v4)[2](v4, v5);
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(a1[7], "startEvent:", CFSTR("setPlaybackSession"));
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(a1[7], "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("migrationPlaybackSession<%@>"), v7);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    objc_msgSend(a1[4], "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("kMRMediaRemoteOptionPlaybackSessionData"));

    objc_msgSend(a1[7], "contentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(a1[7], "contentItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "metadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isAlwaysLive");

      if ((v15 & 1) != 0)
      {
LABEL_7:
        objc_msgSend(a1[7], "playbackPosition");
        if (v17 > 0.0)
        {
          v18 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(a1[7], "playbackPosition");
          objc_msgSend(v18, "numberWithDouble:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("kMRMediaRemoteOptionPlaybackPosition"));

        }
        objc_msgSend(a1[7], "playbackRate");
        if (v20 > 0.0)
        {
          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(a1[7], "playbackRate");
          objc_msgSend(v21, "numberWithDouble:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("kMRMediaRemoteOptionPlaybackRate"));

        }
        objc_msgSend(a1[7], "requestID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("kMRMediaRemoteOptionContextID"));

        v24 = a1[6];
        v25 = a1[7];
        v26 = (void *)v24[20];
        v27 = (void *)v24[1];
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_2;
        v31[3] = &unk_1E30C9458;
        v32 = v25;
        v33 = v4;
        MRMediaRemoteSendCommandToPlayer(133, v5, v26, 0, v27, v31);

        goto LABEL_14;
      }
      objc_msgSend(a1[7], "contentItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("kMRMediaRemoteOptionContentItemID"));

    }
    goto LABEL_7;
  }
  (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
LABEL_15:

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("setPlaybackSession"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_3(id *a1, void *a2)
{
  void (**v3)(id, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int IsEqual;
  MRPlaybackQueueRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  MRPlaybackQueueRequest *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (**v20)(id, _QWORD);
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "contentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  objc_msgSend(a1[4], "contentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAlwaysLive");

  if (v7
    || (objc_msgSend(a1[4], "contentItem"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1[5], "nowPlayingContentItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        IsEqual = MRContentItemIdentifierIsEqual(v8, v9),
        v9,
        v8,
        IsEqual)
    || !MRMediaRemoteCommandInfoSupportedCommandIsEnabled(a1[6], 131))
  {
LABEL_6:
    v3[2](v3, 0);
  }
  else
  {
    objc_msgSend(a1[4], "startEvent:", CFSTR("playItemInQueue"));
    v11 = [MRPlaybackQueueRequest alloc];
    objc_msgSend(a1[4], "contentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MRPlaybackQueueRequest initWithIdentifiers:](v11, "initWithIdentifiers:", v14);

    v17 = a1[4];
    v16 = a1[5];
    v18 = v16[20];
    v19 = v16[1];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_4;
    v21[3] = &unk_1E30CF268;
    v22 = v17;
    v20 = v3;
    v23 = a1[5];
    v24 = v20;
    MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v15, v18, v19, v21);

  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *ErrorWithDescription;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(_QWORD, _QWORD);
  _QWORD v26[4];
  id v27;
  id v28;

  v4 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_5;
  v26[3] = &unk_1E30C75E8;
  v27 = *(id *)(a1 + 32);
  v28 = *(id *)(a1 + 48);
  v5 = a2;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v26);
  objc_msgSend(*(id *)(a1 + 32), "contentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentItemForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("migrationPlaybackSession<%@>"), v12);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    objc_msgSend(*(id *)(a1 + 32), "contentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("kMRMediaRemoteOptionContentItemID"));

    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("kMRMediaRemoteOptionContextID"));

    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(void **)(v17 + 160);
    v19 = *(void **)(v17 + 8);
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_6;
    v24[3] = &unk_1E30CA948;
    v25 = v6;
    MRMediaRemoteSendCommandToPlayer(131, v10, v18, 0, v19, v24);
    ErrorWithDescription = v25;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "contentItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MRContentItemCopyMinimalReadableDescription(v22);
    v10 = (id)objc_msgSend(v21, "initWithFormat:", CFSTR("ContentItemID %@ was not found in the playbackQueue for %@"), v23, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160));

    ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(2, (uint64_t)v10);
    ((void (**)(_QWORD, void *))v6)[2](v6, ErrorWithDescription);
  }

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("playItemInQueue"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_7(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  double v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, _QWORD);

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playbackPosition");
  if (v4 == 0.0 || !MRMediaRemoteCommandInfoSupportedCommandIsEnabled(*(void **)(a1 + 40), 24))
  {
    v3[2](v3, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("seek"));
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "playbackPosition");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kMRMediaRemoteOptionPlaybackPosition"));

    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(16);
    v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("migrationPlaybackSession<%@> for option %@"), v9, v10);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("kMRMediaRemoteOptionContextID"));

    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(v13 + 160);
    v15 = *(void **)(v13 + 8);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_8;
    v16[3] = &unk_1E30C9458;
    v17 = *(id *)(a1 + 32);
    v18 = v3;
    MRMediaRemoteSendCommandToPlayer(24, v5, v14, 0, v15, v16);

  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("seek"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_9(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, _QWORD);

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playbackRate");
  if (v4 == 0.0
    || (objc_msgSend(*(id *)(a1 + 32), "playbackRate"), v5 == 1.0)
    || !MRMediaRemoteCommandInfoSupportedCommandIsEnabled(*(void **)(a1 + 40), 19))
  {
    v3[2](v3, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("setRate"));
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "playbackRate");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kMRMediaRemoteOptionPlaybackRate"));

    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(32);
    v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("migrationPlaybackSession<%@> for option %@"), v10, v11);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("kMRMediaRemoteOptionContextID"));

    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(void **)(v14 + 160);
    v16 = *(void **)(v14 + 8);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_10;
    v17[3] = &unk_1E30C9458;
    v18 = *(id *)(a1 + 32);
    v19 = v3;
    MRMediaRemoteSendCommandToPlayer(19, v6, v15, 0, v16, v17);

  }
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("setRate"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  MRNowPlayingRequest *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "allowFadeTransition"))
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("requestFadeInOnDestination"));
    v4 = -[MRNowPlayingRequest initWithPlayerPath:]([MRNowPlayingRequest alloc], "initWithPlayerPath:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160));
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_12;
    v7[3] = &unk_1E30C75E8;
    v8 = v5;
    v9 = v3;
    -[MRNowPlayingRequest triggerAudioFadeInWithReplyQueue:completion:](v4, "triggerAudioFadeInWithReplyQueue:completion:", v6, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_12_cold_1((uint64_t)v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "endEvent:", CFSTR("requestFadeInOnDestination"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "playbackState") == 1
    && MRMediaRemoteCommandInfoSupportedCommandIsEnabled(*(void **)(a1 + 40), 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("play"));
    if ((objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 4) != 0)
      v4 = 4;
    else
      v4 = 2;
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(v4);
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("migrationPlaybackSession<%@> for option %@"), v7, v8);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("kMRMediaRemoteOptionContextID"));

    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(v11 + 160);
    v13 = *(void **)(v11 + 8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_2_85;
    v14[3] = &unk_1E30C9458;
    v15 = *(id *)(a1 + 32);
    v16 = v3;
    MRMediaRemoteSendCommandToPlayer(0, v5, v12, 0, v13, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_2_85(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("play"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_3_86(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "endpointOptions") & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("resetOutputContext"));
    v4 = (void *)MRGetSharedService();
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_4_89;
    v8[3] = &unk_1E30C75E8;
    v9 = v6;
    v10 = v3;
    MRMediaRemoteServiceResetOutputContext(v4, v5, v7, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_4_89(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("resetOutputContext"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_5_90(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (id)description
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
  v7 = __Block_byref_object_copy__43;
  v8 = __Block_byref_object_dispose__43;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __39__MRNowPlayingPlayerClient_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)MRNowPlayingPlayerClient;
  objc_msgSendSuper2(&v6, sel_description);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("PlayerPath: %@ Supported Commands: %@ PlaybackQueue %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

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
  v7 = __Block_byref_object_copy__43;
  v8 = __Block_byref_object_dispose__43;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __44__MRNowPlayingPlayerClient_debugDescription__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void *v30;

  v28 = (void *)MEMORY[0x1E0CB3940];
  v29 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v29[20];
  objc_msgSend(v2, "player");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(*(void **)(*(_QWORD *)(a1 + 32) + 48));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(_QWORD *)(a1 + 32) + 56));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v25 = *(_QWORD *)(v4 + 64);
  v26 = (void *)v3;
  v5 = MRMediaRemoteCopyPlaybackStateDescription(*(_DWORD *)(v4 + 72));
  v6 = *(_QWORD *)(a1 + 32);
  v23 = *(_QWORD *)(v6 + 80);
  v24 = (__CFString *)v5;
  MRCreateIndentedDebugDescriptionFromObject(*(void **)(v6 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 88);
  v10 = CFSTR("NO");
  if (*(_BYTE *)(v8 + 113))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = *(_QWORD *)(v8 + 120);
  MRCreateIndentedDebugDescriptionFromObject(*(void **)(v8 + 136));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v14 + 112))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(v14 + 104), 2, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v17 + 24))
    v10 = CFSTR("YES");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v17 + 32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("    playerPath = %@\n    player = %@\n    supportedCommands = %@\n    nowPlayingInfo = %@\n    nowPlayingArtwork = %@\n    playbackState = %@\n    playbackStateDate= %@\n    playbackQueue = %@\n    capabilities = %ld\n    triggerInvalidation = %@\n    invalidatationTimestamp = %lf\n    cachedContentItemUpdates = %@\n    pictureInPictureEnabled = %@\n    activeRequestDate = %@\n    canBeNowPlaying = %@\n    canBeNowPlayingTimestamp = %@\n    homeUserIdentifiers = %@"), v2, v30, v27, v26, v25, v24, v23, v7, v9, v11, v12, v13, v15, v16, v10, v18,
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateFormattedDebugDescriptionFromClass(v29, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCallbacks, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_enqueuedContentItemChangesForPendingPlaybackQueueInvalidation, 0);
  objc_storeStrong((id *)&self->_cachedContentItemChangedForPendingPlaybackQueueRequest, 0);
  objc_storeStrong((id *)&self->_pendingPlaybackSessionMigrateEvents, 0);
  objc_storeStrong((id *)&self->_activeRequestedDate, 0);
  objc_storeStrong((id *)&self->_lastReceivedCommandDate, 0);
  objc_storeStrong((id *)&self->_playbackStateDate, 0);
  objc_storeStrong((id *)&self->_nowPlayingArtwork, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_replayQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __83__MRNowPlayingPlayerClient_updatePlaybackQueueWithCachedUpdates_forPendingRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "minimalReadableDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  v6 = 138412546;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[MRNowPlayingPlayerClient] Attempting to update playbackQueue response %@ without a pending request %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)sendContentItemChanges:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_13(&dword_193827000, a4, a3, "[MRNowPlayingPlayerClient] Attempting to send contentItemChange for path %{public}@ %@", (uint8_t *)a3);

}

- (void)setSupportedCommands:(uint64_t *)a1 queue:(NSObject *)a2 completion:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification");
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_0_13(&dword_193827000, a2, a3, "Sending short circuted notification %@ for %@", (uint8_t *)&v4);
}

void __83__MRNowPlayingPlayerClient__handePlaybackSessionMigrateRequest_request_completion___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[MRNowPlayingPlayerClient] Fade in trigger failed with error %@", (uint8_t *)&v2, 0xCu);
}

@end
