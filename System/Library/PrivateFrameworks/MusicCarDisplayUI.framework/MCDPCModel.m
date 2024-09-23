@implementation MCDPCModel

- (MCDPCModel)initWithBundleID:(id)a3
{
  id v5;
  MCDPCModel *v6;
  MCDPCModel *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *mediaRemoteNotificationQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *mediaRemoteItemQueue;
  uint64_t v14;
  NSMutableDictionary *items;
  uint64_t v16;
  NSMutableDictionary *beginLoadingBlocks;
  MCDPlayableContentPlaybackManager *v18;
  MCDPlayableContentNowPlayingDataSource *v19;
  uint64_t v20;
  MCDPlayableContentPlaybackManager *playableContentPlaybackManager;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MCDPCModel;
  v6 = -[MCDPCModel init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.MusicCarDisplayUI.playableContent.mediaRemote", v8);
    mediaRemoteNotificationQueue = v7->_mediaRemoteNotificationQueue;
    v7->_mediaRemoteNotificationQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.MusicCarDisplayUI.playableContent.mediaRemote.items", v11);
    mediaRemoteItemQueue = v7->_mediaRemoteItemQueue;
    v7->_mediaRemoteItemQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    items = v7->_items;
    v7->_items = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    beginLoadingBlocks = v7->_beginLoadingBlocks;
    v7->_beginLoadingBlocks = (NSMutableDictionary *)v16;

    v18 = [MCDPlayableContentPlaybackManager alloc];
    v19 = objc_alloc_init(MCDPlayableContentNowPlayingDataSource);
    v20 = -[_MCDNowPlayingContentManager initWithDelegate:dataSource:bundleID:](v18, "initWithDelegate:dataSource:bundleID:", v7, v19, v5);
    playableContentPlaybackManager = v7->_playableContentPlaybackManager;
    v7->_playableContentPlaybackManager = (MCDPlayableContentPlaybackManager *)v20;

    -[MCDPCModel _registerForClientContent](v7, "_registerForClientContent");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  MRMediaRemoteUnregisterForNowPlayingNotifications();
  -[_MCDNowPlayingContentManager endRequestObservation](self->_playableContentPlaybackManager, "endRequestObservation");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MCDPCModel;
  -[MCDPCModel dealloc](&v4, sel_dealloc);
}

- (void)contentManager:(id)a3 itemDidChange:(id)a4 response:(id)a5
{
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *bundleID;
  _BOOL4 v10;
  const __CFString *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a5, "playerPath", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "representedBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCModel setCurrentPlayingApp:](self, "setCurrentPlayingApp:", objc_msgSend(v7, "isEqualToString:", self->_bundleID));

  MCDGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    bundleID = self->_bundleID;
    v10 = -[MCDPCModel isCurrentPlayingApp](self, "isCurrentPlayingApp");
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    v12 = 138543618;
    v13 = bundleID;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_22FBAA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ is now playing app? %{public}@", (uint8_t *)&v12, 0x16u);
  }

}

- (void)_registerForClientContent
{
  id v3;
  uint64_t v4;
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v5, &location);
  MRMediaRemoteGetSupportedBrowsableContentAPIs();

  -[MCDPCModel _registerNotifications](self, "_registerNotifications", v4, 3221225472, __39__MCDPCModel__registerForClientContent__block_invoke, &unk_24FD785E8);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__MCDPCModel__registerForClientContent__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSupportedAPIMask:", a2);
  objc_msgSend(WeakRetained, "_browsableContentDidRegisterNotification:", 0);

}

- (void)_registerNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__dataSourceInvalidated_, *MEMORY[0x24BE655B8], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__contentItemsUpdated_, *MEMORY[0x24BE65720], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__nowPlayingDidChangeNotification_, *MEMORY[0x24BE65760], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__nowPlayingDidChangeNotification_, *MEMORY[0x24BE65A00], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__nowPlayingDidChangeNotification_, *MEMORY[0x24BE657C0], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__nowPlayingDidChangeNotification_, *MEMORY[0x24BE65768], 0);
  MRMediaRemoteRegisterForNowPlayingNotifications();
  -[MCDPCModel playableContentPlaybackManager](self, "playableContentPlaybackManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginRequestObservation");

}

- (void)_dataSourceInvalidated:(id)a3
{
  NSObject *mediaRemoteNotificationQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  mediaRemoteNotificationQueue = self->_mediaRemoteNotificationQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__MCDPCModel__dataSourceInvalidated___block_invoke;
  v5[3] = &unk_24FD78188;
  objc_copyWeak(&v6, &location);
  dispatch_async(mediaRemoteNotificationQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __37__MCDPCModel__dataSourceInvalidated___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD block[4];
  _QWORD *v7;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    MCDGeneralLogging();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Data source invalidated", buf, 2u);
    }

    v3 = WeakRetained[13];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__MCDPCModel__dataSourceInvalidated___block_invoke_31;
    block[3] = &unk_24FD78200;
    v7 = WeakRetained;
    dispatch_sync(v3, block);
    MCDGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Posting MCDPCDidInvalidateNotificationName", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("didInvalidate"), 0);

  }
}

void __37__MCDPCModel__dataSourceInvalidated___block_invoke_31(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setItems:", v2);

}

- (void)_contentItemsUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Content items updated", buf, 2u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE655C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCModel bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE65A58]);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[MCDPCModel itemsFromMRContentItems:](self, "itemsFromMRContentItems:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v11, "count"))
      {
        v16 = CFSTR("items");
        v17 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      MCDGeneralLogging();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FBAA000, v14, OS_LOG_TYPE_DEFAULT, "Posting MCDPCDidUpdateContentNotificationName", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("didUpdateContent"), self, v12);

    }
    else
    {
      MCDGeneralLogging();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FBAA000, v11, OS_LOG_TYPE_DEFAULT, "Got content items updated notification, but no updated content items", buf, 2u);
      }
    }

  }
  else
  {
    MCDGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[MCDPCModel bundleID](self, "bundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_22FBAA000, v10, OS_LOG_TYPE_DEFAULT, "Content items updated for wrong app, expected %{public}@, got %{public}@", buf, 0x16u);

    }
  }

}

- (void)_nowPlayingDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Posting MCDPCNowPlayingDidChangeNotificationName", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("nowPlayingChange"), self);

}

- (void)_browsableContentDidRegisterNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Posting MCDPCAppReadyToFetchNotificationName", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("appReadyToFetch"), self);

}

- (NSString)appTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDC1538];
  -[MCDPCModel bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationProxyForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedNameForContext:", CFSTR("Car"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (id)containerForRoot
{
  MCDPCContainer *v3;
  void *v4;
  id v5;

  v3 = [MCDPCContainer alloc];
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndexes:length:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCDPCContainer _initWithModel:rootItem:indexPath:](v3, "_initWithModel:rootItem:indexPath:", self, 0, v4);

  return v5;
}

- (void)beginLoadingItemAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void **v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (-[MCDPCModel supportedAPIMask](self, "supportedAPIMask") & 1) == 0;
  MCDGeneralLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API is not implemented", buf, 2u);
    }

    v7[2](v7, 0);
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v35 = v6;
      _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "Beginning to load item at index path: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__finishBeginLoadingNotification_, *MEMORY[0x24BE655A8], 0);

    v12 = (void **)_MCDCreateMediaRemoteIndexPath(v6);
    -[MCDPCModel bundleID](self, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MRMediaRemoteBeginLoadingBrowsableContent();

    free(*v12);
    free(v12);
    if (v14)
    {
      if (v14 == 6)
      {
        MCDGeneralLogging();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v6;
          _os_log_impl(&dword_22FBAA000, v15, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API is not implemented, receiving unsupported operation for index path: %{public}@", buf, 0xCu);
        }

        if (v7)
          v7[2](v7, 0);
      }
      else
      {
        MCDGeneralLogging();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v35) = v14;
          _os_log_impl(&dword_22FBAA000, v23, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API error, code: %d", buf, 8u);
        }

        if (v7)
        {
          v24 = (void *)MEMORY[0x24BDD1540];
          v32 = *MEMORY[0x24BDD0FC8];
          MCDCarDisplayBundle();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ERROR_LOADING_ITEM"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v26;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("MCDError"), v14, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *))v7)[2](v7, v28);

        }
      }
    }
    else
    {
      MCDGeneralLogging();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v6;
        _os_log_impl(&dword_22FBAA000, v16, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API in progress for %{public}@", buf, 0xCu);
      }

      -[MCDPCModel beginLoadingBlocks](self, "beginLoadingBlocks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (v19)
      {
        v20 = (void *)objc_msgSend(v7, "copy");
        v21 = (void *)MEMORY[0x2348AB388]();
        -[MCDPCModel beginLoadingBlocks](self, "beginLoadingBlocks");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v6);

      }
      objc_initWeak((id *)buf, self);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __53__MCDPCModel_beginLoadingItemAtIndexPath_completion___block_invoke;
      v29[3] = &unk_24FD78640;
      v30 = v6;
      objc_copyWeak(&v31, (id *)buf);
      -[MCDPCModel _setupBeginLoadingTimeoutTimerWithCompletion:](self, "_setupBeginLoadingTimeoutTimerWithCompletion:", v29);
      objc_destroyWeak(&v31);

      objc_destroyWeak((id *)buf);
    }
  }

}

void __53__MCDPCModel_beginLoadingItemAtIndexPath_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API timed out, completion block wasn't called for index path: %{public}@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "length");
  v7 = malloc_type_malloc(0x10uLL, 0x1010040FDD9F14CuLL);
  v8 = v7;
  v7[1] = v6;
  if (v6)
  {
    v9 = 0;
    *v7 = malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
    do
    {
      *(_QWORD *)(*v8 + 8 * v9) = objc_msgSend(v5, "indexAtPosition:", v9);
      ++v9;
    }
    while (v6 != v9);
  }
  else
  {
    *v7 = 0;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", *v8, 8 * objc_msgSend(v5, "length"));

  v11 = objc_alloc(MEMORY[0x24BDD16C8]);
  v12 = *MEMORY[0x24BE655A8];
  v15 = *MEMORY[0x24BE65730];
  v16 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithName:object:userInfo:", v12, 0, v13);

  objc_msgSend(WeakRetained, "_finishBeginLoadingNotification:", v14);
}

- (void)_finishBeginLoadingNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE655D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE65730]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  v10 = objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");

  v12 = MCDNSIndexPathFromMRMediaRemoteIndexPath(v10, v11 >> 3);
  -[MCDPCModel beginLoadingBlocks](self, "beginLoadingBlocks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToNumber:", &unk_24FD818D0) & 1) != 0)
  {
    MCDGeneralLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138543362;
        v27 = v12;
        _os_log_impl(&dword_22FBAA000, v16, OS_LOG_TYPE_DEFAULT, "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification, beginLoadingPlayableContent API not implemented for index path: %{public}@", (uint8_t *)&v26, 0xCu);
      }

      v14[2](v14, 0);
      -[MCDPCModel beginLoadingBlocks](self, "beginLoadingBlocks");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", 0, v12);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[MCDPCModel _finishBeginLoadingNotification:].cold.1((uint64_t)v12, v16, v23);
    }
    goto LABEL_20;
  }
  -[MCDPCModel _errorForNotification:](self, "_errorForNotification:", v4);
  v16 = objc_claimAutoreleasedReturnValue();
  MCDGeneralLogging();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14)
  {
    v19 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v19)
      {
        v26 = 138543618;
        v27 = v12;
        v28 = 2114;
        v29 = v6;
        v20 = "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification for index path: %{public}@, beginLoad"
              "ingPlayableContent API error: %{public}@";
        v21 = v18;
        v22 = 22;
LABEL_17:
        _os_log_impl(&dword_22FBAA000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v26, v22);
      }
    }
    else if (v19)
    {
      v26 = 138543362;
      v27 = v12;
      v20 = "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification without error for index path: %{public}@";
      v21 = v18;
      v22 = 12;
      goto LABEL_17;
    }

    ((void (**)(_QWORD, NSObject *))v14)[2](v14, v16);
    -[MCDPCModel beginLoadingBlocks](self, "beginLoadingBlocks");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", 0, v12);
LABEL_19:

    goto LABEL_20;
  }
  v24 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v24)
      -[MCDPCModel _finishBeginLoadingNotification:].cold.3((uint64_t)v6, (uint64_t)v12, v18);
    goto LABEL_19;
  }
  if (v24)
    -[MCDPCModel _finishBeginLoadingNotification:].cold.2((uint64_t)v12, v18, v25);
  v16 = v18;
LABEL_20:

  -[MCDPCModel _invalidateBeginLoadingTimeoutTimer](self, "_invalidateBeginLoadingTimeoutTimer");
}

- (void)getChildrenSupportsPlaybackProgressForIndexPath:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  void **v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, int);
  void *v20;
  MCDPCModel *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[MCDPCModel supportedAPIMask](self, "supportedAPIMask");
  MCDGeneralLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 2) != 0)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v25 = v6;
      _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "Preparing to fetch if children support playback progress for index path: %{public}@", buf, 0xCu);
    }

    v11 = (void **)_MCDCreateMediaRemoteIndexPath(v6);
    -[MCDPCModel bundleID](self, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __77__MCDPCModel_getChildrenSupportsPlaybackProgressForIndexPath_withCompletion___block_invoke;
    v20 = &unk_24FD78668;
    v21 = self;
    v22 = v6;
    v23 = v7;
    MRMediaRemoteBrowsableContentSupportsPlaybackProgress();

    free(*v11);
    free(v11);
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __77__MCDPCModel_getChildrenSupportsPlaybackProgressForIndexPath_withCompletion___block_invoke_51;
    v14[3] = &unk_24FD78690;
    v15 = v22;
    v16 = v23;
    -[MCDPCModel _setupPlaybackProgressTimeoutTimerWithCompletion:](self, "_setupPlaybackProgressTimeoutTimerWithCompletion:", v14);

  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "childItemsDisplayPlaybackProgress API is not implemented", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

uint64_t __77__MCDPCModel_getChildrenSupportsPlaybackProgressForIndexPath_withCompletion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePlaybackProgressTimeoutTimer");
  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Fetched children supporting playback progress for index path: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2 != 0, 0);
}

uint64_t __77__MCDPCModel_getChildrenSupportsPlaybackProgressForIndexPath_withCompletion___block_invoke_51(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Children support playback progress timed out for: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getNowPlayingIdentifiersWithCompletion:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[MCDPCModel supportedAPIMask](self, "supportedAPIMask");
  MCDGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 4) != 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, "Preparing to fetch now playing identifiers", buf, 2u);
    }

    v8 = v4;
    MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers();

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, "now playing identifiers API is not implemented", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __53__MCDPCModel_getNowPlayingIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Fetched now playing identifiers", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCountOfChildrenAtIndexPath:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void **v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  MCDGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_22FBAA000, v8, OS_LOG_TYPE_DEFAULT, "Fetching count of children at index path: %@", buf, 0xCu);
  }

  v9 = (void **)_MCDCreateMediaRemoteIndexPath(v6);
  -[MCDPCModel bundleID](self, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = v7;
  v11 = v7;
  v12 = v6;
  MRMediaRemoteGetCountOfBrowsableContentChildItems();

  free(*v9);
  free(v9);

}

uint64_t __59__MCDPCModel_getCountOfChildrenAtIndexPath_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v5;
    v9 = 2050;
    v10 = a2;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Completed fetching count of children at index path: %{public}@, number of children: %{public}llu", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getChildrenAtIndexPath:(id)a3 inRange:(_NSRange)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void **v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  MCDGeneralLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "Fetching children at index path: %{public}@", buf, 0xCu);
  }

  v10 = (void **)_MCDCreateMediaRemoteIndexPath(v7);
  -[MCDPCModel bundleID](self, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = v8;
  v12 = v8;
  v13 = v7;
  MRMediaRemoteGetBrowsableContentChildItems();

  free(*v10);
  free(v10);

}

void __56__MCDPCModel_getChildrenAtIndexPath_inRange_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "itemsFromMRContentItems:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Completed fetching children at index path: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(_QWORD, void *, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56), objc_msgSend(v3, "count"), 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "didFinishInitialLoad") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidFinishInitialLoad:", 1);
    MCDGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, "Finishing initial load", (uint8_t *)&v7, 2u);
    }

  }
}

- (void)initiatePlaybackAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void **v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[MCDPCModel setPlaybackCompletion:](self, "setPlaybackCompletion:", a4);
  -[MCDPCModel setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__finishPlaybackNotification_, *MEMORY[0x24BE655B0], 0);

  v8 = (void **)_MCDCreateMediaRemoteIndexPath(v6);
  MCDGeneralLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "Asking MediaRemote to initialize playback for index path: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  -[MCDPCModel bundleID](self, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteRequestPlaybackInitialization();

  free(*v8);
  free(v8);

}

- (void)_finishPlaybackNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint8_t v8[16];

  -[MCDPCModel _errorForNotification:](self, "_errorForNotification:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Received kMRMediaRemoteApplicationInitiatedPlaybackOfContentItemNotification", v8, 2u);
  }

  -[MCDPCModel playbackCompletion](self, "playbackCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCDPCModel playbackCompletion](self, "playbackCompletion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v4);

    -[MCDPCModel setPlaybackCompletion:](self, "setPlaybackCompletion:", 0);
    -[MCDPCModel setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
  }

}

- (id)_errorForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE655E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE655D8]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("MCDError");
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BE655D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = objc_msgSend(v13, "integerValue");
    else
      v14 = 1;
    v21[0] = *MEMORY[0x24BDD0FC8];
    v21[1] = CFSTR("model");
    v22[0] = v6;
    v22[1] = self;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    -[MCDPCModel selectedIndexPath](self, "selectedIndexPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[MCDPCModel selectedIndexPath](self, "selectedIndexPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("indexPath"));

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v11, v14, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_setupBeginLoadingTimeoutTimerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDDCD00];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__MCDPCModel__setupBeginLoadingTimeoutTimerWithCompletion___block_invoke;
  v8[3] = &unk_24FD78740;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "timerWithInterval:repeats:block:", 0, v8, 2.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCModel setBeginLoadingTimeoutTimer:](self, "setBeginLoadingTimeoutTimer:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __59__MCDPCModel__setupBeginLoadingTimeoutTimerWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "_invalidateBeginLoadingTimeoutTimer");

}

- (void)_invalidateBeginLoadingTimeoutTimer
{
  void *v3;
  void *v4;

  -[MCDPCModel beginLoadingTimeoutTimer](self, "beginLoadingTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCDPCModel beginLoadingTimeoutTimer](self, "beginLoadingTimeoutTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[MCDPCModel setBeginLoadingTimeoutTimer:](self, "setBeginLoadingTimeoutTimer:", 0);
  }
}

- (void)_setupPlaybackProgressTimeoutTimerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDDCD00];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__MCDPCModel__setupPlaybackProgressTimeoutTimerWithCompletion___block_invoke;
  v8[3] = &unk_24FD78740;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "timerWithInterval:repeats:block:", 0, v8, 2.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCModel setPlaybackProgressTimeoutTimer:](self, "setPlaybackProgressTimeoutTimer:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __63__MCDPCModel__setupPlaybackProgressTimeoutTimerWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "_invalidatePlaybackProgressTimeoutTimer");

}

- (void)_invalidatePlaybackProgressTimeoutTimer
{
  void *v3;
  void *v4;

  -[MCDPCModel playbackProgressTimeoutTimer](self, "playbackProgressTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCDPCModel playbackProgressTimeoutTimer](self, "playbackProgressTimeoutTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[MCDPCModel setPlaybackProgressTimeoutTimer:](self, "setPlaybackProgressTimeoutTimer:", 0);
  }
}

- (id)itemsFromMRContentItems:(id)a3
{
  id v4;
  void *v5;
  NSObject *mediaRemoteItemQueue;
  id v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v12;
  MCDPCModel *v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  mediaRemoteItemQueue = self->_mediaRemoteItemQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__MCDPCModel_itemsFromMRContentItems___block_invoke;
  block[3] = &unk_24FD78768;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_sync(mediaRemoteItemQueue, block);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

void __38__MCDPCModel_itemsFromMRContentItems___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  double v14;
  double v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v1 = a1;
  v34 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v28;
    v5 = 0x24FD77000uLL;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v28 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        MRContentItemGetIdentifier();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(*(Class *)(v5 + 2984)), "_initWithModel:MRContentItem:", *(_QWORD *)(v1 + 40), v7);
        objc_msgSend(*(id *)(v1 + 40), "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);

        MCDGeneralLogging();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = v8;
          _os_log_impl(&dword_22FBAA000, v11, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to items dictionary", buf, 0xCu);
        }
        v26 = (void *)v8;

        objc_msgSend(v9, "artworkData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          -[NSObject size](v13, "size");
          if (v15 != 48.0 || v14 != 48.0)
          {
            -[NSObject car_scaledImageWithSize:](v13, "car_scaledImageWithSize:", 48.0, 48.0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v1;
            v19 = v3;
            v20 = v4;
            v21 = v5;
            v22 = objc_msgSend(v17, "copy");

            v13 = v22;
            v5 = v21;
            v4 = v20;
            v3 = v19;
            v1 = v18;
          }
          MCDGeneralLogging();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138543362;
              v32 = (uint64_t)v26;
              _os_log_impl(&dword_22FBAA000, v23, OS_LOG_TYPE_DEFAULT, "Updating artwork to %{public}@", buf, 0xCu);
            }

            objc_msgSend(v9, "setArtworkImage:", v13);
          }
          else
          {
            if (v24)
            {
              *(_DWORD *)buf = 138543362;
              v32 = (uint64_t)v26;
              _os_log_impl(&dword_22FBAA000, v23, OS_LOG_TYPE_DEFAULT, "Have artwork data, but artwork is nil for %{public}@", buf, 0xCu);
            }

          }
        }
        else
        {
          MCDGeneralLogging();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v32 = (uint64_t)v26;
            _os_log_impl(&dword_22FBAA000, v13, OS_LOG_TYPE_DEFAULT, "Artwork is nil for %{public}@", buf, 0xCu);
          }
        }

        objc_msgSend(*(id *)(v1 + 48), "addObject:", v9);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v3);
  }

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (MCDPCItem)rootItem
{
  return self->_rootItem;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (MCDPlayableContentPlaybackManager)playableContentPlaybackManager
{
  return self->_playableContentPlaybackManager;
}

- (void)setPlayableContentPlaybackManager:(id)a3
{
  objc_storeStrong((id *)&self->_playableContentPlaybackManager, a3);
}

- (BOOL)isCurrentPlayingApp
{
  return self->_currentPlayingApp;
}

- (void)setCurrentPlayingApp:(BOOL)a3
{
  self->_currentPlayingApp = a3;
}

- (id)playbackCompletion
{
  return self->_playbackCompletion;
}

- (void)setPlaybackCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)containerCompletion
{
  return self->_containerCompletion;
}

- (void)setContainerCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (BOOL)didFinishInitialLoad
{
  return self->_didFinishInitialLoad;
}

- (void)setDidFinishInitialLoad:(BOOL)a3
{
  self->_didFinishInitialLoad = a3;
}

- (unsigned)supportedAPIMask
{
  return self->_supportedAPIMask;
}

- (void)setSupportedAPIMask:(unsigned int)a3
{
  self->_supportedAPIMask = a3;
}

- (NSMutableDictionary)beginLoadingBlocks
{
  return self->_beginLoadingBlocks;
}

- (void)setBeginLoadingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_beginLoadingBlocks, a3);
}

- (MPWeakTimer)beginLoadingTimeoutTimer
{
  return self->_beginLoadingTimeoutTimer;
}

- (void)setBeginLoadingTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_beginLoadingTimeoutTimer, a3);
}

- (MPWeakTimer)playbackProgressTimeoutTimer
{
  return self->_playbackProgressTimeoutTimer;
}

- (void)setPlaybackProgressTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_playbackProgressTimeoutTimer, a3);
}

- (OS_dispatch_queue)mediaRemoteNotificationQueue
{
  return self->_mediaRemoteNotificationQueue;
}

- (void)setMediaRemoteNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteNotificationQueue, a3);
}

- (OS_dispatch_queue)mediaRemoteItemQueue
{
  return self->_mediaRemoteItemQueue;
}

- (void)setMediaRemoteItemQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteItemQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteItemQueue, 0);
  objc_storeStrong((id *)&self->_mediaRemoteNotificationQueue, 0);
  objc_storeStrong((id *)&self->_playbackProgressTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_beginLoadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_beginLoadingBlocks, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong(&self->_containerCompletion, 0);
  objc_storeStrong(&self->_playbackCompletion, 0);
  objc_storeStrong((id *)&self->_playableContentPlaybackManager, 0);
  objc_storeStrong((id *)&self->_rootItem, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)_finishBeginLoadingNotification:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22FBAA000, a2, a3, "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification, beginLoadingPlayableContent API not implemented and null completion block for index path: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_finishBeginLoadingNotification:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22FBAA000, a2, a3, "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification, but completion block is null for index path: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_finishBeginLoadingNotification:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_22FBAA000, log, OS_LOG_TYPE_DEBUG, "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification with error: %{public}@, but completion block is null for index path: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
