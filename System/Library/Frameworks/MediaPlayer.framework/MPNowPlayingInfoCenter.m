@implementation MPNowPlayingInfoCenter

void __49__MPNowPlayingInfoCenter_playbackQueueDataSource__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __58__MPNowPlayingInfoCenter__contentItemChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  float v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  qos_class_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  dispatch_block_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _QWORD block[5];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(objc_retainAutorelease(v4), "_mediaRemoteContentItem");
    MRContentItemMerge();
    v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      v8 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v9 = *(_QWORD *)(v8 + 304);
      v10 = v6;
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v48 = v6;
      v49 = 2048;
      v50 = v8;
      v51 = 2112;
      v52 = v9;
      v53 = 2114;
      v54 = v11;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> Content item mutated [already enqueued for update]: %{public}@", buf, 0x2Au);

    }
  }
  else
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      v15 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      v16 = *(_QWORD *)(v15 + 304);
      v17 = v13;
      objc_msgSend(v14, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v48 = v13;
      v49 = 2048;
      v50 = v15;
      v51 = 2112;
      v52 = v16;
      v53 = 2114;
      v54 = v18;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> Content item mutated: %{public}@", buf, 0x2Au);

    }
    v5 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", *(_QWORD *)(a1 + 56));
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v5, v20);

  }
  objc_msgSend(*(id *)(a1 + 48), "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaRequest"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      MRPlaybackQueueRequestMerge();
    }
    else
    {
      v26 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, v27);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("_MPContentItemDidChangeUserInfoKeyImmediately"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "BOOLValue");

  if (v30)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushContentItemsUpdate");
    goto LABEL_25;
  }
  MRContentItemGetPlaybackRate();
  v32 = v31 > 2.2204e-16;
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(void **)(v33 + 160);
  if (v31 <= 2.2204e-16)
  {
    if (v34)
      goto LABEL_25;
    v38 = qos_class_self();
    if ((MSVDeviceIsWatch() & 1) != 0)
    {
      v35 = 0.2;
    }
    else if (MSVDeviceIsAudioAccessory())
    {
      v35 = 0.2;
    }
    else
    {
      v35 = 0.1;
    }
LABEL_24:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = v32;
    v39 = (void *)MEMORY[0x1E0D4D110];
    v40 = *(_QWORD *)(a1 + 32);
    v41 = *(_QWORD *)(v40 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MPNowPlayingInfoCenter__contentItemChangedNotification___block_invoke_191;
    block[3] = &unk_1E3163508;
    block[4] = v40;
    v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v38, 0, block);
    objc_msgSend(v39, "timerWithInterval:repeats:queue:block:", 0, v41, v42, v35);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(_QWORD *)(a1 + 32);
    v45 = *(void **)(v44 + 160);
    *(_QWORD *)(v44 + 160) = v43;

    goto LABEL_25;
  }
  v35 = 0.01;
  if (!v34
    || !*(_BYTE *)(v33 + 168)
    && (objc_msgSend(v34, "invalidate"),
        v36 = *(_QWORD *)(a1 + 32),
        v37 = *(void **)(v36 + 160),
        *(_QWORD *)(v36 + 160) = 0,
        v37,
        !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160)))
  {
    v38 = QOS_CLASS_USER_INITIATED;
    goto LABEL_24;
  }
LABEL_25:

}

- (NSString)playerID
{
  void *v2;
  void *v3;
  void *v4;

  -[MRPlayerPath player](self->_playerPath, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

void __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nowPlayingInfoCenter:contentItemForID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_contentItemForIdentifier:(id)a3 alreadyOnDataSourceQueue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD *);
  void *v21;
  MPNowPlayingInfoCenter *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a4;
  v6 = a3;
  if (v4)
    MEMORY[0x1E0C82BE8](self->_dataSourceQueue);
  else
    MEMORY[0x1E0C82BF8](self->_dataSourceQueue);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__29301;
  v29 = __Block_byref_object_dispose__29302;
  v30 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke;
  v21 = &unk_1E31635A8;
  v24 = &v25;
  v22 = self;
  v8 = v6;
  v23 = v8;
  msv_dispatch_sync_on_queue();
  if (!v26[5])
  {
    -[MPNowPlayingInfoCenter playbackQueueDataSource](self, "playbackQueueDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_2;
      v15[3] = &unk_1E31635A8;
      v17 = &v25;
      v15[4] = self;
      v16 = v8;
      v11 = MEMORY[0x19403A810](v15);
      v12 = (void *)v11;
      if (v4)
        (*(void (**)(uint64_t))(v11 + 16))(v11);
      else
        msv_dispatch_sync_on_queue();

    }
  }
  v13 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v13;
}

- (MPNowPlayingPlaybackQueueDataSource)playbackQueueDataSource
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
  v7 = __Block_byref_object_copy__29301;
  v8 = __Block_byref_object_dispose__29302;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPNowPlayingPlaybackQueueDataSource *)v2;
}

void __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  __int128 v7;
  __int128 v8;
  _QWORD block[5];
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;

  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_3;
  v11[3] = &unk_1E31635A8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 40);
  v3 = (id)v7;
  v12 = v7;
  +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v11);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 40);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_4;
  block[3] = &unk_1E31635A8;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v10 = v8;
  dispatch_async(v5, block);

}

uint64_t __39__MPNowPlayingInfoCenter_isInvalidated__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 280);
  return result;
}

uint64_t __64__MPNowPlayingInfoCenter_invalidatePlaybackQueueWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlaybackQueueImmediatelyWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)invalidatePlaybackQueue
{
  -[MPNowPlayingInfoCenter invalidatePlaybackQueueWithCompletion:](self, "invalidatePlaybackQueueWithCompletion:", &__block_literal_global_40);
}

void __64__MPNowPlayingInfoCenter__getMetadataForContentItem_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 120), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_contentItemChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  void *v12;

  v8 = a3;
  objc_msgSend(v8, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__MPNowPlayingInfoCenter__contentItemChangedNotification___block_invoke;
      block[3] = &unk_1E315BAC0;
      block[4] = self;
      v10 = v4;
      v12 = v6;
      v11 = v8;
      dispatch_sync(accessQueue, block);

    }
  }

}

void __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 120), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__MPNowPlayingInfoCenter_defaultCenter__block_invoke()
{
  MPNowPlayingInfoCenter *v0;
  void *v1;

  v0 = -[MPNowPlayingInfoCenter initWithPlayerID:]([MPNowPlayingInfoCenter alloc], "initWithPlayerID:", 0);
  v1 = (void *)defaultCenter___defaultCenter;
  defaultCenter___defaultCenter = (uint64_t)v0;

}

- (MPNowPlayingInfoCenter)initWithPlayerID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MPNowPlayingInfoCenter *v11;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5F0]), "initWithIdentifier:displayName:", v4, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4C5F0], "defaultPlayer");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  v7 = objc_alloc(MEMORY[0x1E0D4C5F8]);
  objc_msgSend(MEMORY[0x1E0D4C5B8], "localOrigin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4C510], "localClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithOrigin:client:player:", v8, v9, v6);

  v11 = -[MPNowPlayingInfoCenter initWithPlayerPath:](self, "initWithPlayerPath:", v10);
  return v11;
}

- (MPNowPlayingInfoCenter)initWithPlayerPath:(id)a3
{
  id v5;
  MPNowPlayingInfoCenter *v6;
  MPNowPlayingInfoCenter *v7;
  uint64_t v8;
  MPNowPlayingInfoCenter *v9;
  uint64_t v10;
  MRPlayerPath *playerPath;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v18;
  OS_dispatch_queue *calloutQueue;
  dispatch_queue_t v20;
  OS_dispatch_queue *utilityQueue;
  MPArtworkResizeUtility *v22;
  MPArtworkResizeUtility *artworkResizeUtility;
  uint64_t v24;
  NSMutableArray *contentItemIdentifiers;
  uint64_t v26;
  MSVLRUDictionary *contentItems;
  uint64_t v28;
  NSMutableDictionary *mutatedContentItems;
  uint64_t v30;
  NSMutableDictionary *mutatedPlaybackQueueRequests;
  void *v32;
  MPNowPlayingInfoCenter *v33;
  void *v35;
  _QWORD v36[5];
  _QWORD block[4];
  MPNowPlayingInfoCenter *v38;
  objc_super v39;

  v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MPNowPlayingInfoCenter;
  v6 = -[MPNowPlayingInfoCenter init](&v39, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke;
  block[3] = &unk_1E3163508;
  v9 = v6;
  v38 = v9;
  if (initWithPlayerPath__onceToken != -1)
  {
    dispatch_once(&initWithPlayerPath__onceToken, block);
    if (v5)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (!v5)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0D4C5F8], "localPlayerPath");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_5:
  v10 = objc_msgSend(v5, "copy");
  playerPath = v9->_playerPath;
  v9->_playerPath = (MRPlayerPath *)v10;

  objc_msgSend((id)objc_opt_class(), "infoCenterForPlayerPath:", v9->_playerPath);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MPNowPlayingInfoCenter.m"), 131, CFSTR("Cannot have two MPNowPlayingInfoCenters for the same playerPath: %@"), v5);

  }
  objc_opt_class();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  objc_msgSend((id)__infoCenterMap, "setObject:forKey:", v9, v9->_playerPath);
  objc_sync_exit(v13);

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v9->_dataSourceQueue, MEMORY[0x1E0C80D38]);
  v16 = dispatch_queue_create("com.apple.MediaPlayer.MPNowPlayingInfoCenter/accessQueue", 0);
  accessQueue = v9->_accessQueue;
  v9->_accessQueue = (OS_dispatch_queue *)v16;

  v18 = dispatch_queue_create("com.apple.MediaPlayer.MPNowPlayingInfoCenter/calloutQueue", v14);
  calloutQueue = v9->_calloutQueue;
  v9->_calloutQueue = (OS_dispatch_queue *)v18;

  v20 = dispatch_queue_create("com.apple.MediaPlayer.MPNowPlayingInfoCenter/utilityQueue", v15);
  utilityQueue = v9->_utilityQueue;
  v9->_utilityQueue = (OS_dispatch_queue *)v20;

  v22 = -[MPArtworkResizeUtility initWithQualityOfService:]([MPArtworkResizeUtility alloc], "initWithQualityOfService:", 17);
  artworkResizeUtility = v9->_artworkResizeUtility;
  v9->_artworkResizeUtility = v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = objc_claimAutoreleasedReturnValue();
  contentItemIdentifiers = v9->_contentItemIdentifiers;
  v9->_contentItemIdentifiers = (NSMutableArray *)v24;

  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D078]), "initWithMaximumCapacity:", 201);
  contentItems = v9->_contentItems;
  v9->_contentItems = (MSVLRUDictionary *)v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = objc_claimAutoreleasedReturnValue();
  mutatedContentItems = v9->_mutatedContentItems;
  v9->_mutatedContentItems = (NSMutableDictionary *)v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = objc_claimAutoreleasedReturnValue();
  mutatedPlaybackQueueRequests = v9->_mutatedPlaybackQueueRequests;
  v9->_mutatedPlaybackQueueRequests = (NSMutableDictionary *)v30;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", v9, sel__contentItemChangedNotification_, CFSTR("_MPContentItemDidChangeNotification"), 0);

  -[MPNowPlayingInfoCenter _initializeNowPlayingInfo](v9, "_initializeNowPlayingInfo");
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke_2;
  v36[3] = &unk_1E315D7F8;
  v36[4] = v9;
  v33 = v9;
  v33->_stateHandle = __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke_2((uint64_t)v36);

LABEL_8:
  return v7;
}

uint64_t __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v3, &location);
  v1 = MSVLogAddStateHandler();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
  return v1;
}

- (void)_initializeNowPlayingInfo
{
  MPNowPlayingInfoCenterArtworkContext *v3;
  MPNowPlayingInfoCenterArtworkContext *publishedContext;

  v3 = objc_alloc_init(MPNowPlayingInfoCenterArtworkContext);
  publishedContext = self->_publishedContext;
  self->_publishedContext = v3;

}

+ (id)infoCenterForPlayerID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D4C5F0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIdentifier:displayName:", v4, v4);

  v6 = objc_alloc(MEMORY[0x1E0D4C5F8]);
  objc_msgSend(MEMORY[0x1E0D4C5B8], "localOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4C510], "localClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithOrigin:client:player:", v7, v8, v5);

  objc_msgSend((id)objc_opt_class(), "infoCenterForPlayerPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)infoCenterForPlayerPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend((id)__infoCenterMap, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

void __64__MPNowPlayingInfoCenter__getMetadataForContentItem_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(v1, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_4(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v3 = *(void **)(a1[4] + 120);
  objc_msgSend(v2, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v4;
  if (!v4)
    v4 = a1[5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

}

- (void)becomeActive
{
  -[MPNowPlayingInfoCenter _becomeActiveWithCompletion:](self, "_becomeActiveWithCompletion:", 0);
}

void __56__MPNowPlayingInfoCenter__artworkCatalogForContentItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onDataSourceQueue_artworkCatalogForContentItem:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_onDataSourceQueue_artworkCatalogForContentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataSourceQueue);
  -[MPNowPlayingInfoCenter playbackQueueDataSource](self, "playbackQueueDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "nowPlayingInfoCenter:artworkCatalogForContentItem:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_becomeActiveWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void (**v6)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (-[MPNowPlayingInfoCenter isInvalidated](self, "isInvalidated"))
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 6, CFSTR("MPNowPlayingInfoCenter was invalidated"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v5);

    }
  }
  else
  {
    v6 = v4;
    MRMediaRemoteSetNowPlayingPlayer();

  }
}

uint64_t __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t result;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isInvalidated");
  if ((result & 1) == 0)
  {
    v3 = *(unsigned __int8 *)(a1 + 64);
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v6 = (void *)objc_opt_class();
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(v7 + 304);
        v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v11 = v6;
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138413314;
        v18 = v6;
        v19 = 2048;
        v20 = v7;
        v21 = 2112;
        v22 = v8;
        v23 = 2114;
        v24 = v9;
        v25 = 2114;
        v26 = v12;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidatePlaybackQueue [nowPlayingItemDidChange] %{public}@ -> %{public}@", (uint8_t *)&v17, 0x34u);

      }
    }
    else if (v5)
    {
      v13 = (void *)objc_opt_class();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(v14 + 304);
      v17 = 138412802;
      v18 = v13;
      v19 = 2048;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v16 = v13;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidatePlaybackQueue [identifiersDidChange]", (uint8_t *)&v17, 0x20u);

    }
    return MRMediaRemotePlaybackQueueDataSourceInvalidateWithPlaybackQueueForPlayer();
  }
  return result;
}

void __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_3(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v1 = *(_QWORD *)(a1[6] + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_4;
  v3[3] = &unk_1E315B528;
  v2 = (void *)a1[5];
  v4 = (id)a1[4];
  v5 = v2;
  objc_msgSend(v4, "_onDataSourceQueue_getContentItemIDsInRange:completion:", *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), v3);

}

- (void)_invalidatePlaybackQueueImmediatelyWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  void *v7;
  MRPlayerPath *playerPath;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(id, _QWORD);
  _QWORD *v20;
  _BYTE *v21;
  _QWORD *v22;
  uint64_t *v23;
  SEL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(_QWORD *);
  void *v28;
  MPNowPlayingInfoCenter *v29;
  _QWORD *v30;
  _BYTE *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataSourceQueue);
  if (-[MPNowPlayingInfoCenter isInvalidated](self, "isInvalidated"))
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      playerPath = self->_playerPath;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      v44 = (uint64_t (*)(uint64_t, uint64_t))playerPath;
      v9 = v7;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidatePlaybackQueue ignored [infoCenter was invalidated]", buf, 0x20u);

    }
    v5[2](v5, 0);
  }
  else
  {
    -[MPNowPlayingInfoCenter playbackQueueDataSource](self, "playbackQueueDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "playbackQueueIdentifierForNowPlayingInfoCenter:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy__29301;
    v45 = __Block_byref_object_dispose__29302;
    v46 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__29301;
    v41[4] = __Block_byref_object_dispose__29302;
    v42 = (id)MEMORY[0x1E0C9AA60];
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__29301;
    v39[4] = __Block_byref_object_dispose__29302;
    v40 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3010000000;
    v37 = &unk_193F4554F;
    v38 = *MEMORY[0x1E0D4CFA8];
    v11 = MEMORY[0x1E0C809B0];
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke;
    v28 = &unk_1E315B5C8;
    v29 = self;
    v30 = v39;
    v31 = buf;
    v32 = v41;
    v33 = &v34;
    msv_dispatch_sync_on_queue();
    v12 = v35;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_2;
    v16[3] = &unk_1E315B670;
    v20 = v39;
    v21 = buf;
    v16[4] = self;
    v22 = v41;
    v23 = &v34;
    v13 = v10;
    v17 = v13;
    v24 = a2;
    v14 = v15;
    v18 = v14;
    v19 = v5;
    -[MPNowPlayingInfoCenter _onDataSourceQueue_getContentItemIDsInRange:completion:](self, "_onDataSourceQueue_getContentItemIDsInRange:completion:", v12[4], v12[5], v16);

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __57__MPNowPlayingInfoCenter__createPlaybackQueueForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "playbackQueueIdentifierForNowPlayingInfoCenter:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_msgSend(*(id *)(a1 + 40), "setQueueIdentifier:", v2);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "playbackQueuePropertiesForNowPlayingInfoCenter:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "setProperties:", v3);

  }
  v4 = objc_opt_respondsToSelector();
  v5 = v7;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v7, "playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "setAuxiliaryNowPlayingInfo:", v6);

    v5 = v7;
  }

}

- (BOOL)isInvalidated
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

- (void)_onDataSourceQueue_getContentItemIDsInRange:(_MSVSignedRange)a3 completion:(id)a4
{
  int64_t length;
  int64_t location;
  void (**v7)(id, _QWORD, uint64_t);
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *accessQueue;
  void (**v20)(id, _QWORD, uint64_t);
  uint64_t v21;
  _QWORD block[4];
  id v23;
  MPNowPlayingInfoCenter *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  int64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  length = a3.length;
  location = a3.location;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataSourceQueue);
  MSVSignedIntersectionRange();
  if (!v8)
  {
    MSVSignedUnionRange();
    location = MSVSignedSubtractedRange();
    length = v9;
  }
  -[MPNowPlayingInfoCenter playbackQueueDataSource](self, "playbackQueueDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    if (length <= 1)
      v11 = 1;
    else
      v11 = length;
    objc_msgSend(v10, "nowPlayingInfoCenter:contentItemIDsFromOffset:toOffset:nowPlayingIndex:", self, location, location + v11 - 1, &v29);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = v12;
    else
      v14 = MEMORY[0x1E0C9AA60];
    v7[2](v7, v14, v29);

    goto LABEL_32;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_32;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", length, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (length >= 1)
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "nowPlayingInfoCenter:contentItemIDForOffset:", self, location);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_25;
      }
      else
      {
        if (_onDataSourceQueue_getContentItemIDsInRange_completion__onceToken != -1)
          dispatch_once(&_onDataSourceQueue_getContentItemIDsInRange_completion__onceToken, &__block_literal_global_91_29349);
        v29 = 0;
        v30 = &v29;
        v31 = 0x3032000000;
        v32 = __Block_byref_object_copy__29301;
        v33 = __Block_byref_object_dispose__29302;
        v34 = 0;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_92;
        v25[3] = &unk_1E3163780;
        v27 = &v29;
        v26 = v10;
        v28 = location;
        +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v25);
        v17 = (void *)v30[5];
        if (v17)
        {
          objc_msgSend((id)v30[5], "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v18);

          objc_msgSend((id)v30[5], "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

        _Block_object_dispose(&v29, 8);
        if (!v17)
        {
LABEL_25:
          if (objc_msgSend(v15, "count"))
            goto LABEL_29;
          goto LABEL_26;
        }
      }
      if (!location)
        v21 = objc_msgSend(v15, "count");
      objc_msgSend(v15, "addObject:", v17);
LABEL_26:

      ++location;
      if (!--length)
        goto LABEL_29;
    }
  }
  v21 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:
  if (objc_msgSend(v16, "count"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_2;
    block[3] = &unk_1E31635F8;
    v23 = v16;
    v24 = self;
    dispatch_async(accessQueue, block);

  }
  v7 = v20;
  ((void (**)(id, void *, uint64_t))v20)[2](v20, v15, v21);

LABEL_32:
}

void __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  _QWORD v51[5];
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD block[5];
  id v58;
  uint64_t v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      v10 = 1;
LABEL_13:
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32);
      v27 = objc_msgSend(v6, "count");
      v28 = v27;
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v30 = *(_QWORD *)(v29 + 40);
      if (v30 != v27)
      {
        if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v31 = *(_QWORD *)(v29 + 32);
          if (v31 < 0)
            v26 = ((v31 + v30) & ((v31 + v30) >> 63)) - v27;
        }
        else
        {
          v26 = -a3;
        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "playbackQueuePropertiesForNowPlayingInfoCenter:", *(_QWORD *)(a1 + 32));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter:", *(_QWORD *)(a1 + 32));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
      v34 = *(_QWORD *)(a1 + 32);
      v35 = *(NSObject **)(v34 + 40);
      v51[0] = v7;
      v51[1] = 3221225472;
      v51[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_4;
      v51[3] = &unk_1E315B5F0;
      v36 = *(_QWORD *)(a1 + 64);
      v51[4] = v34;
      v53 = v36;
      v52 = v6;
      v54 = v26;
      v55 = v28;
      v56 = *(_QWORD *)(a1 + 96);
      dispatch_async(v35, v51);
      v37 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      v42[0] = v7;
      v42[1] = 3221225472;
      v42[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_5;
      v42[3] = &unk_1E315B648;
      v48 = *(_QWORD *)(a1 + 64);
      v43 = *(id *)(a1 + 48);
      v44 = v32;
      v38 = *(_QWORD *)(a1 + 32);
      v45 = v33;
      v46 = v38;
      v50 = v10;
      v49 = *(_QWORD *)(a1 + 72);
      v47 = *(id *)(a1 + 56);
      v39 = v33;
      v19 = v32;
      dispatch_async(v37, v42);

      goto LABEL_25;
    }
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
      || (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)) & 1) == 0)
    {
      v10 = 1;
      objc_msgSend(*(id *)(a1 + 32), "_contentItemForIdentifier:alreadyOnDataSourceQueue:", v12, 1);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(NSObject **)(v23 + 40);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_3;
      block[3] = &unk_1E31635A8;
      block[4] = v23;
      v58 = v12;
      v59 = *(_QWORD *)(a1 + 64);
      v25 = v12;
      dispatch_async(v24, block);

      goto LABEL_13;
    }

  }
  if ((objc_msgSend(v6, "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)) & 1) == 0)
  {
    v10 = 0;
    goto LABEL_13;
  }
  v13 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(v15 + 304);
    *(_DWORD *)buf = 138412802;
    v61 = v14;
    v62 = 2048;
    v63 = v15;
    v64 = 2112;
    v65 = v16;
    v17 = v14;
    _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidatePlaybackQueue [no change detected]", buf, 0x20u);

  }
  v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  v40[0] = v7;
  v40[1] = 3221225472;
  v40[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_84;
  v40[3] = &unk_1E31637F8;
  v41 = *(id *)(a1 + 56);
  dispatch_async(v18, v40);
  v19 = v41;
LABEL_25:

}

void __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_5;
  block[3] = &unk_1E315C618;
  v10 = v5;
  v11 = v6;
  v12 = a3;
  v8 = v5;
  dispatch_sync(v7, block);

}

- (void)_onQueue_pushContentItemsUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  MSVLRUDictionary *contentItems;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  MSVLRUDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  MPNowPlayingContentItem *v24;
  MPNowPlayingContentItem *nowPlayingContentItem;
  NSMutableDictionary *mutatedPlaybackQueueRequests;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *calloutQueue;
  id v38;
  void *v39;
  id obj;
  uint64_t v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD block[6];
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_invalidated && -[NSMutableDictionary count](self->_mutatedContentItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allValues](self->_mutatedContentItems, "allValues");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v4)
    {
      v5 = v4;
      v41 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v51 != v41)
            objc_enumerationMutation(obj);
          v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i));
          objc_msgSend(v42, "addObject:", objc_msgSend(v7, "_mediaRemoteContentItem"));
          contentItems = self->_contentItems;
          objc_msgSend(v7, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSVLRUDictionary objectForKeyedSubscript:](contentItems, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "artworkIdentifier");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v7, "artworkIdentifier");
            v13 = v3;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "artworkIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            v3 = v13;
            if ((v16 & 1) == 0)
            {
              objc_msgSend(v7, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v17);

            }
          }
          if (v10)
          {
            v18 = (void *)objc_msgSend(v10, "copy");

            objc_msgSend(v18, "_mergeContentItem:", v7);
            v19 = self->_contentItems;
            objc_msgSend(v7, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSVLRUDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

          }
          -[MPContentItem identifier](self->_nowPlayingContentItem, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqual:", v22);

          if (v23)
          {
            v24 = (MPNowPlayingContentItem *)-[MPNowPlayingContentItem copy](self->_nowPlayingContentItem, "copy");
            -[MPNowPlayingContentItem _mergeContentItem:](v24, "_mergeContentItem:", v7);
            nowPlayingContentItem = self->_nowPlayingContentItem;
            self->_nowPlayingContentItem = v24;

          }
          mutatedPlaybackQueueRequests = self->_mutatedPlaybackQueueRequests;
          objc_msgSend(v7, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](mutatedPlaybackQueueRequests, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            MRPlaybackQueueRequestSetIncludeMetadata();
            CFRetain(v28);
            objc_msgSend((id)objc_opt_class(), "serviceQueue");
            v29 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke;
            block[3] = &unk_1E315BAC0;
            v49 = v28;
            block[4] = self;
            block[5] = v7;
            v48 = v3;
            dispatch_async(v29, block);

          }
          else
          {
            v30 = objc_retainAutorelease(v7);
            v31 = objc_msgSend(v30, "_mediaRemoteContentItem");
            objc_msgSend(v30, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v3, "containsObject:", v32);

            if ((v33 & 1) == 0)
              MRContentItemSetArtworkIdentifier();
            objc_msgSend(v39, "addObject:", v31);
          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v5);
    }
    v34 = objc_msgSend(v39, "count");
    v35 = MEMORY[0x1E0C809B0];
    if (v34)
    {
      objc_msgSend((id)objc_opt_class(), "serviceQueue");
      v36 = objc_claimAutoreleasedReturnValue();
      v45[0] = v35;
      v45[1] = 3221225472;
      v45[2] = __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke_193;
      v45[3] = &unk_1E31635F8;
      v45[4] = self;
      v46 = v39;
      dispatch_async(v36, v45);

    }
    calloutQueue = self->_calloutQueue;
    v43[0] = v35;
    v43[1] = 3221225472;
    v43[2] = __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke_198;
    v43[3] = &unk_1E31635F8;
    v43[4] = self;
    v44 = v42;
    v38 = v42;
    dispatch_async(calloutQueue, v43);
    -[NSMutableDictionary removeAllObjects](self->_mutatedContentItems, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_mutatedPlaybackQueueRequests, "removeAllObjects");

  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_10(uint64_t a1)
{
  id v2;
  const void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_childContentItemForContentItem:index:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const void *)objc_msgSend(v2, "_mediaRemoteContentItem");

  if (v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CFRetain(v3);
}

- (void)_getMetadataForContentItem:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *accessQueue;
  void *v18;
  _QWORD block[11];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__29301;
  v26 = __Block_byref_object_dispose__29302;
  v27 = 0;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  block[6] = MEMORY[0x1E0C809B0];
  block[7] = 3221225472;
  block[8] = __64__MPNowPlayingInfoCenter__getMetadataForContentItem_completion___block_invoke;
  block[9] = &unk_1E31635A8;
  v21 = &v22;
  block[10] = self;
  v11 = v9;
  v20 = v11;
  msv_dispatch_sync_on_queue();
  v12 = v23[5];
  if (!v12 && v11)
  {
    -[MPNowPlayingInfoCenter _contentItemForIdentifier:](self, "_contentItemForIdentifier:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v23[5];
    v23[5] = v13;

    v15 = (void *)v23[5];
    if (!v15)
      goto LABEL_9;
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v16) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPNowPlayingInfoCenter.m"), 585, CFSTR("MPNowPlayingPlaybackQueueDataSource produced content item does not match requested identifier: requestedID=%@ contentItemID=%@"), v11, v16);

    }
    accessQueue = self->_accessQueue;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __64__MPNowPlayingInfoCenter__getMetadataForContentItem_completion___block_invoke_2;
    block[3] = &unk_1E3163580;
    block[4] = self;
    block[5] = &v22;
    dispatch_async(accessQueue, block);

    v12 = v23[5];
  }
  if (v12)
    objc_msgSend(v7, "_mergeContentItem:");
LABEL_9:
  v8[2](v8, 0);

  _Block_object_dispose(&v22, 8);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD);

  v6 = a4;
  if (MRContentItemGetHasMetadata())
  {
    v6[2](v6, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", a3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_12;
    v9[3] = &unk_1E31624C0;
    v10 = v6;
    objc_msgSend(WeakRetained, "_getMetadataForContentItem:completion:", v8, v9);

  }
}

- (id)_contentItemForIdentifier:(id)a3
{
  return -[MPNowPlayingInfoCenter _contentItemForIdentifier:alreadyOnDataSourceQueue:](self, "_contentItemForIdentifier:alreadyOnDataSourceQueue:", a3, 0);
}

void __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 40));
  v2 = a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  v5 = *(_QWORD *)(v2 + 96);
  v4 = *(_QWORD *)(v2 + 104);
  v6 = *(_QWORD *)(v3 + 32);
  if (v6 >= v5 && v6 - v5 < v4)
  {
    v8 = *(uint64_t *)(v3 + 40) <= 1 ? 1 : *(_QWORD *)(v3 + 40);
    if (v6 + ~v5 + v8 < v4)
    {
      v9 = MSVSignedIntersectionRange();
      v11 = v9;
      v12 = v10;
      v13 = a1[4];
      v14 = *(_QWORD *)(v13 + 80);
      if (v14 < 0)
        v14 = -v14;
      objc_msgSend(*(id *)(v13 + 112), "subarrayWithRange:", v14 + v9, v10);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1[6] + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v18 = (uint64_t *)a1[7];
      if (v18)
      {
        *v18 = v11;
        v18[1] = v12;
      }
    }
  }
}

- (void)setPlaybackState:(MPNowPlayingPlaybackState)playbackState
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__MPNowPlayingInfoCenter_setPlaybackState___block_invoke;
  v4[3] = &unk_1E3161620;
  v4[4] = self;
  v4[5] = playbackState;
  dispatch_async(accessQueue, v4);
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "_createPlaybackQueueForRequest:", a2);

  return v4;
}

- (void)_createPlaybackQueueForRequest:(void *)a3
{
  uint64_t Range;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  Range = MRPlaybackQueueRequestGetRange();
  v22[0] = 0;
  v22[1] = 0;
  -[MPNowPlayingInfoCenter _contentItemIDsInRange:itemsRange:](self, "_contentItemIDsInRange:itemsRange:", Range, v5, v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)MRContentItemCreate();
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

  v14 = objc_alloc(MEMORY[0x1E0D4C5E8]);
  v17 = (id)objc_msgSend(v14, "initWithContentItems:location:", v7, v22[0]);
  msv_dispatch_sync_on_queue();
  v15 = v17;

  return v15;
}

- (id)_contentItemIDsInRange:(id)a3 itemsRange:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[7];
  _QWORD v13[8];
  _QWORD v14[4];
  $0AC6E346AE4835514AAA8AC86D8F4844 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__29301;
  v20 = __Block_byref_object_dispose__29302;
  v21 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3010000000;
  v14[3] = &unk_193F4554F;
  v15 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke;
  v13[3] = &unk_1E315B4D8;
  v13[4] = self;
  v13[5] = v14;
  v13[6] = &v16;
  v13[7] = a4;
  v7 = (void *)MEMORY[0x19403A810](v13);
  msv_dispatch_sync_on_queue();
  v8 = (void *)v17[5];
  if (!v8)
  {
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_2;
    v12[3] = &unk_1E315B500;
    v12[4] = self;
    v12[5] = v14;
    v12[6] = a2;
    v11 = (id)MEMORY[0x19403A810](v12);
    msv_dispatch_sync_on_queue();
    msv_dispatch_sync_on_queue();

    v8 = (void *)v17[5];
  }
  v9 = v8;

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __55__MPNowPlayingInfoCenter_supportsArtworkCatalogLoading__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_opt_respondsToSelector() & 1;

}

uint64_t __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __43__MPNowPlayingInfoCenter_setPlaybackState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  _QWORD v7[5];
  int v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 280))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v1 + 136) != v3)
    {
      *(_QWORD *)(v1 + 136) = v3;
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 1;
      switch(v4)
      {
        case 1:
          break;
        case 2:
          v5 = 2;
          break;
        case 3:
          v5 = 3;
          break;
        case 4:
          v5 = 4;
          break;
        default:
          if (v4 == 1000)
            v5 = 5;
          else
            v5 = 0;
          break;
      }
      objc_msgSend((id)objc_opt_class(), "serviceQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __43__MPNowPlayingInfoCenter_setPlaybackState___block_invoke_2;
      v7[3] = &unk_1E31632A0;
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v5;
      dispatch_async(v6, v7);

    }
  }
}

void __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_5(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
  if (v2)
  {
    v14[0] = objc_msgSend(objc_retainAutorelease(v2), "_mediaRemoteContentItem");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5E8]), "initWithContentItems:location:", v3, 0);
  v5 = v4;
  if (a1[4])
    objc_msgSend(v4, "setQueueIdentifier:");
  if (a1[5])
    objc_msgSend(v5, "setProperties:");
  if (a1[6])
    objc_msgSend(v5, "setAuxiliaryNowPlayingInfo:");
  objc_msgSend((id)objc_opt_class(), "serviceQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v7 = v5;
  msv_dispatch_sync_on_queue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[7];
  v12 = *MEMORY[0x1E0D4CDC8];
  v13 = *(_QWORD *)(v9 + 304);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("_MPNowPlayingInfoCenterPlaybackQueueDidChangeNotification"), v9, v10);

  (*(void (**)(void))(a1[8] + 16))();
}

- (void)_onQueue_registerPlaybackQueueDataSourceCallbacks:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  char v20;
  void *v21;
  id v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, void *);
  void *v28;
  id v29[5];
  id v30[5];
  id v31[5];
  id v32[5];
  id v33[5];
  id v34[5];
  id v35[5];
  id v36[5];
  id v37[5];
  id v38[5];
  id v39[5];
  id v40;
  id location[2];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_invalidated)
  {
    -[MPNowPlayingInfoCenter _onQueue_clearPlaybackQueueDataSourceCallbacks](self, "_onQueue_clearPlaybackQueueDataSourceCallbacks");
    if (v4)
    {
      objc_initWeak(location, self);
      v5 = objc_opt_respondsToSelector();
      v6 = (void *)MEMORY[0x1E0C809B0];
      if ((v5 & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v39[1] = v6;
          v39[2] = (id)3221225472;
          v39[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke;
          v39[4] = &unk_1E315B758;
          objc_copyWeak(&v40, location);
          MRMediaRemotePlaybackSessionSetMigrateBeginCallback();
          objc_destroyWeak(&v40);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v38[1] = v6;
          v38[2] = (id)3221225472;
          v38[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_3;
          v38[4] = &unk_1E315B780;
          objc_copyWeak(v39, location);
          MRMediaRemotePlaybackSessionSetMigrateEndCallback();
          objc_destroyWeak(v39);
        }
        v37[1] = v6;
        v37[2] = (id)3221225472;
        v37[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_5;
        v37[4] = &unk_1E315B7D0;
        objc_copyWeak(v38, location);
        MRMediaRemotePlaybackSessionSetRequestCallback();
        objc_destroyWeak(v38);
      }
      objc_msgSend((id)objc_opt_class(), "serviceQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v6;
      v36[2] = (id)3221225472;
      v36[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_7;
      v36[4] = &unk_1E315B7F8;
      objc_copyWeak(v37, location);
      self->_callbacks.createPlaybackQueue = (void *)MRMediaRemotePlaybackQueueDataSourceAddCreatePlaybackQueueForRequestCallbackForPlayer();

      objc_msgSend((id)objc_opt_class(), "serviceQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v6;
      v35[2] = (id)3221225472;
      v35[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_8;
      v35[4] = &unk_1E315B820;
      objc_copyWeak(v36, location);
      self->_callbacks.createContentItem = (void *)MRMediaRemotePlaybackQueueDataSourceAddCreateContentItemForIdentifierCallbackForPlayer();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "serviceQueue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v6;
        v34[2] = (id)3221225472;
        v34[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_9;
        v34[4] = &unk_1E315B870;
        objc_copyWeak(v35, location);
        self->_callbacks.createChildItem = (void *)MRMediaRemotePlaybackQueueDataSourceAddCreateChildContentItemCallbackForPlayer();

        objc_destroyWeak(v35);
      }
      objc_msgSend((id)objc_opt_class(), "serviceQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v6;
      v33[2] = (id)3221225472;
      v33[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_11;
      v33[4] = &unk_1E315B898;
      objc_copyWeak(v34, location);
      self->_callbacks.metadata = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemMetadataCallbackForPlayer();

      objc_msgSend((id)objc_opt_class(), "serviceQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v6;
      v32[2] = (id)3221225472;
      v32[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_13;
      v32[4] = &unk_1E315B898;
      objc_copyWeak(v33, location);
      self->_callbacks.artwork = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemArtworkCallbackForPlayer();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "serviceQueue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v6;
        v31[2] = (id)3221225472;
        v31[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_121;
        v31[4] = &unk_1E315B898;
        objc_copyWeak(v32, location);
        self->_callbacks.formattedArtwork = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemFormattedArtworkCallbackForPlayer();

        objc_destroyWeak(v32);
        v6 = (void *)MEMORY[0x1E0C809B0];
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "serviceQueue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v6;
        v30[2] = (id)3221225472;
        v30[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_6_136;
        v30[4] = &unk_1E315B898;
        objc_copyWeak(v31, location);
        self->_callbacks.lyrics = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemLyricsCallbackForPlayer();

        objc_destroyWeak(v31);
        v6 = (void *)MEMORY[0x1E0C809B0];
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "serviceQueue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v6;
        v29[2] = (id)3221225472;
        v29[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_10_143;
        v29[4] = &unk_1E315B898;
        objc_copyWeak(v30, location);
        self->_callbacks.info = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemInfoCallbackForPlayer();

        objc_destroyWeak(v30);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v15 = (void *)objc_opt_class();
        v16 = MEMORY[0x1E0C809B0];
        objc_msgSend(v15, "serviceQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v16;
        v26 = 3221225472;
        v27 = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_14_150;
        v28 = &unk_1E315B898;
        objc_copyWeak(v29, location);
        self->_callbacks.transcriptAlignments = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemTranscriptAlignmentsCallbackForPlayer();

        objc_destroyWeak(v29);
      }
      v18 = objc_opt_respondsToSelector();
      v19 = objc_opt_respondsToSelector();
      v20 = v19;
      if (((v18 | v19) & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "serviceQueue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_copyWeak(&v22, location);
        v23 = v18 & 1;
        v24 = v20 & 1;
        self->_callbacks.languageOptions = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemLanguageOptionsCallbackForPlayer();

        objc_destroyWeak(&v22);
      }
      objc_destroyWeak(v33);
      objc_destroyWeak(v34);
      objc_destroyWeak(v36);
      objc_destroyWeak(v37);
      objc_destroyWeak(location);
    }
  }

}

+ (OS_dispatch_queue)serviceQueue
{
  if (serviceQueue_onceToken != -1)
    dispatch_once(&serviceQueue_onceToken, &__block_literal_global_5_29467);
  return (OS_dispatch_queue *)(id)serviceQueue___serviceQueue;
}

- (void)_onQueue_clearPlaybackQueueDataSourceCallbacks
{
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_invalidated)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__MPNowPlayingInfoCenter__onQueue_clearPlaybackQueueDataSourceCallbacks__block_invoke;
    v4[3] = &unk_1E315B6E0;
    v4[4] = self;
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v4);
    ((void (**)(_QWORD, $6ABC577084DBE3C9E4C820F9B0F2273B *))v3)[2](v3, &self->_callbacks);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.createContentItem);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.createChildItem);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.metadata);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.artwork);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.formattedArtwork);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.info);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.transcriptAlignments);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.languageOptions);
    ((void (**)(_QWORD, void **))v3)[2](v3, &self->_callbacks.lyrics);
    MRMediaRemotePlaybackSessionSetRequestCallback();

  }
}

uint64_t __72__MPNowPlayingInfoCenter__onQueue_clearPlaybackQueueDataSourceCallbacks__block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (*a2)
  {
    result = MRMediaRemotePlaybackQueueDataSourceRemoveCallbackForPlayer();
    *a2 = 0;
  }
  return result;
}

void __53__MPNowPlayingInfoCenter_setPlaybackQueueDataSource___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 280))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 176));
    v4 = *(id *)(a1 + 40);

    if (WeakRetained != v4)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_registerPlaybackQueueDataSourceCallbacks:", *(_QWORD *)(a1 + 40));
    }
  }
}

- (void)invalidatePlaybackQueueWithCompletion:(id)a3
{
  id v4;
  NSObject *dataSourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dataSourceQueue = self->_dataSourceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MPNowPlayingInfoCenter_invalidatePlaybackQueueWithCompletion___block_invoke;
  v7[3] = &unk_1E3162560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dataSourceQueue, v7);

}

- (void)setPlaybackQueueDataSource:(id)a3
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
  v7[2] = __53__MPNowPlayingInfoCenter_setPlaybackQueueDataSource___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (BOOL)supportsArtworkCatalogLoading
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

void __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke()
{
  uint64_t v0;
  void *v1;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__infoCenterMap;
  __infoCenterMap = v0;

  objc_sync_exit(obj);
}

uint64_t __43__MPNowPlayingInfoCenter_setPlaybackState___block_invoke_2()
{
  return MRMediaRemoteSetPlaybackStateForPlayer();
}

- (id)_artworkCatalogForContentItem:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29301;
  v10 = __Block_byref_object_dispose__29302;
  v11 = 0;
  v5 = a3;
  msv_dispatch_sync_on_queue();
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 128));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(a1[4] + 112);
  if (v6)
  {
    v7 = objc_msgSend(v6, "copy");
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    MSVSignedIntersectionRange();
    v11 = v10;
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "length");
    v13 = a1[4];
    if (!v12 && v11 >= 1)
    {
      v15 = *(void **)(v13 + 112);
      v16 = *(_QWORD *)(v13 + 80);
      if (v16 >= 0)
        v17 = v16;
      else
        v17 = -v16;
      objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      v20 = *(_QWORD *)(a1[6] + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
  }
  result = MSVSignedUnionRange();
  v23 = *(_QWORD *)(a1[8] + 8);
  *(_QWORD *)(v23 + 32) = result;
  *(_QWORD *)(v23 + 40) = v24;
  return result;
}

void __38__MPNowPlayingInfoCenter_serviceQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaPlayer.MPNowPlayingInfoCenter/serviceQueue", v2);
  v1 = (void *)serviceQueue___serviceQueue;
  serviceQueue___serviceQueue = (uint64_t)v0;

}

+ (MPNowPlayingInfoCenter)defaultCenter
{
  if (defaultCenter___once != -1)
    dispatch_once(&defaultCenter___once, &__block_literal_global_29469);
  return (MPNowPlayingInfoCenter *)(id)defaultCenter___defaultCenter;
}

void __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v11 = v2;
    v4 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v3 = v11;
    if ((v4 & 1) == 0)
    {
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushContentItemsUpdate");
      v3 = v11;
    }
  }

}

void __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_OWORD *)(a1 + 56);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count") != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("MPNowPlayingInfoCenter.m"), 707, CFSTR("IPQI: Mismatch in contentItemIdentifiers (%ld) and loadedContentItemsRange (%ld)"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

  }
}

uint64_t __54__MPNowPlayingInfoCenter__becomeActiveWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v5 = v4;
  if (a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
    v13 = 138543618;
    v14 = v6;
    v15 = 2114;
    v16 = a2;
    v7 = "becomeActivePlayer: %{public}@ failed %{public}@";
    v8 = v5;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
    v13 = 138543362;
    v14 = v11;
    v7 = "becomeActivePlayer: %{public}@";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
  }
  _os_log_impl(&dword_193B9B000, v8, v9, v7, (uint8_t *)&v13, v10);
LABEL_7:

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSRange v24;

  v23 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_msgSend(v23, "count");
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = objc_msgSend(*(id *)(v4 + 112), "count");
    v6 = MSVReplacementRangeForRanges();
    v8 = v7;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "replaceObjectsInRange:withObjectsFromArray:", v6, v7, v23);
    v9 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v9 + 80) = MSVSignedUnionRange();
    *(_QWORD *)(v9 + 88) = v10;
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count");
    v4 = *(_QWORD *)(a1 + 32);
    if (v11 != *(_QWORD *)(v4 + 88))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = objc_msgSend(*(id *)(v13 + 112), "count");
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v20 = v14;
      v15 = objc_msgSend(v23, "count");
      NSStringFromMSVSignedRange();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromMSVSignedRange();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24.location = v6;
      v24.length = v8;
      NSStringFromRange(v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v22, v13, CFSTR("MPNowPlayingInfoCenter.m"), 482, CFSTR("CIIR: Mismatch in contentItemIdentifiers=%ld, loadedContentItemsRange=%ld, previousContentItemIDCount=%ld, dataSourceContentItemIDs=%ld, replacementRange: [(_loaded) %@ : (loaded) %@] => (replacement) %@"), v20, v19, v5, v15, v16, v17, v18);

      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_QWORD *)(v4 + 96) = MSVSignedUnionRange();
  *(_QWORD *)(v4 + 104) = v12;

}

- (MPNowPlayingInfoCenter)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-init is not supported, use +defaultCenter"));

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  MEMORY[0x194038908](self->_stateHandle, a2);
  -[MPNowPlayingInfoCenter resignActiveSystemFallback](self, "resignActiveSystemFallback");
  if (!-[MPNowPlayingInfoCenter isInvalidated](self, "isInvalidated"))
  {
    +[MPRemoteCommandCenter commandCenterForPlayerPath:](MPRemoteCommandCenter, "commandCenterForPlayerPath:", self->_playerPath);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      MRMediaRemoteRemovePlayer();

  }
  objc_storeWeak((id *)&self->_playbackQueueDataSource, 0);
  objc_storeWeak((id *)&self->_lyricsDelegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoCenter;
  -[MPNowPlayingInfoCenter dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  MRPlayerPath *playerPath;
  id v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  MPNowPlayingInfoCenter *v11;
  __int16 v12;
  MRPlayerPath *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  msv_dispatch_sync_on_queue();
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    playerPath = self->_playerPath;
    *(_DWORD *)buf = 138412802;
    v9 = v4;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = playerPath;
    v6 = v4;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidated", buf, 0x20u);

  }
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend((id)__infoCenterMap, "removeObjectForKey:", self->_playerPath);
  objc_sync_exit(v7);

}

- (MPNowPlayingPlaybackState)playbackState
{
  MPNowPlayingPlaybackState v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)becomeActiveSystemFallback
{
  NSObject *v3;
  uint8_t v4[16];

  -[MPNowPlayingInfoCenter becomeActive](self, "becomeActive");
  if (self->_fallbackActivity)
    -[MPNowPlayingInfoCenter resignActiveSystemFallback](self, "resignActiveSystemFallback");
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "MPNowPlayingInfoCenter becoming active system fallback", v4, 2u);
  }

  MRNowPlayingPlayerPathGetClient();
  MRNowPlayingClientGetBundleIdentifier();
  self->_fallbackActivity = (void *)MRApplicationActivityCreate();
  MRApplicationActivityBegin();
}

- (void)resignActiveSystemFallback
{
  if (self->_fallbackActivity)
  {
    MRApplicationActivityEnd();
    CFRelease(self->_fallbackActivity);
    self->_fallbackActivity = 0;
  }
}

- (void)setRepresentedApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *representedApplicationBundleIdentifier;
  id v6;

  v6 = a3;
  if (!-[MPNowPlayingInfoCenter isInvalidated](self, "isInvalidated"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    representedApplicationBundleIdentifier = self->_representedApplicationBundleIdentifier;
    self->_representedApplicationBundleIdentifier = v4;

    MRNowPlayingPlayerPathGetClient();
    MRNowPlayingClientSetParentAppBundleIdentifier();
    MRNowPlayingPlayerPathGetOrigin();
    MRMediaRemoteUpdateClientProperties();
  }

}

- (void)setLyricsDelegate:(id)a3
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
  v7[2] = __44__MPNowPlayingInfoCenter_setLyricsDelegate___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (MPNowPlayingInfoLyricsDelegate)lyricsDelegate
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
  v7 = __Block_byref_object_copy__29301;
  v8 = __Block_byref_object_dispose__29302;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPNowPlayingInfoLyricsDelegate *)v2;
}

- (MPNowPlayingContentItem)nowPlayingContentItem
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
  v7 = __Block_byref_object_copy__29301;
  v8 = __Block_byref_object_dispose__29302;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPNowPlayingContentItem *)v2;
}

- (void)setNowPlayingContentItem:(id)a3
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
  v7[2] = __51__MPNowPlayingInfoCenter_setNowPlayingContentItem___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)setDataSourceQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue **p_dataSourceQueue;
  id v6;
  OS_dispatch_queue *obj;

  v4 = (OS_dispatch_queue *)a3;
  if (self->_dataSourceQueue != v4)
  {
    p_dataSourceQueue = &self->_dataSourceQueue;
    if (!v4)
    {
      v6 = MEMORY[0x1E0C80D38];
      v4 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    }
    obj = v4;
    objc_storeStrong((id *)p_dataSourceQueue, v4);
    v4 = obj;
  }

}

- (id)artworkCatalogBlockForContentItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (-[MPNowPlayingInfoCenter supportsArtworkCatalogLoading](self, "supportsArtworkCatalogLoading"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__MPNowPlayingInfoCenter_artworkCatalogBlockForContentItem___block_invoke;
    v12[3] = &unk_1E315B4B0;
    v12[4] = self;
    v13 = v4;
    v5 = (void *)MEMORY[0x19403A810](v12);
    v10 = (void *)MEMORY[0x19403A810](v5, v6, v7, v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_becomeActiveIfPossibleWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void (**v6)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (-[MPNowPlayingInfoCenter isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 6, CFSTR("MPNowPlayingInfoCenter was invalidated"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);

  }
  else
  {
    v6 = v4;
    MRMediaRemoteSetNowPlayingPlayerIfPossible();

  }
}

- (id)_childContentItemForContentItem:(id)a3 index:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  MPNowPlayingContentItem *v9;

  v6 = a3;
  -[MPNowPlayingInfoCenter playbackQueueDataSource](self, "playbackQueueDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "nowPlayingInfoCenter:childContentItemIDAtIndex:ofItem:", self, a4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = -[MPContentItem initWithIdentifier:]([MPNowPlayingContentItem alloc], "initWithIdentifier:", v8);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_getTransportablePlaybackSessionRepresentationWithIdentifier:(id)a3 preferredSessionType:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *dataSourceQueue;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  dataSourceQueue = self->_dataSourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke;
  block[3] = &unk_1E315B5A0;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(dataSourceQueue, block);

}

- (void)_onQueue_registerLyricsDelegateCallbacks:(id)a3
{
  id v4;
  id v5;
  id v6[6];
  id v7;
  id v8;
  id from;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_invalidated)
  {
    if (v4)
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v4);
      v6[1] = (id)MEMORY[0x1E0C809B0];
      v6[2] = (id)3221225472;
      v6[3] = __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke;
      v6[4] = &unk_1E315B730;
      v6[5] = self;
      objc_copyWeak(&v7, &location);
      objc_copyWeak(&v8, &from);
      MRMediaRemoteSetBeginLyricsEventCallbackForPlayer();
      objc_copyWeak(&v5, &location);
      objc_copyWeak(v6, &from);
      MRMediaRemoteSetEndLyricsEventCallbackForPlayer();
      objc_destroyWeak(v6);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      MRMediaRemoteSetBeginLyricsEventCallbackForPlayer();
      MRMediaRemoteSetEndLyricsEventCallbackForPlayer();
    }
  }

}

- (id)_onQueue_stateDictionary
{
  void *v3;
  void *v4;
  MRPlayerPath *playerPath;
  NSMutableArray *contentItemIdentifiers;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  MPNowPlayingContentItem *nowPlayingContentItem;
  _QWORD v22[8];
  _QWORD v23[9];

  v23[8] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = (void *)MEMORY[0x1E0C99E08];
  v22[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  playerPath = self->_playerPath;
  v23[0] = v4;
  v23[1] = playerPath;
  v22[1] = CFSTR("_playerPath");
  v22[2] = CFSTR("contentItemIDs");
  contentItemIdentifiers = self->_contentItemIdentifiers;
  if (!contentItemIdentifiers)
    contentItemIdentifiers = (NSMutableArray *)CFSTR("@");
  v23[2] = contentItemIdentifiers;
  v22[3] = CFSTR("loadedRange");
  NSStringFromMSVSignedRange();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v7;
  v22[4] = CFSTR("requestedRange");
  NSStringFromMSVSignedRange();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v8;
  v22[5] = CFSTR("cachedContentItems");
  -[MSVLRUDictionary allKeys](self->_contentItems, "allKeys");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("@");
  v23[5] = v11;
  v22[6] = CFSTR("mutatedContentItems");
  -[NSMutableDictionary allKeys](self->_mutatedContentItems, "allKeys");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("@");
  v23[6] = v14;
  v22[7] = CFSTR("mutatedPlaybackQueueRequests");
  -[NSMutableDictionary allKeys](self->_mutatedPlaybackQueueRequests, "allKeys");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("@");
  v23[7] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  nowPlayingContentItem = self->_nowPlayingContentItem;
  if (nowPlayingContentItem)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", nowPlayingContentItem, CFSTR("nowPlayingContentItem"));
  if (-[NSDictionary count](self->_nowPlayingInfo, "count"))
    objc_msgSend(v19, "setObject:forKeyedSubscript:", self->_nowPlayingInfo, CFSTR("nowPlayingInfo"));
  if (self->_nowPlayingInfo != self->_queuedNowPlayingInfo)
    objc_msgSend(v19, "setObject:forKeyedSubscript:");
  return v19;
}

- (MPNowPlayingPlaybackQueueDelegate)playbackQueueDelegate
{
  return (MPNowPlayingPlaybackQueueDelegate *)objc_loadWeakRetained((id *)&self->_playbackQueueDelegate);
}

- (void)setPlaybackQueueDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_playbackQueueDelegate, a3);
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (NSString)representedApplicationBundleIdentifier
{
  return self->_representedApplicationBundleIdentifier;
}

- (OS_dispatch_queue)dataSourceQueue
{
  return self->_dataSourceQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceQueue, 0);
  objc_storeStrong((id *)&self->_representedApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_destroyWeak((id *)&self->_playbackQueueDelegate);
  objc_destroyWeak((id *)&self->_lyricsDelegate);
  objc_destroyWeak((id *)&self->_playbackQueueDataSource);
  objc_storeStrong((id *)&self->_contentItemInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_artworkResizeUtility, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentItem, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutatedPlaybackQueueRequests, 0);
  objc_storeStrong((id *)&self->_mutatedContentItems, 0);
  objc_storeStrong((id *)&self->_publishedContext, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_pushDate, 0);
  objc_storeStrong((id *)&self->_convertedNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_queuedNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

void __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInvalidated"))
  {
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }
  else
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_opt_class();
      v5 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(a1 + 40);
      v6 = *(_QWORD *)(v5 + 304);
      v7 = v3;
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v3;
      v13 = 2048;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> sending content item changed: %{public}@", (uint8_t *)&v11, 0x2Au);

    }
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "_mediaRemoteContentItem");
    v9 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

    if ((v9 & 1) == 0)
      MRContentItemSetArtworkIdentifier();
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "_mediaRemoteContentItem");
    MRMediaRemotePlaybackQueueDataSourceContentItemChangedWithRequestForPlayer();
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }
}

uint64_t __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke_193(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isInvalidated");
  if ((result & 1) == 0)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(v6 + 304);
      v8 = v4;
      objc_msgSend(v5, "valueForKey:", CFSTR("identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v4;
      v13 = 2048;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> sending content items changed: %{public}@", (uint8_t *)&v11, 0x2Au);

    }
    return MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer();
  }
  return result;
}

void __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke_198(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
  v5 = *MEMORY[0x1E0D4CDB8];
  v7[0] = *MEMORY[0x1E0D4CDC8];
  v7[1] = v5;
  v8[0] = v4;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("_MPNowPlayingContentItemsDidChangeNotification"), 0, v6);

}

uint64_t __58__MPNowPlayingInfoCenter__contentItemChangedNotification___block_invoke_191(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 160);
  *(_QWORD *)(v2 + 160) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushContentItemsUpdate");
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  _QWORD *v10;
  id v11;
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)MRPlaybackSessionRequestCopyRequestID();
    v7 = WeakRetained[40];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_2;
    block[3] = &unk_1E3161780;
    v10 = WeakRetained;
    v11 = v6;
    v12 = v4;
    v8 = v6;
    dispatch_async(v7, block);

  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  _QWORD *WeakRetained;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  _QWORD *v14;
  id v15;
  id v16;
  id v17;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = a3;
    v9 = (void *)MRPlaybackSessionRequestCopyRequestID();
    v10 = WeakRetained[40];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_4;
    v13[3] = &unk_1E315C088;
    v14 = WeakRetained;
    v15 = v9;
    v16 = v8;
    v17 = v6;
    v11 = v8;
    v12 = v9;
    dispatch_async(v10, v13);

  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)MRPlaybackSessionRequestCopyIdentifier();
  v6 = (void *)MRPlaybackSessionRequestCopyType();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_6;
  v9[3] = &unk_1E315B7A8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(WeakRetained, "_getTransportablePlaybackSessionRepresentationWithIdentifier:preferredSessionType:completion:", v5, v6, v9);

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;
  uint64_t SkeletonFrom;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_contentItemForIdentifier:", a2);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "_mediaRemoteContentItem");
  SkeletonFrom = MRContentItemCreateSkeletonFrom();

  return SkeletonFrom;
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_contentItemForIdentifier:", MRContentItemGetIdentifier());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5 = WeakRetained;
  v6 = v2;
  msv_dispatch_sync_on_queue();
  v3 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v3;
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  const void *Error;
  _QWORD v36[4];
  _QWORD *v37;
  id v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  uint64_t *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", a3);
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x3010000000;
  v53 = 0;
  v54 = 0;
  v52 = &unk_193F4554F;
  MRPlaybackQueueRequestGetArtworkWidth();
  v10 = v9;
  MRPlaybackQueueRequestGetArtworkHeight();
  v53 = v10;
  v54 = v11;
  v12 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_14;
  v46[3] = &unk_1E315B8E8;
  v13 = WeakRetained;
  v47 = v13;
  v14 = v6;
  v48 = v14;
  v15 = (void *)MEMORY[0x19403A810](v46);
  v41[0] = v12;
  v41[1] = 3221225472;
  v41[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_16;
  v41[3] = &unk_1E315B938;
  v45 = &v49;
  v16 = v13;
  v42 = v16;
  v17 = v15;
  v44 = v17;
  v18 = v8;
  v43 = v18;
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v41);
  objc_msgSend(v16, "playbackQueueDataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    v22 = v16[40];
    v36[0] = v12;
    v36[1] = 3221225472;
    v36[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_20;
    v36[3] = &unk_1E315B960;
    v40 = &v49;
    v37 = v16;
    v38 = v18;
    v39 = v19;
    dispatch_async(v22, v36);

    v23 = v37;
  }
  else
  {
    objc_msgSend(v16, "_contentItemForIdentifier:", MRContentItemGetIdentifier());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "artwork");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      if (_block_invoke_onceToken != -1)
        dispatch_once(&_block_invoke_onceToken, &__block_literal_global_118_29324);
      v25 = v50[4];
      v26 = v50[5];
      v27 = *(double *)&MPNowPlayingContentItemArtworkMaxSize;
      if (v25 == *(double *)&MPNowPlayingContentItemArtworkMaxSize && v26 == *(double *)&qword_1EE2CFA60)
      {
        objc_msgSend(v23, "artwork");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bounds");
        v25 = v29;
        v26 = v30;

        v27 = *(double *)&MPNowPlayingContentItemArtworkMaxSize;
      }
      if (v25 == v27)
      {
        MSVGetMaximumScreenSize();
        v25 = v31;
      }
      if (v26 == *(double *)&qword_1EE2CFA60)
      {
        MSVGetMaximumScreenSize();
        v26 = v32;
      }
      objc_msgSend(v23, "artwork");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "imageWithSize:", v25, v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *, _QWORD))v19)[2](v19, v34, 0);
    }
    else
    {
      Error = (const void *)MRMediaRemoteCreateError();
      (*((void (**)(id, const void *))v14 + 2))(v14, Error);
      CFRelease(Error);
    }
  }

  _Block_object_dispose(&v49, 8);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_121(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v7)(id, _QWORD);
  _QWORD *WeakRetained;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  void (**v35)(id, _QWORD);
  _QWORD block[4];
  id v37;
  NSObject *v38;
  _QWORD *v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  int v47;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", a3);
  objc_msgSend(v9, "remoteArtworks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v7[2](v7, 0);
  }
  else
  {
    v11 = a2;
    objc_msgSend(v11, "artworkWidth");
    v13 = v12;
    objc_msgSend(v11, "artworkHeight");
    v15 = v14;
    v16 = dispatch_group_create();
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2810000000;
    v46[3] = &unk_193F4554F;
    v47 = 0;
    v17 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v11, "requestedRemoteArtworkFormats");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v11, "requestedRemoteArtworkFormats");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_group_enter(v16);
    v23 = WeakRetained[40];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_2_123;
    block[3] = &unk_1E315B9D0;
    v37 = v11;
    v38 = v16;
    v39 = WeakRetained;
    v24 = v9;
    v44 = v13;
    v45 = v15;
    v40 = v24;
    v43 = v46;
    v25 = v19;
    v41 = v25;
    v26 = v22;
    v42 = v26;
    v27 = v16;
    v28 = v11;
    dispatch_async(v23, block);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_4_130;
    v31[3] = &unk_1E315C088;
    v32 = v24;
    v33 = v25;
    v34 = v26;
    v35 = v7;
    v29 = v26;
    v30 = v25;
    dispatch_group_notify(v27, MEMORY[0x1E0C80D38], v31);

    _Block_object_dispose(v46, 8);
  }

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_6_136(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v6)(id, _QWORD);
  _QWORD *WeakRetained;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  _QWORD *v12;
  id v13;
  void (**v14)(id, _QWORD);

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", a3);
  objc_msgSend(v8, "lyrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v6[2](v6, 0);
  }
  else
  {
    v10 = WeakRetained[40];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_7_137;
    block[3] = &unk_1E3161780;
    v12 = WeakRetained;
    v13 = v8;
    v14 = v6;
    dispatch_async(v10, block);

  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_10_143(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  _QWORD *WeakRetained;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", a3);
  v9 = WeakRetained[40];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_11_144;
  block[3] = &unk_1E3161780;
  v14 = WeakRetained;
  v15 = v8;
  v16 = v6;
  v10 = v6;
  v11 = v8;
  v12 = WeakRetained;
  dispatch_async(v9, block);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_14_150(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  _QWORD *WeakRetained;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", a3);
  v9 = WeakRetained[40];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_15_151;
  block[3] = &unk_1E3161780;
  v14 = WeakRetained;
  v15 = v8;
  v16 = v6;
  v10 = v6;
  v11 = v8;
  v12 = WeakRetained;
  dispatch_async(v9, block);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_18_159(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  _QWORD *WeakRetained;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  _QWORD *v20;
  id v21;
  NSObject *v22;
  _QWORD *v23;
  _QWORD block[4];
  _QWORD *v25;
  id v26;
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", a3);
  v9 = dispatch_group_create();
  v10 = v9;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__29301;
  v29[4] = __Block_byref_object_dispose__29302;
  v30 = 0;
  v11 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 40))
  {
    dispatch_group_enter(v9);
    v12 = WeakRetained[40];
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_19_160;
    block[3] = &unk_1E31615D0;
    v25 = WeakRetained;
    v26 = v8;
    v28 = v29;
    v27 = v10;
    dispatch_async(v12, block);

  }
  if (*(_BYTE *)(a1 + 41))
  {
    dispatch_group_enter(v10);
    v13 = WeakRetained[40];
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_22;
    v19[3] = &unk_1E31615D0;
    v20 = WeakRetained;
    v21 = v8;
    v23 = v29;
    v22 = v10;
    dispatch_async(v13, v19);

  }
  v14 = WeakRetained[6];
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_25;
  v16[3] = &unk_1E315C1C8;
  v17 = v6;
  v18 = v29;
  v15 = v6;
  dispatch_group_notify(v10, v14, v16);

  _Block_object_dispose(v29, 8);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_19_160(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_20_161;
  v8[3] = &unk_1E315BA70;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 48);
  v5 = (id)v7;
  v10 = v7;
  v6 = (id)objc_msgSend(v2, "nowPlayingInfoCenter:availableLanguageOptionsForContentItem:completion:", v4, v9, v8);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_23;
  v8[3] = &unk_1E315BA70;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 48);
  v5 = (id)v7;
  v10 = v7;
  v6 = (id)objc_msgSend(v2, "nowPlayingInfoCenter:currentLanguageOptionsForContentItem:completion:", v4, v9, v8);

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_24;
  v11[3] = &unk_1E31635F8;
  v12 = *(id *)(a1 + 32);
  v10 = v5;
  v13 = v10;
  +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v11);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
    objc_storeStrong(v8, a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentLanguageOptions:", *(_QWORD *)(a1 + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_20_161(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_21_162;
  v11[3] = &unk_1E31635F8;
  v12 = *(id *)(a1 + 32);
  v10 = v5;
  v13 = v10;
  +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v11);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
    objc_storeStrong(v8, a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_21_162(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAvailableLanguageOptions:", *(_QWORD *)(a1 + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_15_151(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_16_152;
  v6[3] = &unk_1E315BA48;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v5 = (id)objc_msgSend(v2, "nowPlayingInfoCenter:transcriptAlignmentsForContentItem:completion:", v4, v7, v6);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_16_152(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_17_153;
  v8[3] = &unk_1E31635F8;
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  v6 = a3;
  +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_17_153(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTranscriptAlignments:", *(_QWORD *)(a1 + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_11_144(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_12_145;
  v6[3] = &unk_1E315BA20;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v5 = (id)objc_msgSend(v2, "nowPlayingInfoCenter:infoForContentItem:completion:", v4, v7, v6);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_12_145(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_13_146;
  v8[3] = &unk_1E31635F8;
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  v6 = a3;
  +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_13_146(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInfo:", *(_QWORD *)(a1 + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_7_137(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_8_138;
  v6[3] = &unk_1E315B9F8;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v5 = (id)objc_msgSend(v2, "nowPlayingInfoCenter:lyricsForContentItem:completion:", v4, v7, v6);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_8_138(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_9_139;
  v8[3] = &unk_1E31635F8;
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  v6 = a3;
  +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_9_139(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLyrics:", *(_QWORD *)(a1 + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_2_123(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id obj;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "requestedRemoteArtworkFormats");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v5);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 48), "playbackQueueDataSource");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 48);
        v9 = *(_QWORD *)(a1 + 56);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_3_124;
        v12[3] = &unk_1E315B9A8;
        v17 = *(_QWORD *)(a1 + 80);
        v13 = *(id *)(a1 + 64);
        v14 = v6;
        v15 = *(id *)(a1 + 72);
        v16 = *(id *)(a1 + 40);
        v10 = (id)objc_msgSend(v7, "nowPlayingInfoCenter:remoteArtworkForContentItem:format:size:completion:", v8, v9, v6, v12, *(double *)(a1 + 88), *(double *)(a1 + 96));

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_4_130(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_5_131;
  v6[3] = &unk_1E31635F8;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v6);
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "msv_errorWithDomain:code:underlyingErrors:debugDescription:", CFSTR("MPNowPlayingInfoCenterErrorDomain"), 101, v3, CFSTR("failed to create remoteArtwork for contentItemID: %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_5_131(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteArtworks:", *(_QWORD *)(a1 + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_3_124(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = v5;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPNowPlayingInfoCenterErrorDomain"), 1001, CFSTR("playbackQueueDataSource failed to produce remoteArtwork"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  double v24;
  double v25;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = *(void **)(a1 + 40);
  v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_15;
  v19[3] = &unk_1E315B8C0;
  v20 = v12;
  v21 = v11;
  v24 = a5;
  v25 = a6;
  v22 = v13;
  v23 = v14;
  v16 = v13;
  v17 = v11;
  v18 = v12;
  dispatch_async(v15, v19);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  NSObject *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  _QWORD *v29;
  id v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v5 = a2;
  v6 = a3;
  if (v6)
    goto LABEL_3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(double *)(v7 + 32);
  v9 = *(double *)(v7 + 40);
  objc_msgSend(v5, "size");
  v11 = v10;
  objc_msgSend(v5, "size");
  v33.size.height = v12;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v32.size.width = v8;
  v32.size.height = v9;
  v33.size.width = v11;
  if (CGRectContainsRect(v32, v33))
  {
LABEL_3:
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_19;
    block[3] = &unk_1E315C088;
    v14 = &v27;
    v27 = *(id *)(a1 + 48);
    v15 = &v24;
    v24 = *(id *)(a1 + 40);
    v16 = &v25;
    v25 = v5;
    v26 = v6;
    dispatch_async(v13, block);

  }
  else
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(double *)(v17 + 32) == *(double *)&MPNowPlayingContentItemArtworkMaxSize)
    {
      objc_msgSend(v5, "size");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v18;
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    if (*(double *)(v17 + 40) == *(double *)&qword_1EE2CFA60)
    {
      objc_msgSend(v5, "size");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v19;
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    v20 = *(_QWORD **)(a1 + 32);
    v21 = (void *)v20[19];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_17;
    v28[3] = &unk_1E315B910;
    v14 = (id *)&v29;
    v29 = v20;
    v15 = &v31;
    v31 = *(id *)(a1 + 48);
    v16 = &v30;
    v30 = *(id *)(a1 + 40);
    v22 = (id)objc_msgSend(v21, "resizeImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:saveToDestinationURL:completionHandler:", v5, 0, 0, v28, *(double *)(v17 + 32), *(double *)(v17 + 40));
  }

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_20(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(double *)(v2 + 32);
  v4 = *(double *)(v2 + 40);
  if (v3 == *(double *)&MPNowPlayingContentItemArtworkMaxSize)
  {
    MSVGetMaximumScreenSize();
    v3 = v5;
  }
  if (v4 == *(double *)&qword_1EE2CFA60)
  {
    MSVGetMaximumScreenSize();
    v4 = v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "nowPlayingInfoCenter:artworkForContentItem:size:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, v4);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_21()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_193B9B000, v0, OS_LOG_TYPE_ERROR, "Using deprecated contentItem-based artwork.", v1, 2u);
  }

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_18;
  v10[3] = &unk_1E315C088;
  v14 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), *MEMORY[0x1E0D4CF38]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "size");
  (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v2 + 16))(v2, v3, v4, *(_QWORD *)(a1 + 48));

}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), *MEMORY[0x1E0D4CF38]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "size");
  (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v2 + 16))(v2, v3, v4, *(_QWORD *)(a1 + 48));

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_15(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "_mediaRemoteContentItem");
    MRContentItemSetArtworkData();
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "_mediaRemoteContentItem");
    MRContentItemSetArtworkMIMEType();
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "_mediaRemoteContentItem");
    MRContentItemSetArtworkDataSize();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const void *v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (const void *)MRPlaybackSessionCreate();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRelease(v9);
  }

}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_4(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 176));
  objc_msgSend(WeakRetained, "nowPlayingInfoCenter:didEndMigrationWithIdentifier:error:", a1[4], a1[5], a1[6]);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 176));
  objc_msgSend(WeakRetained, "nowPlayingInfoCenter:willBeginSessionMigrationWithIdentifier:", a1[4], a1[5]);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke(uint64_t a1, CFTypeRef cf)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7[2];

  if (cf)
    CFRetain(cf);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 320);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_2;
  block[3] = &unk_1E315B708;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7[1] = (id)cf;
  objc_copyWeak(v7, (id *)(a1 + 48));
  dispatch_async(v4, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

void __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_3(uint64_t a1, CFTypeRef cf)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7[2];

  if (cf)
    CFRetain(cf);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 320);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_4;
  block[3] = &unk_1E315B708;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7[1] = (id)cf;
  objc_copyWeak(v7, (id *)(a1 + 48));
  dispatch_async(v4, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

void __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_4(uint64_t a1)
{
  MPNowPlayingInfoLyricsEvent *v2;
  id v3;
  const void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = -[MPNowPlayingInfoLyricsEvent initWithMediaRemoteLyricsEvent:]([MPNowPlayingInfoLyricsEvent alloc], "initWithMediaRemoteLyricsEvent:", *(_QWORD *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "nowPlayingInfoCenter:didEndLyricsEvent:", WeakRetained, v2);

  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);

}

void __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_2(uint64_t a1)
{
  MPNowPlayingInfoLyricsEvent *v2;
  id v3;
  const void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = -[MPNowPlayingInfoLyricsEvent initWithMediaRemoteLyricsEvent:]([MPNowPlayingInfoLyricsEvent alloc], "initWithMediaRemoteLyricsEvent:", *(_QWORD *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "nowPlayingInfoCenter:didEndLyricsEvent:", WeakRetained, v2);

  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);

}

void __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_92(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "contentItemForOffset:", *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_3;
  v3[3] = &unk_1E315B6B8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKeyedSubscript:", a3, a2);
}

void __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_193B9B000, v0, OS_LOG_TYPE_ERROR, "Using deprecated -contentItemForOffset: playback queue datasource.", v1, 2u);
  }

}

uint64_t __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id *v10;
  id *v11;
  __CFString *v12;
  id WeakRetained;
  __CFString *v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[4];
  void *v18;
  __CFString *v19;
  id v20;
  _QWORD v21[4];
  void *v22;
  id v23;
  _QWORD v24[5];
  __int128 v25;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueueDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  v4 = objc_alloc(MEMORY[0x1E0D4D048]);
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_2;
  v24[3] = &unk_1E315C618;
  v24[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 56);
  v6 = (id)v16;
  v25 = v16;
  v7 = (void *)objc_msgSend(v4, "initWithDeallocHandler:", v24);
  if ((v3 & 1) != 0)
  {
    +[_MPNowPlayingInfoTransportableSessionRequest requestWithIdentifier:preferredSessionType:](_MPNowPlayingInfoTransportableSessionRequest, "requestWithIdentifier:preferredSessionType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_3;
    v21[3] = &unk_1E315B550;
    v10 = &v22;
    v22 = v7;
    v11 = &v23;
    v23 = *(id *)(a1 + 56);
    v12 = v7;
    objc_msgSend(v2, "nowPlayingInfoCenter:getTransportablePlaybackSessionRepresentationForRequest:completion:", v9, v8, v21);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
      objc_msgSend(WeakRetained, "playbackQueueIdentifierForNowPlayingInfoCenter:", *(_QWORD *)(a1 + 32));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = CFSTR("<missing queue identifier>");
    }
    v15 = *(_QWORD *)(a1 + 32);
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_4;
    v17[3] = &unk_1E315B578;
    v10 = &v18;
    v11 = (id *)&v19;
    v18 = v7;
    v19 = v14;
    v20 = *(id *)(a1 + 56);
    v12 = v14;
    v8 = v7;
    objc_msgSend(v2, "nowPlayingInfoCenter:getTransportablePlaybackSessionRepresentationWithCompletion:", v15, v17);

  }
}

void __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id Error;

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPNowPlayingInfoCenter.m"), 603, CFSTR("MPNowPlayingPlaybackQueueDataSource getTransportablePlaybackSessionRepresentationWithCompletion completion was released without being called."));

  }
  v2 = a1[5];
  Error = (id)MRMediaRemoteCreateError();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, Error);

}

void __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "disarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)a1[4];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "disarm");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("transportablePlaybackSession"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  +[MPNowPlayingInfoTransportableSessionResponse responseWithIdentifier:sessionType:data:](MPNowPlayingInfoTransportableSessionResponse, "responseWithIdentifier:sessionType:data:", a1[5], v11, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16))();
}

void __64__MPNowPlayingInfoCenter__becomeActiveIfPossibleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "becomeActivePlayerIfPossible: %{public}@ error=%{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "becomeActivePlayerIfPossible: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

uint64_t __60__MPNowPlayingInfoCenter_artworkCatalogBlockForContentItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_artworkCatalogForContentItem:", *(_QWORD *)(a1 + 40));
}

void __51__MPNowPlayingInfoCenter_setNowPlayingContentItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 320);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MPNowPlayingInfoCenter_setNowPlayingContentItem___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __51__MPNowPlayingInfoCenter_setNowPlayingContentItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlaybackQueueImmediatelyWithCompletion:", &__block_literal_global_41_29428);
}

void __47__MPNowPlayingInfoCenter_nowPlayingContentItem__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

void __40__MPNowPlayingInfoCenter_lyricsDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 184));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __44__MPNowPlayingInfoCenter_setLyricsDelegate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 280))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 184));
    v4 = *(id *)(a1 + 40);

    if (WeakRetained != v4)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_registerLyricsDelegateCallbacks:", *(_QWORD *)(a1 + 40));
    }
  }
}

void __52__MPNowPlayingInfoCenter_resignActiveSystemFallback__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  os_log_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2
    && (objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MediaRemote"), a2, 0),
        (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (os_log_t)v2;
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[NSObject msv_description](v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "MPNowPlayingInfoCenter resigned active system fallback error=%{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  else
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "MPNowPlayingInfoCenter resigned active system fallback", (uint8_t *)&v6, 2u);
    }
  }

}

void __52__MPNowPlayingInfoCenter_becomeActiveSystemFallback__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a2, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "MPNowPlayingInfoCenter became active system fallback error=%{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "MPNowPlayingInfoCenter became active system fallback", (uint8_t *)&v6, 2u);
  }

}

uint64_t __39__MPNowPlayingInfoCenter_playbackState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  return result;
}

uint64_t __36__MPNowPlayingInfoCenter_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearPlaybackQueueDataSourceCallbacks");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 280) = 1;
  return result;
}

uint64_t __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_onQueue_stateDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5[2](v5, v9);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setNowPlayingInfo:(NSDictionary *)nowPlayingInfo
{
  void *v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)-[NSDictionary copy](nowPlayingInfo, "copy");
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MPNowPlayingInfoCenter_NowPlayingInfo__setNowPlayingInfo___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (NSDictionary)nowPlayingInfo
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
  v9 = __Block_byref_object_copy__30054;
  v10 = __Block_byref_object_dispose__30055;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MPNowPlayingInfoCenter_NowPlayingInfo__nowPlayingInfo__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)_onQueue_pushNowPlayingInfoAndRetry:(BOOL)a3
{
  _BOOL4 v3;
  NSDate *pushDate;
  double v6;
  dispatch_time_t v7;
  NSObject *calloutQueue;
  NSDate *v9;
  NSDate *v10;
  NSDictionary *v11;
  NSDictionary *convertedNowPlayingInfo;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[8];
  _QWORD block[5];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_nowPlayingInfo != self->_queuedNowPlayingInfo)
  {
    if (_onQueue_pushNowPlayingInfoAndRetry____once != -1)
      dispatch_once(&_onQueue_pushNowPlayingInfoAndRetry____once, &__block_literal_global_30034);
    pushDate = self->_pushDate;
    if (!pushDate
      || _onQueue_pushNowPlayingInfoAndRetry____isSystemApp
      || (-[NSDate timeIntervalSinceNow](pushDate, "timeIntervalSinceNow"), fabs(v6) >= 0.5))
    {
      objc_storeStrong((id *)&self->_nowPlayingInfo, self->_queuedNowPlayingInfo);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v10 = self->_pushDate;
      self->_pushDate = v9;

      _MPToMRNowPlayingInfoDictionary(self->_nowPlayingInfo, self->_publishedContext);
      v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      convertedNowPlayingInfo = self->_convertedNowPlayingInfo;
      self->_convertedNowPlayingInfo = v11;

      -[NSDictionary objectForKeyedSubscript:](self->_nowPlayingInfo, "objectForKeyedSubscript:", CFSTR("artwork"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPNowPlayingInfoCenterArtworkContext setArtwork:](self->_publishedContext, "setArtwork:", v13);

      -[NSDictionary objectForKeyedSubscript:](self->_convertedNowPlayingInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C9A8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPNowPlayingInfoCenterArtworkContext setArtworkIdentifier:](self->_publishedContext, "setArtworkIdentifier:", v14);

      -[NSDictionary objectForKeyedSubscript:](self->_convertedNowPlayingInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C990]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPNowPlayingInfoCenterArtworkContext setArtworkData:](self->_publishedContext, "setArtworkData:", v15);

      v16 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEFAULT, "NPIC: setNowPlayingInfo: sending to MediaRemote", v18, 2u);
      }

      -[MPNowPlayingInfoCenter playerPath](self, "playerPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      MRMediaRemoteSetNowPlayingInfoForPlayer();

    }
    else if (v3)
    {
      v7 = dispatch_time(0, 500000000);
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_2;
      block[3] = &unk_1E3163508;
      block[4] = self;
      dispatch_after(v7, calloutQueue, block);
    }
  }
}

void __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_3;
  block[3] = &unk_1E3163508;
  block[4] = v1;
  dispatch_barrier_async(v2, block);
}

void __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "NPIC: setNowPlayingInfo: finished error=%{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "NPIC: setNowPlayingInfo: finished", (uint8_t *)&v6, 2u);
  }

}

uint64_t __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushNowPlayingInfoAndRetry:", 0);
}

uint64_t __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke()
{
  uint64_t result;

  result = SBSIsSystemApplication();
  _onQueue_pushNowPlayingInfoAndRetry____isSystemApp = (_DWORD)result != 0;
  return result;
}

void __56__MPNowPlayingInfoCenter_NowPlayingInfo__nowPlayingInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __60__MPNowPlayingInfoCenter_NowPlayingInfo__setNowPlayingInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushNowPlayingInfoAndRetry:", 1);
}

@end
