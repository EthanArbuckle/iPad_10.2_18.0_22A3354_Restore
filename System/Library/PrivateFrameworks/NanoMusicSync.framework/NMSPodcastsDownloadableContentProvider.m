@implementation NMSPodcastsDownloadableContentProvider

- (NMSPodcastsDownloadableContentProvider)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_source_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v19;
  _QWORD handler[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)NMSPodcastsDownloadableContentProvider;
  v2 = -[NMSPodcastsDownloadableContentProvider init](&v23, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NMSPodcastsDownloadableContentProvider.mergeQueue", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.NMSPodcastsDownloadableContentProvider.notificationQueue", v6);
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v7;

    objc_initWeak(&location, v2);
    v9 = dispatch_source_create(MEMORY[0x24BDAC9C8], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v10 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v9;

    v11 = *((_QWORD *)v2 + 3);
    v12 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __46__NMSPodcastsDownloadableContentProvider_init__block_invoke;
    handler[3] = &unk_24D646E68;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    v13 = *((_QWORD *)v2 + 1);
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __46__NMSPodcastsDownloadableContentProvider_init__block_invoke_2;
    block[3] = &unk_24D646E68;
    objc_copyWeak(&v19, &location);
    dispatch_async(v13, block);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__handlePersistentStoreRemoteChangeNotification_, *MEMORY[0x24BDBB510], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__handlePodcastsPinningSelectionsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.podcasts-pinning-selections"), 0);
    objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v2);

    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerObserver:", v2);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return (NMSPodcastsDownloadableContentProvider *)v2;
}

void __46__NMSPodcastsDownloadableContentProvider_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processLatestPersistenHistoryChanges");

}

void __46__NMSPodcastsDownloadableContentProvider_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "lastMergedToken");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v3;
    if (!v2)
    {
      objc_msgSend(v3, "_resetPersistentHistoryTokenAndNotifyObservers");
      WeakRetained = v3;
    }
  }

}

- (id)createItemEnumerator
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NMSPodcastsDownloadSettings *v10;
  void *v11;
  NMSPodcastsDownloadSettings *v12;
  NSObject *v13;
  NMSEpisodeFetchRequestItemEnumerator *v14;
  void *v15;
  NMSEpisodeFetchRequestItemEnumerator *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NMSAlternatingItemEnumerator *v25;
  void *v26;
  NMSAlternatingItemEnumerator *v27;
  NMSPodcastsDownloadSettings *v28;
  void *v29;
  NMSPodcastsDownloadSettings *v30;
  NSObject *v31;
  NMSEpisodeFetchRequestItemEnumerator *v32;
  void *v33;
  NMSEpisodeFetchRequestItemEnumerator *v34;
  NMSSequentialItemEnumerator *v35;
  void *v36;
  NMSSequentialItemEnumerator *v37;
  NSObject *v38;
  _QWORD v40[4];
  id v41;
  id v42;
  char v43;
  _QWORD v44[4];
  id v45;
  id v46;
  char v47;
  uint8_t buf[4];
  NMSPodcastsDownloadSettings *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReady");

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCharging") ^ 1;

    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainOrPrivateContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [NMSPodcastsDownloadSettings alloc];
    objc_msgSend(v6, "objectForKey:", CFSTR("PodcastsSavedEpisodesDownloadSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:](v10, "initWithCollectionType:dictionary:", 1, v11);

    NMLogForCategory(5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v12;
      _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) Saved Episodes %{public}@", buf, 0xCu);
    }

    if (-[NMSPodcastsDownloadSettings isEnabled](v12, "isEnabled"))
    {
      v14 = [NMSEpisodeFetchRequestItemEnumerator alloc];
      +[NMSPodcastsFetchRequests fetchRequestForSavedEpisodesDownloadSettings:downloadedOnly:](NMSPodcastsFetchRequests, "fetchRequestForSavedEpisodesDownloadSettings:downloadedOnly:", v12, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NMSEpisodeFetchRequestItemEnumerator initWithFetchRequest:ctx:](v14, "initWithFetchRequest:ctx:", v15, v8);

      objc_msgSend(v9, "addObject:", v16);
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("PodcastsStationDownloadSettings"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __62__NMSPodcastsDownloadableContentProvider_createItemEnumerator__block_invoke;
    v44[3] = &unk_24D6481B8;
    v47 = v5;
    v19 = v8;
    v45 = v19;
    v20 = v9;
    v46 = v20;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v44);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("PodcastsShowDownloadSettings"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v18;
    v40[1] = 3221225472;
    v40[2] = __62__NMSPodcastsDownloadableContentProvider_createItemEnumerator__block_invoke_19;
    v40[3] = &unk_24D6481B8;
    v43 = v5;
    v23 = v19;
    v41 = v23;
    v24 = v21;
    v42 = v24;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v40);
    if (objc_msgSend(v24, "count"))
    {
      v25 = [NMSAlternatingItemEnumerator alloc];
      v26 = (void *)objc_msgSend(v24, "copy");
      v27 = -[NMSAlternatingItemEnumerator initWithItemEnumerators:](v25, "initWithItemEnumerators:", v26);

      objc_msgSend(v20, "addObject:", v27);
    }
    v28 = [NMSPodcastsDownloadSettings alloc];
    objc_msgSend(v6, "objectForKey:", CFSTR("PodcastsUpNextDownloadSettings"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:](v28, "initWithCollectionType:dictionary:", 0, v29);

    NMLogForCategory(5);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v30;
      _os_log_impl(&dword_216E27000, v31, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) Up Next %{public}@", buf, 0xCu);
    }

    if (-[NMSPodcastsDownloadSettings isEnabled](v30, "isEnabled"))
    {
      v32 = [NMSEpisodeFetchRequestItemEnumerator alloc];
      +[NMSPodcastsFetchRequests fetchRequestForUpNextDownloadSettings:downloadedOnly:](NMSPodcastsFetchRequests, "fetchRequestForUpNextDownloadSettings:downloadedOnly:", v30, v5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[NMSEpisodeFetchRequestItemEnumerator initWithFetchRequest:ctx:](v32, "initWithFetchRequest:ctx:", v33, v23);

      objc_msgSend(v20, "addObject:", v34);
    }
    v35 = [NMSSequentialItemEnumerator alloc];
    v36 = (void *)objc_msgSend(v20, "copy");
    v37 = -[NMSSequentialItemEnumerator initWithItemEnumerators:](v35, "initWithItemEnumerators:", v36);

  }
  else
  {
    _MTLogCategoryDatabase();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v38, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider cannot open Podcasts DB. Returning nil item enumerator.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attemptToFix");
    v37 = 0;
  }

  return v37;
}

void __62__NMSPodcastsDownloadableContentProvider_createItemEnumerator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NMSPodcastsDownloadSettings *v7;
  NSObject *v8;
  NMSEpisodeFetchRequestItemEnumerator *v9;
  void *v10;
  NMSEpisodeFetchRequestItemEnumerator *v11;
  int v12;
  id v13;
  __int16 v14;
  NMSPodcastsDownloadSettings *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 2, v6);

  if (-[NMSPodcastsDownloadSettings isEnabled](v7, "isEnabled"))
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) Station %{public}@ - %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v9 = [NMSEpisodeFetchRequestItemEnumerator alloc];
    +[NMSPodcastsFetchRequests fetchRequestForStationUUID:downloadSettings:downloadedOnly:](NMSPodcastsFetchRequests, "fetchRequestForStationUUID:downloadSettings:downloadedOnly:", v5, v7, *(unsigned __int8 *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NMSEpisodeFetchRequestItemEnumerator initWithFetchRequest:ctx:](v9, "initWithFetchRequest:ctx:", v10, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }

}

void __62__NMSPodcastsDownloadableContentProvider_createItemEnumerator__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NMSPodcastsDownloadSettings *v7;
  NSObject *v8;
  NMSEpisodeFetchRequestItemEnumerator *v9;
  void *v10;
  NMSEpisodeFetchRequestItemEnumerator *v11;
  int v12;
  id v13;
  __int16 v14;
  NMSPodcastsDownloadSettings *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 3, v6);

  if (-[NMSPodcastsDownloadSettings isEnabled](v7, "isEnabled"))
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) Show %{public}@ - %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v9 = [NMSEpisodeFetchRequestItemEnumerator alloc];
    +[NMSPodcastsFetchRequests fetchRequestForFeedURL:downloadSettings:downloadedOnly:ctx:](NMSPodcastsFetchRequests, "fetchRequestForFeedURL:downloadSettings:downloadedOnly:ctx:", v5, v7, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NMSEpisodeFetchRequestItemEnumerator initWithFetchRequest:ctx:](v9, "initWithFetchRequest:ctx:", v10, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NMSPodcastsDownloadableContentProvider_setDelegate___block_invoke;
  block[3] = &unk_24D646E90;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__NMSPodcastsDownloadableContentProvider_setDelegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeWeak(WeakRetained + 6, *(id *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (NMSDownloadableContentProviderDelegate)delegate
{
  NSObject *notificationQueue;
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
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__NMSPodcastsDownloadableContentProvider_delegate__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMSDownloadableContentProviderDelegate *)v3;
}

void __50__NMSPodcastsDownloadableContentProvider_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)extensionAccessDidChange
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *mergeQueue;
  _QWORD block[4];
  id v8;
  id buf[2];

  objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReady");

  if (v4)
  {
    _MTLogCategoryDatabase();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider can access PodcastsDB again", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    mergeQueue = self->_mergeQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__NMSPodcastsDownloadableContentProvider_extensionAccessDidChange__block_invoke;
    block[3] = &unk_24D646E68;
    objc_copyWeak(&v8, buf);
    dispatch_async(mergeQueue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __66__NMSPodcastsDownloadableContentProvider_extensionAccessDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "lastMergedToken");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      objc_msgSend(v3, "_notifyDelegateContentDidChange");
    else
      objc_msgSend(v3, "_resetPersistentHistoryTokenAndNotifyObservers");
    WeakRetained = v3;
  }

}

- (void)environmentMonitorDidChangePower:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = objc_msgSend(v4, "isCharging");
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider environment monitor did change power %x", (uint8_t *)v6, 8u);
  }

  -[NMSPodcastsDownloadableContentProvider _notifyDelegateContentDidChangeImmediately](self, "_notifyDelegateContentDidChangeImmediately");
}

- (NSPersistentHistoryToken)lastMergedToken
{
  NSPersistentHistoryToken *lastMergedToken;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *p_super;
  NSPersistentHistoryToken *v9;
  id v11;
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mergeQueue);
  lastMergedToken = self->_lastMergedToken;
  if (!lastMergedToken)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("NMSPodcastsDownloadableContentObserverPersistentHistoryToken"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      if (v7)
      {
        _MTLogCategoryDatabase();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v7;
          _os_log_impl(&dword_216E27000, p_super, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider encountered error trying to fetch previous history token %@", buf, 0xCu);
        }
      }
      else
      {
        v9 = v6;
        p_super = &self->_lastMergedToken->super;
        self->_lastMergedToken = v9;
      }

    }
    else
    {
      _MTLogCategoryDatabase();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider has never processed persistent history data", buf, 2u);
      }
    }

    lastMergedToken = self->_lastMergedToken;
  }
  return lastMergedToken;
}

- (void)setLastMergedToken:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mergeQueue);
  objc_storeStrong((id *)&self->_lastMergedToken, a3);
  if (v5)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v6, CFSTR("NMSPodcastsDownloadableContentObserverPersistentHistoryToken"));

      _MTLogCategoryDatabase();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        v11 = "NMSPodcastsDownloadableContentProvider set last processed persistent history token %@";
        v12 = v10;
        v13 = OS_LOG_TYPE_INFO;
        goto LABEL_13;
      }
    }
    else
    {
      _MTLogCategoryDatabase();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        v11 = "NMSPodcastsDownloadableContentProvider encountered error archiving last persistent history token %@";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
LABEL_13:
        _os_log_impl(&dword_216E27000, v12, v13, v11, buf, 0xCu);
      }
    }

    goto LABEL_15;
  }
  _MTLogCategoryDatabase();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v14, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider set last processed persistent history token to nil. Removing default.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("NMSPodcastsDownloadableContentObserverPersistentHistoryToken"));
LABEL_15:

}

- (id)_ctx
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateQueueContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE739E8]))
  {
    if ((objc_msgSend(v3, "changeType") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v3, "updatedProperties", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BE737F8], "propertiesToObserveForDownloadableEpisodes");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "containsObject:", v13);

            if ((v14 & 1) != 0)
            {
              LOBYTE(v8) = 1;
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_changeContainsRelevantShowChanges:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE739F8]))
  {
    if ((objc_msgSend(v3, "changeType") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v3, "updatedProperties", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BE73820], "propertiesToObserveForDownloadableEpisodes");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "containsObject:", v13);

            if ((v14 & 1) != 0)
            {
              LOBYTE(v8) = 1;
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_changeContainsRelevantStationChanges:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE739F0]))
  {
    if ((objc_msgSend(v3, "changeType") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v3, "updatedProperties", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BE73818], "propertiesToObserveForDownloadableEpisodes");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "containsObject:", v13);

            if ((v14 & 1) != 0)
            {
              LOBYTE(v8) = 1;
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_relevantChannelProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = *MEMORY[0x24BE738A8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_changeContainsRelevantChannelChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "changedObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE739E0]))
  {
    if ((objc_msgSend(v4, "changeType") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v4, "updatedProperties", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            -[NMSPodcastsDownloadableContentProvider _relevantChannelProperties](self, "_relevantChannelProperties");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "containsObject:", v15);

            if ((v16 & 1) != 0)
            {
              v17 = 1;
              goto LABEL_14;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            continue;
          break;
        }
      }
      v17 = 0;
LABEL_14:

    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_shouldMergeHistoryTransaction:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "changes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[NMSPodcastsDownloadableContentProvider _changeContainsRelevantEpisodeChanges:](self, "_changeContainsRelevantEpisodeChanges:", v9)|| -[NMSPodcastsDownloadableContentProvider _changeContainsRelevantShowChanges:](self, "_changeContainsRelevantShowChanges:", v9)|| -[NMSPodcastsDownloadableContentProvider _changeContainsRelevantStationChanges:](self, "_changeContainsRelevantStationChanges:", v9)|| -[NMSPodcastsDownloadableContentProvider _changeContainsRelevantChannelChanges:](self, "_changeContainsRelevantChannelChanges:", v9))
        {
          v10 = 1;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)_notifyDelegateContentDidChange
{
  NSObject *notificationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChange__block_invoke;
  v4[3] = &unk_24D646E68;
  objc_copyWeak(&v5, &location);
  dispatch_async(notificationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __73__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChange__block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 32))
    {
      _MTLogCategoryDatabase();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider delegate notification pending.", buf, 2u);
      }

    }
    else
    {
      *((_BYTE *)WeakRetained + 32) = 1;
      v5 = dispatch_time(0, 8000000000);
      v6 = v3[2];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChange__block_invoke_31;
      block[3] = &unk_24D646E68;
      objc_copyWeak(&v8, v1);
      dispatch_after(v5, v6, block);
      objc_destroyWeak(&v8);
    }
  }

}

void __73__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChange__block_invoke_31(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _MTLogCategoryDatabase();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider scheduling delegate notification for 8s from now.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyDelegateContentDidChangeImmediately");

}

- (void)_notifyDelegateContentDidChangeImmediately
{
  NSObject *notificationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __84__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChangeImmediately__block_invoke;
  v4[3] = &unk_24D646E68;
  objc_copyWeak(&v5, &location);
  dispatch_async(notificationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __84__NMSPodcastsDownloadableContentProvider__notifyDelegateContentDidChangeImmediately__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 32) = 0;
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained((id *)WeakRetained + 6);
    objc_msgSend(v2, "downloadableContentProviderDidChangeContent:", v3);

    WeakRetained = v3;
  }

}

- (void)_handlePersistentStoreRemoteChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _MTLogCategoryDatabase();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBB4B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_INFO, "NMSPodcastsDownloadableContentProvider received %@ with token %@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isReady");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSPodcastsDownloadableContentProvider _ctx](self, "_ctx");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistentStoreCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v13)
      dispatch_source_merge_data((dispatch_source_t)self->_persistentHistorySource, 1uLL);
  }
  else
  {
    _MTLogCategoryDatabase();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_216E27000, v14, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider cannot open Podcasts DB. Will not respond to notification.", (uint8_t *)&v16, 2u);
    }

    objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attemptToFix");

  }
}

- (void)_processLatestPersistenHistoryChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t v16[16];
  _QWORD v17[8];
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  __int128 buf;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[NMSPodcastsDownloadableContentProvider _ctx](self, "_ctx");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__10;
  v40 = __Block_byref_object_dispose__10;
  -[NMSPodcastsDownloadableContentProvider lastMergedToken](self, "lastMergedToken");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", v37[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultType:", 5);
  objc_msgSend(v4, "setFetchBatchSize:", 200);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__10;
  v34 = __Block_byref_object_dispose__10;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__10;
  v28[4] = __Block_byref_object_dispose__10;
  v5 = MEMORY[0x24BDAC760];
  v29 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke;
  v23[3] = &unk_24D646EE0;
  v26 = v28;
  v6 = v3;
  v24 = v6;
  v7 = v4;
  v25 = v7;
  v27 = &v30;
  objc_msgSend(v6, "performBlockAndWait:", v23);
  if (v31[5])
  {
    _MTLogCategoryDatabase();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v31[5];
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider encountered error trying to fetch store result %@", (uint8_t *)&buf, 0xCu);
    }

    _MTLogCategoryDatabase();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider clearing out persistent history token and performing a full persistent history run", (uint8_t *)&buf, 2u);
    }

    -[NMSPodcastsDownloadableContentProvider setLastMergedToken:](self, "setLastMergedToken:", 0);
    v11 = (void *)v31[5];
    v31[5] = 0;

    objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setResultType:", 5);
    objc_msgSend(v12, "setFetchBatchSize:", 200);
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke_33;
    v18[3] = &unk_24D646EE0;
    v21 = v28;
    v19 = v6;
    v7 = v12;
    v20 = v7;
    v22 = &v30;
    objc_msgSend(v19, "performBlockAndWait:", v18);
    if (v31[5])
    {
      _MTLogCategoryDatabase();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v31[5];
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider encountered error trying to fetch store result after setting to nil %@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_16;
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x2020000000;
  v44 = 0;
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke_34;
  v17[3] = &unk_24D646F08;
  v17[4] = self;
  v17[5] = v28;
  v17[6] = &buf;
  v17[7] = &v36;
  objc_msgSend(v6, "performBlockAndWait:", v17);
  -[NMSPodcastsDownloadableContentProvider setLastMergedToken:](self, "setLastMergedToken:", v37[5]);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    _MTLogCategoryDatabase();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_216E27000, v15, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider notifying delegate", v16, 2u);
    }

    -[NMSPodcastsDownloadableContentProvider _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
  }
  _Block_object_dispose(&buf, 8);
LABEL_16:

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

void __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke_33(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __79__NMSPodcastsDownloadableContentProvider__processLatestPersistenHistoryChanges__block_invoke_34(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x219A039AC]();
        if (objc_msgSend(*(id *)(a1 + 32), "_shouldMergeHistoryTransaction:", v7))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          _MTLogCategoryDatabase();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_INFO, "NMSPodcastsDownloadableContentProvider merging changes", v16, 2u);
          }

          objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "coreDataContainer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectIDNotification");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mergeFromContextDidSaveNotification:", v12);

        }
        objc_msgSend(v7, "token");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider pinning selections did change", v8, 2u);
    }

    -[NMSPodcastsDownloadableContentProvider _notifyDelegateContentDidChangeImmediately](self, "_notifyDelegateContentDidChangeImmediately");
  }
}

- (void)_resetPersistentHistoryTokenAndNotifyObservers
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint8_t *v16;
  uint8_t v17[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mergeQueue);
  objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReady");

  if ((v4 & 1) != 0)
  {
    *(_QWORD *)v17 = 0;
    v18 = v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__10;
    v21 = __Block_byref_object_dispose__10;
    v22 = 0;
    -[NMSPodcastsDownloadableContentProvider _ctx](self, "_ctx");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __88__NMSPodcastsDownloadableContentProvider__resetPersistentHistoryTokenAndNotifyObservers__block_invoke;
    v14 = &unk_24D646EB8;
    v16 = v17;
    v6 = v5;
    v15 = v6;
    objc_msgSend(v6, "performBlockAndWait:", &v11);
    -[NMSPodcastsDownloadableContentProvider setLastMergedToken:](self, "setLastMergedToken:", *((_QWORD *)v18 + 5), v11, v12, v13, v14);
    _MTLogCategoryDatabase();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *((_QWORD *)v18 + 5);
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentProvider resetting persistent history token and notifying observers. Latest token %@", buf, 0xCu);
    }

    -[NMSPodcastsDownloadableContentProvider _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
    _Block_object_dispose(v17, 8);

  }
  else
  {
    _MTLogCategoryDatabase();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentProvider cannot open Podcasts DB. Will not reset persistent history.", v17, 2u);
    }

    objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attemptToFix");

  }
}

void __88__NMSPodcastsDownloadableContentProvider__resetPersistentHistoryTokenAndNotifyObservers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersistentHistoryTokenFromStores:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastMergedToken, 0);
  objc_storeStrong((id *)&self->_persistentHistorySource, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_mergeQueue, 0);
}

@end
