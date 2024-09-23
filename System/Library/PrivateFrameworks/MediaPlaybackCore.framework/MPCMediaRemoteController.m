@implementation MPCMediaRemoteController

- (MPCPlayerPath)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (id)_init
{
  MPCMediaRemoteController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *calloutQueue;
  uint64_t v9;
  NSMutableArray *contentItemIDs;
  uint64_t v11;
  NSMutableDictionary *optimisticStateContentItems;
  uint64_t v13;
  NSMutableDictionary *contentItemChanges;
  uint64_t v15;
  NSMapTable *playbackQueueFutures;
  uint64_t v17;
  NSMapTable *contentItemFutures;
  uint64_t v19;
  NSMutableDictionary *contentItemArtworkFutures;
  uint64_t v21;
  NSMutableDictionary *contentItemRemoteArtworkFutures;
  uint64_t v23;
  NSMutableDictionary *contentItemArtworkIdentifiers;
  uint64_t v25;
  NSMutableDictionary *requestedRangeForProperties;
  uint64_t v27;
  NSMutableDictionary *contentItemIDsForProperties;
  uint64_t v29;
  MSVLRUDictionary *contentItems;
  uint64_t v31;
  MSVLRUDictionary *contentItemArtwork;
  void *v33;
  void *v34;
  MPCMediaRemoteController *v35;
  _QWORD v37[5];
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)MPCMediaRemoteController;
  v2 = -[MPCMediaRemoteController init](&v38, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCMediaRemoteController", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCMediaRemoteController.callout", v6);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    contentItemIDs = v2->_contentItemIDs;
    v2->_contentItemIDs = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    optimisticStateContentItems = v2->_optimisticStateContentItems;
    v2->_optimisticStateContentItems = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    contentItemChanges = v2->_contentItemChanges;
    v2->_contentItemChanges = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    playbackQueueFutures = v2->_playbackQueueFutures;
    v2->_playbackQueueFutures = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    contentItemFutures = v2->_contentItemFutures;
    v2->_contentItemFutures = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    contentItemArtworkFutures = v2->_contentItemArtworkFutures;
    v2->_contentItemArtworkFutures = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    contentItemRemoteArtworkFutures = v2->_contentItemRemoteArtworkFutures;
    v2->_contentItemRemoteArtworkFutures = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    contentItemArtworkIdentifiers = v2->_contentItemArtworkIdentifiers;
    v2->_contentItemArtworkIdentifiers = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    requestedRangeForProperties = v2->_requestedRangeForProperties;
    v2->_requestedRangeForProperties = (NSMutableDictionary *)v25;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    contentItemIDsForProperties = v2->_contentItemIDsForProperties;
    v2->_contentItemIDsForProperties = (NSMutableDictionary *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x24BE65C60]), "initWithMaximumCapacity:", 1);
    contentItems = v2->_contentItems;
    v2->_contentItems = (MSVLRUDictionary *)v29;

    -[MSVLRUDictionary setDelegate:](v2->_contentItems, "setDelegate:", v2);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BE65C60]), "initWithMaximumCapacity:", 1);
    contentItemArtwork = v2->_contentItemArtwork;
    v2->_contentItemArtwork = (MSVLRUDictionary *)v31;

    if (objc_msgSend((id)objc_opt_class(), "_shouldRegisterForNotifications"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObserver:selector:name:object:", v2, sel__playbackStateDidChangeNotification_, *MEMORY[0x24BE65A28], 0);
      objc_msgSend(v33, "addObserver:selector:name:object:", v2, sel__supportedCommandsDidChangeNotification_, *MEMORY[0x24BE65A30], 0);
      objc_msgSend(v33, "addObserver:selector:name:object:", v2, sel__playbackQueueChangedNotification_, *MEMORY[0x24BE65A80], 0);
      objc_msgSend(v33, "addObserver:selector:name:object:", v2, sel__playbackQueueContentItemsChangedNotification_, *MEMORY[0x24BE65A90], 0);
      objc_msgSend(v33, "addObserver:selector:name:object:", v2, sel__contentItemArtworkChangedNotification_, *MEMORY[0x24BE65A88], 0);
      objc_msgSend(v33, "addObserver:selector:name:object:", v2, sel__playbackQueueParticipantsDidChangeNotification_, *MEMORY[0x24BE65380], 0);

    }
    dispatch_get_global_queue(21, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _MRMediaRemoteRegisterForNowPlayingNotificationsEx();

    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __33__MPCMediaRemoteController__init__block_invoke;
    v37[3] = &unk_24CAB7248;
    v37[4] = v2;
    v35 = v2;
    v35->_stateHandle = __33__MPCMediaRemoteController__init__block_invoke((uint64_t)v37);

  }
  return v2;
}

uint64_t __33__MPCMediaRemoteController__init__block_invoke(uint64_t a1)
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

+ (BOOL)_shouldRegisterForNotifications
{
  return 1;
}

void __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke(uint64_t a1)
{
  void *v2;
  MPCFuture *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  NSObject *v13;
  _QWORD v14[4];
  __int128 v15;
  _QWORD v16[4];
  __int128 v17;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    if (!objc_msgSend(v2, "isInvalid"))
      goto LABEL_7;
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  objc_msgSend(v2, "disconnect");
  v3 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDebugLabel:", CFSTR("playbackQueueParticipants [was nil before]"));
  if (_os_feature_enabled_impl())
  {
    v6 = (void *)MEMORY[0x24BE65540];
    objc_msgSend(MEMORY[0x24BE65548], "defaultRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resolvedPlayerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mediaRemotePlayerPath");
    v16[0] = MEMORY[0x24BDAC760];
    v10 = *(_OWORD *)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16[1] = 3221225472;
    v16[2] = __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke_2;
    v16[3] = &unk_24CAB72E0;
    v17 = v10;
    objc_msgSend(v6, "fetchParticipantsWithRequest:forPlayerPath:queue:completion:", v7, v9, v11, v16);

  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v12 = *(_OWORD *)(a1 + 32);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v14[1] = 3221225472;
    v14[2] = __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke_3;
    v14[3] = &unk_24CABAB68;
    v15 = v12;
    dispatch_async(v13, v14);
  }
LABEL_7:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __45__MPCMediaRemoteController_supportedCommands__block_invoke(uint64_t a1)
{
  void *v2;
  MPCFuture *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
    goto LABEL_4;
  if (objc_msgSend(v2, "isInvalid"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
LABEL_4:
    objc_msgSend(v2, "disconnect");
    v3 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDebugLabel:", CFSTR("supportedCommands [was nil before]"));
    objc_msgSend(*(id *)(a1 + 32), "resolvedPlayerPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaRemotePlayerPath");
    MRMediaRemoteGetSupportedCommandsForPlayer();

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

+ (id)controllerForPlayerPath:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  if (controllerForPlayerPath__onceToken != -1)
    dispatch_once(&controllerForPlayerPath__onceToken, &__block_literal_global_26);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20569;
  v15 = __Block_byref_object_dispose__20570;
  v16 = 0;
  v4 = controllerForPlayerPath____playerPathControllersQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_29;
  v8[3] = &unk_24CABAB68;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __41__MPCMediaRemoteController_playbackState__block_invoke_3(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

- (MPCFuture)supportedCommands
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
  v9 = __Block_byref_object_copy__20569;
  v10 = __Block_byref_object_dispose__20570;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__MPCMediaRemoteController_supportedCommands__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPCFuture *)v3;
}

- (MPCFuture)playbackQueueParticipants
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
  v9 = __Block_byref_object_copy__20569;
  v10 = __Block_byref_object_dispose__20570;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPCFuture *)v3;
}

- (MPCFuture)playbackState
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
  v9 = __Block_byref_object_copy__20569;
  v10 = __Block_byref_object_dispose__20570;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__MPCMediaRemoteController_playbackState__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPCFuture *)v3;
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  __objc2_class **v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = a1[4];
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEBUG, "MRC: Resolved player path %@ (resolved = %@)", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v3, "mediaRemotePlayerPath");
  v6 = off_24CAA2DB8;
  if ((MRNowPlayingPlayerPathIsLocal() & 1) == 0)
  {
    objc_msgSend(v3, "mediaRemotePlayerPath");
    if (!MRNowPlayingPlayerPathGetIsResolved())
      v6 = off_24CAA37A8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "_init");
  objc_msgSend(v7, "setInvalidationToken:", a1[5]);
  objc_msgSend(v7, "setResolvedPlayerPath:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "finishWithValue:", v7);

}

- (void)setResolvedPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, a3);
}

- (void)setInvalidationToken:(id)a3
{
  objc_storeStrong(&self->_invalidationToken, a3);
}

- (id)contentItemForIdentifier:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20569;
  v16 = __Block_byref_object_dispose__20570;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke;
  block[3] = &unk_24CAB85F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)artworkCatalogBlockForContentItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__MPCMediaRemoteController_artworkCatalogBlockForContentItem___block_invoke;
  v8[3] = &unk_24CAB74F8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

void __41__MPCMediaRemoteController_playbackState__block_invoke(uint64_t a1)
{
  void *v2;
  MPCFuture *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    if (!objc_msgSend(v2, "isInvalid"))
      return;
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_msgSend(v2, "disconnect");
  v3 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDebugLabel:", CFSTR("playbackState [was nil before]"));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "resolvedPlayerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaRemotePlayerPath");
  MRMediaRemoteGetPlaybackStateForPlayer();

}

id __62__MPCMediaRemoteController_artworkCatalogBlockForContentItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_artworkCatalogBlockForContentItem:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showDebugUI");

  if (v6)
  {
    if (ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_onceToken != -1)
      dispatch_once(&ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_onceToken, &__block_literal_global_178);
    if (ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_processSupportsDebugUI)
    {
      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BDDC6D8], "placeholderCatalogWithSymbolName:", CFSTR("music"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setOverlayDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOverlayToken:", v7);

    }
  }

  return v4;
}

uint64_t __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_artworkCatalogForContentItem:", *(_QWORD *)(a1 + 40));
}

- (id)_artworkCatalogBlockForContentItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  MPCMediaRemoteController *v15;
  _QWORD aBlock[4];
  id v17;
  id v18;

  v4 = a3;
  if (!-[MPCPlayerPath isInProcess](self->_resolvedPlayerPath, "isInProcess"))
    goto LABEL_5;
  -[MPCPlayerPath playerID](self->_resolvedPlayerPath, "playerID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCAC8], "infoCenterForPlayerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "supportsArtworkCatalogLoading"))
  {

LABEL_5:
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke_2;
    v13[3] = &unk_24CAB74F8;
    v14 = v4;
    v15 = self;
    v5 = v4;
    v11 = _Block_copy(v13);
    v10 = _Block_copy(v11);

    v8 = v14;
    goto LABEL_6;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke;
  aBlock[3] = &unk_24CAB74F8;
  v17 = v6;
  v18 = v4;
  v7 = v4;
  v8 = v6;
  v9 = _Block_copy(aBlock);
  v10 = _Block_copy(v9);

LABEL_6:
  return v10;
}

void __74__MPCMediaRemoteController__playbackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        MRContentItemGetIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:", v8, (_QWORD)v16);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "setObject:forKeyedSubscript:", 0, v8);
          if (v9)
          {
            v10 = objc_retainAutorelease((id)objc_msgSend(v9, "copy"));
            objc_msgSend(v10, "_mediaRemoteContentItem");
            MRContentItemMerge();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKeyedSubscript:", v10, v8);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "objectForKey:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "invalidate");

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "objectForKey:", v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "disconnect");

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "removeObjectForKey:", v8);
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "objectForKeyedSubscript:", v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v10 = objc_retainAutorelease(v13);
              objc_msgSend(v10, "_mediaRemoteContentItem");
              MRContentItemMerge();
            }
            else
            {
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCAA8]), "_initWithMediaRemoteContentItem:", v7);
              v15 = (void *)objc_msgSend(v14, "copy");
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "setObject:forKeyedSubscript:", v15, v8);

              v10 = 0;
            }
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

void __68__MPCMediaRemoteController__supportedCommandsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "disconnect");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
}

void __62__MPCMediaRemoteController__playbackQueueChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 232);
  *(_QWORD *)(v2 + 232) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 240);
  *(_QWORD *)(v4 + 240) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = 0;

  v8 = *MEMORY[0x24BE65BF0];
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 72) = *MEMORY[0x24BE65BF0];
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 88) = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  NSAllMapTableValues(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 152));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v14, "invalidate");
        objc_msgSend(v14, "disconnect");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "removeAllObjects");

}

void __55__MPCMediaRemoteController__onQueue_mergeContentItems___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        MRContentItemGetIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "pokeKey:", v8, (_QWORD)v13);
        if ((MRContentItemIsEmpty() & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v9, "copy");

          if (v10)
          {
            v11 = objc_retainAutorelease(v10);
            objc_msgSend(v11, "_mediaRemoteContentItem");
            MRContentItemMerge();
          }
          else
          {
            v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDCAA8]), "_initWithMediaRemoteContentItem:", v7);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "objectForKeyedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(objc_retainAutorelease(v11), "_mediaRemoteContentItem");
            objc_msgSend(objc_retainAutorelease(v12), "_mediaRemoteContentItem");
            MRContentItemMerge();
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKeyedSubscript:", v11, v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "setObject:forKeyedSubscript:", 0, v8);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

void __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  MPCFuture *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  _QWORD v21[5];
  __int128 v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "pokeKey:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v5)
  {
    if (!objc_msgSend(v5, "isInvalid"))
      return;
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(v5, "disconnect");
  v6 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contentItem - %@"), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDebugLabel:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)objc_msgSend(v12, "copy");

      objc_msgSend(v14, "_mergeContentItem:", v13);
      v12 = v14;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finishWithValue:", v12);

  }
  else
  {
    v23[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v15 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();
    MRPlaybackQueueRequestSetIncludeMetadata();
    MRPlaybackQueueRequestSetIncludeLanguageOptions();
    objc_msgSend(*(id *)(a1 + 32), "resolvedPlayerPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mediaRemotePlayerPath");
    dispatch_get_global_queue(21, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_2;
    v21[3] = &unk_24CAB73A8;
    v21[4] = *(_QWORD *)(a1 + 32);
    v20 = *(_OWORD *)(a1 + 40);
    v19 = (id)v20;
    v22 = v20;
    MEMORY[0x212BD1C74](v15, v17, v18, v21);

    if (v15)
      CFRelease(v15);

  }
}

void __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v6 == *(void **)(v7 + 56))
    {
      *(_QWORD *)(v7 + 64) = 0;
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 56);
      *(_QWORD *)(v8 + 56) = 0;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "finishWithError:", v5);
  }
  else
  {
    if (v12)
      v10 = v12;
    else
      v10 = (id)MEMORY[0x24BDBD1A8];
    objc_msgSend(v6, "finishWithValue:", v10);
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == *(_QWORD *)(v11 + 56))
      *(_QWORD *)(v11 + 64) = 1;
  }

}

void __41__MPCMediaRemoteController_playbackState__block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD aBlock[4];
  int v8;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MPCMediaRemoteController_playbackState__block_invoke_3;
  aBlock[3] = &__block_descriptor_36_e5_I8__0l;
  v8 = a2;
  v5 = _Block_copy(aBlock);
  objc_msgSend(v4, "finishWithValue:", v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == *(_QWORD *)(v6 + 24))
    *(_QWORD *)(v6 + 32) = 1;
}

void __45__MPCMediaRemoteController_supportedCommands__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSMapTable *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const void *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v6 == *(void **)(v5 + 40))
    {
      *(_QWORD *)(v5 + 48) = 0;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "finishWithError:", a3);
  }
  else
  {
    v9 = a2;
    if (objc_msgSend(v9, "count"))
    {
      v10 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, objc_msgSend(v9, "count"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v16 = *(const void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            v17 = MEMORY[0x212BD1B48](v16);
            NSMapInsert(v10, (const void *)(v17 | 0x80000000), v16);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v13);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithValue:", v10, (_QWORD)v24);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "resolvedPlayerPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isInProcess");

      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      if (v19)
      {
        objc_msgSend(*(id *)(v20 + 40), "finishWithValue:", MEMORY[0x24BDBD1B8]);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_legacyCommands");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "finishWithValue:", v22);

      }
    }
    v23 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == *(_QWORD *)(v23 + 40))
      *(_QWORD *)(v23 + 48) = 1;

  }
}

- (void)_onQueue_mergeContentItems:(id)a3
{
  id v4;
  MSVLRUDictionary *contentItems;
  id v6;
  _QWORD v7[4];
  id v8;
  MPCMediaRemoteController *v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  contentItems = self->_contentItems;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__MPCMediaRemoteController__onQueue_mergeContentItems___block_invoke;
  v7[3] = &unk_24CABA1D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[MSVLRUDictionary performTransaction:](contentItems, "performTransaction:", v7);

}

- (id)_onQueue_identifiersForRange:(_MSVSignedRange)a3
{
  unint64_t length;
  int64_t location;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;

  length = a3.length;
  location = a3.location;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v6 = self->_loadedContentItemsRange.location;
  if (location <= v6)
    v7 = self->_loadedContentItemsRange.location;
  else
    v7 = location;
  if (v6 < 0)
    v6 = -v6;
  v8 = v6 + v7;
  v9 = -[NSMutableArray count](self->_contentItemIDs, "count");
  if (length >= v9 - v8)
    v10 = v9 - v8;
  else
    v10 = length;
  return (id)-[NSMutableArray subarrayWithRange:](self->_contentItemIDs, "subarrayWithRange:", v8, v10);
}

- (void)_playbackQueueChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *accessQueue;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE65A68]);

  -[MPCMediaRemoteController resolvedPlayerPath](self, "resolvedPlayerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaRemotePlayerPath");
  v6 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__MPCMediaRemoteController__playbackQueueChangedNotification___block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

- (void)_supportedCommandsDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *accessQueue;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE65A68]);

  -[MPCMediaRemoteController resolvedPlayerPath](self, "resolvedPlayerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaRemotePlayerPath");
  v6 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__MPCMediaRemoteController__supportedCommandsDidChangeNotification___block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)controllerForPlayerPath____playerPathControllers;
  controllerForPlayerPath____playerPathControllers = v0;

  v2 = dispatch_queue_create("com.apple.MPCMediaRemoteController.playerPathControllersQueue/access", 0);
  v3 = (void *)controllerForPlayerPath____playerPathControllersQueue;
  controllerForPlayerPath____playerPathControllersQueue = (uint64_t)v2;

  v4 = dispatch_queue_create("com.apple.MPCMediaRemoteController.playerPathControllersQueue/callout", 0);
  v5 = (void *)controllerForPlayerPath____playerPathControllersFutureQueue;
  controllerForPlayerPath____playerPathControllersFutureQueue = (uint64_t)v4;

}

- (void)_playbackStateDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *accessQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  MPCMediaRemoteController *v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65A68]);

  -[MPCMediaRemoteController resolvedPlayerPath](self, "resolvedPlayerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaRemotePlayerPath");
  v7 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v7)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE65A20]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    accessQueue = self->_accessQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__MPCMediaRemoteController__playbackStateDidChangeNotification___block_invoke;
    v12[3] = &unk_24CABA1D0;
    v13 = v9;
    v14 = self;
    v11 = v9;
    dispatch_async(accessQueue, v12);

  }
}

- (void)_playbackQueueContentItemsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *accessQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  MPCMediaRemoteController *v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65A68]);

  -[MPCMediaRemoteController resolvedPlayerPath](self, "resolvedPlayerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaRemotePlayerPath");
  v7 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v7)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE65A58]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    accessQueue = self->_accessQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74__MPCMediaRemoteController__playbackQueueContentItemsChangedNotification___block_invoke;
    v12[3] = &unk_24CABA1D0;
    v13 = v9;
    v14 = self;
    v11 = v9;
    dispatch_async(accessQueue, v12);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  MEMORY[0x212BD20AC](self->_stateHandle, a2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  v4.receiver = self;
  v4.super_class = (Class)MPCMediaRemoteController;
  -[MPCMediaRemoteController dealloc](&v4, sel_dealloc);
}

- (id)remoteArtworkDataSource
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
  v9 = __Block_byref_object_copy__20569;
  v10 = __Block_byref_object_dispose__20570;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__MPCMediaRemoteController_remoteArtworkDataSource__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)mediaRemoteArtworkDataSource
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
  v9 = __Block_byref_object_copy__20569;
  v10 = __Block_byref_object_dispose__20570;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__MPCMediaRemoteController_mediaRemoteArtworkDataSource__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  NSObject *accessQueue;
  uint64_t v10;
  id v11;
  id v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  MPCMediaRemoteController *v23;
  id v24;
  _QWORD *v25;
  int v26;
  _QWORD v27[4];
  id v28;
  MPCMediaRemoteController *v29;
  _QWORD *v30;
  int v31;
  _QWORD block[5];
  id v33;
  _QWORD *v34;
  int v35;
  _QWORD v36[5];
  id v37;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v20 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__111;
  v36[4] = __Block_byref_object_dispose__112;
  v37 = 0;
  accessQueue = self->_accessQueue;
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke;
  block[3] = &unk_24CAB7308;
  v34 = v36;
  block[4] = self;
  v35 = v6;
  v11 = v8;
  v33 = v11;
  dispatch_sync(accessQueue, block);
  v12 = objc_alloc_init(MEMORY[0x24BE65C40]);
  v13 = dispatch_time(0, 5500000000);
  v14 = self->_accessQueue;
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke_2;
  v27[3] = &unk_24CAB7308;
  v30 = v36;
  v15 = v12;
  v28 = v15;
  v29 = self;
  v31 = v6;
  dispatch_after(v13, v14, v27);
  v16 = (void *)objc_opt_class();
  -[MPCMediaRemoteController resolvedPlayerPath](self, "resolvedPlayerPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke_114;
  v21[3] = &unk_24CAB7330;
  v18 = v15;
  v25 = v36;
  v22 = v18;
  v23 = self;
  v26 = v6;
  v19 = v20;
  v24 = v19;
  objc_msgSend(v16, "sendCommand:options:toPlayerPath:completion:", v6, v11, v17, v21);

  _Block_object_dispose(v36, 8);
}

- (id)playbackQueueForRequest:(void *)a3
{
  void *v5;
  NSObject *accessQueue;
  id v7;
  _QWORD block[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCMediaRemoteController: %p>"), self);
  MRPlaybackQueueRequestSetLabel();
  -[MPCMediaRemoteController _requestPropertiesDescriptionForRequest:](self, "_requestPropertiesDescriptionForRequest:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__20569;
  v14 = __Block_byref_object_dispose__20570;
  v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__MPCMediaRemoteController_playbackQueueForRequest___block_invoke;
  block[3] = &unk_24CAB7380;
  block[4] = self;
  block[5] = v5;
  block[6] = &v10;
  block[7] = a3;
  dispatch_sync(accessQueue, block);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (int64_t)contentItemCacheStateForIdentifier:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MPCMediaRemoteController_contentItemCacheStateForIdentifier___block_invoke;
  block[3] = &unk_24CAB85F0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)contentItemArtworkCacheStateForArtworkIdentifier:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  NSObject *accessQueue;
  id v9;
  int64_t v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__MPCMediaRemoteController_contentItemArtworkCacheStateForArtworkIdentifier_size___block_invoke;
  block[3] = &unk_24CAB73D0;
  v15 = width;
  v16 = height;
  block[4] = self;
  v13 = v7;
  v14 = &v17;
  v9 = v7;
  dispatch_sync(accessQueue, block);
  v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)contentItemArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__20569;
  v26 = __Block_byref_object_dispose__20570;
  v27 = 0;
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke;
  v16[3] = &unk_24CAB7488;
  v20 = width;
  v21 = height;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = &v22;
  v12 = v9;
  v13 = v10;
  dispatch_sync(accessQueue, v16);
  v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (id)contentItemRemoteArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5 artworkFormat:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__20569;
  v27 = __Block_byref_object_dispose__20570;
  v28 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __114__MPCMediaRemoteController_contentItemRemoteArtworkForContentItemIdentifier_artworkIdentifier_size_artworkFormat___block_invoke;
  block[3] = &unk_24CAB8648;
  v21 = v11;
  v22 = &v23;
  block[4] = self;
  v19 = v10;
  v20 = v9;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_sync(accessQueue, block);
  v16 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v16;
}

- (void)_contentItemArtworkChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *accessQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  MPCMediaRemoteController *v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65A68]);

  -[MPCMediaRemoteController resolvedPlayerPath](self, "resolvedPlayerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaRemotePlayerPath");
  v7 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v7)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE65A58]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    accessQueue = self->_accessQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__MPCMediaRemoteController__contentItemArtworkChangedNotification___block_invoke;
    v12[3] = &unk_24CABA1D0;
    v13 = v9;
    v14 = self;
    v11 = v9;
    dispatch_async(accessQueue, v12);

  }
}

- (void)_playbackQueueParticipantsDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *accessQueue;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE65A68]);

  -[MPCMediaRemoteController resolvedPlayerPath](self, "resolvedPlayerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaRemotePlayerPath");
  v6 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__MPCMediaRemoteController__playbackQueueParticipantsDidChangeNotification___block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

- (void)dictionary:(id)a3 willRemoveObject:(id)a4 forKey:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v7 = a4;
  v8 = v7;
  if (self->_contentItems == a3)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artworkIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__MPCMediaRemoteController_dictionary_willRemoveObject_forKey___block_invoke;
    block[3] = &unk_24CABAA28;
    block[4] = self;
    v15 = v9;
    v16 = v10;
    v12 = v10;
    v13 = v9;
    dispatch_async(accessQueue, block);

  }
}

- (void)invalidateAllTokens
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__MPCMediaRemoteController_invalidateAllTokens__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (id)overlayVisualIdenticalityForCatalog:(id)a3
{
  return (id)objc_msgSend(a3, "overlayToken");
}

- (void)artworkCatalog:(id)a3 willConfigureView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 != 3)
  {
    objc_msgSend(v7, "artworkCatalog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 && (objc_msgSend(v7, "_lastArtworkCatalog"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
      || (objc_msgSend(v10, "overlayStorage"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "setOverlayStorage:", 0),
          objc_msgSend(v6, "setOverlayStorage:", v11),
          !v11))
    {
      objc_msgSend(v7, "viewWithTag:", 11259375);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        objc_msgSend(v12, "removeFromSuperview");
      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v14 = (void *)getMFDebugOverlayControllerClass_softClass;
      v36 = getMFDebugOverlayControllerClass_softClass;
      if (!getMFDebugOverlayControllerClass_softClass)
      {
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __getMFDebugOverlayControllerClass_block_invoke;
        v32[3] = &unk_24CAB9A48;
        v32[4] = &v33;
        __getMFDebugOverlayControllerClass_block_invoke((uint64_t)v32);
        v14 = (void *)v34[3];
      }
      v15 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v33, 8);
      v16 = objc_alloc_init(v15);
      if (!v16)
        goto LABEL_14;
      v11 = v16;
      objc_msgSend(v16, "viewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setTag:", 11259375);
      objc_msgSend(v7, "addSubview:", v18);
      objc_msgSend(v7, "bounds");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v11, "viewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFrame:", v20, v22, v24, v26);

      v29 = v7;
      do
      {
        objc_msgSend(v29, "setUserInteractionEnabled:", 1);
        objc_msgSend(v29, "superview");
        v30 = objc_claimAutoreleasedReturnValue();

        v29 = (id)v30;
      }
      while (v30);
      objc_msgSend(v6, "setOverlayStorage:", v11);

    }
    objc_msgSend(v11, "setPlayerPath:", -[MPCPlayerPath mediaRemotePlayerPath](self->_resolvedPlayerPath, "mediaRemotePlayerPath"));
    objc_msgSend(v6, "overlayToken");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentItemID:", v31);

    v13 = v11;
LABEL_14:

  }
}

- (CGSize)overlayScaledFittingSizeForCatalog:(id)a3 scaledFittingSize:(CGSize)result
{
  if (result.width < 600.0)
  {
    result.width = 600.0;
    result.height = 600.0;
  }
  return result;
}

- (void)artworkCatalog:(id)a3 didConfigureView:(id)a4 withRepresentation:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a5;
  objc_msgSend(a3, "overlayStorage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

}

- (void)artworkCatalog:(id)a3 didClearFromView:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "overlayStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

}

- (id)_createExportableArtworkPropertiesForContentItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "artworkURLTemplates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDDC738]);
  objc_msgSend(v6, "setArtworkTemplateItems:", v4);
  objc_msgSend(v6, "setResolvedURLString:", v5);
  v7 = objc_msgSend(v3, "mediaType");

  objc_msgSend(v6, "setMediaType:", v7);
  objc_msgSend(v6, "setMediaLibraryArtworkType:", 1);

  return v6;
}

- (id)_legacyCommands
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(&unk_24CB17488, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&unk_24CB17488, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_24CB17488);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MRMediaRemoteCommandInfoCreate();
        objc_msgSend(v7, "unsignedIntValue");
        MRMediaRemoteCommandInfoSetCommand();
        MRMediaRemoteCommandInfoSetEnabled();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_24CB17488, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  return v2;
}

- (id)_onQueue_playbackQueueForRange:(_MSVSignedRange)a3
{
  unint64_t length;
  int64_t location;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  MPCMediaRemoteControllerPlaybackQueue *v12;

  length = a3.length;
  location = a3.location;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v6 = self->_loadedContentItemsRange.location;
  if (location <= v6)
    v7 = self->_loadedContentItemsRange.location;
  else
    v7 = location;
  if (v6 < 0)
    v6 = -v6;
  v8 = v6 + v7;
  v9 = -[NSMutableArray count](self->_contentItemIDs, "count");
  if (length >= v9 - v8)
    v10 = v9 - v8;
  else
    v10 = length;
  -[NSMutableArray subarrayWithRange:](self->_contentItemIDs, "subarrayWithRange:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPCMediaRemoteControllerPlaybackQueue initWithIdentifiers:playingIdentifier:queueIdentifier:queueProperties:]([MPCMediaRemoteControllerPlaybackQueue alloc], "initWithIdentifiers:playingIdentifier:queueIdentifier:queueProperties:", v11, self->_playingItemIdentifier, self->_queueIdentifier, self->_queueProperties);

  return v12;
}

- (void)_onQueue_mergeContentItems:(id)a3 queueRange:(_MSVSignedRange)a4 requestRange:(_MSVSignedRange)a5 requestProperties:(id)a6
{
  int64_t length;
  int64_t location;
  id v10;
  id v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  NSMutableArray *contentItemIDs;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  length = a4.length;
  location = a4.location;
  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (location <= 0 && length > -location)
  {
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", -location);

    }
    MRContentItemGetIdentifier();
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 != self->_playingItemIdentifier && !-[NSString isEqualToString:](v12, "isEqualToString:"))
    {
      objc_storeStrong((id *)&self->_playingItemIdentifier, v13);
      NSAllMapTableValues(self->_playbackQueueFutures);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "invalidate");
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v16);
      }

    }
  }
  v19 = MSVSignedUnionRange();
  v21 = v20;
  v22 = vcvtpd_s64_f64((double)v20 * 1.5);
  if (-[MSVLRUDictionary maximumCapacity](self->_contentItems, "maximumCapacity") < v22)
  {
    -[MSVLRUDictionary setMaximumCapacity:](self->_contentItems, "setMaximumCapacity:", v22);
    -[MSVLRUDictionary setMaximumCapacity:](self->_contentItemArtwork, "setMaximumCapacity:", v22);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contentItemIDsForProperties, "objectForKeyedSubscript:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", v22);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __97__MPCMediaRemoteController__onQueue_mergeContentItems_queueRange_requestRange_requestProperties___block_invoke;
  v33[3] = &unk_24CAB7520;
  v34 = v26;
  v27 = v26;
  objc_msgSend(v10, "msv_map:", v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contentItemIDsForProperties, "setObject:forKeyedSubscript:", v27, v11);
  -[MPCMediaRemoteController _onQueue_mergeContentItems:](self, "_onQueue_mergeContentItems:", v10);
  contentItemIDs = self->_contentItemIDs;
  v30 = MSVReplacementRangeForRanges();
  -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](contentItemIDs, "replaceObjectsInRange:withObjectsFromArray:", v30, v31, v28);
  self->_loadedContentItemsRange.location = v19;
  self->_loadedContentItemsRange.length = v21;
  self->_requestedContentItemsRange.location = MSVSignedUnionRange();
  self->_requestedContentItemsRange.length = v32;

}

- (void)_onQueue_purgeContentItemIdentifierForProperties:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *contentItemIDsForProperties;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  contentItemIDsForProperties = self->_contentItemIDsForProperties;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__MPCMediaRemoteController__onQueue_purgeContentItemIdentifierForProperties___block_invoke;
  v9[3] = &unk_24CAB7548;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contentItemIDsForProperties, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[NSMutableDictionary removeObjectsForKeys:](self->_contentItemIDsForProperties, "removeObjectsForKeys:", v7);

}

- (void)_onQueue_purgeArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (!objc_msgSend(v6, "length"))
  {
    -[MSVLRUDictionary objectForKeyedSubscript:](self->_contentItems, "objectForKeyedSubscript:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artworkIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v8, "artworkIdentifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v12;
    }
    v7 = v10;

  }
  if (objc_msgSend(v7, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contentItemArtworkIdentifiers, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v11, "removeObject:", v12);
    if (!objc_msgSend(v11, "count"))
      -[MSVLRUDictionary removeObjectForKey:](self->_contentItemArtwork, "removeObjectForKey:", v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contentItemArtworkIdentifiers, "setObject:forKeyedSubscript:", v11, v7);

  }
}

- (void)_onQueue_purgeArtworkForContentItemIdentifier:(id)a3
{
  -[MPCMediaRemoteController _onQueue_purgeArtworkForContentItemIdentifier:artworkIdentifier:](self, "_onQueue_purgeArtworkForContentItemIdentifier:artworkIdentifier:", a3, 0);
}

- (void)_onQueue_invalidateArtworkFuturesForContentItemID:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contentItemArtworkFutures, "objectForKeyedSubscript:", v4);
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    NSAllMapTableValues(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v12, "invalidate");
          objc_msgSend(v12, "disconnect");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    -[NSMapTable removeAllObjects](v6, "removeAllObjects");

  }
}

- (id)_onQueue_stateDictionary
{
  MPCFuture *v3;
  void *v4;
  void (**v5)(void);
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  MPCPlayerPath *resolvedPlayerPath;
  NSMutableArray *contentItemIDs;
  NSMutableDictionary *optimisticStateContentItems;
  const __CFString *v13;
  const __CFString *queueIdentifier;
  NSDictionary *queueProperties;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *playingItemIdentifier;
  void *v26;
  MPCFuture *v28;
  _QWORD v29[11];
  _QWORD v30[13];

  v30[11] = *MEMORY[0x24BDAC8D0];
  v3 = self->_playbackStateFuture;
  -[MPCFuture result](v3, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v3;
  if (v4)
  {
    -[MPCFuture result](v3, "result");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[NSMutableDictionary allKeys](self->_contentItemChanges, "allKeys");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[MPCFuture result](self->_supportedCommandsFuture, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCED8];
  v29[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  resolvedPlayerPath = self->_resolvedPlayerPath;
  v30[0] = v9;
  v30[1] = resolvedPlayerPath;
  v29[1] = CFSTR("resolvedPlayerPath");
  v29[2] = CFSTR("contentItemIDs");
  contentItemIDs = self->_contentItemIDs;
  if (!contentItemIDs)
    contentItemIDs = (NSMutableArray *)MEMORY[0x24BDBD1A8];
  v30[2] = contentItemIDs;
  v29[3] = CFSTR("contentItemChanges:keys");
  optimisticStateContentItems = (NSMutableDictionary *)CFSTR("<EMPTY>");
  if (-[__CFString count](v6, "count"))
    v13 = v6;
  else
    v13 = CFSTR("<EMPTY>");
  queueIdentifier = (const __CFString *)self->_queueIdentifier;
  queueProperties = self->_queueProperties;
  if (!queueIdentifier)
    queueIdentifier = CFSTR("<NULL>");
  v30[3] = v13;
  v30[4] = queueIdentifier;
  v29[4] = CFSTR("queueIdentifier");
  v29[5] = CFSTR("queueProperties");
  if (queueProperties)
    v16 = (const __CFString *)queueProperties;
  else
    v16 = CFSTR("<NULL>");
  v30[5] = v16;
  v29[6] = CFSTR("optimisticStateContentItems");
  if (-[NSMutableDictionary count](self->_optimisticStateContentItems, "count"))
    optimisticStateContentItems = self->_optimisticStateContentItems;
  v30[6] = optimisticStateContentItems;
  v29[7] = CFSTR("supportedCommands");
  objc_msgSend(v7, "allCommandInfos");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("<NULL>");
  v30[7] = v19;
  v29[8] = CFSTR("playbackState");
  v20 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
  v30[8] = v20;
  v29[9] = CFSTR("loadedRange");
  NSStringFromMSVSignedRange();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v21;
  v29[10] = CFSTR("requestedRange");
  NSStringFromMSVSignedRange();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  playingItemIdentifier = self->_playingItemIdentifier;
  if (playingItemIdentifier)
  {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", playingItemIdentifier, CFSTR("playingItemIdentifier"));
    -[MSVLRUDictionary objectForKeyedSubscript:](self->_contentItems, "objectForKeyedSubscript:", self->_playingItemIdentifier);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("playingItem"));

  }
  return v24;
}

- (id)_requestPropertiesDescriptionForRequest:(void *)a3
{
  return (id)objc_msgSend(a3, "requestProperties");
}

- (int64_t)playbackStateCacheState
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__MPCMediaRemoteController_playbackStateCacheState__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)supportedCommandsCacheState
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__MPCMediaRemoteController_supportedCommandsCacheState__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)playbackQueueParticipantsCacheState
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__MPCMediaRemoteController_playbackQueueParticipantsCacheState__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_onQueue_updateOptimisticStateForCommand:(unsigned int)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t (**v10)(void);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v41[4];
  id v42;
  id v43;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (a3 == 2)
  {
    -[MPCFuture result](self->_playbackStateFuture, "result");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_32;
    v8 = (void *)v7;
    v9 = -[MPCFuture isInvalid](self->_playbackStateFuture, "isInvalid");

    if (v9)
      goto LABEL_32;
    -[MPCFuture result](self->_playbackStateFuture, "result");
    v10 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    a3 = v10[2]() == 1;

  }
  v11 = 0;
  if ((int)a3 > 2)
  {
    if (a3 != 3)
    {
      if (a3 != 24)
      {
        if (a3 == 130)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE658D0]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE65910]);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v12)
            v15 = v13 == 0;
          else
            v15 = 1;
          if (v15)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE65908]);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (v12 && v16)
              -[MPCMediaRemoteController _onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:afterContentItemIdentifier:](self, "_onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:afterContentItemIdentifier:", v12, v16);

          }
          else
          {
            -[MPCMediaRemoteController _onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:beforeContentItemIdentifier:](self, "_onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:beforeContentItemIdentifier:", v12, v13);
          }

          goto LABEL_32;
        }
        goto LABEL_33;
      }
      if (self->_playingItemIdentifier)
      {
        -[MSVLRUDictionary objectForKeyedSubscript:](self->_contentItems, "objectForKeyedSubscript:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE65940]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValue");
        v35 = v34;

        objc_msgSend(v32, "duration");
        if (v35 < v36)
          v36 = v35;
        -[MPCMediaRemoteController _onQueue_setOptimisticElapsedTimeForContentItem:elapsedTime:rate:](self, "_onQueue_setOptimisticElapsedTimeForContentItem:elapsedTime:rate:", v32, fmax(v36, 0.0), 0.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_33;
      }
LABEL_32:
      v11 = 0;
      goto LABEL_33;
    }
LABEL_20:
    -[MPCMediaRemoteController _onQueue_setOptimisticPlaybackState:withOptions:](self, "_onQueue_setOptimisticPlaybackState:withOptions:", 2, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_playingItemIdentifier;
    if (v19)
    {
      -[MSVLRUDictionary objectForKeyedSubscript:](self->_contentItems, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "elapsedTime");
      v22 = v21;
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      v24 = v23;
      objc_msgSend(v20, "elapsedTimeTimestamp");
      v26 = v24 - v25;
      objc_msgSend(v20, "playbackRate");
      v28 = v22 + v26 * v27;
      objc_msgSend(v20, "duration");
      if (v28 < v29)
        v29 = v28;
      LODWORD(v30) = 0;
      -[MPCMediaRemoteController _onQueue_setOptimisticElapsedTimeForContentItem:elapsedTime:rate:](self, "_onQueue_setOptimisticElapsedTimeForContentItem:elapsedTime:rate:", v20, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = 0;
    }
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __77__MPCMediaRemoteController__onQueue_updateOptimisticStateForCommand_options___block_invoke;
    v41[3] = &unk_24CAB7570;
    v42 = v18;
    v43 = v31;
    v37 = v31;
    v38 = v18;
    v11 = _Block_copy(v41);

    goto LABEL_33;
  }
  if (!a3)
  {
    -[MPCMediaRemoteController _onQueue_setOptimisticPlaybackState:withOptions:](self, "_onQueue_setOptimisticPlaybackState:withOptions:", 1, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  if (a3 == 1)
    goto LABEL_20;
LABEL_33:
  v39 = _Block_copy(v11);

  return v39;
}

- (id)_onQueue_setOptimisticElapsedTimeForContentItem:(id)a3 elapsedTime:(double)a4 rate:(float)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSMutableDictionary *optimisticStateContentItems;
  void *v15;
  NSMapTable *contentItemFutures;
  void *v17;
  void *v18;
  NSMapTable *v19;
  void *v20;
  void *v21;
  NSMapTable *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  double v30;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDDCAA8]);
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithIdentifier:", v9);

    v11 = (void *)MEMORY[0x24BDDC718];
    v12 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __93__MPCMediaRemoteController__onQueue_setOptimisticElapsedTimeForContentItem_elapsedTime_rate___block_invoke;
    v28[3] = &unk_24CAB90B0;
    v29 = v10;
    v30 = a4;
    v13 = v10;
    objc_msgSend(v11, "performSuppressingChangeNotifications:", v28);
    optimisticStateContentItems = self->_optimisticStateContentItems;
    objc_msgSend(v7, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](optimisticStateContentItems, "setObject:forKeyedSubscript:", v13, v15);

    contentItemFutures = self->_contentItemFutures;
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](contentItemFutures, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "invalidate");

    v19 = self->_contentItemFutures;
    objc_msgSend(v7, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v19, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "disconnect");

    v22 = self->_contentItemFutures;
    objc_msgSend(v7, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](v22, "removeObjectForKey:", v23);

    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __93__MPCMediaRemoteController__onQueue_setOptimisticElapsedTimeForContentItem_elapsedTime_rate___block_invoke_2;
    v26[3] = &unk_24CABA1D0;
    v26[4] = self;
    v27 = v7;
    v24 = _Block_copy(v26);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_onQueue_setOptimisticPlaybackState:(unsigned int)a3 withOptions:(id)a4
{
  void *v6;
  MPCFuture *v7;
  MPCFuture *playbackStateFuture;
  uint64_t v9;
  MPCFuture *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  unsigned int v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[MPCFuture result](self->_playbackStateFuture, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCFuture invalidate](self->_playbackStateFuture, "invalidate");
  -[MPCFuture disconnect](self->_playbackStateFuture, "disconnect");
  v7 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", self->_calloutQueue);
  playbackStateFuture = self->_playbackStateFuture;
  self->_playbackStateFuture = v7;

  -[MPCFuture setDebugLabel:](self->_playbackStateFuture, "setDebugLabel:", CFSTR("playbackState [optimistic state]"));
  v9 = MEMORY[0x24BDAC760];
  v10 = self->_playbackStateFuture;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__MPCMediaRemoteController__onQueue_setOptimisticPlaybackState_withOptions___block_invoke;
  aBlock[3] = &__block_descriptor_36_e5_I8__0l;
  v18 = a3;
  v11 = _Block_copy(aBlock);
  -[MPCFuture finishWithValue:](v10, "finishWithValue:", v11);

  self->_playbackStateCacheState = 2;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __76__MPCMediaRemoteController__onQueue_setOptimisticPlaybackState_withOptions___block_invoke_2;
  v15[3] = &unk_24CAB9830;
  v15[4] = self;
  v16 = v6;
  v12 = v6;
  v13 = _Block_copy(v15);

  return v13;
}

- (void)_onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:(id)a3 afterContentItemIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *queueProperties;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v8 = -[NSMutableArray indexOfObject:](self->_contentItemIDs, "indexOfObject:", v6);
  v9 = -[NSMutableArray indexOfObject:](self->_contentItemIDs, "indexOfObject:", v7);
  v11 = v8 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL || v8 == v9;
  v12 = v9 + 1;
  if (!v11 && v8 != v12)
  {
    v14 = v9;
    -[NSDictionary objectForKeyedSubscript:](self->_queueProperties, "objectForKeyedSubscript:", CFSTR("tailInsertionContentItemID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = -[NSMutableArray indexOfObject:](self->_contentItemIDs, "indexOfObject:", v15);
    else
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    -[NSMutableArray removeObjectAtIndex:](self->_contentItemIDs, "removeObjectAtIndex:", v8);
    if (v8 <= v14)
      v17 = v14;
    else
      v17 = v12;
    -[NSMutableArray insertObject:atIndex:](self->_contentItemIDs, "insertObject:atIndex:", v6, v17);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray objectAtIndex:](self->_contentItemIDs, "objectAtIndex:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)-[NSDictionary mutableCopy](self->_queueProperties, "mutableCopy");
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("tailInsertionContentItemID"));
        objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("optimistic"));
        v20 = (NSDictionary *)objc_msgSend(v19, "copy");
        queueProperties = self->_queueProperties;
        self->_queueProperties = v20;

      }
    }
    NSAllMapTableValues(self->_playbackQueueFutures);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "invalidate");
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v24);
    }

  }
}

- (void)_onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:(id)a3 beforeContentItemIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *queueProperties;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v8 = -[NSMutableArray indexOfObject:](self->_contentItemIDs, "indexOfObject:", v6);
  v9 = -[NSMutableArray indexOfObject:](self->_contentItemIDs, "indexOfObject:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v8 != v9)
  {
    v12 = v9;
    v13 = v9 - 1;
    if (v8 != v9 - 1)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_queueProperties, "objectForKeyedSubscript:", CFSTR("tailInsertionContentItemID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v15 = -[NSMutableArray indexOfObject:](self->_contentItemIDs, "indexOfObject:", v14);
      else
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      -[NSMutableArray removeObjectAtIndex:](self->_contentItemIDs, "removeObjectAtIndex:", v8);
      if (v8 >= v12)
        v16 = v12;
      else
        v16 = v13;
      -[NSMutableArray insertObject:atIndex:](self->_contentItemIDs, "insertObject:atIndex:", v6, v16);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableArray objectAtIndex:](self->_contentItemIDs, "objectAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)-[NSDictionary mutableCopy](self->_queueProperties, "mutableCopy");
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("tailInsertionContentItemID"));
          objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("optimistic"));
          v19 = (NSDictionary *)objc_msgSend(v18, "copy");
          queueProperties = self->_queueProperties;
          self->_queueProperties = v19;

        }
      }
      NSAllMapTableValues(self->_playbackQueueFutures);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v27 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "invalidate");
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v23);
      }

    }
  }

}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calloutQueue, a3);
}

- (id)invalidationToken
{
  return self->_invalidationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationToken, 0);
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_queueProperties, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_playingItemIdentifier, 0);
  objc_storeStrong((id *)&self->_mrRemoteArtworkDataSource, 0);
  objc_storeStrong((id *)&self->_mrArtworkDataSource, 0);
  objc_storeStrong((id *)&self->_contentItemIDsForProperties, 0);
  objc_storeStrong((id *)&self->_requestedRangeForProperties, 0);
  objc_storeStrong((id *)&self->_contentItemRemoteArtworkFutures, 0);
  objc_storeStrong((id *)&self->_contentItemArtworkFutures, 0);
  objc_storeStrong((id *)&self->_contentItemFutures, 0);
  objc_storeStrong((id *)&self->_playbackQueueFutures, 0);
  objc_storeStrong((id *)&self->_contentItemArtworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentItemArtwork, 0);
  objc_storeStrong((id *)&self->_contentItemChanges, 0);
  objc_storeStrong((id *)&self->_optimisticStateContentItems, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_contentItemIDs, 0);
  objc_storeStrong((id *)&self->_playbackQueueParticipantsFuture, 0);
  objc_storeStrong((id *)&self->_supportedCommandsFuture, 0);
  objc_storeStrong((id *)&self->_playbackStateFuture, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __76__MPCMediaRemoteController__onQueue_setOptimisticPlaybackState_withOptions___block_invoke(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

void __76__MPCMediaRemoteController__onQueue_setOptimisticPlaybackState_withOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  MPCFuture *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32) == 2)
  {
    objc_msgSend(*(id *)(v2 + 24), "invalidate");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "disconnect");
      v3 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = v3;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDebugLabel:", CFSTR("playbackState [restored state / optimistic failure]"));
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      v7 = _Block_copy(*(const void **)(a1 + 40));
      objc_msgSend(v6, "finishWithValue:", v7);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    }
  }
}

uint64_t __93__MPCMediaRemoteController__onQueue_setOptimisticElapsedTimeForContentItem_elapsedTime_rate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setElapsedTime:", *(double *)(a1 + 40));
}

void __93__MPCMediaRemoteController__onQueue_setOptimisticElapsedTimeForContentItem_elapsedTime_rate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "disconnect");

    v13 = *(void **)(a1 + 40);
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    objc_msgSend(v13, "identifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v15);

  }
}

uint64_t __77__MPCMediaRemoteController__onQueue_updateOptimisticStateForCommand_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __63__MPCMediaRemoteController_playbackQueueParticipantsCacheState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

uint64_t __55__MPCMediaRemoteController_supportedCommandsCacheState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

uint64_t __51__MPCMediaRemoteController_playbackStateCacheState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

void __77__MPCMediaRemoteController__onQueue_purgeContentItemIdentifierForProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "removeObject:", v5);
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

id __97__MPCMediaRemoteController__onQueue_mergeContentItems_queueRange_requestRange_requestProperties___block_invoke(uint64_t a1)
{
  void *v2;

  MRContentItemGetIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
  return v2;
}

id __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke_2(uint64_t a1)
{
  void **v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  MPNowPlayingContentItemLegacyRemoteArtworkToken *v19;
  void *v20;
  MPNowPlayingContentItemLegacyRemoteArtworkToken *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  MPCMRContentItemArtworkDataToken *v32;
  void *v33;
  MPCMRContentItemRemoteArtworkToken *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(_QWORD *);
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "artworkIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = *v2;
  if (v4)
    objc_msgSend(v5, "artworkIdentifier");
  else
    objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "resolvedPlayerPath");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "supportedRemoteArtworkFormats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteArtworks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "count") == 0;

  }
  if (!_os_feature_enabled_impl() || ((objc_msgSend(v8, "isLocal") | v10) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_createExportableArtworkPropertiesForContentItem:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isValid"))
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceSpecificUserInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x24BDDC510];
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDDC510]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v15, "BOOLValue");

        if ((v17 & 1) != 0)
          goto LABEL_12;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "userInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "BOOLValue");

        if (v30)
        {
LABEL_12:
          +[MPCMRLegacyRemoteArtworkDataSource sharedDataSource](MPCMRLegacyRemoteArtworkDataSource, "sharedDataSource");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = [MPNowPlayingContentItemLegacyRemoteArtworkToken alloc];
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[MPNowPlayingContentItemLegacyRemoteArtworkToken initWithIdentifier:artworkProperties:artworkIdentifier:](v19, "initWithIdentifier:artworkProperties:artworkIdentifier:", v20, v12, v6);

          if (v21)
          {
LABEL_21:

            goto LABEL_24;
          }
LABEL_18:
          objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "_mediaRemoteContentItem");
          if (MRContentItemGetHasArtworkData())
          {
            objc_msgSend(*(id *)(a1 + 40), "mediaRemoteArtworkDataSource");
            v31 = objc_claimAutoreleasedReturnValue();

            v32 = [MPCMRContentItemArtworkDataToken alloc];
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[MPCMRContentItemArtworkDataToken initWithIdentifier:artworkIdentifier:](v32, "initWithIdentifier:artworkIdentifier:", v33, v6);

            v18 = (void *)v31;
          }
          else
          {
            v21 = 0;
          }
          goto LABEL_21;
        }
      }
    }
    v18 = 0;
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 40), "remoteArtworkDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__20569;
  v50 = __Block_byref_object_dispose__20570;
  v51 = 0;
  v22 = *(_QWORD *)(a1 + 40);
  v23 = *(NSObject **)(v22 + 8);
  v39 = MEMORY[0x24BDAC760];
  v40 = 3221225472;
  v41 = __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke_3;
  v42 = &unk_24CAB85F0;
  v45 = &v46;
  v43 = v22;
  v24 = v6;
  v44 = v24;
  dispatch_sync(v23, &v39);
  objc_msgSend((id)v47[5], "result", v39, v40, v41, v42, v43);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
  {
    v52 = *MEMORY[0x24BDDC480];
    v53[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = (void *)MEMORY[0x24BDBD1B8];
  }
  v34 = [MPCMRContentItemRemoteArtworkToken alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "supportedRemoteArtworkFormats");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPCMRContentItemRemoteArtworkToken initWithIdentifier:artworkIdentifier:supportedRemoteArtworkFormats:remoteArtworks:](v34, "initWithIdentifier:artworkIdentifier:supportedRemoteArtworkFormats:remoteArtworks:", v35, v24, v36, v27);

  _Block_object_dispose(&v46, 8);
LABEL_24:
  if (v18)
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC6D8]), "initWithToken:dataSource:", v21, v18);
  else
    v37 = 0;

  return v37;
}

void __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 176), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62__MPCMediaRemoteController_artworkCatalogBlockForContentItem___block_invoke_2()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_processSupportsDebugUI;
  if (ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_processSupportsDebugUI)
    v1 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.MediaRemoteUI")) ^ 1;
  ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_processSupportsDebugUI = v1;

}

void __47__MPCMediaRemoteController_invalidateAllTokens__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "disconnect");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "disconnect");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  NSAllMapTableValues(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 160));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v11, "invalidate");
        objc_msgSend(v11, "disconnect");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeAllObjects");
  NSAllMapTableValues(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 152));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v18, "invalidate");
        objc_msgSend(v18, "disconnect");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v15);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeAllObjects");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v19);
        NSAllMapTableValues(*(NSMapTable **)(*((_QWORD *)&v35 + 1) + 8 * k));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v32;
          do
          {
            for (m = 0; m != v26; ++m)
            {
              if (*(_QWORD *)v32 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * m);
              objc_msgSend(v29, "invalidate");
              objc_msgSend(v29, "disconnect");
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
          }
          while (v26);
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v21);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v30 + 32) + 168), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(v30 + 32) + 136), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(v30 + 32) + 144), "removeAllObjects");

}

void __63__MPCMediaRemoteController_dictionary_willRemoveObject_forKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_purgeContentItemIdentifierForProperties:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_purgeArtworkForContentItemIdentifier:artworkIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

void __76__MPCMediaRemoteController__playbackQueueParticipantsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "disconnect");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
}

void __67__MPCMediaRemoteController__contentItemArtworkChangedNotification___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        MRContentItemGetIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "objectForKey:", v7, v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "disconnect");

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "removeObjectForKey:", v7);
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_invalidateArtworkFuturesForContentItemID:", v7);
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_purgeArtworkForContentItemIdentifier:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __64__MPCMediaRemoteController__playbackStateDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  MPCFuture *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[4];
  int v13;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "disconnect");
  if (v2)
  {
    v3 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setDebugLabel:", CFSTR("playbackState [from notification]"));
    v6 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue");
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__MPCMediaRemoteController__playbackStateDidChangeNotification___block_invoke_2;
    aBlock[3] = &__block_descriptor_36_e5_I8__0l;
    v13 = v6;
    v8 = _Block_copy(aBlock);
    objc_msgSend(v7, "finishWithValue:", v8);

    v9 = 1;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 24);
    *(_QWORD *)(v10 + 24) = 0;

    v9 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = v9;
}

uint64_t __64__MPCMediaRemoteController__playbackStateDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

void __114__MPCMediaRemoteController_contentItemRemoteArtworkForContentItemIdentifier_artworkIdentifier_size_artworkFormat___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  MPCFuture *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v5)
  {
    if (!objc_msgSend(v5, "isInvalid"))
      return;
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  objc_msgSend(v5, "disconnect");
  v6 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contentItemRemoteArtwork - %@"), *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDebugLabel:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));
  v19[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v10 = (id)MRPlaybackQueueRequestCreateWithIdentifiers();
  v18 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequestedRemoteArtworkFormats:", v11);

  objc_msgSend(*(id *)(a1 + 32), "resolvedPlayerPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mediaRemotePlayerPath");
  dispatch_get_global_queue(21, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __114__MPCMediaRemoteController_contentItemRemoteArtworkForContentItemIdentifier_artworkIdentifier_size_artworkFormat___block_invoke_2;
  v15[3] = &unk_24CAB74B0;
  v17 = *(_QWORD *)(a1 + 64);
  v16 = *(id *)(a1 + 48);
  MEMORY[0x212BD1C74](v10, v13, v14, v15);

  if (v10)
    CFRelease(v10);

}

void __114__MPCMediaRemoteController_contentItemRemoteArtworkForContentItemIdentifier_artworkIdentifier_size_artworkFormat___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;

  if (!a3)
  {
    v6 = (void *)MRPlaybackQueueCopyContentItems();
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
        {
          objc_msgSend(v8, "remoteArtworks");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDDC480]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCAB0]), "initWithMediaRemoteRemoteArtwork:", v11);
            v14 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 3000, CFSTR("Got no RemoteArtwork for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync remote artwork request."));
            v14 = (id)objc_claimAutoreleasedReturnValue();
            v12 = 0;
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 3000, CFSTR("Got a different contentItemID from remote artwork loading than when we requested %@ -> %@"), v9, *(_QWORD *)(a1 + 32));
          v14 = (id)objc_claimAutoreleasedReturnValue();
          v12 = 0;
        }

        if (v12)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithValue:", v12);

          goto LABEL_13;
        }
        goto LABEL_11;
      }
      v13 = CFSTR("Got zero items for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync remote artwork request.");
    }
    else
    {
      v13 = CFSTR("Got nil items for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync remote artwork request.");
    }
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 3000, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = (uint64_t)v14;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 3000, a3, CFSTR("Got error from MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync remote artwork request."));
  v4 = objc_claimAutoreleasedReturnValue();
  v14 = (id)v4;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
LABEL_12:
  objc_msgSend(v5, "finishWithError:", v4);
LABEL_13:

}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  MPCFuture *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  NSStringFromCGSize(*(CGSize *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v7)
  {
    if (!objc_msgSend(v7, "isInvalid"))
      goto LABEL_16;
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  objc_msgSend(v7, "disconnect");
  v8 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contentItemArtwork[%@] - %@"), v2, *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDebugLabel:", v11);

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "finishWithValue:", v14);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 40));

    }
    v28[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v17 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();
    MRPlaybackQueueRequestSetIncludeArtwork();
    objc_msgSend(*(id *)(a1 + 32), "resolvedPlayerPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mediaRemotePlayerPath");
    dispatch_get_global_queue(21, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_2;
    v22[3] = &unk_24CAB7460;
    v21 = *(_QWORD *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 56);
    v22[4] = v21;
    v23 = v3;
    v24 = v2;
    v25 = *(id *)(a1 + 48);
    v26 = *(id *)(a1 + 40);
    MEMORY[0x212BD1C74](v17, v19, v20, v22);

    if (v17)
      CFRelease(v17);

  }
LABEL_16:

}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t ArtworkData;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  id (*v38)(uint64_t);
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  uint64_t v48;

  if (!a3)
  {
    v10 = (void *)MRPlaybackQueueCopyContentItems();
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);

        MRContentItemGetIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 56)) & 1) != 0)
        {
          ArtworkData = MRContentItemGetArtworkData();
          if (ArtworkData)
          {
            v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithData:", ArtworkData);
            if (v14)
            {
              v15 = (void *)v14;

              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "finishWithValue:", v15);
              AnalyticsSendEventLazy();
              v16 = *(_QWORD *)(a1 + 32);
              v17 = *(NSObject **)(v16 + 8);
              v41[0] = MEMORY[0x24BDAC760];
              v41[1] = 3221225472;
              v41[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_5;
              v41[3] = &unk_24CAB7438;
              v41[4] = v16;
              v42 = *(id *)(a1 + 64);
              v43 = *(id *)(a1 + 48);
              v44 = v15;
              v4 = v15;
              dispatch_async(v17, v41);

              v9 = v42;
              goto LABEL_18;
            }
            v20 = (void *)MEMORY[0x24BDD1540];
            v21 = CFSTR("Got invalid image data for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.");
          }
          else
          {
            v20 = (void *)MEMORY[0x24BDD1540];
            v21 = CFSTR("Got no image data for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.");
          }
          objc_msgSend(v20, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 3000, v21, v28, v29);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 3000, CFSTR("Got a different artwork identifier from remote artwork loading than when we requested %@ -> %@"), v12, *(_QWORD *)(a1 + 56));
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "finishWithError:", v19);
        v22 = MEMORY[0x24BDAC760];
        v36 = MEMORY[0x24BDAC760];
        v37 = 3221225472;
        v38 = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_6;
        v39 = &unk_24CAB9B38;
        v40 = v19;
        v4 = v19;
        AnalyticsSendEventLazy();
        v23 = *(void **)(a1 + 40);
        v24 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
        v31[0] = v22;
        v31[1] = 3221225472;
        v31[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_7;
        v31[3] = &unk_24CAB8648;
        v32 = v23;
        v25 = *(id *)(a1 + 48);
        v26 = *(_QWORD *)(a1 + 32);
        v33 = v25;
        v34 = v26;
        v30 = *(_OWORD *)(a1 + 64);
        v27 = (id)v30;
        v35 = v30;
        dispatch_async(v24, v31);

        v9 = v40;
        goto LABEL_18;
      }
      v18 = CFSTR("Got zero items for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.");
    }
    else
    {
      v18 = CFSTR("Got nil items for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.");
    }
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 3000, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 3000, a3, CFSTR("Got error from MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request."));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "finishWithError:", v4);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_3;
  block[3] = &unk_24CAB85F0;
  v46 = v5;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 72);
  v47 = v7;
  v48 = v8;
  dispatch_async(v6, block);

  v9 = v46;
LABEL_18:

}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    v2 = v3;
  }

}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[7];
  objc_msgSend(*(id *)(a1[4] + 136), "objectForKeyedSubscript:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, a1[6]);

}

id __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("MPArtworkImage"), CFSTR("mediaType"));
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "timeIntervalSinceNow");
  objc_msgSend(v4, "numberWithDouble:", fabs(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("duration"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("success"));
  objc_msgSend(*(id *)(a1 + 32), "msv_analyticSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("errorSignature"));

  return v2;
}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_7(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 136), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

id __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_4()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("MPArtworkImage"), CFSTR("mediaType"));
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v1, "timeIntervalSinceNow");
  objc_msgSend(v2, "numberWithDouble:", fabs(v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v4, CFSTR("duration"));

  objc_msgSend(v0, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("success"));
  return v0;
}

void __82__MPCMediaRemoteController_contentItemArtworkCacheStateForArtworkIdentifier_size___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  NSStringFromCGSize(*(CGSize *)(a1 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD block[5];
  _QWORD v22[2];

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 2000, a3, CFSTR("Got error from MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync one-off content item request."));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "finishWithError:", v4);
    v5 = a1[4];
    v6 = (void *)a1[5];
    v7 = *(NSObject **)(v5 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[2] = __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_3;
    block[3] = &unk_24CAB85F0;
    block[1] = 3221225472;
    block[4] = v5;
    v8 = (id *)v22;
    v9 = v6;
    v10 = a1[6];
    v22[0] = v9;
    v22[1] = v10;
    dispatch_async(v7, block);
  }
  else
  {
    v11 = (void *)MRPlaybackQueueCopyContentItems();
    v12 = a1[4];
    v13 = (void *)a1[5];
    v14 = *(NSObject **)(v12 + 8);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_4;
    v17[3] = &unk_24CABAA78;
    v8 = &v18;
    v17[4] = v12;
    v18 = v11;
    v15 = v13;
    v16 = a1[6];
    v19 = v15;
    v20 = v16;
    v4 = v11;
    dispatch_async(v14, v17);

  }
}

void __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 160), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1[4] + 112), "removeObjectForKey:", a1[5]);
    v2 = v3;
  }

}

void __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_mergeContentItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "finishWithValue:", v2);

}

void __63__MPCMediaRemoteController_contentItemCacheStateForIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 120), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 160), "objectForKey:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isFinalized"))
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

    v2 = 0;
  }

}

void __52__MPCMediaRemoteController_playbackQueueForRequest___block_invoke(uint64_t a1)
{
  uint64_t Range;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MPCFuture *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[4];
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  _QWORD v41[2];

  Range = MRPlaybackQueueRequestGetRange();
  v4 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v9)
  {
    if (!objc_msgSend(v9, "isInvalid"))
      goto LABEL_13;
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(v9, "disconnect");
  v10 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromMSVSignedRange();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("playbackQueueForRequest[%@]"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDebugLabel:", v15);

  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  v41[0] = Range;
  v41[1] = v4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v41, "{_MSVSignedRange=qq}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, *(_QWORD *)(a1 + 40));

  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v40[0] = Range;
  v40[1] = v4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v40, "{_MSVSignedRange=qq}");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, v20);

  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(_QWORD *)(v21 + 88);
  if (Range >= v22
    && (v23 = *(_QWORD *)(v21 + 96), Range - v22 < v23)
    && (v4 <= 1 ? (v24 = 1) : (v24 = v4), v5 && ~v22 + Range + v24 < v23))
  {
    v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend((id)v21, "_onQueue_playbackQueueForRange:", Range, v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "finishWithValue:", v26);

  }
  else
  {
    objc_msgSend(*(id *)(v21 + 112), "beginTransaction");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MRPlaybackQueueRequestSetIdentifiers();

    MRPlaybackQueueRequestSetIncludeMetadata();
    MRPlaybackQueueRequestSetIncludeLanguageOptions();
    v29 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "resolvedPlayerPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "mediaRemotePlayerPath");
    v35[0] = MEMORY[0x24BDAC760];
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(_OWORD *)(a1 + 32);
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v35[1] = 3221225472;
    v35[2] = __52__MPCMediaRemoteController_playbackQueueForRequest___block_invoke_2;
    v35[3] = &unk_24CAB7358;
    v38 = Range;
    v39 = v4;
    v37 = v32;
    v36 = v33;
    MEMORY[0x212BD1C74](v29, v31, v34, v35);

  }
LABEL_13:

}

uint64_t __52__MPCMediaRemoteController_playbackQueueForRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t Range;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v5 = a3;
  Range = MRPlaybackQueueGetRange();
  if (!v5)
  {
    v13 = Range;
    v14 = v7;
    if (v7 < 1
      || ((v15 = *(_QWORD *)(a1 + 56), v15 <= 0) ? (v16 = *(_QWORD *)(a1 + 64) <= -v15) : (v16 = 1),
          v16
       || Range <= 0 && v7 > -Range
       || (objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 2000, CFSTR("PlaybackQueue Response failed to include now playing item")), (v5 = (id)objc_claimAutoreleasedReturnValue()) == 0)))
    {
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
      v29 = *(_OWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v29, "{_MSVSignedRange=qq}");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v18);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MRPlaybackQueueCopyContentItems();
      if (*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) == v5)
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_mergeContentItems:queueRange:requestRange:requestProperties:", v10, v13, v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
      MRPlaybackQueueGetQueueID();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 232);
      *(_QWORD *)(v20 + 232) = v19;

      objc_msgSend(a2, "properties");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(v23 + 240);
      *(_QWORD *)(v23 + 240) = v22;

      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_playbackQueueForRange:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "finishWithValue:", v12);
      goto LABEL_15;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finishWithError:", v5);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v28 = *(_OWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v28, "{_MSVSignedRange=qq}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v27 = *(_OWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v27, "{_MSVSignedRange=qq}");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", 0, v12);
LABEL_15:

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "endTransaction");
}

void __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateOptimisticStateForCommand:options:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "disarm");
    if ((_DWORD)result)
    {
      v2 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 248);
        v4 = (void *)MRMediaRemoteCopyCommandDescription();
        v5 = 138543618;
        v6 = v3;
        v7 = 2114;
        v8 = v4;
        _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "MRC %{public}@: Undo optimistic state [timeout] command=%{public}@", (uint8_t *)&v5, 0x16u);

      }
      return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40) + 16))();
    }
  }
  return result;
}

void __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm")
    && objc_msgSend(v3, "statusCode")
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248);
      v6 = (void *)MRMediaRemoteCopyCommandDescription();
      v7 = 138543874;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "MRC %{public}@: Undo optimistic state [failed] command=%{public}@ status=%{public}@", (uint8_t *)&v7, 0x20u);

    }
    dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 8), *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithValue:", MEMORY[0x24BDBD1A8]);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == *(_QWORD *)(v3 + 56))
    *(_QWORD *)(v3 + 64) = 1;
  return result;
}

void __56__MPCMediaRemoteController_mediaRemoteArtworkDataSource__block_invoke(uint64_t a1)
{
  void *v2;
  MPCMRArtworkDataSource *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (!v2)
  {
    v3 = -[MPCMRArtworkDataSource initWithController:]([MPCMRArtworkDataSource alloc], "initWithController:", *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 208);
    *(_QWORD *)(v4 + 208) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __51__MPCMediaRemoteController_remoteArtworkDataSource__block_invoke(uint64_t a1)
{
  void *v2;
  MPCMRRemoteArtworkDataSource *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
  if (!v2)
  {
    v3 = -[MPCMRRemoteArtworkDataSource initWithController:]([MPCMRRemoteArtworkDataSource alloc], "initWithController:", *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 216);
    *(_QWORD *)(v4 + 216) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

uint64_t __33__MPCMediaRemoteController__init__block_invoke_2(uint64_t a1, char a2, void *a3)
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

+ (OS_dispatch_queue)mediaRemoteReplyQueue
{
  if (mediaRemoteReplyQueue_onceToken != -1)
    dispatch_once(&mediaRemoteReplyQueue_onceToken, &__block_literal_global_20724);
  return (OS_dispatch_queue *)(id)mediaRemoteReplyQueue___mediaRemoteReplyQueue;
}

+ (void)sendCommand:(unsigned int)a3 options:(id)a4 toPlayerPath:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (id)v13;
  if (v13)
    objc_msgSend(a1, "_sendCommand:playbackIntent:options:toPlayerPath:completion:", v8, v13, v12, v11, v10);
  else
    objc_msgSend(a1, "_sendCommand:options:appOptions:toPlayerPath:completion:", v8, v12, (_DWORD)v8 == 132, v11, v10);

}

+ (void)_sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 toPlayerPath:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  _QWORD v30[6];
  _QWORD v31[2];
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v34;
  unsigned int v35;

  v11 = a4;
  v12 = a7;
  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke;
  aBlock[3] = &unk_24CAB7158;
  v14 = v12;
  v34 = v14;
  v35 = a3;
  v15 = a6;
  v16 = _Block_copy(aBlock);
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  v18 = os_signpost_id_generate(v17);

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MPCPlayerCommandRequestMediaRemoteOptionDevices"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v26 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v26, "removeObjectForKey:", CFSTR("MPCPlayerCommandRequestMediaRemoteOptionDevices"));
    v25 = v26;

    _MPCLogCategoryMediaRemote();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SendCommand:groupDevicesAndSendCommand", ", buf, 2u);
    }

    objc_msgSend(v15, "mediaRemotePlayerPath");
    objc_msgSend(a1, "mediaRemoteReplyQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v13;
    v30[3] = 3221225472;
    v30[4] = __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke_46;
    v30[5] = &unk_24CAB7180;
    v23 = (id *)v31;
    v31[0] = v16;
    v31[1] = v18;
    v29 = v16;
    MRAVEndpointGroupDevicesAndSendCommandWithResult();

  }
  else
  {
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    v21 = v20;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SendCommand:sendCommandToPlayer", ", buf, 2u);
    }

    objc_msgSend(v15, "mediaRemotePlayerPath");
    objc_msgSend(a1, "mediaRemoteReplyQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id *)v30;
    v30[0] = v16;
    v30[1] = v18;
    v24 = v16;
    MRMediaRemoteSendCommandToPlayerWithResult();
    v25 = v11;
  }

}

+ (void)_sendCommand:(unsigned int)a3 playbackIntent:(id)a4 options:(id)a5 toPlayerPath:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unsigned int v28;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCMediaRemoteController.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playbackIntent"));

  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __88__MPCMediaRemoteController__sendCommand_playbackIntent_options_toPlayerPath_completion___block_invoke;
  v22[3] = &unk_24CAB71F8;
  v23 = v13;
  v24 = v14;
  v26 = v16;
  v27 = a1;
  v28 = a3;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v16;
  v20 = v13;
  objc_msgSend(v17, "getPlaybackIntentDestinationWithCompletion:", v22);

}

void __88__MPCMediaRemoteController__sendCommand_playbackIntent_options_toPlayerPath_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 1000, a3, CFSTR("Failed to create playback queue from playback intent %@"), *(_QWORD *)(a1 + 32));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", 200, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("MPCPlayerCommandRequestMediaRemoteOptionDelegationTokenB"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDelegateTokenB:", v7);

    v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __88__MPCMediaRemoteController__sendCommand_playbackIntent_options_toPlayerPath_completion___block_invoke_2;
    v11[3] = &unk_24CAB71D0;
    v12 = v8;
    v15 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 64);
    v16 = a2;
    v17 = v9;
    v18 = *(_DWORD *)(a1 + 72);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v12, "getRemotePlaybackQueueWithDestination:completion:", a2, v11);

  }
}

void __88__MPCMediaRemoteController__sendCommand_playbackIntent_options_toPlayerPath_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *ExternalRepresentation;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a2;
  if (v25)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("MPCPlayerCommandRequestMediaRemoteOptionDelegationTokenB"));
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("MPCPlayerCommandRequestMediaRemoteOptionReplaceIntent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v25;
    if (v6)
    {
      v8 = objc_msgSend(v6, "integerValue");
      if ((unint64_t)(v8 - 1) >= 3)
        v9 = 0;
      else
        v9 = v8;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("MPCPlayerCommandRequestMediaRemoteOptionReplaceIntent"));
      objc_msgSend(v25, "setReplaceIntent:", v9);
      v7 = v25;
    }
    v10 = objc_retainAutorelease(v7);
    objc_msgSend(v10, "_mediaRemotePlaybackQueue");
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    if (ExternalRepresentation)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", ExternalRepresentation, *MEMORY[0x24BE659D8]);
      objc_msgSend(v10, "mediaRemoteOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addEntriesFromDictionary:", v12);

      v13 = *(_QWORD *)(a1 + 64);
      if (v13 == 3)
      {
        v14 = objc_alloc(MEMORY[0x24BEC87B0]);
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "processName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("com.apple.MediaPlaybackCore.performRemoteQueueCommand-"), "stringByAppendingString:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v14, "initWithName:", v17);

        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 60.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setExpirationDate:", v19);

        objc_msgSend(MEMORY[0x24BEC87A8], "sharedService");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAssertion:", v18);

        v13 = *(_QWORD *)(a1 + 64);
      }
      objc_msgSend(*(id *)(a1 + 72), "_sendCommand:options:appOptions:toPlayerPath:completion:", *(unsigned int *)(a1 + 80), v5, v13 != 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 1000, CFSTR("Failed to create external representation from playback queue %@"), v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", 200, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 1000, a3, CFSTR("Failed to create playback queue from playback intent %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", 200, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v6);
  }

}

void __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (a2 != 11 && a2)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 1000, v13, CFSTR("Failed to send command %ld"), *(unsigned int *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusWithCode:error:", 200, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    MPRemoteCommandStatusFromMRSendCommandResultStatus();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }

}

void __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SendCommand:groupDevicesAndSendCommand", ", v16, 2u);
  }

  objc_msgSend(v5, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "sendError");
  if (v6)
  {
    v12 = v6;

    if ((_DWORD)v11)
      v11 = v11;
    else
      v11 = 2;
    v10 = v12;
  }
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "resultStatuses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v13 + 16))(v13, v11, v10, v15);

}

void __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SendCommand:sendCommandToPlayer", ", v14, 2u);
  }

  v7 = objc_msgSend(v3, "sendError");
  if (!(_DWORD)v7)
  {
    objc_msgSend(v3, "resultStatuses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      v7 = 0;
    else
      v7 = 5;
  }
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultStatuses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v10 + 16))(v10, v7, v11, v13);

}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_29(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  MPCFuture *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  _QWORD v23[4];
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)controllerForPlayerPath____playerPathControllers, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v5 || objc_msgSend(v5, "isInvalid"))
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v33 = v7;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEBUG, "MRC: Resolving player path %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "disconnect");
    v8 = [MPCFuture alloc];
    v9 = -[MPCFuture initWithQueue:](v8, "initWithQueue:", controllerForPlayerPath____playerPathControllersFutureQueue);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDebugLabel:", CFSTR("controllerForPlayerPath"));
    objc_msgSend((id)controllerForPlayerPath____playerPathControllers, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
    +[MPCPlayerPathCache sharedCache](MPCPlayerPathCache, "sharedCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resolvedPlayerPathForPlayerPath:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_34;
    v29[3] = &unk_24CABAB68;
    v15 = *(id *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v30 = v15;
    v31 = v16;
    objc_msgSend(v13, "onInvalid:", v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_3;
    v25[3] = &unk_24CAB7108;
    v26 = *(id *)(a1 + 32);
    v27 = v17;
    v28 = *(_QWORD *)(a1 + 40);
    v18 = v17;
    objc_msgSend(v13, "onSuccess:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_38;
    v23[3] = &unk_24CAB7130;
    v22 = *(_OWORD *)(a1 + 32);
    v20 = (id)v22;
    v24 = v22;
    v21 = (id)objc_msgSend(v19, "onFailure:", v23);

  }
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t v11;

  v2 = controllerForPlayerPath____playerPathControllersQueue;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_2;
  v9 = &unk_24CABAB68;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  dispatch_async(v2, &v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate", v6, v7, v8, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateAllTokens");

}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_38(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithError:", a2);
  v3 = controllerForPlayerPath____playerPathControllersQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_2_39;
  v6[3] = &unk_24CABAB68;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  dispatch_async(v3, v6);

}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_2_39(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)controllerForPlayerPath____playerPathControllers, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v3 = v2;
    objc_msgSend((id)controllerForPlayerPath____playerPathControllers, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    v2 = v3;
  }

}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)controllerForPlayerPath____playerPathControllers, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v3 = v2;
    objc_msgSend((id)controllerForPlayerPath____playerPathControllers, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    v2 = v3;
  }

}

void __49__MPCMediaRemoteController_mediaRemoteReplyQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.MediaPlaybackCore/MediaRemoteReplyQueue", v0);
  v2 = (void *)mediaRemoteReplyQueue___mediaRemoteReplyQueue;
  mediaRemoteReplyQueue___mediaRemoteReplyQueue = (uint64_t)v1;

}

@end
